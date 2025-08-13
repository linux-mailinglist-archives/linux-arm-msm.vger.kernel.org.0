Return-Path: <linux-arm-msm+bounces-69006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B28B24F26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26FC468427C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 16:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F63305E00;
	Wed, 13 Aug 2025 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="grzu0JVx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310602FFDD3
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100802; cv=none; b=Mh1J3lkgrcH8BwiAa3WVpOZ5KitPy4Hk5HvXuxPA827kQbDdGWqB+wxt89CMdj3GOEAI6cVg5LHLBdpnswWDZkKRELemH1pMXTQoEITIovqWotOqm5EGEHA1YD3jpdFq41Pp5KtRb9D31mw0bUFqGgW0UjRUeP6h9lHyKs4HM/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100802; c=relaxed/simple;
	bh=qiKwpUDsQ6u+ZSXEONMrJDU1DbDchi+t8h17TOIbq4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rJqsXRdBhwkR4GgCDAe00SoemYGBuB53u+awGBKj8FgoXGqIwWaGtAQr2L0KtAZGR8MrKRp0ctIVBgW7QJjqysDE0UH8FKLvXU4j4NIZkvRFn2agya9sxytHtFtHOkbv6E3DxOzxJce2FR6fslbB4n9lXbScxlOqpx73GQvN8Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=grzu0JVx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-458bc3ce3beso40974055e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755100797; x=1755705597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/5O3rsN50RWBzdZJkvVZFuj2lxPpa47FoF26sdFJd8=;
        b=grzu0JVxwIQ1TmkL+Nu9EiimjmeQnh/+xb2ofpJSoGYK+iVirn8tr3kzfBxQhRqRx7
         Sr3IxUkm5h9xG8/7qpbNiXspTD+djZVYCIKy/t25eplyg4rUdVc7KP5fUboXn2APIaKw
         YpXbbxOJ0uOYgpaVNQLwkhgQlZwRDKRY08w9+1WFi4/urzJ0MZilpN41Mt9/PP3FhWys
         jxVYHrHI2oHqXh0ceHbBCkBxBVIvNidMgAV6v4mR9wcAoTIEYTQC0OwnqkdXcL+FlZrP
         yiXOtzWOBjMAj+PHwCOF4NYfsqPnVPCzNc8L+tlU1TizKYIxJ7P9BslXyTvdNKZm/qam
         aTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755100797; x=1755705597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/5O3rsN50RWBzdZJkvVZFuj2lxPpa47FoF26sdFJd8=;
        b=EpXuzwnhpuTkaw8Wy0x7MN4JC9umK9g5AHz4+B7Pcn99ybjRDpmcL3rnT6tpPKTSsn
         0vvBWydjFZTwc6jG5g2yZTHfojxDpLvyp8uA2VF66cdHi9DDTZ4FjDM+aiIRsAArnJ+K
         QwOXmkEpHKdXzsVWOER4TnbczQGvOHwKhVoRjl9algWAn1BIRwGK0gQzGu/arR+f34sd
         MD3nHEUk0Q35mGKqnruZPXbyB/fqfvC+eWZM8gyF6LV8EF1dZvJ8ILi4TBzqyD8gpwBi
         34CKcEBA/Y1sWRsZ9KQpVBC6CzDohlpaMzLx75TDmuoIpQd0UasNwbXv1T0vUIWGGluV
         9cDA==
X-Forwarded-Encrypted: i=1; AJvYcCVV7DzpJkDWLzvFzrNHF8A6ffjmzOrU74jKly92FetU6rkczJ1VscFPYEE+IXbb/JT6GuBCWH+NlNEJtAB5@vger.kernel.org
X-Gm-Message-State: AOJu0YyDYvlw35XVJCgjkT/8EajXAKK7l3bHynbUpvV19lCz8RcJxTCs
	nzs+c/LVGXuDYScl/Ai+xs0bPNz3M7Yaw4g50bXNT7ZzQ3jzg4wwjqxh1tMBSDy8p9I=
