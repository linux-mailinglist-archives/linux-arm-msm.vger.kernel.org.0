Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2C562DC45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 14:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239716AbiKQNHM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 08:07:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239654AbiKQNHL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 08:07:11 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FA859177
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 05:07:10 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id s24so2580541ljs.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 05:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTMuaBfKCMZXSl9LUyd4MIB5DqyeQyzncHYThdTUxqc=;
        b=FrCOZ6nVXao0w5awL8iRMvlXfEYyNRkTaPpnAujQjsIOw03r6wIvF6HBvR7ZDd2EyM
         aCROBjtDlRd7G2k4+P4mJDkl1uQsNj2IONW5BiM+a+EJJr9QP6N39PZb0eGaJs8awrB5
         qIkMrwWAJCjpRU2gWSG40wnLdTjg9i17NsQ6jaS0gOAfDwgh/zns8o1ittbgVaTQ01b8
         4xI+m78UCRp63u+03o1okyoXjzbYlAK7QqX2TYZeDmBhlvcWGyLjJQXVi5au8TLqasBu
         3/RlO4q7QDNVwdhP60FwiXTeqNIaJSvEBIJHTRn1Oq1xJhLCAGVz7G4pjI7J4M700S+V
         UAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mTMuaBfKCMZXSl9LUyd4MIB5DqyeQyzncHYThdTUxqc=;
        b=AZ1FnR+i5h0SCvuCNH7t4uHLjxJh/AH/ksF6z/h1YTPSScjcpoClcKbc0TMMLOJ7z2
         wdrMoNqMtMrRhiQCVi7WZyVsirxfe31gQOd9pWgJfg2E76nWYWQpOx+rZyojJ92+1AEf
         HzhIy81YXytQ0NmDVv6zVyw7k36tJHL5SGy4Rfj1/NUSbzLgO/4Blb0z3bGF2ECse8t9
         eCLNo5olxu+wa+2+6iHH2QvYs7faMS5c+Luw0FYvCsadOpQcCD+sTU+qYhkwechLfVDS
         DKb4q+6BF4Du3UqHLiZBHZtBdv5dssKj7UpcptuSd9wsrC1qYA/IMCazeT7K0PxYlMOx
         josg==
X-Gm-Message-State: ANoB5pmBR/OMtKBzpX3oYueX/IiedW7RbBEsWpYCQYwe49UETXb1n4zb
        AH8w737/5d/5US+1Ocsb8Sh3jw==
X-Google-Smtp-Source: AA0mqf75w4xQTmMedpWhD/8OvEx6h6E/KKGgAMpDrEd5hZKxX3G1odg3r90a7WzY1EkIFjWmWmh6sA==
X-Received: by 2002:a2e:a58b:0:b0:277:278:de24 with SMTP id m11-20020a2ea58b000000b002770278de24mr928223ljp.388.1668690429153;
        Thu, 17 Nov 2022 05:07:09 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id j7-20020ac253a7000000b004acb2adfa21sm136918lfh.297.2022.11.17.05.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 05:07:08 -0800 (PST)
Message-ID: <306064c9-1b8a-03e5-97b5-6cb2dbb6d8a4@linaro.org>
Date:   Thu, 17 Nov 2022 14:07:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Add SM6350 GPU SMMUv2
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221117094422.11000-1-konrad.dybcio@linaro.org>
 <20221117094422.11000-2-konrad.dybcio@linaro.org>
 <77805b04-2724-dc93-eae7-21d9c7caf0a4@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <77805b04-2724-dc93-eae7-21d9c7caf0a4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17/11/2022 13:55, Krzysztof Kozlowski wrote:
> On 17/11/2022 10:44, Konrad Dybcio wrote:
>> SM6350 has a qcom,smmu-v2-style SMMU just for Adreno and friends.
>> Document it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> (although this might need rebase later on Dmitry's refactoring)
Oh, I forgot to mention this patch was made on top of Dmitry's work. But 
it's good that you pointed that out!

Konrad
> 
> 
> Best regards,
> Krzysztof
> 
