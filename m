Return-Path: <linux-arm-msm+bounces-96100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAwTGjMIrmkG/AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 00:37:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D70C232B8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 00:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EB06300909D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 23:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1879C35BDBE;
	Sun,  8 Mar 2026 23:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oShP+5rk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TylCoCVO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A871DFE22
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 23:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773013042; cv=none; b=AJcyWrgs8hHQwd+zj6M/mio3LTpY3EjMq8VqGEl4tmaYwLh/0IKTzhLxc9McT9ETaQURB/Ib9/u73deaIPdZaYMzhZQpDMYE4gKinSgUUgniVXE4Mia0mF+1KuDcYRulKNZN+qZxZCToXXLev9X7hzdyVK8/6VM1ThFtTtkpRKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773013042; c=relaxed/simple;
	bh=sWB/MCTZF0QRfhii15yqvoLZyv0Ws5yxWGh7O7kBK4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pWFWDVimFnBBLLiY67H959d0uk4hxXF4GqTnArvPI4Qy6kCyhoQvHfL7MWS5WTYOUT71Xw39OdC9bgDHJ4F2RO4GOZpCfTXKHh6UnNqFbI4Q5buiP2IKfwynsyL94XsXSbRF1zOUY3/MwZon8eMtZziWw633ALfn5va7R4SJKIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oShP+5rk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TylCoCVO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628BDj7j2986038
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Mar 2026 23:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qfGr5maJy8e
	2oTmsd+kPNeiWt8WWcfirQv0+zbNNfi8=; b=oShP+5rkxsl6e05+yC0tgLORSr0
	FEzdxGAa3QJp+SrnWEzMGMWN/JxYDmslKzAsuAz8egvHVbj5cOLkUR94/+y/P/lD
	mf24Q32/AgNsJ4EzudmDm0Ja1BZNcjIJHQ1HXKs4LxuPQXF6I0PpILvKTqzDUVTo
	ShcAVhBenzITlkJvdAL2hcD9mGz5SrtOu4VSPdIKd3WdsB4kwBtX25iD4zdSRn9e
	RXC2Ktn+vtHxhAeVVF/l9VeY/hThg5qBWC6HOc0rPYpMt1W7Jjd6ctxrtHeH13Ft
	9S1xvm7aQexsVSFd0uFLHmOm6RaSRiR5StNuNigGIVZqjaQ/xvLFCsa6ELw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vb8cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:37:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4af66f40so82343225ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 16:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773013038; x=1773617838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfGr5maJy8e2oTmsd+kPNeiWt8WWcfirQv0+zbNNfi8=;
        b=TylCoCVOKXTq9t+ML6eYNpc7nAmedst4mHjyApJUU2BS1hwukp8OnNpjNr7tFhLyFx
         sTpHrNhrCJX4DxrSV28UEZCuvGA6pwkjEBt7J4R6o0vRiA36H46mOl07NSLdbR/t4u2J
         LPTuL5V8pm0uWJbBapEns6dx0z9PvKy54v6kR8+f1vo5Dhw5vNWhHueh7qx4ZFjqNbVU
         42I+2IVJbaz7waKuziuUP6C/+B67d7WnEgsxqAlOdmysjzE4LM6AFxJDn/xfKCt7RJd+
         ktr8sMdv0uMKYR9pyohU0tIusoysBpvagPzwWXfmUxqiO65HNXo4FICKMVv8K0DlJXSY
         PoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773013038; x=1773617838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfGr5maJy8e2oTmsd+kPNeiWt8WWcfirQv0+zbNNfi8=;
        b=bBtsO1mR40BptqEnY/a0ht1XF8uZj6tiXiam3xoMuQGwADaQXYyjBOPg2K7kUu0+Ma
         2kX5G17nGBdArJfZQwRSMk6YremJot/wOTHpOcaWlnYHaxPIw9KxdWxHAmXgcbp4b3MB
         xqV5OaJZuBTwMMN9HGuC3GdHBs7QqDv3PFfsBaJrioCHPivJhBXlHO8tegr7r/RAIrxs
         83BpxURrc86tRzKtaqOj5VawdrsTrgMzt/HQlFecIZqXkVqPOOPPn4KhnF8MpDZ2gjv9
         RTEEFsk/g5oanyxLieW6YxCZPjYdtBUTHOMiEOMrG5oZaQ08UPMZD77JWWq/63WMJebd
         Td0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPchzBYzBfeLx2vOm4kdX4QBrH+LAg9Cq0VqlPAjYwS8/QpXDDZ5P95CEKcLPKwm6BrKq8P9s989RGzV8l@vger.kernel.org
