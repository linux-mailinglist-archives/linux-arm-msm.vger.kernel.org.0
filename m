Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2CBC783FC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 13:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234487AbjHVLlm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 07:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232437AbjHVLll (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 07:41:41 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A1110C4
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 04:41:17 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bf1f632b8so586647566b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 04:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692704418; x=1693309218;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O/NIHQP9t9FWAMyIX2X2xC1QDnFwKfnIeXzDlJpOVxc=;
        b=CTiCQaLAyedYYRVDn5qUKrUa9vQKy0gCoLJWvfWX85FhoUe5F7mH5Hx9MkoaMZMzX+
         AS+n9ZTwvH1nZKsc3cFAX5ehtzD/gX0Xbfxh+3aaKe2pGLEHD5CLLAIQ1V24R/LgkHwg
         Zqlude+auUEbExGAo17GMBqkFMyxoUGXQ/EdSUv+I/uyIYYmghpCgFWqvoOaOXATWufi
         FyCtcRgRtY4naVWtnTw4mnWceDi5Wn3tVUSDDi9T0ts6mlvR1AFqZ3AO/+kkgZRc0JgL
         p2kL0G1i5I2048IxnQiOyG9gEwxure+4aMl1c5ibyU3wNmcEZ8BMnVPZe5vNIuip26Kb
         Vmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692704418; x=1693309218;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/NIHQP9t9FWAMyIX2X2xC1QDnFwKfnIeXzDlJpOVxc=;
        b=TFr5WhNlxDZ0EqMxCrB+ek57erjfP254Wnd9DPMcOR5YwAhWYVqdEddiA0AUXFuUW/
         WJXBVqaWKqOgI5qPrf+WTK7BjGzeNjEsPb08n9C1nSvQPVNTiEMPqhbyBYgtEigGFppG
         LIoJUC0mY7CfFcjZziwMdMolzmg+HPdmkUdXhJCLKu83NEzA3+dUA6ywvJc9QXncVM7n
         1dycwm0UP796nk2vyEMl04EYglhH+guOOBwpPv3u4MVqPWzPALPmUKGex/9ZMX7de4XW
         OenrzGRq9O3CZ/bF9WvLsTt7tksizM1OGjXpabzlQeYTjNawC55NwoNg7rjVaHMa3zYU
         8KPA==
X-Gm-Message-State: AOJu0YwQIsqj/hECWn8nzstnDgUQGrhyfJsL/fdxwHJ48Rm06fQxYUhZ
        UIjXeREfsLb3yFDfWVTr8zE2wQFFEmxvm7NprYw=
X-Google-Smtp-Source: AGHT+IF4BkC3dItCe8+LWY7rH+IOmTjUHBRnT8M+Yenfj6xxQDBw3yl0SAR1SoFVSjpnVIKOk0hH4g==
X-Received: by 2002:a05:6512:1584:b0:4fb:94c6:fd63 with SMTP id bp4-20020a056512158400b004fb94c6fd63mr8155443lfb.17.1692703987423;
        Tue, 22 Aug 2023 04:33:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id t11-20020ac24c0b000000b004ffa28ef3a4sm1202792lfq.100.2023.08.22.04.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 04:33:06 -0700 (PDT)
Message-ID: <a9aee232-7bf2-4f4d-b42a-1f7ec1434393@linaro.org>
Date:   Tue, 22 Aug 2023 14:33:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] phy: qcom: m31: Fix indentation issues
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
        geert+renesas@glider.be, nfraprado@collabora.com, rafal@milecki.pl,
        peng.fan@nxp.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <cover.1692699472.git.quic_varada@quicinc.com>
 <6d1638daf9b0616816fdecb529df86a394db7942.1692699472.git.quic_varada@quicinc.com>
 <CAA8EJpryKOzGd42NjG470D9jGr1Huv5D-F-NqaTo-0EJeFUr+A@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAA8EJpryKOzGd42NjG470D9jGr1Huv5D-F-NqaTo-0EJeFUr+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/08/2023 13:55, Dmitry Baryshkov wrote:
