Return-Path: <linux-arm-msm+bounces-98162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AImMEuFJuWnG/QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:32:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F245C2A9EED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DF59309264E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 12:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63773C6619;
	Tue, 17 Mar 2026 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeQwoj5g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fc3SvVk1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119673C5DBC
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750542; cv=none; b=vEUlvaAG1rCq+babGwEGPEHxNtqytafEU2EXPiCT+CT3U9I1HG0Cqj3xJhDxvoJqX9tSYSRLtmaDFzzfxbc9rdLd4c/6Jff+HAgtcYZ0mgyiRO75PDACBA5Spixw7GT0CtkYHReQCTiDaEWdKkLge9mM39Sm7hZhx07gYa42ibw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750542; c=relaxed/simple;
	bh=z3t+4dAq4SSTBybuoQd5OCuGMJtELiZpMtQKu8CWNkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HXwiwrV/z/Bnchrdv8EKNUPRmkFSI7yhVrKyeICHY0/QOov2zCZkrfOgMlMHmmeR+Z6/USB+qRb9r7zX982+UJDu44n1GY7DAwxsehrSUXPbViJ+HXhN+6m+D6ooRHLqWoKlo12i2LIU+U6EOIPoKnqSFhg1CxucMLKFgEf+TIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeQwoj5g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fc3SvVk1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H81L1O3295184
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJDzVUQbHdOHUfOVUrr8uKLdRjLeObgicE1T03eIebM=; b=PeQwoj5gdfYxW9lJ
	dMhAOBIhYGAdVIIs/i/tqIuuh4ErAadlhyzIEW4HwSY1pcOqcVjD99N1kyL/KIMo
	/pyg2V996w09SUIwi5oLnhY1pgNO0KtSMXqbf672DHPLIA+WeYQx8j2aKb5QYO8z
	7tB4nPQgQw1Q6TZQMu0WnJ+PtYipi1bJ5+lGO93dZmQvTr6QVQgxi01gCP7mYaUI
	kdLAGzSf9VDq6OpEs0IakKtaXzEYOVDGDjUiGv8fPPuMzk2p+v65epeF0LC8SmvG
	P0uKmqUXMu/VpPzOJACRJx2HIV8967qFN1fUjjpOGZfHdl2X4cgTSGyzAQTlQN+T
	Nqa9dQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy3yp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:28:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a17153ee9so2153816b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773750539; x=1774355339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJDzVUQbHdOHUfOVUrr8uKLdRjLeObgicE1T03eIebM=;
        b=fc3SvVk14n2B6mafXsvRQO4a1wWJs6ifodHeV8MswNhz+ZeeKjeZkDSDdOELY5TKKP
         8opGehyDnRF2ry7cM8UYnk/nEmXDCBd21M3n+9g9oqQuFo2n1DFK0ioQniPmg4QjOWGA
         8Nuv6hSFLxnyPBwvLyou4THKOuI19v/SZk84BF4SuN47HNfUxmoFhc8QlUnSqFC1Hef4
         Aidbf4waWyHhY9lLogm2K3SXwnobAU9SjepU3X2d9KF6QOvkAWo5fWcZr3QWmifqWNA9
         7mXKMTt4SjADoS1TXMUdfY8RPXQDMolAu4ZkSVSxXLQwxegFOEDYeztlyrJqbuc1dmhL
         pFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750539; x=1774355339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJDzVUQbHdOHUfOVUrr8uKLdRjLeObgicE1T03eIebM=;
        b=atY7xodQ+F6HjlGrsg6AG8dGfDEJNzUHUQOisxATVKtIMMUlcnYPUhJgFtDX3Oy+ce
         KHL6JYga8xMeWTlLXUHbQE9iScNxjzvwyyCa9TNhQXE+XKTqH5dMS1+qRCX763HF7Ouk
         e4c9r1/iJ3ctBzXqVGmIqm0SlzAaSGkhbGon1dGUhdqHS+uzAsOqiUuja8e7yCy4vw1G
         z3MlCn3nMsnyB0S8h2R/gcdP4+nvtH3c7F2r7rnwVbcCUsxTYNB5Wbh04n/Alsnb0XgS
         8/SwTrSk9UZrMpu0dMfoipLD2LZut64YdCI32opt6jk5t7gYJALioDliCB3OVfqwuLSz
         lfhQ==
