Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10D405E7758
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 11:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiIWJi4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 05:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbiIWJgo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 05:36:44 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841EE130732
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 02:36:36 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j16so18929740lfg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 02:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Xk/gVSD+vh+ZIMZ668aPcrLeqKvYBTNu+pH41Yvodbs=;
        b=w6qsAtyDvzfYLjuytNvGRMRGffrsg1AzWw+qbxj38wsYfKQwJysXQs5hCLn2eHVIRk
         foPRA9oaOImr85M33qb79Sc9SusuIezsM24OHXmX9x+1U2/nf8Bv1+JOxvqNv9+NtPHa
         V1BnReibKMtYjt8bdpdR8s+M4ypCt+8F29clW7bWC57bOGgGJNL1sFA314cTD+hwGRLP
         1G6CpGAtxkoDwkB3FMmaQbER87vUriJjJ5F7SthhqBfewvcV9CAV3tqEFK5dMRf7E6dC
         PhPPr/2yTPvl0Cgg14CNaBZS6HtsUhDSk0LL4EF6CvDH//tjUGbGzvZPxK0LnAwge0mp
         kfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Xk/gVSD+vh+ZIMZ668aPcrLeqKvYBTNu+pH41Yvodbs=;
        b=FKbb7MCJ2HtMVVun2dwQlm4+KK+eiKbdwVa0VykFOIUxlOGQYSVwc8eYNYhUJhX6HC
         vdT4KZjFaoNFHUmDHLJUQkikEqQL311zND2Oz5oFBhGJnuMslUYj85irA/txttzMDdwy
         TqY64zNy0L9BaY/yD6RyiVEPUwGMFP3YcW4nrXAwFR6X8YzDfQO2IZ5iKjFnuD4iKms6
         /LiM0nHxhesOMjUI1Liy5599gdQXzkQqQgrfr+9DH6qRNZbFowP4Avsty/xiXKKaVHLa
         4Dfibx+7R9y6Wosw7pBakIZbTVqycojSXlyi9yaQqG8mqu1ukyu95GEOXj8IUQnd6BY8
         OHYg==
X-Gm-Message-State: ACrzQf3V+G63qYsLmNKeIfX2JSPn3+0qbEOcpswsjMOhA4pio0qZrcaW
        lWfdKfC0woBD78pmIBmmk2H5fg==
X-Google-Smtp-Source: AMsMyM7DCwqOOF05tz5ECggjiBhUrW1d5GfU9JtCsxNXLRnRftZCPCfgd5hWlAyLwbU/NBRTD7XhJA==
X-Received: by 2002:a05:6512:31e:b0:49f:9ee1:e5c8 with SMTP id t30-20020a056512031e00b0049f9ee1e5c8mr3066650lfp.299.1663925794937;
        Fri, 23 Sep 2022 02:36:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id by40-20020a05651c1a2800b0026c446918acsm1281161ljb.134.2022.09.23.02.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 02:36:34 -0700 (PDT)
Message-ID: <ecc5ac31-5573-3d50-0186-0622bfeaceb0@linaro.org>
Date:   Fri, 23 Sep 2022 11:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] dt-bindings: mmc: sdhci-msm: add sdm670 compatible
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
References: <20220923014322.33620-1-mailingradian@gmail.com>
 <20220923014322.33620-2-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220923014322.33620-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/09/2022 03:43, Richard Acayan wrote:
> The Snapdragon 670 supports eMMC with an SDHCI controller. Add the
> appropriate compatible to the documentation.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

