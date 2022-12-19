Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED04650D0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 15:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbiLSOLp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 09:11:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbiLSOLn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 09:11:43 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B07664D7
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 06:11:41 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id p36so13774792lfa.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 06:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L7vvupcqfpTx04oPluFyE8GxdOmnjS8h3nTBePcjQas=;
        b=K/QeFBDcg+EYpC3OOem+CFLbBkDtMgpqYx3CK7Dpe9R6/rosq304Miin5liTZG141r
         cN7I3WQYs4fEqJvturUuQ+NecRNKTwLyEXTddw31On4wzjJ+P92e3Aqtj9cHMiCEbATu
         vtxHXnJzFljygx8DKtgYQSycPRaB6/4XMM4UC9IOoOgSfnnpi7tOWtZBRl1twt3huoF/
         c3kwIxklsjU6EghQ5TSQObzWkrI5Y2aBO9AF8a0NLHkjByod5iJscgatDAwE2bXjZ9mf
         DcvziMMoZcdASIRwR0yHCAlUMvzljFjUV0bs1XsXn4mhmpdxT1V5ugwAUtkiu5oWgLUS
         fj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7vvupcqfpTx04oPluFyE8GxdOmnjS8h3nTBePcjQas=;
        b=F9uX7mRZDMKWu9MF1SpLE5WDpCiwfa5MBVrR+G3M72VEACxeMddpEMtJLkqAyvCmF4
         KYbxBRMpTDqvJzLnQK9OuD62T57Ude0kjQ5Hh+ayLgoT9lQgf811VE7GMYY1c4SncVXD
         1UMj9wfNNpt+2hE7zr8mREmriHlZUoZXSgKr172GFL8zPSythpdOYDQBw/CsVWXgl2ce
         StehzLmO8k3SNkkUpv5HVueOpYC6tR9QOwzxSvCmKvB6OmutwLvlioGkGzzs0L/pwm5t
         mZbvOC5CtrD7IN1HtO0Rj1znrXcugHIsNXJfvkUdgKYw8wvNIMwnNzxsY6DP0gcEA4TW
         YBDw==
X-Gm-Message-State: ANoB5pmPJKRBWV86tbMkxrdUv9RHYqxCwTIGb5QICoZS6YBewENj/tYZ
        z7eD4Nil1T8ZE6QHX8Fht+9sQw==
X-Google-Smtp-Source: AA0mqf7Aoned+gxeID86PYvhran0thbNEm4/pE5j5vneFQizYIwboT2wdRDwfZrHcqA55hKIcMEfsQ==
X-Received: by 2002:a05:6512:2256:b0:4b6:f1b4:b845 with SMTP id i22-20020a056512225600b004b6f1b4b845mr11634402lfu.65.1671459099851;
        Mon, 19 Dec 2022 06:11:39 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p2-20020ac24ec2000000b004b0b131453csm1107917lfr.49.2022.12.19.06.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 06:11:38 -0800 (PST)
Message-ID: <1df13a83-1926-05b5-f7c7-388ef431a2fa@linaro.org>
Date:   Mon, 19 Dec 2022 15:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 00/13] Qcom: LLCC/EDAC: Fix base address used for LLCC
 banks
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andrew Halaney <ahalaney@redhat.com>, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        bp@alien8.de, tony.luck@intel.com, quic_saipraka@quicinc.com,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com
References: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
 <20221212192340.evgtbpzmw7hcdolb@halaney-x13s>
 <20221213052802.GB4862@thinkpad>
 <ec64e3a0-085d-7830-fd4e-6969c1c9bbdf@linaro.org>
 <20221213175738.GI4862@thinkpad>
 <195a55f1-76e7-3f00-da1f-4ae84f7943c0@linaro.org>
 <20221219135046.GA126558@thinkpad>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221219135046.GA126558@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/12/2022 14:50, Manivannan Sadhasivam wrote:
> 
>>> Also, the id table is
>>> an overkill since there is only one driver that is making use of it. And
>>> moreover, there is no definite ID to use.
>>
>> Every driver with a single device support has usually ID table and it's
>> not a problem...
>>
> 
> Are you referring to OF/ACPI ID table? Or something else?

No, I refer to the driver ID table (I2C, platform whatever the driver is).

Best regards,
Krzysztof

