Return-Path: <linux-arm-msm+bounces-35279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 632389A90F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 22:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84998B20BB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 20:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A0B1FDF94;
	Mon, 21 Oct 2024 20:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpVN5mDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBAB1FCF57;
	Mon, 21 Oct 2024 20:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542151; cv=none; b=eV1Yq/31ZqQpR1n/WQk3Ao3FfzjAhE4t1DQFaMvOlFIV7s3dH3Ypma1rnRfow2kX3ylBCmYMk1S3ohPWGWxU1v1zmudadJHZxkQlRf1iBefIkwrNjMl52/wJyL0+JwanuS1iJ0bI+eG0dbZJun+YFn9AIio8glMc+8m+Auh4EhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542151; c=relaxed/simple;
	bh=nW22kA3OZ8EJw/l5LRYWZwP/cEEwRZBk/AkUyI7nGVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZrMxgFOQrcdNIjqg+Q05pzXpzO5RBO3WO90eFccCmLg1xhymaYK/cBqkQPNcu6ekxSQAeYEOv6GfX7qQsrSXxV82Gj7bLLamH9wHwhKGnW5qbt8Uyt4/laDbmJ6NRgWpTvvabyCh/WEk1GFoN95G0nVf/XMkqsxus25jCMenXh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpVN5mDA; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso47632041fa.0;
        Mon, 21 Oct 2024 13:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729542148; x=1730146948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Le88MClF/oogWi94ucU/sxxSZSDZmIFKIazI7EAYOAc=;
        b=GpVN5mDA1ZkeEOPuMIVjoCihT8NINUXm6+uiL4xzG+iVyz5A552ARAoKtA1sLSw+JS
         I3SjgUNAxu9mDr6XbUHaVcfLfOtJ+orkMOTIw96KYPuKARA1z/vov8EzFF8BsDWLRcKO
         +PnwgQy3z89eWp0OXIp1bRvGCfTNAzZsydNLhpUFxJh7bTxtlsVK7mj6Ncfl8LdhBLEC
         i+ZzHYLn8yAzAhWFiGuZGmy+kYuZ2uyd/uoiVg+WESMa3ntGs3sGk0t0QFqsaBZcF1zz
         pjGoWaaxYRhx9C7Zt8VKJs6Sigm5PZoS/x+ObijO3oiY1lY9IMThU7aSXoUXggQcOED2
         z0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729542148; x=1730146948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Le88MClF/oogWi94ucU/sxxSZSDZmIFKIazI7EAYOAc=;
        b=oMzFasKsgOJ6n5TVGmuRQnvoc9HzjuB/4VYaVYNcv21Dcwdh7cIfzhV44y+LgWcvL6
         fT1K4BNNoJEhMWZa85u0I2rw2D9j9FM4i+NlHq+1Z/pqKIoRZPT8b5ubdKoyZQ+Fq4nd
         hbi/9GesmuQFmMW64Q81GIeyyXKwd+PC56i1dEBYzSnWLIG7KDn+9ZbaZkK5bruSLQid
         WnTTHmEMT2JQ2hqxGe7afAhAH00ZnFuoEM469EaKq4Z6xYRJW7Y5wAGtsADuXI8mghbV
         GJ8SnZlEbW3jUb9jule0fPnaTailJqq1GpNEMU/hk7ZtPAHFXJLjCc9b9iaJWaa4zNgI
         iuSw==
X-Forwarded-Encrypted: i=1; AJvYcCU0QAf/IPmOvl1XlU8G8dqMr6uymbmiBejI+QJrRhvAq/6q5S00Wym+1l/U//O8noRRRyNGjAdDNSnS07dw@vger.kernel.org, AJvYcCUfF4IKg7ou5tsU8l2a5+gQ6C8kmcqBeahcN8OVIsb+6hgzFvRucp/kxz5QDRK3NaMchogMnaAWRbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnenPo5E1XSnJvpXpv8zpH1NkMkNfj81u1UwJ/7aPuIMaD8uLa
	oU0KzwRuCDmp1dY7jwRrxekmzZ0iryrldq+Chh8XIf4FRTjpVPEH
X-Google-Smtp-Source: AGHT+IG/h6nTU2w6uC55uu0G1qJPZMDvmMsoWuZlhSScKnAICacSEqRQHJkkjr+1usLpye1ZlnJBaQ==
X-Received: by 2002:a2e:bc28:0:b0:2fa:beb5:11cc with SMTP id 38308e7fff4ca-2fc9335a475mr1049951fa.40.1729542147404;
        Mon, 21 Oct 2024 13:22:27 -0700 (PDT)
Received: from redchief.lan (5D59A6C7.catv.pool.telekom.hu. [93.89.166.199])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a654b9sm2366497a12.34.2024.10.21.13.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:22:27 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 21 Oct 2024 22:21:57 +0200
Subject: [PATCH 1/5] clk: qcom: apss-ipq-pll: drop 'alpha_en_mask' from
 IPQ5018 PLL config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-alpha-mode-cleanup-v1-1-55df8ed73645@gmail.com>
References: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
In-Reply-To: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Since neither 'alpha' nor 'alpha_hi' is defined in the configuration,
those will be initialized with zero values  implicitly. By using zero
alpha values, the output rate of the PLL will be the same whether
alpha mode is enabled or not.

Remove the superfluous initialization of the 'alpha_en_mask' member
to make it clear that enabling alpha mode is not required to get the
desired output rate.

No functional changes, the initial rate of the PLL is the same both
before and after the patch.

Tested on TP-Link Archer AX55 v1 (IPQ5018).

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/clk/qcom/apss-ipq-pll.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
index e8632db2c542806e9527a22b54fe169e3e398a7a..dec2a5019cc77bf60142a86453883e336afc860f 100644
--- a/drivers/clk/qcom/apss-ipq-pll.c
+++ b/drivers/clk/qcom/apss-ipq-pll.c
@@ -73,7 +73,6 @@ static const struct alpha_pll_config ipq5018_pll_config = {
 	.main_output_mask = BIT(0),
 	.aux_output_mask = BIT(1),
 	.early_output_mask = BIT(3),
-	.alpha_en_mask = BIT(24),
 	.status_val = 0x3,
 	.status_mask = GENMASK(10, 8),
 	.lock_det = BIT(2),

-- 
2.47.0


