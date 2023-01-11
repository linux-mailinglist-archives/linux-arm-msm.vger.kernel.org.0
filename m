Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3527A6663D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 20:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233714AbjAKTiY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 14:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjAKTiX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 14:38:23 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA39261D
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:38:22 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id k8so1613782wrc.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FkqVAtwaXUJN30F43tmdYS4wEBs5LlIZ9Pxk9TLASQg=;
        b=Cqp3qAECJSQESfGWSDUzE5d0q4Z9xsQhmzgJMVZpboVMTxBIxHNHSTXx4z/FlE2Q3M
         TD2UjVccZB+izCXogHPwLmSWh5jQJgEUKmor0rChjBa8Ns5MriQjfEa4Y45Mi0YMJilr
         7fLN6hs4dTVpuwWZLNF8fxI5IRR4w9FcgHck33/6oYwpY7iGAHZ0q/J9CVzU0nM4clf6
         mpXa0MRg7L+1gBBt8xpozm7O7ISxU27c64iUH3qVukrRW4koqUvypFt72MjyvL0RMiDc
         jM1DX9p0aR5G8QAQYKZ1a0Mii5NBs9KD0JcWiJyrcBhB7hLN+paeP8QE+75gnAtMjcQX
         Id8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkqVAtwaXUJN30F43tmdYS4wEBs5LlIZ9Pxk9TLASQg=;
        b=qilbyxcfRrLzO8KK6L/4Hm20oMYNDnwg1xxyydu9JA//OEsMWl27EHjcTwAkq9lpil
         8C+GA7cm8qF7gg6WlrWaiC3DnA08JDr9Gc3pxxuCSLQr8HozphbT6n2JObAk9UjW33gI
         HwEv1B4qQ9HVoNLVjFRmehpaw2uO/zkQOtmWwoVgWiWeXt3iDaJm2QyiGLfq9UqMMtJk
         Jeq7t0RkJ7wJZZldSVJuM+j5cxIRK+D+/lC5jCfgGedxDyBabz7B44Xsxp75M/gN/b3Q
         /x4LZeWJrBx8TzCu9rHbNpL0eZgzY+OU8rJENP0gqtVC0OdcH0gu2cPuFqvxojefpyHh
         QI7g==
X-Gm-Message-State: AFqh2kr6N1U1ialqFwev85blMEZda0ixH/J++pk3k7h8J3X3+jQ/2LwJ
        kIO06JjKSYc1C2cC4CqAet+BjQ==
X-Google-Smtp-Source: AMrXdXtgMD6jjEFg5JmHUP5HY2qI9Z1cnmbhuONxWekwQeR+8SoZiuAPwPXC42vtiLnaec1s6kMQXQ==
X-Received: by 2002:a5d:4884:0:b0:242:3812:f948 with SMTP id g4-20020a5d4884000000b002423812f948mr45904286wrq.24.1673465900805;
        Wed, 11 Jan 2023 11:38:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f574:f2aa:e30a:bb87? ([2a01:e0a:982:cbb0:f574:f2aa:e30a:bb87])
        by smtp.gmail.com with ESMTPSA id t13-20020adfe10d000000b002b6bcc0b64dsm1962785wrz.4.2023.01.11.11.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 11:38:20 -0800 (PST)
Message-ID: <1d065d98-9b14-d8af-d77d-f309ae0b51a4@linaro.org>
Date:   Wed, 11 Jan 2023 20:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] arm64: defconfig: enable SM8550 DISPCC clock driver
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230110-topic-sm8550-upstream-display-defconfig-v1-0-9941c8083f10@linaro.org>
 <20230110-topic-sm8550-upstream-display-defconfig-v1-1-9941c8083f10@linaro.org>
 <20230111192815.tyavlhr4nwyblpj7@builder.lan>
Content-Language: fr
From:   Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230111192815.tyavlhr4nwyblpj7@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Le 11/01/2023 à 20:28, Bjorn Andersson a écrit :
> On Tue, Jan 10, 2023 at 08:34:33PM +0100, Neil Armstrong wrote:
>> Build the Qualcomm SM8550 Display Clock Controller driver
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 851e8f9be06d..004c379eced7 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1107,6 +1107,7 @@ CONFIG_SDM_GPUCC_845=y
>>   CONFIG_SDM_VIDEOCC_845=y
>>   CONFIG_SDM_DISPCC_845=y
>>   CONFIG_SM_DISPCC_8250=y
>> +CONFIG_SM_DISPCC_8550=y
> 
> Now that power-domains will probe defer properly, could we make this =m?

Sure, will change for v2.

Thanks,
Neil

> 
> Regards,
> Bjorn
> 
>>   CONFIG_SM_GCC_6115=y
>>   CONFIG_SM_GCC_8350=y
>>   CONFIG_SM_GCC_8450=y
>>
>> -- 
>> 2.34.1

