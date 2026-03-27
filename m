Return-Path: <linux-arm-msm+bounces-100255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDe1DQBZxmkrJAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:16:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3C934253A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BAA66309D3A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FC23B9DB7;
	Fri, 27 Mar 2026 10:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzGjBRzP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAMOkV0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82383ACEF8
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606134; cv=none; b=F8BesOhbDM+qSyOia8GZlCd7g4K6RZe4XZUb+aszOPUadtMxhHlpYlEgFAylL8wi6owNxBiWt5TukVnXmfmE0Z9+hjJwqr+E13MM5SHKW4sVjvT6+jddYlHuDqZmxDZqNnZcOd5vYsWamU2HYcjV2AuS7AnzZm81wqCA3ruMSzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606134; c=relaxed/simple;
	bh=+E4tZfMlel36uwMhdXbJ+b8CyJSQUpcuObNpX2cZjj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nciVWhO+jJEsSBZ8Rn4uwIt9z1sp0SYEeCxPXxOXaBXf7JQEHUNYRe2Y3hcbrRfiqz2PvZf9PRAD2W33u2oNTG9BB8Gt4RBP3mNkMwubgVbuEMTrIRUudaE/k2XvD6aEswq4uIfwDuty8jcWyynSKh2BwLe47LIQjnfwqY39Dew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzGjBRzP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAMOkV0g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wuAv2846152
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=; b=bzGjBRzPKq0WeUgR
	4coIioMmDv/v0MxlXMxV0cWX9PJnL3zwpvBOE8Ax7zc6qu2FyDNOFxeX2AUqjgbK
	+7+HPB1TtbBn7OpAzP7jKJyAMNTNEtGukEDpe4fb5TyAHlKXY9lweoZUDne/E3Mh
	0wX81ZZDCU9jyZ0VeQodPJL749tf+OuwMaCdRecumRoA/gvX9TkylqKcY9HEpbUl
	FMVBSse5uNRw6BtQLiRWdzwC0J9ZZGcokVgoYKcEKn0o/H92lB6Z+wlB7N8b3XY0
	pdor+ZZO4uBJX4qxHNqth8wUcN8BR4w7SfZ87CJ7Nw+Y5MDbPjaOB+dCNCXZtW7O
	2znv/g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqmj8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:08:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adef9d486bso39027835ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606131; x=1775210931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=kAMOkV0gTlrmNfGnJl8u1fueNFLrxV7Znh6twiWeYMrc1bffgj7/rBAzzQr2iZ+T07
         yHXRcVNnDR4HTszjRs+SFyzKAaVFXqqqgoXGbBdjacE44A0NteGpjFQuqe5gKkeRp+nL
         zIAUyAB20CTxr1FGkNrFRnJUoU0h38MMafBkK7bupI0hJqxRxJiq1fxMGIgSm3t4Q7l3
         4bdYa9uNrFeWl9napLYM2XMVygF+6HcehHilo8Fva2kcb7A3k4A/qQ/H85Z8MDRFxqey
         DPCMIgG/lljMBcvWntq7rU48ygVFnqBhHC0OVQasXn1xNtFT1CPQiif0csJxTZuuAqLv
         UFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606131; x=1775210931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=FXphCz+BXZNZEZ0LBiizgRCwUIbXoNt0W67ls8BFggouqbppTsrbFSt/9KlOTNILKQ
         TX3s4WAomMVBLoFnO83k54x3JD2+YaQmuf670iGNEvYahE/Wzfp3omcvumrji6xYF2gA
         wzMYqaBkX5kxbdR8iAs5Ts6d4FwnHS50VsAV+qQWMNF476/6YILfu83RVKjAik3df2Dt
         ++5tqam/Y7HglAHUAl6imv3EAR3l0CsDK5lZodqjL7vgaiePOPM/9zSVb+yZ3sfZbbVj
         qXJYQqLgJGA7hoSK64gap3LreBhs9isKpovwihc95fChWNbFXk9nRsGqdQRvzBDwOjX+
         Qggw==
