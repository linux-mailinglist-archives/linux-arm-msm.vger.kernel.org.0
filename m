Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50CC24C0EEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 10:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239219AbiBWJQI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 04:16:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239214AbiBWJQI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 04:16:08 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B897F811B6
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 01:15:40 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BCBD83FCB1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645607738;
        bh=6E8LpkVcd+7AGHgdYAkEZe+ycoMDPekcdYSjpmTWlKw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=F3Md2UK0jpLf/OAzfbgKmFCBwBeke1DULmZlJ+CpuvEBrveuQrKO0kOEqUVL0StUy
         lkUq7kXNy6I8pevlTsgN3BqPKhTgTT95dIvTRTKuyNqrE9w4pQQDJqy3cngBW6lMGW
         su7jAVHqovTNaTRMfxbz9R60w2v+DWUPXvEW6v6rcBys1/x4okiEKoT7OerWFfFpOw
         r5/1kj4kelVPuYOTK00H8+1KzucfdrgLftkrJ/uVNdYE28AyCmBFn4U4yzZc9lIyjx
         qadjT4uBgOAsoXRjJD0HaYVqlw3wAd+nqAiPIw7m3da5qKl1YPdVk7v/7JRLfNPXpj
         HAM4mz1qVEHeA==
Received: by mail-ej1-f70.google.com with SMTP id hc39-20020a17090716a700b006ce88cf89dfso6838322ejc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 01:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6E8LpkVcd+7AGHgdYAkEZe+ycoMDPekcdYSjpmTWlKw=;
        b=2DdWfALjBXAvTHPZ+bpvSroJOdt/8HSppxvgYSxljnpxAyVGh1IH+2PoMbh0rAoHUD
         sUKIr0LfIPDkaCSiJcXpF7YvLAtQAb3WS/RPe5Pfi5cqjWzdkvnApYaCL/xMav8yGW8n
         xS6yW9TWGVs1JAKlN/TXVxzRggor0oAbI3t7MIj+BVe+5aNSFKWgmHJQqeY3zsKYkzBj
         ZOqVpAac0s3tcFfo9vIz7/p/4r80IVtd88XY6EvHw20QPhgZ7NRZ2Hr+ypKYlyFanacx
         7N8um8gETiVX3w7HFu1aGUF2K617tT6md4cxhpdjPCjDn9+SmqKzQ2AdMaAIC6k8KsPP
         Z5EA==
X-Gm-Message-State: AOAM531Qi9hm1TDmu2y18bEBRaUTsrFfNeXEve/QD1VMTdcXAHVtZoTX
        q91jrk+IXPFT6Mu7btyHRDmQP43jFufLpNMe/6grPYC3PO/R22K+IInKekLuFvxKETTWJhgFU2n
        Aks+gkLHvhUve0rzTFU9DxLsV/zsBgKHkaZ38QOne4tY=
X-Received: by 2002:a17:906:a2d7:b0:6d3:45dd:bdf0 with SMTP id by23-20020a170906a2d700b006d345ddbdf0mr4297311ejb.104.1645607738039;
        Wed, 23 Feb 2022 01:15:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+9RnhMOLjSidBg/q3fUtt63PE3LgnR/AR0rH4GmRR5w77qD1Ua2aWMA7kqobhEoIkxmVgRg==
X-Received: by 2002:a17:906:a2d7:b0:6d3:45dd:bdf0 with SMTP id by23-20020a170906a2d700b006d345ddbdf0mr4297297ejb.104.1645607737804;
        Wed, 23 Feb 2022 01:15:37 -0800 (PST)
Received: from [192.168.0.125] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id el5sm10993751edb.71.2022.02.23.01.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 01:15:37 -0800 (PST)
Message-ID: <455a8a87-63e7-7864-f765-142be18d1fa8@canonical.com>
Date:   Wed, 23 Feb 2022 10:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/15] scsi: ufs: deprecate 'freq-table-hz' property
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-10-krzysztof.kozlowski@canonical.com>
 <YhUodbzxx4wbr+gy@ripper>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YhUodbzxx4wbr+gy@ripper>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/02/2022 19:16, Bjorn Andersson wrote:
> On Tue 22 Feb 06:58 PST 2022, Krzysztof Kozlowski wrote:
> 
>> The 'freq-table-hz' is not correct in DT schema, because '-hz' suffix
>> defines uint32 type, not an array.  Therefore deprecate 'freq-table-hz'
>> and use 'freq-table' instead.
>>
> 
> Patch looks good in itself, but why don't we use opp-table to describe
> the performance states?
> 
> In particular looking at the two columns of frequencies for various
> Qualcomm boards they require different performance-states.
> 
> A concrete example is sm8350.dtsi, which specifies 75MHz and 300MHz as
> the first frequency pair. The lower level requires the VDD_CX power rail
> to be at least &rpmhpd_opp_low_svs, the higher frequency has a
> required-opps of &rpmhpd_opp_nom.
> 
> 
> As this isn't possible to express in the current binding we've just been
> forced to always run at a higher voltage level and kept this in the todo
> list.
> 
> But rather than migrating freq-table-hz to freq-table and then having to
> introduce an opp table to express the power constraints, could we
> perhaps skip the intermediate step?
> 
> Or would you have any other suggestion about how we can represent the
> required-opps level together with the freq-table (if that's what we want
> to stick with).

Usage of OPP tables is interesting solution. It would solve your problem
of power rail levels. This would need several opp-tables - one for each
clock, which is not a big problem.

The problem is that I do not have any UFS hardware (none of my Samsung
Exynos boards have UFS... I don't have even arm64 Exynos chips :( ), so
implementing it theoretically will be painful.
OTOH, I believe that having a working dtschema is very useful. Having
dtschema without errors/warnings is even worth some churn/intermediary work.

The intermediary work is also not that big. Once proper OPP is
implemented, we will have "just" two deprecated properties in the bindings.

Best regards,
Krzysztof
