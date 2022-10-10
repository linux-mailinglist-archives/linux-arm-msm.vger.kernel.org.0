Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5B25FA231
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Oct 2022 18:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbiJJQwq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Oct 2022 12:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbiJJQwm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Oct 2022 12:52:42 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF8257268
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 09:52:38 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so6749484wmb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 09:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TooyNpGqbYvbHeMmzgGUoj4epQaf5wkEuPYfGqns080=;
        b=wVhezypxnhSp/1THXGlGGxjs33wJZrtabyKEW4BWM3rofSJbwNB6VlHYb4A3Wx8S1O
         Wg/RHCJDczxVM7zHpfYeiV6TsYod+bdABQDbf9Fg03JCNDgOpz2dDhT6sWMVVZTR9zWE
         fb13qA3I1EoKccF/L8w9LybXonxvcK6dAV6DNyKKYy2w7dMgGLtpj75i+TcMXSw+1yg+
         bbca3LllSx66/4Cbk9WAVuIT73NpOue4pXd4UIPEtadJVi5ty+YVbc4mYLmsz3dWA2l6
         TK6ZuGI7XqteMWA8/tpy+Hv7Jd2nsx7lu74tyewiHqkieFnC137MX2eEpQF6us0imV6S
         SgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TooyNpGqbYvbHeMmzgGUoj4epQaf5wkEuPYfGqns080=;
        b=GWCqqujnPRA5SNuTiJTZGZ4R5IKYqu5a1ch5SS1KixEUNrvsjEUhbgBSv9nGQh1tas
         B9h960N4SmbOcQ3g95HM0bjY+y8nCcD+qtPGeXRzz4xdRRXSLbmKwBroc6+AR88IMOU0
         49mKv+U1IClSDN74Y8ZaP2WTalpR/ATw38l7ZsSY6WfelfGZQt5W3X6uNaarb1pDY6hx
         MgjRKlaJpQJ+OoYYtBdgXPmXWDulYfaOkS7tZlDUGmpzU7Ay+/+/3sz5QkhlfsLNdER4
         4sQ7ldVRXUQYt8AoxnKGPkPJ61DeR4EIENoZXJ5yhVOV1z246RkKDcF81Yvd/kAYOJ/n
         C/CA==
X-Gm-Message-State: ACrzQf3yDwm/vghLVCcVUpC+hcXNr6pA6Bj6F7hGm2WUld5p/ULIomP2
        Mb2GPYaCD+Cd6emfcg6z8jfqnQ==
X-Google-Smtp-Source: AMsMyM4qVA4Mkbx3Zq+pbGgilaaSeHKFQ4BGQhQg9AB41uEadLoCcBIMELbcUnljF4tNXnLLuj7meA==
X-Received: by 2002:a05:600c:4f55:b0:3b4:b687:a7b7 with SMTP id m21-20020a05600c4f5500b003b4b687a7b7mr20434899wmq.185.1665420757138;
        Mon, 10 Oct 2022 09:52:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1d81:c6ce:69e8:c0? ([2a01:e0a:982:cbb0:1d81:c6ce:69e8:c0])
        by smtp.gmail.com with ESMTPSA id a17-20020a05600c349100b003c6bd91caa5sm2053463wmq.17.2022.10.10.09.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 09:52:36 -0700 (PDT)
Message-ID: <15d7c048-0591-8e1d-e232-40c1f92d0349@linaro.org>
Date:   Mon, 10 Oct 2022 18:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: Qualcomm DT bindings and DTS cleanups - tracking community wide
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
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
 <bada584a-a2d5-9487-bfc0-f6eb983d91e1@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <bada584a-a2d5-9487-bfc0-f6eb983d91e1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 10/10/2022 17:10, Krzysztof Kozlowski wrote:
> On 10/10/2022 06:32, Luca Weiss wrote:
>> Hi Krzysztof,
>>
>> On Tue Oct 4, 2022 at 4:50 PM CEST, Krzysztof Kozlowski wrote:
>>> On 22/09/2022 16:32, Krzysztof Kozlowski wrote:
>>>> Hi everyone,
>>>>
>>>> Quite a lot of people are working on Qualcomm DT bindings conversion
>>>> (TXT->YAML) and fixups to Qualcomm DTS. We track a bit of this effort
>>>> internally in Linaro, but that has many shortcomings and we would like
>>>> to track it rather community-wide with the support and contributions
>>>> from the community.
>>>>
>>>> What to track:
>>>> 1. Which bindings to convert to YAML,
>>>> 2. Missing compatibles (either entirely or because of missing conversion),
>>>> 3. `dt_binding_check` warnings (usually connected with 1-2),
>>>> 4. `dtbs_check` warnings.
>>>>
>>>> Rob's bot gives us daily output for 1-4, but how can we track current
>>>> efforts to avoid duplication of work? Also it would allow people to find
>>>> tasks for them to get contributions to Linux kernel :). Is anyone in
>>>> community interested in tracking it together, in a public way?
>>>>
>>>> If so, where?
>>>> A. elinux.org (needs some formatting when pasting the output from tools)
>>>> B. gitlab pages/wiki (maybe scripts could parse tools and create the page?)
>>>> C. gitlab dedicated repo - some text file
>>>> D. Linux kernel TODO file (might be difficult to keep updated)
>>>> E. kernel.org wiki (requires LF accounts, AFAIK, a bit pain to edit; I
>>>> have it for Exynos but I don't find it usable -
>>>> https://exynos.wiki.kernel.org/todo_tasks)
>>>
>>>
>>> Hi All,
>>>
>>> Any thoughts on this? So far I did not receive any responses, so
>>> probably this could mean that there is little interest in this?
>>
>> I'd also appreciate having something there. Similar to the count of
>> similar warnings that Rob is sometimes posting, I personally don't
>> see those apart from checking my boards (msm8226, msm8974, msm8953,
>> sm6350), where I recently did a cleanup spree for 8974 for low-hanging
>> fruit. Of course given that not every device uses all the functionality
>> some things that are disabled on my fairphone-fp2 device I won't see,
>> but only when checking other devices e.g. lg-hammerhead.
>>
>> So some gitlab project with issues for each thing would be pretty nice I
>> believe. While I probably won't tackle big topics like mdss+mdp5 because
>> it's just very complex, I'm happy to pick up some small tasks that are
>> (comparatively) quick to fix.
>>
> 
> Thanks Lucas. I am not sure how easy is to create automatically a set of
> gitlab issues based on some file with warnings, thus probably in the
> beginning this might be just a TXT file or set of files.
> 
> I don't want to put too much effort on the mechanism of tracking, rather
> have something working, editable by many (e.g. restricted only to a
> Gitlab account) and with some ways of automation.
> 
> Caleb mentioned splitting results per board, which could be done easily
> with some scripts.

I'm new (and old) to msm upstreaming, but having a status automagically updated
from master, -next and even maybe from lists would be neat.

If you need some help to set up the gitlab stuff, I can try to be helpful.

Thanks,
Neil

> 
> Best regards,
> Krzysztof
> 

