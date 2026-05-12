Return-Path: <linux-arm-msm+bounces-107165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG3IKYZ+A2rS6QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 21:24:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C777528A0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 21:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D53F30DA160
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD3F2DA75B;
	Tue, 12 May 2026 19:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZf97tOG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUpeouvR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0392A368D42
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613738; cv=none; b=j3huRNkrOA4QlXOMihK72/jCLHosk7NqV4JdtTZr7TjT97B7YJPIxj0p3smb83eFnDt7EHr2USUYHyRoh4hnF4yaBBOeXeq0GrAXcHdp0F+DxX/35d0hpzYh7PKa7c0K/q/qO9lMDMDMItOw5AYbbzC7d4Y+E6Bi9gAxqaaiSJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613738; c=relaxed/simple;
	bh=+Y9gYZSkWF93iB7//ohDWKNnMjwm/WhLykXaB9JYn4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OyKEPV5Jz9GVqA/QJhgcZF968RSH5J2sJRVTbAwkcZ4Xp1gAC7Y/mUsxrEQs2xkNKQfJV11vL5/4v2/VD9wxqeH0iQzEpQi5IelV81rboyctgf27eLRTrbr6XPN6xHTgQLyBmqIHi+/RJ2Qpcpb+4ztaIDz2aJ2AzX4rNDX3RgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZf97tOG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUpeouvR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CHY5Rx591937
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18vX5BO6Ky0YjuphCfCL/g3VnD5eR3Y2KIwiC9kySjg=; b=bZf97tOGRyEE0oAa
	X1dFXhFPupPx5Xm+inIKhxZ2AiqxWkHeS3+pjkttLQS15PaqkD5NmqcV2K2tR07N
	4xCiGKoA6xW1w86ZsMG525PPYHIItjicOThVekEdKdqPy0zEaiQ3S89smuSr1uOG
	rNVXKZ7ZK++HTwhp12GsF0/9i9LJNI6eJ2rxCzr9JXo8WnsWOqfufrLFkdnmq0Gb
	jngW+Mz2QY5+/MQ5PVFfiqcHcUx53CiEUMIGX1GJ0kgnwvyoiV0QN1UNGClXk4tu
	l1PU8Qv3drmHmnwdRAPW5j4OpkAa0qbhMiXtbPmEsYngFrAGULKrdZ/C1XhQvifd
	/HTjCA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319t2tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:22:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba224c3ffdso85948725ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778613733; x=1779218533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18vX5BO6Ky0YjuphCfCL/g3VnD5eR3Y2KIwiC9kySjg=;
        b=kUpeouvRVslcsQU33cLz+wqvCYRUqsyrOo/Xprp7NS/nP+/8QFzvL7tYZ9ogVnT5ch
         8D+2oNM8ObVADXnALKx5sqjCjVlApv2KzRtQKhArvxZOUO5vBN9IUXQF8r/33NMptDsm
         XiA7brTsJlNOvY7QE6q/BetywSFW710DkqO1F6zfnocgUXTqXY0eurw+Hq3RX2agMNNk
         7SwOkPQ0O1wKJAE535lLlx5PJ1zwCyB/SNg8ZlTzPvAmu0kugOVEiPAcGfvmU3XIw+Ei
         x3DyqfdMARO8xvD4V3YAOXXB5ZrN3N//t/mKkUZM6hnMLwUGllmmfO9uHys6ov8UQwzf
         KKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778613733; x=1779218533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=18vX5BO6Ky0YjuphCfCL/g3VnD5eR3Y2KIwiC9kySjg=;
        b=pGNbJ0DezjYfc+XGY9LNAiBPSlnKLOfCQ/Z9o+Ppeao0lmG3eAUBKyL3EF5HVwgvff
         HrjvXntY7gVyOMZCgLKsc0czCMjKG0VFPB2jDdW+PRZG2lQQI5anHF4gFwtoSeK59nWO
         0Z9dU/bjgG1SvDd91OvTvyxP0DtnmmPfr7l0qE7OuymAzKc3okmUwDqOUNLV1bdjy4Ta
         R+BCL5innmunbnW3GLQsaezZHUJ9vF70lVg6hiFUUiT8ey/0FkPqtjgmmoGE55AGejs2
         0x03+GeUVMLSuVFYuk5a1cGBDGL0z58cLPGMI2fhtTp5YT+FQLljCVeoFfK9CuhEgqRK
         k4Ag==
