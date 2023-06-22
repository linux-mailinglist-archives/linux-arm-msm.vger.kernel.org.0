Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C27E1739D82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 11:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbjFVJgd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 05:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232593AbjFVJfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 05:35:24 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3B12D4B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 02:28:52 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-311394406d0so4449371f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 02:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687426131; x=1690018131;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a8I/X4DIkumE0o217fuyqlb4csZOvMDW/UlSifsV2GU=;
        b=bYzxCtFqXPloCjCKlMFQWGOz34JRH3wCnPD3AX38cFSLTi6Cm/moRaAzr/P9UvW8yK
         T1UlfaUEMwKRoiHsYP2AP1eNfAXLJpOw6fuiK9KovJ6TTbshtiNVn6qpKJwQbplR7OOg
         cx6Tisg37W53vmqv5m1Z8lPI4korclfp1prU7mkLZhjPR9+rdDrp6MRwgW2Ncm7RM0tH
         EKlfS2nMwEz3mW4p3CO9SV7SgitOCSSmw0Hb3yAyfNuhyh4ElkPZLngym63CKrx/nmnW
         QWcMXIrvh+PraUYucMC8xzhBhv0/T9lnF2rJXI9ik824sFmQmQnBhTTJQeTPzfNemHg1
         WgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687426131; x=1690018131;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a8I/X4DIkumE0o217fuyqlb4csZOvMDW/UlSifsV2GU=;
        b=Td2nzUDJ/xqJmZM4XSYqbEUFwvr/TLcTt4YBF1kayv8YfOdIrdIGbXlZQu9OVINfTH
         qZ/aQwfKYPobpOWABNUeRikepyzL7BbFyEXpEO2OFa0exhfmpbwmsNhRHCHi7EngtWib
         3ixvzH8Rho1Ms+Wohmkj7oar7ajB36T71GH+XOQIuMh4SC7i4/pLs8eLPGsOa29W19dx
         RVcEMBK8OvAxvKqfkMmmoGE+/nu313kSn/wTKEEIgziktecn96cd3qQ3ABLbS6FYvGOt
         epJb3t3B7yOEJXqWL2WBRNtYiG7MWU0a8OYQuVH/LuOXGkiTPZdWbdNHhOI0wLXh1Hoj
         f3aA==
X-Gm-Message-State: AC+VfDzrAKTB/UkZafJnxEadPfIjBs8/fXzWRBbvQCa3x5Lexem8D9IV
        a8hEOCZ+tVj/9bTdImhBXCCyEg==
X-Google-Smtp-Source: ACHHUZ4T77alv8uvZQD/zqnC6VfvSZmzxDS+DYzTGDKhKFLEX9r7QGKfu+W2jacagsaCQjaDDoaMnw==
X-Received: by 2002:a5d:591c:0:b0:311:1a9d:98e with SMTP id v28-20020a5d591c000000b003111a9d098emr11415672wrd.58.1687426131213;
        Thu, 22 Jun 2023 02:28:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id c11-20020a056000104b00b003063a92bbf5sm6641190wrx.70.2023.06.22.02.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 02:28:50 -0700 (PDT)
Message-ID: <35253eaa-78b0-8976-aaf4-8917331e7823@linaro.org>
Date:   Thu, 22 Jun 2023 11:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 1/3] dt-bindings: ufs: qcom: Add ICE phandle
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20230408214041.533749-1-abel.vesa@linaro.org>
 <20230408214041.533749-2-abel.vesa@linaro.org>
 <4aadaf24-11f6-5cc1-4fbd-addbef4f891b@linaro.org>
 <yq1ilbgqoq6.fsf@ca-mkp.ca.oracle.com>
 <80ca0da4-5243-9771-0c4c-62b956e97b2f@linaro.org>
 <ZJPyGW2I4fHqFMRV@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZJPyGW2I4fHqFMRV@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/06/2023 09:02, Abel Vesa wrote:
> On 23-06-22 08:07:51, Krzysztof Kozlowski wrote:
>> On 22/06/2023 03:19, Martin K. Petersen wrote:
>>>
>>> Abel,
>>>
>>>> Un-reviewed. This is broken and was never tested. After applying this
>>>> patch, I can see many new warnings in all DTBs (so it is easy to spot
>>>> that it was not actually tested).
>>>>
>>>> Your probably meant here:
>>>>   if:
>>>>     required:
>>>
>>> Please provide a fix for this. I don't want to rebase this late in the
>>> cycle.
>>
>> AFAIK, this was not applied. At least as of next 20210621 and I
>> commented on this few days ago. Anything changed here?
> 
> Check this one:
> https://lore.kernel.org/all/yq1a5x1wl4g.fsf@ca-mkp.ca.oracle.com/
> 

So staging tree is not in next? If it cannot be rebased "that late in
the cycle", this means it should be in the next. :/

Best regards,
Krzysztof

