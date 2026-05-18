Return-Path: <linux-arm-msm+bounces-108285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C3oII11C2oHIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:24:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 243D4573573
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DACFB3037DFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 20:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9916384223;
	Mon, 18 May 2026 20:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mM9+02m6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A947A392C56
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 20:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135786; cv=none; b=BlPoOB3jfEbpXHmx502SyR61neW2yKqXNBBkxCjPc2BY5YEKpE0lmkJ/7KDcTL8rAzjLRbCETp4EFBV97CMiiukjPmsR+Cfbw3EUZiLVwRBucN6liVKMthTgggAQjYdJpdeCt5HYoylmfmY94RmlMq4YXvSH8W0t75nSsyQ0HvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135786; c=relaxed/simple;
	bh=76imd3xvKIwUkGBVDpZRcuQTnCY8Hnrgy5OngDhkblo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rL8VvYQ6ozmKEQhMOKfvsqI2jJxYt1UZAI7VClkc717IsaeOPg5isUxSNK/nkjmq2mEeGirumTrr476borH3WRrzLIHH63ZE+IBst5SSfSxruxf6EkTicEYoYam9tgGm1nAtcF1Jyag7YDeXE/gV0fAU9EI+gF74f5leE+oiS4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mM9+02m6; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e7d983f79so28223271fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779135782; x=1779740582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw2B0mpnGoOvamKzgFhtoftN+PwqkKvsefcUjvNFdnY=;
        b=mM9+02m6JXu3/BhrglIhDvyLkMp0xUnvmGEqTbI2en/IQMN9/3jf+hedyk5NBEFttD
         RMy1aR7NUgX9ULlYAOUZ+sNI9nuBoyUOkNxkzBJUxpwYkKFgFQiIcRWTQOPhNYfyUnAG
         3uYWhANZn/dccRx3oU4RiKUBgYWDy36c1w5mV2ZPUhpxa61T550WQVYIwjWjP6ckTm5q
         uTy+8iUML/hjVvsd7KX37fE9m1cIRqNMaiaC2p9lGLGBob3YiQva7Dgyh4iDW9Djokl2
         Jt6CrUZaCa4w0TdS6cOWyisNNHMiioICtWKfzSe1syZ1p3T8+cx3vrD7OEKARV5F0BOw
         87nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779135782; x=1779740582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tw2B0mpnGoOvamKzgFhtoftN+PwqkKvsefcUjvNFdnY=;
        b=pRJUTwzEGfdkXonu0w+82F4T+QrIdQgu2sxNXPUtq17FQcmlEuw8syflbErupyIhUC
         erG5/6NgF5Hv1iqQNZAyU6ETn6XP8jzDMz4sPoiLZwpQYTm8mfE2WDIugOpljvywncc9
         g8J4+QfK5Laqq1OgU7MKbNuK2B6PNVu1GGdUsPzExbCjc6dJBmg9IXcnNEIS4uBAbop+
         pA2AOYML8OGjVT6QlowNEzmmivUas71sRhchbnfe25Jv3AQwqhlU8lQhKePhW+K69bUT
         0DbaaPsVyJBajFZ3Vgn/XBYcrISTfsk+qzkoq2Y7xLbvxi5b9aLTzKK5T3e2qiQxT5t9
         WjpA==
X-Gm-Message-State: AOJu0YwL6EY3eWGYXVQJ+8rUcxJOwR3LnH74/dM4mbJ4Ku7khVnNwiXI
	J3FjxlILxWav5QkRpSGNIyNHG9BJ0+ZdLMr3at/J1oVdtNQHGiAU6jH1V3zt9lGRGOf2FQ==
X-Gm-Gg: Acq92OGHIBP6IBsYySKfiwVh7LiYDhby7/LEgmuYkzcTu1ll1+nP3qgN3lobSQaXjAS
	ZX24CSn328KSFp4I85QzJVrX2vDoztkDYlHlPchfS8hoEes6loyQX9b1OAGL+1zgnubur7tdIEZ
	shMnLpu6aiilGgxBL5UG/7efVfwgKQCVH34ruzdS+dNiOYIWY6rV0jDCdbzBI0XI7SHlxNJdE8W
	uUa68PSjqbdMqaRQOokX3y1bPuraN9uoTo+osqrYOtRhGZB/nD3dWakEv7ZQdx+RONU8k4IcRuf
	YVcazzbOdiqaRKErfctDKQFT8G7h7sov6B7tVd2qFQGbxTB6em11BDy6dyGyn2kunceBPmVljN2
	SYjT25cTaYqOH1y6NkrZuU6dQ/BegAgi8azW04zzWZWVwULE4YwvSqs97J4ZQ5Cg3sXzDAA8aJd
	lZPzOYCbJptLvS4kbs/3Og4rg1mnQoYxtmaxNP1OxHsVE+5WpDmNo=
X-Received: by 2002:a05:651c:4393:20b0:393:9ee6:1b7b with SMTP id 38308e7fff4ca-39561c3734dmr39284741fa.22.1779135781624;
        Mon, 18 May 2026 13:23:01 -0700 (PDT)
Received: from localhost.localdomain ([90.157.113.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b42f8sm15225061fa.36.2026.05.18.13.22.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 13:22:59 -0700 (PDT)
From: taygoth <taygoth@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>
Subject: [PATCH 1/6] dt-bindings: regulator: qcom,usb-vbus-regulator: add PMI8998
Date: Tue, 19 May 2026 01:22:46 +0500
Message-ID: <2a3c65bbfb85d944110b14b40ef375f238ca3932.1779127507.git.taygoth@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
References: <cover.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-108285-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taygoth@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 243D4573573
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm PMI8998 PMIC integrates a USB OTG VBUS boost converter
inside its SMB2 charger block at offset 0x1100. The OTG control
register layout (CMD_OTG at +0x40, OTG_CURRENT_LIMIT_CFG at +0x52,
OTG_CFG at +0x53) matches the PM8150B SMB5 block, so the existing
qcom_usb_vbus-regulator driver can drive it without code changes via
compatible cascade.

Verified by inspecting the downstream qpnp-smb2 driver and reading
live register values on a OnePlus 6T (sdm845-oneplus-fajita) running
mainline Linux.

Signed-off-by: taygoth <taygoth@gmail.com>
---
 .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index fcefc722ee2a..9e2e2c8f9539 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,pm6150-vbus-reg
               - qcom,pm7250b-vbus-reg
               - qcom,pmi632-vbus-reg
+              - qcom,pmi8998-vbus-reg
           - const: qcom,pm8150b-vbus-reg
 
   reg:
-- 
2.47.3


