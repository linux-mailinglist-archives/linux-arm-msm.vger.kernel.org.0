Return-Path: <linux-arm-msm+bounces-92587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P8aFXNMjGmukgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:31:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD6A122C19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40EC33009030
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 09:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B462B1D5CF2;
	Wed, 11 Feb 2026 09:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3HYxxOT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCtXhe6b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F50A21ADA4
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770802257; cv=none; b=kOyuXdIlyA/jKpjhKnlYqbhrtLLybKR/X0AZ5aA66qtvzQcox8jMK+uFtcf6knhxFPjvtUTwFZ/MjFXkkc3W+yhALPazV2KH8wKi8lw7mCgWLnkUpJtiZz/1GzXt6Y5oxiVfnFJkqGFFRiMUkxrX/n+tWmsB4X0K2iCJMGAbpvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770802257; c=relaxed/simple;
	bh=KRWDALdKPtw4aHXDzmzT+mM1hatS1OZ7HaTispnCZjU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SzDVrEcIZoXbaXCSsBwTi6QkHRQZu20RbSk3/Jp6ICCexMTtk8JC/WIG1/VmaIEqp3EE0Za3Go4IgM6loOUxdvsU5lvQ0usIbvrm4yYTuh7JmIGen/Mb2nrWUCFNyntd+uUvSbtiiy4fvOHaCfb4tpK9/MDonun+pHfUy6otQcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3HYxxOT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCtXhe6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B3Hs1o3203811
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3B/G6YIWco8juD+yFfp35zucDDDlBC8XbJK
	p5h5QfRY=; b=p3HYxxOTgFAE8eVs/ANhth9TKNYI6idFB0kfOGH9kBUOMUZD6nj
	ZvM6Q2c2ArTwoqE1Dba11agwMStdIrVo7YUjfxoNby454NKv+TzoSmNtdqL1xAAT
	fHZb4KBIK+vIo5y74CfO31xWC19zwDeeDPLclL8KOutE71V22ObKSpaq7fyaNJqk
	zfkl7artngLUqDI8pDrWiGMOaStbbEdd1HIKjnqU/4JBcy6subHPycsocB/cVe09
	wsN1gIVjf4PUJhPMt+nZ2Jw0vi54iUng/MmiY6eeUtvUVncr8VgU6zoxm5Fci3ws
	zDL8L14gHTj7GjHeg/Pb1FpJTPO1FWzU9Ew==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c894g2pst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:30:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c3807c0ed30so1527084a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770802254; x=1771407054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3B/G6YIWco8juD+yFfp35zucDDDlBC8XbJKp5h5QfRY=;
        b=cCtXhe6bfJEG+HZphxDu8eScgqse/ZsX/Nq/i3OZ42nXtOd1i2zamCdCv6mXL1WO9R
         iPm5DFfYX7H2+B3brukT3Sq1I0OWGqx6IuhNHepqbQZgDatc08RUH+l2itcHtr1bQMKH
         rKTEvKPigwYi1mg4bRe4B5gwxhfKYzqXEeqN08hqHCc5Q0pujLYbf5ka5xqzN2O9S0Tn
         0rfyxY8yfqAKTAzVYBJ+/wDALXbpdRcjsa/fckFg2IlVOzFTCDrYsbCYgP/AzRcGmyMB
         3pSAJFZmg+V8YlaQyuxZ2hNIve/kcSfdqnQ5HwE5bX1jhO2X1343lznRxAk8de/6K7dF
         eWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770802254; x=1771407054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B/G6YIWco8juD+yFfp35zucDDDlBC8XbJKp5h5QfRY=;
        b=BBez0jhV4hnStW5KOpDQDbnS0ThqcIbJfroFn5H+yvV//FUQNG1L7ft73VVQK+SgC0
         I6aXjYAgbfm9+AweZW+9HkmC7AeL57bUAMPuhKQs033tlEFjqXmrmMJEpr/8rmwU1w/+
         6adLZtRcK65TnpK6wKwFmN2GKEeVv7W90/D7897vbQd5ED4CvFgpYmmavAfFaoJK1TEE
         6udwsRUTh7jTzMML8wrYl1NYIaAEejJ/iW9bpxFpSHSw5HO8aGNs9Pxv4jhNb9WsIR4c
         +Fw7EaLA9VvpyIb8cKciOyJd36cw6AxBZbjbwYP5f2fzbXeu0yE4B64k/f96eF1nlEgZ
         bZ8A==
