Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66E5D46E9D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 15:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbhLIOVq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 09:21:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232563AbhLIOVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 09:21:46 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC9DC0617A1
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 06:18:12 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id q14so5376975qtx.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 06:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GWGkM9rurSb1eSEYFyRCEnmhOoHzPSD6HMJKf80oaYg=;
        b=Q+NEb8lUMRUWvd/mr5jIDet6HO2IaVk2ddCnCnm1NFIDlpaMi3NLUw21EvLbgp/XAp
         ILM02klMH6CpJXQiYtv9GXZ/gAehsY/OiYQHQdFTvcS99jIFKn27WgujyKSH4O/nkAq1
         H589pwrnxggrUaNugrDe9zfNJSYjmPhAHPXG6yF/ZYUhCNKGxRbWFR8rnUdEvu1dbx/3
         9vXrTFncksCCnIxDc3F4xxVty5zbI16N6FLmJqn0VrFIiTU57X7IFkKogQhOd5elfsdJ
         Xdl+XgRqnAP2Fr30PhXXVlQWdJf3DhZHuQHwJUlYZsyhed6YJ0Yglwsukf6Q36xDk1U+
         g50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GWGkM9rurSb1eSEYFyRCEnmhOoHzPSD6HMJKf80oaYg=;
        b=p/1foq07Iwt+SB2Y3FmwXCV2xzjrdJPjlhcjndlNcame5VUObMt25fp36aNf5PJ7AB
         FicAsOQHuT6bXmBLnYb7BT+6CJZXwnMsU9P15ldT3kScQNbQdOuLSH2oJQLLNV55jNHG
         zLkU9sme5cIvV4giN+K7hKQX8cJqyaDCnt6r+M8spJ6ECUQPKw0DM4YyXrToZmdGYcH4
         LJ+ZFxoGinrE95vdOyOsP0jhMRzihoKxEO2Tca5CFDVOdhw9mF1uiXqEDS22uj+PmoDy
         8z3pY5CRgjR8s3V2i5/cWpCFhAqgXyzNn8YFpwemIPqHeGh1TRe3ftbmgUZRpOstajGW
         m63g==
X-Gm-Message-State: AOAM5321IO8nfylzT9gPmZKfRB1cz7MHzTkqotgR3QcYMcYpV7EenOXb
        fajRKU7NY8A/1+CRu8qbm/oma3iurpqzHbMnncxljQ==
X-Google-Smtp-Source: ABdhPJyLMtblBvaUarBKdmP7UG/UfVF1Bi1UWWytJvthVbqiX1FqHZ48k/aF/lII2J3lJfWgdbS0HQ7lZNCDLfwuOKA=
X-Received: by 2002:ac8:4e8c:: with SMTP id 12mr17673485qtp.45.1639059491769;
 Thu, 09 Dec 2021 06:18:11 -0800 (PST)
MIME-Version: 1.0
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
 <20211208022210.1300773-3-dmitry.baryshkov@linaro.org> <CAG3jFyvuudxc_6Vh-24WcvgBDa0G2_uAtPYYtuBFoYosE3Ld1A@mail.gmail.com>
In-Reply-To: <CAG3jFyvuudxc_6Vh-24WcvgBDa0G2_uAtPYYtuBFoYosE3Ld1A@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 9 Dec 2021 17:18:00 +0300
Message-ID: <CAA8EJprC-jX-0otdLYJyGEnXzwpQVEcfo9jBRXhyVopxdHBMmA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sdm845: park disp_cc_mdss_mdp_clk_src
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 9 Dec 2021 at 17:11, Robert Foss <robert.foss@linaro.org> wrote:
>
> On Wed, 8 Dec 2021 at 03:22, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > To stop disp_cc_mdss_mdp_clk_src from getting stuck during boot if it
> > was enabled by the bootloader, part it to the TCXO clock source.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/dispcc-sdm845.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> > index 735adfefc379..f2afbba7bc72 100644
> > --- a/drivers/clk/qcom/dispcc-sdm845.c
> > +++ b/drivers/clk/qcom/dispcc-sdm845.c
> > @@ -858,6 +858,9 @@ static int disp_cc_sdm845_probe(struct platform_device *pdev)
> >
> >         clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
> >
> > +       /* Park disp_cc_mdss_mdp_clk_src */
> > +       clk_rcg2_park_safely(regmap, 0x2088, 0);
>
> Could the hardcoded number be replaced with
> disp_cc_mdss_mdp_clk_src.cmd_rcgr just to make this easier to read?
> Maybe the comment isn't needed with this change.

Nice idea!

>
> > +
> >         /* Enable hardware clock gating for DSI and MDP clocks */
> >         regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
> >
>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>



-- 
With best wishes
Dmitry
