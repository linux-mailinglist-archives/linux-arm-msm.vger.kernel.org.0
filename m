Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98293B2054
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 20:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhFWSdA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 14:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWSdA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 14:33:00 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52005C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jun 2021 11:30:41 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 6-20020a9d07860000b02903e83bf8f8fcso2869402oto.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jun 2021 11:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WJMzr+Jl3R5GAI9Of144V0IeWXQCmxVgTH63e35xnxk=;
        b=vjodYnCLgNjzjazT/YAtt/llLZzCBXCn8HWNy85RMQPXTF5ZH0G+Zw0uiouIc02DrH
         X5iM8K3gLnzTPCv6HHFd8b3SBMK5qlkxUXPvzYhMUEviupkzLI5NAiK0ILCOB8muJTVr
         GgAJqxInOWhXdX9x4fCTZiE+w9n8e/D8QTtNc1k6Leyu3au7KkRb/aXtjkfOER5IPXXo
         ZYAM8zLs+Yh30DnMflN+BGNyJKt5TVSTyOTjIKPQ0vrfBFdQJfuQk4o8s5s5g96kAWX5
         qNUYyjfmh0zrI4mFeCnEqnvatlw/bjcz5L+GdahAwPKlwMlWtJhlkxzzFVEvooodrkc6
         MEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WJMzr+Jl3R5GAI9Of144V0IeWXQCmxVgTH63e35xnxk=;
        b=Sv11OunfnJ/lQ/Es84Gk+pEoJarMlRgaojge533pg6gqUklqdBhf7MrnYL18yI6Vvv
         mdeJiK6HZkADILsujsLHG0IhAewSK/m7axUyvlBBfbcDsxxDbkDU6uf+f3cdxywfMG/T
         06vC2XhjY9gmtLKIn+RxiHH17ZxYaovJXgrdpw2rSkFCB2kBBSqzE3AsrlcAFUTYHs6L
         1qSnSchC+TDtWuzRiudYaHIw8/yHCzpGwg9fUyURccjjsq9Bfqs/sJsifzvOlGZ2w8Pq
         vi//4kKmQvEWZ3xP0GopZadRKURX7qTbGiuojvJY//vG8UEmk/zMnUJHLhiNkzwTif5u
         l7qw==
X-Gm-Message-State: AOAM530p4dnyGokOxvZ7vOK9XD3hNua8f/RvdgTITBCrHzkNi8Ic5PEo
        wQhKQFdasheG1IevchROnYXpfA==
X-Google-Smtp-Source: ABdhPJyIdbly5DHprDKi6hQM47lDMQy4DGmNCYeUrQuWrEiOpr09hH6GKHiSNMtYkbSlVKpu5UtLPg==
X-Received: by 2002:a9d:5a18:: with SMTP id v24mr1107219oth.191.1624473040619;
        Wed, 23 Jun 2021 11:30:40 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w132sm113099oig.38.2021.06.23.11.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 11:30:40 -0700 (PDT)
Date:   Wed, 23 Jun 2021 13:30:38 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/3] soc: qcom: smem_state: Add devm_qcom_smem_state_get()
Message-ID: <YNN9znie9VTj+wg7@builder.lan>
References: <20210618111556.53416-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618111556.53416-1-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 18 Jun 06:15 CDT 2021, Stephan Gerhold wrote:

> It is easy to forget to call qcom_smem_state_put() after
> a qcom_smem_state_get(). Introduce a devm_qcom_smem_state_get()
> helper function that automates this so that qcom_smem_state_put()
> is automatically called when a device is removed.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> I use this in my WIP bam-dmux driver, so it might simplify coordination
> later if we can somehow get this in for 5.14 (if it isn't too late yet).
> 
> Similar code can be found in clk-devres.c for example:
> https://elixir.bootlin.com/linux/v5.13-rc6/source/drivers/clk/clk-devres.c#L7
> ---
>  drivers/soc/qcom/smem_state.c       | 36 +++++++++++++++++++++++++++++
>  include/linux/soc/qcom/smem_state.h |  7 ++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem_state.c b/drivers/soc/qcom/smem_state.c
> index d2b558438deb..31faf4aa868e 100644
> --- a/drivers/soc/qcom/smem_state.c
> +++ b/drivers/soc/qcom/smem_state.c
> @@ -151,6 +151,42 @@ void qcom_smem_state_put(struct qcom_smem_state *state)
>  }
>  EXPORT_SYMBOL_GPL(qcom_smem_state_put);
>  
> +static void devm_qcom_smem_state_release(struct device *dev, void *res)
> +{
> +	qcom_smem_state_put(*(struct qcom_smem_state **)res);
> +}
> +
> +/**
> + * devm_qcom_smem_state_get() - acquire handle to a devres managed state
> + * @dev:	client device pointer
> + * @con_id:	name of the state to lookup
> + * @bit:	flags from the state reference, indicating which bit's affected
> + *
> + * Returns handle to the state, or ERR_PTR(). qcom_smem_state_put() is called
> + * automatically when @dev is removed.
> + */
> +struct qcom_smem_state *devm_qcom_smem_state_get(struct device *dev,
> +						 const char *con_id,
> +						 unsigned *bit)
> +{
> +	struct qcom_smem_state **ptr, *state;
> +
> +	ptr = devres_alloc(devm_qcom_smem_state_release, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	state = qcom_smem_state_get(dev, con_id, bit);
> +	if (!IS_ERR(state)) {
> +		*ptr = state;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}
> +
> +	return state;
> +}
> +EXPORT_SYMBOL_GPL(devm_qcom_smem_state_get);
> +
>  /**
>   * qcom_smem_state_register() - register a new state
>   * @of_node:	of_node used for matching client lookups
> diff --git a/include/linux/soc/qcom/smem_state.h b/include/linux/soc/qcom/smem_state.h
> index 63ad8cddad14..17c56a50302f 100644
> --- a/include/linux/soc/qcom/smem_state.h
> +++ b/include/linux/soc/qcom/smem_state.h
> @@ -14,6 +14,7 @@ struct qcom_smem_state_ops {
>  #ifdef CONFIG_QCOM_SMEM_STATE
>  
>  struct qcom_smem_state *qcom_smem_state_get(struct device *dev, const char *con_id, unsigned *bit);
> +struct qcom_smem_state *devm_qcom_smem_state_get(struct device *dev, const char *con_id, unsigned *bit);
>  void qcom_smem_state_put(struct qcom_smem_state *);
>  
>  int qcom_smem_state_update_bits(struct qcom_smem_state *state, u32 mask, u32 value);
> @@ -29,6 +30,12 @@ static inline struct qcom_smem_state *qcom_smem_state_get(struct device *dev,
>  	return ERR_PTR(-EINVAL);
>  }
>  
> +static inline struct qcom_smem_state *devm_qcom_smem_state_get(struct device *dev,
> +	const char *con_id, unsigned *bit)
> +{
> +	return ERR_PTR(-EINVAL);
> +}
> +
>  static inline void qcom_smem_state_put(struct qcom_smem_state *state)
>  {
>  }
> -- 
> 2.32.0
> 
