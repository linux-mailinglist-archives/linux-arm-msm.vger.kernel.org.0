Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13F56580331
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 18:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236608AbiGYQ4m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 12:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236478AbiGYQ4m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 12:56:42 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D73DEB9
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 09:56:40 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id b16so6501315lfb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 09:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=FsuTzaaPK5e0cYsKq7XYkHCLfJ+m3/TH+G1ZydhMB/s=;
        b=v5bTyl8xzF0uEr1oIJkWF72ebY7+9goAiiLXHg7XQC4qZrhuveEbPjPy77HOTMShOP
         XIs6GLlTInKobHIDOMKHOgRLzX54CLV/Xh3kjnEUqpjAUzHLJEdBq8fQ/m4Sx0LfpNEU
         zz1MVgDdVrtuhl0VwetiSUt10LrFpsAIEFFJIX42OEsHjsUqp5lbUhlLioayrMHlCGqL
         JCwpOkRJcEsNxbrwymfTZ8Dzxbushxcx1G6a04oaf1JmXQ7anXqh+wFw8ghKCc30uWVj
         1BYIRoWcT9msffpfGhtoKli7lidI80TZXKVx+O7/yjqN6QxruOevEajJ05buajAB+3n5
         4H5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=FsuTzaaPK5e0cYsKq7XYkHCLfJ+m3/TH+G1ZydhMB/s=;
        b=e+2pv++JeP9yEHnewoTBGHXiriGVFPFN9j5e1aHsaXDjMgV1r5h6I31RHfX7gVCfNV
         jqhAqtnoN7yXLL+uAaHfXvo25rn/Vlq9t5hcHYSMgESSc6KYgMQ7mNPV2+rGNm3FuFPF
         sgM5jhO6Trmx9/CMepVKE7ik0bwJxRZTBT1LOhQk1UkgahBLv07ng/z/gsPSaxWbnKI7
         UCLewrWzzjKAKhpPnU8gYluNI5wW4BhxjRW3VshtbpxJM1IApcGMOvm0K06sR1TP+P7y
         NMtOu2pho/J0Kioh92IlioSyTJe78t4Ri+MHcJqzh97puc91aaK6Kct+uWWPLBhKgjTD
         fw0g==
X-Gm-Message-State: AJIora+PeSNwmeGeyY1WNn6MQUgsJFKNtOj8xtaYXMhu0buTR5EsJegA
        4XtugMxT8zVZ+DqCe55s3o4NgA==
X-Google-Smtp-Source: AGRyM1uzUzqdl7KeilDJN/k0QNKBXacT9Z3RiGpNvmGNY/h1+JIGCx6qZPwl8GG0hhtJ6k7pGMhwpA==
X-Received: by 2002:a05:6512:22d2:b0:489:dac8:3422 with SMTP id g18-20020a05651222d200b00489dac83422mr4998003lfu.317.1658768198622;
        Mon, 25 Jul 2022 09:56:38 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id u11-20020ac258cb000000b0048a884bdb84sm873549lfo.52.2022.07.25.09.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 09:56:38 -0700 (PDT)
Message-ID: <4298c7a7-b730-635f-ae32-4662935c767f@linaro.org>
Date:   Mon, 25 Jul 2022 18:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom: define schema, not devices
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Doug Anderson <dianders@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
 <b1aafb00-f00a-2621-ad51-fb2f7491dace@linaro.org>
 <CAA8EJpp_tSCR3CLGSD_qq62MzjVQOYGspY345aNfNSu1tMM=Vw@mail.gmail.com>
 <CAD=FV=WGtDMmB08py8D6jc0cv3xGsn5Rfc0MObQbEV=CiisBYg@mail.gmail.com>
 <76defcb3-8566-286a-d953-54c4a2b04782@linaro.org>
In-Reply-To: <76defcb3-8566-286a-d953-54c4a2b04782@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2022 18:41, Krzysztof Kozlowski wrote:
> On 25/07/2022 18:25, Doug Anderson wrote:
>> Let's look specifically at the device tree file for the LTE board. One
>> way to look at it is that the dts for the LTE board should have
>> compatibles:
>>   compatible = "lte", "wifi-only"
>>
>> The above matches the normal device tree mentality. It says: "hey, if
>> you've got a lte driver for this board then use it; otherwise use the
>> wifi-only driver".
>>
>> However, the above is actually broken for the bootloader use case. The
>> bootloader is trying to pick a device tree and, to the bootloader, the
>> above says "you can use this dts for either an lte board or a
>> wifi-only board". That's bad. If the bootloader picks this device tree
>> for a wifi-only board then the OS will try to initialize lte and
>> things will crash. To go further, if you think about it things
>> actually work fine if the wifi-only device tree says it's compatible
>> with the LTE board. This is why I say it's opposite... ;-)
> 
> This is not specific to "bootloaders" but your specific implementation
> of entire chain. How you described it, you have dependent pieces -
> user-space must use the same DTB as bootloader chosen, but bootloader
> makes different choices than user-space. It's perfectly fine to make
> these choices different, but then user-space should not depend on
> something which was/was not initialized in bootloader.
> 
> IOW, if bootloader picked up generic WiFi compatible and user-space will
> crash if picking up specific comaptible, you have a dependency and
> user-space should probably bind to modified DTB, where LTE comaptible is
> removed.
> 
> Other systems - I would say most of them - are independent, IOW, we try
> to make kernel and user-space independent of what bootloader did,
> because we are never sure what bootloader actually did and what DTS it
> received.

You can BTW compare it nicely to Linux device driver binding. If a
driver binds to more generic (WiFi) compatible, it is not allowed to use
any features/code related to more specific compatible (LTE).

Your case breaks this rule. Bootloader bound to generic (WiFi)
compatible, but it passed entire DTB/FDT to kernel/user-space which can
then run code for more specific compatible.

Although I understand the point the board compatibles by themself
provide little help for such use case.

Best regards,
Krzysztof
