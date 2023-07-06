Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF7374A04C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 17:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbjGFPCt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 11:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbjGFPCs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 11:02:48 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C594F1725
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 08:02:45 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso1186359e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 08:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688655764; x=1691247764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ShCZPS3QZP1WxvM+laqbA1ektriqvwCEsnAV0D6tNnQ=;
        b=CEUbBORUQE1GtxOv6tF7xdgOvVuagv6tfUfPINwGS3SnADxxyXVzzCxK0rHsZdWzFW
         rh7XPCUutTF+ZimsnEqCIRU9n5YXs0Hru20XPkMzwEAQZfy5G0iTxnACgbDNxhTUHusk
         PxHSZLaV8Axb0aUvGiq61/DTpPn5MjWQuJdHIzQ94f0YjCi3rvnPsKurrEWVRx1xpvjx
         wyL4O2wfXNFkoI6Dmi7tWKvJRBWFDnCyvzyPXDy4u+9Mf1tmQ3TmEiFjeRuwSnJduAhQ
         2RPzCoX118mWzPV27uQnBXB9oShgJdugzMiOonvr22mW2pKDXL/iKnJLWSsdKiTHeQW+
         yoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688655764; x=1691247764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ShCZPS3QZP1WxvM+laqbA1ektriqvwCEsnAV0D6tNnQ=;
        b=ExgIE10967iWxBuFID1JpIY32pzk8HsxHLUqCinH0bWcScGijdyhGCDrA9zxJtR8S5
         tkPXzAhe3DAGoDcOcs8SymB6PN20UfWAKWD/akhDq7sU+jBVQVnWBCmj0LFMh4DYRN+9
         ybHU8mT3HyzafexgmpTeLZpkqIkFgUl59/ryBEZ8iA0z1a6CJR9KpFRbCz1VByeXUdHn
         ksIX2S2WshDOP+odJXIjI5aeLLnUn/rUMGH5GHhchkHKSYdqdYzACCj4GPVBvfbz+d+S
         UDhU/J8eIuB/UCgZmX1sKEBQ+8oP7mgvPL1Ym3MoWZovyLvRbBmlNX94Jeq3LuVewJZ5
         r5gg==
X-Gm-Message-State: ABy/qLacpwgAH2RpeKB3VqhLefns4JSlDcWaTcxqFa9ptCraC5SDf5l5
        t/JHlgrhVi2tXyh4+oDirIr+Xw==
X-Google-Smtp-Source: APBJJlF/7j+jxrI3O3E3kRdV543QE7A/trE8YDtzL8IPP5Y6+Ph6eudlb2HGwssr/ftyzXQRt2DNBQ==
X-Received: by 2002:ac2:58ce:0:b0:4fa:9817:c1da with SMTP id u14-20020ac258ce000000b004fa9817c1damr1630903lfo.21.1688655764004;
        Thu, 06 Jul 2023 08:02:44 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id m12-20020ac2428c000000b004fb7584b7absm298983lfh.5.2023.07.06.08.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 08:02:43 -0700 (PDT)
Message-ID: <42126323-7414-11f8-7580-391edd0b3b5b@linaro.org>
Date:   Thu, 6 Jul 2023 17:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/4] Add support for pinctrl in pmic chips.
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <1688650209-25119-1-git-send-email-quic_rohiagar@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1688650209-25119-1-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6.07.2023 15:30, Rohit Agarwal wrote:
> Hi,
The subject should definitely specify which PMIC chips (or what platform)
the changes are for, otherwise it's overly generic, so for example:

Add pinctrl support for SDX75 PMICs


It's not a big issue, but it helps when one needs to search through email
history for a specific thread.

Konrad
> 
> This series adds GPIO support for PM7550ba and PMX75 pmic.
> 
> Thanks,
> Rohit.
> 
> Rohit Agarwal (4):
>   dt-bindings: pinctrl: qcom-pmic-gpio: Add pm7550ba support
>   dt-bindings: pinctrl: qcom-pmic-gpio: Add pmx75 support
>   pinctrl: qcom-pmic-gpio: Add support for pm7550ba
>   pinctrl: qcom-pmic-gpio: Add support for pmx75
> 
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 6 ++++++
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                      | 2 ++
>  2 files changed, 8 insertions(+)
> 
