Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF22D69A79D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 09:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjBQI65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 03:58:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjBQI65 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 03:58:57 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6584E604FC
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 00:58:55 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id eg30so1431049edb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 00:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qs4gU72VHUNMPaZOm7nEODtbU0mJ0OdcIK2lIN68xlo=;
        b=EunzvhkEUXQIZuBifghYhfX2/i2ffpXe+kAn9O9nV/EWtNPVhBw2kOBMqnRoiLGDjw
         gxRp6z+zSIbe3JTaqvKqv/uflQneZuaXmXzMUdgfnF9EFm+j+3XKpU5OtE831H3Clnvi
         uiYlcUYttBToyPQStxktVeVHo5lxzqJv5JzAFJ/FAmPB/E7gZdW0ENpeVDgo2bwkUroH
         K+ukFLX/d5L0CAOAm7iOt9kc4uJg2dy/P/gsH1xcIXQkAW+2a8CbOLX1sP7hY2O71GtZ
         /WRh9x+vBFKVplBnqdjWSOulIrEUiMtcms09vQMJrsq5m8866IEgZfezxR4T3CpDE/dW
         9XMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qs4gU72VHUNMPaZOm7nEODtbU0mJ0OdcIK2lIN68xlo=;
        b=gd51UCFsf5waqOx6mpyYJQtrZRkbAJvuXsWuS/fBtzQlGDfiwQe/OKQU/dAZdMVtTx
         dKOy43Xa1FrWuPZfxb9qUvvm4+UGvlqeJEl8/B4umSTFhrxZKjWmNulrtwkT+Y2uXfRz
         27XSJzQriX1zxuoyiZe0+MaRccmPgZLBrTXOk9nfuFwIpTsMQ5W8ROKK16i8GjCevk/a
         EwfFygdigjugfyYeV+vVjKUF7DUXVK1ZbpAlfVDzBQQek5q/1q1Tiyg/yqVzwVTkzYw3
         TJ1BJDUHE25YbS9+FVlcGMKSmzFbSDGBgOiywBaIvypZM5ZmAeBVu7vyNp+RVsrnuTCZ
         GJbQ==
X-Gm-Message-State: AO0yUKUqofVMukQBoUMIva6txLHdrp30aiiS2J1RvkZoKCC1Un6hn/sm
        ok2mrPE6gAjo+9Hzuz+4Fm596w==
X-Google-Smtp-Source: AK7set8D5qS/zMbMErNjB8zzWJHf8Tn+NYft2qeWuFWehFZgyXd9JIBBN8/HkaD53f6LphX148o2/g==
X-Received: by 2002:a17:907:76ad:b0:8b1:749f:b2c0 with SMTP id jw13-20020a17090776ad00b008b1749fb2c0mr3716140ejc.74.1676624333946;
        Fri, 17 Feb 2023 00:58:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t1-20020a17090616c100b008b13a1abadasm1852257ejd.75.2023.02.17.00.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 00:58:53 -0800 (PST)
Message-ID: <60d012ee-d511-81b7-dff3-7f01d947bdf7@linaro.org>
Date:   Fri, 17 Feb 2023 09:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 06/10] dt-bindings: qcom-qce: document optional clocks
 and clock-names properties
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230216131430.3107308-1-vladimir.zapolskiy@linaro.org>
 <20230216131430.3107308-7-vladimir.zapolskiy@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230216131430.3107308-7-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/02/2023 14:14, Vladimir Zapolskiy wrote:
> On newer Qualcomm SoCs the crypto engine clocks are enabled by default
> by security firmware. To drop clocks and clock-names from the list of
> required properties use 'qcom,sm8150-qce' compatible name.
> 
> The change is based on Neil Armstrong's observation and an original change.
> 
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

