Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6416A04D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 10:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233446AbjBWJcP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 04:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233751AbjBWJcM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 04:32:12 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10ADD3B85F
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 01:32:11 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id l25so9717894wrb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 01:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RGcZat4rJvZA4JvcNDS29r6hOcHFn5XfKWwq3XORVPs=;
        b=Yt49MEJ9NqvopLj/2ozmBGZWXWZP4QGefbvOIErAMUKNhgea+wVF0D/Jy5Azg2/9Zk
         ApR8dloCE57tigesDALBZ5JvU8wFsj0ksr5t2SsRABIVi6ikOoVO2DWbRD1JfFWTh/kW
         H7b82HrlGm5vFPEjd19iE2kergvhiDnvJ6EPzlFW4d7fQ2FrCmsFM/T8SbLSWa6KkiHR
         WXQzvOuUKglkxurFrTF1/e/lWj+DZ0EQwHGxFvuYLRrNyu73sxSKU/h7dDlJpCRZBD7E
         TKvvUSIeLuPOEl1KWrpFtQim91uU9IPqshCevpoPfHOJzysW70/GRimB5io9ts3+/BUG
         Dxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RGcZat4rJvZA4JvcNDS29r6hOcHFn5XfKWwq3XORVPs=;
        b=kLmsxQvYM/l8m1FFnyIw0kP6uGxQrPAS9E81WcSbc3QNdwoz6t7688sqb9LF9dD347
         +yBTc+pAfiS6WzDkLYRUYDJQOXZ117C9qaSR05tsfxAoDv6tkKfcOaxcSn8OBdVRb+n3
         WHrosktH2kVBtlSTK9uH4Q5s9urIT0FAhAz8dK/csli2OoJGwh0jAGjhlpbrj67HmdSq
         7RIHmSVK+8/uC63AVe2EmAkHGaTHz012Bmid211JQKAIb8mSv6V8A1ZomUemk7nfaIZD
         aq+rewXAak2BxykSKgLJ8bPOy+EIEqCO+Vv8fQyTvhsORrgf/pXrR9RJzzF7ETUBa7dB
         RbHg==
X-Gm-Message-State: AO0yUKUSpatD6s7hELkaTdkm+j+PAJWkYFpYNr/EwoJEb/4DynYNR3s3
        eG8JnLrOGDKx1RzXvrQrMUMu/Q==
X-Google-Smtp-Source: AK7set8JtmCSdtvo0Q/Dix4hkgM4WlaiSkXDAUcpvvkOj2MWIykMQbAOyl7oCrI5Oq9nTyXgJO4d4A==
X-Received: by 2002:adf:f7d1:0:b0:2c7:bd6:68fd with SMTP id a17-20020adff7d1000000b002c70bd668fdmr4252879wrq.47.1677144729470;
        Thu, 23 Feb 2023 01:32:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a16-20020adffb90000000b002c54c92e125sm8537550wrr.46.2023.02.23.01.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 01:32:04 -0800 (PST)
Message-ID: <3b54cd46-1c85-6a50-4902-7e59fb00a117@linaro.org>
Date:   Thu, 23 Feb 2023 10:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 06/10] dt-bindings: qcom-qce: document optional clocks
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
References: <20230222172240.3235972-1-vladimir.zapolskiy@linaro.org>
 <20230222172240.3235972-7-vladimir.zapolskiy@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230222172240.3235972-7-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/02/2023 18:22, Vladimir Zapolskiy wrote:
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

