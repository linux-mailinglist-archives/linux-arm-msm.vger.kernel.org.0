Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5370F4F5D72
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 14:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232608AbiDFMRR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 08:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbiDFMQu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 08:16:50 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F0F1BB817
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 00:57:12 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id l26so2583178ejx.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 00:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Lgaeg90DwLQ6gMU7dGLk1ZzcdKthnoLHKe6InPXfXDk=;
        b=EVLVsFt+v9FiQndBvyg6btu/++XBLApugoc8dkKYRaoGG6R3yk7NexVbif8WbPTuIN
         mpbt0K/6Z4g81Ws7E1gIFYEctVO5vdr6TEGxjCroTYFJMCBxg6b0HzUmLm9wSuBWDhgS
         gWcWyH/fPz6iSQz5B6altfILVNyEDi/En6xh+P+mUr5K0NuHinyw4pmbxwET+QMVSb9r
         SgOlVhcVEqFYqeLgdQQEupwtuwKqaadanXJ9eJQKINxm5IUl9EN3nBRP16CpQLiRWKN2
         AIz4NAWkORy4f4st2l2jqfJ7SfhW+B5SpcXEp1I+6TYFHhYMBlZt6qPGpgtcTCbb0L3R
         lNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Lgaeg90DwLQ6gMU7dGLk1ZzcdKthnoLHKe6InPXfXDk=;
        b=DDuPrMSmgmC69eYtSI1NucL0NIojJfyx1fi4+1yrgceh2Du7Hv5Y5lQx4HHTKo986U
         WhLgRr0CfzIP9LH78uwpE2wm6gERa5zXFeDdb4u5l1MlJYHLGGh/cqQgrDII18AlaKlR
         /1OyatIXpyFhA/OZS3JRVaH+kam4xikvAmUxWsl6VVOm+mgmFaUO1ZpjA6t3FfF23nmm
         I5T7uRx/+AsewgLk7EjiS2xO1/MKWBZ1sVbeMFce/pq84TBb0uBAiKgKu71t9+vrHPmc
         ddCDpMiqaAQ8MlavljytQRysdqmr/C2bb1JpYmJ7ks/drAp1gvpASgXpPJLzPqYJ8GCD
         fEDA==
X-Gm-Message-State: AOAM532GNjoGFFqzWQf3Oeagf2lgYnWHiS2542zKo8QCudovnhDPZL5k
        18ribWdiD49ofXKLnFFb0xxohQ==
X-Google-Smtp-Source: ABdhPJzM2GS1m5w5uaCYdoAnIQr9z7V3X28rV0NWIIOY9kmC1Y/tvBxPOOnL2Nr7WJp0uMqxAyzxTw==
X-Received: by 2002:a17:907:3e8b:b0:6df:f199:6aa3 with SMTP id hs11-20020a1709073e8b00b006dff1996aa3mr6930973ejc.410.1649231831042;
        Wed, 06 Apr 2022 00:57:11 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id a18-20020a1709063e9200b006e0527baa77sm6300035ejj.92.2022.04.06.00.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 00:57:10 -0700 (PDT)
Message-ID: <337d2994-e250-ecb3-4d44-a2f242fd6456@linaro.org>
Date:   Wed, 6 Apr 2022 09:57:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/4] dt-bindings: thermal: qcom-tsens.yaml: add msm8960
 compat string
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220406002648.393486-1-dmitry.baryshkov@linaro.org>
 <20220406002648.393486-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220406002648.393486-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/04/2022 02:26, Dmitry Baryshkov wrote:
> Add compatibility string for the thermal sensors on MSM8960/APQ8064
> platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
