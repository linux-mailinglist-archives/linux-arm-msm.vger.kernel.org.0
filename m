Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91D2F6B5CD6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 15:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbjCKO34 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Mar 2023 09:29:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbjCKO3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Mar 2023 09:29:43 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CCF2413B
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 06:29:41 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id j3so5191340wms.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678544980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRTQw/9BNhOrTIPyX4pb03o+u72TXJpTw++ksWpJKxE=;
        b=AXMc1SAbNW422wU9J3c9q6KpO3ZLkxn8NCit8e+a+DGlhQAaR9y/shSptTXRr4svr3
         LG59ebc86gv7Hui11jgkIvjHnxtdvJ+Aea4S+hME9bBzzUzqvTvUHPRdecRd7G33F0Ku
         qN5XLoT8hcGI8vsWmBDd/jUYbdB8DAXCpUxnF8+xq+LgCpBbkezQ6fqAWCa6h3HgCJFR
         IvkyhbozI8tvhiQ64fqVYM8o8OSF2J2ShS3vGBBhpOU0YUQDRK5+dsKpT/hhSp+OQBZ7
         z+NrAlNuQX/hTLJlq6/DRG4NKwCbAu8GzqAAcF0lkAEKCLc1Co+Hq3YAHHbv7Sbq9za3
         QUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678544980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRTQw/9BNhOrTIPyX4pb03o+u72TXJpTw++ksWpJKxE=;
        b=4bxWl4lM9jEXL3rWZdHeKPZbWWMHKLjwLXKXVBdNf91wICNIEy1genHk5A/oodSbKT
         F8KqPqyYA/6LpyVyEtqu9MSKXVdGi3ftEhRN22sEdBhMdU/kcwuu6J4wUkbbEK337ewh
         Y714mycUmI+VtCIDveGzJZoq/LLtN4cDDWcvf75fYCJxqZFLovgZArvfTYrl3ecBLpUr
         gn5HgEE9Iek5ZCeihv65l95tUAum+V7V4AeZRqtwp4599JfIqc0Ancf2PAN4wM+Pwat0
         yRaWMs60P7kyMXkkuMytyQfL84PXVp4xi9a+F2Od1U/MagEvQ0+0PN3FsBUnL52R1pQK
         FWkA==
X-Gm-Message-State: AO0yUKWubvr6wUSZ2/x7VEGcsMuE5eS1CobXUsLNWbhxFfVO4Z555vW5
        fg+Ch2YMEOZrLWxEE6jV1miucg==
X-Google-Smtp-Source: AK7set/Me4mcO4YxTwFEzlYCQWVW7QshBnu/OHpBi11xdGXxyVJ4hYNS6p9PGJKMcJyDXsDRYY6q7w==
X-Received: by 2002:a05:600c:5253:b0:3eb:3b7e:7b82 with SMTP id fc19-20020a05600c525300b003eb3b7e7b82mr5779127wmb.27.1678544980037;
        Sat, 11 Mar 2023 06:29:40 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c469300b003e206cc7237sm3221589wmo.24.2023.03.11.06.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 06:29:39 -0800 (PST)
Message-ID: <f848061a-763e-fbf2-860c-758373e953df@linaro.org>
Date:   Sat, 11 Mar 2023 14:29:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 6/9] interconnect: qcom: rpm: Handle interface clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230228-topic-qos-v7-0-815606092fff@linaro.org>
 <20230228-topic-qos-v7-6-815606092fff@linaro.org>
 <68a5d81a-5de8-798a-c150-d74c8ad38cb7@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <68a5d81a-5de8-798a-c150-d74c8ad38cb7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/03/2023 14:01, Dmitry Baryshkov wrote:
>>
>> Limit the number of bus_clocks to 2 (which is the maximum that SMD
>> RPM interconnect supports anyway) and handle non-scaling clocks
>> separately. Update MSM8996 and SDM660 drivers to make sure they do
>> not regress with this change.
>>
>> This unfortunately has to be done in one patch to prevent either
>> compile errors or broken bisect.
> 
> Can we determine somehow if the intf clocks are required for the whole 
> NoC or just for a single node? I don't think that clocks like a0noc_ufs 
> are requiered to be up for the whole aggre_noc. Instead they probably 
> have to be enabled only when UFS makes use of the NoC (in other words 
> when is has voted for the bandwidth).

Its probably worthwhile experimenting to see if the *ufs*_clk can/should 
be added to the UFS device list of clocks.

I hadn't realised we were talking about enabling the intf clocks always 
but, actually that is what we are talking about isn't it ?

It seems pretty unlikely that other devices would depend on clocks named 
*ufs*

OTOH "clk-aggre2-noc-clk-no-rate" may be used across different nodes, 
seems like a pretty generic name, though still suspicious it is bundled 
with UFS, likely it is only required for UFS ?!?

Konrad can you try:

1. Moving the intf_clks/QoS clocks be contained to UFS alone ?
2. If that doesn't work just the *ufs* clocks be put there with
2a. "clk-aggre2-noc-clk-no-rate" alone added to the intf_clk list

It seems wrong to be enabling ufs related NoC clocks unless we are 
actually switching on UFS.

---
bod
