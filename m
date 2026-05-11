Return-Path: <linux-arm-msm+bounces-106922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IQGOyjRAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:52:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9C850E44D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C168230BD80D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544D63A3E90;
	Mon, 11 May 2026 12:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMOvHK4/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChEflrma"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C0537475B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503501; cv=none; b=o2rnzU0lwCwxpgA2auhBd6drwezzgIT80HOMGlwNNYL1hNnaypLqprLCZvZcn5dPGz88UhrcewSmUraLedlbZ5iWUMiEzimlXbib9gZODqRcZ4LAM9r8fycvIiPt3Da2++hESg3hsDUl61qwnbbjPnlaFGcKVXwH8KamxP7HquE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503501; c=relaxed/simple;
	bh=nfUlgRiZuBNEE478C2TaHpdYARSv0jZSyoCpVTzZyeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQwCIisFG9BmnKYuj2DEP3KszsO67d/KIaAq/YIdT1mGzR4A//MfqChTO13EFFN94RDKJrzL9ZKNNQEpAEjFrEnxQIQpaVysj653CC3ZuaSmOryxfG8KuNoiWmLZlha2YDxRN/alVQCmJTjaqtBbqOLbBCnSkr0mnVTbSKUhYr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMOvHK4/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChEflrma; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9TX0f018395
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=; b=FMOvHK4/0ofVaVTE
	J5bZOq7q3sE7VFS56VHHk8TPB3J1eqCL1+MMojdm63XbNb6wPhiDFCZDSpkyhg6t
	c6Y5a8Kzv1nO4NgSEldeZbiQWfIc/Uwq10a4AoFatfuHg9vCicQ9WI0IGFeAkiiY
	LZv6l+vFzAfCd6uJi/jao0lda7AS9dbX8RgfFFmDrgQzda0pNq/EhNkcivfj+Fg8
	zNsnTuoigbTrXJk5QI3KlNPr+SIl4gAMww+rE8DSUDif9CplsJ7kBoQGEwjDSQgV
	/WG4PRWGC7611I8qF4EDoxsup6NTUagzdtRhlJKkBFH5cDt0rZE2yQW+s3tQR53i
	n/7WkA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xfsr3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:44:59 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7bd92c50e6aso91120907b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503498; x=1779108298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=;
        b=ChEflrmarreYSqMVgF/35qw1FvLa15QVxsakNVMNaE/Pq8WUEtrNNorU2aonZanJgV
         NR+AxQziAI03iXRymmVQZHkl8eorzlMrNrlfnMFgxY6SQBJkKrp4+h2xO3H4pzlSrgyZ
         KiaXigwbDMGFdrZ1nfBuPMSVc9wx94ivf6hNT2eOGG2/rYUSpjal3b1vkjSUxA+2UFaR
         whX4BKUSM3o5+a9+kODFu/wNruXfSMeQ7MUisKsWlbqSsXKFsspUhvCIZn9BMym1Rgeu
         UO6eB2UXF9SY9jUMaAG82UvMc9PdA9LyeOZIsKiOIgMKGLCUSIGs2E9CbNorFArBUKft
         kKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503498; x=1779108298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=;
        b=eaKDDXiyysMmdNWL/1UwZCm77RK8I9jOKJv7zZVqpEQX4dqjpLu+CZFNgK/BKWfUt1
         Wc7hVA3MdVKDXJveQ9ZbqdK9SkZPPX9ZUC7lKftwYBrWlWgOF78hpJw6q9kpCw0f5OvB
         xVcijs7jsfDvUt/dj4lUZkfldGXJvSV1qvr/zzJVZJYNiqJqyV6nAyAeGx6stD5PWZf2
         KA12AxpnNvhhaC+1SLBCbTvAwNBw+dgNeo5sQoxTV45fyzfcDh6QtE5KtOizeXWay3au
         b3TnjWNnwFqW8Ge+OVqSqo/d5CbPLsgKFBexOodo6T8U6ZoUK5Hr/S7TJZUtlJ8/5WBC
         rvgw==
X-Gm-Message-State: AOJu0Yx9lNcemgqRwYgQ99hclcVsYYLs6cPxiSggHpTdAs7Rsl5WL42F
	BCKztyq6CWmLoRXamKdIaUUzws/XIHSSFH09qjIGprw+0J0f7PkOh+JCQ0rKt0paE23tWr9BIOm
	ZgkUIM9WW2qrjO1IONJDx/tQmFqLPO9X4gNnCmWg2t/7iwb3X9ybQz+dgfXPbCD21q+mh
