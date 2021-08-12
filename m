Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8EA3EA3F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 13:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236922AbhHLLqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 07:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236862AbhHLLqt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 07:46:49 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E3EC0613D3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 04:46:24 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id 91so2686954uas.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 04:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dqTStev+wYL6Dxoo88ZspHDb/tS9Nzm53GGUL0+lh+g=;
        b=gQcZt/UfAcwS5D+nBy4DaQGe0l1WZGVpzBPyRGmtaqz1LAcqV+ODkWaS0i4Sggsh+k
         nubMU25BdBOnlIzRZKwDdfF2s29Uklyuscx2uR6WDfUyx1pZQ4sgMQTwc5PkLgLs0GRz
         zHbuOIeUq4GFZZf6wr5P+6eCtX1+liEOeaxL8Xob5w2YYY5zEVZHg+R3H6XwFAObUz6O
         wC+G6FPbVn1UVZoBu2c4ZwodDzSEnscrY0I7ivJkw6QtUN8gEyw5LiRjMPaxLciVaRHk
         rVflX189QRHYLuEYdmQfvxbxgtO0dxUZZTNQiM0bo+S1r9S56/P0Ke7DJPRTsWwUzY0f
         qdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dqTStev+wYL6Dxoo88ZspHDb/tS9Nzm53GGUL0+lh+g=;
        b=a6JMmWpz4Mxq3JPnsz489Cu2AULla6buRRQH48ITJXWTdKHe6PTRNclOpfBWF01n0c
         sLcD1w6Z9ReVLm/Oy9PNCF+6bzT0mWm4x9nTxid1ZazrHJngOKd+JDbMUlRWftSZtRgI
         zv3yhx1tY1LMszO5PCYj36+FAc1PWWflLTnDzxsoAQO7YQgLWilLqgLjG2rTYexo3QfL
         hK89dvwGb6tjMhWn5G3V7Dpn2CHzJ65QAZTlqdFliGMNXsdEnoxQmA/opWk1tnQyor65
         sVjU8jX8wnMa5A5QST1tDKguOUtabWeAdcCbV82w7mH1NVTfu/FriO8qmYaPDD2pfwVh
         OIRg==
X-Gm-Message-State: AOAM530s0JhjeIo8WcogOmGP63zhISFOKBwcy0gZ3LgCe3CnLgCZPRTR
        D/0Yo1MwNixSlhVD4cSx9wcFpBdp8ijPczpQ3pv/wA==
X-Google-Smtp-Source: ABdhPJzrpjG3MA2aQirSmS7CoSCz0zHPU4zYhrCxt9ru09NER+p/85knZT4Qe7T7zJqIBP9HyiJ/0M0D/W2SuX/ZM2o=
X-Received: by 2002:a9f:25a7:: with SMTP id 36mr1584262uaf.129.1628768782902;
 Thu, 12 Aug 2021 04:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <1628767642-4008-1-git-send-email-rnayak@codeaurora.org> <1628767642-4008-2-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1628767642-4008-2-git-send-email-rnayak@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 12 Aug 2021 13:45:46 +0200
Message-ID: <CAPDyKFoOta-4JX5ViJ6D5gArpQSobgecSV5yQ4SQ4-31_TMgcQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] opp: Don't print an error if required-opps is missing
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 12 Aug 2021 at 13:27, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> The 'required-opps' property is considered optional, hence remove
> the pr_err() in of_parse_required_opp() when we find the property is
> missing.
> While at it, also fix the return value of
> of_get_required_opp_performance_state() when of_parse_required_opp()
> fails, return a -ENODEV instead of the -EINVAL.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/opp/of.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index d298e38..9bdabad 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -95,15 +95,7 @@ static struct dev_pm_opp *_find_opp_of_np(struct opp_table *opp_table,
>  static struct device_node *of_parse_required_opp(struct device_node *np,
>                                                  int index)
>  {
> -       struct device_node *required_np;
> -
> -       required_np = of_parse_phandle(np, "required-opps", index);
> -       if (unlikely(!required_np)) {
> -               pr_err("%s: Unable to parse required-opps: %pOF, index: %d\n",
> -                      __func__, np, index);
> -       }
> -
> -       return required_np;
> +       return of_parse_phandle(np, "required-opps", index);
>  }
>
>  /* The caller must call dev_pm_opp_put_opp_table() after the table is used */
> @@ -1327,7 +1319,7 @@ int of_get_required_opp_performance_state(struct device_node *np, int index)
>
>         required_np = of_parse_required_opp(np, index);
>         if (!required_np)
> -               return -EINVAL;
> +               return -ENODEV;
>
>         opp_table = _find_table_of_opp_np(required_np);
>         if (IS_ERR(opp_table)) {
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
