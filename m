Return-Path: <linux-arm-msm+bounces-93694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL7eBuxZnGmzEgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:45:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B822D1772FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 363683124FA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF72260592;
	Mon, 23 Feb 2026 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfSAIr3F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIfoPGoO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BC82472AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854018; cv=none; b=bKm6xGHekh1IRXYKQ4mYwxNQImsqjSjnSERI4r/A5phddVo62dr6GpGnTtKxXw3WqoN4+S7jnDNtfatkwvNnKhhjowmaqROuVYHE4N08O7STz24Z0Qh90kbG/2upYdt6IuF75eB9uiB/EYtZ0IDD3I/jwfM68C/R7VMnROwKvpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854018; c=relaxed/simple;
	bh=cvnnoa9TUq1edsza/1iuku55/7S7VzMksVWv+y2617s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H85PwId6fJd8ZX+FgbQreBFZLkmJttJTwkjMQA26KzGDGulKJI5d86QXTNxBJBHLzLeyJ7NgBwBOOtyhJMXeEgRKek681Q462txUB2zUBwsNlfy+LKDJresUQVvhj4Ie5RLFUfjbDFoLfVkpGNEozaLJtMTbGfOQ2qjRBz98g/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfSAIr3F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIfoPGoO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYa1x3409320
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AyRTUiWDQKH
	zUMBCBzmWvBSqZuwEfX09XlO4fd3NbmI=; b=bfSAIr3FumL9RgkGplkaIZPrFhJ
	9pUkf/ocd5mIdh88uqNZQLoqoHCR3OpugxV4FWRUA8aJmfDokH2uan6SFiusbx7U
	t/O9QrgrMsASeh5jms9rC7PN4KYZCj+SAVfxlr8jWDYO1iH8ZZckQdQyrxWeuqKn
	GH/iHRKeeU9p/vuL1uyyD7hWcw4ODRHV9I9joUHklOrq1m7yq53eTkc/70i5szLS
	iqXVFgpE0GF1kZCZPttRNAqKG6snAcuSgkiF8emm3q/jsF7pjMB7rE9qfUfdAshZ
	kcpbaQqOhnP9K6nndQbGbSnzdGuVZ2Infz9SudstmKRBgwWSmznKZ45fGIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8trfw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso1721592385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 05:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771854008; x=1772458808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyRTUiWDQKHzUMBCBzmWvBSqZuwEfX09XlO4fd3NbmI=;
        b=CIfoPGoOMg62vC+H5Qq+WNwjlQZjPBexwhKQuxRCWBiZrmgRXoxptLoiw+cyWqOQgL
         wX4AqQKvVn7QZ53PUfoJeAS703l0FOwJtc/x+p1nhjBqv5sKyTt3dadgPmCVDTjFobPl
         KGANvZVhjJ5pmaH39IpeYXuyLICTVTHcrzJ8TLfg84MD2UPsc2MANDPQOyLFMkevV0Ep
         R+cZ0syjaA25fu4hBhHEojus3nunLbIFd+Gh7i/Bk20qz/EXBmf4hKiQOiSLdU4t9HgJ
         VSeqfIIBiiLt+6MZG0kLodIpnJhU9fsVtMc+QkkZAY56WNIqhfj7CG+pM4d6Y9n8DcGZ
         5gOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771854008; x=1772458808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AyRTUiWDQKHzUMBCBzmWvBSqZuwEfX09XlO4fd3NbmI=;
        b=op9cAiGVQdoHVr7tymmc7dj9rU4vWJZNVq/yR2sd8S0cI7H4D+lgNUFic/Ck70etTI
         OK1X9tupNGNlSMqbM2wjGjywntEjT5B5ANwPM4IFq/QjQPP64A/sn/7NtvJ0YP6sLevJ
         bY9aU21uiPH2z0OZpux2dgn3Bgj+ai4fBb1lQ9/Q4nKavSOAYehhL9j4TBjeNq49/YuQ
         eBZduzuEoKCPpiy7rv5swaoDduYG03v7sKeM9YuqR+kloYT/86pmXnSs6C8dPceu3ogt
         Ea1Ee9I9fzjKuj2wA15O9l30MUx1kVya/02yEj2QWQssNY8naAm3gzceeXE3VrTcqLcG
         3XyQ==
X-Gm-Message-State: AOJu0YzBdzGxbkepfwBJz/EolkfrVk9Il6+nIzTpRGFmmUCwYC4GKh2A
	0fvLGR8JznmKHeUxlSglbHOMm1O+VYsvsq2R0Jy1/bV4M/UKC7MAvvr9yfDREsUHurkPdKBnYTm
	vOM1VqnsKXqa3poQb2klNp0U6ra0XsVogZDiXJC7PgxYcRrDUS7rAuH/eawDZF4UALD6M
X-Gm-Gg: AZuq6aJZff0N5TVe+h1RSF7vG8WH93WPTuw4VRriTU4tO0CM6QR4/Qq/Iu/dGxytPfc
	csvBI92NSppd02XTA1rAKR6gxKL9u+KSIbTmXQ/oaxu6DhRardRguhJ4NnLsdxzk6a6BQrLwKkN
	J0fbtYK+WONo6Z9RvXXxDo5RYTwefZzY9R7h+yxxRqV7jgq7W17rxPn+BgyFERj1e8HFtAkdl3V
	mux88htr0I95Y8M1V38/Wk5/rYX6CSvmGmtyzkVl68iNHHWWWhF/Qn7qkoaiOIZ3fBasinB31AX
	LtOEudLXzsQYPwuX8yfCQAti4BF5+9Tycs+om3Vi6fte5WwcAQFNC5K9GVXkt+XPUeoCn2NeOu3
	+gXBNYaDyvQCg6JBY8PJOVIB7jgIpv9SLfcTNsBk82c+MuV2rmMnKbBE=
