Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 898A87C4258
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 23:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343946AbjJJVWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 17:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232348AbjJJVWz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 17:22:55 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711C594
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 14:22:52 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50435a9f800so7995458e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 14:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696972971; x=1697577771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=06Lp0WCZvxnhJjMgMz9Il1mud7dNhX7GFtXqKwDTNOU=;
        b=O7GsweDw8taTwVwTmHS/6RspsgTSAnfNstXbzN8qjKdrgwjOt/YGp8RkUs9CNBjHY6
         qlmD74RaO31GNI9tXsHQUynVh6P25y40Gr131T9t5Zthjemzw/MRUQea+R+L/am+Bkh3
         JOenPLx+8j2vYtjH4E24aIwGMcFzLM8XYz2uAYzNY7n8UuLij15kZOPgwW74ZgRJy+Qo
         RP+qnQuExm5isOwTRGpZ+/VpeIyJPSDbhWdfAdl+jsGX6KKBcbOTRMERpAP/yWH25roY
         INzwbbShwMAaHkmplHYQIF3PcmGxTIYQM8D3zJQ2YYG87arUnpE9Ne6ZyMo4IA0hrmX7
         Z6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696972971; x=1697577771;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=06Lp0WCZvxnhJjMgMz9Il1mud7dNhX7GFtXqKwDTNOU=;
        b=JWtOs8koEKOlqRpUGOpROShDlzPfOMlbfbyNIGleYBmA/uDNhYXNE3Uwt6YRzTxA7s
         c+SAnr4e5s2KR2JGyvXxckkWLOBmMt8151O4e5Ep+ibCGFBSg1CfcMLDkJ9yzEDt0o03
         MQZdCsmJc9nWdF35/vgdN9R/85dlXCdTFULHBMr8mjMk0Qt7tJCEWXUtJuPxLxw5/4YM
         J49PFGh7cpB5mpb/p1TMWY2nNUMjlMFHMEZuMPF2KkQksr4qk48Xs8dgcIuSlCaF7k+B
         vBG+HBqCiOR36m/cvqMGD8n9o+dpVelrfY+qcxZrZcW/GrF8pv/HOtXJfdJDHO+FWmyl
         MUgQ==
X-Gm-Message-State: AOJu0Yy9yH7VvnG81tLJcct9kBtZZUTKpabB/0nJgWRFdkka63D+u9SQ
        YY5nGu3QZIHHaEjLQ/Hm8jaNEQ==
X-Google-Smtp-Source: AGHT+IGLRPG73kLueeBzDlF9R6wNaWzYlXINqFh4u3TbG++0qrZ4apZnOTWkitSIrQVBa8PRGtRqGQ==
X-Received: by 2002:a05:6512:e9a:b0:505:6ede:20a9 with SMTP id bi26-20020a0565120e9a00b005056ede20a9mr19273420lfb.65.1696972970108;
        Tue, 10 Oct 2023 14:22:50 -0700 (PDT)
Received: from ?IPV6:2a00:f41:8004:ab80:24a8:5e5d:e0b2:5884? ([2a00:f41:8004:ab80:24a8:5e5d:e0b2:5884])
        by smtp.gmail.com with ESMTPSA id d26-20020ac25eda000000b004fde41a2059sm1954073lfq.305.2023.10.10.14.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 14:22:49 -0700 (PDT)
Message-ID: <a6f0c714-37c7-4df6-96d6-e070a1c75fc3@linaro.org>
Date:   Tue, 10 Oct 2023 23:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: smd: Disable unused clocks
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231004-clk-qcom-smd-rpm-unused-v2-1-9a5281f324dc@kernkonzept.com>
 <bc8fa799-aa64-4b69-97ce-8f1872c8eb11@linaro.org>
 <ZSRfc_w19h-55Bib@gerhold.net>
 <da02414c-a151-464b-8976-d353c6da7b8e@linaro.org>
 <ZSXAY5mbXB7Gbz2x@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZSXAY5mbXB7Gbz2x@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/10/23 23:21, Stephan Gerhold wrote:
