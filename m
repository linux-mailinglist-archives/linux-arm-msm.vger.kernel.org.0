Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A15C05EEEB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 09:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235156AbiI2HRu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 03:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235189AbiI2HRl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 03:17:41 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64FF1132D4E
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 00:17:40 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id i26so897727lfp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 00:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=iMtljgAkURUibrL7m23ot3SY+EybKTFQ6aJepQTb+CU=;
        b=uPccaG5k+Z2ZxhUfRK2F9G0Rf+9KT93eRs2Lp6FSIfDQRAsG01sWCrdNAryOugKXUg
         Z7IQJSe1PRd9Q2wYHXkZhzbE6Kh+lZsBJy1wDo6ZxZwVs4/ptx7qo2Z3aKH+LAh8avhV
         i8D4VZc1IZEk173SeeJm5qpnfqs9dGaHY8ptmFx9ses5EYxoBetvxaC64+S1s67gS4gW
         fNwdskJlVrFV4cXDgEe6wyW0JVcRJFnXRFDsizOx6+dYQsw1xM3PrMQ6n1tXcSFkIwGo
         g56/bNUTidfkwmQAMjqLZoWUj1hENln+YKk28U+zoIKQ7kAA313nJkSI2AU1FHflONVp
         Bf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=iMtljgAkURUibrL7m23ot3SY+EybKTFQ6aJepQTb+CU=;
        b=oAa3S/mp96VIKvgi6kLlVSe/ihKcQjsu/lNYdU2NSkwGduojsyFVJVgB1glb60XuvI
         6G69uBUdLG+oBHqjoNpS7jvOV1J3J4HKH6vs5G1viwdzZxOZzACXJS5w5uO+srwTug0z
         192GBhqLH3BiDRF0JtD9KK5tzU87lysrTPjMXYzupgNQi9kg9nJM0HGBY2qb79jTMaqC
         ynzh6BKptPfH08mGyowAy+MRBDQQoJ2xhVwz23BxtOipIcjkkQuVX5fNNSpx3/MMURWB
         0FVphztNZ68KPv9BLX4fHat4zZilNa5EgK/Rc7O4ZUVuuzoWWVjQ7KnE6HAMmahliOvT
         QnzA==
X-Gm-Message-State: ACrzQf0Ec49VeXz/7X9wlmHR5uuaRkdzLDq9RgsdEifQcnWmJhumJ8R/
        ixhao2sbPz7SZFmnNwf5p+Sv/g==
X-Google-Smtp-Source: AMsMyM6MJD9Y3GWLRtTQA934uZ89vRwh26BG5/KYVHrohBvBK5qLH6hNNL5uheaD2Hk6dHDCTa7bKw==
X-Received: by 2002:ac2:4c54:0:b0:49b:182c:2051 with SMTP id o20-20020ac24c54000000b0049b182c2051mr733599lfk.369.1664435858773;
        Thu, 29 Sep 2022 00:17:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g19-20020ac25393000000b0048a9e899693sm703760lfh.16.2022.09.29.00.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 00:17:38 -0700 (PDT)
Message-ID: <b7c89788-0682-3be8-92d3-552bbf63dda5@linaro.org>
Date:   Thu, 29 Sep 2022 09:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 2/4] dt-bindings: net: snps,dwmac: Add Qualcomm
 Ethernet ETHQOS compatibles
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Miller <davem@davemloft.net>
References: <20220929060405.2445745-1-bhupesh.sharma@linaro.org>
 <20220929060405.2445745-3-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929060405.2445745-3-bhupesh.sharma@linaro.org>
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

On 29/09/2022 08:04, Bhupesh Sharma wrote:
> Add Qualcomm Ethernet ETHQOS compatible checks
> in snps,dwmac YAML binding document.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: David Miller <davem@davemloft.net>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

