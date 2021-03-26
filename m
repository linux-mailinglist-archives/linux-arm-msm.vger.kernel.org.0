Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44BE34ADC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 18:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhCZRpg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 13:45:36 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:50474 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbhCZRpU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 13:45:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616780720; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3P5jYyIK/awWuVFoUzjX70WMvBZHGZktBN9ren2ZJqA=;
 b=RM3J/IQQNUnwau8CTRTDoVGlvjfQz9aeLyLHEt5y8cmEuvKW7cb3dVNY3VnV0wVlQ1e+ytR3
 znnUCCAllW3BQ+d3seC92nT9K1v1R+S/OC5ftBOYPyXVYAKoMLai/O9dmAW8+1pWCgbMfbeJ
 4LlretX4ppi5STUo1DWRHdy7yoc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 605e1dab853c0a2c463cdf4e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Mar 2021 17:45:15
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B663CC43465; Fri, 26 Mar 2021 17:45:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C2015C433CA;
        Fri, 26 Mar 2021 17:45:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Mar 2021 10:45:13 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v2 03/28] clk: divider: add
 devm_clk_hw_register_divider
In-Reply-To: <20210324151846.2774204-4-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
 <20210324151846.2774204-4-dmitry.baryshkov@linaro.org>
Message-ID: <17513743b70339aacf6bc86b9ea795f5@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-24 08:18, Dmitry Baryshkov wrote:
> Add devm_clk_hw_register_divider() - devres version of
> clk_hw_register_divider().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  include/linux/clk-provider.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/include/linux/clk-provider.h 
> b/include/linux/clk-provider.h
> index 3eb15e0262f5..162a2e5546a3 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -785,6 +785,23 @@ struct clk *clk_register_divider_table(struct
> device *dev, const char *name,
>  				  (parent_data), (flags), (reg), (shift),     \
>  				  (width), (clk_divider_flags), (table),      \
>  				  (lock))
> +/**
> + * devm_clk_hw_register_divider - register a divider clock with the
> clock framework
> + * @dev: device registering this clock
> + * @name: name of this clock
> + * @parent_name: name of clock's parent
> + * @flags: framework-specific flags
> + * @reg: register address to adjust divider
> + * @shift: number of bits to shift the bitfield
> + * @width: width of the bitfield
> + * @clk_divider_flags: divider-specific flags for this clock
> + * @lock: shared register lock for this clock
> + */
> +#define devm_clk_hw_register_divider(dev, name, parent_name, flags,
> reg, shift,    \
> +				width, clk_divider_flags, lock)		      \
> +	__devm_clk_hw_register_divider((dev), NULL, (name), (parent_name), 
> NULL,   \
> +				  NULL, (flags), (reg), (shift), (width),     \
> +				  (clk_divider_flags), NULL, (lock))
>  /**
>   * devm_clk_hw_register_divider_table - register a table based divider 
> clock
>   * with the clock framework (devres variant)
