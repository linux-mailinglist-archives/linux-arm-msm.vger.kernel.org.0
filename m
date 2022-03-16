Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F84A4DB949
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 21:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353537AbiCPU0D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 16:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352764AbiCPU0C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 16:26:02 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5518A2C66E
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 13:24:47 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id v13so2866093qkv.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 13:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ivPqLyiNJbnmJk4hxBVjVwg3q4Q1FQmH/sEVySOJZBA=;
        b=l3sm7SDMmEOTusOKnBZMsCiPIMD62w6xc8H5g36QNSKU64kg3uK6rKuNYHwnyHvee3
         vjADlXIj187GklEXa/0ioE+lTl0Wnku6ATX9T/1iyRujJ65k3/hyaowS9+W/ZPPSDs5i
         sEWCYPD0dA7PDny7HOwkV65vKCMFcuaWmNSEs/jB9oyo0dFx1ErFNeeRd755/mHP6Uw5
         9mBf+D2qonlRg2tuGv5nlhLXrOLmwgDSC9BaehHl4AuojRjaggs8qMdAVAz1mDd114nT
         NQ9Z3zou3lO5w6oN/4rQ0/A51xGDEjKJTKV2JJArXf30iD1sglK3paYigUNXj5go6mxW
         4WXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ivPqLyiNJbnmJk4hxBVjVwg3q4Q1FQmH/sEVySOJZBA=;
        b=uc3RujquWRXLgYrsfHPfj3SLfKLWmYeTtthIL4e8QhPbj4j66YMkap9l1JHOVAVn4n
         NodfzNXjKAoJ7dpnp4P4coJLbxTXgAVlU7Y+05V1L5omHc8RxG3RQBjWGoZAjbFlTJ45
         phN4tOfMLctu9/wnSMA10vD0EFbD7AqJmJZnz8Q4CR56QFlNPtiSS1YwuhegjkcN67y2
         B7Q+yCoWPbeDhsFUjTeNl3+ORJe4kgRxlmraOpXgz7onreLzLUsysZjn/lZDscjW+TZM
         5CmIrF38uArYbUnt1aEHUiBnI84GaNu4nzd5m32HDROZkGLtiATXsUTK20e22oBobQ3s
         wt8A==
X-Gm-Message-State: AOAM531aRuVewvGdcFUksbYTUGml2PGuChFJ0yN8KBigiD2u5IHmp2Q9
        cR53xnUS6DbBlh5jKHUoYS5DlVJUbWaWP6xsPA3cVQ==
X-Google-Smtp-Source: ABdhPJzqwlApxyq7lsWK+22acdlSBDDtBs7AEx7TtXUuEivO4VgVtHuDW20tK1Qk+3mgq1yJYe1/hzvMNuILSgh/WQA=
X-Received: by 2002:a05:620a:28c7:b0:67d:6d4e:16ee with SMTP id
 l7-20020a05620a28c700b0067d6d4e16eemr965648qkp.59.1647462286423; Wed, 16 Mar
 2022 13:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220316180322.88132-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220316180322.88132-1-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 16 Mar 2022 23:24:35 +0300
Message-ID: <CAA8EJpotanjL_EHYr1-YQAXDOT--HGhGW2RH-0fO5189CEpB1Q@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/qcom/lmh: Fix irq handler return value
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 16 Mar 2022 at 21:01, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> After enough invocations the LMh irq is eventually reported as bad, because the
> handler doesn't return IRQ_HANDLED, fix this.
>
> Fixes: 53bca371cdf7 ("thermal/drivers/qcom: Add support for LMh driver")
> Reported-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/thermal/qcom/lmh.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
> index c7f91cbdccc7..af9f0872614f 100644
> --- a/drivers/thermal/qcom/lmh.c
> +++ b/drivers/thermal/qcom/lmh.c
> @@ -45,7 +45,7 @@ static irqreturn_t lmh_handle_irq(int hw_irq, void *data)
>         if (irq)
>                 generic_handle_irq(irq);
>
> -       return 0;
> +       return IRQ_HANDLED;
>  }
>
>  static void lmh_enable_interrupt(struct irq_data *d)
> --
> 2.33.1
>


-- 
With best wishes
Dmitry
