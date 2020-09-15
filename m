Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C2826B0DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 00:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727501AbgIOWUy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 18:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727663AbgIOQ3P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 12:29:15 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94F6C061352
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 09:02:09 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id n133so4708742qkn.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 09:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V/aLtEUY6B56AdiUHiSTFlnv107KksL3AvSmWY2Ogms=;
        b=Oj6QWJiENcvCurggkr3CNnfa3yeXWQhwJziLZU89PPWvcoFsEHQtOSuGqNXi8XRLdt
         NLCzH7QTv1r6NzgVqcw9FBgPeb2qPGZMBXXzLX3iVd4arOu1KBy+JQERqaIuT15DdFa7
         +0jtJ+7Wq6IpFLPu8NqPdWVbxAi1KKsla/TQNTULf9arB9QgFdiFuGcy1qoOWLHCTpS7
         lZ5BZjqUa4chG8Z0tde+E2V3TQRYPtnfsu9NsoytOJnXn0SKbfmgaJMrHPCvBpae0JKL
         l5wsmYq0pKKCjJA8IuZrqGE0tRXL0BU5imXrLbu8OVgESASCtG7ehO90F6BjnNko9wa7
         1VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V/aLtEUY6B56AdiUHiSTFlnv107KksL3AvSmWY2Ogms=;
        b=dxqWsVk6cls3YN9+uUGDGmDvZUxzp6rYQPw4s97k0S4hRt9jwRYMu5XLktxu1lygzd
         bco2dSHYTW/WfA4WBD8164/BIURY6SK4CShqWGkBNGegzgWQ2kr/d5S0RDTIfJ938MqO
         SUm+yH7zWC3tweGOc4hSJ3hj6BwiwYKXQ7vzwLwULkHcrvx98Et/mNWTwcLzrA3Djff1
         hGIsztYwIL5m+twDbjjtNkFqvwfXJ4OOLBc4qfkxGa0Z2r/SHt5+SzGqE96jMItATNxH
         lYgQtI4Acia+yWX2mvHBVyEc1R2LuCsTkOx3wgJJkXjgyTCNYRgYNm/bmjmXoYQg45x1
         Djlw==
X-Gm-Message-State: AOAM532KUCI3KyXoPrigA0zqCfxzGXwmivi+Rhau38W2vBAz0vdQLYyD
        oySxowbJ/MrjnH/w6CAbdi3UZf15OryUkg==
X-Google-Smtp-Source: ABdhPJwVdi3sR8VucKNybKMCzwRULJLQ3tuvAB3D7pkFr8SAxGNdYgarRTiMSblgCblHIqZH5qBTzA==
X-Received: by 2002:a05:620a:2055:: with SMTP id d21mr19201384qka.202.1600185728679;
        Tue, 15 Sep 2020 09:02:08 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id z133sm17401707qka.3.2020.09.15.09.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 09:01:39 -0700 (PDT)
Date:   Tue, 15 Sep 2020 16:01:37 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCHv5 1/2] soc: qcom: llcc: Move llcc configuration to its
 own function
Message-ID: <20200915160137.GH478@uller>
References: <cover.1600151951.git.saiprakash.ranjan@codeaurora.org>
 <51f9ad67333eedf326212dd1b040aade6978e5b1.1600151951.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51f9ad67333eedf326212dd1b040aade6978e5b1.1600151951.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Sep 06:55 UTC 2020, Sai Prakash Ranjan wrote:

