Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 820636008D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 10:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbiJQIhu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 04:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiJQIht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 04:37:49 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 414906414
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 01:37:47 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id b18so13038574ljr.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 01:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2MOsGrPb54psCQ1QJFpQlc3AIz/KkigbI3AX0l8Zs84=;
        b=ALxyAy8pzannD55LWKsZcE2utLsNDwHOUKhtiRG/lPNJX0ZLo+si5+UuARQhzt9H16
         22lvSJkYyOxakAMB8HOPIHCRTKxLzP9N1xzZKkmPdcOB/brwscylpqqr5X+qChjnzw71
         cUVaqJmKi2KcCO6BLWliXqJDSRNdvFk5Y30vj9rF9HtHjhPQioJD8LQzQuy+xeX1vTvZ
         2zfW6BZRuv+u2BrNKN8J1XU6dFsKFIobeymG6R92PZK2KMu6WH9Wgyd3BCXSmkL1WpnM
         oEU3Bw4bVmRefPPrmcjzdwd4mGlMvAG69Qg2ePZzf9XfmPirfSnWA0U4ms69HZV79e3k
         xJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2MOsGrPb54psCQ1QJFpQlc3AIz/KkigbI3AX0l8Zs84=;
        b=F6HDS8iPOIZdWPzjQT9kR98T3xub8qPaRNeGPehGvsL5NTKcK7gcoWz4EqXDsFNiIy
         sossY0e2ZyEVY+YMbsPTT7DlbBCbAUUwkZNBcYvnVHiwPDKGYhH9xYHnTvW3QuxuBIhe
         uWie1Xc6zh6EWWBdJpfBmdq5rjPj3djxXS77rwDvVXy0jZCNEf/lxavu80psNKu0xof7
         b3CjPLMk1nmyMYHLmxebxgq7PpAgm51p8oW4vxdxSKRJGMAfFsvmOFC+mCo807Tg/iAl
         uimS601UQShwj2EMu7CZMZadZeA7fMX5J0HrICm07mc0gSKJJaQz76dXEnZ8htWSr9NR
         rNMw==
X-Gm-Message-State: ACrzQf12FLyEPLuwn0TpYzw1pspBiG4xRCoKbFBWwms/4VrOTFBHsFLh
        7wSitxmlMdvMaRAGZpJOZ4IiFA==
X-Google-Smtp-Source: AMsMyM4GnVMeqPIvzfl5GnZKWItxAUCifHNWN+MyMCMQhIv0vljSHccqiOWHDk4649xEexNvOp+Uyw==
X-Received: by 2002:a05:651c:178e:b0:25a:4357:49cd with SMTP id bn14-20020a05651c178e00b0025a435749cdmr3718914ljb.123.1665995865527;
        Mon, 17 Oct 2022 01:37:45 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a2e9f54000000b0026bca725cd0sm1398961ljk.39.2022.10.17.01.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 01:37:45 -0700 (PDT)
Message-ID: <726d5096-7997-05d2-d095-a349305607dc@linaro.org>
Date:   Mon, 17 Oct 2022 11:37:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 10/13] gunyah: rsc_mgr: Add resource manager RPC core
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221011000840.289033-1-quic_eberman@quicinc.com>
 <20221011000840.289033-11-quic_eberman@quicinc.com>
 <9a42be23-e035-0944-ba62-f6af6b7acc0d@linaro.org>
 <c0b57108-38b7-6d86-7dc5-18ab75f48de7@quicinc.com>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c0b57108-38b7-6d86-7dc5-18ab75f48de7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/10/2022 01:32, Elliot Berman wrote:
> 
> 
> On 10/12/2022 3:52 PM, Dmitry Baryshkov wrote:
>> On 11/10/2022 03:08, Elliot Berman wrote >> diff --git 
>>> +static int gh_msgq_platform_probe_direction(struct platform_device 
>>> *pdev,
>>> +                u8 gh_type, int idx, struct gunyah_resource *ghrsc)
>>> +{
>>> +    int ret;
>>> +    struct device_node *node = pdev->dev.of_node;
>>> +
>>> +    ghrsc->type = gh_type;
>>> +
>>> +    ghrsc->irq = platform_get_irq(pdev, idx);
>>> +    if (ghrsc->irq < 0) {
>>> +        dev_err(&pdev->dev, "Failed to get irq%d: %d\n", idx, 
>>> ghrsc->irq);
>>> +        return ghrsc->irq;
>>> +    }
>>> +
>>> +    ret = of_property_read_u64_index(node, "reg", idx, &ghrsc->capid);
>>
>> Is there any reason why can't you use platform_get_resource() here?
>>
> 
> These don't show up as resources because size-cells = 0.

Hmm, judging from of_device_alloc() / __of_address_to_resource(), the 
resources should still be created, unless I miss something.

-- 
With best wishes
Dmitry

