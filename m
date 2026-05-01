Return-Path: <linux-arm-msm+bounces-105539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCJzGure9Gn8FQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:12:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 035D04AE66B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 867D63016528
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 17:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7533E63A4;
	Fri,  1 May 2026 17:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a8NI18EE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChddZXpg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC623FE66D
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 17:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655478; cv=none; b=TQfqZvNNRLbTteCpt92iDQaSnmo8NzqnMKjYlMa4HUyRsUbbik2jHEFqXHifTEWf9YrpZxT8uGvcL/NmnnYdJ0oJUieigkSnZbWGBVQD/QuhMcKdYbvAh8Zi8vPJ/3o4SyazhBVCTr3WdiYFPCTPWYzyju7gbC+pofRK8lts1n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655478; c=relaxed/simple;
	bh=THFb5Nk4uEbZc9mT/NKNytrNI1hHkez8UfIyNlJTGmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uf5kTkkkd1v6akOf61GPAvcptObWi8cypwma/b3kDw4NoeHtMoYid4R6J1p8r8n8s1FHGJntsSMvBEDF9Taylh6QAv1H7tpC3I8cJhv8fgafJmuWjGVXBJ8lElTDWpTexrCpBXdxQL2TJXehqLl/uRXH8OXEkaqLzT3oTNXJxf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a8NI18EE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChddZXpg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLco14047859
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 17:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2zubOAZ/8a7yYkuEZ+V2cJH7d90bVGw6nym4GQ0WP6c=; b=a8NI18EEpnJ894ee
	shfHP/ToapzWfmjrVI5QEfPZ1EqgBDx1bszRS6Q14I5r1UIVslVm2U+yfFCUQ9C2
	mMFJ5a+2cvb/9P9GNsXgD7zAEfqPCYwEQf21TRQOcbutXYgp/CEZt1aF3gA1gE/P
	W1yLTEhoQRk7FcZrkSTzl7fKudiHuWoz9Ylw1qnkJ19tFVhlzAVJ4V60Upc+qJJT
	5D6fJjeM+zFj2cysc1Hq1/twbCIeLftKnf17hzTwGQa6Iwc4Ubo8VOvKP2OkKzwz
	ztY4jGIndfl5zKXuf7Kw2A85AvfZBhcVP2wNg0q6mdK/0M1PPMUyQ4LJ/Po93ia4
	ifaXUw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv7wuvy31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 17:11:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso1545821b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655475; x=1778260275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zubOAZ/8a7yYkuEZ+V2cJH7d90bVGw6nym4GQ0WP6c=;
        b=ChddZXpg/qddDIE/a22H04tULnP2iRDDMzsQM7xAJHcF3xHjxP4JErz9SsYXwngxXv
         I1rMmCEQGbZHf3T7Hj96XffPlAXunVDcDRVa4inoogrA4cGNkNXWlJQ/uLWy8HEqLh/1
         dY1ieLamgNQnnWYMU7lc/Rqg5KF5bM1NzQxKDJIQLO7ISTry5+bLqCFKdmma9BUv3ijq
         vlYwxD1LmcIyw5J1H4unHDssgGkAz5Z3aIj3HWuwA7dRfQE5G/Blh2RsLwIzSZiWZy6h
         LIzGv6szlnzZWnLQraZN9Nuu7N1OjKOzEAEfli1RPPU1GIo7nfCEyDSaZFrISbi9gXVZ
         KB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655475; x=1778260275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2zubOAZ/8a7yYkuEZ+V2cJH7d90bVGw6nym4GQ0WP6c=;
        b=bqvkFyhtVKWPDSUMvTWhts35eF3HxGu3xvYcVKXIFEHM0kPUuftSKInnKIoltBh9lo
         NuDI70WJzlwcoXNz/1UD9UANZyl2anaj/aEFPgssUGLncU9OPjRJWTFqKwhFQNTYZ01D
         rAUNUZsEBf8cXfGoBnES1mgJza4feJWPoPeJ9RfLaBE9/48F2vA+3YasH3NkofQ2CK5Y
         i3pNLEshi1Eb43ssKNbu3E3OdMSxQ4CszGoFMrE9GhFdPI7KoZHFJcTXMoyj6AlTarqT
         33nIJE2hUZZs6br3eh4KFLPlm6NwsfykckCzdnoFeCeBjQGTw0TXOrNW74KGdg83EY4U
         OASw==
X-Gm-Message-State: AOJu0Yy7b4+ZOZRfNinsOgPpmOJHfILkzD+3v0S7GVzXBvSz7Dkqdfxu
	yBcAtZPtOKsvLUikR1cHb7MV89iwecY7tPtITH/gH/9XDKOClrWOmk+xqOw3D6T1S1Wjqcu02B6
	NGE0KdUd0cALMeelyZNqfaiyLjmoApuOKYIdbhd0S7ExMXJJWiEQMVIppvMr5sTH4P7f6
