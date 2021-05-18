Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6D938773F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 13:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348757AbhERLQn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 07:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241529AbhERLQm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 07:16:42 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0794C061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 04:15:24 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id k19so7145148pfu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 04:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rMKnzxRmjpsxvf399XdssqdAcsyhVxeW8xMKc4bly4E=;
        b=L20mdIJLWmBGOt6Zr0wKtKN2hmAsVsuRvrBq38YtV6trCJ0Mm2wBnoMKzHID+Zz0x/
         tqEJO6XN+bNkN2guD2KoIrEYDvCYNWS/+vD1dIuyzgsJ6MIoQ2eXTJfSlr8sNGp48grj
         yyjHF/2uMdZ1ZGGSyDroMPJqlVXWTrbWrJBWJKctc7s5Iii/AqzVWVeglUjRi83txDZJ
         n/r0q2F3n1gH5nrjTpIh6ZMvpWx0Cpl8HnRfrwbLrtHFcWhDASB9/Fs6QB55212Pplfk
         Bnp0jPhbhBBjXXOG5ikGRcBDL0qBA1eZWU7ivd+FVEYxTp9t+XgZSQqxfkYlmJGOGqm0
         66dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rMKnzxRmjpsxvf399XdssqdAcsyhVxeW8xMKc4bly4E=;
        b=QzT3cwL/xvlBpd9DNvT1yYr5IHyJGrMfieCdngVaX4tBmmB/dW9fxHmDHVwiyn34qs
         Wc0NBEpVgANQAOdTuu7DL5ja4U/zwV8vb1uBW5f8EJcyDUE7oTLrYjFwpE8p37XlTKej
         UmkSbILgy2DWmh+6WVEYOtBmOJQ4X6VyguwEfIwdxffQei8+SPA7t5IIYR4klFixstCr
         ayLHRJ0UBgt4KhKNM7we9W7xjhV3Qgx4e2uy6qOItjKss7IWTejJKa76Cse+D0tjhxEn
         3a9JaSmUvUl7x7709gaZzK5TKaLnEH98G8kHRHOd5O2ZNsMMfvqAjnFKqLP9rWjarm5+
         q3og==
X-Gm-Message-State: AOAM533Sz7RWJu02AcuKDmdwS+38taQoB8EV6Uqv0J+dhpFDNa6izEe8
        IPEL3h7R9JpG5InoRuBtNrv/D2gKDlyc7ibauyKuQQ==
X-Google-Smtp-Source: ABdhPJyGJky0kq4cz/sS0Qdl3z1SdGh0e3GJKG8woQktve1SQtUFgEFRcX0l0CiI0OLo0JeFDtreU149pO3ezEkRCoU=
X-Received: by 2002:a62:a517:0:b029:2dc:9daf:5e91 with SMTP id
 v23-20020a62a5170000b02902dc9daf5e91mr4638350pfm.39.1621336524229; Tue, 18
 May 2021 04:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210513175258.5842-1-jonathan@marek.ca> <20210513175258.5842-2-jonathan@marek.ca>
In-Reply-To: <20210513175258.5842-2-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 18 May 2021 13:15:12 +0200
Message-ID: <CAG3jFyuBnaY28D9FmA8JEQKtXX5r0LF78pco=skDSWrPfFou4A@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: qcom: clk-alpha-pll: add support for zonda pll
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Jonathan,

