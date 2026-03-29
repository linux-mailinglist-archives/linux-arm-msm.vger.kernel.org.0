Return-Path: <linux-arm-msm+bounces-100577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LKeLJOvyGlRowUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 06:50:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E81350B74
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 06:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D231301AD06
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 04:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B65C27FB3C;
	Sun, 29 Mar 2026 04:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sq7ix4KJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FD626FD97
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 04:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759704; cv=none; b=IV0wOo3dTwA85nOuS6DeCoPk6rZ/A+SQj/3mLFF+LAiKL7j3zrKCT6u/QJfhVUAuxNmoQH/Dgbib19CxNk/uYFu/LR0W6bGKHNCdYSHS0IQ7yW+CkqWfcpYhnLUz60xBmI6idIQDS+3knK9+QOzkxCadmUyLQ6e12ltarg9TinI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759704; c=relaxed/simple;
	bh=YGygMWdzOkWxAHIhk9m2re0gLrFP4aYPlOEPoq7qYjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7H5heSRAGMF4u+GYKFUmc3tIAnaNlglpHp5FcPs/SfcjClBiOpe9w/XGTDw8HGfkqlH2JacnN7++JHUqZl8Wv0AyPKozYxQLeQgSNNuFkb817t2Oui5eua9bj+lHY2KYTwWjvt++Ol0YqXFKeMqjA73INNjGA7blj2qdMZgeZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sq7ix4KJ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-824c9da9928so2326136b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 21:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759702; x=1775364502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaL/5KIy32ApDCW/kitiQ1QT0fVd/CD5eAek3qOzYKk=;
        b=sq7ix4KJart/CWYnJhyDwYoVpDzWUjMRMO/U/nxVlFxHmlPLSI53aEhBveCE1QIEv6
         9k4lPmuXLwHiwleXnp6loWNQT/fpWkQSfTyJM3QJVjsEJswuaWjljhfx3HxqGfR7WGLM
         ViXuTEW2fXWL1C/RBV0MW1xQLFC/L+Y5pbY6JSqwZPap+nBMOYsTgafWARCWsL/cXUYS
         sMbt0KLVdl3VfXCvSGthr2BLGDxX3ytVdm+gHws50PtSjw3Hq2zWfOiSIqt89kE7uD69
         iq69nE4uvOFQTgTKPOXBu4eN5o5G6thsoqH4bWctHYStvof7q6xGPsuVWmSFR8HnKuVz
         XJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759702; x=1775364502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KaL/5KIy32ApDCW/kitiQ1QT0fVd/CD5eAek3qOzYKk=;
        b=WES0ZF6krBSR0URQms2OVOtlhZuC9AvssmniZ7ZrBhGs2cmbvw16GUfHpAbZ7y/64p
         lfIEL4Dl7JKRFqnGv+DpbI3qCdNCkh4S7/uY5C8Y39FImKU4ysLCGJJzjo6QJRCV0mrb
         Cu+FNCXWYXfUfxFff5kkj7/7pQDa2+P+f/L3YY1inHu93Rp02Mi61ZDRbKLtErStwYko
         IoORlPiSG/7MXgAMfvzDMn+Trbtkp7SyLBzOMofPCFa4w1YTUXTxjUtkwtdEViQB1CIj
         KAKrT1Lv8+QilRQWRxF8ZrvADFuwRab8eUNglO8z49aCdvgVCfq7b2aDuMro0FYrxC5/
         ho4w==
X-Gm-Message-State: AOJu0YxC7xBL6XGYyAjSF2gZewn05ErERs/3XzBszITmwqCU9QSOri10
	nMJHvCphqt/0M1p3vhRL2qyQ8FTUNfMHgtMHk7AVGY7ZaGe1XBbL8iga
X-Gm-Gg: ATEYQzwafmqlBFDvS+KqBtTrBbYckTUxWkTU/iYpD6zb5jN1C+K/mzu6mq9R3P8vm64
	0/j7xYjtLd/JlFmvn3NzYgwyYwlXXyMGF+Li+RS8oWwHIm2d2Ta6FA3Pze3Ij8SR1oEkkliCK5v
	6dRQ7VNNec3oJekQP1KTQCUcPg4kil5usrdymUoyoXPOlsrFft83eMh+e8tMDCFI2YMtqHDQp7y
	qnpAUSWR5bGRW1g62DvF6dG3seinLULv16QjkHGcVNZf5D9151sl/iMeWe8AWboivjwbyJuKvQT
	5Y9r1gVpx5BbsBzHrA/1oFWr14dyarpsWg7BJhj46GKrnLePbC5iSWNvvLLQew0aAZyTct4ivOe
	9yrLEUe/RuLU0FhnWPLrbuzwFnPXoeobyYYq1yp6yJ5eFGNVwYRTCTjLYhA1W3Zb6Ir3PbNfA3Y
	emYRqSsjfAe2HvKIzpuPHRjOE+3oE+Di9iDMd0qvc=
X-Received: by 2002:a05:6a20:2586:b0:398:9c2b:c92c with SMTP id adf61e73a8af0-39c87958b2cmr8139178637.27.1774759702273;
        Sat, 28 Mar 2026 21:48:22 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:22 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:47:57 +0000
Subject: [PATCH v2 2/7] dt-bindings: clock: qcom, dispcc-sm6125: Add
 #reset-cells property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-2-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=994;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=YGygMWdzOkWxAHIhk9m2re0gLrFP4aYPlOEPoq7qYjU=;
 b=Gerql4KQotDpznTNfzs2aU5gnMJpoN1rt7sSLUq+cuKe30nRjNFQr75AqDCx2jLHmcs9nNTXy
 2ISOqyWJi3sAHnAPmupVbSjeKV6GV/pqFOoo2Bxq8JaMIWcuY4TAgEk
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,intel.com];
	TAGGED_FROM(0.00)[bounces-100577-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 15E81350B74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The '#reset-cells' property is permitted for the SM6125 SoC clock
controllers, but not listed as a valid property.

Fixes: bb4d28e377cf ("arm64: dts: qcom: sm6125: Add missing MDSS core reset")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
index ef2b1e204430..0d467c1f30ed 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
@@ -45,6 +45,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#reset-cells':
+    const: 1
+
   '#power-domain-cells':
     const: 1
 

-- 
2.53.0


