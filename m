Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89BDD72B72A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 07:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbjFLFEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 01:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbjFLFET (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 01:04:19 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E2FB94
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 22:04:18 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-39caf0082f3so1441591b6e.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 22:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686546258; x=1689138258;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yXejNWihH1cSvRvqLdsiZooKU8TxJgF5T4F4Xvbxnsk=;
        b=MuHiDOyfBffaPSQrCja2twO0/NpQMD6m6Z8x/Ba1rzTBGIGHZWsrFsxDWlwErvBkSB
         /j3/mtQ2nuAw7yuv0apHEy8gtBvpmZbrPiIg3hXjlJfYKSuUrAFBBHw44H2KDRwgBR7I
         VCtpRThYe5ZtaX4AqV4MCV/XqkO8jM3m766yB9mqZJ9TBhBIAJILTIf9LRDUc7I9UNYc
         0uHZOFxOwsGa9K4kPQ2nkNhZefz1ipF/FAS/DKFfNMP63m3wx0omxMK9yRLSaHDSPmrN
         3s1/qd8jsBulhIrenylmMkmwgeuGqKHS0f7TsI5QWvGGVKZ5YESZAs3JSNx51RmdVulo
         GjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686546258; x=1689138258;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXejNWihH1cSvRvqLdsiZooKU8TxJgF5T4F4Xvbxnsk=;
        b=gT4qTofRQSEJCmfUgdVgT30IpKSo4QpCFYhhqX0g+x1CCn6cYgim6E7uXq1Ay5LF5G
         GjiEfwzxf6WfZqKuBiKSU+9mMRrpFlDTsV4vDP4xqKJd9KH4lQ5Ohh52F8JyXeYXV+Rp
         iiFyoCHE17PnCYscch9BLlosPL69qMj5kMRjuY1p0PWCxwKya2Q/wa8v2jRe0iAhVlGV
         7V604+9A/G4easd58EKCGeDwcW2n9dR36MI/Wc9aol85VxfAnRKeyoVzuhrh+kVF/en1
         ZWhAXdnTDS2aWjpjIGOK6ny7Aujw0yOzwFGaIX83MGtwSuxhGh0m1hVUup5wIIIb/L29
         8mWw==
X-Gm-Message-State: AC+VfDx7bcCOL2204N0HlIp3voqDIYQmg7U+BWpvTwgM7bbGckuStlCD
        AbuoPBmpKoJ8dmjnlAchOv020oFJfxS0ub6TMzCzfCn/2CI/hA==
X-Google-Smtp-Source: ACHHUZ6gx3tRtW3o5Eha/7tuZII/koptiVHdNUE7RCzzbT1tTbgQvBQPdIxZXaDEDxM9aFQ6gRCiV+nytoi2RYsmg7s=
X-Received: by 2002:a05:6808:2a4c:b0:396:1bf6:d781 with SMTP id
 fa12-20020a0568082a4c00b003961bf6d781mr3025099oib.6.1686546257862; Sun, 11
 Jun 2023 22:04:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:7d4d:b0:35e:bd26:c91f with HTTP; Sun, 11 Jun 2023
 22:04:17 -0700 (PDT)
In-Reply-To: <20230612031616.3620134-2-dmitry.baryshkov@linaro.org>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org> <20230612031616.3620134-2-dmitry.baryshkov@linaro.org>
From:   Degdag Mohamed <degdagmohamed@gmail.com>
Date:   Mon, 12 Jun 2023 06:04:17 +0100
Message-ID: <CAEhjvduE+iMzzyC2Bex9C5=ueXE8NSZ6oGywRtAJv7gzyvbukw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dsi: don't allow enabling 7nm VCO with
 unprogrammed rate
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[Dmitry Baryshkov],

Thank you for sharing the patches. I have reviewed and tested all
three patches, and they seem to be working correctly.

Tested-by: Degdag Mohamed degdagmohamed@gmail.com

Please let me know if you need any further information or assistance.

Best regards,
Degdag Mohamed

On 6/12/23, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> CCF can try enabling VCO before the rate has been programmed. This can
> cause clock lockups and/or other boot issues. Program the VCO to the
> minimal PLL rate if the read rate is 0 Hz.
>
> Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 3b1ed02f644d..6979d35eb7c3 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -395,11 +395,16 @@ static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm
> *pll)
>  	wmb(); /* Ensure that the reset is deasserted */
>  }
>
> +static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
> +						  unsigned long parent_rate);
>  static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
>  	int rc;
>
> +	if (dsi_pll_7nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
> +		dsi_pll_7nm_vco_set_rate(hw, pll_7nm->phy->cfg->min_pll_rate,
> VCO_REF_CLK_RATE);
> +
>  	dsi_pll_enable_pll_bias(pll_7nm);
>  	if (pll_7nm->slave)
>  		dsi_pll_enable_pll_bias(pll_7nm->slave);
> --
> 2.39.2
>
>
