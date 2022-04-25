Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5EB650DDF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 12:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbiDYKfy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 06:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238148AbiDYKfw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 06:35:52 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD75A186D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 03:32:28 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id r13so28728426ejd.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 03:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=l4U9a3Zi4lHZ61yfuUBIblmiOyI1fKpkBOTkv3JlGtQ=;
        b=Ymlwiw0q6E1oM2ZVpnGCmW5V5/N40PyfUybcUSeQt3NKV3qWyOatxXuMVogNBBqF8a
         BJOTudbuDHyOyOx71QYJCJ3WbK38vO3MGDojm1zz/+iY0XvAa878smvwmlRRtbwTkepr
         bCZjBgmyCUvpDEdppU50eCERAGfHuc4z9XWzaW+tsniMqEGhRMzLOvRBniGcSOzppuRw
         7ydvUDZbFWUqMU0Wgz59QlKDSBzfjOMJbdoncAFaGJHsgmVDfCJWVwYjhY1uI7UwrqGq
         gw1qBTXBSNFSk+vVwrJ02Z5Ke3z+RPggu+luaRqxiRd7zs2ZUpt+jTXbWj5p0YxEY7vS
         eaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=l4U9a3Zi4lHZ61yfuUBIblmiOyI1fKpkBOTkv3JlGtQ=;
        b=NOhx7jiRGs5N93BR4U+EJH2pXRxpio5HJ/7iBxDkF1StXuujFAYf8P29bqvYg/pZMA
         Z5vulJPcSNPzfd46/nHVTHuG1tc5NqK36WoSRxs/xCJhJKadtHA2MdGUB8nF9o1GWOF8
         rq8lvnZHXDelblyL1bIFZyqLyr0wt9Z3CayQG+sZWTLDf1EnqAtC4iITu9icDs4w/aaA
         hKc8/4bEzMevlq49nrffTAOx06+Vd763EYLAgRnAOZL140j5W59ozn9sElhPOmBNSr2m
         lhRnERWJA0KFFfW9Yal0UowsHmKABPKJ5H+Kq5x7Jmyiilg/cKtdkbuTGhKyyAVB62Ba
         ctzg==
X-Gm-Message-State: AOAM531/N6wB/t+Ziouzg6s9BVskoEsiNxvcqWBoLktO76I1QXMQTamf
        seOnO/L6e/5PNnkZVApffm52NQ==
X-Google-Smtp-Source: ABdhPJxcCZZQNOatq8Xg0snh4n+++QXiYb0f8DTwryfx5qVf1qv+dM8xahTIrDiTY/L1FxmLbA8f3w==
X-Received: by 2002:a17:906:2989:b0:6f3:a215:8426 with SMTP id x9-20020a170906298900b006f3a2158426mr1188179eje.725.1650882747453;
        Mon, 25 Apr 2022 03:32:27 -0700 (PDT)
Received: from [192.168.0.241] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z21-20020a170906435500b006e8669fae36sm3486626ejm.189.2022.04.25.03.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 03:32:26 -0700 (PDT)
Message-ID: <90c6fda4-b179-1d27-eb07-cfee0b375ec6@linaro.org>
Date:   Mon, 25 Apr 2022 12:32:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/5] dt-bindings: pci/qcom,pcie: support additional MSI
 interrupts
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220423133939.2123449-1-dmitry.baryshkov@linaro.org>
 <20220423133939.2123449-5-dmitry.baryshkov@linaro.org>
 <b1b0a459-5970-7a14-eb51-6a464fe83753@linaro.org>
In-Reply-To: <b1b0a459-5970-7a14-eb51-6a464fe83753@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/04/2022 19:37, Krzysztof Kozlowski wrote:
> On 23/04/2022 15:39, Dmitry Baryshkov wrote:
>> On Qualcomm platforms each group of 32 MSI vectors is routed to the
>> separate GIC interrupt. Document mapping of additional interrupts.
> 
> Is it on every Qualcomm platform? How many per each variant? IOW, this
> should have a per-compatible constraints, if possible.

After discussions on IRC, that finding such per-variant constraints is
tricky:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
