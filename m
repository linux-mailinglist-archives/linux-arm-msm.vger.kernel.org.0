Return-Path: <linux-arm-msm+bounces-35280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DBF9A90FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 22:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 656291C21924
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 20:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299021FDFAE;
	Mon, 21 Oct 2024 20:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwDcaMvA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D791FCF78;
	Mon, 21 Oct 2024 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542152; cv=none; b=PeplsseIclNXoV8HH7RhgZNC+yXVeN7U+vPmgD1ucInr6PKV+y73GtYgMQDwVjida0bTg8m0aoBgE5v/OWMY/l61wQzlNPZISwP1JQQYtxekd+gbkLyrMDA4YRXUJZl1psjGAPji3gDUOIsyPpcOtGjKtifvVysWCTmP6K4afoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542152; c=relaxed/simple;
	bh=AL6RLYuLt4zWQRHLjhbYdG3IFFX5ivF6IjLsk67Ud10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SFBdKrr6+BAeKIXTN6docpiBUgJ2fHRijrj29vKDt8y3XCGIu+dxcFwUEyZTS4dupBjhnhR/04fcom2YfY5pDorEvZxj/9zFJwEjzDlm8+F/mhK+McIgcY6XO5xmppDbJsDFdzlGIWtIIW6+WLdfUYiOkvV79fnvtKXVxYDoLSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwDcaMvA; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c94b0b466cso5563329a12.0;
        Mon, 21 Oct 2024 13:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729542149; x=1730146949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNEH/622O/5zc0yJC5K87eSPeiZM18UZH0FAszllMAw=;
        b=fwDcaMvAbFASQMG9sh5rJz8tsOtKop45eSyDyr4GEJP+0hSEFsB0rUoDPZAJrQ8PcI
         V/S6HdQbmJqbBYKZnNXoZ5YCKlsX76Ah++lsCdi7ld/7EE65rUIteBFL6RCuqn0Fr2v2
         V+VVD8ABYfVzkM9wqJyj1m2Mn2EIahhK0zTo0DuGYLAdu75brU7S0hzaKoBrkazYd2U2
         m/c4tAQPRY5J2L2kEjJR5S2VbVwtyQXnBJ0s4ovMOPKFXw65EKn6+INBVv8c60hXjPN1
         3gGIXpW2mnF97L4qYdVOyXu6EgId32kLPI9XlLRXg7nZptqJIl64k6BiOLD6tODOlU1H
         TQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729542149; x=1730146949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNEH/622O/5zc0yJC5K87eSPeiZM18UZH0FAszllMAw=;
        b=tz2B4JcRFuXAsr0OgdowuR0QnGcv3PDJYeXnBGkkRlmPbGpltUTgzo8JbN7riG2QU6
         d8NhC83mA6kSVrc5IOlLd2yddersH1i1JApur6KFg/iBnTtv+K1+/pN2D4gYCO5xUrzD
         JWjjcPG7iFxTw2eMsKdG3/e9z7vSVvDFG9l3go1ki6C/vX9HU4+wE1QGbGJnBDl6IhfN
         H1TUQnx3YuUZl2bRMUtJIF49YackVWTAywh/fRb9k/hS2UzkU7H9E4KOoJp4hqvlBHjb
         OTA/k0lP6shY68xpKzhDkm27EsSzdfPj4qfzvWyjAcsklbT3iy1FiCRBQG6H4Rxh2Ecr
         WGGA==
X-Forwarded-Encrypted: i=1; AJvYcCVvc+csiSFiz8fxvsNDAU35SG+k0lFAqqIJ9BKIoM+U7Q67f8iAh7H9BDhBQmyb90woJKXFaEGCBfc=@vger.kernel.org, AJvYcCXJZzwuiH7MADs9l82eHCxLAro8NXCgeiBMsBZlDdUK9oNk6rxxFhM3idjgu0ibgbH5OUvmkN9doITOyW0s@vger.kernel.org
X-Gm-Message-State: AOJu0YwMX791Bei/9QxF8YHYZk70gtNyhWZR2zZfJ6cN5M+qcE+v4+YN
	QaUIg+2QkOwOyjsB3ukq3ANU6NmWboSWV6ZpnO6elCdNGWjRQTTU
X-Google-Smtp-Source: AGHT+IGT9HelIXWhpB25KQ/wXCYeHl+HhjrhCjQsSKEeNbwtm5u5vvLGOLAkHKfza7xnwr/fICnYtA==
X-Received: by 2002:a05:6402:5107:b0:5ca:151a:b84c with SMTP id 4fb4d7f45d1cf-5ca151ab9cfmr6731971a12.18.1729542148604;
        Mon, 21 Oct 2024 13:22:28 -0700 (PDT)
Received: from redchief.lan (5D59A6C7.catv.pool.telekom.hu. [93.89.166.199])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a654b9sm2366497a12.34.2024.10.21.13.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:22:28 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 21 Oct 2024 22:21:58 +0200
Subject: [PATCH 2/5] clk: qcom: apps-ipq-pll: drop 'alpha_en_mask' from
 IPQ5332 PLL config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-alpha-mode-cleanup-v1-2-55df8ed73645@gmail.com>
References: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
In-Reply-To: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Since neither 'alpha' nor 'alpha_hi' is defined in the configuration,
those will be initialized with zero values implicitly. By using zero
alpha values, the output rate of the PLL will be the same whether
alpha mode is enabled or not.

Remove the superfluous initialization of the 'alpha_en_mask' member
to make it clear that enabling alpha mode is not required to get the
desired output rate.

While at it, also add a comment to indicate the frequency the PLL
runs at with the current configuration.

No functional changes, the initial rate of the PLL is the same both
before and after the patch.

Tested on Xiaomi Router BE3600 2.5G (IPQ5312, out-of-tree board).

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/clk/qcom/apss-ipq-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
index dec2a5019cc77bf60142a86453883e336afc860f..d6c1aea7e9e1e50a8d7561ce352feac4e76fb1e3 100644
--- a/drivers/clk/qcom/apss-ipq-pll.c
+++ b/drivers/clk/qcom/apss-ipq-pll.c
@@ -79,13 +79,13 @@ static const struct alpha_pll_config ipq5018_pll_config = {
 	.test_ctl_hi_val = 0x00400003,
 };
 
+/* 1.080 GHz configuration */
 static const struct alpha_pll_config ipq5332_pll_config = {
 	.l = 0x2d,
 	.config_ctl_val = 0x4001075b,
 	.main_output_mask = BIT(0),
 	.aux_output_mask = BIT(1),
 	.early_output_mask = BIT(3),
-	.alpha_en_mask = BIT(24),
 	.status_val = 0x3,
 	.status_mask = GENMASK(10, 8),
 	.lock_det = BIT(2),

-- 
2.47.0


