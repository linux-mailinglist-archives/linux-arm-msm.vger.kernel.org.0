Return-Path: <linux-arm-msm+bounces-104059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAXsGOSY6GkwNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:46:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2307A444316
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2C553027082
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D89B3C3C00;
	Wed, 22 Apr 2026 09:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRfczsno";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnEUZiFP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37583C345D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850776; cv=none; b=i4uZB5klBwTaw4OY6MfcOLCprUta3gkuLgNYhR6bVbMJZgdUm8YudoZBHDaikbWsQkIoiAK7sDoR6yC1YjcF1ZIaoWyeuAWc6wwCp6yLczcPIClKdnA/EBm/IEqr0Zo9kL9wsSU1jKMmyCHo8o2OC/XhVP5eHKqYH5x7n4bMovQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850776; c=relaxed/simple;
	bh=lYBtb/FXLnrKMGDRY9R5zWWqwoEjMD1L30jny+RJLSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cY4UiZ+c+6x8fzSL4U6FHSjIz3YsRimAeK6Q1aBdRr7BCNje5H5iLzrwCZdHAnFvZVpw3bjj40o2t5zM8JsnkTzvRBdLOYGTznSbjfKxH+e2YE4TJqdLYvyI5V8s6r11+NL/gxFcewm8yLRoT2gvW6ewGjPGnWbx8ovRE/WmX3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRfczsno; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnEUZiFP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M99Enx647484
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=K+FRj/TOjFm+Bx5q74z+YlRnH1IU+JAqkB0
	bSNcN+l0=; b=LRfczsno+Gy73PGx/ywrfzaDoeyRo5wWkJgMKsVePg2bBXz1efL
	egsSWS4rW2tIT2I//4+gP9cFGhPQHKrCppe58OjOwOadzVjqzQWL90kWuNQyqojY
	3/OAuFX2txcOBGSBPqCZzQoAa8umqlkHgY9H/1aRGsUP56tY339xRK+14jIbLBBT
	VAocVtsjrUdfGAuSrdJCgAccRl1EvOLrsZaazFkIMEZAcpLQno6M/7JdDSKljqGB
	rHpIyfSgDiNL/I/2S+x3XkRtHwmOgnfXcXa31CI78aT9WQkVoBuwe56cW21NCvpA
	r0RYCOChN/X4VEtfqdwqSmACY92cJUnDFJg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenkaq7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:39:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso5626932a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776850773; x=1777455573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K+FRj/TOjFm+Bx5q74z+YlRnH1IU+JAqkB0bSNcN+l0=;
        b=ZnEUZiFPTdP7zF/hc/EDx3+/J/pyoeCX7HiDdUT9YhX+D8MNrTazGThFRFOdfkSj/c
         L1Tp9JqQJPG7eYCXA/xUgvdUND99SEfazVXK/NNf0hIoJ5p4KWXciViNJn5ARUpDFEZX
         wIIAHkKQYfrnSbXwjd/M/UY12P4mb/Y4U45vdiRjVEdBRIEJgL5LTJ21DUJu533BVdhg
         KGzAHUHRh6sZbkUgMnqc7VjsIWI2rBpwaPlm5/liY891MQj40ZVikH9kYylRDXKTDlmR
         m4rnKnpJeOjpCMQofS8hHDtkKUOtdVTbsl8ML9Hqla9bHHlxlATsu6QjQPJmIFjiroeq
         kDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850773; x=1777455573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+FRj/TOjFm+Bx5q74z+YlRnH1IU+JAqkB0bSNcN+l0=;
        b=neXa/sUJgYpIvnz40FezjGJkCLYKENoNaH//K4LIAvhPEna4GtrZdjCkKwNggUr50t
         RZXCVzPVHS7gJUS8NUU++4mnrCe5fUhiZ0a522thhU9F2VZJEkW/GKafAP308CCL6R0/
         AtFHbByqSMwuPLbAw5F3c3BUOnyyj+8bgMvKjS51jHUukCBvNWylPBXf/PFxJlWt2FNy
         v+FSA6EjfFzyePO7ak9WQZJmweg/ZXEgjI+4WvZegrMjQJiz6TM4glG4oJPXhnahWCCp
         b+fbDq9HJdvecFiKx5JxPYjSqJDSfUMkijE1AUHSnHnHVoooFZHa+rzWF35dLvMuXEm2
         a5IQ==
X-Gm-Message-State: AOJu0YyD/htdHgsxgZ/Os6GKitH6yPlBr/g3STJXOERPh3Pj9eiJpnDq
	2PG54SG+R2Vj1neH9VnUUV837w8hDUiYlXWhPY8Vn1v6O3KWog1iSjxr9eAi949q3CInAyDwSag
	RnfB5Xk9/0QzQtTMhG2Ck7/lThIoMsQCUzYvzG4oBs772JmOeaLyc41JsH1C07cQLf1Wi