On Thu, 13 May 2021 at 19:53, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Ported over from the downstream driver. Will be used by SM8250 CAMCC.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 245 +++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |   6 +
>  2 files changed, 251 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index c6eb99169ddc..7b332a8935f4 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -126,6 +126,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>                 [PLL_OFF_TEST_CTL_U] = 0x1c,
>                 [PLL_OFF_STATUS] = 0x2c,
>         },
> +       [CLK_ALPHA_PLL_TYPE_ZONDA] =  {
> +               [PLL_OFF_L_VAL] = 0x04,
> +               [PLL_OFF_ALPHA_VAL] = 0x08,
> +               [PLL_OFF_USER_CTL] = 0x0c,
> +               [PLL_OFF_CONFIG_CTL] = 0x10,
> +               [PLL_OFF_CONFIG_CTL_U] = 0x14,
> +               [PLL_OFF_CONFIG_CTL_U1] = 0x18,
> +               [PLL_OFF_TEST_CTL] = 0x1c,
> +               [PLL_OFF_TEST_CTL_U] = 0x20,
> +               [PLL_OFF_TEST_CTL_U1] = 0x24,
> +               [PLL_OFF_OPMODE] = 0x28,
> +               [PLL_OFF_STATUS] = 0x38,
> +       },
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>
> @@ -162,6 +175,11 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>  #define LUCID_5LPE_PLL_LATCH_INPUT     BIT(14)
>  #define LUCID_5LPE_ENABLE_VOTE_RUN     BIT(21)
>
> +/* ZONDA PLL specific */
> +#define ZONDA_PLL_OUT_MASK     0xf
> +#define ZONDA_STAY_IN_CFA      BIT(16)
> +#define ZONDA_PLL_FREQ_LOCK_DET        BIT(29)
> +
>  #define pll_alpha_width(p)                                     \
>                 ((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ? \
>                                  ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
> @@ -208,6 +226,9 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
>  #define wait_for_pll_enable_lock(pll) \
>         wait_for_pll(pll, PLL_LOCK_DET, 0, "enable")
>
> +#define wait_for_zonda_pll_freq_lock(pll) \
> +       wait_for_pll(pll, ZONDA_PLL_FREQ_LOCK_DET, 0, "freq enable")
> +
>  #define wait_for_pll_disable(pll) \
>         wait_for_pll(pll, PLL_ACTIVE_FLAG, 1, "disable")
>
> @@ -1398,6 +1419,13 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
>
> +const struct clk_ops clk_alpha_pll_postdiv_zonda_ops = {
> +       .recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
> +       .round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
> +       .set_rate = clk_alpha_pll_postdiv_fabia_set_rate,
> +};
> +EXPORT_SYMBOL(clk_alpha_pll_postdiv_zonda_ops);
> +
>  /**
>   * clk_lucid_pll_configure - configure the lucid pll
>   *
> @@ -1777,3 +1805,220 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops = {
>         .set_rate = clk_lucid_5lpe_pll_postdiv_set_rate,
>  };
>  EXPORT_SYMBOL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
> +
> +void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +                               const struct alpha_pll_config *config)
> +{
> +       if (config->l)
> +               regmap_write(regmap, PLL_L_VAL(pll), config->l);
> +
> +       if (config->alpha)
> +               regmap_write(regmap, PLL_ALPHA_VAL(pll), config->alpha);
> +
> +       if (config->config_ctl_val)
> +               regmap_write(regmap, PLL_CONFIG_CTL(pll),
> +                               config->config_ctl_val);
> +
> +       if (config->config_ctl_hi_val)
> +               regmap_write(regmap, PLL_CONFIG_CTL_U(pll),
> +                               config->config_ctl_hi_val);
> +
> +       if (config->config_ctl_hi1_val)
> +               regmap_write(regmap, PLL_CONFIG_CTL_U1(pll),
> +                               config->config_ctl_hi1_val);
> +
> +       if (config->user_ctl_val)
> +               regmap_write(regmap, PLL_USER_CTL(pll),
> +                               config->user_ctl_val);
> +
> +       if (config->user_ctl_hi_val)
> +               regmap_write(regmap, PLL_USER_CTL_U(pll),
> +                               config->user_ctl_hi_val);
> +
> +       if (config->user_ctl_hi1_val)
> +               regmap_write(regmap, PLL_USER_CTL_U1(pll),
> +                               config->user_ctl_hi1_val);
> +
> +       if (config->test_ctl_val)
> +               regmap_write(regmap, PLL_TEST_CTL(pll),
> +                               config->test_ctl_val);
> +
> +       if (config->test_ctl_hi_val)
> +               regmap_write(regmap, PLL_TEST_CTL_U(pll),
> +                               config->test_ctl_hi_val);
> +
> +       if (config->test_ctl_hi1_val)
> +               regmap_write(regmap, PLL_TEST_CTL_U1(pll),
> +                               config->test_ctl_hi1_val);
> +
> +       regmap_update_bits(regmap, PLL_MODE(pll),
> +                        PLL_BYPASSNL, 0);
> +
> +       /* Disable PLL output */
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
> +
> +       /* Set operation mode to OFF */
> +       regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
> +
> +       /* PLL should be in OFF mode before continuing */
> +       wmb();
> +
> +       /* Place the PLL in STANDBY mode */
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
> +}
> +
> +static int clk_zonda_pll_enable(struct clk_hw *hw)
> +{
> +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +       struct regmap *regmap = pll->clkr.regmap;
> +       u32 val;
> +       int ret;
> +
> +       ret = regmap_read(regmap, PLL_MODE(pll), &val);
> +       if (ret)
> +               return ret;
> +
> +       /* If in FSM mode, just vote for it */
> +       if (val & PLL_VOTE_FSM_ENA) {
> +               ret = clk_enable_regmap(hw);
> +               if (ret)
> +                       return ret;
> +               return wait_for_pll_enable_active(pll);
> +       }
> +
> +       /* Get the PLL out of bypass mode */
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_BYPASSNL, PLL_BYPASSNL);
> +
> +       /*
> +        * H/W requires a 1us delay between disabling the bypass and
> +        * de-asserting the reset.
> +        */
> +       mb();
> +       udelay(1);
> +
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
> +
> +       /* Set operation mode to RUN */
> +       regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
> +
> +       ret = regmap_read(regmap, PLL_TEST_CTL(pll), &val);
> +       if (ret)
> +               return ret;
> +
> +       /* If cfa mode then poll for freq lock */
> +       if (val & ZONDA_STAY_IN_CFA)
> +               ret = wait_for_zonda_pll_freq_lock(pll);
> +       else
> +               ret = wait_for_pll_enable_lock(pll);
> +       if (ret)
> +               return ret;
> +
> +       /* Enable the PLL outputs */
> +       ret = regmap_update_bits(regmap, PLL_USER_CTL(pll),
> +                                ZONDA_PLL_OUT_MASK, ZONDA_PLL_OUT_MASK);
> +       if (ret)
> +               return ret;
> +
> +       /* Enable the global PLL outputs */
> +       ret = regmap_update_bits(regmap, PLL_MODE(pll),
> +                                PLL_OUTCTRL, PLL_OUTCTRL);
> +       if (ret)
> +               return ret;
> +
> +       /* Ensure that the write above goes through before returning. */
> +       mb();
> +
> +       return 0;
> +}
> +
> +static void clk_zonda_pll_disable(struct clk_hw *hw)
> +{
> +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +       struct regmap *regmap = pll->clkr.regmap;
> +       u32 val;
> +       int ret;
> +
> +       ret = regmap_read(regmap, PLL_MODE(pll), &val);
> +       if (ret)
> +               return;
> +
> +       /* If in FSM mode, just unvote it */
> +       if (val & PLL_VOTE_FSM_ENA) {
> +               clk_disable_regmap(hw);
> +               return;
> +       }
> +
> +       /* Disable the global PLL output */
> +       ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
> +
> +       /* Disable the PLL outputs */
> +       regmap_update_bits(regmap, PLL_USER_CTL(pll), ZONDA_PLL_OUT_MASK, 0);
> +
> +       /* Put the PLL in bypass and reset */
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N | PLL_BYPASSNL, 0);
> +
> +       /* Place the PLL mode in OFF state */
> +       regmap_write(regmap, PLL_OPMODE(pll), 0x0);
> +}
> +
> +static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +                                 unsigned long prate)
> +{
> +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +       unsigned long rrate;
> +       u32 test_ctl_val;
> +       u32 l;
> +       u64 a;
> +       int ret;
> +
> +       rrate = alpha_pll_round_rate(rate, prate, &l, &a, ALPHA_BITWIDTH);
> +
> +       ret = alpha_pll_check_rate_margin(hw, rrate, rate);
> +       if (ret < 0)
> +               return ret;
> +
> +       regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
> +       regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +
> +       /* Wait before polling for the frequency latch */
> +       udelay(5);
> +
> +       /* Read stay in cfa mode */
> +       ret = regmap_read(pll->clkr.regmap, PLL_TEST_CTL(pll), &test_ctl_val);
> +       if (ret)
> +               return ret;
> +
> +       /* If cfa mode then poll for freq lock */
> +       if (test_ctl_val & ZONDA_STAY_IN_CFA)
> +               ret = wait_for_zonda_pll_freq_lock(pll);
> +       else
> +               ret = wait_for_pll_enable_lock(pll);
> +       if (ret)
> +               return ret;
> +
> +       /* Wait for PLL output to stabilize */
> +       udelay(100);
> +       return 0;
> +}
> +
> +static unsigned long
> +clk_zonda_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +       u32 l, frac;
> +
> +       regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
> +       regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac);
> +
> +       return alpha_pll_calc_rate(parent_rate, l, frac, ALPHA_BITWIDTH);
> +}
> +
> +const struct clk_ops clk_alpha_pll_zonda_ops = {
> +       .enable = clk_zonda_pll_enable,
> +       .disable = clk_zonda_pll_disable,
> +       .is_enabled = clk_trion_pll_is_enabled,
> +       .recalc_rate = clk_zonda_pll_recalc_rate,
> +       .round_rate = clk_alpha_pll_round_rate,
> +       .set_rate = clk_zonda_pll_set_rate,
> +};
> +EXPORT_SYMBOL(clk_alpha_pll_zonda_ops);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 6943e933be0f..4871af27cf76 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -16,6 +16,7 @@ enum {
>         CLK_ALPHA_PLL_TYPE_TRION,
>         CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
>         CLK_ALPHA_PLL_TYPE_AGERA,
> +       CLK_ALPHA_PLL_TYPE_ZONDA,
>         CLK_ALPHA_PLL_TYPE_MAX,
>  };
>
> @@ -148,6 +149,9 @@ extern const struct clk_ops clk_alpha_pll_lucid_5lpe_ops;
>  extern const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops;
>  extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
>
> +extern const struct clk_ops clk_alpha_pll_zonda_ops;
> +extern const struct clk_ops clk_alpha_pll_postdiv_zonda_ops;
> +
>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>                              const struct alpha_pll_config *config);
>  void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> @@ -159,6 +163,8 @@ void clk_agera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  #define clk_lucid_pll_configure(pll, regmap, config) \
>         clk_trion_pll_configure(pll, regmap, config)
>
> +void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +                            const struct alpha_pll_config *config);
>
>
>  #endif

I'm seeing some checkpatch --strict warnings, with those fixed this
patch looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
