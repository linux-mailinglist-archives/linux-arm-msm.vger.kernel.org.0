Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCCF66ABF43
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 13:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjCFMPA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 07:15:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjCFMO7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 07:14:59 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFAC29E22
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 04:14:28 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so8015607wmb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 04:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678104867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=chYVG4ctHS8jN89OwKwB7lZgPIoSMpkGDYMXo1jvpNE=;
        b=uTBkdUMcvsCLVtqXJ5Viw8JEHRptBgFXrV9rMo8BX6sN5sw+zhWjsXIXD6ohTgsTxN
         OQm24Cen+TUX/mLBG1RuAXB2UVQkCymUK8S2CK7s7Bz3k4sAyd00r5GLtQKM/rC3hnrp
         i/AsP72rzyitEU42XPA9PVdlEve7rkqno0KvzJHHGEAqKHU4LI8gBy32m5H0jrucfoaV
         YUqA7RVW4VwoBhTYyh/ESk5MIBV/iOisH3q/pSkOYJgA26r45DJnzFghczDTPDP94Hod
         dhU9hlBhJvQvmkcQctEzoaKdKGSoBAlK5J/7FQFvX2Nf6VKh08X4aX0oChQ/fuF6nEfE
         p/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678104867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chYVG4ctHS8jN89OwKwB7lZgPIoSMpkGDYMXo1jvpNE=;
        b=JFS5uuMR/GNafG2jGJflPfxkrW5bdumU4cf9FJ4iMoSjejgM2hmw3Kms4OjB6wny13
         eprS4kbw8aSEcAiApWkW2YWmHXZCJ8WlZsAJPLwPGI3wJ9oUGWG2RBCK79iMtMhqumcO
         dSkAwFzFfowAKXkMnLk6HuHBAmxs4HxZV487TPT8a9rwRA0RQRxvJhR6vvNQ7TF1m81r
         f7RyZnwKfNp2OIgXCl+wt/l2EQAe+LFTLwcYR3QB6P2rCoYZWy/4gEBE3Pfdc0djpGlF
         ntLwJu6d+dCwKFZrXI96WuN8aB7n7SEzhp4sKe7/jtAGJgLZ8oZ8eQr82P3PW4D6IiFC
         mgEA==
X-Gm-Message-State: AO0yUKW074pJynNMwurbxpxIMK5EKJeR3s9Uqhq3X697ADqRjvLgGy9Y
        qSyICIBJ6UUmJrkrEFk5Uk5liqud+DY0UMqRLh6uMA==
X-Google-Smtp-Source: AK7set/QyR7ajHz3gCHTSVphbxMfwcdM+gQGH5nQE0GokhJJZ6mEmzZgl7XRnXwr/mpqzkhnV0ebxQ==
X-Received: by 2002:a05:600c:4f51:b0:3dc:4318:d00d with SMTP id m17-20020a05600c4f5100b003dc4318d00dmr8516081wmq.11.1678104867189;
        Mon, 06 Mar 2023 04:14:27 -0800 (PST)
Received: from [10.203.3.194] ([185.202.34.81])
        by smtp.gmail.com with ESMTPSA id g18-20020a5d4892000000b002c70e60abd4sm9430682wrq.2.2023.03.06.04.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 04:14:26 -0800 (PST)
Message-ID: <de172647-8261-3f8e-2aa7-a1c47b307c8e@linaro.org>
Date:   Mon, 6 Mar 2023 14:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: mfd: qcom-spmi-pmic: add pm8450 entry
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230306112129.3687744-1-dmitry.baryshkov@linaro.org>
 <518fd95b-4b8c-108b-8525-4ffd093380f0@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <518fd95b-4b8c-108b-8525-4ffd093380f0@linaro.org>
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

On 06/03/2023 14:11, Krzysztof Kozlowski wrote:
> On 06/03/2023 12:21, Dmitry Baryshkov wrote:
>> Add bindings for the PM8450 PMIC (qcom,pm8450).
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> https://lore.kernel.org/all/20221217003349.546852-2-dmitry.baryshkov@linaro.org/
> 
> Keep changelog and tags.

Argh. I stumbled upon the patch in the sm8450 branch and thought that I 
forgot to include it for some reason. But it seems the problem was that 
I didn't include correct maintainer (Lee).

Lee, how should I proceed? Should I resend a patch with proper tags?

-- 
With best wishes
Dmitry

