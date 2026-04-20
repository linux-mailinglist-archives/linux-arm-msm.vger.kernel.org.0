Return-Path: <linux-arm-msm+bounces-103836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBZkGkR+5mkHxAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 21:28:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D30224334C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 21:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE7EE302087E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844B93C73E1;
	Mon, 20 Apr 2026 19:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tTtahd84"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCF83C3C03
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 19:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776713221; cv=none; b=CCRrPqXNaQh5YGddfGVDDQurgX7Nji77WXcNk1kCL5keBFw3S8cvJl2/ot0dNAcLbnCLordeEY0rJb3tWwTwXOHgCB9w5HryneooHnfuavC46PTZm/BlyT1VSfpdiLrUmw+TL787LDFOYWPQF0DzPsyN5/kepw6G69YRLatCDIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776713221; c=relaxed/simple;
	bh=+qtKvBDAkMqbgXqc7T7YdD3JOpfzOdaRXujJjb3n4zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DrnxfT16pKdOPHaMxV0y9fvuTRXoZaTJovLGB0RunM0GYJ8eLE/eCXpLTzM2Qo8oaAxdLlomzyZE9YvbeVO3S2VzhT7Mb+78w7nmL5QdAvxspvoohSB3w43K5N7/aHbI78UF8pX1oWUNIWJcNXXpelwsfxA1KfznYVfova1Dj+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tTtahd84; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488c2690057so34021985e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776713217; x=1777318017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFrB5VArQYae2VnkFo7wFR9PaBq4FSF4lzLh6V32m3A=;
        b=tTtahd84D6noqUbDQObRLm7RRPjTU9F8bRfm1pdjnptHg0XywziHLra1wohXm4bxBw
         d1N9nakG2gklO+0xBqLLr/WGGMv4ZmAcFNh0pxH9PmFhpuyi2pEQTdywZmwvxDvvFkrP
         fnrwjP55rHHvb/fEUoeIm6HqmzNwl3SyhctuZf5RLIDBM/8quU889YyuTgBS4hYONH3W
         qMEsUH6zfqYc8cYz5lJJO9kyzPJhhEFAWeYE/1B8uPMAFZ12AdJW/kK00hpbbc71RNH0
         M1P1jgU9RViqdBE5KQbAEbsQblzagNXY7JjVsqykKyZdmjwMVFLX30MidZzn2qiUMbuo
         FGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776713217; x=1777318017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eFrB5VArQYae2VnkFo7wFR9PaBq4FSF4lzLh6V32m3A=;
        b=ZTaJ8fOH0QL2rRPspP4rf19scrRnOIhksqY7Ak8viySGk4+ZUZdf3jkKLnJ3SGvTXQ
         lsmg4dUDcOqPxf4AoAP9DTU2VCDBqy3hNl9ssfZcsM7yxrNOzqn9BMuZEKvXFdkTrdME
         wB5kd+H86nf+ROSlaj0Rs7iQZBOpJ8IeEdGwuaE8ZxYlrfLYSdlQY9iFa8ggkrP9SNIb
         fv1KCwT5s5o0v313GZn0wa+o7B5LmN80dLU0tJ7bUnH1u4f4Ghp2pjT1j8hdT5LhvY3R
         RUoPQhzvw2tQUSdoXefCpNyuRZ8wudMnraPhYM1mb4Bk76pQclrddhOY78rlfmlCrjNN
         vtHA==
X-Gm-Message-State: AOJu0YyjwLNO8H4b0T9UxdclreOgafADjjCE1ggx5Cc7iMVaqlTT4wR6
	odup4bUzrN42P3aFxmmhIqUGkA2daIX46jiROmMvBBVuhO+8+OA0XCTTz/dtOU+/tmw4TMHhJ9c
	PCQSRrrYt2tkT