X-Received: by 2002:a05:620a:f15:b0:8c7:1ade:29a8 with SMTP id af79cd13be357-8cb8c9fd18cmr986460585a.23.1771854008080;
        Mon, 23 Feb 2026 05:40:08 -0800 (PST)
X-Received: by 2002:a05:620a:f15:b0:8c7:1ade:29a8 with SMTP id af79cd13be357-8cb8c9fd18cmr986456485a.23.1771854007560;
        Mon, 23 Feb 2026 05:40:07 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c626sm21323985f8f.28.2026.02.23.05.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:40:07 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/5] arm64: dts: qcom: agatti: add LPASS devices
Date: Mon, 23 Feb 2026 13:39:48 +0000
Message-ID: <20260223133950.221234-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=699c58ba cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=OKQivFIISjCID7q7bPgA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GbQyRQkGqjC5fmJRqFp6Cj6G5DYqRGMr
X-Proofpoint-GUID: GbQyRQkGqjC5fmJRqFp6Cj6G5DYqRGMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX6USzTol158QG
 u1nxaNLEsgS2wNwacQKAYGK2dm4hl1ec/9QEL4tCAe3N3Iobm1j68VaGAjTWuQkuNl6Nmt41842
 AHez98XmmRQWUjvn9U3D73AIuzf8KpWEJUcLvO7Dod0jve+bwAI9ygZ9iQ6j9hgDgfiZIIe+t3v
 qEOqw5dI5qhPv4tBXDc0tgo3enkKt7GhdzpmQkF2pzn3tCchhn9IRR9zQyOPqc5IUdrt7XmlBP5
 VCeIwop1NVovst5I4VQqRjmwxGfIuVRiqi+EQszewk04ZLlWp8Ocf8CeN87z2xwWn1xXkxVjRt8
 WwDUmim6Rk3SIdScpq7jyH71EMGEl6MuxjjdEXk/pvpd0KCl9TYAZ94qMNwsqrL8RsPVPIzj2i2
 eX44GWsby/9YQOr+QoNv/wHB4CWfWlDfzNK+bqz1W8Qt65bJIBVqqVVaPoDrwtOFjx8f0JrZmcy
 nDMd8NV8yx4xhfF3gRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93694-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B822D1772FF
X-Rspamd-Action: no action

From: Alexey Klimov <alexey.klimov@linaro.org>

The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
controllers are required to support audio playback and
audio capture on sm6115 and its derivatives.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 167 +++++++++++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 76b93b7bd50f..e59a1a87ee0a 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -758,6 +758,42 @@ data-pins {
 					drive-strength = <8>;
 				};
 			};
+
+			lpass_tx_swr_active: lpass-tx-swr-active-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1", "gpio2";
+					function = "swr_tx_data";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-bus-hold;
+				};
+			};
+
+			lpass_rx_swr_active: lpass-rx-swr-active-state {
+				clk-pins {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		gcc: clock-controller@1400000 {
@@ -2188,6 +2224,137 @@ glink-edge {
 			};
 		};
 
+		rxmacro: codec@a600000 {
+			compatible = "qcom,sm6115-lpass-rx-macro";
+			reg = <0x0 0xa600000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK
+				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK
+				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE
+				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr1: soundwire@a610000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a610000 0x0 0x10000>;
+			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+
+			resets = <&lpass_audiocc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			label = "RX";
+			qcom,din-ports = <0>;
+			qcom,dout-ports = <5>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+
+		txmacro: codec@a620000 {
+			compatible = "qcom,sm6115-lpass-tx-macro";
+			reg = <0x0 0x0a620000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK
+				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK
+				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE
+				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_audiocc: clock-controller@a6a9000 {
+			compatible = "qcom,sm6115-lpassaudiocc";
+			reg = <0x0 0x0a6a9000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
+		vamacro: codec@a730000 {
+			compatible = "qcom,sm6115-lpass-va-macro";
+			reg = <0x0 0x0a730000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK
+				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE
+				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK
+				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "dcodec",
+				      "npl";
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		swr0: soundwire@a740000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a740000 0x0 0x10000>;
+			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&txmacro>;
+			clock-names = "iface";
+
+			resets = <&lpasscc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			label = "VA_TX";
+			qcom,din-ports = <3>;
+			qcom,dout-ports = <0>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x02 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		lpasscc: clock-controller@a7ec000 {
+			compatible = "qcom,sm6115-lpasscc";
+			reg = <0x0 0x0a7e0000 0x0 0x12000>;
+			#reset-cells = <1>;
+		};
+
 		remoteproc_adsp: remoteproc@ab00000 {
 			compatible = "qcom,qcm2290-adsp-pas", "qcom,sm6115-adsp-pas";
 			reg = <0x0 0x0ab00000 0x0 0x100>;
-- 
2.47.3