> Cleanup qcom_llcc_cfg_program() by moving llcc configuration
> to a separate function of its own. Also correct misspelled
> 'instance' caught by checkpatch.
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/soc/qcom/llcc-qcom.c | 89 ++++++++++++++++++++----------------
>  1 file changed, 50 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 429b5a60a1ba..14311060099d 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -318,62 +318,73 @@ size_t llcc_get_slice_size(struct llcc_slice_desc *desc)
>  }
>  EXPORT_SYMBOL_GPL(llcc_get_slice_size);
>  
> -static int qcom_llcc_cfg_program(struct platform_device *pdev)
> +static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config)
>  {
> -	int i;
> +	int ret;
>  	u32 attr1_cfg;
>  	u32 attr0_cfg;
>  	u32 attr1_val;
>  	u32 attr0_val;
>  	u32 max_cap_cacheline;
> +	struct llcc_slice_desc desc;
> +
> +	attr1_val = config->cache_mode;
> +	attr1_val |= config->probe_target_ways << ATTR1_PROBE_TARGET_WAYS_SHIFT;
> +	attr1_val |= config->fixed_size << ATTR1_FIXED_SIZE_SHIFT;
> +	attr1_val |= config->priority << ATTR1_PRIORITY_SHIFT;
> +
> +	max_cap_cacheline = MAX_CAP_TO_BYTES(config->max_cap);
> +
> +	/*
> +	 * LLCC instances can vary for each target.
> +	 * The SW writes to broadcast register which gets propagated
> +	 * to each llcc instance (llcc0,.. llccN).
> +	 * Since the size of the memory is divided equally amongst the
> +	 * llcc instances, we need to configure the max cap accordingly.
> +	 */
> +	max_cap_cacheline = max_cap_cacheline / drv_data->num_banks;
> +	max_cap_cacheline >>= CACHE_LINE_SIZE_SHIFT;
> +	attr1_val |= max_cap_cacheline << ATTR1_MAX_CAP_SHIFT;
> +
> +	attr1_cfg = LLCC_TRP_ATTR1_CFGn(config->slice_id);
> +
> +	ret = regmap_write(drv_data->bcast_regmap, attr1_cfg, attr1_val);
> +	if (ret)
> +		return ret;
> +
> +	attr0_val = config->res_ways & ATTR0_RES_WAYS_MASK;
> +	attr0_val |= config->bonus_ways << ATTR0_BONUS_WAYS_SHIFT;
> +
> +	attr0_cfg = LLCC_TRP_ATTR0_CFGn(config->slice_id);
> +
> +	ret = regmap_write(drv_data->bcast_regmap, attr0_cfg, attr0_val);
> +	if (ret)
> +		return ret;
> +
> +	if (config->activate_on_init) {
> +		desc.slice_id = config->slice_id;
> +		ret = llcc_slice_activate(&desc);
> +	}
> +
> +	return ret;
> +}
> +
> +static int qcom_llcc_cfg_program(struct platform_device *pdev)
> +{
> +	int i;
>  	u32 sz;
>  	int ret = 0;
>  	const struct llcc_slice_config *llcc_table;
> -	struct llcc_slice_desc desc;
>  
>  	sz = drv_data->cfg_size;
>  	llcc_table = drv_data->cfg;
>  
>  	for (i = 0; i < sz; i++) {
> -		attr1_cfg = LLCC_TRP_ATTR1_CFGn(llcc_table[i].slice_id);
> -		attr0_cfg = LLCC_TRP_ATTR0_CFGn(llcc_table[i].slice_id);
> -
> -		attr1_val = llcc_table[i].cache_mode;
> -		attr1_val |= llcc_table[i].probe_target_ways <<
> -				ATTR1_PROBE_TARGET_WAYS_SHIFT;
> -		attr1_val |= llcc_table[i].fixed_size <<
> -				ATTR1_FIXED_SIZE_SHIFT;
> -		attr1_val |= llcc_table[i].priority <<
> -				ATTR1_PRIORITY_SHIFT;
> -
> -		max_cap_cacheline = MAX_CAP_TO_BYTES(llcc_table[i].max_cap);
> -
> -		/* LLCC instances can vary for each target.
> -		 * The SW writes to broadcast register which gets propagated
> -		 * to each llcc instace (llcc0,.. llccN).
> -		 * Since the size of the memory is divided equally amongst the
> -		 * llcc instances, we need to configure the max cap accordingly.
> -		 */
> -		max_cap_cacheline = max_cap_cacheline / drv_data->num_banks;
> -		max_cap_cacheline >>= CACHE_LINE_SIZE_SHIFT;
> -		attr1_val |= max_cap_cacheline << ATTR1_MAX_CAP_SHIFT;
> -
> -		attr0_val = llcc_table[i].res_ways & ATTR0_RES_WAYS_MASK;
> -		attr0_val |= llcc_table[i].bonus_ways << ATTR0_BONUS_WAYS_SHIFT;
> -
> -		ret = regmap_write(drv_data->bcast_regmap, attr1_cfg,
> -					attr1_val);
> +		ret = _qcom_llcc_cfg_program(&llcc_table[i]);
>  		if (ret)
>  			return ret;
> -		ret = regmap_write(drv_data->bcast_regmap, attr0_cfg,
> -					attr0_val);
> -		if (ret)
> -			return ret;
> -		if (llcc_table[i].activate_on_init) {
> -			desc.slice_id = llcc_table[i].slice_id;
> -			ret = llcc_slice_activate(&desc);
> -		}
>  	}
> +
>  	return ret;
>  }
>  
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
