Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE52D6C1D65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 18:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233405AbjCTRLV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 13:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232122AbjCTRLA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 13:11:00 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A19EF37B4C
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 10:06:50 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id j2so11070062wrh.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 10:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679331952;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xW5Ocn8+5vHuJfNM9+tN+8Zsnupq2u+BkYV9wTXAw4Y=;
        b=NyGvT0378NuDjZ9dHCYUvYGPUtTCef8K8siMI7SPfTIRaEmuBlW8kyVdzuo+N7TnmM
         OM4W7IkbMOwUY0fdKdpfn+ezcX+YEOUEK55KD35x1YGF/xqc7yifGtH0PrZeWkPKDmrx
         7nv06IyFOBF9PaclQGCPXoCu+gkLGE0+aeQA1wxQLVoRdqK9RpZqEP1Q7hRPFOGOmLGs
         aYVobW043r8nO4sKiq67xgHpKfkO+1DJHZIH/UaqMiud8XIOZLY0X0+tH/zDIfyQtOca
         fztN2cJuVPiMK9VzeJOqgfCVcg1oHATyMYfHwHQoymqgbwVSgwYuIz+6FnAzkm2UqhE0
         K9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679331952;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xW5Ocn8+5vHuJfNM9+tN+8Zsnupq2u+BkYV9wTXAw4Y=;
        b=BVzDq9UIdh7P8iJMZRxOBwX9IZqRzK6xSqC/3tJKTfXBjjDkK7l9Hqp/C847MM/JFI
         iPVQrW/UPOXYei4lUysEhOULZGdX8EpoUSTpk0Vl2maZzU/dpAm10trO5IXGd9ECigC9
         4zG6WUa0dCaXwaM/S5F5TvdIRlFUX2z5vw8aDLbaVDxNuIanQcrYii8yFQRWR1L2Zm2o
         7FgHwxvG5mVNdG0hHRXr8ncJ9h4ATSLksO+l1b6azlEVmbTzYw36hG6KFAaFreMVMZOP
         JrBM6zs5qVVdYBPBs75wFaWdVAABvVUO4ff5S6Xq9E2YJxz5eqQrPrr1sEe7UEDfkvFK
         bnzQ==
X-Gm-Message-State: AO0yUKXbrTbQFAR5t8X9B3thG51JVOEsaEuPmG0I5eJnMaLtrpdsmkFA
        aRn1cWBggrPED1K5umZmJ23JOQ==
X-Google-Smtp-Source: AK7set8Nv2T8kL+fvPeCqSg+RfYzuTdyylCYV5CDr7EFK/Iiy/36EHskF4J9tyV6pgSi2iiH0QVolA==
X-Received: by 2002:adf:e28f:0:b0:2ce:a8d5:4a89 with SMTP id v15-20020adfe28f000000b002cea8d54a89mr48706wri.37.1679331952411;
        Mon, 20 Mar 2023 10:05:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4f6f:868d:9c7b:5ab1? ([2a01:e0a:982:cbb0:4f6f:868d:9c7b:5ab1])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d510d000000b002c794495f6fsm6338143wrt.117.2023.03.20.10.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 10:05:52 -0700 (PDT)
Message-ID: <12606dcf-feba-c5b8-abda-b2657e3b9ace@linaro.org>
Date:   Mon, 20 Mar 2023 18:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: defconfig: Enable QCOM eUSB2 SNPS PHY and repeater
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230320151707.1842171-1-abel.vesa@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230320151707.1842171-1-abel.vesa@linaro.org>
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

On 20/03/2023 16:17, Abel Vesa wrote:
> In order to have USB 2.0 working on Qualcomm SM8550, both the eUSB2 PHY
> and the eUSB2 repeater need to be built as modules.
> So select them accordingly.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5029ff92eb68..87824cc1604a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1308,9 +1308,11 @@ CONFIG_PHY_HISI_INNO_USB2=y
>   CONFIG_PHY_MVEBU_CP110_COMPHY=y
>   CONFIG_PHY_MTK_TPHY=y
>   CONFIG_PHY_QCOM_EDP=m
> +CONFIG_PHY_QCOM_EUSB2_REPEATER=m
>   CONFIG_PHY_QCOM_PCIE2=m
>   CONFIG_PHY_QCOM_QMP=m
>   CONFIG_PHY_QCOM_QUSB2=m
> +CONFIG_PHY_QCOM_SNPS_EUSB2=m
>   CONFIG_PHY_QCOM_USB_HS=m
>   CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
>   CONFIG_PHY_QCOM_USB_HS_28NM=m

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
