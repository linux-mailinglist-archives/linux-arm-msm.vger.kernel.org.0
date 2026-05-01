Return-Path: <linux-arm-msm+bounces-105537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNCDB5jf9Gn8FQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:15:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A8F4AE725
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DFDC305CBBF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 17:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E6E3FE341;
	Fri,  1 May 2026 17:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETLFdJ6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWboyWYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA84F3E63A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 17:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655465; cv=none; b=N/Q8v03KQyUeoo+FBIFTdxjd+NwNzLwjLS9VOYb573k+ngntPAwTgvQT+kh0Wx0sk9f5cgpQpzMr3K8cPf6OKgtv/YvIACE2uExDm53siA+f2g0he5/Wt0m0+32xoJbP6i7M0Nzo2zEEox33vKW6Ayp/26qtCEHbuhYtiMM31ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655465; c=relaxed/simple;
	bh=RMmUS7P/YYJG0642552czUXuROi5QP98DTBmTl6xcyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCwC+yZD1cXxZHbOsQKP/0Qwed3u+6mKy5adZYVOLYznW6w4xU9ce1bq+3mYbQ+B8yfZrM4IXcvvkd9hBwabZLnCX8n2YKJ8o2XVd1mIOgO5ZcSGDdMTMjKE7wi1z4uvk8h568luhUq7aQ2LjG7EjnhtUHYzPnd+ta0O7FJp9eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETLFdJ6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWboyWYD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLUOQ497906
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 17:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RmchRiC83pBOcYN2TSRxwkiX9+k/o1bOWXi13viKPWQ=; b=ETLFdJ6fP1Hefpbl
	Jdq7AqRBBX/W763Nu5RWMHzpoWdOWnwhh4XRbyUlPxa9HuwzdEHm7uGDI1YA2JqV
	FVM7t73Z7rbSXP2LwP5invX82BRi7M7s0/w3zMicNHkiMFN9bY6SG0sH0uKF9He9
	c/inB5EsRjEgN6E91CcA6aDnWQIep3s5uivovA2bH3rxu1NAsuWZTDQEwjIcW6jH
	gpfN3cYSEkeTvTJeH4Xe7sJ99CAoKw4W5Vjt62JmXTpaEmUFzjdJGoYF3nOx4xfP
	XPwkGIt1Rw1JEzY74FCt+Qencw/iqsQbGJQsE/ltiUD/7C++38EFjBWCpFxmMsSH
	BwI+4A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvchkbcp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 17:11:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f8bbb4045so1278079b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 10:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655462; x=1778260262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmchRiC83pBOcYN2TSRxwkiX9+k/o1bOWXi13viKPWQ=;
        b=EWboyWYDgqdFSYQF17LMNZANicnJb6TAvfEcWXMMwnU+x7hJJgB8AdzBKKssz2mt04
         gk2eDDfkVUXmsskxfUHXscZTqpweFlamLI+e/hVuzDLtikWbWvvvXAVfBbZxUmPDQN2C
         kBakfHfUFdVJUkw3AkitA0k1xa1aNPECjb4QBSRj2e8mQg1kVzb0XWT1BntVy+dPb5zx
         9x68pxlGza+9A97/3wru06qERjArMfyhMElgBDt38jbiEDP/ibIthyr0NOq/pScnT8RQ
         JQFqkaLlAr8cUPfUx2CQexTTmdbVTHFPVoaC+ATiGxfJwBU1xnaY0x4jQwseRdyFZ3ja
         zCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655462; x=1778260262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RmchRiC83pBOcYN2TSRxwkiX9+k/o1bOWXi13viKPWQ=;
        b=pgziajJrr3YmTqe62Go3S6I8BH32CW9SjJLELIVLTjDPTqJk1kekhs3j05C3PWY+Me
         RZVSz00bMrzc13DzsvH3SHRH9vm06RauVdSs1zDGUovxBTtDeNYKntClnW4CYLPBVv7b
         MHWWlhT5al+RAOC3TkwzXkQdJIcwH9hq7n8PiCj48MC7vGFh3g1UoD20gmCr9NdPTmnj
         kcj1fizVjQW5MgfG2NUmJ94wO3A1yl/dttHTrpvSMK3vnUPZBgdjHr+LaXUp1vtXtfTc
         gZbHXjtA+cMq+SoTdTjTKyeRJj6RNqJnU/ONuABSSO/Hp0/nYu9JSuMf8Zwj38h5PPPg
         /FRg==
