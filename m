Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52017423984
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 10:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237551AbhJFIQ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 04:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237687AbhJFIQ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 04:16:28 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12022C06174E
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 01:14:36 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id s15so6151082wrv.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=D8WXJlocWRiYWuMUiQqfM/sGK1iCzHG+WuB97OHRh+4=;
        b=Mn/av4/M7+etUTlVbNhHxKSrbpHTlYQNeVMIE8b0gtwMAF9lF0dL9hXMP32swiZqX7
         W1Z9o5Ex6cOMz+jkJgHfB/MOcYZrt4IOVsDXl1lFMLEX2Dwf+N1GTVthFHavf30fFrFb
         6EITLmi9EvTsk2/1+iBIrDDV1CjillXUvrIyK6hK40qSChyWkk9wDsxQz0CcTMK5UKnz
         Mq5i6bnNQdDRpSo3h1zSBkJm1Kk0yEuflY5d7/TidZlrbhFeyIBG6V28O27ErIRMW3K6
         xXZLzbbCXycYcMMbApkuA4GAktVgqMXl81jClVqBuko8eEUm+W1HiqvqsIMt6aDffhUQ
         j4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=D8WXJlocWRiYWuMUiQqfM/sGK1iCzHG+WuB97OHRh+4=;
        b=ViYSdSmFxpPGLrA2vRdFWgNsqJ0KaqaBw5JcQwCq/PnOpV9rvZIE+TsV07KEDbdCDg
         PGhLQMHRmqXushZLVLdLnvyUznLlwM+h8zhPHv1n8t7dWzBq/D8U+9lrp/3RsnQpNkoG
         FXKqSDS1K/rIVcTLrPS3/LgjwyMkkKzx+RLiMvNGsxra3VECPWUs1dUKWZrNTCefO07V
         H8SFf8PTSOLZ5cWEC4jdYO2/BF+8HfGOXM/jybQjnnZC7iKXDVXSdkV+eE3eXHNUFdMx
         FyG5I7erUB39MKEzjgd3STM3wNOJmqRQOu0yvhfsmu9kMhNX7HxDY+8ETMVChHvVki5t
         qU8g==
X-Gm-Message-State: AOAM531392DZceCfMpAK5AoncCo3uuunwwjbjD+olqet2hAgFhrsOzBQ
        fAqwN4Kd0aKlsprXXcrg8k/PoA==
X-Google-Smtp-Source: ABdhPJyW94NigX7gg8XLIDP/2mjrL/6J0h6PgyTT5R26HJhmjmzxw9R/lohJSrr3ypTLnlf577E1/w==
X-Received: by 2002:a5d:47c4:: with SMTP id o4mr27217778wrc.102.1633508074642;
        Wed, 06 Oct 2021 01:14:34 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id f22sm7130561wrd.8.2021.10.06.01.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 01:14:34 -0700 (PDT)
Date:   Wed, 6 Oct 2021 09:14:32 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] mfd: qcom-pm8xxx: switch away from using chained IRQ
 handlers
Message-ID: <YV1a6OM2/6Rfqt89@google.com>
References: <20210925234333.2430755-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210925234333.2430755-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 26 Sep 2021, Dmitry Baryshkov wrote:

> PM8xxx PMIC family uses GPIO as parent IRQ. Using it together with the
> irq_set_chained_handler_and_data() results in warnings from the GPIOLIB
> (see 461c1a7d4733 ("gpiolib: override irq_enable/disable"))
> as in this path the IRQ resources are not allocated (and thus the
> corresponding GPIO is not marked as used for the IRQ. Use request_irq so
> that the IRQ resources are proprely setup.

[...]

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Tested-by: David Heidelberg <david@ixit.cz>
> ---
> Changes since v1:
>  - Expanded commit message to include warning text and gpiolib details
>  - No code changes

Replaced the previous applied version with this one, thanks.

> ---
>  drivers/mfd/qcom-pm8xxx.c | 39 ++++++++++++++++-----------------------
>  1 file changed, 16 insertions(+), 23 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
