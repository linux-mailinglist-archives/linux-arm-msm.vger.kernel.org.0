Return-Path: <linux-arm-msm+bounces-109239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFgJEL4tEGqSUgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:19:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0F05B1EBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AB4E30736D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9693C9438;
	Fri, 22 May 2026 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I62NlWL+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9kdlQ8R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690233C8C55
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444787; cv=none; b=UmAPIeql2wIA9D4i9O15L5/6/31xaE7SqxuleG3Q8nLPD33zR5GgHpGJFsWNhq5AzMwBjokc+WlixAiFXf1e6vvt7FjZkpvALeRh+uMLNNTtzzhDKTnCe33tMIEGQpj0CRkmrPZP+8ns+YBnG7WUTUT1wKgWRB6tdg9voMPIHRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444787; c=relaxed/simple;
	bh=9LRaMcv2V4zbaC8556pmvtif80qwwMxTZ4+jktXJcsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MIls0KMnCTxxcI0rtXjjtEvHBGaWWt4f9f+0AGTps0KEu4Q1vbjT+Tphi0sHfduAFbZwxMiSnhl4zD3sBacQSmrJfGdacXVWcERxPC21KkjXEPC5GhDErd/3fi7Tc1NO+CkZfXsBh6RU8ilonS0jAD/xym79yuwGhqywV6Et8GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I62NlWL+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9kdlQ8R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M7cTQB778711
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOy8/GU3XQkZVyXsjJI4YrGNfteshSum3AiTJPnkXFU=; b=I62NlWL+HLctD+sz
	RbdpGqtnZ8gtEnLvig5e3IfsqmR1E0K/WnzSTvqMmiLj2m6/CmMdCGK5cSh/BCXM
	acKeiFlymox/EyKIIJMzds1mv8hvms9iY2TLGWoEagq3VC2npTRA8CwNoVhHaECJ
	rALL3h6dLHD5QnzbpXdgViGdNfeExl4vUMCVSP13D3+yPcOT6wyXLkEc+x/z3JCS
	iSplzhT2uNRy81QhANJOd9xeMgX5UXSNphM4LUlFJPfvSPOGiWuljPSuFwP/ha5P
	cU8Cey3uBnGW32Cc2H24hN6uvDJCffFrQMPHvG2WSV+b0R/D92k6fBAL5iSxpSBM
	tT74Tg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7at7v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:13:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c82c477290bso3851218a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444783; x=1780049583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOy8/GU3XQkZVyXsjJI4YrGNfteshSum3AiTJPnkXFU=;
        b=Y9kdlQ8RSlLRRv3feMPRhH9B4+51iqx6kxCH75jQrWmvmdHbiZdBNGjeXLE3eA+hB5
         JeOv1CGW7DgG/Re+WyNW/zBc0S0Q5i1yZwoPxmptfCf5XWk8gJ0J1hBEyfAOrxIQy08t
         d3fhgkPny88LTkFlyRD/rKF7QbLoYPcu9Xuy1Ft9jxu9agufOneJqHtk0U6j8yx7cQCw
         1L1+vgW1tUr11ZuySNN0jQvwPj84EIWJfeRyTuwc9k5DsdYusaFF191L351F5y5qL4n0
         dNldznp4TTK69ERrE/u1m6an9ZsnuwhIfCQKSWg4SCLV6OOxlBb7ZFatqsD/yT+kiIxu
         q7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444783; x=1780049583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rOy8/GU3XQkZVyXsjJI4YrGNfteshSum3AiTJPnkXFU=;
        b=Zr4/g7XphZuuGD8Gy40OzqOJcQhBHwzOCGiPacKaZC9TIEHvewY6nj2o+SV9Nf175C
         GAY2IiluWhCejmAqCkc0zAq64ZeNZyjY6bdmAUFkBn+SxcsocwBhJyj7CqcgrLWQiRfe
         pxlOYrdjYod15q004ci2LJejgm4RsTl2n5uc4BO8WsClLpdQSdmvYWN68RMLndYGYQ1P
         zurfbj32SZd1LN1HA1VYZPCsTYvxEmCjJZTjEyHSWIyYTxzkxzyYDfX6ca3j4Y/jAjG8
         rQPym6oQ2UbdoVuvv8LcPMssanmpaBWe22X5SRKONcvpzQkA0Dw39+HAlaYFf/d6TKv5
         sBlQ==