X-Gm-Message-State: AOJu0YxL1WSlU4SGDx5XLSeGx1TdKiXXfOiCVrX5YmWnVkHmSu9f2KLr
	YmBotGVBrcergiPR3cAzNZry7wMW2G07TohLKOFlwBH++ngl5C2pKMl898dwq38vH3JD9HejK49
	MTcdnieI260ii3lJnU3+/IZLmsRn6tavS/Zj2TzNbxTIGi9TrEfV5i6WXF+pu2oBrVj1V
X-Gm-Gg: ATEYQzy32j5ZT8psZ+oxdfi7Trxfhgz5hlNY6VJGcQ9k6TJGshMcFonuFSoSQpRfo7F
	xARKg7A83Cs5qwu7T08FDvu3t01n5AP1PH+7hw3jT1/vy/323LOKW+sCRXMHNyT82BkGlCF94Wl
	8YU2oPQeKryapztzuNtrGorcoPEdusIwv18Raw7lqYeWsRgGRvwOCEvB4PPhTRK+huLO62O7jQe
	0tisirGY8IiSzmvO7WwCn09300Ck4iyHaJA2F//nLShj2Al2Rz1T4qdkBQq8MakTXRR1AY/GGUh
	8uELgAI9EiGuhpUsgVKCtZinV/Evbb5RubWV42QXaFfpmN+Vgkj4ZV5qE+QHPCx+AH/Y0qS1TxE
	7vEGeOfGaKk+xrJfsJX794lhFA6xoBxXyNoWTGjsUJ1NUrbo9l/3IX1Jtsq/ttp90YZq5n50kFn
	0v/Ec6kmI+yInKSsYQCwYs0av1z0BvA4yH8Q==
X-Received: by 2002:a05:6a00:14d0:b0:81a:d633:db03 with SMTP id d2e1a72fcca58-82a198f09bamr14427514b3a.59.1773750538922;
        Tue, 17 Mar 2026 05:28:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:14d0:b0:81a:d633:db03 with SMTP id d2e1a72fcca58-82a198f09bamr14427476b3a.59.1773750537882;
        Tue, 17 Mar 2026 05:28:57 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm16654056b3a.34.2026.03.17.05.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:28:57 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 17:57:59 +0530
Subject: [PATCH v5 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-add-driver-for-ec-v5-5-38d11f524856@oss.qualcomm.com>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
In-Reply-To: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773750506; l=1511;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=m7KLE/C5+OINsGZIGvpXWdLLKIeCneyzTHdrLlOZZSo=;
 b=CgHL2K8lVoR28mEk2G54X7UBVDfBclsI1YbgG43m8Ck7WcGjCAqefdioTLmGqaXPKzqrdvc28
 1X1iqbB9mJ8BLugWK8xDzyI/7xqmo5KhknN2P3ZTSzcIQMEgzKGSgBg
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b9490b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwOSBTYWx0ZWRfX/cIwAN1avxlB
 xWFOLGjYlcxMvqRdu4Hlqvvm0RDSLbSDXp7qNdY6dSwBL9/IdNRYjEpsCBGjhtLfpME6dpf85TH
 AbUeY0luq137+gqfnYmut57vBdGKCjgthhEDk1952/tlWEIOlsnr8Ru3Y/dkrHzosxeo7MbH4BB
 vI3rkDK5UYpC0YnxK1Xj7+D8nAtWCNXMyIrZAF1Aon+qZEwMmLP3ubHmra2eFuws9m4bK57dTA8
 VFG15pc6gVHuhMDGbjegoORsELd0H7znBSaezd3CaxiEUKRtXK3fwfQJi7lD03YCnGBZk67RBQe
 Q+II3d0unjq5P3VKsFuOTuCWrbu4OwFubaFNFTJzxkfhMlVIasub3AnPic36xkGiOvpsmMWJL6i
 SachKRFtzWu7etc4QRQZbkR7d9EUBfhBMupI88lbzLznlLp+Qox48R4yRnbIf7t2ktoeKA9csyb
 9+SuhFRB6orjHAeuYwA==
X-Proofpoint-ORIG-GUID: pKeXFuMHTjZSCUtCB5PsUH3lktjKhBSm
X-Proofpoint-GUID: pKeXFuMHTjZSCUtCB5PsUH3lktjKhBSm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170109
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98162-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,0.0.0.76:email,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,4f:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F245C2A9EED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 630642baa435..b3430424a052 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -799,6 +799,16 @@ eusb6_repeater: redriver@4f {
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
@@ -1272,6 +1282,12 @@ right_tweeter: speaker@0,1 {
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