X-Gm-Message-State: AOJu0YzFjd6oAvGeTf9MiCQPGgZgtQ6pdOH8NZEaWd2PipcRPTYiiRny
	TNLNWyyx9ClvoRZWf5WyJf268FAQVIkVeB0/ELsDMdEaafdMQKzetme5aO/+8SF1m2eRurWwj1H
	cysKOQ8L84MXszlpNeQJET9T3AkI/i+bwVdp6wcHCy0G4139vcFodhGhJZ1WlA1AkJJY=
X-Gm-Gg: AZuq6aLtzaU4n5pUVfRAng1q78RdB6vRa/tdfoJHFVoJlGijsQVCIDEsr7ERt96gLeR
	h6JYnR16Th1p0e9FO1Dal6UVxw93djYTqDlu1KOmKbU9IwQY0TK4+/Q7f+8PVvxyqhk6Kp4eaW5
	fzjHMIp8pra/o5JxFJxxMD0kekTgJXYpu3gkW2cI6j1TtrO5urtT58Wvhq0QIJNe8ZjdjfHncfC
	/Gf/9VQZq24ljWNLWNYjQFLynJo66GxBeqXeTMunZ2nrY9dQ0/w7HFIU128D5jTgH1xqxFBss3h
	IJlN65ub6vhAET/DhKRtqkvIVufOVLOOon7ZaOIsEwgBEMU4+sIy1B+njSD4cArOwfG19UQnBxY
	N6Se6vIgNfp/AYNHvQA2ydfZmwtIdNjTuRdgn3zE3d1HMfGD906BM
X-Received: by 2002:a05:6a00:99d:b0:81f:3940:3aff with SMTP id d2e1a72fcca58-8249fa84808mr1102203b3a.0.1770802254511;
        Wed, 11 Feb 2026 01:30:54 -0800 (PST)
X-Received: by 2002:a05:6a00:99d:b0:81f:3940:3aff with SMTP id d2e1a72fcca58-8249fa84808mr1102180b3a.0.1770802254064;
        Wed, 11 Feb 2026 01:30:54 -0800 (PST)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3bcdfdsm1600046b3a.21.2026.02.11.01.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 01:30:53 -0800 (PST)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V1] arm64: dts: qcom: hamoa-iot-evk: Add SDC2 node for hamoa iot evk board
Date: Wed, 11 Feb 2026 15:00:45 +0530
Message-Id: <20260211093045.2595126-1-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA3NyBTYWx0ZWRfX/RFAFYHPDLv6
 6+UUP56UJo58p/LAJgaRUrFI2ILBzvS6aL7DzzVwHxkTpjUBBw2BzdOu9wWQLwkTvuvHUCz/CXW
 FsycFc0lnY9Sw7YKVSaU5kKks6GQXVcUIWmUKJw6SEMyDOFW89sSGMTreq6j5SJQQupEz0Ipjyb
 vGIMaMATbJg00iSgwfGId82d8QctGoN0FCiK1QHCm3DRxg//TYRYEZaUzoZC2QWXvg2obpHQRYG
 6yET1htMRz/7qxsWgT/JY4J80yQbO/SgmA5pSBZ4Mr0I3u8ITTU/EUPIo8IZEoH9j8dzdTgp3M7
 ZI0Qs7FFLs5dufoYjvQTO6fx6iR0b9rPH+V//VBr7CkBIpej9lLDZp9TuOCgONgM5KXYZCYY+Hd
 T4PyI+YtgA7Vny7LTBrkeebuog8mrPcsTSj3PHSKaWoeR7XtCILIvF4NBank0Y49pffW3QMJc89
 U2h1hBdS76j95TpwTgQ==
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=698c4c4f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=ZtXvRwAlPpC7nlbJvkEA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: sDh1fnVusOSt4oWZcz_MMKn10bbG_nNr
X-Proofpoint-ORIG-GUID: sDh1fnVusOSt4oWZcz_MMKn10bbG_nNr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 adultscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92587-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sarthak.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BBD6A122C19
X-Rspamd-Action: no action

Enable SD Card host controller for hamoa iot evk board.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 2390648a248f..56171e832e8e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1144,6 +1144,22 @@ &pmk8550_pwm {
 	status = "okay";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l6b_1p8>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &smb2360_0 {
 	status = "okay";
 };
@@ -1326,6 +1342,13 @@ rtmr2_default: rtmr2-reset-n-active-state {
 		bias-disable;
 	};
 
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
 		pins = "gpio188";
 		function = "gpio";
-- 
2.34.1


