Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA8E442720
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 07:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhKBGcQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 02:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbhKBGcN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 02:32:13 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A38C061766
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Nov 2021 23:29:39 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 71-20020a9d034d000000b00553e24ce2b8so23957715otv.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 23:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Vk1yMTmG2ya+DPbvtv8niCWZs/tEJAFEV+sln2rxwX4=;
        b=FdkXCtz1a9s5dI8rUXv9QAKWL4huu+5OCpez8P3/bLStrpCUzJqMF7KFu1ssuFLUU5
         i0wHQ29Xvu4IT7svR8zwRTTlW8PIA2n1+hl0HWQBymzsqgyEP9bvnIPp8ilYf9M/3Q7u
         B3TEB9zgKzM+fbfLj9lF/sBR6ZtodInJT6+uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Vk1yMTmG2ya+DPbvtv8niCWZs/tEJAFEV+sln2rxwX4=;
        b=ERzLkJ0t3ISlbKv0xuQkhNWsOI1deoIWjKLh4iJ7AUG+XUcYC0GZYcuyYzUj6ZomtU
         suZKvZT+Cz8TRBFXct4vDFfL0/vOSyIB5SM6nN0HOpl+5BqHzhwmM+ps82DKuIh5JPRY
         eCPrExzqKlG2/nIPK2wAUSNC94qFJuntaLCvoP9+4Xgftx5mnATYJoopoEgVP/z7aIUI
         COX43xGY2L2ZPmVNFVWvl2hVtUBZvoPpVVH+60DykSq+L/z1PpVyS/IQqvYASinX0LHI
         UoipBxGsf+QlFkP6fjV6UOTun+JHXAQVlMY47PlGk6aD0wU7RnDkwWwhRd4HlNGNAGYg
         voBQ==
X-Gm-Message-State: AOAM531/7+DgM9gQP6AE/FO25nARgJ9gdHWiM2M8E81rbkHxR5mJ5YSo
        lWrVOAjHfRIKqcE/JSgEMVygnSvbtUu9n63tfEh9NA==
X-Google-Smtp-Source: ABdhPJy2WqAWLYnwxT3hzutOGOTANI4ZdtJzurp1Oj63lJtygXTRa6wex8nioVsqy9RGYh1mAYEu3IPtNasGxnbbyW0=
X-Received: by 2002:a05:6830:1290:: with SMTP id z16mr17390977otp.159.1635834578705;
 Mon, 01 Nov 2021 23:29:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Nov 2021 23:29:38 -0700
MIME-Version: 1.0
In-Reply-To: <20211102034115.1946036-1-bjorn.andersson@linaro.org>
References: <20211102034115.1946036-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 1 Nov 2021 23:29:38 -0700
Message-ID: <CAE-0n53PHpHmyk2rFZtErAo8zGFg8mXvfVYUFU31VhrLC4e-RA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sdm845: Enable dual edge errata
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-11-01 20:41:15)
> It has been observed that dual edge triggered wakeirq GPIOs on SDM845
> doesn't trigger interrupts on the falling edge.
>
> Enabling wakeirq_dual_edge_errata for SDM845 indicates that the PDC in
> SDM845 suffers from the same problem described, and worked around, by
> Doug in 'c3c0c2e18d94 ("pinctrl: qcom: Handle broken/missing PDC dual
> edge IRQs on sc7180")', so enable the workaround for SDM845 as well.
>
> The specific problem seen without this is that gpio-keys does not detect
> the falling edge of the LID gpio on the Lenovo Yoga C630 and as such
> consistently reports the LID as closed.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
