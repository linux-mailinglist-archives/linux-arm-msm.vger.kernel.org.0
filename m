Return-Path: <linux-arm-msm+bounces-103425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCgeIxrp4Gl/nQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:50:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0194E40F2F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBE0931436F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902413CFF5F;
	Thu, 16 Apr 2026 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmKd4Z8B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBD03CE498
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347080; cv=none; b=l4yDkXVICEb/QBp9kA4x2MOeI72bEWN8VKwRu34WHetkM67LUmjRLspW7HpPy5nlcvjNl9QbZ/KCZU5q4KvV7HHu/gjYlG4/nd6NvtvU5dQi30OMXAwyHH7HO8CjWGAuygZ9DsXZrDPMKqIF0BTZA5WGMFaX+2QV9zvzJRCaOvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347080; c=relaxed/simple;
	bh=+qxk9YKyNyEiRkeW5Mgtu8HCNYz2EeeeSG35f/DmqEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I9o76D1h5VUjJ6MykiTwbVCZ+5mvw+/aD/LIX/rFKbjiIW0UPf1KSRziAJcZFQnYkCZAwrXRIGjqMDpjJbW6LE32J/E0ggcH+n4K24F8OYPQOulYS2seaiMSAFpYzFI8+9gkesinz6kQlMj9WH7BcjIP9YcguPQytX2l3EQSwAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmKd4Z8B; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7982c3b7dfcso79733177b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347070; x=1776951870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpnkPSyCrrxqGvSDrOl9HhMQ28DTCCYBlLhEHVmZVf0=;
        b=nmKd4Z8Bop0eOCFaB5nDL04znVpMUTo75wcwld5Y8aqRx7B85bywcU1Cg87ffO2Hzg
         ZEBRM4G71OLcNm2uOMk4iY+rBHwOMoE55GNsGzkr64Qc7mESo6sGcY4OQhGnSaMF22fN
         722wH1nQlsgiPbKRi47QnuBcmSGcR8GE04SIRMPD2MJLDPcmDN7lLaUj/l7tosGm412S
         dUmtPgnx+zKxbhc4g2+zvTV1TjuH+nLGVVvnv99ricm0grJifSgyBEptWc1fenMMaThW
         ZXiN+AkBh/XC5le2S7+Y8CqoSKvwGtPqK2L5sDWXWQ9rCrt9N3WcSy9AYvxL9TPTPC8V
         11IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347070; x=1776951870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TpnkPSyCrrxqGvSDrOl9HhMQ28DTCCYBlLhEHVmZVf0=;
        b=JZREsHD0UmuFfRKccDr0jxMCb62ZXcQk/HtR1ph9hJW2SwKdMYabzMIjmTcvzfpbdx
         h1ujy2Y9z2jfTFGGlwP2uRDn1Hwj7895IgOVfRnL7BOdrW64jVgY87S47lbg5k45nYJC
         uf8w98ZP7fJPTRQlOOUMcCbHc/QcMegaxd3TbMiPwmbK7m/FnZpRkRV9CLLr//0kT9F5
         V2zzsWlvV/Efj2xVdTLkJMb6ZcsOuun71VV7ngWtRL4BRcL8e9ZF/lJJyezdYUZDJ9Jn
         h+iiTKAaNLOf/zF2klqnwNY2I+Wc++4yQqfA5d+SMJkA4LNa/ZpKQzXPv3gfcpVOn4Dv
         Er9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9VS0uRLsCgVKjJeKt7sSNm4hhS/jDFZ3iraNaTyawV8vPUA4wmwqa1d84KKUVUf3FWe1uVKTyEva35lg6I@vger.kernel.org
X-Gm-Message-State: AOJu0YzQtGfNUwabvvWrK/P+XZ91HyT/9FD6BVODKFq7mIci9XmzBuao
	aaqaRP+78GFPp/ogZDIaiQJ1Sk3gY3W4Twnf0/SDys98+vAT9PMfdlkP
X-Gm-Gg: AeBDievSTchSUxMmBrrvTskU4qxtfepMVE/jfLfFXE3Naay48rZsqoiVKT36xmWZCqF
	ZS7PdvM9S6/6faHg2hQ+HShd6GELZed6T/LAYGWlLv1w5YZoPca3o/X+OTJgCuwVHu9fcR+pUzV
	zh6byygknoktbaaVxxw2H4pndIjelX2hwbjT5kQKc16f0opuvK9YD4ubz+wyntK1PuGsc5mVbiH
	3OzAylJzLR8dc5T1rwY+2/oRJM0H+J5pJGnqIwiaMkc+g7EqOIrLYnAtCprkwLsvsBuCfQTSI57
	XOSvlcP09AdaIa1MJPsmWFDkmcGLqnOsll9dk0AlyHrCftRAqaMX4NxaWotCtwHgyi977UFJzUa
	+zdowCcj9XErvNOnxVuqpKyRANRkm5Yc0ycFp+lCQp15W8PEFDdUkEGOmaoH0eqf4bP0w3fyODF
	hKYqyhHdXf9+WKxpjvlnooO30ZTQ==
X-Received: by 2002:a05:690c:6b01:b0:7b2:7dc9:35eb with SMTP id 00721157ae682-7b27dd88a12mr158996207b3.50.1776347069632;
        Thu, 16 Apr 2026 06:44:29 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:28 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:52 +0300
Subject: [PATCH RFC 05/10] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-msm8939-venus-rfc-v1-5-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103425-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0194E40F2F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.53.0


