Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E723626943
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 12:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234939AbiKLLnq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 06:43:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234942AbiKLLnm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 06:43:42 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DBDB1C6
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Nov 2022 03:43:40 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id l8so7237831ljh.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Nov 2022 03:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eD380Euz1OwWXwV/1GZN8saR9RgPwtKZ28UMySQa2Mk=;
        b=gZf9k1QJDk/THIFTwgZxD6eyimwV7m0KPGKZJmKycGgkZdOY2v9hu1Wr94hFktFywm
         xjCCEfADJbGH7CcyAEEO92DQl5wc9MKFEBofj0aF3K3hY2LIiI4dkgow2ws5Qy8aQERG
         d48Pu1UFXHhPjtbBgbLpF66VqBPYRV757f89GeP7nbOSTDvH+J8cc5oVcptTpnZH/tu/
         D2fE2eAmGzVaTMLwAJwUR9agMHYL1QduxnhEwkfnxaIlcgCqDnezCVh+k/UlurITzfme
         GEpJWJ6pQ2nvT5LNQx74I1rGbJF6iJcOWo4rM28VwoJupDLYp4rNnab9Wt5Jq/8jc69i
         FPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eD380Euz1OwWXwV/1GZN8saR9RgPwtKZ28UMySQa2Mk=;
        b=AUsTrBrPykm0Odnd/poHj36YWp3XSphScmCvgmhMqlze2kWpfQFGubR6jYZHLpksg/
         2pE1qMndJzWWHcK+9YAFlkkesgZ4/9OUzJfwhcA0kYPfs3BaEF8nvWDjwOPIJx0qo++q
         BBMHhZtg9Yy+zAeKqUjWl2NEIjD65K/YkDR7ivZvpJ3eEglf/vk4nmuIgps4GC0fGnxj
         LCC1nCDLLyZX8lt9eyRNA9JdadqtPzkZBGYZ58Ll5k7QCDTpW+qlxUUGJvVgvQSs51C8
         a1NzUDAuMThkrRcXRE52LL8l7SBPdItIwUnk3CSdrcI30HRcILnl9VCcHTHzSFTFIhaY
         rOvg==
X-Gm-Message-State: ANoB5pn6GLbhNUPy/Sp89TQ24nwDUJz82IFnVNYBV2pmOeE4rJqkiRF4
        1QuXzn245Uf8J88LISb05QuR9Q==
X-Google-Smtp-Source: AA0mqf7c0VjEh5RXmezmzILU3Lrn76idN3LFYmk0/+FNKQeyP5Lm2ylYYVVsZ/r2NR1e3qaPAL4qaA==
X-Received: by 2002:a2e:a553:0:b0:26f:c2c8:682d with SMTP id e19-20020a2ea553000000b0026fc2c8682dmr1719037ljn.16.1668253419137;
        Sat, 12 Nov 2022 03:43:39 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 10-20020ac25f0a000000b004a287c50c13sm834743lfq.185.2022.11.12.03.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Nov 2022 03:43:38 -0800 (PST)
Message-ID: <14f01c33-dada-b66a-f81a-74b9028de18b@linaro.org>
Date:   Sat, 12 Nov 2022 14:43:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 03/14] phy: qcom-qmp-combo: drop v4 reference-clock source
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111092457.10546-1-johan+linaro@kernel.org>
 <20221111092457.10546-4-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111092457.10546-4-johan+linaro@kernel.org>
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

On 11/11/2022 12:24, Johan Hovold wrote:
> The source clock for the reference clock should not be described by the
> devicetree and instead this relationship should be modelled in the clock
> driver.

Do we have a fix for the gcc driver?

> 
> Drop the management of the source clock from the driver for SC8180X and
> SC8280XP. Note that support for the former is not yet in mainline.
> 
> Also note that the binding has never been updated to describe the v4
> clocks for SC8180X.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 51a03ac05c91..e6c7cf723b19 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -947,7 +947,7 @@ static const char * const qmp_v3_phy_clk_l[] = {
>   };
>   
>   static const char * const qmp_v4_phy_clk_l[] = {
> -	"aux", "ref_clk_src", "ref", "com_aux",
> +	"aux", "ref", "com_aux",
>   };
>   
>   /* the primary usb3 phy on sm8250 doesn't have a ref clock */

-- 
With best wishes
Dmitry

