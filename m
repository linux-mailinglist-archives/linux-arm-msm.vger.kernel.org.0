Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 758FD4FCC67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 04:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236267AbiDLCU3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 22:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239320AbiDLCU1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 22:20:27 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B37433E34
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 19:18:10 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id g21so20800704iom.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 19:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=srFoickd1zlR+kJjOTObZ61tAEx/5+zynW0TfHZUqk4=;
        b=gCKdLNuZBSmjfleHx7DWHk2dt/R22/YnwJEkeczkHmul3xFo7Avio96a80MTlR5FdW
         kt/AKIj/b20OuGyMzwtRhr0kR8aUMwJjLbVeO0mlQg/T8O1ENVRgwu1GbqDr+KujeX5e
         DcjRoRCndOzZw3olTMnGOfBqE8R/iJG0zGgyjyzKwoIUFYj7FuEBRa3ozrF8MM4kzP2A
         4VNhLmwui6p2QqLKkNEpf7iSuPz9f3iTkGrOs6mEOLqurwiOTlNACnVV0eviSWrbYEDT
         AnzkwfJGvBvAFyYhZ9Af8Lvl16MXcv6ozhiuQTZdNBgHwCtgWKA7I7SYDMW2iibmwbAz
         1Yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=srFoickd1zlR+kJjOTObZ61tAEx/5+zynW0TfHZUqk4=;
        b=KO1lKm/CC1tDu/pjOK571EhTV32Vmz3JOgzq62ohm5e4tZHSwNE37jJiTVqRcdsAhP
         q+AWh2mngmMWqcCgR1DL4CM0P+8BIZMi+HW73EvvAhdOjm0OgREYi4xSGS9bsnWhsSG4
         IydkvEPO9FcEhAOu4GuIF4L7lEN5PZCwrKUNEkqjcO8/U5Jdgfda7n3rCaJJ/BwH5OWi
         DsTjorN0sNDwdLWj5eMANI3obF9GE+lwAEIM0l69SAg+fvx2lfihmq934IvEuqzq1gB8
         yvPKXujWIOeD7td1fI4be0HZkv7MfziyT/g0HL1HPbIlmzOwMZWYK6iKqCnKSZ/yuzYm
         snVA==
X-Gm-Message-State: AOAM532pxrABK3fGFKLoLLW/5amHBTy3mo0VwGGXvk/k6Pf5QbSixChW
        uaWib4fHWBXF3cassyLfxL/3Bw==
X-Google-Smtp-Source: ABdhPJwjczDWnC2qj4dZ+FNQIhPqqnW+3k0v+lTZ1pAXsHhT5jYps11L6QGsnu5UIkyQF0cz4I3J+A==
X-Received: by 2002:a05:6638:22c5:b0:326:2b3a:b08b with SMTP id j5-20020a05663822c500b003262b3ab08bmr5318649jat.250.1649729889994;
        Mon, 11 Apr 2022 19:18:09 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id x186-20020a6bc7c3000000b00648deae6630sm21825052iof.54.2022.04.11.19.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 19:18:08 -0700 (PDT)
Message-ID: <2412ec25-37bf-fa12-6cbf-7cd697b1cf05@linaro.org>
Date:   Mon, 11 Apr 2022 21:18:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] interconnect: qcom: icc-rpmh: Add BCMs to commit list
 in pre_aggregate
Content-Language: en-US
To:     Stephen Boyd <swboyd@chromium.org>, djakov@kernel.org,
        okukatla@codeaurora.org, quic_mdtipton@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mike Tipton <mdtipton@codeaurora.org>, mka@chromium.org,
        dianders@chromium.org
References: <20211125174751.25317-1-djakov@kernel.org>
 <CAE-0n51xeigKFS9Zek44HZGD9cdc4Em91aQ5HHzuy7P1FBmfFg@mail.gmail.com>
 <a96a010d-9bd7-f760-3c03-d842feef41aa@linaro.org>
 <CAE-0n51-hpG_5O11FbGrHaMr_mN0ZAky8CVzZNmDj29aK8wGog@mail.gmail.com>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <CAE-0n51-hpG_5O11FbGrHaMr_mN0ZAky8CVzZNmDj29aK8wGog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/11/22 2:06 PM, Stephen Boyd wrote:
>> The second problem you have is exhibited by the IPA driver if
>> the "fix" commit (upstream b95b668eaaa2) is back-ported to the
>> Linux 5.10.y LTS branch (along with some other prerequisite
>> commits).  We can conclude that applying the above commit
>> makes the bandwidth for an unused interconnect (or perhaps
>> the rate for the IPA core clock) get set to zero.  And in that
>> case, an attempt to access IPA hardware leads to the crash you
>> observed.
>>
>> The IPA driver does not implement runtime power management
>> until Linux v5.15.  You later said you thought enabling that
>> might ensure the clock and interconnects were active when
>> needed by the IPA driver, and I concur (but there could be a
>> little more to it).
> Is the runtime PM patch series necessary to enable the IPA clk and
> interconnects? Things don't look good on 5.10.y and I'm not sure it will
> be workable. Commit b1d681d8d324 ("interconnect: Add sync state
> support") was introduced in v5.10 and that seems to be the commit that
> broke suspend on Lazor.
> 

This isn't a response to your complete message but I'm going
to respond to this part.

Before runtime PM was in place, the "IPA clock" (which was a
logical notion representing the IPA core clock and all the
interconnects it uses) was enabled before the IPA hardware
was first touched.  It was disabled again when system suspend
occurred, and re-enabled again on system resume.  At one time
we did observe the XO clock turning off.

I'm not sure that answers your question.  But bottom line
is that system suspend/resume were supported (and made
IPA clock+interconnects get shut off and then on again),
but not runtime PM.

					-Alex