> On Tue, Oct 10, 2023 at 10:45:15PM +0200, Konrad Dybcio wrote:
>> On 10/9/23 22:15, Stephan Gerhold wrote:
>>> On Fri, Oct 06, 2023 at 11:08:39PM +0200, Konrad Dybcio wrote:
>>>> On 4.10.2023 14:10, Stephan Gerhold wrote:
>>>>> At the moment, clk-smd-rpm forces all clocks on at probe time (for
>>>>> "handoff"). However, it does not make the clk core aware of that.
>>>>>
>>>>> This means that the clocks stay enabled forever if they are not used
>>>>> by anything. We can easily disable them again after bootup has been
>>>>> completed, by making the clk core aware of the state. This is
>>>>> implemented by returning the current state of the clock in
>>>>> is_prepared().
>>>>>
>>>>> Checking the SPMI clock registers reveals that this allows the RPM to
>>>>> disable unused BB/RF clocks. This reduces the power consumption quite
>>>>> significantly and is also needed to allow entering low-power states.
>>>>>
>>>>> As of commit d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out
>>>>> interconnect bus clocks") the interconnect-related clocks are no longer
>>>>> managed/exposed by clk-smd-rpm. Also the BI_TCXO_AO clock is now
>>>>> critical (and never disabled).
>>>>>
>>>>> There is still a slight chance that this change will break boot on some
>>>>> devices. However, this will be most likely caused by actual mistakes in
>>>>> the device tree (where required clocks were not actually specified).
>>>> Precisely this, and solely as a consequence of the interconnect driver
>>>> not covering all the required clocks (usually named GCC_SOME_NOC_XYZ_CLK,
>>>> but there's quite a lot more).
>>>>
>>>> For platforms without an interconnect driver, breaking stuff this **MOST
>>>> LIKELY** means that Linux uses some hw that isn't voted for (e.g. missing
>>>> crypto clock under scm or something).
>>>>
>>>> For those with an interconnect driver, this will uncover issues that were
>>>> previously hidden because of the smd-rpm interconnect being essentially
>>>> broken for most of its existence. I can smell 660 breaking from however
>>>> many miles you are away from me, but it's "good", as we were relying on
>>>> (board specific) magic..
>>>>
>>>> I've been carrying an equivalent patch in my tree for over half a year now
>>>> and IIRC 8996 was mostly fine. It's also a good idea to test suspend
>>>> (echo mem > /sys/power/state) and wakeup.
>>>>
>>>
>>> I didn't notice any problems on 8916 and 8909 either. :-)
>>>
>>>> For reasons that I don't fully recall, I do have both .is_prepared and
>>>> .is_enabled though..
>>>>
>>>
>>> clk-smd-rpm doesn't have any .enable()/.disable() ops (only .prepare()
>>> and .unprepare()) so I don't think is_enabled is needed. For the unused
>>> clock cleanup in drivers/clk/clk.c (clk_disable_unused()) we just care
>>> about the clk_unprepare_unused_subtree() part. That part is run when the
>>> clock reports true in .is_prepared(). The equivalent for .is_enabled()
>>> would just be a no-op because there are no .enable()/.disable() ops.
>> Oh I found out why :D
>>
>> """
>> The RPM clock enabling state can be found with 'enabled' in struct
>> clk_smd_rpm. Add .is_enabled hook so that clk_summary in debugfs
>> can a correct enabling state for RPM clocks.
>> """
>>
> 
> I see, thanks! I think you should see at least the "prepared" state with
> this patch. I'm not entirely convinced we should implement .is_enabled()
> if we don't actually do anything on .enable()/.disable().
> 
> Anyway, given that the debugfs state is not directly related to the main
> objective of disabling unused clocks I think that would be better
> discussed in a separate patch later. :)
Agreed

Konrad