> On Tue, 22 Aug 2023 at 13:31, Varadarajan Narayanan
> <quic_varada@quicinc.com> wrote:
>>
>> * Fix indentation
>> * Drop simple success messages
>>
>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>> ---
>> v9:
>>          Fix line break alignment
>>          Remove register success print
>>          v8 version of the driver has been picked up for merge.
>>          (https://lore.kernel.org/linux-arm-msm/169226613917.81413.1200008047604336868.b4-ty@kernel.org/)
>> v8:
>>          Change commit subject and message per review comments
>>          Don't include of_platform.h
>>          Change struct init coding style
>>          GENMASK -> BIT for one define
>> v6:
>>          Kconfig:Add COMPILE_TEST and remove USB_GADGET from 'depends'
>>                  Change 'selects' USB_PHY -> GENERIC_PHY
>>          Driver: Use correct headers
>>                  const int -> unsigned int for 'nregs' in private data
>>                  Use generic names for clk, phy in m31 phy structure
>>                  Init register details directly instead of using macro
>>                  Use dev_err_probe in the error paths of driver probe
>> v5:
>>          Kconfig and Makefile:- place snippet according to sorted order
>>          Use generic phy instead of usb-phy
>>          Use ARRAY_SIZE for reg init instead of blank last entry
>>          Fix copyright year
>>
>> v4:
>>          Remove unused enum
>>          Error handling for devm_clk_get
>> v1:
>>          Combine driver, makefile and kconfig into 1 patch
>>          Remove 'qscratch' region and its usage. The controller driver takes care
>>          of those settings
>>          Use compatible/data to handle ipq5332 init
>>          Drop the default case
>>          Get resources by index instead of name as there is only one resource
>>          Add clock
>>          Fix review comments in the driver
>> ---
>>   drivers/phy/qualcomm/phy-qcom-m31.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
>> index ed08072..ea79c18 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-m31.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-m31.c
>> @@ -242,7 +242,7 @@ static int m31usb_phy_probe(struct platform_device *pdev)
>>          qphy->clk = devm_clk_get(dev, NULL);
>>          if (IS_ERR(qphy->clk))
>>                  return dev_err_probe(dev, PTR_ERR(qphy->clk),
>> -                                               "failed to get clk\n");
>> +                                    "failed to get clk\n");
> 
> But why are you trying to fix this? aligning next line to the opening
> bracket is perfectly fine (and is one of the endorsed styles).

Ugh, excuse me. My mailer displayed alignment in a wrong way.

This LGTM except the last chunk (removal of the info message).

> 
>>
>>          data = of_device_get_match_data(dev);
>>          qphy->regs              = data->regs;
>> @@ -252,18 +252,16 @@ static int m31usb_phy_probe(struct platform_device *pdev)
>>          qphy->phy = devm_phy_create(dev, NULL, &m31usb_phy_gen_ops);
>>          if (IS_ERR(qphy->phy))
>>                  return dev_err_probe(dev, PTR_ERR(qphy->phy),
>> -                                               "failed to create phy\n");
>> +                                    "failed to create phy\n");
>>
>>          qphy->vreg = devm_regulator_get(dev, "vdda-phy");
>>          if (IS_ERR(qphy->vreg))
>>                  return dev_err_probe(dev, PTR_ERR(qphy->phy),
>> -                                               "failed to get vreg\n");
>> +                                    "failed to get vreg\n");
>>
>>          phy_set_drvdata(qphy->phy, qphy);
>>
>>          phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> -       if (!IS_ERR(phy_provider))
>> -               dev_info(dev, "Registered M31 USB phy\n");
> 
> This is irrelevant to the indentation.
> 
>>
>>          return PTR_ERR_OR_ZERO(phy_provider);
>>   }
>> --
>> 2.7.4
>>
> 
> 

-- 
With best wishes
Dmitry

