Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA515ED7C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 10:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233499AbiI1Iax (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 04:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233764AbiI1Iaq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 04:30:46 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C3B571721
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 01:30:44 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id k10so19289159lfm.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 01:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Dm3uqPAg8eoPnHxqMu1a0UAUiwGTZ3ONRjALLMb+mpA=;
        b=YiwvPQYOdIPSHTaWtpm0Ztw/euiLF2X9COCToOuZMSrJ39DO4Q+lxRCG+k49HwIy1i
         T/U0vwK48QaBji5MB5YLwYmkxObJop79YT/8HG8ZD6IY+o6bGxHHt1JjPZd3WNHPgeMU
         GXqrwMBS3WJMTkghn1W2y1X9eL4JsCpA/L6N+y9Aip2j39UOpXJwvXhZVzGpdBS4htC/
         dg3aGi4ATdZ1YHnbgHIr4Z+AzYq8xLOK8B1XNCNUqf9NtHkZUBfXkHAk/2WjcBhYOISc
         9QYLoVyBhdU7rnk9aeGUJWNws/0fuuzes35ZW2O5Ez1EzJxQrYxaQGuC8axwKQf8uKbF
         lgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Dm3uqPAg8eoPnHxqMu1a0UAUiwGTZ3ONRjALLMb+mpA=;
        b=UPpdTXjz2GWPnVzgYopdOeSOkHmzdjYHv+CxnsfdTOhLSytb5UqnyoLlae1aQ1iYHP
         iSnSDeGWKy/OJIMA6H9QtTmQlyfVRmIBLuFWX7DNlpQME95u5L9CdEYpsQp4AXtIT4Ve
         KMY1LwwLcN6NXjL/Qa6wAnE1qIwsZqquJ4ejB2Qp0wUtHydCqv9v40DA+SO5e+UFjIUC
         iCVcf+VP33hSKS3o0GcTBLhq5jyg2OZ+dmEJghvdGzRTUc0Z3Q/Bz5EKWfjpoddJIEYm
         m9EtUK/3ofs1wq8n2ACJ6CU9+Hzdyqu5R8HXS6gLph38OQZyC/E/Lm40aPturfgQMN0t
         WNWg==
X-Gm-Message-State: ACrzQf1ZeYST8y7HU9p7XuHo5Jt35xGOKfNt5jx/JuOmgwlyYTDg+BRA
        mXQPzyr2I0Mts/yd7/6n7Lgl/g==
X-Google-Smtp-Source: AMsMyM5ulsXpzfd2Ir/2GftYgLXdnxDjNfTpMcf3y7fOu0+QpNaOTgfm1zuqTvzYKuUrdi4jqMrG0g==
X-Received: by 2002:a05:6512:3981:b0:49a:d169:5808 with SMTP id j1-20020a056512398100b0049ad1695808mr12078473lfu.241.1664353843045;
        Wed, 28 Sep 2022 01:30:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 9-20020ac25f09000000b004977e865220sm409650lfq.55.2022.09.28.01.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 01:30:42 -0700 (PDT)
Message-ID: <06603279-df45-b52d-7b9d-a11230a1f9c4@linaro.org>
Date:   Wed, 28 Sep 2022 10:30:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: qcom: Separate LTE/WIFI SKU for
 sc7280-evoker
Content-Language: en-US
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220927112343.2700216-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20220927192234.v4.1.Ide53082044aac56877c4ff5725777769e377476a@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927192234.v4.1.Ide53082044aac56877c4ff5725777769e377476a@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2022 13:23, Sheng-Liang Pan wrote:
> evoker will have WIFI/LTE SKU, separate it for each different setting.
> 
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

