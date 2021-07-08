Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6043BF2D7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 02:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhGHA22 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 20:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbhGHA21 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 20:28:27 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D52C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 17:25:47 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id t3so5684762oic.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 17:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=jH3A9plBW2O7hYj6eJ2jbUkaYJjpNhZIk97iV5dVzVM=;
        b=CJ1l48NJeuncxJp2ZoUIppr9QOTZ7bDWCtOQfPaW9SfQhzdTjJbHFI3StOxDAmDDSv
         Pd9T+l5Odw9Pi/ulpfkkAdHkmmjNnXCcCqB6LtVKo7RjFGXgj0D/42JPLVLqEIjlEnjS
         Mc4bwJkkYRGHnFDDF+nLgkwsJrgY11rXcqexg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=jH3A9plBW2O7hYj6eJ2jbUkaYJjpNhZIk97iV5dVzVM=;
        b=Z338PAySWDgXDuUrITAUak17vQ9NjSvX0oU56TBI21ohUGIwhJG9+ubcGWb36U7z1e
         3nJr7+xetagf7+HCPbfa4F4pIkD3tkZgb6wABH+sywPfp2mN0Zk8YRetj/CikmrDSaMJ
         NW7eDQ1WhX2gbJdSG1s90r5htKpDFM1WlHVvwczFk7vbUCyrXWussaVK7HXj7f2eo9Tz
         5ppgVpBpwJGk0KGq/kRFMjdjTYZ4TbTIAdPI08J8ZzJtKGMUg4ymRsmb/jaDnkKXVFxP
         sUMX6Ishe0cn+cqYxyZBLdesbrmU2KQ7drOahq65tsO90VORpzNOiZhIbOWC/5xf18G+
         81tg==
X-Gm-Message-State: AOAM532pd10Af4rYY/z0d7Bz6sEKmKxinJQCmTnWPlJp3tBRBVDmJXpS
        7fWyj7xWlyShAGr2veEhOFOdKnK1SwwJ6QmhJHvaBw==
X-Google-Smtp-Source: ABdhPJxT0Lh0ACGveKx5fyRmrNijGTVxbottgRUPi5I7vVTeIeYC+891+p3R8lDOUcTRgBCLEJi37ulqdsYgIG8JkIk=
X-Received: by 2002:aca:d941:: with SMTP id q62mr1541200oig.166.1625703946335;
 Wed, 07 Jul 2021 17:25:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 00:25:45 +0000
MIME-Version: 1.0
In-Reply-To: <20210703025449.2687201-1-bjorn.andersson@linaro.org>
References: <20210703025449.2687201-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 8 Jul 2021 00:25:45 +0000
Message-ID: <CAE-0n50tOPS65hb_+d=kk1_wU0WyxCy2TN1itYXPAXxWi2s0Kg@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/2] soc: qcom: rpmhpd: Make power_on actually
 enable the domain
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-02 19:54:49)
> @@ -472,6 +478,10 @@ static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
>         for (i = 0; i < rpmhpd->level_count; i++) {
>                 rpmhpd->level[i] = buf[i];

BTW, this looks like it should actually be an __le16 pointer and then we
should do le16_to_cpup() here. Hooray for void pointers.

>
> +               /* Remember the first non-zero corner */
> +               if (!rpmhpd->enable_corner)
> +                       rpmhpd->enable_corner = i;
> +