X-Gm-Message-State: AOJu0YyRxEeAXrrr6jB54X5U127/KIs3gHCFYicWAwFf/381xb5dVN3i
	SOqhK6PclzvmQY+xx2ysjZPn2AHeHAil0ZGjmovy5ZRtA9bAeG3H6kgVKqA+7Suq8cZNCWPNY2U
	XZiVa8OCKhFAH+iYuMcBQCIFo4KePx0DKnlO2+Y8/IqzOZmsjT7idrT4uJ5IgKI2uH/fr
X-Gm-Gg: ATEYQzyA9VwqIi3kPwLj26EvqhA9qCF7uBp379lXVyUTudxpdbuWob+p33F5P+Ygkhv
	fAOw+PbZ2kXU8pD2W7paSjRuPHdMxtFzw+nb4HBnY7DVOO3G9NWqUj6rBbortc2VHA1IZkC0Yrf
	XSxihO43b+2jtirDfu08bENlqNWY93HiLC6ydUgMmkHk6TBzRWnlXDBQE9zyqfal7go0JgzU84/
	IjmcutIFa9rPzKLnws+/OpNAwOQD/TL92CH1h2hEsrlEkr1XkXbC1jXjhjBQF3F3Yp6zk447pf/
	MHPZqHezpZAxpvxIj6PUTAABVnKKJGHVH6bP846BAqDccRBgwRMC+fX85oQhEQ3Bpz0a3K6Am8n
	/4b/VlBBH7gu3OTiepzUpIvmdoNxDpt/dpt0Vs7OSwli7fZtXzDc4Kp9/ZJ2/5xsaoQgAHgfWPS
	RPNneq+kTQITHYhgduA9CXzksBzEC1I+3F6tAP
X-Received: by 2002:a17:902:da8a:b0:2ae:450c:951e with SMTP id d9443c01a7336-2ae82388a53mr82981835ad.17.1773013038532;
        Sun, 08 Mar 2026 16:37:18 -0700 (PDT)
X-Received: by 2002:a17:902:da8a:b0:2ae:450c:951e with SMTP id d9443c01a7336-2ae82388a53mr82981665ad.17.1773013038074;
        Sun, 08 Mar 2026 16:37:18 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9ad26sm114274845ad.28.2026.03.08.16.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 16:37:17 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Cc: conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH V3 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node
Date: Mon,  9 Mar 2026 05:06:46 +0530
Message-Id: <20260308233646.2318676-6-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CEIdCQSyeNnFGnkmtoy40tZDgVJ9zKZ7
X-Proofpoint-GUID: CEIdCQSyeNnFGnkmtoy40tZDgVJ9zKZ7
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ae082f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ltsv1nNgzXx585P2vnAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDIxOCBTYWx0ZWRfX32pE1XJuAKvm
 jJO3RmKDSAyuvL1hLVZF79C4cqPfMkXI9IfXYa/dCfdyECB+xk5bxDWYsQsIhOmdXZyxiyDgdMR
 nRm0FqxNaVFTqPH3KVhnIZPbwVhpoCU+bK/32zkOvKsORVSG+lwOmt7iLuewFdPTmJlUCGzq3Vp
 2DN9UVmpNqlwOkOcicWUdw9cGpv1QMk1lIaKsmDI4PTV8Cf85oVJDxyf8f/kOJyDTS34fOAs09k
 Wqx7xBPKB9ClscwsP1GwsR9Z+HXCVlfvC7tZ5pXT8PcygiWVNzCaiD0ey32WWUUvImfXVIJMEsl
 8TIxZSpjs9U4LyRtFB/oD2nZgv6rESZhKIBloI7yG7xZBVtFbiS+KltTeBUe8gMZrBzAG2jrOo2
 O4+6SAmP0iIgdJBcHOBd18bEhcoerc/Dy8nXak4Pup0JqQWEf2YY4mvM9mTzIzcMd/hO7YmB5Xv
 ybAA86WNHWee960Wbgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_07,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080218
X-Rspamd-Queue-Id: 0D70C232B8E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96100-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.76:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts  | 10 ++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 630642baa435..3cbbc4a0dfdf 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -799,6 +799,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index b8e3e04a6fbd..763399393daf 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -475,6 +475,12 @@ &remoteproc_cdsp {
 &tlmm {
 	gpio-reserved-ranges = <34 2>; /* TPM LP & INT */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie3_default: pcie3-default-state {
 		clkreq-n-pins {
 			pins = "gpio144";
-- 
2.34.1


