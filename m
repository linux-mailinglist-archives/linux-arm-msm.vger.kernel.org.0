Return-Path: <linux-arm-msm+bounces-25063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4719925749
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 120F81C21268
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F6E1422B4;
	Wed,  3 Jul 2024 09:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKCN7hYY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFC913DDCF;
	Wed,  3 Jul 2024 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000231; cv=none; b=LmHLkjeAA21i/80hOzgniFnoLyWpyGocO1PXx+1FUSXvi4uq7Zgwcygw0d9XONjY3c7vhEBwTf6NbzQrAFY6q2pMypVAISjgqpgKbHkL+sb0+4489wHywQMn9DYvn2Tdi5rkBTe8z+/8VAH6XhvTk7dG3UdTOZjIHEohHZi2EXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000231; c=relaxed/simple;
	bh=zUIhNaJB9vytQBaKjIhITCcZRZzf530pVUJ7sHGUvaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YlT1/N4wE31JrvDAdc/P82Ca61wB37RaKEOZQePhmMerPQZyQBF7GmeCFcsmefGpKJyy4YtN9InpqsBdh8LPb+1NAWKQytVFTsRBt1EgKESn+sXYbaZAjiKV1nThQIQb2c98lKYjA+npEcBIEoq1cfzAKGYraaXwuBdHfq0ZVCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKCN7hYY; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso3157984a12.2;
        Wed, 03 Jul 2024 02:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000228; x=1720605028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjxB4KcUaWQh3jg9jUAlCf5iQpZ5CojbNVfQpTYS6OI=;
        b=dKCN7hYYNB6WfqF2MHkBerS7qX3BUSCG3FrpNkFgDfZJYYx8BS432hRDDonuiwH+Z8
         Jc4Hsn/R8xJn84HsWCRCp3ZvH9yMTD1sVvlrwNXLmlX615pIcIafQhEebjxuvXCghAL6
         HlZOVFqIpf4/uGKdwyhqFrBtLj0B64zM9m0fE3RH4cTfDB7LZRl3k5GTcpVFkoDR3dD/
         GR0gDPNNhT+H6GPeo+DY2qNHK/HwzC4CXZHStNAJ0MpzqhosBkeHpUgYt+ssAqI2KF75
         3nHRkYvpJbx19rVuxw0WuTaIL5KfTGS1qM6A9kpAdamrAQ5LkTW4hOeKmQ2sfM89rVCc
         ibvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000228; x=1720605028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjxB4KcUaWQh3jg9jUAlCf5iQpZ5CojbNVfQpTYS6OI=;
        b=cTDx73P8VzL5nf7KsIVrN471G3hG0tCKPvi0rlmfTy1IZU/ImCJJ5/vr1n37O8my78
         jfz+SD4b59jYFXVIveia5Rna4BJz2P69NkJrgQfmO2ROn6lsUFSh33qLy6JbOtM/fhdE
         oJ46EBgXu++TihSm977w4Z5mMHyDR8v8SSZYu65TUJfD3UT6CbGb+KLEl2Zg6xuJE95n
         0RHvYEZMOG+CR8dEq0Lxf1++aBbpzT1sUB2UirQUrtJ1ySOk47kjR4s5/yJqsxefK8Ck
         23HWOlWAe6+pvtZLV0sH4BVTkcf8JqhYpuG4UTx8ASE5lluymqZOtBke6k3hj2o/7nqI
         Qg0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkfZ1tZ/wWJF85Psbv+ffUjJwyaAsYWzTU9Hw5lEltYlK8BXYqG/eJiJT5QI808qRXZKOzeC/zTRwTQoOMKlmZ56MYfpfwY9btWZJV9s6yg/rVlnDNe2z3qS93sFrbzkwGSQifCA1r+349DJB1U868iSxZcuIC/w7cUy52pCxZjcdk0QWS2A==
X-Gm-Message-State: AOJu0YyRWql/2FagJ92TagJK2wG5+qWnFJt+C2q+G0ZDNQGcsLKw+VVp
	BV9hNKbSgwpjGD8fA7doH62H2gQEacENnE3oVBZxeFVTfp/MFud4
X-Google-Smtp-Source: AGHT+IEu9wfxofZHAUHv13UpYXfpE/fqLZpj+TDjnY0WusdrAi5dE3xvADca15im/1AFnBZLLs17Ag==
X-Received: by 2002:a05:6402:84f:b0:57c:947c:52f6 with SMTP id 4fb4d7f45d1cf-587a0a0e63fmr8194901a12.26.1720000228030;
        Wed, 03 Jul 2024 02:50:28 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:27 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:14 +0200
Subject: [PATCH 01/10] clk: meson: a1: peripherals: Constify struct
 regmap_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-1-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=786;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=zUIhNaJB9vytQBaKjIhITCcZRZzf530pVUJ7sHGUvaM=;
 b=AiazcxboMt3P+LY+hRRrue83xM/NS7alWnXU3z+f1NiZvmZK4tScX4flzKSP5LfXviBEcnrjx
 ODWLulzhRzcCq5gs/K0LdUZbMa7Vo+Mvv37YJvGBTZSCyUOk8z6bFL1
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`a1_periphs_regmap_cfg` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/a1-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index 99b5bc450446..728ad13924ad 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -2183,7 +2183,7 @@ static struct clk_regmap *const a1_periphs_regmaps[] = {
 	&dmc_sel2,
 };
 
-static struct regmap_config a1_periphs_regmap_cfg = {
+static const struct regmap_config a1_periphs_regmap_cfg = {
 	.reg_bits   = 32,
 	.val_bits   = 32,
 	.reg_stride = 4,

-- 
2.40.1


