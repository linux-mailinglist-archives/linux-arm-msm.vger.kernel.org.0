Return-Path: <linux-arm-msm+bounces-108663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG5lOmSCDWrUyQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:44:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE0858B011
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD8E330F0D5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5410A3CCFD2;
	Wed, 20 May 2026 09:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jhlgwpdi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkABHxes"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86233CD8C1
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269973; cv=none; b=D1MbnGUOkYcMZZIWPq+fFTAV8h00P1RJDVAHnaHHDz/OKTWEiK6LwAz3egY8lFKI1+rB2FYuEzlTR7MwWyLXatxQtsn5rGMc+hGvPk9F380y3qSwCpsnV5mJEFkYuIZIsK/z/nfbcfLjh1pxtELe3jxDy+kUHkGqITzNtlO01m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269973; c=relaxed/simple;
	bh=fCVtkWGaCzcd6oD7xUuIczhdltfjodINW9Bm1UkPecI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTXZsL+kgngxdluMZ/vgpctgjwqiWA/pr8siTKtz/Df9HvanmkqjR7Q4EA3MXnMeiTKKFxh60ZySfPGIMW5bSNTcdggkNf1RugO6+ERiaM1a5K7XGLp72mtvNGf/xDnpVXVJWYiy+p9/CxVQ7y3oNxodiJiXGeUtygGtWQScBeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jhlgwpdi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkABHxes; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7IG6k341703
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Uuua3KjK+Zo
	CopIZ43xbqZUEKr2+7zx5nC3pz19xRf8=; b=JhlgwpditmYOLAfmURlDLqUhcyr
	1o2KQGNICi7Md6JQdkQ28oW3A9bei5ptwvOKmpGKhy+K4qVwtA0vsDipvz7ITTc1
	AZBroVUjukr2JlFzrn5vFqsRjhEYFgVJyPRb4CFyLuOjCTUpMfy7Bs2xNsm7c1Vl
	8hmqHOdJ/sYV8Im4xgFSiZhEI2DTFCAEGXkDM7hsD7vtH7YhC9fXLHbnIPpOErwV
	aJROh+jaUszkXJvpCJ4oKisw44V9Uu1QPWeWrOnJYRMA/ytA/Hy5YthZ/fWLkOPR
	WIniRyBvrX1RIU8FGjE9TeEjw1yk+9q0og3cN0Js/8oIhoathM04DQh31zQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3vc2g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:39:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4530a90fdso77430295ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779269957; x=1779874757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uuua3KjK+ZoCopIZ43xbqZUEKr2+7zx5nC3pz19xRf8=;
        b=HkABHxesyzHK0XnG3Q/kW5lzTVoH8PwMht9oVk1KELwJ/3OMN6EeY5BET9MJ8cHx1l
         GMkUYmsOCkk0Pxsc3M7tMdsTpzPljmO4wUAbGtvni5rF5QKO2Eitgp4s1VGk2gzI0f8O
         j1pJX2P2RXXRYWDDAd353dZsiGPDkRESI4VOk8FA+XxKYPpDC0KHODJOwQdHliXfS3jK
         6p27qGQxp9Ksnv1iUbTiczHLJeC6bGFaLaxvz2uPZrB45WpVhZr2oKvxstB8j093RUiz
         jr+EclV4YMI1SoWVwjWFOMkAztVeQ51fy7KxweQ1RI8C2N80V+uwhnqRUOEXaAcBuJb7
         luaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269957; x=1779874757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uuua3KjK+ZoCopIZ43xbqZUEKr2+7zx5nC3pz19xRf8=;
        b=UprElSkpoEOmdWNOpKLxtxcmWDaaZhC4F2UflnnE8JP8H2Zwx2Ccjy42nVqJBEpdkW
         BT8OSqx3x3j/SeYTWPX9coLgWqjMsG43ELEhGI5tWC8AcMFYfhYEnzY5UkOPXqDxLrya
         7VGL1T52Zmv0VY/72ZQgD79PaB7ieEqolZCIythldjEdXS3z6bcd/FpzvKS6GqHmsr5V
         YzEtbfypcla4ZSQKMyj3FF4TAsSLWLP0ZOYkTJT0TBiZBid2b+/yiTprpja2E+TYJCdb
         mnLtBmLLN9IMTI22CCP11JcHi+bDKS4UY3FAksABfJPlx+R4KF9n+z46HF6YN0+MKmc7
         Vogg==
X-Forwarded-Encrypted: i=1; AFNElJ/0vbHH9VOtQMF2kw3GV0167sQmvY4CUqqkxCJKzfSTX2QsH6PLGvMkP3LwGZaBqgItKbhGpVfPE/wob3/o@vger.kernel.org
X-Gm-Message-State: AOJu0YxjYronBGULHBvTgAhHY5a4t4fn5HTjSuIeztEFrV6tZ2kgi88R
	t+ktbCFeo1h+SpNWCVow0f6AVDtz+Oj/Fkbs/CloZsKp6w2slv/qKjSX95kUUNY3mykKXm504bC
	Ul/EgumDmgBcbvLupVCy8ruRmlg+2ZWOviGfgX8S1097DlpVzJWizmoFrNYZP/LKgPkXp
