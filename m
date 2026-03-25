Return-Path: <linux-arm-msm+bounces-99923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLNDOMskxGmZwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:09:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 693E332A4EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA870304467D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC8441B362;
	Wed, 25 Mar 2026 18:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHYIqblN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A5B41B37D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462065; cv=none; b=hotwxKnz68I4lRbpZ9f7j9fR9+h72AqqtFlkTO9NXCmY2jyKhywhF8k95L++Z4pvPgRf7lVlGUubI9p5s1lHrLs3hSAwTS5aFWVD8SycgwWt3w4TtplUsvRbLoXkUjL73eMYShJk7GIyFdB/ppXu0EYkLbymjTD9eVHYas9wJB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462065; c=relaxed/simple;
	bh=6OG6ZQbJeltoxnqYdrb7S4/bj6Fp0zUOkvkCuJW35ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lRA2OqrTHIwdCdZbpZdqAL+TEkEXXA1WqP1o/Aot4BfwDUDY/E6sm0Rk+YtUiY3Bz88q6Tc4K63smiQ9rguQ15pGDr9ItNhXhAtu3dL9N/xV4BSBcGkYtg1buIBIbPaapOzPcO7IShyyVoCjcuiZkQkrHOpebC6L4+85BFb/rQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHYIqblN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b042533de1so649395ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462061; x=1775066861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3LjgTjQB+SlMXVNhHwInhdKxMmJjzyO9kxNTYHklAI=;
        b=tHYIqblNKibm5cLUS1Idiub9GVxPrqxSVVf1YfG+4c3zcQ651oYjnBA4CspMQAM2CW
         6/wfbGv/cBor2JhzvZTzC00XVL2n9GdeYFtcJO6THQunVkKlLCK82tfQpE9fFxMNhCjl
         vB9HT5aenL6QkixQmnbfOU3JEl/mvZzjCLHxyuQOvwy2wuLXFkB+sG7tWoXGr2vrBLSb
         32bnU59RYITv5/wPfN2Gs7LhPc3hko7HexqfRoDmJZy1yDGfPb0DDtv9T0Uoil28y1eE
         CF8imw/m6+yJESFyDc/GiSf03zfewaSiy/MJy5PWsV2wFW1oozWk9KifrFhzv7/KE5e9
         Dvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462061; x=1775066861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S3LjgTjQB+SlMXVNhHwInhdKxMmJjzyO9kxNTYHklAI=;
        b=Bb0bU5wq4Pf+PlbnpkHt/sfPHrGpDg6JD1KO94YA7feqfMb1uwotqIDhcZwzHATJB8
         NNh+Pdzz53EqkNpJ39QdvfFGEHWCa7vLa/95zkCqm7IDvR83L3Mm/Bb8aYLy1jbQI/0p
         xxQsJxAXlCZW5X2U0V8g/HQFoSK2KSHDjhMq4kPdVCvGn5FOjvNTZAfKllyGbxB3hmKk
         m+9TJV9s2unPozp/otbHdT5GcFqhoAU4N8Au6qz8xn8OgkQjxkjCz7z9oZIRwIBNEtTn
         4x3/3LwVmLYwazaxdbMuEZyUTmio0McrDe1IMZzth08CCsDLYAAHulQuJpp0FUuxkek4
         M4Bg==
X-Gm-Message-State: AOJu0YxxuxRLqczlYfL9+Al2iDDnOo0x/OYLecV5yLgWh6XRjf33zV6S
	NtIYCSNRcAcpOLpYyknZEFVsKNywT6LKn3NxR20BYFBy2JChmWAdGW0Y
X-Gm-Gg: ATEYQzxy7Q59IGbwFFNujlu5Xjb2farVDfPNXFrQOXWgm9B7Y7OMt2tcaAI/ijzCvnY
	BOaAgmRaqXJsT0LZRgrILk3JiF7hxi+aH4VaGvyxGVIw/Y+G9Jxv0chZxvnBaILu3FFLMB3XhxE
	IbcDf8Alg2wTOb7gI8xIbJ8QWhFKQ1op0XCYqnBeiAd26uVoZkcrwPFA90vv/8s9Ymy3cezrbaw
	yINnH0xMVuLw3ZlXC+sAbrfYqecEmij93N1oIoCi08vaJMHg0wAvna2bpJP+JRHSqnJHylEYdcd
	/F3NjNU0+xZPBQ6RqqbGtuNImi+dV/Sh276mvZW4zhUyZG3QXWKe6wua3JUzPSTlNGT9Xopwcc/
	g9UmfSBpor8xOv9TTl/nuRjRSoYepTtTygLKUaR1moWYrpK8tkUkNHUpMjdNrtj19YU/XfUKJ5R
	m3JStWhCd1K2b+TO995Pe73VgH0mNZ
X-Received: by 2002:a17:903:2c0c:b0:2b0:60b2:4dc with SMTP id d9443c01a7336-2b0b09cf4e1mr49434745ad.15.1774462061252;
        Wed, 25 Mar 2026 11:07:41 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:40 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:24 +0000
Subject: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
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
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=909;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=6OG6ZQbJeltoxnqYdrb7S4/bj6Fp0zUOkvkCuJW35ec=;
 b=/L75YqmElCivRnT3k1uY+DoU66iVUSy3psZfDffVjcwjfbXXx3kMslkg/jC4xSt8hIUlX+8px
 cr1phXGHRqIBjatTcmFRu41sIUd4E18nCR3eVSb9rAUz6oAxWXP1R+a
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99923-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 693E332A4EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the vibrator on the PMI632 which is used on this phone.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 7eecd9dc302..88691f1fa3a 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "sm6125.dtsi"
 #include "pm6125.dtsi"
+#include "pmi632.dtsi"
 
 /delete-node/ &adsp_pil_mem;
 /delete-node/ &cont_splash_mem;
@@ -115,6 +116,10 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_vib {
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.53.0


