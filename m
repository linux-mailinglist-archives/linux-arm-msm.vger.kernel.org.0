Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7CD14C154D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 15:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239124AbiBWOXY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 09:23:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234730AbiBWOXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 09:23:23 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A95B18B9
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 06:22:55 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 47F863FCA8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 14:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645626167;
        bh=UkXoPF9GFsyAWsCPL3ryOH3fKN9jJKmB8GGxrcEoohU=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=KprZCbbn9roHI76H3j/ZoMkRIaG+CEATaMj+2Zz8rEdG9iHpHB0b5QiRpqTrY/bVj
         nZI2AdL2jNVcY0KA/s1yh/EtXgtzjRzKQS47WKnxXg9sNcUVVDBNOw7uFYsdHJJGIy
         WvwsVL+Kgv+wpyfNwLE1rs9FgEbK5vuUUtbp0kcVdi9HTKYsKJjoZPkevXORaKD2P3
         AU5qH9Efl8faRmCz71Fsrd9M13G52a56P37CML/QUFaKGneArevM+LaKZY88/Tz4Ru
         mPIdF8H0eKkXO5NyWcsgCnWHrItwE4uaCNeoYbwdcBQUdIe+bAEkl7T5fgqHwUv8XB
         WiK+ELItfF/kA==
Received: by mail-ed1-f70.google.com with SMTP id n7-20020a05640205c700b0040b7be76147so13650229edx.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 06:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UkXoPF9GFsyAWsCPL3ryOH3fKN9jJKmB8GGxrcEoohU=;
        b=LSzEpJWSWO1CZY7PaTYTfrtSY63EtXKBzhJjSs4/QGBnWOgAhFd/8Kvl3F7NjM8XWA
         V+ApaPUx+ImBH72XCI+tyn8C5A5aNTxhkbtaB8KI8nQLclndbycCc7NLbuu4ZEtbqYIQ
         nU9sn1jJyZAsGCVtKg0iLTsnp148+QZur6AahSpwXbdjrkKtkK5deNkJ7+mTm5mBC/uX
         4dH3Wz9d0dOeoGLAy1/XgFHVwWD1okA8jH6aFLz3rNlDZ0UTpI/TPlP1nXwudw8EWM2k
         1AFu6V1lu1V/KhpN7WkCNwP8fXDyNIIaLqspQUTSQdDdulN5YwsoMuur35JwLbFnXyGL
         eg5A==
X-Gm-Message-State: AOAM532d92AO+CfdjqkLA75D4YFFgDGTd2ZZ3p/MjtxRZZExvsm8M3de
        VbVUVE5Pb36P+Hf0TZ39mJmUNp5SW2gYqeEWbQVf1pi3jB9dAKkvJ8muLEiiJxXRYw8WwkRy+H8
        3FlmAELl5LUVDZrNAW/s0bmoKetJ03p/4Hqi4Xpo/Xfg=
X-Received: by 2002:a05:6402:1cae:b0:410:d3ae:3c8a with SMTP id cz14-20020a0564021cae00b00410d3ae3c8amr30820292edb.215.1645626166977;
        Wed, 23 Feb 2022 06:22:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1+uin+sD6tlXUeggUaMrdcvpbhQG85O0fMULNFHN+DWoNxV6JXqumR8Csk+bhXTmYR8AoJw==
X-Received: by 2002:a05:6402:1cae:b0:410:d3ae:3c8a with SMTP id cz14-20020a0564021cae00b00410d3ae3c8amr30820260edb.215.1645626166707;
        Wed, 23 Feb 2022 06:22:46 -0800 (PST)
Received: from [192.168.0.125] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id hp7sm2475722ejc.144.2022.02.23.06.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 06:22:45 -0800 (PST)
Message-ID: <636e5b92-8ed8-35a1-d6e9-516d5b35be91@canonical.com>
Date:   Wed, 23 Feb 2022 15:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFT PATCH 0/3] Fix kfree() of const memory on setting
 driver_override
Content-Language: en-US
To:     Robin Murphy <robin.murphy@arm.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
 <708eabb1-7b35-d525-d4c3-451d4a3de84f@rasmusvillemoes.dk>
 <afa7001d-901e-55bf-b8dc-77051b1e7f78@canonical.com>
 <0442526f-b6d9-8868-ac1c-dd11a2d3b2ab@arm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <0442526f-b6d9-8868-ac1c-dd11a2d3b2ab@arm.com>
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

On 23/02/2022 15:04, Robin Murphy wrote:
> On 2022-02-22 14:06, Krzysztof Kozlowski wrote:
>> On 22/02/2022 14:51, Rasmus Villemoes wrote:
>>> On 22/02/2022 14.27, Krzysztof Kozlowski wrote:
>>>> Hi,
>>>>
>>>> Drivers still seem to use driver_override incorrectly. Perhaps my old
>>>> patch makes sense now?
>>>> https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/
>>>>
>>>> Not tested - please review and test (e.g. by writing to dirver_override
>>>> sysfs entry with KASAN enabled).
>>>
>>> Perhaps it would make sense to update the core code to release using
>>> kfree_const(), allowing drivers to set the initial value with
>>> kstrdup_const(). Drivers that currently use kstrdup() or kasprintf()
>>> will continue to work [but if they kstrdup() a string literal they could
>>> be changed to use kstrdup_const].
>>
>> The core here means several buses, so the change would not be that
>> small. However I don't see the reason why "driver_override" is special
>> and should be freed with kfree_const() while most of other places don't
>> use it.
>>
>> The driver_override field definition is here obvious: "char *", so any
>> assignments of "const char *" are logically wrong (although GCC does not
>> warn of this literal string const discarding). Adding kfree_const() is
>> hiding the problem - someone did not read the definition of assigned field.
> 
> That's not the issue, though, is it? If I take the struct 
> platform_device definition at face value, this should be perfectly valid:
> 
> 	static char foo[] = "foo";
> 	pdev->driver_override = &foo;


Yes, that's not the issue. It's rather about the interface. By
convention we do not modify string literals but "char *driver_override"
indicates that this is modifiable memory. I would argue that it even
means that ownership is passed. Therefore passing string literal to
"char *driver_override" is wrong from logical point of view.

Plus, as you mentioned later, can lead to undefined behavior.

> 
> And in fact that's effectively how the direct assignment form works 
> anyway - string literals are static arrays of type char (or wchar_t), 
> *not* const char, however trying to modify them is undefined behaviour.
> 
> There's a big difference between "non-const" and "kfree()able", and 
> AFAICS there's no obvious clue that the latter is actually a requirement.

Then maybe kfreeable should be made a requirement? Or at least clearly
documented?


Best regards,
Krzysztof