X-Gm-Gg: AeBDietLvuToz3eA1YmTPOXBWPLLhjbJtoqGRfxUNWnjUncOJUb82mawiiaSrFOtUQA
	gdYdwI/ROduIp5o1YvooLWEw1+RSgB5/mh7CWlLatNHIbxkiP3BdWqBLQzbnsjxvX85GJWBPBPD
	brPE0kBHgDiUuqGtYn4z3BLhq9j8/r3stAXYEP0wAXUh7/wyyenMYSQfjfJq5CYK/Syk8ZJHWbi
	n3KItAXljg1lKbNnzQQbesKIRE8k50mknWAQr8vo79G8bQcGW24RvwNStQxzYeJrbXTbli5+AGK
	J4bPrE64zM+3guBKUwvx6alOdI8QKpdqMiP2aY3+3yY/b+8g4Ax7ZaNhxPId1br7sgTFNBAdcVE
	ztyc7o9lizPoMV39B+8neOHjo4rZqDuDFL1DyQaDg4B0Kt2hfQ3MbnKcaKY4m
X-Received: by 2002:a17:90b:5203:b0:35d:9560:3efc with SMTP id 98e67ed59e1d1-361404632e8mr20112389a91.14.1776850772401;
        Wed, 22 Apr 2026 02:39:32 -0700 (PDT)
X-Received: by 2002:a17:90b:5203:b0:35d:9560:3efc with SMTP id 98e67ed59e1d1-361404632e8mr20112345a91.14.1776850771789;
        Wed, 22 Apr 2026 02:39:31 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361417748aesm16097037a91.0.2026.04.22.02.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 02:39:31 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable retimer on USB0 port
Date: Wed, 22 Apr 2026 15:09:24 +0530
Message-Id: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _5C9t-UE-W2cThRUdy4rjgagq06lXOpi
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e89755 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UU6esRB091ZTEFAXl-wA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: _5C9t-UE-W2cThRUdy4rjgagq06lXOpi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5MSBTYWx0ZWRfX7NFxNhdVJLjQ
 JO2nGGzH5uf7NLtXAO+UyfR4Vo1IONcFd7q7WKmy/S/B96dFQFr5e4/j7U++5QkgagZ0HETOCk8
 YwP8tkXptFbQb3Sy5mFEaah3o+rBQvwQ32wo9jHHjTzK3X5YDa649pVWHaqc3D5S5MCocahfI8m
 0dImwiuPYwp4rNp39ZjvZsaWsF9Obf5NY5U28PSTT1TZQiYk8+Cw9+VE87grRIK1jzdqmJw+NF9
 tiV5FTiXwOD2uLLo9vu73YDUF8ys8Q+6nPWFFdZXaNePTQvilVFlbWCLjyNaN280jF8z+rpSoBS
 CrQn0M3RulxMZMHVMZ9rx5oNI9M4e9LXPE7uRBNB1/7LEcKQhQCnAkHrL/Tlpjq6Kvw2cVbTEBi
 VPbWD2d9ga1rLby/2PRDNcE3Gzs8lpzWSBI301tEGvMiWIboMpsh5njmu1C8JHi7HqH3LViJPby
 SOooFZZGt8nur3DwFUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220091
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	TAGGED_FROM(0.00)[bounces-104059-lists,linux-arm-msm=lfdr.de];
	GREYLIST(0.00)[pass,body];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.354];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.8:email];
	FROM_NEQ_ENVFROM(0.00)[prashanth.k@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2307A444316
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the retimer for usb_1_ss0 port (USB0), in order to enable
super-speed enumeration on that port.

Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
Cc: stable@vger.kernel.org
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 54 +++++++++++++++++++++-
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..a9ad05bef5d6 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -118,7 +118,7 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+						remote-endpoint = <&retimer_ss0_ss_out>;
 					};
 				};
 
@@ -785,6 +785,56 @@ retimer_ss2_con_sbu_out: endpoint {
 	};
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x08>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK3>;
+
+		vdd-supply = <&vreg_rtmr0_1p15>;
+		vdd33-supply = <&vreg_rtmr0_3p3>;
+		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
+		vddar-supply = <&vreg_rtmr0_1p15>;
+		vddat-supply = <&vreg_rtmr0_1p15>;
+		vddio-supply = <&vreg_rtmr0_1p8>;
+
+		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&rtmr0_default>;
+		pinctrl-names = "default";
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss0_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss0_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+				};
+			};
+
+		};
+	};
+};
+
 &i2c5 {
 	clock-frequency = <400000>;
 
@@ -1541,7 +1591,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
 &usb_1_ss1_dwc3_hs {
-- 
2.34.1


