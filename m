Return-Path: <linux-arm-msm+bounces-35281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0689A90FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 22:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54A16281BD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 20:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245CE1FE0FE;
	Mon, 21 Oct 2024 20:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsFuyW31"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDFC1FDF91;
	Mon, 21 Oct 2024 20:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542153; cv=none; b=gi7we6RCiP9Q9CwlgAy0qJI/3DmSvEq6BgxwraM4rSPb82QAS8Mw9OxeXIKwsgXWYjD1CfklKtxZguj4hVgRsznauab6fRokJcpcL0R0/TRktZQRheJDkrxUdZIOFhgPv5e5AwJRFRJ8MmQz0pOD5EWeVNdVFiqNUBw0om5sbkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542153; c=relaxed/simple;
	bh=+eqpVxj18IKkNxPlnSqzMVQV3IXyCAd7GNvYT+LQcPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZM+Rt40iclRGOdiuRZqpJjHr0KaLN6ZAjRRhgINUsm61YC1jJTX3YxDRHzytrPlm4nBjsRCdIDcTHxk/UUNo/gmhU8gyul6asp2ir49Vhty+UwDfVUlApfJXOMQTJcG4QhabQjO+RK7XX3WZBhTNY3Igh4cF1IOmxh4RnSAQet8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsFuyW31; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d4c482844so3330096f8f.0;
        Mon, 21 Oct 2024 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729542150; x=1730146950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZLYS1OEzQ8U66l/dkY11+Zsi+x+7OGdOhDex1oCwpY=;
        b=OsFuyW31wzzs9eWeV78M4KAqGmW9QrVlABnHDR8c/2ynO61LakGJZ1wXTcTuEm026W
         0ACXoXEC6SKQb/+d4tujjErH3dDTSRzQmfaXo+Itp2kBqZpAcsl4qsCsHYXLi3e9mI4Q
         krMq65DbTQWRpJpgxkitX8bD2j77jnH0MsRdWroQkNdbbp1/LZ4q0Kp7lzx4Pne71jYo
         SOlPbJk+JR2AZy583ZQswIPi+Zyoi1SC67pULp4FxKFQYBmJ+KXPapHWsz/1YK3Y1zHX
         HofP6s1+UsLjfsWHWEZA+P3yGkSo0muJh3F7YnKXWyIxx+RDgSkHRz2Ytu1r+eJQqTU8
         ccDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729542150; x=1730146950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZLYS1OEzQ8U66l/dkY11+Zsi+x+7OGdOhDex1oCwpY=;
        b=S6Ou1jqU63leKEwbD+4pUsvz2UwYZmHaDv1oIW0kMTE4sEtZihoIF5JYu99CokIVBL
         SsQRKuPqTL2rHygkAjR6LBVttzXWmoPKF2lakARbPEFJYacN7CkSpDa0sL3MWgDDEy3U
         Nrme3+ZnJrvO7iXDdwbk9g69Dvs58L4DWLpDvr2IpfJPppK4A7UCYwbzReUzUMRGgfPR
         Fu3RhiI4aBII9IPI+Kh6Bl1CvZNXGhYJJVf2Eof7goeaRaWQONXinNmwCExe4JsWBsOf
         mpZcliwfkkwz9uu++lP3ICzCVJNpFaMN0Hr+RAv0Z4te+rir+II9N+zY/aMhgzrLQwsy
         bYFw==
X-Forwarded-Encrypted: i=1; AJvYcCUWOajruEzUshN7b9GNMtLDcBg3E/sj6/Vdxycg8zg5gRgW9BWxR6rewJp8cdJUg/EhWiOJp4OeyscviUUp@vger.kernel.org, AJvYcCX1IifhI3bmevNEnSwJxPQ4SoqX3M3N1za3nZ/qTMd5Z92SiDw2yOMEFChPRgZoV9iZE26xUbTw+8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmKa2gIq55tlLuL6W58+VfMt9NsgiXkk6KHHLvg7bGmp8mfEzU
	Im3+FhtQ9rB8RQsKuDQVBjlaRqv0yvcIPUps/CyHHzX1J9GBQ/6R
X-Google-Smtp-Source: AGHT+IHs7j7KVkJsSgtcwCaEv6jrSWKQnSLJGRFh80uOiAHFAkXZPB5AGk8IGnjhPgx41r5gKQelXg==
X-Received: by 2002:a5d:4452:0:b0:37d:393a:97c5 with SMTP id ffacd0b85a97d-37eb488cb8emr8912512f8f.28.1729542149684;
        Mon, 21 Oct 2024 13:22:29 -0700 (PDT)
Received: from redchief.lan (5D59A6C7.catv.pool.telekom.hu. [93.89.166.199])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a654b9sm2366497a12.34.2024.10.21.13.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:22:29 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 21 Oct 2024 22:21:59 +0200
Subject: [PATCH 3/5] clk: qcom: gcc-ipq6018: remove alpha values from NSS
 Crypto PLL's config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-alpha-mode-cleanup-v1-3-55df8ed73645@gmail.com>
References: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
In-Reply-To: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Since both the 'alpha' and 'alpha_hi' members of the configuration is
initialized with zero values, the output rate of the PLL will be the
same whether alpha mode is enabled or not.

Remove the initialization of the alpha* members to make it clear that
alpha mode is not required to get the desired output rate.

While at it, also add a comment to indicate the frequency the PLL runs
at with the current configuration.

No functional changes, the PLL runs at 1.2 GHz both before and after
the change.

Tested on Xiaomi Mi Router AX1800 (IPQ6018, out-of-tree board).

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/clk/qcom/gcc-ipq6018.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index ab0f7fc665a9790dd8edba0cf4b86c5c672a337d..d861191b0c85ccc105ac0e62d7a68210c621fc13 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -4194,10 +4194,9 @@ static const struct alpha_pll_config ubi32_pll_config = {
 	.test_ctl_hi_val = 0x4000,
 };
 
+/* 1200 MHz configuration */
 static const struct alpha_pll_config nss_crypto_pll_config = {
 	.l = 0x32,
-	.alpha = 0x0,
-	.alpha_hi = 0x0,
 	.config_ctl_val = 0x4001055b,
 	.main_output_mask = BIT(0),
 	.pre_div_val = 0x0,
@@ -4206,7 +4205,6 @@ static const struct alpha_pll_config nss_crypto_pll_config = {
 	.post_div_mask = GENMASK(11, 8),
 	.vco_mask = GENMASK(21, 20),
 	.vco_val = 0x0,
-	.alpha_en_mask = BIT(24),
 };
 
 static struct clk_hw *gcc_ipq6018_hws[] = {

-- 
2.47.0


