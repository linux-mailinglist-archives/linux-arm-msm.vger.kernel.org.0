Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10B0357827
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 01:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbhDGXB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 19:01:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:59978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229449AbhDGXB2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 19:01:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D5C7611C9;
        Wed,  7 Apr 2021 23:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617836478;
        bh=Z7WqCUanSlNvnD9wexNvEc3dx0BZpbT+4uVfy5X9skQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AD9RsG1MszT7GTAMUnWeZhwOTLC5s3l0DrH6BnTkqDkKT0q18MV8IYE6Zy0t7p5Ok
         m7vfcNJ+KrsG5vKPysOXjwIU8Ddzt5lPY/swg7C+T4xQKlOqtsugxVnOr08V01rqjm
         +b4gnM0uRwAQvV1c8+OLWg24WeT+BrQY55ACrC6DdrvdUNhgwcIVSwOh04wb4Tmyra
         CMfM1W90tDzF9smEKQ8sDIaRLgKXK4oa1KkHVRq2BUPrZVObCC3LbpyZUH8e5v3nyh
         6Qq5uTvDfaffUx5Jis1ztg2qckI8AC2GPSNxRE+OlyvyQNb9fraw/7coh+lGkjbsAm
         SdcW9KKg06CAA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed fixed-factor clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Daniel Palmer <daniel@0x0f.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 16:01:16 -0700
Message-ID: <161783647690.3790633.7004111396421583619@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-06 16:06:06)
> devm_clk_hw_register_fixed_factor_release(), the release function for
> the devm_clk_hw_register_fixed_factor(), calls
> clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> after that the devres functions will also kfree the allocated data,
> resulting in double free/memory corruption. Just call
> clk_hw_unregister() instead, leaving kfree() to devres code.
>=20
> Reported-by: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-fixes. I also squashed this in to cleanup that ugly cast.

---8<----

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 390c16f321a6..4e4b6d367612 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -66,12 +66,14 @@ EXPORT_SYMBOL_GPL(clk_fixed_factor_ops);
=20
 static void devm_clk_hw_register_fixed_factor_release(struct device *dev, =
void *res)
 {
+	struct clk_fixed_factor *fix =3D res;
+
 	/*
 	 * We can not use clk_hw_unregister_fixed_factor, since it will kfree()
 	 * the hw, resulting in double free. Just unregister the hw and let
 	 * devres code kfree() it.
 	 */
-	clk_hw_unregister(&((struct clk_fixed_factor *)res)->hw);
+	clk_hw_unregister(&fix->hw);
 }
=20
 static struct clk_hw *
