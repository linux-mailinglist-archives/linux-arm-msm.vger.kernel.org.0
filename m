Return-Path: <linux-arm-msm+bounces-95061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMTIEJuYpmltRgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:15:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA681EAA80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4973230C589B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 08:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44BA387572;
	Tue,  3 Mar 2026 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdBke983";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqu5Id3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C7F38757C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525277; cv=none; b=X5c5Tsa8KY3lAB00XeU6Tcf4WJsEjz0fzShtFxILscVF2kcAb01jA3LWf1Yj1i+GRyeiXcAYrbRzZSGwRzfdlJz4rWGCFFFUcuCPCQ8KeB3kMf8B61e/PjCwJbTjc3c92eCXXjVlvCkcbPPnG0LrqVRM2OKmXKnMO4wzLGCpVJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525277; c=relaxed/simple;
	bh=YDQkfoBdQXcdfPkMAJWKhAgKaXB83PauTBPIGJadt8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FUleL/IzH1A61lnrAfvgkCGpfdNzURn82bjcmKEzn2G6McGzzDf+npN60JJtjn7rodeJitMS9z5/2lNfxspNVouyeK6yUQUQe1LEfcRG1i4RT49BIqu3hWWrOAYAhkV49FR+5qlmyuMZmz1DYulzWXmPbzKKA+4C0isMjItQdeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdBke983; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqu5Id3M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6236P4OM959358
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 08:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NeVTHLilPj7
	hzd9X8Q2+B8OhjSmUomXAGL0biT0VrmE=; b=BdBke983cOr1rqKV3XfvG9jZxHZ
	BQx4F4Yc8jVTXh/GTIlSjbWz2YtgEKiNxfysuIYMzxX1wom1fIQVotWfGxZGfoHk
	PDtfTCXw2QmMNyJczSTDj/9ob+duopb7ri4jDJtQ9TXNjqyodm6XkVLK5jzpotyH
	CRSCY4YlXGYFq6+DEgzTh1fyslMAk1Ggme3UdCwMS/xxbtuBVvFbe+9EwUbyGyYO
	wZCnwdUH8uq+ItvdMc/YWvB/y3HrrlNCT3Mf2po5JaNlKMu14twbOmo+ObnjgyGA
	HXaQ+oQZEQzLj8YWrrQ2zxmOlVLJIIbPfduLOJ3goBAVUbGK2i3MYRDZrww==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx59x72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:07:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35978cbc54aso1976255a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 00:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772525273; x=1773130073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeVTHLilPj7hzd9X8Q2+B8OhjSmUomXAGL0biT0VrmE=;
        b=cqu5Id3MvI2jnNGLR2vARTahfJAyxLnCMlnxWlTmAfunc0IccVrXZjfnf0pIg8enQk
         4OaOxhJ1D7Pgvk2mf2VRA5Rjmu1cxnMq2ZIREFpZ0meYdoNgWoVSe1TXfYhL3HdH0P+v
         4OJyoN6e/WQF3axgVW9KVCDW14SIKN2s0bABcjMIj7piQ+lgdnNs1x9ZfWW3RMjqBleU
         NMdB0bYBToFQXqCv2OeYg3zJ6SF4VF4ONi7jPMouEf0tWt63bG5IEImgCGcoksCc+01q
         p59PJt2dcUQ1HdM79dfULWXXkz69eIEQY0U1vnVMfOO6bVfxPnU8HWQO+sFt8epJiKok
         FZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525273; x=1773130073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NeVTHLilPj7hzd9X8Q2+B8OhjSmUomXAGL0biT0VrmE=;
        b=uxv/A0Ty8IPRgwN65sIaY+uUr2GAm4P53AXxvkaAH5/ygmlbV37hdNk/kufcrc5XqX
         hXuLoiQqJz6QSS5yp7yGOWrwE7Lr1ZnJEDPtUC+pX0lVGGMuWsBE+R6uw9wC9rWTYyn4
         TNulrBZOvlKEXUrLt0wxk0WEdZHxh/JYol8vZOHzMdQxGe+vGRA+FVsL2HSHIPIaBXil
         wIFcQ6BFrx1vS2lrUZYzF28vIEltCoIiwyB6N0M+LDAnFb6pvJppqTS4nqL86z2eWY9h
         g7PYsfALZ9cCPFkBLN1atCDCwS93tDpTDtBJez0uiqkeuifFbUtAjwdZH4YbQtZ6AEKT
         3nGw==
X-Gm-Message-State: AOJu0Yz1zuHzZOXvM2mhzLVuBieMpcwAXvuJRD1AKZDrngT+YFVdAn+/
	6nTXxTe8x8pcrrEtAmxfSvIxOq5QpgcSGzWWYhQ2HveOdPoRYEVt1sVrmmiP+HZQP98m5wCSbWl
	dNbVhp7JT+uAg4I3LimCUDD40Ulw0+L0XfZQTV9LGtOYmB5N4bW42ccBu/C4t2hf9pTSS
