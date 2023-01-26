Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6373367CC07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 14:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235663AbjAZN0u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 08:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236841AbjAZN0r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 08:26:47 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D156C127
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:26:35 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id z194so561781iof.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POggbfxIyFyxMH7Y5wi17sdH+/hl5SC3Atf6Cp5oUl0=;
        b=hwowS1kWAT07DrFeTfuJU3jPJABcy4QWVzMXeyV8iaDKQeF3qJEHqctr3nZ61n08+0
         1BHSLfRdDz3FzaXY92IRAFzG20s8fmF3/QGCYdCgZGdq52BZUR2DD8YSX4SqQ0NGnvZ0
         09HfYHXFRA9KxPFwuOsXdjegVVQgzR78NxG5Yr8rglFbXvUFnme4ocwgLsqQ4MonFKsR
         l/xRI63IfMjBP60dTdlhldc41/vwca55DatwzNUujJT6Qxu7rSK1MtaXrixIrGY1tPCa
         G34zigJa/i1YR/PbooCx2pG0ATPoblpvc9N39yrjIr69JKFji2Dq07aIapLAlcs7qlhh
         Jaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=POggbfxIyFyxMH7Y5wi17sdH+/hl5SC3Atf6Cp5oUl0=;
        b=CTdYGuYtf4gUJtWdDIpWSfapz2hyP3Lti5RJtgX1tDa6wTBDxaeiXH7av+h2XwwJjx
         hkASGMkTEPUAfNNKOlDZi0a19XC+1ZQ24YfKZ8f/sTJZcKWBz4F7/r+W6BjtWaZtSaKZ
         APwH2jWHD+9eKUReYkPSnHEqiu0bzq0VPyUw3W2hVHTaI12P6/iqrm1lLX2IBlAIxsUS
         8ZuIsA5EZhllgU47byn5K7PwRdM6P/DtDXs0HTe7rYI/x5Ty18B4/FxbcwlM648rJMjQ
         vvHe+RO6LoiQEDWMU8f2pO3pSoUzZh7beZ1N7CpTV+/0fgpBJx570nHKFkbArveCjTLF
         KD5w==
X-Gm-Message-State: AFqh2koOC4E8Ti5UBBKuMHPueZ4J0KKhUOGo5aJgpY60Jt87gPgtgBEt
        MNWsTfWi61c+O9Le712CzeF7KQ==
X-Google-Smtp-Source: AMrXdXvRCV2b2JLg0y+vQLuuHq0MDOb7CPdjRiqLBXHf8Q/jTx/bVZ4KtwxWFHL1gZnBLtLtETtlBA==
X-Received: by 2002:a6b:5d11:0:b0:6df:de92:91ab with SMTP id r17-20020a6b5d11000000b006dfde9291abmr27721014iob.10.1674739594289;
        Thu, 26 Jan 2023 05:26:34 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id r4-20020a5edb44000000b006e3170eeee4sm315989iop.6.2023.01.26.05.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 05:26:33 -0800 (PST)
Message-ID: <b1891679-9a0d-2327-4e6a-e3dd262ca233@linaro.org>
Date:   Thu, 26 Jan 2023 07:26:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] bus: mhi: ep: Fix off by one in mhi_ep_process_cmd_ring()
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <Y9JH5sudiZWvbODv@kili>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <Y9JH5sudiZWvbODv@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/26/23 3:29 AM, Dan Carpenter wrote:
> The > comparison should be changed to >= to prevent an out of bounds
> access into the mhi_cntrl->mhi_chan[] array.  The mhi_cntrl->mhi_chan[]
> array is allocated in mhi_ep_chan_init() and has mhi_cntrl->max_chan
> elements.

You're right.  I scanned through that file and there
are other spots that don't check that the channel ID
is in range, though I think this is the one where it's
reading it from an external source.  I.e., the other
places are aleady known to be correct.  (Maybe Mani
can comment.)

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Fixes: 2527ad44ddb2 ("bus: mhi: ep: Check if the channel is supported by the controller")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>   drivers/bus/mhi/ep/main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index bcaaba97ef63..be2d56e7f392 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -125,7 +125,7 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
>   	ch_id = MHI_TRE_GET_CMD_CHID(el);
>   
>   	/* Check if the channel is supported by the controller */
> -	if ((ch_id > mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
> +	if ((ch_id >= mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
>   		dev_err(dev, "Channel (%u) not supported!\n", ch_id);
>   		return -ENODEV;
>   	}

