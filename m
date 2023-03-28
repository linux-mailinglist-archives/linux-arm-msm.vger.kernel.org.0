Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1084D6CC01C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 15:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbjC1NE4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 09:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjC1NEz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 09:04:55 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959B91B8
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 06:04:21 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g17so15740666lfv.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680008660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=09TeZpLfmxfGQ+J3cG2yuYFPbBRZyc4bSWOhtmFg9Do=;
        b=JMqRG+fZGDQOnk7lKA/P2mssM54tzU3KpCnLMUSpdxMVDT+sDOpjb7aIujcPQa6DUh
         yxDFNIbGovmGuyLRc4sd2wZyxmR9GBxIJlIIuq5relFg9QEPe4Fp4qdWQD6bg+FYY6w8
         vqLsETM23BNWL9esoZA7BI5ZoHRWZR+KED5mwvbh1Vxfaxk5ebEkLbz8jOFZ20ViGfAj
         UoZ28/mcyQgacps0DAJYYtpbH3ZIpabtBuG04ryMs5xCtyVmw7iKx2H0D3+BtW8PQ3Ni
         8a3s+fPTmlYpvq3G0Xx8O78MXnK2MoD1FudFwpRBMsVnZ+IdCENH7FN4cJoy60h7PQ/P
         u/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680008660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09TeZpLfmxfGQ+J3cG2yuYFPbBRZyc4bSWOhtmFg9Do=;
        b=A7Yf8C4bTzUpMknk7XNcQl4VInwhd9fj36eXP29XT2wTblUv6697zRPa686ulScX40
         4VHulTLZH3nONygeZdqOi3/G4K2NsrtDcZMSOD1RTLw5ecC1MhDrVvJgxcJLUcG4c+YF
         hgx4uU53dowBrjU83uQpVFtnK8ocAYEZQjDlHi2pDbYli7CZIkwe8M/MgV49k99joL7f
         YX/WLdj4FHbmWpjiYj4ctKz/0/nJlFucbn63COgaCcLEcMFL6R4hcnB3ec+MawgAG01J
         r0Qt/fbtQePrp0PK/Gb4Stb7ZBH728zOLerEt+9ZMByxFqtxHvnne2QMMzzsQmS+D6rB
         iKgQ==
X-Gm-Message-State: AAQBX9cgNy3cE6P3JH4kWo4sFyZIGmrK16tyVU1Xuz+LS5Ezz+rtt8vu
        WywYkZlxsfImUsZWo8+rtcER7w==
X-Google-Smtp-Source: AKy350YlgfaJnVVyA/LPJ7/Zh0SjVeD/nycZLGwo6ON0q+8f/pPzuZEapsl+R37eWV7VPBYzCWwdFw==
X-Received: by 2002:ac2:5fc2:0:b0:4e8:4106:ea93 with SMTP id q2-20020ac25fc2000000b004e84106ea93mr4236528lfg.69.1680008659834;
        Tue, 28 Mar 2023 06:04:19 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x22-20020a19f616000000b0048a982ad0a8sm5053599lfe.23.2023.03.28.06.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 06:04:19 -0700 (PDT)
Message-ID: <85d0a8c6-f6b4-4cd4-7cc6-b13f37523bd4@linaro.org>
Date:   Tue, 28 Mar 2023 16:04:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/msm/dsi: simplify pixel clk rate handling
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230118130031.2345941-1-dmitry.baryshkov@linaro.org>
 <8ebd01e3-00be-b0da-e91a-ab1a4e074074@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8ebd01e3-00be-b0da-e91a-ab1a4e074074@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/01/2023 02:07, Abhinav Kumar wrote:
