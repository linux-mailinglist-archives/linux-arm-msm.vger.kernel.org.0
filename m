Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB8E5F622D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 09:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbiJFH5j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 03:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbiJFH5i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 03:57:38 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7829589AE5
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 00:57:34 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y5so1529000lfl.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 00:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=2chuQJubRNdJDdp1cl9RnHgoqXHU1pT5hlr6URidjng=;
        b=U/JtaJ10VjlGiL/wxSq+7uUC0YzGXGyuKxVuX03CrCZWRPrfFRv6IpkAIbiT2Myhnd
         Uu/8PPnyucEpakdlaoj0ie1ZPu0EAtPc5bzf6E7eeZ3mSsvpeVGkAvqv1WrsKYryjMiL
         TYHBHTYDd0Hox6RrpHF3qOy65gTlZas845EXgoteSEQIhtUNqJa5397A5h2XbeRtLsW7
         6BmNH8UqonGuiPzx461QSyyRemsGi/ZZek6V1u4CD081qapPnyjgMkwHMO5GO1Ab2icI
         rQ9ffdcvlGdcUUq6IJp0hlxL2e8PwbMZmvxISZpOkMcVHewfSnVnmaGlofoMM1kEK+oT
         nYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2chuQJubRNdJDdp1cl9RnHgoqXHU1pT5hlr6URidjng=;
        b=mw5lCQoZgtfY9nM+Opl6BFzZhk2XsBN+3ZtAbeZ4daWQL+ZtgibEOKWV+tu0gx5APZ
         JqhP8H/LgmJNf4DpeRHovtLcKRuF4QSYUddwhu7Z1B1nLysGk6fdwGqmngN/K/D+WybG
         w1e1lBQfif8snloqZL+5RF4xS76mLNAZ/KhlyOWqWq811M8pFCKW+QoKScvaSrOMk8+l
         DiItXINZERXT9jD0PwZ7qdUX8c3Mn72WYnn55Z4k5560DhZ+VZXkqinXIHhgpCqcVsnB
         FQffY4Sl2y+PqUS+ADmw1RXXgDyqBFHqBYZXjHDfqsjKcs60XYhNAe4nFgWRs+hL3XUP
         jZAw==
X-Gm-Message-State: ACrzQf1HlZtuNz2FDBlPQnpSTejUU4LcPHra745OLNtvcPFQ1Tvw4mgJ
        Ljk39riruJF7Yw4msalQ966JnA==
X-Google-Smtp-Source: AMsMyM68eGfFa+0mtU08JX2IwKZzneavnZOjkLmX/YGBXmC5UCvuBCAu7d0S9FdlSTKLAW0B5c/D2g==
X-Received: by 2002:a19:7003:0:b0:4a2:40b9:de8d with SMTP id h3-20020a197003000000b004a240b9de8dmr1453658lfc.0.1665043052858;
        Thu, 06 Oct 2022 00:57:32 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k2-20020a05651239c200b0049876c1bb24sm2601388lfu.225.2022.10.06.00.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 00:57:32 -0700 (PDT)
Message-ID: <0e5438a6-80ba-ace6-b10a-df292c3e82b7@linaro.org>
Date:   Thu, 6 Oct 2022 09:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: Qualcomm DT bindings and DTS cleanups - tracking community wide
Content-Language: en-US
To:     Trilok Soni <quic_tsoni@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Vinod Koul <vinod.koul@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Caleb Connolly <kc@postmarketos.org>
References: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org>
 <faa4e821-00e0-4ee0-0c62-b5eb6f75abf7@linaro.org>
 <943ec4f3-e6a4-7614-fb6f-1adce1487857@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <943ec4f3-e6a4-7614-fb6f-1adce1487857@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/10/2022 18:37, Trilok Soni wrote:
>>> If so, where?
>>> A. elinux.org (needs some formatting when pasting the output from tools)
>>> B. gitlab pages/wiki (maybe scripts could parse tools and create the page?)
>>> C. gitlab dedicated repo - some text file
>>> D. Linux kernel TODO file (might be difficult to keep updated)
>>> E. kernel.org wiki (requires LF accounts, AFAIK, a bit pain to edit; I
>>> have it for Exynos but I don't find it usable -
>>> https://exynos.wiki.kernel.org/todo_tasks)
>>
>>
>> Hi All,
>>
>> Any thoughts on this? So far I did not receive any responses, so
>> probably this could mean that there is little interest in this?
> 
> My preference for tracking is gitlab. B or C. Everyone will have login 
> and understands the workflow.

Thanks Trilok for the input.

Best regards,
Krzysztof

