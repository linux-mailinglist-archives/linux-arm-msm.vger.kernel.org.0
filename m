Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24CD0423959
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 10:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237577AbhJFIFJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 04:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237558AbhJFIFJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 04:05:09 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A584C061749
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 01:03:17 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id j8so6065986wro.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 01:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wAAdd1+uVbI4T/QZqwf0vF35B/2m70mpYBMvc6iE4AI=;
        b=augZAtuxlW+hGXrXwWzd/kWl3KzWS3ozGI4vcjA5NnV4rUAvyMVfxG5w+iM9vVN0bF
         c44U8N9LXo663btPeo0rn3uGvu/A+Hk/0HxnNb7WFeTwrUbWY2CU/AGt8/c9Q5HX1S4D
         UNhbwwBkhVm0fxw6lZ3RIkUnYu7CXCw+TSED2+Ej8X7sPpGzMhiDsiKcJ7PhnF7cuZ/V
         ApKPEEHmgQ1sW0Kq/5cq46c+EFPRl1AOl6GLHD6BgOIjWRFxA4JzSd2RbGh1FnEKjZPK
         dVSggxYg+qiAiLlsihrUyN6vAgMOrNuaLhdi1WBUfn8BL1qzMWQpGqauolCUaAzN6L9i
         vUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wAAdd1+uVbI4T/QZqwf0vF35B/2m70mpYBMvc6iE4AI=;
        b=SpFVASD6lI0EVJ+JjMF840vzgDDIAN4dzl6C8+VMj+MXpKV7zRwTlE/z52E5LvzjJ0
         5KB0bhaWLDVPmg/UkyTWGYonKSNaYlaGzobY5SokeU5qoCK5vqQ0f0/w3MT1tPNcLX7C
         chCwCto1XmO1QJc0/KuDiGycxX0SHvUQM7SZh4MBiWOZJiJC4sqf/yXeVP8zGBCeSQbd
         8hBnul7r7JQU/TaphECEqAeRu6TIUwawGtfw6SqFSBVcDO0CulrWSeU3FZL0QnPEuyQ4
         33+UEihK2D4K47z5FVuytqKAM4HmQq2yftZ+XEbQASZvrCrXziJPYMVyWtUNXQifbgk3
         n0gg==
X-Gm-Message-State: AOAM533D9PvzwvmVJJsd/Qawt1lcM8B5+GTwWr4A3DzO4nsGnM0BaiR+
        4vMtNAE/NpjUeWzZiZoOJ9N8uw==
X-Google-Smtp-Source: ABdhPJzgE/UpBNMwYUT7j/WlZmyABE/mUe8Zvj4+nJ6obtpiXUKYvLwX6rRsRU6cJgQxcGJ85Di19g==
X-Received: by 2002:a05:6000:550:: with SMTP id b16mr27714697wrf.297.1633507396166;
        Wed, 06 Oct 2021 01:03:16 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id e8sm4191543wme.46.2021.10.06.01.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 01:03:15 -0700 (PDT)
Date:   Wed, 6 Oct 2021 09:03:14 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mfd: qcom-pm8xxx: switch away from using chained IRQ
 handlers
Message-ID: <YV1YQvxdTxCyyWXZ@google.com>
References: <20210921162433.1858296-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210921162433.1858296-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Sep 2021, Dmitry Baryshkov wrote:

> PM8xxx PMIC family uses GPIO as parent IRQ. Using it together with the
> irq_set_chained_handler_and_data() results in warnings from the GPIOLIB
> as in this path the IRQ resources are not allocated (and thus the
> corresponding GPIO is not marked as used for the IRQ. Use request_irq so
> that the IRQ resources are proprely setup.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/mfd/qcom-pm8xxx.c | 39 ++++++++++++++++-----------------------
>  1 file changed, 16 insertions(+), 23 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
