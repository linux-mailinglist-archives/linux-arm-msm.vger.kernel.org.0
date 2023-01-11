Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 183266657FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 10:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbjAKJsV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 04:48:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbjAKJrm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 04:47:42 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32DCAC77B
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 01:46:42 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so13915886wms.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 01:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DqMKfZ4HdDIBNj9OjnuIifVi3RC3QORFKptzKvWxKcE=;
        b=mA7rds7/glwxiTj8qYO8Fzpzilrrybarn91meiO2MalEclrv+PDm/8c5se7Tk96C+U
         7xINCprb15wVTxmr/W9NOBqCTyZLMGPtRXWyCKhc+BPh/n16fd2x0lSxpGDt6wiRgT2Z
         eQE9J2rlcp9gNNocDrE1clvTfdzr2nRHyOTWN7uOzTx9Y14JwMs3gvi48Gkk4ZyIe1r2
         DhaJKH9Va3crOuPykyxoMb7DSWwgowtLIErRIyz0RHbTm59kZ5ZV5Gc4ZKkFbjcgY3yu
         BUZ+lBFW9sYKwYMLKzGX8+WrIPcPhG4akMrj0A3UZrTWthFuMkHu3FVxPMn4yDaTjh7W
         Ghww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqMKfZ4HdDIBNj9OjnuIifVi3RC3QORFKptzKvWxKcE=;
        b=U9XhqB9tA2Zl1/ELrOh3GvevSx/2Y/FDgr9WBVbzUgHO6TtDAEEBlXh7s2QnPFBl1G
         XK1xFcXerLhNmbhoGB+d25hg3DNyusvEBE6cPWRDNhBC6NqGUdw2Bv3tcN6n3GutAP0V
         5BkXU89CaCv9/STqj6kzPGGBjntHCPhusev6K5BhXHqsNBIdxeDL12V65YGT1UJgNLLB
         B1LJm4BUEsAnjrIEbuLolTd1yWDMbeOijxv/I2zEkuZGRx+FB7PQCPmvyp2M3Lj6Gn6S
         QaAry7kX8HoaLiWf2PNhkGPg4p9ZDIiKkX7OBZLZpquvQ4MRIbU3K91agQMF7XZfJHPS
         q+Nw==
X-Gm-Message-State: AFqh2kpUZCPJgrMBhQX7xH6P4+wo27D9O291GO0UhxpWzqRz92U9e9sI
        B38Pg+f6Xc7HhzOthuLodTZrEXVM2U8SZLQt
X-Google-Smtp-Source: AMrXdXvGv7gNzilmGdxnCRA232nJngNZyR71k77CNlklw82CTtFZmiGA3tUrl9b++lc9NMdNw7xqvg==
X-Received: by 2002:a05:600c:34cd:b0:3d5:1175:92c3 with SMTP id d13-20020a05600c34cd00b003d5117592c3mr51173404wmq.23.1673430400740;
        Wed, 11 Jan 2023 01:46:40 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q18-20020adfdfd2000000b002bdc129c8f6sm1703241wrn.43.2023.01.11.01.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:46:40 -0800 (PST)
Message-ID: <788ddb2a-7c29-cc10-fce2-ca348cd81b65@linaro.org>
Date:   Wed, 11 Jan 2023 10:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/7] pinctrl: qcom: Add IPQ9574 pinctrl driver
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230110121316.24892-1-quic_devipriy@quicinc.com>
 <20230110121316.24892-5-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110121316.24892-5-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/01/2023 13:13, devi priya wrote:
> Add pinctrl definitions for the TLMM of IPQ9574
> 
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---
>  drivers/pinctrl/qcom/Kconfig           |   10 +
>  drivers/pinctrl/qcom/Makefile          |    1 +
>  drivers/pinctrl/qcom/pinctrl-ipq9574.c | 1003 ++++++++++++++++++++++++
>  3 files changed, 1014 insertions(+)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq9574.c
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index 1378ddca084f..a9b4b07e3de0 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -70,6 +70,16 @@ config PINCTRL_IPQ6018
>  	  Qualcomm Technologies Inc. IPQ6018 platform. Select this for
>  	  IPQ6018.
>  
> +config PINCTRL_IPQ9574
> +	tristate "Qualcomm Technologies, Inc. IPQ9574 pin controller driver"
> +	depends on GPIOLIB && OF

Look at other entries and use similar style.

Best regards,
Krzysztof

