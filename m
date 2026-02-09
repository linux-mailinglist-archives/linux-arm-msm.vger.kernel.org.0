Return-Path: <linux-arm-msm+bounces-92320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC5BBlzuiWn4EQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:25:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8EA11038A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80E1A302AD05
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 14:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBBF37B3F3;
	Mon,  9 Feb 2026 14:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdD2MTLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kc2FMS6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A82B37AA9E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 14:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647098; cv=none; b=Zvb/D05vIGFo7eIXDDIu75SUJ0Zg8ck9GiTM2uxbqxqacUXMt6d65ep62dIxmnIbg0cif9m+GWIdPsuposIZRZOTKMUQ831FpX9mSayrwipheWTJGtNGJZ0o8k0BKZF1WBbQW3xni8LhtCjz1zON+DT694zOQFdY5enqKyE36wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647098; c=relaxed/simple;
	bh=gRL0sXIZq/jW1AeN/YMrr7c3bkY0k7Dt0ELx7ODaITc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8R/P99U5XfRl0pHhe6IHxViWjLSbu7zLT04q4Kqf/m+3uARBZZHJu3owprv1WbcAer+kP3q/qF8i0AnG8yW5vsLMpQTdnItpBpioYvZG09BRX0R/mTAPjbWMi/wyfxOikpBQZqiUl3mDd3lnzM5WLp0mIcfdbIwtlZVf/c4V9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdD2MTLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kc2FMS6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619CHAZ53437085
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 14:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BqDGiETTc/R
	Qo1CLK6Wm84gnTMaZ6mGvCVNo0WrqcfY=; b=TdD2MTLnmBfiy3nZZoyV4wq3tRc
	5OcPsyetOOiTckb0zivSk1yt8jDoLP/7DSW2kGKAGj3VUuhZE7ikOzlz2aTGFSuj
	4QcWERyeXxINVPOFuSu4EICezmK/2LOkPRvuQi5RFdp9YcRaXCanJt9ZMV6U1aNI
	zbegcc/YTR6TiAPbUR4dWOlLrQrgv4jp6winN1Cj9V6rkUmQYFk13vJDxOh0cgyf
	QnrcuBe3Txn0u5JioBB4MhUM2BNj8gGij3amHQjpYoAZAMhDlCMMu71V/BUoAx8o
	meyNsS1D+maSyi9QNVyGxZ3TDTsfVfJDyFxpTS/djt3XF5n43oz8x4v+q9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7fev8cwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 14:24:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c538971a16so1202382985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 06:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770647096; x=1771251896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqDGiETTc/RQo1CLK6Wm84gnTMaZ6mGvCVNo0WrqcfY=;
        b=Kc2FMS6RT1tzNNHHRbCO5b9POK4JM4dqbhf+eRtYP5vqLJEo2a2vEbTtG3DMVSGBQi
         2vkbEOfnA15wEjdvYAdPWiNIar9xt7HMwxzGA7Hf+3PHAxzxW/a+zerc3eUDuzAiuOZc
         nObdqjXJvMXMOl6RqPP/5UxPkTL6gRlWW2x3GYzHsqx/+U5JS7g3wjruhTDuA/z6VblO
         mKe5TWlA+xmHKmRiwe1+tJd6k5Fae+AKv3U1sYAyyPCRxRRaKD1c9BaTZ7cFYtnunAoB
         kmGRnshLpKvgrgblbK6EcrqQfWLvSQUeSv7v3U+7uj1CO4Zx9qH8ZrETUqBMZbZF5ZLZ
         lPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770647096; x=1771251896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BqDGiETTc/RQo1CLK6Wm84gnTMaZ6mGvCVNo0WrqcfY=;
        b=QmA8RP7fIaGZsKGowTSsOKRqXOvi+9joEpipfsegA4hpZ/8Ci9T+hHc2htJDRbEyZ6
         7dwzUaewGdx+azgXiAqQLibieVYwHJ9Lhyj9fqcFEwpsEW02dsGsHIEgg5n59k08XMH9
         mK4IVolYznMvu3uSIjnzpwLWXAF8eVUELGZn3+wkaP00Uf3Frbs4/eRnQsXgphPtCMN/
         HWyHipZCDfuwoNa+RozXOwku6AODmGTt9S5aEv6sgFP0VDcZuJyQzoGlY0JxJZm+CX5A
         BR7wR7ijAp7UB5rCZa7Hyw72cKCDkHxaA6fE77UbGFhL3T5h2uwUs6yebo5vJ+2phM/x
         L2cw==
X-Gm-Message-State: AOJu0YzD6cbBszEHWKn76ACAMrrQwOWF3hged7Ahnqy1LVUP0L06fo2o
	p6DCspQPgadGysQHfStCLnPjjuk3OSfV/3KmNNAgki6ijZ2cgy0kAvEO4dT4pTb5+zgv82CoeYT
	/OWQBIpkN4Vr/BvtXSeKyR/GCsTVLpxNMOSgDxE+MZb5ujjKVxYegA05jEDsK7uPL3mkd
