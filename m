Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E47125F62E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 10:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbiJFIj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 04:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiJFIj1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 04:39:27 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E25195AFA
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 01:39:25 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b2so1655832lfp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 01:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ZsdVW3kv/gv6VD2XYgaX0nURVyr4iT9nt0KEf2PY+2s=;
        b=JBvrTPjUFP/4uLZOz7I2AUPppN5MV7+lpjYtI4DRttA1LVeCNft+uZHZF6ZLHkYMkz
         NtHA8nYW0g8CgjpHzs2nFXNLXA+wwaL88KN5Oi9xxszvJXc1vynGsrBGCIWw2JNoVqIa
         hqmVtvo0BLlIkjHx6ze97EDuzZdTHCswMsulvzN6cYZ5kQDRO+FZZ/IPX7yVZNqm46Mz
         /ZKrVuqh0o03hFrJ56TMF8gvIU6srwyJnwK8DewdA/k8zp4/HBVbbKlfVmiivNBuUYv/
         NbPA/AaP5gE/enXTUIX/cm4bmDQfoiDool00JzQO+KFfNFdZvRxTEswkOlulPw1YdKMn
         t49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZsdVW3kv/gv6VD2XYgaX0nURVyr4iT9nt0KEf2PY+2s=;
        b=ti24M0cWVTxGJspHLpP01V2/vYr0ql8S2LLf/ZQeekgVGtfMa9IESFIsQZ5/y1jYqa
         EA73LYfJ4BX5OcVA50ZSgJobVByr9rISiKiMsNSDil/brQWOKe2TV5lTCGc+KyR3iBH+
         BsABr77W8tppZ3BfRtDo4f3chB43VxyapQTR6psp+L2eh26T7lhSv9U9YSicMURbdhFU
         APhAe/ux6BfIq2VPHyzG51Qf1soyDsL5bq3z0KyBdunUvOZpCCKhmQeCUX+jtBb7Ew3Z
         r1jgV9DBptfriZCvFREhSKtre4P5c7uAGpfdQTPZ2DgyQQrW+HQhseZtEX0SjikIDeeq
         DSwg==
X-Gm-Message-State: ACrzQf3ACZgFJupmNDEKxYYMF/CS0ROPIHu0MEIA1MMnN+JUxLC6Tp2s
        r0qV/fdH2cMorzYMFENX7N80rPCMM+bLCg==
X-Google-Smtp-Source: AMsMyM6kroZABrR/AA9MmR23n5+B/Y8uNck3iaId6051ZQGMOmJRMRcgbsOXYV90zyNqN56ZUDdRhA==
X-Received: by 2002:ac2:429a:0:b0:49f:9c71:50b6 with SMTP id m26-20020ac2429a000000b0049f9c7150b6mr1370741lfh.349.1665045563763;
        Thu, 06 Oct 2022 01:39:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b18-20020a056512305200b00497b198987bsm2629176lfb.26.2022.10.06.01.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 01:39:23 -0700 (PDT)
Message-ID: <a7e57332-f0c8-ceb0-e279-4e9a114d0cc8@linaro.org>
Date:   Thu, 6 Oct 2022 10:39:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: Qualcomm DT bindings and DTS cleanups - tracking community wide
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
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
 <Yz6P8wOPdRd9sjX2@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yz6P8wOPdRd9sjX2@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/10/2022 10:21, Johan Hovold wrote:
>> What to track:
>> 1. Which bindings to convert to YAML,
>> 2. Missing compatibles (either entirely or because of missing conversion),
>> 3. `dt_binding_check` warnings (usually connected with 1-2),
>> 4. `dtbs_check` warnings.
>>
>> Rob's bot gives us daily output for 1-4, but how can we track current
>> efforts to avoid duplication of work? Also it would allow people to find
>> tasks for them to get contributions to Linux kernel :). Is anyone in
>> community interested in tracking it together, in a public way?
> 
> Is this a real problem that needs fixing? I mean how often does it
> happen that people submit the same YAML conversion for example? Since it
> doesn't take that long to do a conversion, I'm not sure what tracking
> this on some webpage buys us. It's better to just search lore before
> starting a new conversion. Or search the linux-next tree to see what's
> still pending.

In terms of DT bindings conversion to DT schema:
If I were not checking for ongoing work, I would duplicate effort like
~10 times. Few other folks hit it few times, at least. Several bindings
are being converted for ~1 year!

In terms of DTS warnings - it's difficult even to check/search. For what
do you search? Warnings? Pretty often they are not part of commit msg.
By file? Then you might have many, many unrelated search results.

> 
> Similarly for the other points above, as it doesn't take very long to
> add a missing compatible or fix a warning it seems a bit excessive to
> try to track this manually.

True, some are trivial. Some however need fixing the binding which takes
time.

> Perhaps a list of pending conversions or missing compatibles could be
> useful for someone who's short on work, but it's bound to get outdated
> pretty quickly.

Another point is to have the visibility on the amount of work to be
done. But I understand that's maybe topic just for few, e.g. me, so I
can just track stuff for myself.

> 
>> If so, where?
>> A. elinux.org (needs some formatting when pasting the output from tools)
>> B. gitlab pages/wiki (maybe scripts could parse tools and create the page?)
>> C. gitlab dedicated repo - some text file
>> D. Linux kernel TODO file (might be difficult to keep updated)
>> E. kernel.org wiki (requires LF accounts, AFAIK, a bit pain to edit; I
>> have it for Exynos but I don't find it usable -
>> https://exynos.wiki.kernel.org/todo_tasks)
>>
>> I am leaning towards Gitlab pages because they could be quite automated
>> - with CI or with scripts.
>>
>> The point would be to list all of tasks (1-4 from the first list), keep
>> it updated with new results, pick/assign tasks and mark as done.
> 
> I don't really see the need for more process here, sorry.
> 
> If I'm working on support for a new platform and the DT checker warnings
> gets too noisy I may pick some of the low hanging fruit. In the odd
> chance that someone beats me to it, it's not the end of the world.

Thanks for the input!

Best regards,
Krzysztof

