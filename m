Return-Path: <linux-arm-msm+bounces-106299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIbNA2ZQ/GlOOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:42:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 846A04E4FF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 287D130F6F26
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE52379EDA;
	Thu,  7 May 2026 08:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rXxdaVS3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D344436BCE8
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142845; cv=none; b=T3YmJl068+jJxwePPKvtUvaWaOgTPUJpIYyqna7ZmmHKcDjIHz15+PmbxrlS+nMeMkQjB11AakkZJFVsL/qyZpgRNzjlADjm/w1IHw9r2AZfNi64HX/G4Kw1bW2x8W8ktXk58hbcmI1M3wXbTfCcKFSs04AjmDyXwNC8rb1t21c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142845; c=relaxed/simple;
	bh=VSLaSITH1xdATqlS484rLYMQm4ukxtGBmOVJ8SIHjDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VBKGSHwIFlxleLJm3Z/hl2qmt0VdoHfOKLGX96TBxefn255uNoG7u9/PboPfXVgYkiRouhJ91uGFU6I4wVQ8wY7WqraOT0oaNKW5zmxX3AE4hq98ggLnUz8ZjKrSTe/ooIqgULTXEBnU2ttQMxwGHUaH3BAmo9y8sywJwRT5K2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rXxdaVS3; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79a46ebe2beso4807867b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142840; x=1778747640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=rXxdaVS3fSOryhQ5hMlk62YVWFmUEjsKgxdO7xY7SlSfQGyTdffiFDhUUskYBq/TBa
         oioaFLbmGSxpjpOHqKssQmDLPGR5MCNCLYofYL4XSTwZoF4e235oZlTq+GZ+B/Z70xcD
         9YzutURvE18JSZ/hkwrWRM4gM2pcb3wsQHUlRfteAjepzLxjomBzsJXu+lvbCUsBC9g1
         cE3oMobPsxm9WcPcxl9avG5wxESsesnQbqaU7WqNiYuiEtYKIoyaepg6e99OyKc/36Au
         EE3+YDhOXGWljOfb/QdGpXdMwn2vpkHw8Kru+G23TyiqGueSxB8dYpnkOlMVu0Gn4VkL
         jRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142840; x=1778747640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=P+HwtEHmoXYdGpgKHp5BwoJ4+UY16wqqg2T8keFeI8VOXg4hX1qDCxSotj7KiIr6zc
         hSKnnZQ/9kJ8KUmB/aH9DzsjxSathOnK3+506o5NEDRsK78dlIP5x5CoeQ0iw10MfHTh
         eaThA9V/G9J0JtWFY5P0iKwIv8wovn4bXpZpm0BN25Z/vJVlQQWZ3/kmP890/+7wmv+w
         HX+MNSMFD6hjNqkOWkFVIjd7pGPfdVwLLwMLirHPmQstNZEP0qEIH5DhHESIOZKOVfC+
         uaEaH+EygPK+c5nwdtreLhy39tGOXuYEs96vfafBeyiwrDCi+9ONbffAbcZlinHDIq4Z
         nq5g==
X-Forwarded-Encrypted: i=1; AFNElJ8LKtRLqaq8ALF4Ap8/B1dQgF+ierdSScIjCwj6+GHAQGgvgTC65i1Ol/1DFYvZY/cM7VtWLgV3F+ghprb9@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBWjw1nCFnxtsfdtpj2Zyz07XZ9omydD7ec6y5ntkh4SMqKwu
	/B+6blaplhvK8vmjm+59K7k984pkDh7A12h+/1EEN1KTejKhaUDQbxlQ
X-Gm-Gg: AeBDiev3uSnjOr4vas2vT+t6WgTUeQPkR7V4SSJP3nZFS8R9ZhdgjQOP25CzuPiwsDi
	NQmFf6XSuISk3TNzIDp+bEz6QcM7Wl3WPYImw9yXrj2c7hFYsB2yiJVAQrDC2vsihlpD0a5ciOL
	Xap6nFieqVm8vBorGPSdJibbxA1iK/rVwlW3ULc/hwX1Q91fyMrwsMpELeIEkcvOYsqgr5Z/Kxe
	ac5AXRggBfivkIpF3NncczjIVe7bOe0XSTiTa28XZrQVip7W8QXnnJzjZsKy2tOAAuB0DztFUyl
	Ym+q6cMn2CD95cnaCGmmI11RF9fSEngMs/HseXZayD/viCm2vEA2xfiuaEbU+OOGqjVnFvEJ6Vy
	Iq+U3wRSVV33k/+rm92uK8dnzvUeHGyomEqEW7+kybQqhwyRqUKMV7fjKRhIvRnAdO9WLBmT8aC
	GcAgvPpzRRqlOica9jLCbdi/9l4zUWCH5dNiXk+cn1MiLKiVk=
X-Received: by 2002:a05:690c:102:b0:7bd:4b22:a05c with SMTP id 00721157ae682-7bdf5f02a65mr69836497b3.49.1778142839569;
        Thu, 07 May 2026 01:33:59 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:33:59 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:19 +0300
Subject: [PATCH v5 4/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-msm8939-venus-rfc-v5-4-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 846A04E4FF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	TAGGED_FROM(0.00)[bounces-106299-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
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
2.54.0