X-Gm-Gg: AZuq6aJ4RvXErDlA0oV/u4DyJjGs4mIEfWG0bl8++2K3hQJeTPBwh8QDELLfDyFvALZ
	RQjX5L5t+qO4zMwoe8hgudAlEmTvbhhqxUoS09Zi8xHP1mwydRX8Hvr4OvxmxVxKqLZ99qsCnxf
	f2mxdWQCZO9LiLqZMWNsBV9DQ4rHSGXwgclSKl2SWoPhe54PltfFHy4hvOvHVXGt43mvYolSudW
	xjASHg3sv+B21b3RjCYBAI1BOgeAT4quIgo+HLrvOaKZI6S85iWEdq9dC1AFA7gAWwySNsNzTLR
	jA1WYInQTP9UBTIc9jEiU0stYuLBuIJDhB4bKCb7OGM/3Hj5XLXqY++m4a8V+98+rWbQ0/LuZ3m
	tDMrhFwusTYlhZqGmYwjAUVG843BIG+ClPNmCOEZLdW8=
X-Received: by 2002:a05:620a:28d6:b0:8ca:3c67:890e with SMTP id af79cd13be357-8caf1acb3e7mr1466140385a.46.1770647096530;
        Mon, 09 Feb 2026 06:24:56 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:8ca:3c67:890e with SMTP id af79cd13be357-8caf1acb3e7mr1466135385a.46.1770647096073;
        Mon, 09 Feb 2026 06:24:56 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm28296634f8f.28.2026.02.09.06.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:24:55 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] arm64: dts: qcom: agatti: add LPASS devices
Date: Mon,  9 Feb 2026 14:24:26 +0000
Message-ID: <20260209142428.214428-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eW6ul9wX-wVMSzbiRZTv27uTi7Pkj4Ls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExOSBTYWx0ZWRfX4wwHWTmpClRT
 MyRn/6sh26G4vVbpnBe6FOcGyldZYjqD8DmRDqs0RF0OiMhA3VcCTD4DZEVu44ZxH5s/q5SuymH
 vJ1IyJ/seBg6Zmt2i/KBFhXUgoOdCXrzgNL+HIyALOYT7QowKetLJsnosFrmO6MBUN1//e9v86n
 WdDG31R2XcfIJPXR3pUg+FdX+9bamOXbjjpEKJscpOr5Cxi/65Iplc7bY6RXCR9SQYLk59+ufL1
 ZnqEZ4uNpDTYEvch6f5xW0fNAF2aP9VORi/OCs2YY5jVMKXtaGX8vmDIXfS5oTusQ4xD3jys78b
 IhUWSfy5cKgK3GJbUVZy5AmzZT1SE3W9BV8gi4BK6CG9AwIfrFLkgLQt/NLVE9t2TOuZ11BkGe8
 YIWe6vj/4Vf5u0CxE27D/SS1iAoFOK1xP2W2qbROmPYzhPQo0ZAlFNxL9DMy+0uUPW5kZPD6N+a
 r6qezgX3difrVCDhsPA==
X-Authority-Analysis: v=2.4 cv=F6Rat6hN c=1 sm=1 tr=0 ts=6989ee39 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=daVBUSrqZdlznlP8YWwA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eW6ul9wX-wVMSzbiRZTv27uTi7Pkj4Ls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92320-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D8EA11038A
X-Rspamd-Action: no action

From: Alexey Klimov <alexey.klimov@linaro.org>

The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
controllers are required to support audio playback and
audio capture on sm6115 and its derivatives.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 189 +++++++++++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 76b93b7bd50f..79cd8bb8e02c 100644
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
@@ -2188,6 +2224,159 @@ glink-edge {
 			};
 		};
 
+		rxmacro: codec@a600000 {
+			compatible = "qcom,sm6115-lpass-rx-macro";
+			reg = <0x0 0xa600000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK
+				LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK
+				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE
+				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			assigned-clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK
+					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+					  <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK
+					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			assigned-clock-rates = <22579200>,
+					       <22579200>;
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr1: soundwire@a610000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a610000 0x0 0x2000>;
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
+			status = "disabled";
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
+			assigned-clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK
+					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+					  <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK
+					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			assigned-clock-rates = <19200000>,
+					       <19200000>;
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
+			assigned-clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK
+					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+					  <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK
+					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			assigned-clock-rates = <19200000>,
+					       <19200000>;
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		swr0: soundwire@a740000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a740000 0x0 0x2000>;
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
+			status = "disabled";
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		lpasscc: clock-controller@a7ec000 {
+			compatible = "qcom,sm6115-lpasscc";
+			reg = <0x0 0x0a7ec000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		remoteproc_adsp: remoteproc@ab00000 {
 			compatible = "qcom,qcm2290-adsp-pas", "qcom,sm6115-adsp-pas";
 			reg = <0x0 0x0ab00000 0x0 0x100>;
-- 
2.47.3


