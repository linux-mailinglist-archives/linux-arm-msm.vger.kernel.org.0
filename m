Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE552468C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 16:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729053AbgHQOw7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 10:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728873AbgHQOw6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 10:52:58 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A92BC061389;
        Mon, 17 Aug 2020 07:52:58 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id p18so10917931ilm.7;
        Mon, 17 Aug 2020 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=idCy9UbtWjFjy/KYTQm+toEkEWbKu8TtnGAA1YnlgRc=;
        b=mwN8E3wfMtyDdeJm+5XVogKdr0Ih7BogWJ5dqN9kddipEHhgUw9T+j4BwZe9umtm/Z
         ozV6BXTdiRsT3JbJ4vy2r+NLf7N+zfC686gnJEbYbLbv43weQ9E0tE4E7w0TbBy2vF1Q
         rXzNxdq7U3AwXsAOlluGwkNHkxDNqQP+PfR4N36BAEdedyMZ2nBEb4mXdmlaFj6/w3g6
         6p+N4LdV4TquUZs3qwL27syM/UdkcT4thF1LjGbkUrGUYSNcA6942S2JGj7UMTCaNqn8
         XkpCTXpOCH0DD4xEv3RVx82xxAcbf5cYAl7mWEGvhrx3SVXz27lzYPKqzuBprEdsdMWZ
         VEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=idCy9UbtWjFjy/KYTQm+toEkEWbKu8TtnGAA1YnlgRc=;
        b=evcr6oBLgna2PJPNKEJ9OaU4BXiITSlhqx68tlez3PLK+3nbG2iI1dpqQmZB9g1FKu
         VSJVoRYd7jdlfBdwRS1s7RJIsk2KEq+7tKmXvSBHfHAwWvkTq4maqpaMBUe9Ct1EGOlH
         L+OSW65fprJvbijCsk46Zo0gxP8VX6FC3FYxgjyx7J6/xmGWuNXgD89JN3IFwKm4pwDH
         T95vHPxS92SCOLVrmqs7+xb2uzEjJyOeTzF+RfeWV+eDctj+yeuHDrSTSRAzhD7n1wbL
         9l6BiHu9pgx0tABujbiSgJtyDOpSqVetXKvq5KAYfRuuNrXgY84uueXT3SsABMx+jvAI
         tW/w==
X-Gm-Message-State: AOAM53345kzJW2a5JFrkCI2rZehY+o1SFeYPpAgD9jmhz/tmYhmMBXlk
        q9QBDi1HyoBMM4ljBtO1XEPtTU+ZVziV4drTTLA=
X-Google-Smtp-Source: ABdhPJwrIS3mv6Ns/Td6HnYubCqM8/MeLmP+SB43QfqweH5BgwFDkPEqTDp9h6N2TCHh3WOlahjFtEV45CBaPdiEV0g=
X-Received: by 2002:a92:c8c1:: with SMTP id c1mr14199207ilq.42.1597675977617;
 Mon, 17 Aug 2020 07:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200817140908.185976-1-stephan@gerhold.net>
In-Reply-To: <20200817140908.185976-1-stephan@gerhold.net>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 17 Aug 2020 08:52:46 -0600
Message-ID: <CAOCk7Nq6CT5q_aXG2jZ2t5=3YKVKM4r=gSnJLJkVccpwyc3XnQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: smd: Disable unused clocks
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 17, 2020 at 8:10 AM Stephan Gerhold <stephan@gerhold.net> wrote:
>
> At the moment, clk-smd-rpm forces all clocks on at probe time
> (for "handoff"). However, it does not make the clk core aware of that.
> This means that the clocks stay enabled forever if they are not used
> by anything.
>
> We can easily disable them again after bootup has been completed,
> by making the clk core aware of the state. This is implemented by
> returning the current state of the clock in is_prepared().
>
> Checking the SPMI clock registers reveals that this allows the RPM
> to disable unused BB/RF clocks. For example, on MSM8916 with all
> remote processors (except RPM) disabled, we get:
>
>  +--------------------------+------------+---------+--------+-------+
>  |                          | BOOTLOADER | HANDOFF | BEFORE | AFTER |
>  +--------------------------+------------+---------+--------+-------+
>  | BB_CLK1_STATUS1 (0x5108) |     ON*    |    ON   |   ON   |  ON*  |
>  | BB_CLK2_STATUS1 (0x5208) |     OFF    |    ON   |   ON   |  OFF  |
>  | RF_CLK1_STATUS1 (0x5408) |     OFF    |    ON   |   ON   |  OFF  |
>  | RF_CLK2_STATUS1 (0x5508) |     OFF    |    ON   |   ON   |  OFF  |
>  +--------------------------+------------+---------+--------+-------+
>   * BB_CLK1 seems to be always-on in RPM on MSM8916
>
> where:
>   - BOOTLOADER = clk-smd-rpm disabled entirely in device tree
>   - HANDOFF = temporarily after clk-smd-rpm was probed
>   - BEFORE/AFTER = after boot without/with the changes in this commit
>
> With this commit BB_CLK2/RF_CLK1/RF_CLK2 are disabled again when unused.
>
> Cc: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> Originally I reported this here:
> https://lore.kernel.org/linux-arm-msm/20200523120810.GA166540@gerhold.net/
>
> Overall I'm not entirely sure why we need to force all these clocks
> on at all... But the downstream driver also seems to do it and the RPM
> interface is barely documented, so I didn't feel comfortable changing it...

So essentially, when the clk framework goes through late init, and
decides to turn off clocks that are not being used, it will also turn
off these clocks?

I think this is going to break other targets where other subsystems
happen to rely on these sorts of votes from Linux inorder to run/boot
(not saying it's a good thing, just that is how it is and since we
can't change the FW on those....).

I think this needs to be validated on every single qcom platform using
this driver.

Also, out of curiosity, how are you validating that BB_CLK2 is
actually off after this change?

> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 0e1dfa89489e..fa960cb794a8 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -171,6 +171,9 @@ static int clk_smd_rpm_handoff(struct clk_smd_rpm *r)
>         if (ret)
>                 return ret;
>
> +       /* During handoff we force all clocks on */
> +       r->enabled = true;
> +
>         return 0;
>  }
>
> @@ -300,6 +303,13 @@ static void clk_smd_rpm_unprepare(struct clk_hw *hw)
>         mutex_unlock(&rpm_smd_clk_lock);
>  }
>
> +static int clk_smd_rpm_is_prepared(struct clk_hw *hw)
> +{
> +       struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
> +
> +       return r->enabled;
> +}
> +
>  static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
>                                 unsigned long parent_rate)
>  {
> @@ -396,6 +406,7 @@ static int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
>  static const struct clk_ops clk_smd_rpm_ops = {
>         .prepare        = clk_smd_rpm_prepare,
>         .unprepare      = clk_smd_rpm_unprepare,
> +       .is_prepared    = clk_smd_rpm_is_prepared,
>         .set_rate       = clk_smd_rpm_set_rate,
>         .round_rate     = clk_smd_rpm_round_rate,
>         .recalc_rate    = clk_smd_rpm_recalc_rate,
> @@ -404,6 +415,7 @@ static const struct clk_ops clk_smd_rpm_ops = {
>  static const struct clk_ops clk_smd_rpm_branch_ops = {
>         .prepare        = clk_smd_rpm_prepare,
>         .unprepare      = clk_smd_rpm_unprepare,
> +       .is_prepared    = clk_smd_rpm_is_prepared,
>  };
>
>  /* msm8916 */
> --
> 2.28.0
>
