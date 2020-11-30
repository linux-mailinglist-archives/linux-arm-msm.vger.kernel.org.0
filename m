Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B31E2C8947
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 17:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728772AbgK3QUm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 11:20:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgK3QUm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 11:20:42 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B66DC061A04
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:19:53 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id l206so14698093oif.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=BODYfYTeDSugp1RxBgS7anYBagSna9CL1uemvUvDkss=;
        b=Z64+fGze7U4fK9y//5Jw+dCXti/GNHvXBUKcQ5kt7bBRn3l30mVR9h+HisK1syj/ag
         q8cUQVjzMmRi35Nx4lDFD2rBEsLt5wAr16JA9xwke+XjnKg+RpdJqf6zQcbxtrOMXOHL
         EIl9VtOIZTrgRty8fmpLST1u+bJwqYCUSmci5rIMaYnQKgraHvAeV99VESAS9E+VHjBN
         UlFahOSzmKSwQuTaLzozKP+cuouHrtNvK7tr0AcmxLQoVwrKrzbYNodrVJH1/5f0z1YV
         VrNzuK8U9A1GDdCamxsbu1k5ZaRcOJOtOGgUa6e3gwKQSW37geLZUEAyCOTaW1sDyg8N
         a8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=BODYfYTeDSugp1RxBgS7anYBagSna9CL1uemvUvDkss=;
        b=QFcj0S7OJcNaUHNHxoa+2MKnn60/u+/NnQwDyGbsgnAg4vqVAGF3qdvzeTiF/ZgaYp
         WTFMaxMsPm+FbeY5xAU993ZD3ZovKNKtKAxI80zFcDSAPmaWF2dLq17bkmAxHlqZ7BTk
         6sGb721nzklFsKbzwAxKQ9pAbfDQ0FLBEC5CjFLTlkjMv/eOW3CeOU/bci/cD5hMBGQu
         UV+eBUjrGj3GRNEpJUWl+geTJXf8HFfIfQb8HfEu/7otL7GtdSFpJECg+K9mLBGhz1+0
         wlpL/Nw02eTLQAoCrpNwGvyCgEDA0mxsDX9oT62Rh3dHUPUmXOZgQrVzN6sTpN5UppE9
         lYGw==
X-Gm-Message-State: AOAM530xC9GxXJQmf9NJGP/eqsdSKCH+3/OLJRJ3+dNW9hc+z9CHcilx
        ezXk11oUyiUeNRMxVEcOIxoleg==
X-Google-Smtp-Source: ABdhPJxbRslQGEjyt6Cd+u2rMfIzAuqSmYGsdkYghoA43A9HKWbbqhWgDXAW9Jxi8x9KxlLSfFqcdA==
X-Received: by 2002:aca:90c:: with SMTP id 12mr15118936oij.15.1606753192894;
        Mon, 30 Nov 2020 08:19:52 -0800 (PST)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id a4sm10047503oot.6.2020.11.30.08.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 08:19:52 -0800 (PST)
Subject: Re: [PATCH] Revert "i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630"
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Wolfram Sang <wsa@kernel.org>, Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20201124185743.401946-1-bjorn.andersson@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <f5aca410-f964-07d4-e18a-e438881e37cc@kali.org>
Date:   Mon, 30 Nov 2020 10:19:51 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201124185743.401946-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/24/20 12:57 PM, Bjorn Andersson wrote:
> A combination of recent bug fixes by Doug Anderson and the proper
> definition of iommu streams means that this hack is no longer needed.
> Let's clean up the code by reverting '127068abe85b ("i2c: qcom-geni:
> Disable DMA processing on the Lenovo Yoga C630")'.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index dce75b85253c..046d241183c5 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -353,13 +353,11 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  {
>  	dma_addr_t rx_dma;
>  	unsigned long time_left;
> -	void *dma_buf = NULL;
> +	void *dma_buf;
>  	struct geni_se *se = &gi2c->se;
>  	size_t len = msg->len;
>  
> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
> -		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> -
> +	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>  	if (dma_buf)
>  		geni_se_select_mode(se, GENI_SE_DMA);
>  	else
> @@ -394,13 +392,11 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  {
>  	dma_addr_t tx_dma;
>  	unsigned long time_left;
> -	void *dma_buf = NULL;
> +	void *dma_buf;
>  	struct geni_se *se = &gi2c->se;
>  	size_t len = msg->len;
>  
> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
> -		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> -
> +	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>  	if (dma_buf)
>  		geni_se_select_mode(se, GENI_SE_DMA);
>  	else

Tested-by: Steev Klimaszewski <steev@kali.org>


