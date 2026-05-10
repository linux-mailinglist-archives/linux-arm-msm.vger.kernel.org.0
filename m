Return-Path: <linux-arm-msm+bounces-106804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIg/GeVUAGp5GQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:50:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD317503721
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A76513038C78
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 09:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC6737C92B;
	Sun, 10 May 2026 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF3LGAsf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139CD34405B
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406486; cv=none; b=hFT+T+kOPMP8XIPeg/EyC42zwhKWC/jJz48dbupkX72shcMAu4Z9lK3ZHJac/mb55NQW+ZpJZ3Rc526RVs0kl5n8MZRR2IJ7OhkMrXjYWu97WCph0Mkd/xChJCLwiwbrH1iF2r+9QJyM8kxqMyQ03Q/DERsPT7yxzhJyrXl3UgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406486; c=relaxed/simple;
	bh=u1ZxeAc19H3I75eYjPO22qxUQ5RQA6sI/ieAA9yHFvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=of/1zHTIuTB71EhrNtdYA4eDyskZ3Qqi0s+AXUZPAX+APLNzB0BOIIGVV0ofxWmANIgx09WuTB4G4cgSnWHKF/PA+dPkpSlXIkowfFzHmE9Qk2b/QokmnEpFTQDWk1w/EvkbXZuufNZ+prP8doA+2qODGGoxtWHRdytljp+EEII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF3LGAsf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso19167575e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406483; x=1779011283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=lF3LGAsfl80ehNtg8BrBQyE0KVsNSI9Z/gl1Fc55p7oeMbSvG7MvTEZfywMwlP98wc
         FKGQD87SwGe9PnDexx9bq1fwdB4ZOgQzlmxSuuNrCrNxXrzzhioTMcG5sI9utieidbNO
         ss0oC4fN+NeIgFbf9v7SWFE4djnnpQd6JMUIlF7G1h3qKS5pwBJgX4pi0MNHY1o1C3Au
         nfSywopPsUmVdmJ6TUslR2FwMfEQtMmyAh936QAm63muvTU8rIVvc2FgXxjcgUFaL45P
         94eJEIApjJncidadAPJWHGU8AKwL1FfNPbn8yq6mwweQ1fEwH4pP8L/Bp06e686fp+UJ
         BbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406483; x=1779011283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=q01q41pRtg/TeUbbSQJseYLUQxzjDtigdX6gxbsnK19CRpjqZ0rbnzvTRaF01t/rfk
         yOCg2FV3fIp3/MpZ+HONQpxlFUTjOXgZgZznMbtEtqJ8O1t13nr4SrSFHQvUPDMPcC+h
         lTnHZbIOiHE8LSAaLAbCVprjJOnjbmdP4aCBsuudycr7tQs6VhUjIfwvX1SOuXzreCoo
         v475pSYusUbtYqFvOtdaCe8nEBOh5CRK7cF8snnRfQNOAoCljWY2HEmNoiKyaOrt7ZUx
         DptelpFzCRB6YHa2XopcRng5fpqL3B9XAUL+fDaoH0OmsnZUgK8igNtRZe8lztECDMli
         NLIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vOK9PtAJSuwB4Qkupfmxot4ScwaKRLc7MWa6kmJUWt38S6MyQtMRCeulc6RK2lbBrMntM9ztsuzV6VvI2@vger.kernel.org
X-Gm-Message-State: AOJu0YyS4+bzCJn8ngVlD8QKhMWOhJ/VP72PNVBr2c8a1Pgo0LCl8rzn
	1fi404O9tHLShSylZpABs+ofBwlWYGzcbkCnshQu462G9fKpL6jwsgBt
X-Gm-Gg: Acq92OEwPSEz3pkvMGLGfmE9xJsFvsV95+8ZJ5l+EXIPlfoC0MCCL2WBl9VTRbyCMsc
	LNn4/tUczCzs0zqFUBN09QcF3MzWZftJsimVL7jPFfRIkS5HDq95LD9LcRAN0U+2Ir0Dy8c7tNh
	gBiR7PrCMjxBPE1FUPKCjcCBwvTJEBFH2G+1/FnMZUIVBTcNSoGltHVPar/PWbsR2G5a1wTvJJm
	9uq5XPXBb19RUm0hc9w0Wic5ZA/KcIIfJf7cM1aoxU8DId8dUSKhNzrQ2UDWqyAWQQiOD9SCyaU
	RyXM55pSxIakgqbJIPcVEkwC88c4aCSDuP/ZQmCP+w4maA5uhHepwRrDieLk4HuUyoI4GO98ETu
	is0q6hkb23Qtu2OZPXg1938s4uNOftf0IfodhF63spDVsBXBE9u5MZbeKoneRJOdWOahadgVzfi
	CwHyoKON4YTBmA6Q83XXH8gLWKDXm4vIqultfWLrI=
X-Received: by 2002:a05:600c:8485:b0:48d:5c1:bc47 with SMTP id 5b1f17b1804b1-48e51f32a6fmr330837045e9.15.1778406483419;
        Sun, 10 May 2026 02:48:03 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:03 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:42 +0300
Subject: [PATCH v6 4/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-4-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
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
X-Rspamd-Queue-Id: BD317503721
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106804-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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