X-Gm-Gg: Acq92OGgh8X1V71XUeU0N3kGPrzWFX5/czNuHGNj0Bx7zuqlHjuPGrdLVlffv7ANa3y
	anmj9TPSv3O/YWjTkZXSDqtyEBFH5bT1G5LfVq93fAotdX0C7fYomJWkKMe5SghjN/Cs+rybZ83
	V//j+oh/VhVQueHH4M6etfwIpHtKDYg2KMhNs1U1TZqMQlIWOkxP59L6Z/YN+COdw/bmNIxHIvm
	V31pn+VqS4tGynxkWE57UG2r12s9xpyJVDLfjSqvu33l9K58ybLc5zIvKLJez0EbAInoo/7faWj
	68n+sJ6Pv3lUqbrbv+BaPulBEbO5pQc690gFI+S2iuYQaBNjKyl9oYJ7BvhLW240GCSblF4J7fl
	ziAcTr2M3hMBWPVaRgs3xufihsds9ldFgoLyHFWoLNMczdVakKwGmFHQaZ3Tv+dJFiTP8rmMwjU
	eFG7oBi3qvSdrMcvuJXlcH9HtVAjhrms0tuA==
X-Received: by 2002:a05:690c:e72c:b0:7af:6075:4e0e with SMTP id 00721157ae682-7bfb9aa6ffemr113490927b3.35.1778503498474;
        Mon, 11 May 2026 05:44:58 -0700 (PDT)
X-Received: by 2002:a05:690c:e72c:b0:7af:6075:4e0e with SMTP id 00721157ae682-7bfb9aa6ffemr113490587b3.35.1778503498035;
        Mon, 11 May 2026 05:44:58 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:44:57 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:13:22 +0530
Subject: [PATCH v9 4/6] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-driver-for-ec-v9-4-e5437c39b7f8@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
In-Reply-To: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503462; l=1504;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=eCeG46QNcGH6Tou/jfnrUot8SRLcYov2KTKbb+oU9wQ=;
 b=0HSed/WiHQ7zpOBEPBiNGpSOHNmKQpL8HxpMlCo5AcFF5FH8pI56nLwQiaNKM2qcHQojCDmWQ
 nbFejxSKJJ4DMq0hmsEQE4CU27HMKF3rw/cfUVEvN2qZFBJXr1QDO70
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a01cf4b cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gaXMZf0GDK_To7W6ZIUA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: k8GEOAMXM_U5U4L0B2_UrVoIaDMDIGc1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfXzBp7TLpJd1pr
 sQht2M84I85tCQ1lrYoKGGU/6SSlRLOIiZVIahcT4ZZBrJOJU78drSQXB9Vy0IDreFoJyagLSDY
 DJk2g8nb2Y5EXGL/yxHn58LLhRTeYqBXBD9UmdH4PQt28seHGNzbBJiaDRP5DDiagjFaPuQYgdx
 lUWFmhgYs3dQo6dR+WTAswm2eaU6pDa5seydk9KGUe/9LgMCcYG5EJlSXmQUoiQuU3VrWm/Q2vr
 NAr2V2u6KolIcPahpucGuCxYhp6bDkEFJkzJbTdniPvt+UjMvHiKD+R68KZZk/oafxO+G2Q+u0E
 wq8MqWoEtzcatlJnCSoFTt0YIKN2/dMFjJsgXQQzrYuu1OJwG0f83LIxnQTr8e6q2Si5E5xLn13
 BcooDYPgkC4KG2FNh89zV9Y+yjo3a+tEwOdQPCe7RHCv+9XCYo/nalZQgLu+MHCSFQ2AAGW+jOj
 VM7H3HqUF6FZEZa875w==
X-Proofpoint-ORIG-GUID: k8GEOAMXM_U5U4L0B2_UrVoIaDMDIGc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110141
X-Rspamd-Queue-Id: 6B9C850E44D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106922-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.76:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,4f:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
temperature sensors, access to EC internal state changes and suspend
entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index a9c5c523575e..9602d65c8b3d 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1074,6 +1074,16 @@ eusb6_repeater: redriver@4f {
 
 		#phy-cells = <0>;
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1523,6 +1533,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1


