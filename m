Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD9E202900
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2020 08:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729334AbgFUGDs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jun 2020 02:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729282AbgFUGDq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jun 2020 02:03:46 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96EB1C061794
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2020 23:03:45 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d10so4149486pls.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2020 23:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E37Y5fbYX2B/AUZ69TRQLOn9ZrdWJ1PDTbytHbYw12I=;
        b=bEXtwFplRNji+ZAlc70WTzC2kmlYpyz9O7mWigm5rajr5DgliPr3sad6SDrRGM7Kxf
         AwS4rnsGWi0suv+nLr/dTLjpe/5BBQWQ78Y/MLvC6fIzRiiGWDyDvxlIwAkT6yhVwCVd
         L5Nqmm9rZgD4hg6kOnjyoD90IV4D0fRF8b6QhEkYL4UND9cEbgOAMAO0KGNbHg/xJxzE
         G4QbwMr2XpUzZ00E4P0OlQSphxTK+8k6P8gtvtTANIoMPfCSKI8Lv2oSt70mXr3kVJnX
         mRNNXqZ5KQsa4qUoQjbNJsw5b0Ou9b7vS1uP2/0cXZscaYixyou2r2uvCkhkOuP7Lkp+
         jjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E37Y5fbYX2B/AUZ69TRQLOn9ZrdWJ1PDTbytHbYw12I=;
        b=oiZTOm8AE3Y0mfOLGl9PZTv1iIFfzlIfY+xtIJfIRZE0vpSMFyajCjo7twIv4laCrq
         32fj13FcuB0/lZiXqs/TFDbhZAYbxtisOMEo49iv+jsyJG207UjAKYM1ZZqj2qWU5h2a
         0Rn4dzJDPraOhYk4BPGYRX7yKa+kxD8p/TA/omQHGqvKPkfy1BribRJZSZk3j4YoVlSf
         IGw+wNh023tC5yznWLa2eGZzqiyyBfoV/v+0+1o35Z7SXFpw+ncqfEhkDEz5Hz7F0lHD
         TPdrcPi+JGrR2cJCcfST/+t291Jp4i83X9d05MDYaIKHvKRJyFIxZtxMJJMqpyf5IU0N
         2WSA==
X-Gm-Message-State: AOAM530c928xNF/yKdertbonF91iKc5NaFFA4Y9pltN5F6oh1ArfsH5x
        dXmNqiJtr+ikHvfyCe2CV1x/bA==
X-Google-Smtp-Source: ABdhPJxHRHspjuIwXRf0s9ZHcLtbwGIglVcsxqFPwAZTEDfrkST5fk9GgmGyQ7so94acwcjrzTu6RA==
X-Received: by 2002:a17:90a:6ace:: with SMTP id b14mr12034953pjm.13.1592719423730;
        Sat, 20 Jun 2020 23:03:43 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 77sm10459560pfx.172.2020.06.20.23.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 23:03:42 -0700 (PDT)
Date:   Sat, 20 Jun 2020 23:00:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: Re: [RFC][PATCH 4/5] pinctrl: qcom: Allow pinctrl-msm code to be
 loadable as a module
Message-ID: <20200621060055.GA2421@builder.lan>
References: <20200616061338.109499-1-john.stultz@linaro.org>
 <20200616061338.109499-5-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616061338.109499-5-john.stultz@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 15 Jun 23:13 PDT 2020, John Stultz wrote:

> Tweaks to allow pinctrl-msm code to be loadable as a module.
> This is needed in order to support having the qcom-scm driver,
> which pinctrl-msm calls into, configured as a module.
> 

This means that we need a "depends on QCOM_SCM || QCOM_SCM=n" on all
entries in the Kconfig that selects PINCTRL_MSM, or switch PINCTRL_MSM
to be user selectable and make all the others depend on it.

> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/pinctrl/qcom/Kconfig       | 2 +-
>  drivers/pinctrl/qcom/pinctrl-msm.c | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index ff1ee159dca2..5a7e1bc621e6 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -2,7 +2,7 @@
>  if (ARCH_QCOM || COMPILE_TEST)
>  
>  config PINCTRL_MSM
> -	bool
> +	tristate
>  	select PINMUX
>  	select PINCONF
>  	select GENERIC_PINCONF
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 83b7d64bc4c1..54a226f682e9 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1355,3 +1355,6 @@ int msm_pinctrl_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL(msm_pinctrl_remove);
>  
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. pinctrl-msm driver");

It's the "Qualcomm Technologies, Inc. TLMM driver"

> +MODULE_LICENSE("GPL v2");
> +

Please don't retain my empty line at the end of this file :)

Regards,
Bjorn

> -- 
> 2.17.1
> 