X-Gm-Gg: Acq92OEEAGpiO0RklAkB0qbF2HA7FcnDFhvonkWs6kKAI97eO58z4lVG6aNs3JwA9RP
	WRvhRJaIeVNYMrnwdjNmPkXR8nre5DuAvOppEPaQynw+TfjoaHcIp4YWjQa5zy1a/cvF2kn9XKE
	qs7tBlllsdJEpXMRobYEkBB4S6yCAh+Moun7mSOnBwpITS9Q9r+WwggJxVPCHwheZDDYFzaWXgX
	LInwytRJ4kMg1SPpeKrWeeT1J/IagIRd8ueZp3Fj+9iDaJ/AWFLOqHKa4LkfH3n00VPb9tQBO6l
	lqf7gFKb7f3FeoQPSrKoYfRLRj2hw6YGuhD+xd+ywQrZWZyAtZD4ZPJDYIAQHwyv31+Fd/0j3kp
	i10CNepeP3mwAwX5CiFeN2gew/brxGGfeIrZmfhJCw9QNUwJAKA==
X-Received: by 2002:a17:903:22cb:b0:2b4:63c8:ce18 with SMTP id d9443c01a7336-2bd7e83176fmr253997335ad.12.1779269957102;
        Wed, 20 May 2026 02:39:17 -0700 (PDT)
X-Received: by 2002:a17:903:22cb:b0:2b4:63c8:ce18 with SMTP id d9443c01a7336-2bd7e83176fmr253997055ad.12.1779269956587;
        Wed, 20 May 2026 02:39:16 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8baesm217052215ad.47.2026.05.20.02.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:39:16 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: monaco-monza-som: Enable USB0 DRD mode
Date: Wed, 20 May 2026 15:07:33 +0530
Message-ID: <20260520093902.2064730-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fRmazQ-0FDEC5DkgXAbQbiU82jYOjQxY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MSBTYWx0ZWRfX394zOZL0EhOL
 rJ4mtMDgBdzuXtws147Xu4IIrQtXjXcjIr5S5Y8aaViv58iyeiOwD7GV5iZp9njUd2jlRYQexip
 inRrAlImx+8lf1ZBhiQ4z/HkVcT/BYiY5LcEQCg5FudCcGT2SfsX1UvXK6oQUZ7vsT6czzjszZr
 9E8Uuh59HR1qUqM+CeLYpTE0mXuK4NS2/0gZhqeBRa1ietDNi8D2DxNngkqaxgc74Z2YXqrZlse
 tmYkaYMsdzoAufHUkdXQi7lkm6mmVLJhmSfohcLgGmGkbXc4UbkdSoUxgld7QPRFVV8lVe05zXS
 N3w1NlWbpzqOFxPV0ol0hxPuH6XT06lfNoKf0vlH3i0shuFE0wU7+cWpHsP1FWSp8rgbzwHGTYq
 lWJym6J841bY3CvHb1UFvY2xSVhnz1g202WalZjekhgJKqz9R357oZMogap5Zny7mFjEL1cXfIm
 j7bBJGNisz8KSy1ZgQA==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0d8146 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UkWcZxrghjed5wiBs1AA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: fRmazQ-0FDEC5DkgXAbQbiU82jYOjQxY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200091
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108663-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.8:email];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6DE0858B011
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable USB0 dual-role mode on monza SOM using the Cypress CYPD6129 UCSI
controller.

Switch the controller node to I2C12, configure the required pinctrl and
interrupt settings, and wire the USB2/USB3 endpoints for the USB-C
connector.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 9b5ed55939b8..8e3af6018dfc 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -194,6 +194,52 @@ &iris {
 	status = "okay";
 };
 
+&i2c12 {
+	pinctrl-0 = <&qup_i2c12_data_clk>, <&usb0_intr_state>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	typec@8 {
+		compatible = "cypress,cypd6129";
+		reg = <0x08>;
+		interrupt-parent = <&tlmm>;
+		interrupts = < 3 IRQ_TYPE_LEVEL_LOW>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi_ccg_ss: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+	};
+};
+
 /* PCIe0 Gen4 x2 */
 &pcie0 {
 	iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
@@ -227,6 +273,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&qup_i2c12_data_clk {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
 &qupv3_id_0 {
 	firmware-name = "qcom/qcs8300/qupv3fw.elf";
 
@@ -295,6 +346,12 @@ dp_hpd: dp-hpd-state {
 		function = "edp0_hot";
 		bias-disable;
 	};
+
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio3";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 /* USB0 HS + SS */
-- 
2.43.0


