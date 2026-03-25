Return-Path: <linux-arm-msm+bounces-99856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO57HJrMw2lKuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:52:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C491E324403
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4964231C2D4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA1E3CF693;
	Wed, 25 Mar 2026 11:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFXwsE2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imlpC6zN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67D63D0912
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438887; cv=none; b=lRwebGRwhg4wP2lsVGVPRv8e7+MDJ8tAnVF4aNx507oxfeVAHv2wbddpQB74IyDpbjZFKBb4whVYsBdmu2YPCLMot2ooR/lZUaDf+mdpoqwjtYUJL0BDQPxZBXQsemc+gCNGzLA7DGGFGUTxQDHw5bmefDmlvKvLVgteknKXx6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438887; c=relaxed/simple;
	bh=Dd5fp85/4V9VJ5EyZFEPibLsm/4o0VYPqFC5Sk2sGQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K/RoRkbV9bE9xRKjRjJ2Enq0p60IzhaQxaGC84XNHTsDwtvaRAu6UEc+I3Y13AhPOj+GVh9AoTf+wrBcquL9gmac5XuVfL666jx4cdwLM4gGXuFQgneQfJ+PDO++Nphhs83ylNz3duh8dbIwgIsRlS6eWaaoW4PtQv09ZwtUiyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFXwsE2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imlpC6zN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBG1TT3090838
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YM46yQGr/puwc3alCscfbFbGdSuIrLWtIOURjrNnAAI=; b=KFXwsE2XtaDGIRVH
	f3sE4WmkiKKVLnLQ+PtOQAFhDottapERvkDI5TIav1jQPXwDUlNsJAz1He+WHFqk
	E8FX8yS/0NFrUSIDMkGk5+K0wWtqiAHO9Ub6HBTevfd7iVYzeQMvi+cJ47+URww8
	o/WdZrYjA/hMoR+8u8r6Apd4uMTcr2LRR9+E5uBTIYxzDnBDMvM2ncmNw6aRN8tN
	uVNpVcAovf93C/BmObRVi1lQ0e9omJn/qHq6fQ8qvUInxkoKmLY2MDCIUVcyop1X
	EJECdlcAfJGI/BBIvUq0j9APmSVgwn/gN6G5K7eVhvKe+2d1A4IKQ6zwVb4SvZ0Y
	LllI2g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmprbvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b04293b16cso226940355ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438884; x=1775043684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YM46yQGr/puwc3alCscfbFbGdSuIrLWtIOURjrNnAAI=;
        b=imlpC6zNbeJOm9VoFoA3XmwjbbcBj00w1H7kGCjp9TAiTj75qXNzbTT52Jsv18vaK6
         LozQkbkTGVlCm3Yn2q8wSSXLr7zAB7dSQZs2W/XWlSgPL19qx4Rm47HTML9HFdhjKU2D
         vcMqu1F3EQg1sx0ylyMM53WnffVwzhutIWwl+pTyDgAlCzXcna2Pxc9rC17QNereYGsf
         DI4vi0pG5zWMPtbdplpaQCg/igU/C66l80ubecvVSclTRRIT0G0S1q9cCkGg5560VNC5
         1Cx6vR9ybwItPtGVkvYjSbO+OZbMmjNWebPwf0lV1OCnn0hHb60LHEt331L1T60sG1Hf
         K0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438884; x=1775043684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YM46yQGr/puwc3alCscfbFbGdSuIrLWtIOURjrNnAAI=;
        b=PEyDKIY0RdkEpfGNJxqmfz4GE+ezqb/t+pAp/ek+7yVD1eZmv2polIh2QR3kQIzYat
         a+iPDEG0N+x4jK2OU6rNpr5gkCs7tVpKf2chXu7LhMuVScTHjdvKZx7l5560w7wgyykx
         u16+8jwTXcLa/UceRAddwhJOoUEE10ptgTQxzJULxSbqdV45Q8j9SLflPawK4uSKxp/q
         WJJ7drnGxceHlXM79XXXN7DqGO0gc9DluJbFfUFHCwY3lvzhloQjAixOXf3UZcZZNDhm
         ZGgDaHjrYZxuMte54f0MqYpYPjiN/yO7XszhBOtsYytWc6D+pnifbzYilzIfthNI8AnG
         Abrg==
X-Gm-Message-State: AOJu0YwxZ+p+cuITNesPGI1MA+9EB4/Nmq2RL76enSCmoHIrazS6x1Nt
	nXWiuiUZBdt+TXbyCPhrtC6FY9AJQAxmzaeeu9mhJdsf97R6jkf7OP1cF9/oyuzwdj4pB6EPBjI
	TJaAjplFYMUTLHrNXs03jgDxVn/aiAqh4BK25HyjaGx0iy/Px57k3rF+agETC4jQ2ofaC
