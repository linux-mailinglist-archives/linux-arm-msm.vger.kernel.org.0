Return-Path: <linux-arm-msm+bounces-90022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMD5GIrbcGnCaQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:58:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C675808A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 759E26C88F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E942448AE39;
	Wed, 21 Jan 2026 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHp+2RiD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E084248C417
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001995; cv=none; b=IKvkeH8/t7ZTyDQJdF9ZVkK0lkTmpQjnKT/iwebIs37p3mPhPhMNUfaJUkv6pgpP/inXJ5A3nGVdc2WcRfgw+0bSm2ZIrwMk6tROqpQEUjACQnGYg3uceSSgbVZhnl1dvsnCLL8LV53fcwOX8X2XTXd/dynw2Jx4DZCU1XhPp0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001995; c=relaxed/simple;
	bh=vT34X6xkb68tPbS4gRp9qBYxaeoKQfD8bI4dASKdlTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/s/j+bzO00piE0e4FrAUW19SI0nyUFv06aBoti9neWv963QAvcz/lhz6aS0h8Hj0z6LrDOfRnSzfGJ1sYhOUthjkHXrJI9L4C903MwBfI5roi7Hl12LNwTeI9AL9RIg6WHxy4bQsHH2NKyKdE6TakG9qpAVl+ZsVssgG/oO/Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHp+2RiD; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-29f30233d8aso43436555ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 05:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769001992; x=1769606792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UqvgwyO82OPHh7jatW0k+8VFxz8uHhNnaHT0APn47E=;
        b=LHp+2RiDn4Pojg6vicZqbIcwPqytKO+Ux6aeM+K7CC/Qrv9Eip7p8Rz5BqZQVJLdwz
         vJcMXvBCl0YQb56r2rvURlCs55BSFPczF4m1vVUMOoNjQUXiKjnhG2P5b0LCaXkg5h3M
         wrEskPRJj+jY07Jslvgjqx+cKesKw5GL0AA7j99Jy5e0a5lwpPS/fC0YbgnPAfsRUcYq
         XoX3zegOddMq6DDOElkIsYPne27n911k0g6PaxyJ5F1c4xC4r+M18iD0rshNCOVxBlto
         7TI4isVdMFaXvU8PVYPw3VkczrEEQSDkrFWvwsuS657D2ddoav280/CBrj3xVzYlnD1O
         7+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769001992; x=1769606792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6UqvgwyO82OPHh7jatW0k+8VFxz8uHhNnaHT0APn47E=;
        b=DrhlqRYbJOzaPCQfzG9rjobB/wrSg2QNAGVO7Eb74aQhFTIt+Q4cGkmXTWMzn5PDGE
         cBaOzJ2iVKWxBPlL2+CXWXGAuDoAXGYKMHsrX8/l4zU1YDge6DsAGvSmcoDpDVcp28xJ
         Wi1aSGVQyZR40TShm8ICSgnEHArKi51L3WeC9jt7xjp14LfpvpMPOO1KN/cqv6Nt361p
         NigAqXPajfRV0ft1yKyzLV05b7sEWwNR/0ydcQt3MqHbIoQuHuikXHDawYuTwfVq+N9a
         vM/it3LIt28FjSTs8TyoIuHeP675b6W6+FavrJkx0Pa8aAWllwZrQWOD/qY9c3ZSCRGy
         nyOw==
X-Gm-Message-State: AOJu0YzFc3NgvLA+MDGBRSMqD5yxDsrK5GN9RTIdP2AI51Zpxy/oRp9p
	b0iZAEyTJlCBFebDWu3RZKAtHxztzsCvMI0deBPPnKxmwIu8ERO7JcH/
X-Gm-Gg: AZuq6aJPxOAdWgdqkYslBiSGQRhenFsjMV7H0DboiDuQ4tzi/K8fWowryKAtBEZA07J
	cUCD4cP40OVPRR2Y8Uj7feITOvwFRkhEzqIPWEXTxEB6FUXHLlg4AAU0eweBJQCJM2a/I0ye45w
	j/Neq0rSgJDOcaAsnALGROILsrx+cS3mLdQzWXPLOnW4EB5HoCRB6UKvuuxMJAUdzs5gXCTnS8B
	TNjzpZL/1GCH3j2x0hw4h+z6gv4V+mxz/UBIwq951n2QOmCrDxJQoquCZpZoWkiivGxc/YhUSqz
	8X6XjDN0oYw33DrMRcsab7NiS5jNXwZiwEBFqYFq1oeej+1+4qAnbhEZ5szIS8mKU3KHZQjJD5D
	fSiAziEAVYIcTlY9CNWMrclHUx4DetWblB7J2FV5LOjyUcmD1195gGOkUxfgEoO40kuK9Ds5jcb
	ZhVKbwoCPcJ8j17OeZ
X-Received: by 2002:a17:903:2f8a:b0:2a1:3cd9:a73a with SMTP id d9443c01a7336-2a7189482fbmr149873705ad.40.1769001992159;
        Wed, 21 Jan 2026 05:26:32 -0800 (PST)
Received: from [192.168.0.101] ([45.113.101.30])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a7194164dfsm151487235ad.88.2026.01.21.05.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:26:31 -0800 (PST)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 21 Jan 2026 13:26:17 +0000
Subject: [PATCH v2 1/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix volume
 up button
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-xiaomi-ginkgo-features-v2-1-fb3ee94922d0@gmail.com>
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769001984; l=1268;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=vT34X6xkb68tPbS4gRp9qBYxaeoKQfD8bI4dASKdlTk=;
 b=UwOKiETrMako3NLi3SVRzltWFBuYQCNiE1KWh9EzACbw/J1t3sKXu8PfccbXkGnMs9HKc4iv5
 M2LdtZz6yENB0lv4GwPx+CB+6zUYccBz5WznkuuQXhgpt31V7Tp62s9
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90022-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 08C675808A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gpio6 in pm6125 is used for EMMC and UFS thermal monitoring. It is
changed to the correct gpio for volume up button.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 2605d0c94..6e0333378 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -85,7 +85,7 @@ gpio-keys {
 
 		key-volume-up {
 			label = "Volume Up";
-			gpios = <&pm6125_gpios 6 GPIO_ACTIVE_LOW>;
+			gpios = <&pm6125_gpios 5 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 			debounce-interval = <15>;
 			linux,can-disable;
@@ -96,9 +96,9 @@ key-volume-up {
 
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
-		pins = "gpio6";
+		pins = "gpio5";
 		function = "normal";
-		power-source = <1>;
+		power-source = <0>;
 		bias-pull-up;
 		input-enable;
 	};

-- 
2.52.0


