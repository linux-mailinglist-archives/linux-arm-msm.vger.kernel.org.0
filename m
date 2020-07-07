Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE862167B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 09:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbgGGHpk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 03:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgGGHpj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 03:45:39 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F41C061755
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 00:45:39 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x11so16410373plo.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 00:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OdfdZpdNlsV+8LTmBqKkqZF5iyRO7Rci5zel+rmMCoM=;
        b=kNCRVKcZ9mjznF/w/m4aPSj+Mym7tEPuOKuif0DcypOHs4zb7snyDKk/NwvKsX5dUg
         +MsG+ychwHDm0EH9vXYVN+hzv01mZCTXkejxiME7LyK9xH4GQCyhqbhvD/B8xkqY0V4s
         ha/42bzDA3cT7CPuWoQxQSE01x/7kUcPgzvf/n5AI3J69epWaatvXaKBU2F9gpSXJiLO
         TjnOvQUVe5zxfeAmTW1FTA1BQXPp6oBI6EvqAXPAlmKxiv/AdLUVvZVHDqBxJDmTnsUr
         w8+gaXmhPaq5Uf8ooJX+jv2ZJ4zRBbOCuDd+NthaSnd5pnnEZ7vSakB/TTa8AdObqx7+
         XeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OdfdZpdNlsV+8LTmBqKkqZF5iyRO7Rci5zel+rmMCoM=;
        b=S9WlHj7wdt4fLSBugQY+34ix47bAjRfqJIF3/1sx3zoxgh1aK+GM9korj5/n3SEIyW
         Kr+yyTOTRWIWaesYCmLd3mwZDRXXCbZ3fJjIylOVjJ8Z1OK7KuQSJip4JulBs7DjvHBh
         uN9k1dJkrwEWcF1PE33rzgvV37XmrGiZsUhjlslj38TVP1chNyIP9ehze7Wx3cW7gWba
         Fgrfw3aIP8RNZTfWbjCJQSV2fzjmz7yfVLrKbPPOnGCTmufPVyBm2zsghtulw46mFKiS
         idQUgs7iUfjQdHG0w3VKXNCFtK7s/IRxYmq4yrVnCo/+Ca38xdXAMRfxNMOPKqlFW6fB
         /N2Q==
X-Gm-Message-State: AOAM5321vGwnmu9dWyPhrNeuJs5o1Wxa1GrWPgLW6gzitO/gbJX0jZGD
        F4I29Ow04btBLkzCuhNM/cGmSQlzwb4=
X-Google-Smtp-Source: ABdhPJzA4pJfLWFX2jkVsjIUyDya1VaRc3xsb5pgU9v38c2IJFu6TU1M06feHzFjmbTZ9lKnVNppLw==
X-Received: by 2002:a17:902:326:: with SMTP id 35mr19721531pld.151.1594107938544;
        Tue, 07 Jul 2020 00:45:38 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z8sm15986pgz.7.2020.07.07.00.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 00:45:37 -0700 (PDT)
Date:   Tue, 7 Jul 2020 00:43:18 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaprak@codeaurora.org,
        srichara@codeaurora.org,
        Rajkumar Ayyasamy <arajkuma@codeaurora.org>
Subject: Re: [PATCH V2] pinctrl: qcom: ipq8074: route gpio interrupts to APPS
Message-ID: <20200707074318.GT388985@builder.lan>
References: <1594107588-17055-1-git-send-email-kathirav@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594107588-17055-1-git-send-email-kathirav@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 07 Jul 00:39 PDT 2020, Kathiravan T wrote:

> set target proc as APPS to route the gpio interrupts to APPS
> 
> Co-developed-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>

Thanks for the quick respin.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-ipq8074.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8074.c b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
> index 0edd41c..aec68b1 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ipq8074.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
> @@ -50,6 +50,7 @@
>  		.intr_enable_bit = 0,		\
>  		.intr_status_bit = 0,		\
>  		.intr_target_bit = 5,		\
> +		.intr_target_kpss_val = 3,	\
>  		.intr_raw_status_bit = 4,	\
>  		.intr_polarity_bit = 1,		\
>  		.intr_detection_bit = 2,	\
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
> 
