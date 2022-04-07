Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C8A4F8B7C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 02:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbiDGWkx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 18:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232306AbiDGWkq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 18:40:46 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D85B14F12A
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 15:38:34 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id 75so632447qkk.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 15:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uqhxauvR8mCQfoS6i8uwjBu35yp97nhbeSWZ8vnrwZY=;
        b=bV88Cr4N/znjGzgB7rGsAMSx7HMUtAsLuyAIexD78fMOdCSuQ4MWuJ6OWLMzjvmh27
         B6cXdE4QcijqPh4lAqbIFQ/biCEolBwl/UxDmX9z5aUx0c0ovN49h0qKtiOm/SmUy5Z5
         IEpDqqhlkjAtOwgomHhNLK4qkn5julTyvpYtfEIWo6dsgQ5ivqU4W4ufglNIlUTwYGpB
         LvVjmvxW1ov4qozfnpoxVU8VcObOqTF+yubspktLowPr5W+rm1f+o06nEbTryAi0JGoO
         KfsMn8WLSmCtqFxHdzrjnRtrQBJrclEILUxOTHtjeC5LTx8obNvyFuRJEbMhgG55vpe0
         tmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uqhxauvR8mCQfoS6i8uwjBu35yp97nhbeSWZ8vnrwZY=;
        b=hyQtB/DM8B6/bhpO+eBOStKF69HD+M7zyX7CPwWhaQ3ApGICFpBNqIIo8jjEcvRC0c
         JMq71XI9qi3C3H6RDf4njw5//mWD+4HbzKDnovPqR0f5b8vsihHIXWc9y+1Xvb23D7rh
         PasJdiKIzokCs7M0/V/t36zgtkhvVZYXn+TUQC+142bmTAARhT2i0+i1gSu9n5w48Kaj
         DA0DfNURKQnvd4KpuKFUwTO9KnWHyHpXd6FrI0s13OxP2+evjnujTNYaCryJr9srO/8I
         eEkL2QrgOCiVUjAzBXi2oqWdW+DErY1GqaB5lVk0FGASQqNadA2hE4cEZH9qJJxPo80B
         hF5g==
X-Gm-Message-State: AOAM532ehj/modhVdhfgAAO4yaN8SFO6YtiDVRIHhD/AvibtLQYvxGNv
        nddVX+i3OrvSc+xh2Xahax3LtKbftFYmLAPk
X-Google-Smtp-Source: ABdhPJxoGTF+jmO49F17rm1r53RiWDqavHKmNkl6FMddkvgVQv8x1rO57QH8eX2rdEH2xyqRsdrSKw==
X-Received: by 2002:a05:620a:290d:b0:67d:b5f5:302a with SMTP id m13-20020a05620a290d00b0067db5f5302amr10625916qkp.399.1649371113127;
        Thu, 07 Apr 2022 15:38:33 -0700 (PDT)
Received: from [192.168.0.189] (modemcable134.222-177-173.mc.videotron.ca. [173.177.222.134])
        by smtp.gmail.com with ESMTPSA id h6-20020ac85e06000000b002e1e8a98abbsm17018685qtx.41.2022.04.07.15.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 15:38:32 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: delete incorrect ufs
 interconnect fields
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20220407172145.31903-1-jonathan@marek.ca>
 <e41c26c2-8aa4-cfd2-27b0-eb011f45eda0@linaro.org>
 <865ff6bc-95a2-8b39-5cf2-bb2d3f592c5a@linaro.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <f1fb2d71-4adf-bcc7-76b3-c7102ab9f2e9@marek.ca>
Date:   Thu, 7 Apr 2022 18:38:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <865ff6bc-95a2-8b39-5cf2-bb2d3f592c5a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/7/22 5:16 PM, Krzysztof Kozlowski wrote:
> On 07/04/2022 21:40, Vladimir Zapolskiy wrote:
>> On 4/7/22 20:21, Jonathan Marek wrote:
>>> Upstream sm8450.dtsi has #interconnect-cells = <2>; so these are wrong.
>>> Ignored and undocumented with upstream UFS driver so delete for now.
> 
> This is the upstream and they are documented here, although as pointed
> by Vladimir this was rather a reverse-documentation. The documentation
> might be incorrect, but then the bindings should be corrected instead of
> only modifying the DTS.
> 
>>
>> Basically the description was added by a commit 462c5c0aa798 ("dt-bindings: ufs:
>> qcom,ufs: convert to dtschema").
>>
>> It's questionable, if an example in the new yaml file is totally correct
>> in connection to the discussed issue.
> 
> To be honest - the example probably is not correct, because it was based
> on existing DTS without your patch. :)
> 
> Another question is whether the interconnect properties are here correct
> at all. I assumed that DTS is correct because it should describe the
> hardware, even if driver does not use it. However maybe that was a false
> assumption...
> 

writing-bindings.rst says it is OK to document even if it isn't used by 
the driver (seems wrong to me, at least for interconnects which are a 
firmware abstraction and not hardware).

462c5c0aa798 wasn't in my 5.17+ tree pulled after dts changes were 
merged (I guess doc changes come later), so my commit message is 
incorrect, but I think it makes more sense to have the documentation 
reflect the driver. Its also not an important issue, so I'll let others 
sort it out.

> 
> Best regards,
> Krzysztof
> 
