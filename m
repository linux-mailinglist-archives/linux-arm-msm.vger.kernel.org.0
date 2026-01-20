Return-Path: <linux-arm-msm+bounces-89872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FgKEqzYb2n8RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 20:34:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC314A80E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 20:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D9FCA9C9E65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 18:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3095A44CAE4;
	Tue, 20 Jan 2026 18:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkt5Fcel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F0D44CAD3
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 18:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932075; cv=none; b=ptU73FYCWg4maQJgMwmXqwsGPXnn5z0FOO6E5ui4zUYehnZeYBiNiuVrekYHW1y8mURKMJw0lITZU7KTToenDkPyXKijVgjs0mRbozK3gY8P6O0TNhtv6Nm+n6o3v631mEatYCym3cFEgvohWROS/ZJHeOWtKatmK9vFcgb5Skg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932075; c=relaxed/simple;
	bh=oytAi/cqSts5jxBmNCuoIDDDrVXU9dCkEXlreujie8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WjTHJVA4AcCTLwVci6qFOCjbFI3n6Oj4/YRLLzDBfh357ATDfE1WNhb6cIOi5sitv9xNbJhuqkzhc7x/e9gL3M0+M/tfihRX015HFQ9UC22UbV16LUCJtUia7kyARIgqdaPHhv1MxCGyhhwOztNn2hP0c4O8lKFFjg2z2z6TsSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkt5Fcel; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so37633305e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768932071; x=1769536871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zQfT1I+T3qc4CsTQDm1xVB/Km2AJOgT89fsSmztyLo=;
        b=mkt5Fcelrp7/49MHax+M9bluMAkYFIiFbp/B8yfK5NJMAg7oTD5M6FWjh3/gFp1o7r
         edMohKF9qudI5NCQx+3+CIyC5I1mFVUcyyWSKAMWQm9NADw1uQY3UuDunz+ULXM2JWyb
         o+D0T9yXsKwD2f0+EynMkTK/IhcoNq6NODbZfHjp645TtHNFmYrco177UFnV6VZmIrMA
         1hk7HGzxR3IOg0M9f8c1jjN6V/mTUYeW0Nnjw4T4GtimR+QiZLkJL93Yp2V9K+U8cJEQ
         g+ysUqKlktNmCQH+BfEfcVqiTBa/NTG52xmM0Ei/89LaReC9+0USsPDAASExC68yJov+
         537Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768932071; x=1769536871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9zQfT1I+T3qc4CsTQDm1xVB/Km2AJOgT89fsSmztyLo=;
        b=qguCgkAQrAHU1IhRICM8gWyWrU3hRyXObrDdwPxx40Pmy2rie/Nz4cqA8IhI/3iBhM
         eiU+poTPL3qsv2D18C/sVtVvy9LXIc4fbdYF6OwNCoxZ3HD4eeZ+WABr9I2sXJ4jD6Fq
         JHxDGNBRDe1rmwAi74AXWbmCsqHUZDznf9pVIA0u8rc2u9WnOwiiIVgj/0nZsV0incix
         DzSOAQQVhWyL723w3dgz1P0YpgGRZ9qA9gFwhqffV/FIsA16VPR9S/0SOaj7HZOVEBh5
         wETxRDmksfJEHT0FZXfAT5VzhXC2+XCvw4eX3VR3LREqvb+Eygf47AzTXAAiAaHfys5w
         HnsQ==
X-Gm-Message-State: AOJu0Yx/iDaYk9FhVfNYjBHHyq7+t1WicS4KZprxKqf0zWB3VfrItgW+
	2fqRXGMpFgHqdga77H9uhc+j6hp8lb0wf6dvElfGDBjkxPBmuI1NA8YKb0OOaXla
X-Gm-Gg: AY/fxX7Pgh201M8fGZPhJQU+17j+c8KlI1UbNmIgdp77jN0oLCXXnfO8e125MkhI29A
	yCfSRQ0I9BuwXaVlaqY38o+KRC9MERpoqJwuf3XTD4OX15d71Jp1zXOfBy7uRgHUEJh1m++ksOe
	6MXtpNYBYHNGkhxNWE5MsVNlpLAceam1MdB2CIWcuNuNL50y9I6q/8k6gtjuV9G7Qhoc9E2Ta+g
	BGNYMfvPGkTLDBQ5tyc0aUNoAl3RrBABvqhIgLZrJ/6ueuu1gn4nRdL3nkNUyUnTnNaGw3KFrqr
	bLtcUZyhmjr/4cfjsQCqIge30guXLSQEoPp1rNCHp1DBW9XyK5cY9ReqT8me7UaHQepv4S10CUc
	MF47nogOsLbjVm7UWWxIwnrcBBtURBrd/CNiDhuQ9VicHf49FuvAuRiNPmf30Sc52AU6nzbOT8q
	Ugm5vwe+lyoo/auRnVFYML
X-Received: by 2002:a05:600c:4692:b0:47d:3ead:7439 with SMTP id 5b1f17b1804b1-4803f44a19amr31073615e9.37.1768932070597;
        Tue, 20 Jan 2026 10:01:10 -0800 (PST)
Received: from unknown.zextras.com ([78.208.157.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47f429071a2sm312013015e9.11.2026.01.20.10.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:01:10 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	david@ixit.cz,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 3/7] arm64: dts: qcom: sdm660-xiaomi-lavender: fix regulator and SD settings
Date: Tue, 20 Jan 2026 19:00:48 +0100
Message-ID: <20260120180052.1031231-4-morf3089@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120180052.1031231-1-morf3089@gmail.com>
References: <20260120180052.1031231-1-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89872-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[morf3089@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: CFC314A80E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix regulator configurations to ensure stable operation:
- vreg_l2b_2p95: Increase max voltage from 2696mV to 3100mV to support
  proper SD card voltage signaling
- vreg_l3b_3p3: Add regulator-always-on to keep the regulator enabled
  during boot
- vreg_l10a_1p8: Add regulator-system-load of 14000uA for proper USB PHY
  PLL operation

Also enable the SD card controller (sdhc_2) which was left disabled.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 6467cb4dfd16..9a6dda47941c 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -82,7 +82,7 @@ vreg_l1b_0p925: l1 {
 		/* SDHCI 3.3V signal doesn't seem to be supported. */
 		vreg_l2b_2p95: l2 {
 			regulator-min-microvolt = <1648000>;
-			regulator-max-microvolt = <2696000>;
+			regulator-max-microvolt = <3100000>;
 			regulator-enable-ramp-delay = <250>;
 			regulator-allow-set-load;
 		};
@@ -92,6 +92,7 @@ vreg_l3b_3p3: l3 {
 			regulator-max-microvolt = <3300000>;
 			regulator-enable-ramp-delay = <250>;
 			regulator-allow-set-load;
+			regulator-always-on;
 		};
 
 		vreg_l4b_2p95: l4 {
@@ -239,6 +240,7 @@ vreg_l10a_1p8: l10 {
 			regulator-max-microvolt = <1950000>;
 			regulator-enable-ramp-delay = <250>;
 			regulator-allow-set-load;
+			regulator-system-load = <14000>;
 		};
 
 		vreg_l11a_1p8: l11 {
@@ -295,3 +297,7 @@ vreg_l19a_3p3: l19 {
 		};
 	};
 };
+
+&sdhc_2 {
+	status = "okay";
+};
-- 
2.52.0


