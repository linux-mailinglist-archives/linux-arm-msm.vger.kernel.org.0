Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8604E734ED7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 10:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjFSI47 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 04:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbjFSI4k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 04:56:40 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB5A1BE3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 01:55:42 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f90a7325f6so18202245e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 01:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687164940; x=1689756940;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ab/uccW/SU2clnL7XMqPxhlr/0i0qnP9OFatwF2duQQ=;
        b=nqsqLIrl8CSWESdnM/quQtpg3UjEW8V+yoGzWVrPNz/PiWRb+MroGyVsGbF10zdEUU
         58FSXMD99ATdJ8ateeOoXxrIfi9cvveOu1lIEhh18V2RaUZzOFBQw15CrQFwOWdL93ba
         rGMLKFB21ikTmbIl0F8mzpPNwzD2eQrT+uxFl+1RomQf8WYCyID+BJfk8VdBnBW411K6
         9+xeaSMJBoiRtogYKsb5tvJvJBzcOPIxytSmg3P9wNv+m/gROVKyhM6B3TRaJrOLOl3w
         6tRX7feD6viUGat+fXwfiBivQ5k6ztGj8RXzEzL/Q64HdR8eXPkS1NfYNSOGDqt4EvLn
         FPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687164940; x=1689756940;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ab/uccW/SU2clnL7XMqPxhlr/0i0qnP9OFatwF2duQQ=;
        b=HUTDKtC49ybO9nWyxCC9g1CKHX14np/wpECwtnXfjee6WsH7F9mit89MIGlGyPqZwJ
         5m7arYNpQGKhjFAi4X44SesEoLn3An06S2NMO3qHGNkXFr3oPK9TLuLfcbuJxse5AbC0
         DmNzyHA5/mCK5UewMCsnsYtYv0ahq0WG6r809Pkf7VXpLpTB1whf521W0LoIep7AYXmf
         beD67xldSCmbFv6GhU7+iznSJjeGCMUdcypEvA1JBXPvIVTm3IeLHcVLaiYrPHphMuCO
         DY7+hg2Os9ipoE2lWnoV4904Du5x7K/HM30V0TqTiweCagOMVAoK/vJaa4E5VLOVGZVN
         QTlQ==
X-Gm-Message-State: AC+VfDxUPP3KX7192Yte/V6b7Wd/ycxoUwcovd/fExoybnVMftV+9ArN
        EsNdss3+0Jvl/NPpYsmFTGWqDw==
X-Google-Smtp-Source: ACHHUZ6DYorP55IGV9cW6MrOSU6CDDy/X55ds2R2gJokv4SvLCDIJJcM5yGsxke8P//Hh8XInPL09g==
X-Received: by 2002:a1c:e90d:0:b0:3f8:f663:921d with SMTP id q13-20020a1ce90d000000b003f8f663921dmr9124407wmc.41.1687164940235;
        Mon, 19 Jun 2023 01:55:40 -0700 (PDT)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id q19-20020a1cf313000000b003f7361ca753sm9873228wmq.24.2023.06.19.01.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 01:55:39 -0700 (PDT)
Message-ID: <613aa197-62c7-5a4d-2495-b77d9fc902d8@linaro.org>
Date:   Mon, 19 Jun 2023 10:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/3] pinctrl: qcom: sm8350-lpass-lpi: add SM8350 LPASS
 TLMM
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230616185742.2250452-1-krzysztof.kozlowski@linaro.org>
 <20230616185742.2250452-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230616185742.2250452-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 16/06/2023 20:57, Krzysztof Kozlowski wrote:
> Add driver for pin controller in Low Power Audio SubSystem (LPASS).  The
> driver is similar to SM8450 LPASS pin controller, with difference in one
> new pin (gpio14).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/pinctrl/qcom/Kconfig                  |  10 ++
>   drivers/pinctrl/qcom/Makefile                 |   1 +
>   .../pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c   | 167 ++++++++++++++++++
>   3 files changed, 178 insertions(+)
>   create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index 634c75336983..9c43bc05c447 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -77,6 +77,16 @@ config PINCTRL_SM8250_LPASS_LPI
>   	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>   	  (Low Power Island) found on the Qualcomm Technologies Inc SM8250 platform.
>   
> +config PINCTRL_SM3550_LPASS_LPI

s/PINCTRL_SM3550_LPASS_LPI/PINCTRL_SM8350_LPASS_LPI/g



<snip>

