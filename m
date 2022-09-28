Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9CD5EE4D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 21:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbiI1TLR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 15:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233380AbiI1TLO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 15:11:14 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 154E377E9B
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 12:11:13 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id q17so15368175lji.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 12:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/gZf36AfrA3hWD/0cvl58ifdsuky8QGAhYN3zOeCaIo=;
        b=faHhIgC9G9GY47c9RFQEDUiqcP/c+1d82TnEsyyAkNe5jX9D+/0H8GnIHR1gVnNA4g
         y10VJ0dfhTpOjl5GJVG5YGNLyWVhSkvLNhaDfy7oSmMH4SqMGho0Bynr9naJpviXydwC
         BagBkj6Q5/PK4Vt4BBEXPdjrjLrJ/fJGs5r3QAMjs3Ka8GdR8F5Tbev7mKHvSobXewpg
         lLyeVHJ1upWV/WQH3waU8jot0MvFviPHZzxbrIw722gRU9cdyR1y5iFtp3eM1eF4/UJc
         tx+pG+YjWeNJ7ZJJMc1srLTbehQXLvTP4SM/h7mqWigx4DqgRq4q24mGj46oR0No6ENE
         s3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/gZf36AfrA3hWD/0cvl58ifdsuky8QGAhYN3zOeCaIo=;
        b=cIojYmL4Kb2vuOtDNT53PKjzAnlp/Ewf8Z0gMh2fwVUnjFBWRd5gMrtGQ0z2feyKc6
         Z5Mb3oqlwPjGXSk049T7EJIZXfa8xCyX6WIm6X7d4687ip4jt2Y2Y+rZh9TnXdfJdprw
         T9+Agix267h8YKJfS0CRrNUDJJhRMvl+ZgLZaeJvwM4b+3y3tS1Wp/fYGkBRZCjZ/A7A
         B5gpJqNhTYKvJ6Ikkxsv3N5UWWQ0UCTxDf9lY0/8qZwsxLTMubj4l33q1eVz9da/umQw
         MOxxoGoJFnBQYD5dUwj0u44edwCR5ZEONupCQz2J99i5chmEfygqKJxUmF1IjybupGrc
         r8FQ==
X-Gm-Message-State: ACrzQf0XguRIM59h3GLI5xr8QD7dJXefGvercKEPCHMi3KuzO9NwQmqB
        iAf4UjsHZaomhd2XG5sk65LbWw==
X-Google-Smtp-Source: AMsMyM4hpI1q8lH1cn6x1gtWTCHIX/Bo1GOEPemGLdA43LovkM3rJ9HHWH/WhDDtIlyo2rvcBA6Etg==
X-Received: by 2002:a2e:983:0:b0:26c:5b0e:f5e4 with SMTP id 125-20020a2e0983000000b0026c5b0ef5e4mr12162453ljj.502.1664392271455;
        Wed, 28 Sep 2022 12:11:11 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z24-20020a2e9b98000000b0026a92616cd2sm519306lji.35.2022.09.28.12.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 12:11:11 -0700 (PDT)
Message-ID: <f7c29d82-2972-6e42-8a74-ae93227331ae@linaro.org>
Date:   Wed, 28 Sep 2022 22:11:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 05/13] phy: qcom-qmp-pcie: unify sdm845 registers
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220928152822.30687-1-johan+linaro@kernel.org>
 <20220928152822.30687-6-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220928152822.30687-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 18:28, Johan Hovold wrote:
> The SDM845 register array is identical to pciephy_regs_layout so drop
> the former.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Same comment as for the patch 04/13.

> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 7b3f7e42edd5..4146545fdf5f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -92,12 +92,6 @@ static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
>   	[QPHY_PCS_STATUS]		= 0x174,
>   };
>   
> -static const unsigned int sdm845_qmp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
> -	[QPHY_SW_RESET]			= 0x00,
> -	[QPHY_START_CTRL]		= 0x08,
> -	[QPHY_PCS_STATUS]		= 0x174,
> -};
> -
>   static const unsigned int sdm845_qhp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
>   	[QPHY_SW_RESET]			= 0x00,
>   	[QPHY_START_CTRL]		= 0x08,
> @@ -1545,7 +1539,7 @@ static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
>   	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
>   	.vreg_list		= qmp_phy_vreg_l,
>   	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> -	.regs			= sdm845_qmp_pciephy_regs_layout,
> +	.regs			= pciephy_regs_layout,
>   
>   	.start_ctrl		= PCS_START | SERDES_START,
>   	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,

-- 
With best wishes
Dmitry

