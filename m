Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 142636CB792
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 09:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjC1HCk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 03:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjC1HCj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 03:02:39 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8E11BE9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 00:02:38 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id eh3so45433265edb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 00:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679986957;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkwkB1IOUizr4S/0ONFCLf+IutuTlaBX/TM2PaaHsOM=;
        b=aAtoM7aio2BrVX4oMHg24j7vNM9V1UdcWt0xxqNWSs9XY+6mmWtd5RPZMbSr2B7czj
         SdYCNc9mHu8x44IllDD/t0kYtgEdD66HnDGRcVh5hnz9dQb9b0HgvcFUPyooGGZQQP+N
         lkl8BgWyLaUL0F74JJOIw682m0xX7jwN5NW/iPRbcTcML1uhsBgC2WmPIAC3r8V2DHCu
         Qa/J3XTF73XJSBPUn7vjJpLslwZ7oqhhf57Iv5aQm/haEi01SlYhyUnVuwP/S8LTfiuW
         Atm2eOdMtnUzWtXB1f8okQAkwsRlMIPUpWLi/JPmkgXrisCmhng6eoAiWNw4inMRGIwX
         z6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679986957;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkwkB1IOUizr4S/0ONFCLf+IutuTlaBX/TM2PaaHsOM=;
        b=SeAStR3NOixG5amFO349MXZUMCbrFb5ZrY3JGtl5fEYQQmQFkuBpX609oMWgkzVkK4
         sg+6J84SFf2o9C/TETd6GL0u3YCLhq/xgI1MJJsIszm5NsQG3KeeRk2WcB4O0vh6rZ6P
         ursk6pLDZ7sq97XpZI+XgODonT/D0osvVjqc7eOMWIo8H9qn9VP2lXnC7ZFsjzg0iIko
         FAuVCoxDHbMAu8aQra+lijHWl0fz1uV/KskBaqDfSNMdhi9WfajF197KVXrd8Jjd2LGX
         bhax2UgNth9nWEm+RPdNCtsKuNFoGENwlINc/ppFtu0Ymx1nOAF5MSC7+QhttrmQGIA/
         hysw==
X-Gm-Message-State: AAQBX9fJj46xcetU+mEonJjUfhDthq89+0LYsRSY7R+oLGNw+1t534pa
        iqy90vM7q3JVrwmVmgDfR/HZEQ==
X-Google-Smtp-Source: AKy350brS2jtniFEE4b8VHybYOiZvs42ORL5r9gpMBXcc4xEYpjeqN1Io+5Sv63vBgM18MNHBJ03Ww==
X-Received: by 2002:aa7:ccc7:0:b0:4fc:709f:7ab0 with SMTP id y7-20020aa7ccc7000000b004fc709f7ab0mr15297397edt.0.1679986957175;
        Tue, 28 Mar 2023 00:02:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id u22-20020a50d516000000b004ad601533a3sm15614931edi.55.2023.03.28.00.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 00:02:36 -0700 (PDT)
Message-ID: <72f744cc-21ea-0eab-2778-53ec0f3e4964@linaro.org>
Date:   Tue, 28 Mar 2023 09:02:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/9] dt-bindings: phy: migrate combo QMP PHY bindings
 to qcom,sc8280xp-qmp-usb43dp-phy.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
References: <20230326005733.2166354-1-dmitry.baryshkov@linaro.org>
 <20230326005733.2166354-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230326005733.2166354-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/03/2023 01:57, Dmitry Baryshkov wrote:
> Migrate legacy bindings (described in qcom,sc7180-qmp-usb3-dp-phy.yaml)
> to qcom,sc8280xp-qmp-usb43dp-phy.yaml. This removes a need to declare
> the child PHY node or split resource regions.

Thank you for your patch. There is something to discuss/improve.

> -  resets:
> -    items:
> -      - description: reset of phy block.
> -      - description: phy common block reset.
> -
> -  reset-names:
> -    items:
> -      - const: phy
> -      - const: common
> -
> -  vdda-phy-supply:
> -    description:
> -      Phandle to a regulator supply to PHY core block.
> -
> -  vdda-pll-supply:
> -    description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> -
> -  vddp-ref-clk-supply:
> -    description:
> -      Phandle to a regulator supply to any specific refclk pll block.

What about this supply. It's missing in the new binding. Don't we need
it? Isn't it a real supply?

Best regards,
Krzysztof

