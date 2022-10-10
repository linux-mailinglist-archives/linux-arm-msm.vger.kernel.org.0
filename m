Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 912F55FA0F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Oct 2022 17:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbiJJPMn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Oct 2022 11:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiJJPMl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Oct 2022 11:12:41 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E694F39B92
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 08:12:38 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id a5so1786563qkl.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ti2zc/Z9SUfzOTKjMdPbdScQnFxu1+kQxfOPj1Dyv/4=;
        b=P+cSwsbsj8eeXmcNaU0tj5PPMA8pvwLNEUxSMpRHreBTVx/duWlWqqBCR7IxvbwqE/
         /e7hVkvWGDaEBBy8eiK5kU7wpGo1sABikjgzqGeqKe8ievVRAUBoaXo7cGJ70BcIxuGL
         X7u76obg2MxsnUemiEBXJYbSzz7gEChLft0E5BbD8xtLT1Pk8BDj7impzEZMm5IlEpMW
         tVuQE1q4VElBQjWth9dKtGoIpEdNJmbUN0osfF5ESysRr48eKj7pVmfF2NHTo3ANmEjB
         ubpvv2QbczyPby/xC10THFpqMzorLVkY8pvyHTiWfMEvPwDTGATXEcEzn+FIfw7BB12x
         496Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ti2zc/Z9SUfzOTKjMdPbdScQnFxu1+kQxfOPj1Dyv/4=;
        b=Lk6yDjlSMZ953SAb+7R8YodEKWQLnMRoCHI5p5aYLVvzGQem+Hg4K222wgpCqoJ19O
         WZpOclGNeSwuAUeOT5WAIz1yJgxqjkD7gc5cxXZ6aAzCVZZ8/DFX05GmmGotF32vBJ7/
         iLssHbHSKiZi2a1gZ+0mNvOb3/6jpqwqkgJsDkkldoteb4eRhgOWfi3Wop9hCOv2+xmJ
         QEe1j78leswktFkTLGekyhdKfLIRpEvPThHeEpHHWi50bDHuZq8NLeL7q/ZF2WByD1GV
         AY0vV/S8ftJPKPNHYQp6LqBLQ28O3LMU3A6JC3sCLXrK8oU0R280q8mW9L48YwJzQto2
         GHbw==
X-Gm-Message-State: ACrzQf1oTHcnigBHeeNXUwLJJnsU6qvnj1sY2hC9Sx6DIuijdfc3Egl5
        5opav3jShsVr5UeB5jksMmH0uQ==
X-Google-Smtp-Source: AMsMyM6XEIzAH7k3ByxOxBQsO2chVqu/ElA1zMj+jxzv1G/EWOY/HrhZ9L5YugdL4CR4DJ0YWre7kg==
X-Received: by 2002:a05:620a:6009:b0:6ec:ed49:b93c with SMTP id dw9-20020a05620a600900b006eced49b93cmr3606460qkb.180.1665414758089;
        Mon, 10 Oct 2022 08:12:38 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id p16-20020a05620a057000b006bb29d932e1sm524135qkp.105.2022.10.10.08.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 08:12:37 -0700 (PDT)
Message-ID: <45e2734d-fc4d-2dcb-ee20-98504d8c336a@linaro.org>
Date:   Mon, 10 Oct 2022 11:10:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: Qualcomm DT bindings and DTS cleanups - tracking community wide
Content-Language: en-US
To:     Caleb Connolly <caleb@connolly.tech>,
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
        Luca Weiss <luca.weiss@fairphone.com>,
        Vinod Koul <vinod.koul@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
References: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org>
 <faa4e821-00e0-4ee0-0c62-b5eb6f75abf7@linaro.org>
 <a5bc5342-be84-9a1b-e40a-1cb9ceea47ae@connolly.tech>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a5bc5342-be84-9a1b-e40a-1cb9ceea47ae@connolly.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/10/2022 07:34, Caleb Connolly wrote:
> 
> 
> On 04/10/2022 15:50, Krzysztof Kozlowski wrote:
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
> Hi Krzysztof,
> 
> I think a GitLab repo with some automatically generated issues and some sort of
> overall coverage map might be a good way to track this. Especially if it can be
> shown on a per-device basis as well.

Thanks for the feedback!

Best regards,
Krzysztof

