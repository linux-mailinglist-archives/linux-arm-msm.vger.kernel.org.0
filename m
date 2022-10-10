Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48DE85FA0F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Oct 2022 17:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiJJPM0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Oct 2022 11:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbiJJPMZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Oct 2022 11:12:25 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FACB3471C
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 08:12:24 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id z30so6802697qkz.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZGY0NmxkHIMgYKNHWFtIegzfS1Q0kFucYbxjq5grdE=;
        b=qnswpzqPS89CiDSi/t25CtkoGPZgYTiZxQBa9kmHRP7Q7XqYBNb8cPcCt6pPL1Y5Is
         fXisPJtqz3hLOdunzcLyc07+C8sfI0cB/rjim6p6nfh0Six7cUDIIclybpTsFp2cL7wE
         oiWBubiHWhRAJBOj7NNGhjvBYgDeB73yIPzVkzMBuAVIvn1naTrerp4h3rATJf3WI3S8
         6WG0ZuU0SQ28sULfHcYgdPLaFTmYkDmFK0H37FrDPgEN9lRHjtKh966vcXxlfe8WPU0g
         xRc6/LZAwEbRpU3R1yT3prksPPO9iSqihTZs7zsblw7biKyWVOwpjFnLEtK/mHvzszSf
         Kx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XZGY0NmxkHIMgYKNHWFtIegzfS1Q0kFucYbxjq5grdE=;
        b=48qGVCkzmrFOp8SGxRZl2p7Cu2KTOMiEr0EhVchLkX0fXbjUzhpykpBXdHFCGluimo
         qL66ITYkhklyk715Nf86IT8ieF+vBI5B2EHmn9tW+jh7ufcccdTf0URQmx9zFelmoxIA
         b4WbS7bSmi5itiWYcW5BnXPg6aVd8wT5pv7VDQlehQJGwf7LKiJn9Fve5fHZ/LV/yzIB
         C4RKwfuf+ZScgIcmOkIPOMZmjxu33Gtpg37GwMtbicblvIRaiKsBatxqSnsv0W0UCQ3I
         BD72LxmTdcdzCPFxtF/spBy0ZYoY9xmS7+cR4+k7nB0GqwmteL5V0sxXAdeDONkIRrQb
         xhnA==
X-Gm-Message-State: ACrzQf3qxVQ52YeLmJeMIYbzW5IAoYHYj/kBI8Y1ODDtgQVG/IJ+K2va
        fGHxyaM+JuiIcZDEefz0EicDFA==
X-Google-Smtp-Source: AMsMyM48ML6UIOrLAYNHJ8rAYhllA4/FRkJ5zqOSsXyh37G21vGKIYEfFedyKtJoVx7nH5hDgVC1tg==
X-Received: by 2002:a05:620a:4709:b0:6ce:cb19:3eb2 with SMTP id bs9-20020a05620a470900b006cecb193eb2mr13003526qkb.272.1665414743163;
        Mon, 10 Oct 2022 08:12:23 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id y8-20020ac87048000000b00342f8d4d0basm8868279qtm.43.2022.10.10.08.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 08:12:22 -0700 (PDT)
Message-ID: <bada584a-a2d5-9487-bfc0-f6eb983d91e1@linaro.org>
Date:   Mon, 10 Oct 2022 11:10:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: Qualcomm DT bindings and DTS cleanups - tracking community wide
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
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
        Vinod Koul <vinod.koul@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Caleb Connolly <kc@postmarketos.org>
References: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org>
 <faa4e821-00e0-4ee0-0c62-b5eb6f75abf7@linaro.org>
 <CNI6AL1JKZ1L.2QLO9D3KZJ2MR@otso>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CNI6AL1JKZ1L.2QLO9D3KZJ2MR@otso>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/10/2022 06:32, Luca Weiss wrote:
> Hi Krzysztof,
> 
> On Tue Oct 4, 2022 at 4:50 PM CEST, Krzysztof Kozlowski wrote:
>> On 22/09/2022 16:32, Krzysztof Kozlowski wrote:
>>> Hi everyone,
>>>
>>> Quite a lot of people are working on Qualcomm DT bindings conversion
>>> (TXT->YAML) and fixups to Qualcomm DTS. We track a bit of this effort
>>> internally in Linaro, but that has many shortcomings and we would like
>>> to track it rather community-wide with the support and contributions
>>> from the community.
>>>
>>> What to track:
>>> 1. Which bindings to convert to YAML,
>>> 2. Missing compatibles (either entirely or because of missing conversion),
>>> 3. `dt_binding_check` warnings (usually connected with 1-2),
>>> 4. `dtbs_check` warnings.
>>>
>>> Rob's bot gives us daily output for 1-4, but how can we track current
>>> efforts to avoid duplication of work? Also it would allow people to find
>>> tasks for them to get contributions to Linux kernel :). Is anyone in
>>> community interested in tracking it together, in a public way?
>>>
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
> I'd also appreciate having something there. Similar to the count of
> similar warnings that Rob is sometimes posting, I personally don't
> see those apart from checking my boards (msm8226, msm8974, msm8953,
> sm6350), where I recently did a cleanup spree for 8974 for low-hanging
> fruit. Of course given that not every device uses all the functionality
> some things that are disabled on my fairphone-fp2 device I won't see,
> but only when checking other devices e.g. lg-hammerhead.
> 
> So some gitlab project with issues for each thing would be pretty nice I
> believe. While I probably won't tackle big topics like mdss+mdp5 because
> it's just very complex, I'm happy to pick up some small tasks that are
> (comparatively) quick to fix.
> 

Thanks Lucas. I am not sure how easy is to create automatically a set of
gitlab issues based on some file with warnings, thus probably in the
beginning this might be just a TXT file or set of files.

I don't want to put too much effort on the mechanism of tracking, rather
have something working, editable by many (e.g. restricted only to a
Gitlab account) and with some ways of automation.

Caleb mentioned splitting results per board, which could be done easily
with some scripts.

Best regards,
Krzysztof

