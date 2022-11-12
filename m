Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7E6D62674E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 07:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbiKLGLH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 01:11:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbiKLGLG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 01:11:06 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500982250A
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:11:01 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id g7so11276944lfv.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xgEFrQxF5erS41BXftmnuJVC4f2mIZC62wulZ8QcVq4=;
        b=unfxgYsI+Wp7KKEqj45kLKcOIMODrgTPzgRv5i2bTfxwLtr7a0DLFbTQXnQPBqNL06
         6NTuCi4tbd0qt3IGLJVR6rUNW0G/v+4iISGtfcv104x+PBoqeyzlwVB33K2+Mszhbs81
         90LvzuxvW8A5CNUiCw0ddj2Q7C4SFFovCnZGg4TefYPPQ0Rx84E/I5diXMwcUmhBdAg7
         XMVG5DA3VzLSTwK3Vi3zYWBu7kvKDoo0ovYAoylyBvGzPbg72hdR2QyY1phKwUT9bc1p
         LqLV0lhjrpeLTDbk3oBB7R8qJuHH9PLWlLAYkMx36OVpQWlYbEL7yc6e3M/TJbT1NTyb
         z1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xgEFrQxF5erS41BXftmnuJVC4f2mIZC62wulZ8QcVq4=;
        b=XJHYT2p0snIYQHAS8ysU7sRvUwHr3NJKMIIhNk8rEhwNZc2Rbwa6mwZ4WlnXUK+Dg+
         lwyLOQFTXj8ajizPTan9txJbEVDUHyUEVhecTUcyIPBTuYEyANqngm0txoeKjYgBQDv7
         xZ7U0SwleZ69rDVPEheaysPYbyp46IcE76BooTbjWBU0B+GTOdAcJ4EmC/EoO+B1Nvbp
         1Hme3DQjtsBjZagm17dM/DkIJx9rNqYznCRLr2EJHr3yLRlM2GD/6alMeTVI+T+AIoco
         QBIzkhk5FIpkZsFsG18naItj2tHH30m7eYuZZ7NGnWj9OhFrTLuIONlpUaOzLT5zouSm
         tG8w==
X-Gm-Message-State: ANoB5pkW0FQV6uee7N8u491YtAWvvIOIUyf7jOOjwqcw+W7SHYZR7KgV
        2U088Bk46lMJ2QlgsmtFgYvnNQ==
X-Google-Smtp-Source: AA0mqf727C/tU8votlwq4Rgzh0ltalzyYBYUm03eCr9mgdImpS0cM3o+T9813EWmFtHd7QrWxGF3Eg==
X-Received: by 2002:a19:dc15:0:b0:4b1:18a2:2fbd with SMTP id t21-20020a19dc15000000b004b118a22fbdmr1598550lfg.564.1668233459632;
        Fri, 11 Nov 2022 22:10:59 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m7-20020a056512358700b004a2c3fd32edsm706433lfr.144.2022.11.11.22.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 22:10:59 -0800 (PST)
Message-ID: <77fe7684-5ac7-a538-80a3-2654e2365a3b@linaro.org>
Date:   Sat, 12 Nov 2022 09:10:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/6] phy: qcom-qmp-combo: fix out-of-bounds clock access
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20221111084255.8963-1-johan+linaro@kernel.org>
 <20221111084255.8963-2-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111084255.8963-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 11:42, Johan Hovold wrote:
> The SM8250 only uses three clocks but the DP configuration erroneously
> described four clocks.
> 
> In case the DP part of the PHY is initialised before the USB part, this
> would lead to uninitialised memory beyond the bulk-clocks array to be
> treated as a clock pointer as the clocks are requested based on the USB
> configuration.

... because the num_clks comes from the struct qmp_phy_cfg, not from the 
struct qcom_qmp.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")
> Cc: stable@vger.kernel.org	# 5.13
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 5e11b6a1d189..bb38b18258ca 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -1270,8 +1270,8 @@ static const struct qmp_phy_cfg sm8250_dpphy_cfg = {
>   	.swing_hbr3_hbr2	= &qmp_dp_v3_voltage_swing_hbr3_hbr2,
>   	.pre_emphasis_hbr3_hbr2 = &qmp_dp_v3_pre_emphasis_hbr3_hbr2,
>   
> -	.clk_list		= qmp_v4_phy_clk_l,
> -	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
> +	.clk_list		= qmp_v4_sm8250_usbphy_clk_l,
> +	.num_clks		= ARRAY_SIZE(qmp_v4_sm8250_usbphy_clk_l),
>   	.reset_list		= msm8996_usb3phy_reset_l,
>   	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
>   	.vreg_list		= qmp_phy_vreg_l,

-- 
With best wishes
Dmitry

