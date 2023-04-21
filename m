Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6707B6EAF76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 18:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbjDUQtK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 12:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233209AbjDUQtJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 12:49:09 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D13313C2C
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 09:49:08 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-94a39f6e8caso319771066b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 09:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682095746; x=1684687746;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFbWjqroS73UgyNshkyA6Chv3Wv27it6AC9kt6qa+fY=;
        b=PzIC3uXtnwpJnedkTaOM5p7GiQ1Rhk6L5+p19qvC4Dt+WoNwyw8dJ62aCObABctUsO
         cOmzEjKGZsvTXItoUYAXMyeib9ZMPW1s51xCnBqxQYztcItD770tgmj/WfBrfrAtscb3
         4tYPaqbpBrFgrYEggHBFPy1cNhiahnMVpeeOC8BdLqhTcxKKeuzZe2+msZZp5BMG+kAH
         Z3gEoiKrzXnU/CLJtPJLruPByTcdWectUyuyUWSfgkk/vBs8N3umqpBdKoswd/YP5iQH
         cw2r/l9dE05JPz0tAhc8xISgNiyc3pbcq+nTQoFOxzRR6p7w9bBsOOpQKRoeLXP+Gp50
         dDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095746; x=1684687746;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFbWjqroS73UgyNshkyA6Chv3Wv27it6AC9kt6qa+fY=;
        b=fUEc3jutozraFgoRGfV6+KVOAWjp65Dk9ang9L7JgfvgTuKMNGDGvSLonHevnttnlg
         +IdW9nfg3Q254c7fkX1YSvaInhmkg2wUh+nKT1BA4atJHJHeJQoYqIcRZBIP5ziflDB9
         KcgRaAz5EaIja07uTotJe+BMQSehdJubtPv+INRFtluY/aw/ZCAoSTgaBwwI2Xp0GlTU
         LVfenw3ctLn7hZSDH6Gp+4C0ztV3S51RESXsqs3joNWOwy7HQgl5KkcWaJRjAvoEyLG8
         sRbqCQuP82GbT2xA+dtuxo5b+LvhKIpkWotFtkuSuD1VK7TAn4ObjtWbSYQJGd2S8YoN
         BoYw==
X-Gm-Message-State: AAQBX9eIS+fjsewn3GDdzrzzmg1kwt+/ouojJu/blZOWNhwJmY31NGk8
        LRLfCWuF1+iUeo4X9kAtyu9MrQ==
X-Google-Smtp-Source: AKy350aLL9GGW0waHbazfqEBHSm937gbyp54HerbiEHZb9mjsANA7SEFAHMq5ViLjxtlKbP9F6b5pQ==
X-Received: by 2002:a17:906:90c8:b0:92b:e1ff:be30 with SMTP id v8-20020a17090690c800b0092be1ffbe30mr2564169ejw.4.1682095746454;
        Fri, 21 Apr 2023 09:49:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883? ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id h11-20020a170906828b00b0094f23480619sm2302695ejx.172.2023.04.21.09.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 09:49:05 -0700 (PDT)
Message-ID: <49e0e62e-3746-1387-fb9a-49739423fb63@linaro.org>
Date:   Fri, 21 Apr 2023 18:49:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp-pcie: Add ipq9574 bindings
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com, quic_ipkumar@quicinc.com
References: <20230421124150.21190-1-quic_devipriy@quicinc.com>
 <20230421124150.21190-2-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421124150.21190-2-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/04/2023 14:41, Devi Priya wrote:
> Add bindings for the PCIe QMP PHYs found on IPQ9574.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  Changes in V1:
> 	- Introduced a new binding for ipq9574 as suggested by Krzysztof

It looks it depends on the clock header.

Either mention the dependency here or better convert the clock IDs to
numerical values. With the second approach the patch can be applied
independently from clock headers patch.

> 
>  .../phy/qcom,ipq9574-qmp-pcie-phy.yaml        | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq9574-qmp-pcie-phy.yaml
> 

Assuming you tested it (as Rob's bot cannot due to dependency):

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