X-Gm-Gg: ASbGncu0RIUGArz+3Gej1rWHdp/5fwwpJKqp4CTO3sFwfWbsgIG14LZ7IEAzi9FQfVc
	aLmdxwASWcvmzB8XpvC1yyozyozGwCP/K+1nPYVMxV1/q6xVQA85ONuMBkf6byYLmOZeiEAP573
	2FukwL3Bfr71mtJj+7ZVdgUAIMr3mGJXWs/907d4ht+VH90LHIjrIbCVk7IhGmpscm6Juvt+ATk
	+tJpMNF+i0IqS53T2zr9/X7a4n9OQFMTdUBZRPqFCZMS0mBA0N7+iSW/4d/DQ1m3dJ3nMZC0CmV
	xKCwR4b8wA/TKR+QHTd2WEH+GwFUZvrGxVLy7TgGGHMHghOm0zNLnQWKdbjm9FaxjBEJoX3gOi4
	plaJBF1ibLEHPozl9qGXd5mzOlUM+UyzyLdFqJg==
X-Google-Smtp-Source: AGHT+IEKYtoxzxuy+5t0PBzrNJANU2HNWNNftC9SgcRXHpB7LOzIj4yHz5DFjPniOubwnabHZeKWQg==
X-Received: by 2002:a05:600c:3b1d:b0:445:1984:247d with SMTP id 5b1f17b1804b1-45a165a2a9fmr29523415e9.7.1755100797405;
        Wed, 13 Aug 2025 08:59:57 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:4537:5d58:c08d:204b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a517c26sm7087755e9.7.2025.08.13.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:59:56 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 13 Aug 2025 17:59:06 +0200
Subject: [PATCH 9/9] arm64: dts: qcom: x1e80100: Disable audio codecs by
 default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-x1e80100-disable-audio-codecs-v1-9-af82d9576f80@linaro.org>
References: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>
In-Reply-To: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

Currently, the macro audio codecs are enabled by default in x1e80100.dtsi.
However, they do not probe without the ADSP remoteproc, which is disabled
by default. Also, not all boards make use of all the audio codecs, e.g.
there are several boards with just two speakers. In this case, the
&lpass_wsa2macro is not used.

Now that all boards explicitly enable the needed audio codecs, disable all
of them by default in x1e80100.dtsi.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index f293b13ecc0ce426661187ac793f147d12434fcb..7b90dce872773970b62a6d37f5c9c70305710050 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4160,6 +4160,8 @@ lpass_wsa2macro: codec@6aa0000 {
 			clock-output-names = "wsa2-mclk";
 			#sound-dai-cells = <1>;
 			sound-name-prefix = "WSA2";
+
+			status = "disabled";
 		};
 
 		swr3: soundwire@6ab0000 {
@@ -4209,6 +4211,8 @@ lpass_rxmacro: codec@6ac0000 {
 			#clock-cells = <0>;
 			clock-output-names = "mclk";
 			#sound-dai-cells = <1>;
+
+			status = "disabled";
 		};
 
 		swr1: soundwire@6ad0000 {
@@ -4258,6 +4262,8 @@ lpass_txmacro: codec@6ae0000 {
 			#clock-cells = <0>;
 			clock-output-names = "mclk";
 			#sound-dai-cells = <1>;
+
+			status = "disabled";
 		};
 
 		lpass_wsamacro: codec@6b00000 {
@@ -4276,6 +4282,8 @@ lpass_wsamacro: codec@6b00000 {
 			clock-output-names = "mclk";
 			#sound-dai-cells = <1>;
 			sound-name-prefix = "WSA";
+
+			status = "disabled";
 		};
 
 		swr0: soundwire@6b10000 {
@@ -4364,6 +4372,8 @@ lpass_vamacro: codec@6d44000 {
 			#clock-cells = <0>;
 			clock-output-names = "fsgen";
 			#sound-dai-cells = <1>;
+
+			status = "disabled";
 		};
 
 		lpass_tlmm: pinctrl@6e80000 {
@@ -4379,6 +4389,8 @@ lpass_tlmm: pinctrl@6e80000 {
 			#gpio-cells = <2>;
 			gpio-ranges = <&lpass_tlmm 0 0 23>;
 
+			status = "disabled";
+
 			tx_swr_active: tx-swr-active-state {
 				clk-pins {
 					pins = "gpio0";

-- 
2.50.1


