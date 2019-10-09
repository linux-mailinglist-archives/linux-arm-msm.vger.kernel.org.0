Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3CAD16F8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 19:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732055AbfJIRjH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 13:39:07 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39292 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732028AbfJIRjH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 13:39:07 -0400
Received: by mail-pg1-f193.google.com with SMTP id e1so1863022pgj.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 10:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L8Js8kZvbgCYVI2QyS8R6uJL7k9QOYvlnFzB0XQV1NY=;
        b=zEITJ9ptdEbe4Kd+wErOiMycPRneU1csyzM46b9bx6yNxkCwajksugUpZsF1QhW/Yw
         hIFW3Dz9aarzqMKR2LDV36teMslOaIbSOirpGgE/Au8DOBxKTdSKPXia5LRWwbDJGm8s
         ApMZLA7DgPvis/xHs0yh2xp3vBR+wQVBIibqQCFMhG/E7qnuaeu31sVgusyCMd7VHKJq
         nenS7ghnwe60Xf020MQvivQ/HALLF3anqUTFM284sEOQXBD+3axfDZufXVVoOeNe/6sy
         NXYDhuTtTAPSm7FK7IcEdVoV6UuaON67zYECszcXu0A1Ac2y+cY9oBZ4EZexcBRD0mSL
         vOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L8Js8kZvbgCYVI2QyS8R6uJL7k9QOYvlnFzB0XQV1NY=;
        b=c78+xYKgRGQvEk2b3kgsW/JLgC+7u4CjxyfLs88xT7Oiv1h2xJzehvNd7w0vaQHDwk
         9Ma4NdmwxjFbhjhecaWUAkkuFMPZEQV66zWew02xInjABD2dB5GuLAdfIqv4iYMdUwu4
         cpIvW2FuL+dcT1WHsqod5oRO1cgkC7riNmIYEGVjF8bwpdjW0MRDIWjsAu+jf9hyDjxi
         w8wmeUfOdUhYcxxLOP2PngGp9ZnYyacd8DdQ/9mFGVlpRaf/l52lIcw4HYsG3MR7qidc
         w567kTkz5QV9AVqPUOXRdxwj6UpPTlACvBQOF+JOQG2oIVBXhx85I6wNfv+21vl020g4
         38xQ==
X-Gm-Message-State: APjAAAVGOCAnTXDVeN8vCGi3VNqy1T5mVcvR9ALXa3YcyEnmy7XhSY/C
        69QQonW+1PMMJXnFoHqp3L7X/w==
X-Google-Smtp-Source: APXvYqwn9tO6PZbW6jj/ziXR3QqtGNubxwFnDNi4apZb7SO1ZnVGM0cAabx+RI44Uox6cowfB2et6Q==
X-Received: by 2002:a63:5813:: with SMTP id m19mr5646017pgb.43.1570642745999;
        Wed, 09 Oct 2019 10:39:05 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s97sm2713599pjc.4.2019.10.09.10.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 10:39:04 -0700 (PDT)
Date:   Wed, 9 Oct 2019 10:39:02 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     agross@kernel.org, vivek.gautam@codeaurora.org,
        jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] soc: qcom: Fix llcc-qcom definitions to include
Message-ID: <20191009173902.GM6390@tuxbook-pro>
References: <20191008071614.21692-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008071614.21692-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 08 Oct 00:16 PDT 2019, YueHaibing wrote:

