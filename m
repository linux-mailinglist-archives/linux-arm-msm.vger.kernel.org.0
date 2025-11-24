Return-Path: <linux-arm-msm+bounces-83123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 321AFC82849
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 22:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 141DB34B028
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 21:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B73D2F6936;
	Mon, 24 Nov 2025 21:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GSNNuFlX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F0F32E14C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 21:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764019233; cv=none; b=hwbzg190dLJjGZMlJ7wXZ4P3HrMHWbFPV5m0JHedguibLP1dXrjJns7UTjacQyCISRuydL752b/eOx2KgdYw18mA8Op0d5yd9HVtBHK+oSM12VKVxjZMnzbEqt/HCB/bPZjvKwDJlLfG5f2gHVw+6wVNUbaCxh1kZnJs+vNKZBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764019233; c=relaxed/simple;
	bh=fXy8C4BKUXKilUJuH0DdICiVvrxIO84wfvm31AbHSCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YRIgcFsvAsn/wM0eKzEUdHrH6ObSLY00CruspKIv5JnPQLWanoIHSe9pl2Nlo4GafgrImKt+JVvKrkevkdTCsIUITV7BPyZUJ/+eVuLyL1A2GIisovyYhfntSEndCq9lPMrBf87lZxtFPJfmobQN4Mr8g/nqDDB9zEb3URUKT5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GSNNuFlX; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37baf2d159bso3285551fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 13:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764019226; x=1764624026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VP98YVNXzLKE6D9xDlHQCujjYhOFBxuWqmYVe5I8vWE=;
        b=GSNNuFlX250hM0U/I8ficnRRgs38F6hSrgI+KsFwZWvS+/mp4WAQM78vgcioCYOzwr
         +EL2fZOyjUJNGiBEC7C7ExJGCW2TyQ3hc/qMv+54DZin1HFHCmmjgYLqtMIrjo4IZvdq
         7xLJm07aPQ9LdDes3Dv1pP7EehOqUgU8iS+LFxdjvFOn6yemy+SOI0BwQx4CTqmC3sUZ
         YtU9QRzaz2U9kk1W3EXmcJUu7AbANHgw+OIfLdMmWRCp99SO7YiYMvuO1TeS6QHPrL8Z
         4a/E5Hsgr03NzR4xMXuW3WJ097T1w0ah9JYujoO0EeNibSVOM8ZA5p8Hhcbfr+LZfwiH
         f4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764019226; x=1764624026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VP98YVNXzLKE6D9xDlHQCujjYhOFBxuWqmYVe5I8vWE=;
        b=uGeGa8I5aHMopMFDVc/7azVWoj34QXwKY6pzpq3Dmu78Py16LNFX5Rxbr1s/ZG2HFF
         D//ElXtNhuOThmE+qnThB15fP7UhDZcsk4RYT5LHK92OuqsKGn4Z/jNyyf/M6rwJAhMe
         W/pb8ABLc88ZOZFi1k8gDK6jXMypF9yqE9PYiwfps6P54xOCkHHCTVLthL9DaIMjJ3NH
         Jw7+zMvsewpkCyIY3TJ62DQGz7bHvy5ps4PVFm4TxjjWUO3ByjdGk2OvR4sbJcg3NLUq
         RoDi9zP54QRTE3q+DLMbCurh1lrFaEF4CqoF53sjs21m4Iy52k0NqturWDIlsfy/U2yP
         oAWw==
X-Forwarded-Encrypted: i=1; AJvYcCUr/p3kDfsRBHQogBlUi3XZlkphzZYGnPnp783sG01TOr7phbccsXaVoTqtx1Sqkl5zHz3Ya/8JDgRQAmdU@vger.kernel.org
X-Gm-Message-State: AOJu0YynXgj3S8a7ykEV2diiUNbiWzJWD9uDWpXs9vSuYIhUmfxab5Fg
	nQLpiRQmuTMjKgUbFj+mUQjtxqQtHaW0QahCoWrMDgxis6rCElDvvJAfWHgQ6G4ZtZg=
X-Gm-Gg: ASbGncuHs+5m5gXPhFp7jeP9pSpKV9U4PJbIwXtulTlBI5xoA/XG1tvjeuLnOWa4P1y
	yH8wMNk80fklHvpMS5zBzkvjSvgEF8w6Jdp14aNZXaRd47Zn0HnxFIyH+dCb9Lk0RrPLrP1XmWA
	4am4+KD94I+IKm78UaAir015kr5BtaqhQw2yLc+dLfCkkmJecOOlsZNEY7Ugo+PR5fJERlnuIpL
	dpC+jLaop8/g8B32/KIIjfuIv1K2xuRdPfxhwuvhQQsnhacgWCJ266js0FOG75M/jxXarWmg3Lj
	0UAdCcMI7ShiCvmZZ+P3r7i3XiPl214DgynfJxOtxTf5Ph04XPJmOLoo0c1pH2Xch67JKZbYIH7
	W/++EJ3KY88TLe16fvsa6+1o5gKErvbWxABTxWJvvj1jnfOE2Q8Q3ACMvheXgHmiC5CvGbI5KEH
	RrU7hf7kVXoTckJ8UCdjq+7QQnFp1bz1dlYXzH38XW8Zmt7HV/rHjj3A==
X-Google-Smtp-Source: AGHT+IH2zT0+iJUF+4oHmEKlQcg8ZxcrYD1uWmymsveMziE1HNeg+bhc9GY/Po6ssTh/DX0+3N7IjA==
X-Received: by 2002:a2e:bc03:0:b0:37b:9b58:dd05 with SMTP id 38308e7fff4ca-37cd928f41fmr20657551fa.7.1764019226277;
        Mon, 24 Nov 2025 13:20:26 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59744sm32905771fa.11.2025.11.24.13.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 13:20:24 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: gcc-sm8650: Use floor ops for SDCC RCGs
Date: Mon, 24 Nov 2025 23:20:12 +0200
Message-ID: <20251124212012.3660189-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
References: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In line with commit a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops
for SDCC RCGs") done to fix issues with overclocked SD cards on SM8450
powered boards set floor clock operations for SDCC RCGs on SM8650.

This change fixes initialization of some SD cards, where the problem
is manifested by the SDHC driver:

    mmc0: Card appears overclocked; req 50000000 Hz, actual 100000000 Hz
    mmc0: error -110 whilst initialising SD card

Fixes: c58225b7e3d7 ("clk: qcom: add the SM8650 Global Clock Controller driver, part 1")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/gcc-sm8650.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index 24f98062b9dd..2dd6444ce036 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -1257,7 +1257,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_11,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_11),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1279,7 +1279,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
-- 
2.49.0


