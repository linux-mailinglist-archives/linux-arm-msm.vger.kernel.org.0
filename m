Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C62D553B6B8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 12:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233420AbiFBKPH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 06:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233469AbiFBKPG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 06:15:06 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE8C2AD5C2
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 03:15:05 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id k6so251357qkf.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 03:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fOHitFVtUhQxQeGoTHoG0OzFq0ZzrGiczbq+UxLc2qw=;
        b=JWryxprqeUxNU1XZR95MlHVGT7qDBnT1Ot3ZVtcYjVhIAQGizQ4cLaxHFqn92wHQdR
         eA3+lrQlnmvH3tLvzz3gKCMHBYSa0XUYOP1v8m+fWNANYgzmckyp9Xgiy5aVFbX47zIq
         x6NRqvlWDNLibNbKuwKmcZ4ofxZlW7tP0VnbmlDx30GfjrZgQkSNKNokN8lEYLyqdrk8
         kStDk6tMe5YgSu0FwDg7iUFg7VejnB9qXCKwXo132VZs4XqeSjyNnkD4k4Gyw0fR4SD+
         qdOg+UWMF+y75RBbC5BTWTgwaoELK0hVrRkyr1Tw8oFOFOFNXFkr22r0yeNj2rKXoSw9
         vO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fOHitFVtUhQxQeGoTHoG0OzFq0ZzrGiczbq+UxLc2qw=;
        b=pg5s504859pzKhgawPN/RAnutxFG6sT4y4FFJO95xenCRv1i/rpW/Z0fEyrXHYcy3z
         nLHCqToosBBwMxSEEKi2vUdx3dbotp9VvQByvYI+vK4NjZ69PXCYu3y4sd0J95mH9G5J
         GgcRfH8PagA6I0xMfbj23ZPxTfmXTiKNQ/FA0lCQ4FJcI2EE6sW4+1zS+iBSZBvJUMj2
         sgQ42uizOrrZfMlgCzL2wGB7NNgZNzCw/wXQjCBiKTyUMcZFLfmYNllVkrKoAA6IuOHi
         GwXXg332dZsYUtcqZU5awndvCPPnu/g3B+fgYVF5oJPyzTvRVOEgyJjawyYN1dx0qAUC
         ANhA==
X-Gm-Message-State: AOAM5306dwMktiEbZifM8xmsCbLdAKuoglyEEn1WidjbtoHo/iH1s7yT
        PcZG2uGeIe6vyj2yuxVmNRwlOoThylGcLgkBbvQi3g==
X-Google-Smtp-Source: ABdhPJw2bRmHzQbnAYbZakDLi24fc4qCFs5O5K0MkvKDsfdY7N70JVb+c0+aHohWoM0U4fwyizCr+zLCSn4np4A52Z4=
X-Received: by 2002:a05:620a:2a06:b0:6a5:b090:65c0 with SMTP id
 o6-20020a05620a2a0600b006a5b09065c0mr2438054qkp.593.1654164904535; Thu, 02
 Jun 2022 03:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220601220747.1145095-1-marijn.suijten@somainline.org> <20220601220747.1145095-2-marijn.suijten@somainline.org>
In-Reply-To: <20220601220747.1145095-2-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 2 Jun 2022 13:14:53 +0300
Message-ID: <CAA8EJprRhoE+MMWSx69O+s=Zvoq=HKtaoe7xx+kCmtZas1woCw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] clk: divider: Introduce devm_clk_hw_register_divider_parent_hw()
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2 Jun 2022 at 01:07, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Add the devres variant of clk_hw_register_divider_parent_hw() for
> registering a divider clock with clk_hw parent pointer instead of parent
> name.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  include/linux/clk-provider.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index c10dc4c659e2..4e07621849e6 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -831,6 +831,25 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
>         __devm_clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
>                                   NULL, (flags), (reg), (shift), (width),     \
>                                   (clk_divider_flags), NULL, (lock))
> +/**
> + * devm_clk_hw_register_divider_parent_hw - register a divider clock with the clock framework
> + * @dev: device registering this clock
> + * @name: name of this clock
> + * @parent_hw: pointer to parent clk
> + * @flags: framework-specific flags
> + * @reg: register address to adjust divider
> + * @shift: number of bits to shift the bitfield
> + * @width: width of the bitfield
> + * @clk_divider_flags: divider-specific flags for this clock
> + * @lock: shared register lock for this clock
> + */
> +#define devm_clk_hw_register_divider_parent_hw(dev, name, parent_hw, flags,   \
> +                                              reg, shift, width,             \
> +                                              clk_divider_flags, lock)       \
> +       __devm_clk_hw_register_divider((dev), NULL, (name), NULL,             \
> +                                      (parent_hw), NULL, (flags), (reg),     \
> +                                      (shift), (width), (clk_divider_flags), \
> +                                      NULL, (lock))
>  /**
>   * devm_clk_hw_register_divider_table - register a table based divider clock
>   * with the clock framework (devres variant)
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
