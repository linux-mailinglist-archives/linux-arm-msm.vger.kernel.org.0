Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 604C85F9A63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Oct 2022 09:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbiJJHs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Oct 2022 03:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbiJJHr7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Oct 2022 03:47:59 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 356B14F65D
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 00:45:10 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id j7so15737078wrr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 00:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kiOsL5cICcDRzWTGbQ0RBDU5GIe3E8Ke/5ZDrHfFOEo=;
        b=e0epfFCzwAzD7RkP89KgT8E566eSJvXnKGAWPhy6vQaRCSrlFcUDCFTBKnKwgWInog
         wOnZbRQwOaQGIGq47tD1Wnl7QiSG0+cJgEV9vI+2UNwyc2NxVptQu0i9T0mWN8jcnrTm
         uPA3ROhBNPFMWhvNBa5teXbbMdky4T5PftaBj8BfFuor9MzN0snuxdkXZfuFMEYDEeHc
         eSs/eh+zAdBrn2SCep2XiySBSUZ8FZeHtJsoydGy4Rynu/WG5PGKQ8qmn29WHV7BnnZp
         RZGNr8mIrhuBzIE0aBi2tNrEQQ+CGYdrMPwY/BpjGidtgpzBgexgt9Xvc1qpZlXEq96G
         OoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiOsL5cICcDRzWTGbQ0RBDU5GIe3E8Ke/5ZDrHfFOEo=;
        b=xwUMn0cxfXgrZOpecOWnFqmpOsAqYy3pNU32af2GEjv7ESNUk667zoxYBpwv6QOqrz
         MqhjVdwSlZJccgqEux9GEoouR5jHZwDXK4Sut40cJdK1uYCMz9uzfhhjYyavcExCs4bO
         vKipFoAaFC+gvfgX4lIxdE5M0Km1vI3mHUC/Tb03aSE1evfMttGMQnFW+2ibEeHJKCAa
         a6FNLxk3aK6WuVjTGi01CV/v65TrWQYB1pgIJ7SB3RUyh2atgOyIXyMpnDVmw1fOGoel
         mDqwYiP+PeeAUHgz7Ens5NSu9v5wIlhjedVy4ZY/WXI+Na9FLjVo0X3gLtm1bA+zQ0Q0
         Rjsg==
X-Gm-Message-State: ACrzQf14J5H9xQrayLrD75srhEePgEuUTDi8hswig0jaVEcUuzCVcnub
        1twA3gcsD2FY5y7iR5Po+JJ2IYwqXyUEAXXK
X-Google-Smtp-Source: AMsMyM6iXMsVhCIb4A5KG4utEI03o8KNAqHGfnuF6WCXQAOHdyaX3APXfdLpqicME3hEWRpNpBAfWA==
X-Received: by 2002:a5d:4c4f:0:b0:22e:6c5b:a4b0 with SMTP id n15-20020a5d4c4f000000b0022e6c5ba4b0mr10905320wrt.574.1665387906354;
        Mon, 10 Oct 2022 00:45:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1d81:c6ce:69e8:c0? ([2a01:e0a:982:cbb0:1d81:c6ce:69e8:c0])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bce16000000b003bd44dc524csm9464778wmc.34.2022.10.10.00.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 00:45:05 -0700 (PDT)
Message-ID: <4f00f098-439e-71ad-ea45-3960a9d3bacd@linaro.org>
Date:   Mon, 10 Oct 2022 09:45:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/6] arm: dts: qcom: mdm9615: wp8548-mangoh-green: fix
 sx150xq node names and probe-reset property
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>, Lee Jones <lee@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20221005-mdm9615-pinctrl-yaml-v1-0-0cbc006e2a30@linaro.org>
 <20221005-mdm9615-pinctrl-yaml-v1-3-0cbc006e2a30@linaro.org>
 <450d2490-2640-6a4a-946f-e401ba68d52c@somainline.org>
Content-Language: en-US
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <450d2490-2640-6a4a-946f-e401ba68d52c@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/10/2022 21:38, Konrad Dybcio wrote:
> 
> 
> On 6.10.2022 11:58, Neil Armstrong wrote:
>> Fix the sx150xq node names to pinctrl and use the right probe-reset property.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> Could you please also fix up the property order (may be in a separate patchset ofc)?

Yup, sure

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Konrad

Thanks
Neil

<snip>