X-Gm-Message-State: AOJu0Yz5mdaN+necmr3G5YeFFeWNT82PXqH/LDoVllz2CKd1urZKqIYl
	DmH8G22zaQF1gopHAQDKaOtEDdPK7on9ozeUgNxsJHYaTK56GINmleUGan4CLuzMSyYI78gbNIi
	dSdhMaemd1WJV3GlWG9mU9dF5UyaGwoeg0tE8zTYz3+unCW6AG9Yibmrnr3rtpxLobOgpZ1KSzj
	jA
X-Gm-Gg: ATEYQzxgvrVYj2C/6LR1oxIqNFwZG+SwCB3X6pR16mnxmV/taN8xtS5GveMhLE3YIGw
	0VSfAb9Rzk3egUXrVzspuApIBwNBsB8X3Vb5w2T94L1omASqNesqJkzvVV4GaFpmmDXx3svKu0B
	EpCVcFnPZPybOG3V8ww1PmiGqukdRd3QCVSYJVfwLFYURdx3sc5gIjuTzjDGu98tJdFI0LFPjbv
	bfkl4vcHK9nLLcdVjv2Dq3xqxLxb5RO4lrPXxMDc9aN9RrnMZzbinhXKkMApF8bkJ7xa2C8OyAV
	nJ6MpUd/up8aeC5j67w3Dcq52/gGgrH86mOQR1sqNDeO8wQDTbJyfMgkU1O8CZcAGS1anLriEVS
	aIUxwI3oxkACkytfh3HwkpI7cK8nQCFuV8C5W4u79cNLcCs2u+VE7YBiXQOrENRbNhnGl1KTEfb
	ZNN3ezG1B2aXnOrHFN0NwzCfNkL3Nu3MbG5w==
X-Received: by 2002:a17:903:1450:b0:2b0:5626:f75d with SMTP id d9443c01a7336-2b0cdcb7d29mr22984185ad.26.1774606130758;
        Fri, 27 Mar 2026 03:08:50 -0700 (PDT)
X-Received: by 2002:a17:903:1450:b0:2b0:5626:f75d with SMTP id d9443c01a7336-2b0cdcb7d29mr22983985ad.26.1774606130299;
        Fri, 27 Mar 2026 03:08:50 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc786b7fsm74465675ad.20.2026.03.27.03.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:08:49 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:38:18 +0530
Subject: [PATCH v7 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-add-driver-for-ec-v7-5-7684c915e42c@oss.qualcomm.com>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
In-Reply-To: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
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
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774606096; l=1627;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=v3xhy4TAVQzMuukJtx0ZPXFz4/C8vTU0vk3Dukc5Tss=;
 b=Avf6Q2NxGSEHZm3OYNgznndDtNW26jckaDRb8PQjiSW0DrZKPl8yWhVikJmF+aj2DdUGI0r5f
 HNq/X0qPYKkBW9ZdVsEit65pTkYPotbzgRlRbXqqjTIz2YiXrAVwNsi
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfXzvt2UO1rfYux
 uqDiJrBLnPgG4gW4al44kpy8FIzU7sVcRZQ/qKHXwVXy29ePWC+g66oT6h7U3054Ac9gVWgt+ys
 wKpZo65F83jVCBzpde/7+wMbVg/OPesV2ZdXhRYvWVNTyooBdS0pNsW8k35YAFmf2XMGpQUmPXv
 Acms8k10BHEBsoeLXYTZW97AsrW1HtCtJqVQTjIJ8sb8pISmeBxWuhb9qD1G2u3mih+GxUVvB2n
 i2GEEFSUoDEMf29ULJ8K3Zmic4LsXkXTbEu1ZKRVXgJaMIWsStZ6f4emnu2NHJTHfrtWy24jVP8
 UB7NaWolHIf2GBPrkiKejp/Xw0WXamnQYlNg9Ow5iMzHEOfpCkH6H+iQEjfg3KmNkEiJ0PbQOxe
 I2Ga572wxSkgRf1FXUW/OpOWziaYbvbliQgwW8jx7YI+CKu5kQ7YZNvtV1rdiTo2HWLDWt2RxUM
 t7G5Q6FxL/DA3IV8mUw==
X-Proofpoint-GUID: bOPKhbg6oXSApSruPYuDD4rxQ1GknvE4
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c65734 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: bOPKhbg6oXSApSruPYuDD4rxQ1GknvE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100255-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.76:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B3C934253A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..a0d2ccf931ec 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1320,6 +1330,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
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


