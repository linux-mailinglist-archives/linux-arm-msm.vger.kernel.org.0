Return-Path: <linux-arm-msm+bounces-113235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id isUYDmUxMGrjPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:07:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5ED688AF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:07:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=YT9VpdJ1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113235-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113235-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31A65311CFD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BB4410D38;
	Mon, 15 Jun 2026 16:57:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4262B40DFC0
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:57:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542632; cv=none; b=hjsk6Eb686LmYXv59bqR3GEBgEfuk1T3rjAwaLc3uLAfIPYRDfR7ED0yzJeOXkiZC9Waoqm3TZK6LcprWQrqPJbnNfxKWDvI5rmrx1f3jZweRzq1lCi8/YNzwFuOKtRDKxMccAU2NwRzUPsJTQAmnntvx6NIGCAvf8mwHH5rVNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542632; c=relaxed/simple;
	bh=/IalT+RAD8IwUnlye1Qn03niWUX6gu/ygo9mcIH9+WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X3UO3bQFRU1mbW6Qg0csGsWJ0LG95+3JCRkcV5F2HQl2UsMLVo3cchqyc7uTyDzBXcYlhAX4nkBUQJ96CmOysKlTHeWut6JRiyLYE/zZhpQpCftzcDfJGwwqNIJExb9uylU6O99Cibt7GmaxMKoQn42OpatiV/3TrVICU9leoio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YT9VpdJ1; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eee266c6cso3210760f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542630; x=1782147430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCnYK+C4df+MJXLG8Poc3ZwFI2FZ18KRB0mt09ykkis=;
        b=YT9VpdJ1jRNFkpdyGw8duyTMzd3V2Pq/ohA/nWk0rxOPCcuhTBmx3DsungjxjpPc0S
         6nmXcRb91FLRLCajzvg1oR3WAhDAuc6M548azjj+f61MBF+sqzM9qbG4qXBvAdwiqJmE
         2etVt1voxXQNgFTRfymNST9JYo/93soNYB5q2iCqsuX6guNzQgGGc+yhGmtSni0Lhj46
         cnMXC1zu/yOXqTwkaJy68V/eGVMBp2HQ5uHcFU2oFQYwqoiDqR2U7Yt0mshZswu1beBA
         9JPErGxV8Lkd8ThBsbk3cn0vLhOfvZOhxW5o0E8M8IzHX3Lno5YS+f6Yk+x7nKolfq3m
         6dTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542630; x=1782147430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DCnYK+C4df+MJXLG8Poc3ZwFI2FZ18KRB0mt09ykkis=;
        b=PtrD/K5aQTmYdIJP1B/Zov061dHr3kyCFaj+SLKp2rthcc1LS8wIee3zT9I1Lp58uJ
         N57LsBltjBkqVjF1dtL0qERjfJrYExzKMivzyTY55vaRH1Yhi/r46tBpepK/3Ln8jC0W
         Jzk8B/0e1637HpmiTjgfITLBWKtxl2oWbfYBtKewBJ4oiuBqbgaXOXjW/+hAfr4sEX8h
         27fDlbnlpcKk3C0MkAHV7jUoY8QRrFYdZfmiTtpwBh8nAzcBi0Kcl9kXCiZE/f2I2I0o
         ngswyifASdjymhdRr1ybXskfRUrDazYLNU3DugHFh4rsD4MMIerrp+ltXMMKyCGtFUmO
         1lBQ==
X-Gm-Message-State: AOJu0Yzs4f0P93+zCuwhbqdnlacQhqAa5kK4Q6Vj1mYtyHKhph2+amm/
	zGrcUp3hA/eF3mgTJ1tUbAvtWvwremmLBTb3dlrfa4DGjU4IgldlQ21F/3zFF2mJGwk=