X-Gm-Message-State: AOJu0YyeAVg3qavQJuYnnzahjndNiPiZXhpnCTXUHft6PSUNIzAyNYJT
	FplYpFRWVq8ZXt0aogiIOAQJTaDVCD8xNi6rBdcBxUTiR3NJYNFb8+s/Q4C69j8XPCd68NOpULI
	4MUz/XkgLxTqeBtdA/zP5Lhab7z71kuxaFWgFvZvvy03kdosN7Bc4VVqsJsCTHWNw5Qfx
X-Gm-Gg: AeBDiesd2UE3XVhRSduE0H9oYEt0NmtZwa8ISV3J85Pf2E4pnoVkLSEGKJEWmsV1Mg+
	m0NNqJ/Wh36ZpbATnFJll+Fn4sTg4XlxzQ6t16O48yoHuEWxkZ7WzOU234/mbturMQb0SINRq2B
	hFCdQnHc1/8ZLo6t3TNHgbI2xRZcA3iBtHdcNsZR2W+pWnlbE/rnoKi8fJOUAAY12baW1p22q5o
	1KbQAcNwSrcg34omN8Jwx9/42oFAYK7MiTPIFU/KxLTIllSFOtSX3WRwdzoLhHQu9RXrNkAiY5x
	lJ7lJyDsKgyBNzeouRCMMo+f1+ksuC2cNbghV+Mi5Ajb/0GtuyCigStGJRWbNCuGzjD3hT05OlZ
	DMViOnfUL53VxjcPGqO8sz3gh1qD5iINpKoLi2W8z2hst8mHqqo7bWkUY
X-Received: by 2002:a05:6a00:bd0e:b0:82c:733a:697a with SMTP id d2e1a72fcca58-8352d1a699cmr95823b3a.17.1777655461797;
        Fri, 01 May 2026 10:11:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd0e:b0:82c:733a:697a with SMTP id d2e1a72fcca58-8352d1a699cmr95754b3a.17.1777655461232;
        Fri, 01 May 2026 10:11:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351587db67sm3099323b3a.13.2026.05.01.10.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:11:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 01 May 2026 22:40:37 +0530
Subject: [PATCH v2 1/4] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-glymur-gpu-dt-v2-1-2f128b5596bb@oss.qualcomm.com>
References: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
In-Reply-To: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
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
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777655447; l=1187;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=RMmUS7P/YYJG0642552czUXuROi5QP98DTBmTl6xcyg=;
 b=e9oW0jAXsu6wgIxSd+1FdZ3vabLA2IjxuqyO67ysdxQlJ6Ged4eWhCTqoiWteZWe0Sfb9EqXk
 ccJtt4/KtffAFXlb96jPtT6hCjWi2jfud8USwjIqwKd5SWwWBC/wynu
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OSBTYWx0ZWRfX85mK2ujEYIy2
 IYZGVo7xOXcHuMCeinTuG330ljOqlfut2KkrBkts604ZM06dpEcQhj/oh5iWVQ92qcbXar1H91x
 yFKSbVkKHUy+ZKSUSw4jxGGPA9lgF3BYrcWROzz/UX1fmJw0K//SrruIHB6nAEkg4hddusrtc7e
 We4mCYwdpabvbmyHNF7RqfoAsgPdEt236c3vMZlQAbupXoVjaNMoJ4iwp3MKRkn6HL7/s16p/PC
 WALA8iC2MgAd2TMDf4PSLNsZB7BVw85Ob8lAnND5FXOnbGQKGQsmKJclZWyCRWqi8rHkuSMvqAi
 tyk3POCaBiOrTUeO5PiYh1X5+yQSkRXUmYY83vGvIP1TXc9N2k9EQ8uoZliae3rrZ8avcAsRuto
 6Gt1+C8T6MlrESbs84bbpof7sbjHN4Rb3ftsQ9Ghb55pF6STMruQlirSWYwh/36/8wv/Ld4RRdG
 Wmu75z71PxPm+r9/3sQ==
X-Authority-Analysis: v=2.4 cv=Zdkt8MVA c=1 sm=1 tr=0 ts=69f4dea6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aapufVXKjK5bSyzaIfAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: WUeeM627pvxNl2rU_UxC50-jJ7HRomul
X-Proofpoint-GUID: WUeeM627pvxNl2rU_UxC50-jJ7HRomul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010169
X-Rspamd-Queue-Id: D0A8F4AE725
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105537-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
It features a new slice architecture with 4 slices, significantly higher
bandwidth throughput compared to mobile counterparts, raytracing support,
and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
other improvements. Update the dt bindings documentation to describe this
GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 04b2328903ca19d35096f79f3aa958371d46182c..bdc8e6fa53596269854540b30d7540a21e7dcce3 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -434,6 +434,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node
       properties:

-- 
2.51.0