X-Gm-Gg: AeBDievntTNghAzsmOO2rDqZRntVU/GcosNrNSZBdF93Rz6D/bt6h3Ga1FKf2uzc70V
	bMbUn7zqR4EzD4eOrO50gTTVRCghppnVaPZgzVjqum3hGtv2Fo43XWqlQg0nucBwG1iuX6vZYX1
	toPiB5nnqoZN0iiJe/yeGDN76amLHM+MLqBo+UZoHLMKnvGs0zhm6B5TjfIA9ttqqKvsTZqehm+
	JaZ5kLqvkJLHTe3y2vik1FQPRJ807c4HFd3nYLyuiIrbvvP6MJU5wa91La7Vc9T0peYUp65DQi2
	H+7XC2YMpO7LdZN2pICh4z1llQ6i0RAKzq/nYMXTEdrtF0oJc0lArTefkKOWKU9NHrTQHFvgEYI
	TXXTSWlzfVl1OGwKPAMvUdxhB/OSddjEIwlOeVyRhCcCJR0py9p5rM1TR
X-Received: by 2002:a05:6a00:ab89:b0:82c:9cd2:fee5 with SMTP id d2e1a72fcca58-8352d02559amr100712b3a.7.1777655475258;
        Fri, 01 May 2026 10:11:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab89:b0:82c:9cd2:fee5 with SMTP id d2e1a72fcca58-8352d02559amr100674b3a.7.1777655474748;
        Fri, 01 May 2026 10:11:14 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351587db67sm3099323b3a.13.2026.05.01.10.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:11:14 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 01 May 2026 22:40:39 +0530
Subject: [PATCH v2 3/4] arm64: dts: qcom: glymur: Add GPU smmu node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-glymur-gpu-dt-v2-3-2f128b5596bb@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777655447; l=2636;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=QkffR+QOr2z/kbtj5GbV5Aa+e4MwVgVJAmCOoCw+1uU=;
 b=0ae7cQ5RUVZpl8ozfmKx1kS9wwVDMWR3kxd5O+U/8V2HPOd8vSqHCtFqv6UYcFaWA+7lc4Zw0
 jUpmOWwcfLJCFm5ZE+zJeIndSp652eK4q5Qqcno/JxAHbp/E71ncT5A
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OSBTYWx0ZWRfX6PLPIY4cYUZZ
 8Xfd/uruGM8NY0onSRlG1S5NFymZCFXNGTeOrPRN9DQFDOurhIQzf2WOL7Arx3Cr2Wfc13Ci+z+
 RKbuqpvfvW8RH22vlhpmvh/VmTp1NMrt5Y0Rp0zUewQnUlOz5THxSMvRvF1EoyCPDVTIk6xbcwW
 U70df/AiTqQXk5MoeYMP8p4M/o9wt72R7vjIohY9hj/p5dyYJyGmfBoDi1YPq3rVSaDMqZokPwN
 6FI0m8tT9IbzNrVWP9/cakatvs9D3DRd15kUjRYlGyKx4hqZqx1A3HvOZ7KQIFpyKjt3LGr6MqJ
 VcO3/Jy1aosmZ9BAZpXqesZL6/bSvfTW3sN5CaWPq1mzuzINTiy+dhQsc+6rbn1PH6D4IqZ9jMR
 NFlFTXpkLDOONQ+DSMaFxMOOe+YoIwEuRwscgFOGMiW64O/TZnHoo2jo2/4zcftlg91vU6Jm4Je
 oyypnHlJQMofVjph9iw==
X-Proofpoint-ORIG-GUID: 4wn8ECl4Y4JU1iWn0V6eRVcVF4SHk9AD
X-Proofpoint-GUID: 4wn8ECl4Y4JU1iWn0V6eRVcVF4SHk9AD
X-Authority-Analysis: v=2.4 cv=GMk41ONK c=1 sm=1 tr=0 ts=69f4deb4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605010169
X-Rspamd-Queue-Id: 035D04AE66B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105539-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,3e04000:email];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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

From: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>

Add the nodes to describe the GPU SMMU node.

Signed-off-by: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index ed9aac42fcbf3684773ae449ecbea4ca679691a5..93afc81698cb64232ac6b61754fc6f4c923e30c8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3729,6 +3729,46 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,glymur-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			interconnects = <&hsc_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			dma-coherent;
+		};
+
 		ipcc: mailbox@3e04000 {
 			compatible = "qcom,glymur-ipcc", "qcom,ipcc";
 			reg = <0x0 0x03e04000 0x0 0x1000>;

-- 
2.51.0