X-Gm-Gg: ATEYQzzL4WqvWbi9+ptdDxWuVYfEfnyStYUYIFGxsQcp2PfiqHFWtoz+98We0TNqFOk
	T82IflOJL6E75MiTI++YOZP3Jkn+jLMPGUwxOkMBW4CzhgMol/DOpj+TYYccGQPPTHhSb7wMgXO
	p1O0Tv7jQncftlbQ3k2RiGgf3C/Oy8C0WDuWN9XbvqVFwvO4N5f1OzTtlonj3WV5xAW3kWYdszq
	jx4OirbFMGxREGyQlng69ZzVi5y1kQoLE6z8tsvl4kMy1Xl6uEv7JICHfXFBxbG2Gt5ZHwvcAHS
	JI7/Em75fY4mwdTWhsrGSe1lMoqmH4vNwq69vGYegYqhSfT254k9fLy4yas6iva+xk1cDnuPD0c
	4fmg9TuD1OtGQPnhZDWdSIf1WfRw7CSV5xl145QcAzt+oufzrLFfvt9g=
X-Received: by 2002:a17:90b:3ec2:b0:352:ece8:1f6c with SMTP id 98e67ed59e1d1-3599ce32f97mr1227850a91.8.1772525273123;
        Tue, 03 Mar 2026 00:07:53 -0800 (PST)
X-Received: by 2002:a17:90b:3ec2:b0:352:ece8:1f6c with SMTP id 98e67ed59e1d1-3599ce32f97mr1227819a91.8.1772525272629;
        Tue, 03 Mar 2026 00:07:52 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c3acea3sm1445883a91.16.2026.03.03.00.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:07:52 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 3/4] arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller
Date: Tue,  3 Mar 2026 13:37:27 +0530
Message-Id: <20260303080728.479557-4-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303080728.479557-1-swati.agarwal@oss.qualcomm.com>
References: <20260303080728.479557-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA1OCBTYWx0ZWRfX1L2204dTMkVp
 +OM3ENIHlu0E8eSJhASixzpB4sN78CQ4VeUfeHwz0yS4nV0a//bue1NltbaTao0MTdnTP7/LZsS
 kthS0MZsu6yKuNS/7yr0oe7U6R5+fgy7mkx+V0RXljCbR/E8ca7eOA8ABx9ldP8Q1TZHdjGAilo
 1iNm8wU/dwB7hDSHdBOdaAtvI31P8GSOSqKsWNCDfoLCym63O4C3fDdaR1cIvzfkBP0g/8w86va
 sE0GfLd6Zo5C1dL1tK4UDni5j/SRdeZCZHXfhn/tTl8dKD7U4avkQztLMtG+xu9dqwzkynw86CD
 Y999pyX745TKQjpysSh+PqzmVJ61mLnaivqrrm6qEVTUgt4DcBKU3nmVY7aWZ0wo/3qWpa4paZI
 RGidZ6Nie7rkFmYBhai/HoGt1cm8rXnJVEFIWMDzw3HzLKMwbE/UnVqeZlfiA4Ra0iMO5lPQDD6
 veVq/emjgALmsXaiIKA==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a696da cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=WNaE9oMJOCZktHJ47CMA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: uYv-hNlE4cgds9gjPfmnxLnElRCC5e-k
X-Proofpoint-ORIG-GUID: uYv-hNlE4cgds9gjPfmnxLnElRCC5e-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030058
X-Rspamd-Queue-Id: DBA681EAA80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95061-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable the tertiary usb controller connected to micro usb port in OTG mode
on Lemans EVK platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 397052394930..2203967c7d51 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -68,6 +68,25 @@ usb0_con_ss_ep: endpoint {
 		};
 	};
 
+	connector-2 {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+
+		id-gpios = <&pmm8654au_2_gpios 11 GPIO_ACTIVE_HIGH>;
+		vbus-gpios = <&expander3 3 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb2_vbus>;
+
+		pinctrl-0 = <&usb2_id>;
+		pinctrl-names = "default";
+
+		port {
+			usb2_con_hs_ep: endpoint {
+				remote-endpoint = <&usb_2_dwc3_hs>;
+			};
+		};
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -132,6 +151,15 @@ platform {
 		};
 	};
 
+	usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2_vbus";
+		gpio = <&pmm8654au_1_gpios 9 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
+
 	vbus_supply_regulator_0: regulator-vbus-supply-0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vbus_supply_0";
@@ -719,6 +747,14 @@ usb0_intr_state: usb0-intr-state {
 		bias-pull-up;
 		power-source = <0>;
 	};
+
+	usb2_id: usb2-id-state {
+		pins = "gpio11";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
 };
 
 &qup_i2c19_default {
@@ -966,6 +1002,22 @@ &usb_0_qmpphy {
 	status = "okay";
 };
 
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&usb2_con_hs_ep>;
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
-- 
2.34.1


