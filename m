Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59A504E9B2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Mar 2022 17:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238058AbiC1PdH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Mar 2022 11:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237998AbiC1PdH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Mar 2022 11:33:07 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232195DA19
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 08:31:26 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id pv16so29536887ejb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 08:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XVOdqtYpNwqLWJc4Ni5fAaD2U0widdST+YuPSsDvcoE=;
        b=IQMm759QFEPImiACJ3TGGCTHB3IELcopOlUDoSvauStFHz4MaTX2LwwOGHGdfLjajk
         Edf7FKVRQ61ssawAJddyaJFEqxk+UT3wvr6Axw6pa76AAmhHuQBAXIEXTS/zgLdQfdZA
         sPQzEUAhFKo6F9P+xO/KZgjFT4Qa9QxhHM5V2nY481/FFMxLnlLHdZmNLc4btyeRDqah
         rq5JpRo2enI69rZUHjo1Z75ro8x5lYiv7pqTxRSXdAs4JtERgOL+us4LYsLrd/Hmc/Sk
         ++6dM0HAX9NVBWovfjsOnvqxf3KNaHP6tXFtCmBLn6lOkTCYLWpRMDijqHfO9/tDX+vL
         y69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XVOdqtYpNwqLWJc4Ni5fAaD2U0widdST+YuPSsDvcoE=;
        b=WJguXBqCP1JBx4aHG7na3rmPozHNmIBba+6L7kjRkgihecUHkA9qO7msAejdZO8ghN
         uDPYNucPgcnWXrrzyre5A6vpA19+4WFM3M+I0EbXXOil+DszxG3u3wI4Mk0Xoi7Iokia
         LhDVV904kgHxYBUIOAT5e5OMrB+mjHCTTzk8vLIxPn3nNj8eo5sgmX9bG7xcV7x6obmM
         XJ12SfkCUN24/CNYvRbNGUoXoh3zPuDebq54yAiVaW51crRQSeLGY1b2vdKXhBNBDXdR
         lKc0xAhlmFnEYRA3IAvsp68aOKi1IzCjXg7bivxV9qyo5GXW7vo7S+ZcZxEjr1lGmAvT
         jtpw==
X-Gm-Message-State: AOAM5300cho2v5H3P6QOVAImRz1WljsuSS/r9/YSlipxNWYfeMU5lLBa
        q1p97WkTxAW5Rhj6OWmZgMizLQ==
X-Google-Smtp-Source: ABdhPJwnNW5LR0Gjv8RcjkHQy3MYxUIcpD+Okgnjnsl2Orn1ckdKLdXfSAas4GHG2hGm1N3O1blXfA==
X-Received: by 2002:a17:907:6e17:b0:6da:83a3:c27a with SMTP id sd23-20020a1709076e1700b006da83a3c27amr28069230ejc.415.1648481484632;
        Mon, 28 Mar 2022 08:31:24 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id b8-20020a170906728800b006e0351df2dcsm6085838ejl.70.2022.03.28.08.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 08:31:24 -0700 (PDT)
Message-ID: <9277ab24-cbd0-f972-5a08-2faad2662f32@linaro.org>
Date:   Mon, 28 Mar 2022 17:31:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8250: remove address cells from
 dsi nodes
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220328143035.519909-1-vkoul@kernel.org>
 <20220328143035.519909-7-vkoul@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220328143035.519909-7-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/03/2022 16:30, Vinod Koul wrote:
> The child of dsi nodes do not have unit address, this causes warnings:
> 
> arch/arm64/boot/dts/qcom/sm8250.dtsi:3249.22-3301.6:
> 	Warning (avoid_unnecessary_addr_size): /soc@0/mdss@ae00000/dsi@ae94000:
> 	unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> 
> arch/arm64/boot/dts/qcom/sm8250.dtsi:3322.22-3374.6:
> 	Warning (avoid_unnecessary_addr_size): /soc@0/mdss@ae00000/dsi@ae96000:
> 	unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> 
> So remove #address-cells/#size-cells for dsi nodes.

Looks good.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