X-Gm-Gg: ATEYQzzBbFJ4HmtADEJeMf7Nee4IAbkF6wVQ/2xQliPRiHdx6D1IIs1r9SVbZaq6JjD
	aH6qaZIVyBXvjkitxxN2y7qVDFSdk5hWZ94CF/P/1FxSiGdSyFjU3aRgVB3ZA3obn5RoZHXZJY8
	fO/BMhyK5S/ylbOyWxfUTObyXZpvq7h21Zq9PXleWH7RGzrrZaw2DNzvpyi2j3na0zmwFeBI1Gj
	pB+9EXS+BEAm7X9pXNiKw5XPLATD0e2OWBQVYVYav0hkbU5dYxa6YrFahY/SAyQsDUMVbOr6hy0
	FU6MAXdlCGaJmePvZ7l3ib7Qrv/WzECFHLY9I9J2CXc8b22i48In9dBiVs/J06n45sxEr+WDTlt
	eYAHF6BopQXEKe+V+YK8bCLrqO5EuS5ksys3yrzLckpkbSZbpyHCjo6tcDSscn37D7NdJXYltwj
	tAMkjeqzBBfdUa4qcLQ2uGB07MjB1JBy1H9Q==
X-Received: by 2002:a17:903:3807:b0:2ae:b9cd:d2df with SMTP id d9443c01a7336-2b0b0a9fd7cmr40601555ad.34.1774438884344;
        Wed, 25 Mar 2026 04:41:24 -0700 (PDT)
X-Received: by 2002:a17:903:3807:b0:2ae:b9cd:d2df with SMTP id d9443c01a7336-2b0b0a9fd7cmr40601165ad.34.1774438883877;
        Wed, 25 Mar 2026 04:41:23 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0ae360d4bsm38152015ad.16.2026.03.25.04.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:41:23 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:09:53 +0530
Subject: [PATCH v6 3/5] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-add-driver-for-ec-v6-3-a8e888d09f0f@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
In-Reply-To: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774438862; l=1578;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=Er+elbEJvOvNZkz+nLoEwXm5OyAOC9UUXsw+XjSTb7M=;
 b=mUIlcPLYJ2WktFEkXqwnaYyyR1prxDiVFP6OAllROeDf+efsFUifRJSWs2yXYVrLs+vDcFQr5
 ipexjNFhhyoA9koc46f1QCkTmtlL7UZHHJYOYeVIhV6rqiGQ+5iudsl
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MyBTYWx0ZWRfXzodOsrmTmSm2
 oatOkuuw5VmB8rcId2ahHKxmr4K3NYWOOoahM6hZofsgdDImsl6wy6irk7dY1AxUf4+Q7JsM/MC
 eNUCFfJdAIPrAm/fhbm3BQKCWWyYAxvQMup4ldJ8IW6Tmiz9Bkkff9J+/iL3FaoUcay2F84Jh/T
 GVjL8HDoC+XdVwlEEX/vbrYI/g+cPQmZbatkzizKmGYMgB9dCbtb5SjRwBc/61jgapSUdCJDqCW
 PvE5QX4w8kE6cjIdoX8Vr3r7Q8+3vZjen2SkSdv+FOXDNrMxLh74XqTdqRcNo8azfe0w6k3oQxl
 cqYY930m8HVmSAcU5DcW8F6LAy1vwlxkTYmJsxvygC8K94nPaca+z3FK2oHYrAoHxNWP+s8q1BT
 4JcTwXpvRV1RhXSz8kfS1xum7Vyp0I3a6V/r/wljwd1Ds3ldZ0XmdBdvSMev3Ole8vIVud71Z4u
 d5K99EWePg4LiUjMBWg==
X-Proofpoint-GUID: 1Bc6yolQFGSTO4vyzYcxvLH5hy6vY4-A
X-Proofpoint-ORIG-GUID: 1Bc6yolQFGSTO4vyzYcxvLH5hy6vY4-A
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3c9e5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=h-fhkJo0eXD2C244oGgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99856-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.76:email,0.0.0.47:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C491E324403
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Glymur CRDs which adds fan control,
temperature sensors, access to EC state changes through SCI events
and suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 51ea23a49b9e..1a69b428307f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -198,6 +198,22 @@ ptn3222_1: redriver@47 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "qcom,glymur-crd-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -263,6 +279,12 @@ &smb2370_k_e2_eusb2_repeater {
 };
 
 &tlmm {
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";
 		function = "gpio";

-- 
2.34.1


