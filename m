Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E047D4F017D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 14:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244168AbiDBMch (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 08:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345259AbiDBMcg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 08:32:36 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E9DB9195
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 05:30:44 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id k124-20020a1ca182000000b0038c9cf6e2a6so2948590wme.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 05:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nTpcojICyV8T2SR2Rm2EXyKZVXClGK7L/nOvqgVyoAQ=;
        b=y4hruzIu08W/ADPKl9empnFwd07TovtjbxHbshyhX2Fix+/YldxLQcEI35sKZy3u72
         pD7dDaKIzxBu2nJ4GA2iya3Tn8rMwuCHDcaTtmD3OlvkQf7eh5PKQnQGj99T3s1NntkN
         hYXRpLGhTlnxJvUg8AJk0amhlJt10cz/y2HVXIg8w4VMZCJRNpRzFNuzV+KACP871vXe
         QuLw4KoSXpEPJecVoEHE9VKtav9H1rX8wT/zf+LpJcBW2Yk+iTiqyKxTMhbfU37DnkDv
         NjosWBd0+04dsy7u7rsloXHFBnGZNAkNy7vxRXaEdKnUsGoU9IoKpm7eIKdtcDOMm7/u
         hBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nTpcojICyV8T2SR2Rm2EXyKZVXClGK7L/nOvqgVyoAQ=;
        b=O+R9WcjfV5HUZnrHFzGJJaYcWwx6unxkhiZ7Sb/YkP7hUPkt/flZ7FRjQ08MkE3q7A
         F2NRe/fNLRCJxCx50YDlYOrfJO5XgPlIs24K6vFiZWkz+rTAVdyqegSKvc0zKcOH+qUX
         Y5WFTlIRjfRvHzmfCS1FNbYfEz1LczkLUMYNmUYGaG9FxNLtB+nwfU1+lZMeAwe7BsHM
         fUryiRxz2kVmk4YJ1yX1XzElQPUGhBL432hL6aNEp+7Q5zgfpcLVWl2EwV/tbdQnRZO2
         7HX7yvjBBKaqwam7+2U9PjKQtIwRozY787XhJKI55KvZOzZy56TVzYpeNPP4a8WjtAze
         J60g==
X-Gm-Message-State: AOAM533QGMpaXlNGcOIYlNYYksgmHj3HreMnVaIAorHRajNl3Xoz4xzu
        03lj1B7nchxRSq9P4CpSvn1F2Q==
X-Google-Smtp-Source: ABdhPJwd5SLiAUUjAzsbfjQG1cLVP2V8eXNlkBcAVjYdiV+dCirZRVbMYdWuR8UJe6VFBu4exYUYuw==
X-Received: by 2002:a05:600c:358f:b0:38c:c046:caef with SMTP id p15-20020a05600c358f00b0038cc046caefmr12499538wmq.202.1648902642650;
        Sat, 02 Apr 2022 05:30:42 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id j16-20020a05600c191000b0038ca3500494sm20321052wmq.27.2022.04.02.05.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 05:30:42 -0700 (PDT)
Message-ID: <ae251373-b682-5dcb-dc0a-65ae943633d2@linaro.org>
Date:   Sat, 2 Apr 2022 14:30:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/5] dt-bindings: qcom: geni-se: Update i2c schema
 reference
Content-Language: en-US
To:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220402051206.6115-1-singh.kuldeep87k@gmail.com>
 <20220402051206.6115-3-singh.kuldeep87k@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220402051206.6115-3-singh.kuldeep87k@gmail.com>
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

On 02/04/2022 07:12, Kuldeep Singh wrote:
> We now have geni based QUP i2c controller binding in place as
> dt-bindigs/i2c/qcom,i2c-geni-qcom.yaml similar to other controllers,
> update reference in parent schema and while at it, also remove
> properties defined for the controller from commown wrapper.
> 
> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> ---
>  .../bindings/soc/qcom/qcom,geni-se.yaml       | 26 +------------------
>  1 file changed, 1 insertion(+), 25 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
