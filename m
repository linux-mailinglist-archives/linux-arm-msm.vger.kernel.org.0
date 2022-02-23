Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11CD54C1627
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 16:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235355AbiBWPIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 10:08:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbiBWPIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 10:08:51 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 68054A6534;
        Wed, 23 Feb 2022 07:08:22 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1FE2ED1;
        Wed, 23 Feb 2022 07:08:21 -0800 (PST)
Received: from [10.57.40.147] (unknown [10.57.40.147])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 083703F5A1;
        Wed, 23 Feb 2022 07:08:18 -0800 (PST)
Message-ID: <e0bc8dd2-bea9-354b-3b48-3123e0bbf717@arm.com>
Date:   Wed, 23 Feb 2022 15:08:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [RFT PATCH 0/3] Fix kfree() of const memory on setting
 driver_override
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
 <636e5b92-8ed8-35a1-d6e9-516d5b35be91@canonical.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <636e5b92-8ed8-35a1-d6e9-516d5b35be91@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-02-23 14:22, Krzysztof Kozlowski wrote:
> On 23/02/2022 15:04, Robin Murphy wrote:
>> On 2022-02-22 14:06, Krzysztof Kozlowski wrote:
>>> On 22/02/2022 14:51, Rasmus Villemoes wrote:
>>>> On 22/02/2022 14.27, Krzysztof Kozlowski wrote:
>>>>> Hi,
>>>>>
>>>>> Drivers still seem to use driver_override incorrectly. Perhaps my old
>>>>> patch makes sense now?
>>>>> https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/
>>>>>
>>>>> Not tested - please review and test (e.g. by writing to dirver_override
>>>>> sysfs entry with KASAN enabled).
>>>>
>>>> Perhaps it would make sense to update the core code to release using
>>>> kfree_const(), allowing drivers to set the initial value with
>>>> kstrdup_const(). Drivers that currently use kstrdup() or kasprintf()
>>>> will continue to work [but if they kstrdup() a string literal they could
>>>> be changed to use kstrdup_const].
>>>
>>> The core here means several buses, so the change would not be that
>>> small. However I don't see the reason why "driver_override" is special
>>> and should be freed with kfree_const() while most of other places don't
>>> use it.
>>>
>>> The driver_override field definition is here obvious: "char *", so any
>>> assignments of "const char *" are logically wrong (although GCC does not
>>> warn of this literal string const discarding). Adding kfree_const() is
>>> hiding the problem - someone did not read the definition of assigned field.
>>
>> That's not the issue, though, is it? If I take the struct
>> platform_device definition at face value, this should be perfectly valid:
>>
>> 	static char foo[] = "foo";
>> 	pdev->driver_override = &foo;
> 
> 
> Yes, that's not the issue. It's rather about the interface. By
> convention we do not modify string literals but "char *driver_override"
> indicates that this is modifiable memory. I would argue that it even
> means that ownership is passed. Therefore passing string literal to
> "char *driver_override" is wrong from logical point of view.
> 
> Plus, as you mentioned later, can lead to undefined behavior.

But does anything actually need to modify a driver_override string? I 
wouldn't have thought so. I see at least two buses that *do* define 
theirs as const char *, but still assume to kfree() them.

>> And in fact that's effectively how the direct assignment form works
>> anyway - string literals are static arrays of type char (or wchar_t),
>> *not* const char, however trying to modify them is undefined behaviour.
>>
>> There's a big difference between "non-const" and "kfree()able", and
>> AFAICS there's no obvious clue that the latter is actually a requirement.
> 
> Then maybe kfreeable should be made a requirement? Or at least clearly
> documented?

Indeed, there's clearly some room for improvement still. And I'm not 
suggesting that these changes aren't already sensible as they are, just 
that the given justification seems a little unfair :)

Even kfree_const() can't help if someone has put their string in the 
middle of some larger block of kmalloc()ed memory, so perhaps 
encouraging a dedicated setter function rather than just exposing a raw 
string pointer is the ideal solution in the long term.

Cheers,
Robin.
