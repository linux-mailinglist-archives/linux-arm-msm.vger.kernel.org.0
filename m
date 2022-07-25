Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D226580382
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 19:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235373AbiGYR3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 13:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiGYR3W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 13:29:22 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB47E02C
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:29:21 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id p11so14291717lfu.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RzKa2RWbALZsP2K2txIX8cby/e3aK0JnhlNvQouxHPY=;
        b=NYdlPOvLyHfwAnDwiWOFCW97w8U2PRYSfD712AzGHptvDbEb+IdAxNofpqTdaa6lJC
         LzFe1TNTLNV8oH+NS5NWV2VaazO/lCLoT1pL1dx1hxOujudCTfInMFRdT1HP5nnXPujz
         s8Gp0SZ8qCGSGGwILmnGg20R+f6W+2UkcpBCH0/r5mBYcW+dDiVrZZmA2YvKDM6fwmYO
         L4tuKquGq9I/m/IfCSyXYvZWRmutI0chXq/uV3yXb07upVhcgPphXX5VxvZ+lwEdAYH6
         MPP5GwEmgWfUGpI237vTwwlrjBsiKdjG43cex1iA2/V3qYiZq9WOvYrpx9i5/d1C04qT
         K0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RzKa2RWbALZsP2K2txIX8cby/e3aK0JnhlNvQouxHPY=;
        b=DcnQy3nnxwn7eRa3HIFdUzggq2FRiTz0VDjTT3KQBmiPvy5SnmOiOKuy3FPBbH0eyn
         BYez6o9jKSq7Wmv4jZn14yCA/14fsLI0MRcmS5MU/md4gk8K0CdhCp9KtI0zdLxFV3pr
         NuDv+Bwqakl7ez2432L7ohCRI8bquix6zTq6pukDGlTSXzdv31CMAna0RjD+CvJ6xNAF
         P/ii9XuJB1V6h3pqTXkmRziTpE8Ru1pX1MUPpkIjCrmTNA/s2KtPgCQm8yyX6qeLruBX
         N7jHBwMWMXRdcyGz+t+9K0/sKjLFbdrMFBF5cIc7XJsxIhVUhP5+hERokDsW9tmbbSvc
         xWqw==
X-Gm-Message-State: AJIora8X6IX/GNmkyq07GMkSSwOOiMFDBexmAO9X0CDpuJj/5aMBDIS4
        bnJoNUH0ftnISdbPgnP8R4sJdA==
X-Google-Smtp-Source: AGRyM1s2gTTMuvH9HxEw8WhAv17+RDOoe0fKIl02r8CnJrOi2nTPX3mtHaax4QGUBATI0eEApxm7lQ==
X-Received: by 2002:a05:6512:463:b0:48a:9605:c3e7 with SMTP id x3-20020a056512046300b0048a9605c3e7mr1242361lfd.514.1658770159482;
        Mon, 25 Jul 2022 10:29:19 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id t9-20020a056512208900b0048a78c1fc1dsm1980772lfr.111.2022.07.25.10.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 10:29:19 -0700 (PDT)
Message-ID: <e3878d93-7c66-1018-ddfc-ab7fd9be1936@linaro.org>
Date:   Mon, 25 Jul 2022 19:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom: define schema, not devices
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
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
 <CAD=FV=XhYD0U=FAaGV0aLJhZ4LrULXrLptDV7=D8A91Kx=Qkgg@mail.gmail.com>
 <e3eb02f4-daf7-ed69-001f-72a275819af5@linaro.org>
 <CAD=FV=WYshw8tcDb7dRS-CRdH1q2BOp0g74_qKtvKa1Lzo+mcg@mail.gmail.com>
 <9e012a76-aaab-9525-f3d4-8d84e26325a9@linaro.org>
 <CAD=FV=XiJd6G0-QExB=SPDNx3TNFyFjyPvUGdkkBGPEe4XYiEw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=XiJd6G0-QExB=SPDNx3TNFyFjyPvUGdkkBGPEe4XYiEw@mail.gmail.com>
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

On 25/07/2022 19:22, Doug Anderson wrote:
>>>> You cannot do that...
>>>
>>> The bootloader never falls back to just the SoC name.
>>
>> There is no "SoC" part of compatible list. Only by convenience we put it
>> that way, but DT spec does not define first compatible to be for
>> platform because they all are[1], therefore following your earlier
>> description - bootloader should load BAR DTS on FOO device just because
>> qcom,sdm845 matches.
> 
> As documented in "Documentation/arm/google/chromebook-boot-flow.rst",
> the bootloader creates a match list to pick a device tree file. It
> never creates a match list that has just the SoC. It always picks
> based on the board name and never falls back to just the SoC name.

So this means you embedded some custom-interpretation of board
compatibles in bootloader. What stops you to customize it even more,
that the bootloader must always pick the most specific compatible? IOW,
it cannot load DTB from more generic compatible (just like it should not
load qcom,sdm845 DTS)?

I understand the limitation of board compatibles for your case, but I
still believe it is wrong usage of it.
If the usage - by principle - was correct, then you would not need to
add the restriction you mentioned above ("never creates a match list
that has just the SoC").

Because when Linux drivers match, they do not have such restriction...

Best regards,
Krzysztof
