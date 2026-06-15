Return-Path: <linux-arm-msm+bounces-113232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4TDAMmItMGoWPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:50:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C81436888AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:50:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=YZWOzEhY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113232-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113232-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 709B930074E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E631740FDB7;
	Mon, 15 Jun 2026 16:49:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0369F40F8F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:49:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542146; cv=none; b=tek0VII9kE3hCWBrjTDD9yWQhBY6TKiDqgQjv5k/9l5NBX3XfzLUvBroMnJJB2TqDbVS0ZF905817PAM803piPdHYvwtyzjdNu6xECLKZsRz2MkiluVo7MTUIYGMpNpEhofv8DWjYdzEZ79SNY6yB10BHi6JRIdmM3BrFGx7DI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542146; c=relaxed/simple;
	bh=zC3uKh9sdRHJTxAOHcXYp/beJzS1u9SHJ+etYo1UF2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYkdnG2Vex/7iWBa04ekD8yIW1h754De5pJGprUxleNhDB7AP3esLj6UzR/EayDKnfqm5oA1kL75Hd320fsrYq8XfzquK8syEJN24iLEsgkU7a73fnhiLLlRdnZMzOI+/VgUh6Ygz7VTC5sz6gy/IUO/54A5D8c279bjdPYDH8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZWOzEhY; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45fd464d51fso2044078f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542143; x=1782146943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+tfRyHBl06u8IzGN59oh320y0djuJhvUWRaCZZ6NlI=;
        b=YZWOzEhYtzKjbjqsTloMXMGsPHS2evjZKvrJkYq8oAbpi4g6lzgU9KE3f28kueWrgT
         aE1r7VW1YUhAYrf8vWyLSAkqrhHmVZUrBUK1kegEUnO6yXaHzlzIS4gZrjWtkqXN2/5F
         1EO5DcGbsub7euvAbCYcJKw2lXzmWV3wi9/9qFBnBsq0IkkoMdUy5z0gnvipd+oZgO1n
         0Q2v9Uw659vo973vuOcGpcHi+uLxAEmYu3i/KFEqkqn2xZCPYLUoy/lfHFkOCcw2Xtxq
         LarJSM+/MUqt6s41V7OpQjMImTOFuRYJ7jlP8mGc1ZVlsxXYuXOr4Id2ES+DhZhWPW3K
         qvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542143; x=1782146943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X+tfRyHBl06u8IzGN59oh320y0djuJhvUWRaCZZ6NlI=;
        b=BQMeliAQWWfI4gQ8R6RcTC28/zhkzfo80CwBUUpR+I0tvFUlL+qKMk+31s701z3rRY
         H5NUj2llaYLnkopX+zQEu2SbYj9HU9ClrkgZKz/vQxGsjaMmK+fcZGyWMPmMosKUV541
         nEk5X8NwMdKkx90lDbm19Fsy2LPwNvLdUTiTEfBpD5jGFooNfRUMwVCdmrtNIjaSVAsV
         XiKMKYyzN93k83ccT/jpC0PIt0trM94ZHNMoQ8IaJQa608CmGHHLq7B0tqrVt858ggX7
         1Cq/I034eBDIwYacKDRj2qV1NncYRVLu1MzxHQwRASCL36sBiUMzFlNlaf56IOKgoLN9
         3VSA==
X-Gm-Message-State: AOJu0YwsE9jrVnb6+GsxuXyqkk7frSj/69+CKa7UjLsiCz7ZwLnwDqWq
	0nzyRq2W/H1fzYxQOZ5KXflNNU4N9nBpxIUyESbd0Rlsk9pWGTZ7iLTaArRblcU0gxM=
X-Gm-Gg: Acq92OH4KLR/8PSTqlw5rT3sTYsORvrfI6zpFJLFyalW+T2N3jvRKAQ4bNwvcz2pnCY
	bEWtJiYBsoOchrlIvJ4i4COFvOL87imr8iZqWF7TD27WswdoGFTDMxWS7R81588lvUoFO7f1yA7
	U7qPWwTvdPzJ5jOCF2t7osVobGmm7/fHAHtanTrbMxIlGMs4sxbDB8hcLvslmN0/wMvU2/Rweey
	7+M4zn8x5LubOygax0UEz4pYxU1YTqGukmQfM8S5iimFVkRgXZaRdki+eydvh1HRTBHYQmjHnaR
	r7pc3r0/ogf19gGR/D1JtsYqYGdlPU4umfvEA0oFn5JbNS0SdJ8705mAHQ6WxUmUzyAbZyX97xo
	J/v1bNnmDofWjJt2ef2lDWd9KDzVaJHBnU/a0tZT0fdKUljvn+nxlQy0nb5f4XzOdpshttI1PAJ
	qKoVErpHyLRRaqroXopBZTzpml5LFdagJ+P3Hnmp1bE+Bh