X-Gm-Message-State: AOJu0YyQI85SW4TNi36nSmSODCJ8/gdlWoK9uVa5ijkb0I5RNVbhXp5V
	YQsAwVGoLEA2J6oR28jkrGLKDtY40ehLiSb0C1++SuUidzpeUzzu++KrMIgFLnDOcgoOVSe5Ec0
	B7vSKAtesXwapHgtPTrrrPV6eUxAqUPZCWZBcDsKut3u9XdrQI2L78D/duNM9JU5dCs3C
X-Gm-Gg: Acq92OHHVPyXqRwvAkPF6tgEKZrkHqDwCrg4M+5Wmc/oevipA3AunWJToO+MYLAr6Cb
	l51tRVRl/tpj13iyrLddxh1BDTMyrUR1TTgNu/ewM4/TQbLtbAVjUxC6powev4iw+hj7HI4Leh+
	nROuq7rw6pxQarm8SUiJrVIHBriate0I7+mD3XgeLefCRt+JbwtdPihgmIa/DO+nRi98pVkvHPb
	d/ypbFjCc+dZYu6farKnKW/hiwEqBblWY8ZO6V5HVApZ6V3DNfCOkoPfQ2SAa7cuvi/xXxGwRDD
	ONGnhihW7+GgbDnJf0rEfacd96R6Nvk+4NNiLl3G8IYKWLvSxi7/gJqO2e08d+4vaw8pJ1ZJdkf
	mPLNk6wHJWW0nxWeJIxsQ2b3mnGqLj7yrJXGKPLdEg3e+7Q==
X-Received: by 2002:a17:903:8c6:b0:2bd:907:2cf0 with SMTP id d9443c01a7336-2bd276f20f8mr3596525ad.32.1778613733145;
        Tue, 12 May 2026 12:22:13 -0700 (PDT)
X-Received: by 2002:a17:903:8c6:b0:2bd:907:2cf0 with SMTP id d9443c01a7336-2bd276f20f8mr3596105ad.32.1778613732663;
        Tue, 12 May 2026 12:22:12 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm141250585ad.72.2026.05.12.12.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:22:12 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 00:51:20 +0530
Subject: [PATCH v4 3/6] dt-bindings: arm-smmu: Update the description for
 Glymur GPU SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-glymur-gpu-dt-v4-3-f83832c3bc9a@oss.qualcomm.com>
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
In-Reply-To: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778613699; l=1014;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+Y9gYZSkWF93iB7//ohDWKNnMjwm/WhLykXaB9JYn4Q=;
 b=sJd52zbNvhJgb1ND3wewPjtymBQO1zHcJeff4xbFhYmqzmdH1ZAPEn/CEg3GbkRyuYyQW/n63
 GG493bLcmq7BWjLKyNq7Z7xbAwWo7HUq3kgm0UbPs89yZspZIMONxfz
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIwMCBTYWx0ZWRfX1tbIweXso6v0
 qSs0TxysRyx3YvGg+kzqKgUc225AGbzpMeFfpSlYTg85VujvF32Lk3ve+J8zWDTVvE7j+D2GTww
 5naNy2i9Bxv1fofzIaPtodMYpGzSXHILCMRksDPfEnhD9M1nvy/6PUxhCVm6Pnz5w1WjUxiurr7
 QPYahfN/7HBqlqDaEuWkn7jxFiWZCTUxI2hJgUqjdxNIVUF3HoiYNLhdoQsz2XvbvDkCvNrXvRf
 Med4ea58lrUVR0jUoG1SlrTNjRmMiqWlJUdNs29VXRuTbC3QFtGadYMv6mndC2gbG/vuOY250w0
 ZqGTdk1/8nlyit0O8hX+oLk4PdICOjEvJUWjKcytVtn7Un6lCwvkiKwxUqCiYub/OHyWbZ+h2Id
 aH0Rc0/NhbJC63PSgJl7bEInL0BqjZeVsljAIudO6QyF613Xa/Q9gy8IZ9DcrllufhMlsVluOj2
 XM42Y4IXvs34NN7pfzA==
X-Proofpoint-GUID: smaKpcSp6x9Xj0S4B3YEkaOfgK-ln4uI
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a037de6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RQVZ3Ks9ONUmwc3llXAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: smaKpcSp6x9Xj0S4B3YEkaOfgK-ln4uI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120200
X-Rspamd-Queue-Id: 0C777528A0C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107165-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the interconnects property to the common SMMU properties and extend
the sm8750 clock description section to also cover Glymur since it uses
the same single "hlos" vote clock.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..b811ece722c9 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -566,7 +566,9 @@ allOf:
       properties:
         compatible:
           items:
-            - const: qcom,sm8750-smmu-500
+            - enum:
+                - qcom,glymur-smmu-500
+                - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
             - const: arm,mmu-500

-- 
2.51.0


