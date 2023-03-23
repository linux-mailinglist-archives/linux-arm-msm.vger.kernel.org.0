Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44B4D6C6BA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 15:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbjCWO4D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 10:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbjCWO4C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 10:56:02 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B28233DF
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 07:55:58 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id h17so20823336wrt.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 07:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679583357;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LzETtzKjA52BY2tOEq8n5Gv6UHBx5mZPe+HOURETy24=;
        b=zWEG69va3z5HzrKEOVtpCjgx0IdZJo57qMHX16YrTHYKjewVw7XOGEA1fc8obEKLvm
         nQxOgc6TI00ARtrgHL6gL0pjeS8S5ZpkJ6j1d5zqKcuq0wBwwzlJtiO/P56TGio7BWyq
         onTXZn7146mLFA8AnGs0Ccz1Z6tb2/0KqrNJEz35tQWxMMo1wwCOvJ+23ec7rKDd48px
         1is+uPYgjGiZl/m5U7ziA9WqOLKyb4WcGjsa8xizW149omZuwcwtUqVfIwnCzbUtUk0d
         tXTIfzY1uTvIHtiuq+mRMAUrFjmI8/Ktdc51/DKEbGd4EKrQmp7+y3f2/+ug9F6b0QUL
         HeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583357;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzETtzKjA52BY2tOEq8n5Gv6UHBx5mZPe+HOURETy24=;
        b=Xbpp+DPiFJ556qUbw/zLAC8TVEzfOq+rDNoiSz0NUG/VyQDFI6gNLZ9MJ4ZzhVeIcc
         bVN7pZQwp1+SCM9WEx6W0JP2SmAf1Gx66YlQ60iNAtl5JeqdEJbRZpAZXYJnGyVKm0Fs
         UYerp5ouwcZIq2TrnTxm3JEEqTjJEK4kEpVVRUUFgK62W/llZwCv2DNLKXwu6nxryaUA
         4SQD7y/zhv1Y4DtAP49e1t89+cX2m2TaJEfNwIx75Q/L1gslIp8c/+4ugRSNnRgnsjJg
         p8+hGQRKRypEKBvYgMLKbFQaZwjMgXF5jLIfVDV/Q8y3dQtpsqySQ7JX35xgf0QMx8CL
         yNtQ==
X-Gm-Message-State: AAQBX9dTuTVZpoHjPBCLdphjGnNH+ubGrlGv69c15m9TkVfRq8XFadEO
        EN0DP9jrmK0M4p4FPERQbulLdg==
X-Google-Smtp-Source: AKy350bJjoABAFMUAHsHK1YuOg+sTamfi8WpjmjWgK95DEEO2x0H0mddICAJdWc1GC+TFFByguAn7A==
X-Received: by 2002:adf:f30b:0:b0:2d0:58f9:a6a with SMTP id i11-20020adff30b000000b002d058f90a6amr2624019wro.57.1679583356943;
        Thu, 23 Mar 2023 07:55:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899? ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
        by smtp.gmail.com with ESMTPSA id u4-20020a5d4344000000b002c5526234d2sm16542284wrr.8.2023.03.23.07.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 07:55:56 -0700 (PDT)
Message-ID: <f02c6ac0-4c6e-a0e8-8f32-06f45eb2ffe2@linaro.org>
Date:   Thu, 23 Mar 2023 15:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] phy: qcom-qmp-combo: use qmp_combo_offsets_v3 instead
 of _v6
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230323144726.1614344-1-dmitry.baryshkov@linaro.org>
 <20230323144726.1614344-2-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230323144726.1614344-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/03/2023 15:47, Dmitry Baryshkov wrote:
> The qmp_combo_offsets_v3 table is already used for v3 and v4 PHYs. Reuse
> it for v6 too, dropping the separate qmp_combo_offsets_v6.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 18 +-----------------
>   1 file changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 3b488d12c933..6850e04c329b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -1417,22 +1417,6 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
>   	.dp_dp_phy	= 0x2200,
>   };
>   
> -static const struct qmp_combo_offsets qmp_combo_offsets_v6 = {
> -	.com		= 0x0000,
> -	.txa		= 0x1200,
> -	.rxa		= 0x1400,
> -	.txb		= 0x1600,
> -	.rxb		= 0x1800,
> -	.usb3_serdes	= 0x1000,
> -	.usb3_pcs_misc	= 0x1a00,
> -	.usb3_pcs	= 0x1c00,
> -	.usb3_pcs_usb	= 0x1f00,
> -	.dp_serdes	= 0x2000,
> -	.dp_txa		= 0x2200,
> -	.dp_txb		= 0x2600,
> -	.dp_dp_phy	= 0x2a00,
> -};
> -
>   static const struct qmp_phy_cfg sc7180_usb3dpphy_cfg = {
>   	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
>   	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
> @@ -1759,7 +1743,7 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
>   };
>   
>   static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
> -	.offsets		= &qmp_combo_offsets_v6,
> +	.offsets		= &qmp_combo_offsets_v3,
>   
>   	.serdes_tbl		= sm8550_usb3_serdes_tbl,
>   	.serdes_tbl_num		= ARRAY_SIZE(sm8550_usb3_serdes_tbl),

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
