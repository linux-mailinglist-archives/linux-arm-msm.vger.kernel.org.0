Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54F776DE681
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 23:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbjDKVfK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 17:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbjDKVfI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 17:35:08 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2369744A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 14:35:03 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id m4so11980572lfj.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 14:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681248901; x=1683840901;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgjk5+7IjN8Jw3X+GOTozhyftZCcRJijaSMlBqwvNWk=;
        b=WThnyX2+GwrspIZFSKQDpOX5ESi2oznurZGDtC/OQB6/11eIajgq27TLC0YuU5g8/m
         B9rmC1mW4cP4jCQtkdeC2FIiQJPkjnxiwv2CWZ8Wsms9tKlWmKHgkPnZa6/ZI8JrDp2w
         gzFp6KyiKU/n1ZL/EHcGfzqmOQyfDzX0HMOrJ6ElBFvVLZ7sB3MUYGKr6wCbdcC5nk3q
         FQrBC6M1bPPDDNZ2Y740JTRmm3mXATVFc2QP+2GtPFWtxue6XQOgKKgrAEXVmMO4Q4re
         TnnO7wz2BT61Io+P6QR9ppnBIHhGvM9Vy3cgsihmW+pQ1MLAioqevNMrDRlZCOLNf75C
         oFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681248901; x=1683840901;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgjk5+7IjN8Jw3X+GOTozhyftZCcRJijaSMlBqwvNWk=;
        b=m/BjdF7LidLiJIkydxi9c4/i8RYtJ/DTe1wt9JYZbFdcUc0mTguQKB0NGGpKrqYCKy
         3H7nwODTwE1f9QLHsQjdyau19bz/IiFgwGxDsVaJaBFpz5EfeNEfYZbc6uFjJ/S20Jwr
         MWx6D5BNmdh27pJkff5pYuuxg/QG3nzpJ9qBeCkCI+tXyLepAoxC5j1IOwdF8ejVrUil
         dQGLiFyBy7dHZXXvLGKxQYp13yPCQTJvEyH2Q4psLMTWik35y9g28ztZA5S7A2QD4XiS
         uyHFOkKMWhOSVQ/yCXUK1UdXBC0/YhSLsmU+hA/777LAsnNoZcuzEJQPGghNCIjaeztW
         v4uQ==
X-Gm-Message-State: AAQBX9f42l7BK8PzWXfNMQjxQxdW4oeUynuGF34t0i8mrdUo7WzYwWQX
        ijgYIGVbbsn5wj376NEqIH9kKA==
X-Google-Smtp-Source: AKy350bd1PrnBQbb66BSBlCiFWEHWfiNqi7ZGdlXv9ZyKjsQ2ZAvnfRuDJ6wPwJyPzzuziqRfAcgIw==
X-Received: by 2002:ac2:443c:0:b0:4ea:eadf:2a53 with SMTP id w28-20020ac2443c000000b004eaeadf2a53mr4534002lfl.63.1681248901323;
        Tue, 11 Apr 2023 14:35:01 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id q29-20020ac2515d000000b004ea018bb8f7sm2695471lfd.77.2023.04.11.14.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 14:35:00 -0700 (PDT)
Message-ID: <a97aacb4-e880-9665-4837-7af207f0ac77@linaro.org>
Date:   Tue, 11 Apr 2023 23:34:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH RFT v2 01/14] dt-bindings: clock: qcom,rpmcc: Add a way to
 enable unused clock cleanup
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-1-ae80a325fe94@linaro.org>
 <20230316225803.GA4036689-robh@kernel.org>
 <62533d5a-f39a-0806-b4d9-932e2af6beef@linaro.org>
 <5601e0edc19dc03d0fc516f9ffe4d1aa.sboyd@kernel.org>
 <2a379401-fe87-9e30-5449-513dd23c52f5@linaro.org>
 <422abc8b-5c01-238b-7793-212597dbffc8@linaro.org>
In-Reply-To: <422abc8b-5c01-238b-7793-212597dbffc8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.04.2023 22:17, Konrad Dybcio wrote:
> 
> 
> On 6.04.2023 16:44, Konrad Dybcio wrote:
>>
>>
>> On 17.03.2023 19:20, Stephen Boyd wrote:
>>> Quoting Konrad Dybcio (2023-03-16 17:31:34)
>>>>
>>>> On 16.03.2023 23:58, Rob Herring wrote:
>>>>> On Wed, Mar 08, 2023 at 10:35:17PM +0100, Konrad Dybcio wrote:
>>>>>>  
>>>>>> +  qcom,clk-disable-unused:
>>>>>> +    type: boolean
>>>>>> +    description:
>>>>>> +      Indicates whether unused RPM clocks can be shut down with the common
>>>>>> +      unused clock cleanup. Requires a functional interconnect driver.
>>>>>
>>>>> I don't think this should be QCom specific. Come up with something 
>>>>> common (which will probably have some debate). 
>>>> Generally the opposite (ignoring unused clocks during the cleanup) is
>>>> the thing you need to opt into.
>>>>
>>>> I can however see how (especially with the focus on not breaking things
>>>> for older DTs) somebody else may also decide to only allow them to be
>>>> cleaned up conditionally (by marking the clocks that were enabled earlier
>>>> as enabled in Linux OR not addding clk.flags |= CLK_IGNORE_UNUSED) as we
>>>> do here.
>>>>
>>>> Stephen, Rob, would `clk-disable-unused` be a fitting generic property
>>>> name for that? Should we also think about `clk-ignore-unused` as a
>>>> clock-controller-specific alternative to the CCF-wide clk_ignore_unused
>>>> cmdline?
>>>>
>>>
>>> There are multiple threads on the list about disabling unused clks.
>>> Moving the decision to disable unused clks to a DT property is yet
>>> another approach. I'd rather not do that, because it really isn't
>>> describing the hardware configuration. If anything, I'd expect the
>>> property to be describing which clks are enabled by the firmware and
>>> then leave the decision to disable them because they're unused up to the
>>> software.
>> After some more thinking, I realized that this could be made opt-in
>> simply with driver_data..
>>
>> WDYT?
> ..on a re-evaluation, obviously not a great idea.. Old DTBs will not
> be happy about that.
Another idea would be to yank out the not-very-useful "qcom,rpmcc"
fallback compatible and present .is_enabled etc. when it's absent..

Directly checking for the interconnect handle to rpmcc is not possible,
as interconnect requires rpmcc.. And then somebody's interconnect
driver may not be "good enough" (like 8996 and pre-6.3 DTs).

Konrad
> 
> Konrad
>>
>> Konrad
