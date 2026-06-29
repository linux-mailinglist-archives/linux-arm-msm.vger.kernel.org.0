Return-Path: <linux-arm-msm+bounces-114861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iZDuBcMZQmrC0AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:07:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D386D6BC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:07:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Agx+YXaQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114861-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114861-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 212A23030E9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3315B3B8BCC;
	Mon, 29 Jun 2026 07:00:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784983B47DD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:00:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716454; cv=none; b=SZLSeDIF8yFyYoWB3Y8fxcMBMzJa5u7RfMo9vANJq0UHeDfFNO3G6hv++4XkU2nMOl9LPGJxN3ZsNxeCoT24Hcn3SlPikw3IGfcxM03RjNw/ZEGkZu9y3k8ZWzLwOvMNYj5UGP2mMIEaDJ2r4w0OAvAkECJJ//A/o0+PeN/5PD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716454; c=relaxed/simple;
	bh=kVMtXl7rCmx5JlnaHYpMBj69E287VOYKC3xVI2EdEes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SoNXp3Za5Vz9FJ5iJ1u1emskOjxS9xCnlxsBuG2MlU82pcZxc2N2hnDnQw+ZQEwZod1CESFK17+1iA4jOWfU0ilpCSCY4al5AuM91GoGBZ6u7cpmbf28uSv17gp1kXYpSMvxHt5/giDoiHz8JuRkww6XCis4c2m9MbHpEJdxkZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Agx+YXaQ; arc=none smtp.client-ip=209.85.216.52
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37fa53bc22dso1867102a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 00:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782716452; x=1783321252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmJhwlnvHDQUYncTcDLRsXQNIfCpXR83f5hKepY0aRc=;
        b=Agx+YXaQUv9tyklnaYAzKlFgVN8wqL5OKM46Gmtva/DtTHUuSoKADSW7K7Cpv6T01Q
         W9QTWltkfbNf/LKxZIQJJZfbqFjtLvKINDk+zvTabmlUOJRzhqjsJM83b5PpQ42rMoOD
         HUkUHG6aAMiXA01BfyhiyfkQ/8v0ic0OXCWF6MJEXmr/BsdBEAOy9XchQ4GTE1VikI+a
         Py9XQRu324npZ/gRkERNGlHjx5o9YMfuYWr4QLZ96gVymWVFVwqChTSJPGZ3NEJuyxPD
         SUnpiH3AFBid7GmQDxWy6/dm2SEM7+QCpDiMPIAh2OzNWdaxF6MFjtDXr+lIVO4VXkDj
         MZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716452; x=1783321252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OmJhwlnvHDQUYncTcDLRsXQNIfCpXR83f5hKepY0aRc=;
        b=ehVSU1rn4lDphmvYlbx1zM/B1K9e4GkbLNmFPew8XQqq8w7NIXAWHFF2STKwLW4Puk
         gExeggyWw5PfcLdpZWIQqFFcganqTT6/fdWbovp7rec3icdtUiTjiTR5B22dXN2tq2KV
         6yG0Gp7yVBkuIn8miDx65XW3T3O5ElY6JPU5D9szN+telVU40BtJiQwDLxwS4HSw6qJO
         j/XGxN+Y3wD0Pxb8fFj1rlWmAsrz4Eu017DlalH1XzFGa+VdxZU+aMMFmJ3kGxTbCkE4
         DmRjv9BTxgSbqTIM9fRjuueFEuBcfzGSkg/mac/v62otC7tpWab5FHfe89hBOqbQklc5
         MiEg==
X-Gm-Message-State: AOJu0Ywy67YY/aMEm7UzoAWkhMJoD5ZxVr5KrD8qLw5FO7cUYuPziTfS
	6vyDwjI+nxVJGY0ef9uQPeV1MfwE0kVrOrsoBYtxsVvuGmivKJylWAnq
X-Gm-Gg: AfdE7clXLmBDgRLN5DtAPVE65th3LiX4pvw9+evVBX9hs+zo+3zWohBfmzy+3Clszeb
	XYnBbJpWHO6/UENj1Y6SmyRe8tQ6loAnWM7Ufdyht9AW71PMjwj+jW0Zf2d0grsKtj9vd9ratGb
	5TyYi4Kj1Ucn2C9ZQrxEuiUYwA3Af3gC5UWsBjE4kDmZepNcsk7WMdyBycVjkILYrgVxyP4yXpY
	HYXu+Lff5epAErg4DK3vqbPB+u+5hX5y/hl1MhIy7R2euHMKcPq1ucsiPLhexaQNxzohrXqz5+l
	zetzOKMQenEcpQxYLw9BdW7chMIx96IvyFZcRYKB0MT1rD2LzQjyUleyHZf4+iJuhEC5klqY8ys
	UAxut7W52Pxw08+X9IOmr8XyHzhvslhvt6NLo8fKPhu8sUf7OJ7hkIYxmv8RgDgxEfhy+fOE8OQ
	8O3tVaxiSPgkLNcgvyvP9UsQ==
X-Received: by 2002:a05:6a20:43a5:b0:3b2:8675:4866 with SMTP id adf61e73a8af0-3bd4aea1393mr16514328637.31.1782716451742;
        Mon, 29 Jun 2026 00:00:51 -0700 (PDT)
Received: from nuvole ([2408:844c:b00:2b2f:398a:8bef:b88c:653a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcc90af5sm7061725a12.28.2026.06.29.00.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:00:51 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sc8280xp-x13s: Fix the drive-strength of mclk pin
Date: Mon, 29 Jun 2026 14:59:03 +0800
Message-ID: <20260629065905.15651-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629065905.15651-1-mitltlatltl@gmail.com>
References: <20260629065905.15651-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114861-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5D386D6BC0

The value can be retrieve via windbg on Windows.

lkd> !dd f111000 L8

ctl_reg => 0x284

in drivers/pinctrl/qcom/pinctrl-msm.c
function msm_gpio_dbg_show_one()
...
drive = (ctl_reg >> g->drv_bit) & 7; // (0x284 >> 6) & 7 == 2
...
seq_printf(s, " %dmA", msm_regval_to_drive(drive)); // (drive + 1) * 2 == 6;
...

So the value is 6, not 16, it matches Windows now.

Fixes: 21927e94caa5 ("arm64: dts: qcom: sc8280xp-x13s: Enable RGB sensor")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index abd9c5a67b9f..3ddd44e16e67 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1555,7 +1555,7 @@ cam_rgb_default: cam-rgb-default-state {
 		mclk-pins {
 			pins = "gpio17";
 			function = "cam_mclk";
-			drive-strength = <16>;
+			drive-strength = <6>;
 			bias-disable;
 		};
 
-- 
2.54.0