X-Gm-Gg: Acq92OFnQ/1VsyfEsONr6REFO716gptuQzPPThqTcl0SRw/Mt/J4LiDYcKjqUg6efKQ
	ZA5uBylHQ3sw5B7wLTT46GZlG8VOUMZATHTGAkrsvzoo+sPrdckMJghiQUDFzvuLb66w5fz19+a
	aEE2IHyrnpsJpIV1t/YcXNPnSAWnbuDwpHLyH3kpcbzZ+hrvcwCjovk1CWsPg6aVZ3JarrDBTrF
	x2zKXi7vad6cpoSYnJp6wA9OARGCtLPSkMFCl7Dd9QpvBVWaYOzTgInRqnQ1TkH60U4ZEGeOOFZ
	m5RqhnbrOa/RGJvnpGJWAqZ3cmG5sv7mVHghmIiPG+VVTSW5oxexEOKC0XEil7pp2ONEwTkS6bC
	foYV0smKDZq2RCvNnJFJYIZVSuM54tbfPXwXWYGY/3JjxxdmNzdWtZLHyodkMFBdjZVHR89YuLm
	OcTgDkvTp9fcRSSVQ312q+sqAsoXT+ca0zIFgBvAhSUwp9zKg+f1N8Rh8=
X-Received: by 2002:a05:6000:1868:b0:460:3210:4349 with SMTP id ffacd0b85a97d-4607ec0bfccmr17052371f8f.42.1781542629552;
        Mon, 15 Jun 2026 09:57:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm37202471f8f.22.2026.06.15.09.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:57:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:57:02 +0200
Subject: [PATCH v2 1/6] dt-bindings: clock: qcom: gcc-sm8450: Add missing
 power-domains property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-1-6b5752dd4747@linaro.org>
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
In-Reply-To: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1392;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/IalT+RAD8IwUnlye1Qn03niWUX6gu/ygo9mcIH9+WA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC7gnV+PHo6vTzD3PBWGsRNJ5wJoYUdFlViraYOK
 U5cdFdqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAu4AAKCRB33NvayMhJ0Vm6D/
 9HnEJiwfVsKWxPviPlBnliQk8Gk5nhkQycUcH+z5j+lqdgj5agTKzRb0WgOnllMhy9nEcApX7OpzUk
 Ahks1Com7xYKZUvjj0b7InuspJL2yHBgzfDzWoPSTVT6UQDYx3UQ6ICFWAUuKsqILiZKRAWULF0QOn
 pwn8RuD/H47rNNnvfHCWLRFahz1OMhhKv8vouc5s7N55eSVEh8OkfobypZ/hlx1tcUFCsFmnhSkCU1
 Hh4kY6TUuP1Ffr073GntNNS7Q+X6o3U2vjMMkEQ0svplVpuYr7PBOZ6IT7TD9QxObdtn8WtuLSFu1m
 NYcG6owTnjJG4RnY52F18vWzfGa8eSlbkD2SjYULTxRk/9sk4UCzVNiCK4Yi6hCRw7aBctRY8CLVRG
 euPlwtS+6UfU7M4zDNuhMECMMSGGnMWcDfpvQodQAqr2kifYCbuGy5M0waKNCtC70GTzUoXsefo2m6
 b1qDupNms8SnI652iGZh9BUkf84C0oFnMQme7B6/FCcvg9cdQ5Ag/BHmgLVgUvwH2zorNM8BiA3gpP
 BKRZIk/GnAowpBEI2uTWguPw3UAhOpuv6BLP+YtQyuE/layg/VQo1A60cakj7RqIedkL0r3F5RALPw
 t1xd3Gp5cKvW5luSda0MMEQ8NpTgo/j9UDWss5OXDfSxcDRNmDlYC/A8gFpw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113235-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:abelvesa@kernel.org,m:konradybcio@kernel.org,m:quic_saipraka@quicinc.com,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B5ED688AF5

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: 72a0ca203ca7 ("dt-bindings: clock: Add SM8450 GCC clock bindings")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
index 3169ac05e1d8..7e3713cfd498 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
@@ -47,10 +47,15 @@ properties:
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -66,6 +71,7 @@ examples:
       reg = <0x00100000 0x001f4200>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
       clock-names = "bi_tcxo", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.34.1