X-Gm-Gg: AeBDietBJr5Oi5ogSIQcARCELF+A8vAzhaEgjo9CSauPUzuoiuZzrxsXeLxXznPzWwP
	G+Vig3vEZjFKMcUnLc1twU7hpznHsZ/LkXSfOOfYuxeLWzAD8Xa+jC7z1mEM20PSiXA2nwRY50g
	aorOge+Fdt3jjvoHVrDt8iiWtO2raUjCMs+RDg1nLaeW6dmpk8DhzoYXptPRqwjhc7ZSpYBjxb9
	R8EokFLtM+AM58o7Qc0EdtU1XC7kewoq7Xd5r6eHYXCCaja837NFCBW++0yVyXt5Hx2Ruuptcc7
	x+eUSpMBTIzaRu81PPOBHOZQbPeP3oam9UnBAVmsmI2pp9phFozJC02ZxWTE7BqbJMjfLTGUewP
	R8qvKezOTLfxYGtyJhiQO685RrvgU9Cwku1MGkYQD6HfgR4vXhzF+LdcqFfo+uiKqiji81z4hCz
	ZKJ5ExqjFsqm9wZYqJafXdbUx6Ijjc18yxKIfV0I6lVNTQNHOvjsN3klU=
X-Received: by 2002:a05:600c:6286:b0:485:3f1c:d8a1 with SMTP id 5b1f17b1804b1-488fb74a677mr217645405e9.9.1776713216980;
        Mon, 20 Apr 2026 12:26:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb78d1bcsm133524515e9.5.2026.04.20.12.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 12:26:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 20 Apr 2026 21:26:53 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8650: fix soundwire ports
 properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-topic-sm8650-upstream-cpu-props-v2-3-689e07d8ab8c@linaro.org>
References: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
In-Reply-To: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4260;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+qtKvBDAkMqbgXqc7T7YdD3JOpfzOdaRXujJjb3n4zc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp5n39IEyi7kb6DOf2khjlgzAwqI8iJ6RsnDZUQcNW
 4xPbDE+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeZ9/QAKCRB33NvayMhJ0YgoD/
 4vkWgc4YeQBaz7JVYgaTzn1rKixBaW9Yvzp4rhcFJu/3Tpv90uJgobaCi8QNiWAQhQ4gb4Q/Z3xkQf
 v9iY3JMcMecrQJRWiDUThZpK9Nloma58+ieVUIqNtvTqyU0OuKmpEkaqXfHewEkIUVnVxsXWdkbo84
 ZX1t2fQFRf4CxaTZRrj7mjN/MT04E7vjGvG4PfnKLrMqh6N+0FicPonhoXfBdwvWH97ZTE50zgKGzI
 20f4ci1PfYY8rTuGlx9puneGl+mlAwZA9e7FF5juv1caCh/ydEOUujRR51R9xoEuAD06WExFcE9dKV
 OBn4E8yj0Rwg1q83G0lUKvInOLSW9E0zcD8oZ0pZICsBTMT5b/Xo8ckERoGG752LgDnYJQXC34u49K
 Btr0N0FNN/mBRV0XqXoEz6GeExLwSq+psFvd8uord2bn95qdsZMyw1czit/h+cDE2VtYecI2LfzveK
 +fP7bC34BwyFJ4WhCl/UbE1AEZSyjQN9vGs+mEUlWi5ZOI+UoyRuqM9FxBDoBDudMRo///qlgqsV+U
 /ZxD3hMZof502h5u0UZKT5k00eAwxS3KbqRG4hnkJXnPUyYAvCB717WLh5M/dbDIHf9Qov+JrJy9PX
 RLIeTAqdnZhPy/SpqMhn7RayYWm4I6zUNhhTIzb76guC/4/PERWnAwFbuVCw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103836-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid,6d30000:email,6ad0000:email]
X-Rspamd-Queue-Id: D30224334C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since commit 9e53a66a2f2f ("soundwire: qcom: deprecate qcom,din/out-ports"),
the ports are checked against the actul hardware configuration, leading to:
qcom-soundwire 6ad0000.soundwire: din-ports (0) mismatch with controller (1)
qcom-soundwire 6d30000.soundwire: dout-ports (0) mismatch with controller (1)

Fix the ports count and properties of the corresponding soundwire
controllers.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 42 ++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index c5358894fbb3..2cccfbc6d008 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4730,18 +4730,18 @@ swr1: soundwire@6ad0000 {
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
@@ -4827,17 +4827,17 @@ swr2: soundwire@6d30000 {
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