> commit 99356b03b431 ("soc: qcom: Make llcc-qcom a
> generic driver") move these out of llcc-qcom.h, make
> the building fails:
> 
> drivers/edac/qcom_edac.c:86:40: error: array type has incomplete element type struct llcc_edac_reg_data
>  static const struct llcc_edac_reg_data edac_reg_data[] = {
>                                         ^~~~~~~~~~~~~
> drivers/edac/qcom_edac.c:87:3: error: array index in non-array initializer
>   [LLCC_DRAM_CE] = {
>    ^~~~~~~~~~~~
> drivers/edac/qcom_edac.c:87:3: note: (near initialization for edac_reg_data)
> drivers/edac/qcom_edac.c:88:3: error: field name not in record or union initializer
>    .name = "DRAM Single-bit",
> ...
> drivers/edac/qcom_edac.c:169:51: warning: struct llcc_drv_data declared inside parameter
>  list will not be visible outside of this definition or declaration
>  qcom_llcc_clear_error_status(int err_type, struct llcc_drv_data *drv)
>                                                    ^~~~~~~~~~~~~
> 
> This patch move the needed definitions back to include.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 99356b03b431 ("soc: qcom: Make llcc-qcom a generic driver")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Sorry for missing this, thanks for the fix YueHaibing!

Regards,
Bjorn

> ---
>  drivers/soc/qcom/llcc-qcom.c       | 50 --------------------------------------
>  include/linux/soc/qcom/llcc-qcom.h | 50 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 98563ef..43606736 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -86,56 +86,6 @@ struct llcc_slice_config {
>  	bool activate_on_init;
>  };
>  
> -/**
> - * llcc_drv_data - Data associated with the llcc driver
> - * @regmap: regmap associated with the llcc device
> - * @bcast_regmap: regmap associated with llcc broadcast offset
> - * @cfg: pointer to the data structure for slice configuration
> - * @lock: mutex associated with each slice
> - * @cfg_size: size of the config data table
> - * @max_slices: max slices as read from device tree
> - * @num_banks: Number of llcc banks
> - * @bitmap: Bit map to track the active slice ids
> - * @offsets: Pointer to the bank offsets array
> - * @ecc_irq: interrupt for llcc cache error detection and reporting
> - */
> -struct llcc_drv_data {
> -	struct regmap *regmap;
> -	struct regmap *bcast_regmap;
> -	const struct llcc_slice_config *cfg;
> -	struct mutex lock;
> -	u32 cfg_size;
> -	u32 max_slices;
> -	u32 num_banks;
> -	unsigned long *bitmap;
> -	u32 *offsets;
> -	int ecc_irq;
> -};
> -
> -/**
> - * llcc_edac_reg_data - llcc edac registers data for each error type
> - * @name: Name of the error
> - * @synd_reg: Syndrome register address
> - * @count_status_reg: Status register address to read the error count
> - * @ways_status_reg: Status register address to read the error ways
> - * @reg_cnt: Number of registers
> - * @count_mask: Mask value to get the error count
> - * @ways_mask: Mask value to get the error ways
> - * @count_shift: Shift value to get the error count
> - * @ways_shift: Shift value to get the error ways
> - */
> -struct llcc_edac_reg_data {
> -	char *name;
> -	u64 synd_reg;
> -	u64 count_status_reg;
> -	u64 ways_status_reg;
> -	u32 reg_cnt;
> -	u32 count_mask;
> -	u32 ways_mask;
> -	u8  count_shift;
> -	u8  ways_shift;
> -};
> -
>  struct qcom_llcc_config {
>  	const struct llcc_slice_config *sct_data;
>  	int size;
> diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
> index c0acdb2..90b8646 100644
> --- a/include/linux/soc/qcom/llcc-qcom.h
> +++ b/include/linux/soc/qcom/llcc-qcom.h
> @@ -37,6 +37,56 @@ struct llcc_slice_desc {
>  	size_t slice_size;
>  };
>  
> +/**
> + * llcc_edac_reg_data - llcc edac registers data for each error type
> + * @name: Name of the error
> + * @synd_reg: Syndrome register address
> + * @count_status_reg: Status register address to read the error count
> + * @ways_status_reg: Status register address to read the error ways
> + * @reg_cnt: Number of registers
> + * @count_mask: Mask value to get the error count
> + * @ways_mask: Mask value to get the error ways
> + * @count_shift: Shift value to get the error count
> + * @ways_shift: Shift value to get the error ways
> + */
> +struct llcc_edac_reg_data {
> +	char *name;
> +	u64 synd_reg;
> +	u64 count_status_reg;
> +	u64 ways_status_reg;
> +	u32 reg_cnt;
> +	u32 count_mask;
> +	u32 ways_mask;
> +	u8  count_shift;
> +	u8  ways_shift;
> +};
> +
> +/**
> + * llcc_drv_data - Data associated with the llcc driver
> + * @regmap: regmap associated with the llcc device
> + * @bcast_regmap: regmap associated with llcc broadcast offset
> + * @cfg: pointer to the data structure for slice configuration
> + * @lock: mutex associated with each slice
> + * @cfg_size: size of the config data table
> + * @max_slices: max slices as read from device tree
> + * @num_banks: Number of llcc banks
> + * @bitmap: Bit map to track the active slice ids
> + * @offsets: Pointer to the bank offsets array
> + * @ecc_irq: interrupt for llcc cache error detection and reporting
> + */
> +struct llcc_drv_data {
> +	struct regmap *regmap;
> +	struct regmap *bcast_regmap;
> +	const struct llcc_slice_config *cfg;
> +	struct mutex lock;
> +	u32 cfg_size;
> +	u32 max_slices;
> +	u32 num_banks;
> +	unsigned long *bitmap;
> +	u32 *offsets;
> +	int ecc_irq;
> +};
> +
>  #if IS_ENABLED(CONFIG_QCOM_LLCC)
>  /**
>   * llcc_slice_getd - get llcc slice descriptor
> -- 
> 2.7.4
> 
> 