X-Gm-Message-State: AOJu0YyoH+V5c4eqKQAJ1+zAV25E7HyApmKkQ3tG8Jiea1gTOjDeUmzh
	CKg2pYqZi25/vZ0PN8ypLAF3l+kqaYqrIqjefx9fxR8oa0OsteysMtklpjLHFo1wrn/dXxdg1xk
	layKtQjxUjiQF5+xDcYHbBUT+4XbeztJz12alxnD9UzH5m2G4mzks7sygsobAfKzZOPei
X-Gm-Gg: Acq92OGGrRC7QvfaNKgaQ0OmQd06PjeXr5rdxXg+mEg66nlcwG/Xhd57QhBAIPjth1j
	7c35VvaCTBTlu81hy24rKtN8WMgAXtx/8YIkKXwUJ0IL/Nwj3ov8GJRsNS/W9Tvc0lBgU04UHUG
	n2SDFJhZHy3FSK7eAvXeykbc7qMd9zsoRisycvmRdr2IxUrg9DDrfI2Y70ZxEjpsuMDjSig3Ggz
	qQMFXWbd8+OkKJHKJmD2mLbyM84hpZTs4vQnnic7AycX8CSyPo9DGMei5LuhoT+XTGCpEhZIjSf
	QJVQY9vbAjm7T8PPAqh1QjUdcC4GvJQ65pR0llrtDV4F0KWyqa+H9rN0rMJWHuJVTrMh74gJbVj
	KzPqLGszJNsDyNPC9Ngj1UHb7dsp7jC/jlPnOEOb4lb7cmQ==
X-Received: by 2002:a05:6a21:e545:b0:3a3:1071:89f0 with SMTP id adf61e73a8af0-3b328c3aef7mr2746399637.2.1779444782730;
        Fri, 22 May 2026 03:13:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:e545:b0:3a3:1071:89f0 with SMTP id adf61e73a8af0-3b328c3aef7mr2746356637.2.1779444782221;
        Fri, 22 May 2026 03:13:02 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:13:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:42:00 +0530
Subject: [PATCH v5 4/5] arm64: dts: qcom: Add GPU support for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-glymur-gpu-dt-v5-4-562c406b210c@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
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
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=6197;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9LRaMcv2V4zbaC8556pmvtif80qwwMxTZ4+jktXJcsQ=;
 b=zOl5Y89TsckbbBpFdAJU2lXL8xlzh6ufa28T/1DvnFneuixTugelWjOX7t/1gn4pxgQgmQQF8
 364+zozaWZJD4JlmMOvoAmhkuklertg1pkeCuQafrdtXHBVfOUW7dJD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: I4Hfx8Ws6MrcEV2_L2uEjp2Fr8_Mcw7o
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a102c2f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0FMZnqfP4dmqgQdt9j8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: I4Hfx8Ws6MrcEV2_L2uEjp2Fr8_Mcw7o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMCBTYWx0ZWRfXzAdn5+gjygJl
 fJwguH2Lk59NzsAcdkqWMIJT077IbfOMFv45j8lANXYVSci16RBZPZ2G4s4AvJYVgsCyNHwn16K
 bx7TcdxLtmPwbkMxMrHG95fwCnDslFwg4+oVKPMocse4gmCx0t4XHT1Af2xOFueG9sF9YkqlAcj
 Vi8ylpUCA3xoouKOc4P6S6gxwW0sF3TQvjkv7V1dF0vbVatNlEeDklxkZr47ztr2IcuJ3qqutWW
 hE8JoFqCYXC3W7wQy3Ln/ofQ0mYKam5Ur/K6KhAdO7bGTDq49u5aH+ap9wGG6UlpycaLsMqEsbL
 cr6w26CdmMqWt+E6enSpSm76hyQNvCcYf3q3eYDhAyiM2qd4yIsdo/PMGlziUtrY1Otg2iBs1og
 m8Ip/NPJQ4taib862Yv4Q6VX8pAVL677xPsrGnh1S1FQWIvQHzCwuas/HHCKTk4b46wT3utpR/N
 RBci+D2taK4dBHTcJbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220100
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109239-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,3d00000:email,3d64000:email,3d6c000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.30.132.128:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF0F05B1EBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Adreno X2 series GPU present in Glymur SoC belongs to the A8x
family. It is a new HW IP with architectural improvements as well
as different set of hw configs like GMEM, num SPs, Caches sizes etc.