X-Received: by 2002:a05:600c:c04d:b0:492:1eed:3e67 with SMTP id 5b1f17b1804b1-492201439a1mr97518985e9.26.1781542142844;
        Mon, 15 Jun 2026 09:49:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa58f80sm5670735e9.11.2026.06.15.09.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:49:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:48:58 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8650: fix soundwire ports
 properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8650-upstream-cpu-props-v3-3-eeb6e9fa7581@linaro.org>
References: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
In-Reply-To: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4333;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zC3uKh9sdRHJTxAOHcXYp/beJzS1u9SHJ+etYo1UF2k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMCz7HBSsyv4RFfrN5QxvOPyTB0818pCSmgeTDmcp
 FI+UgPyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAs+wAKCRB33NvayMhJ0b97EA
 Ck/jTFd2vZGagvSWNB2AX/C30Y2EIZa0a47TFBclmvyMWfEL4Z8DrknPAdQ0jeEhOPlDqYpUlRMzjm
 0gad6384AJ2GpssyqccIokDPHzRCL9viHLOD8Q/lM4a8OnQ6opoe/XTHvW55g+luka0MNLffsPfraN
 5GLyTbSE5qMDPBmJoqCvtefRAD6jntFTQsmAe3iTWrfEdUxJVZZ6tFz/epWp/KAPi9Q8yJL01IihbS
 8aZsG6U/T4ORtZMHq8KA/B3viIKqFdiJl3jw4KV3gDNX87zr10a5f/EtVcz69uhs9ZzulGqaG7aaRk
 nCUORetKHCE1czuzvQX43K/z06G5rbYCSSiVgXfLToO6DuOrbj1I0PKiLv1LRNVm980rPvM/pItGQk
 Cr3wfIHtBP1y8vdddbi7lApq7yppPXoMHJTrooRyiXewkVHpBQQhhwdVp1TOo7aTALWp3rpgceKVdi
 l4XBeRsWnw1ycVe8kohlGMqdw3wmsF7iTqLmh/asfjS7N2123AMRW92wrY5NxivGCc0Fs5Mh2v3CeC
 Z0pZyz4pjX77wA1/m+a6KIG7KZLeHf8DFY8EaRNrB5cnlFZSsL2W6mMmy1PisMTkQKIWl4Rcs/+UVQ
 COAFLKFYAUTdrLRym8DfXJ4/yTa1fxbVt6ENPxdlFWWW+lZ63KVNGyQP9IBw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113232-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C81436888AB

Since commit 9e53a66a2f2f ("soundwire: qcom: deprecate qcom,din/out-ports"),
the ports are checked against the actul hardware configuration, leading to:
qcom-soundwire 6ad0000.soundwire: din-ports (0) mismatch with controller (1)
qcom-soundwire 6d30000.soundwire: dout-ports (0) mismatch with controller (1)

Fix the ports count and properties of the corresponding soundwire
controllers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 42 ++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 090a4739ebc1..b1293fdb1481 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4734,18 +4734,18 @@ swr1: soundwire@6ad0000 {
 			pinctrl-0 = <&rx_swr_active>;
 			pinctrl-names = "default";
 
-			qcom,din-ports = <0>;
+			qcom,din-ports = <1>;
 			qcom,dout-ports = <11>;
 
-			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff>;
-			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff>;
-			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
-			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff>;
-			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff>;
-			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff>;
-			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff>;
-			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff>;
-			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
+			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff 0xff>;
 
 			#address-cells = <2>;
 			#size-cells = <0>;
@@ -4831,17 +4831,17 @@ swr2: soundwire@6d30000 {
 			pinctrl-names = "default";
 
 			qcom,din-ports = <4>;
-			qcom,dout-ports = <0>;
-
-			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
-			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
-			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
-			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
-			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
+			qcom,dout-ports = <1>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x01 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x00 0x01 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0x01 0x02 0x00 0x00>;
 
 			#address-cells = <2>;
 			#size-cells = <0>;

-- 
2.34.1