> 
> 
> On 1/18/2023 5:00 AM, Dmitry Baryshkov wrote:
>> Move a call to dsi_calc_pclk() out of calc_clk_rate directly towards
>> msm_dsi_host_get_phy_clk_req(). It is called for both 6g and v2 hosts.
>>
>> Also, while we are at it, replace another dsi_get_pclk_rate() invocation
>> with using the stored value at msm_host->pixel_clk_rate.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi.h      |  4 ++--
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  2 +-
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 24 ++++++++++++------------
>>   3 files changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
>> b/drivers/gpu/drm/msm/dsi/dsi.h
>> index bd3763a5d723..93ec54478eb6 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>> @@ -129,8 +129,8 @@ int dsi_dma_base_get_6g(struct msm_dsi_host 
>> *msm_host, uint64_t *iova);
>>   int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *iova);
>>   int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
>>   int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
>> -int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool 
>> is_bonded_dsi);
>> -int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool 
>> is_bonded_dsi);
>> +int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host);
>> +int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host);
>>   void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct 
>> mipi_dsi_host *host);
>>   void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
>>   struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct 
>> mipi_dsi_host *host);
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h 
>> b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> index 44be4a88aa83..5106e66846c3 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> @@ -51,7 +51,7 @@ struct msm_dsi_host_cfg_ops {
>>       void* (*tx_buf_get)(struct msm_dsi_host *msm_host);
>>       void (*tx_buf_put)(struct msm_dsi_host *msm_host);
>>       int (*dma_base_get)(struct msm_dsi_host *msm_host, uint64_t *iova);
>> -    int (*calc_clk_rate)(struct msm_dsi_host *msm_host, bool 
>> is_bonded_dsi);
>> +    int (*calc_clk_rate)(struct msm_dsi_host *msm_host);
>>   };
>>   struct msm_dsi_cfg_handler {
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 18fa30e1e858..7d99a108bff6 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -616,28 +616,21 @@ static void dsi_calc_pclk(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>   }
>> -int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool 
>> is_bonded_dsi)
>> +int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host)
>>   {
>> -    if (!msm_host->mode) {
>> -        pr_err("%s: mode not set\n", __func__);
>> -        return -EINVAL;
>> -    }
>> -
>> -    dsi_calc_pclk(msm_host, is_bonded_dsi);
>>       msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
>> +
>>       return 0;
>>   }
>> -int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool 
>> is_bonded_dsi)
>> +int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host)
>>   {
>>       u32 bpp = dsi_get_bpp(msm_host->format);
>>       u64 pclk_bpp;
>>       unsigned int esc_mhz, esc_div;
>>       unsigned long byte_mhz;
>> -    dsi_calc_pclk(msm_host, is_bonded_dsi);
>> -
>> -    pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) 
>> * bpp;
>> +    pclk_bpp = msm_host->pixel_clk_rate * bpp;
>>       do_div(pclk_bpp, 8);
>>       msm_host->src_clk_rate = pclk_bpp;
>> @@ -2292,7 +2285,14 @@ void msm_dsi_host_get_phy_clk_req(struct 
>> mipi_dsi_host *host,
>>       const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>>       int ret;
>> -    ret = cfg_hnd->ops->calc_clk_rate(msm_host, is_bonded_dsi);
>> +    if (!msm_host->mode) {
>> +        pr_err("%s: mode not set\n", __func__);
>> +        return;
>> +    }
>> +
>> +    dsi_calc_pclk(msm_host, is_bonded_dsi);
>> +
>> +    ret = cfg_hnd->ops->calc_clk_rate(msm_host);
> 
> I am not too sure what we are gaining by this.
> 
> Its not that we are replacing dsi_get_pclk_rate().
> 
> We are moving the dsi_get_pclk_rate() from the calc_clk_rate() to the 
> msm_dsi_host_get_phy_clk_req().
> 
> Also, with this change, dsi_calc_clk_rate_6g() looks kind of empty to 
> stand on its own.
> 
> The original intention of the calc_clk_rate() op seems to be calculate 
> and store all the clocks (byte, pixel and esc).
> 
> Why change that behavior by breaking it up?

Unification between platforms. Both v2 and 6g platforms call 
dsi_calc_pclk(). Let's just move it to a common code path.

> 
>>       if (ret) {
>>           pr_err("%s: unable to calc clk rate, %d\n", __func__, ret);
>>           return;

-- 
With best wishes
Dmitry