Add the GPU and GMU nodes to describe this hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 183 +++++++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 5e76a0d53f01..01a2e32e503b 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3701,6 +3701,129 @@ hsc_noc: interconnect@2000000 {
 			#interconnect-cells = <2>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-44070001", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x6c000>,
+			      <0x0 0x03d9e000 0x0 0x2000>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0 0x0>,
+				 <&adreno_smmu 1 0x0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
+
+			interconnects = <&hsc_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
+
+				opp-310000000 {
+					opp-hz = /bits/ 64 <310000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <2136719>;
+					opp-supported-hw = <0xf>;
+					/* ACD is disabled */
+				};
+
+				opp-410000000 {
+					opp-hz = /bits/ 64 <410000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6074219>;
+					opp-supported-hw = <0xf>;
+					/* ACD is disabled */
+				};
+
+				opp-572000000 {
+					opp-hz = /bits/ 64 <572000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <12449219>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0xe02d5ffd>;
+				};
+
+				opp-760000000 {
+					opp-hz = /bits/ 64 <760000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12449219>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0xc0285ffd>;
+				};
+
+				opp-820000000 {
+					opp-hz = /bits/ 64 <820000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0xa82e5ffd>;
+				};
+
+				opp-915000000 {
+					opp-hz = /bits/ 64 <915000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-1070000000 {
+					opp-hz = /bits/ 64 <1070000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882b5ffd>;
+				};
+
+				opp-1185000000 {
+					opp-hz = /bits/ 64 <1185000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+				};
+
+				opp-1350000000 {
+					opp-hz = /bits/ 64 <1350000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+				};
+
+				opp-1550000000 {
+					opp-hz = /bits/ 64 <1550000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0x7>;
+					qcom,opp-acd-level = <0xa8295ffd>;
+				};
+
+				opp-1700000000 {
+					opp-hz = /bits/ 64 <1700000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0x7>;
+					qcom,opp-acd-level = <0x88295ffd>;
+				};
+
+				opp-1850000000 {
+					opp-hz = /bits/ 64 <1850000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L5>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0x3>;
+					qcom,opp-acd-level = <0x88285ffd>;
+				};
+			};
+		};
+
 		gxclkctl: clock-controller@3d64000 {
 			compatible = "qcom,glymur-gxclkctl";
 			reg = <0x0 0x03d64000 0x0 0x6000>;
@@ -3712,6 +3835,66 @@ gxclkctl: clock-controller@3d64000 {
 			#power-domain-cells = <1>;
 		};
 
+		gmu: gmu@3d6c000 {
+			compatible = "qcom,adreno-gmu-x285.1", "qcom,adreno-gmu";
+
+			reg = <0x0 0x03d6c000 0x0 0x32000>;
+			reg-names = "gmu";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi",
+					  "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_GPU_GEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_RSCC_HUB_AON_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "memnoc",
+				      "hub",
+				      "rscc";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gxclkctl GX_CLKCTL_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 5 0x0>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-575000000 {
+					opp-hz = /bits/ 64 <575000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-700000000 {
+					opp-hz = /bits/ 64 <700000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				opp-725000000 {
+					opp-hz = /bits/ 64 <725000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				opp-750000000 {
+					opp-hz = /bits/ 64 <750000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,glymur-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.51.0


