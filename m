Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D456A5FD983
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Oct 2022 14:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbiJMMsW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 08:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiJMMsW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 08:48:22 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CBA8F037E
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 05:48:21 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id bb5so870203qtb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 05:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vset9KWE9zQivwm9UZ3Uu6zccP3Nk+eON+QXvI2NVg0=;
        b=LvTLUde8Kt5rW+JBv1vjyv1237A1v9omg/RrjwGYXeyCXx813ujpeDz5Hqp8MRoXZW
         M469/E04zULZxsQzM85RmOwOhbJ0O9GVc1ms+Mkx3660wsYX4i+4rKfJlniTSQohya99
         UmdK9OnNcryhOVH6vvnWM4MFen2czLoUHvPbkZaH1cQOFUl2yJHtt2tPEx/vH7b+tGoC
         PUJGBkd+zfWaoR4Uln+vqVfE2KrZC3wI6u+uQd2HhpMgJx80ZJz+1kGx3tFzRgWV2cOl
         TPv8hqm3fa/igMkKYX603TxobALqfAIW5SSIpasR/nRg606FnMFD0Cmr0xVVV7Ap48Ek
         xlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vset9KWE9zQivwm9UZ3Uu6zccP3Nk+eON+QXvI2NVg0=;
        b=5vq7122Hy/2bexIOtNMN4Le6+y8OOoofS4F5aU1lPdZFu2a/lsGfJ7UD0cpZtCpvQ6
         wQnUGKQ1c2Sw5Ost41eRKls5J126zWX96//8JMlXtKYYb2/HEKS3moPdLzVKjU0xkggS
         5LQdOg9GENBLt1iXfBQFJDuUJYt7GiMDz2+L3DvAkRXT22/yYlv2uYY7e4Hz7a8zejeh
         6pPRXmOj5alHk82Vtpe7RjDi658iJE9ROijPCkKCvrLtWkuBoMD6V0tmgTbsPWrr+lZ7
         x7VDyxVF5w39iP64nUdL8XO+9NBfrX2syKv/uflw3mkmUo7nv9fSM09YVfAWoWmYc+GU
         UhAw==
X-Gm-Message-State: ACrzQf3EtxYeBK9FAuZ+8ac3dIhyuuEbcctC/KqNSKTCQP0/sXOpCk7i
        Ab3Ow/2Opij/yw34dmnpdJ5Qag==
X-Google-Smtp-Source: AMsMyM7JmMnI/2BQnv3tqfrtm7zHuh3DrERSRZmtQBAVoHUAQNxGy8s3VLss49wirQ4l0EhNx4xgnQ==
X-Received: by 2002:ac8:4e51:0:b0:35d:43ba:1ebf with SMTP id e17-20020ac84e51000000b0035d43ba1ebfmr27195534qtw.366.1665665300282;
        Thu, 13 Oct 2022 05:48:20 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id j19-20020a05620a289300b006bb87c4833asm19054698qkp.109.2022.10.13.05.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 05:48:19 -0700 (PDT)
Message-ID: <1f441795-c771-835b-731b-f5dd9557dc09@linaro.org>
Date:   Thu, 13 Oct 2022 08:46:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: Qualcomm DT bindings and DTS cleanups - tracking community wide
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
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
        Caleb Connolly <kc@postmarketos.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Johan Hovold <johan@kernel.org>
References: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org>
 <0f5bb12f-814d-37f2-9307-b2b649aedfe3@linaro.org>
In-Reply-To: <0f5bb12f-814d-37f2-9307-b2b649aedfe3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2022 09:57, Krzysztof Kozlowski wrote:
> On 22/09/2022 10:32, Krzysztof Kozlowski wrote:
>> Hi everyone,
>>
>> Quite a lot of people are working on Qualcomm DT bindings conversion
>> (TXT->YAML) and fixups to Qualcomm DTS. We track a bit of this effort
>> internally in Linaro, but that has many shortcomings and we would like
>> to track it rather community-wide with the support and contributions
>> from the community.
>>
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
>>
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
> 
> This could be looking like that - the list of missing compatibles from
> Rob's tasks:
> https://gitlab.com/krzkoz/linux-dt-todo/-/blob/main/todo-compatibles.rst
> 
> There is a script which will automatically add new entries to the list
> (above RST file), once fed with Rob's job output. Further this could be
> probably pipelined with Rob's jobs.
> 
> List anyway has to be manually updated with work in progress.
> 
> This is for the compatibles. Missing part is doing something similar for
> the dtbs_check warnings.
> 
> In replies Luca, Caleb and Neil mentioned GitLab issues. That could be
> useful, so if someone would like to hook into GitLab API - feel free to
> work on that (either in that repo or in separate).

Just to be clear - if the approach is interesting to anyone, just join
the project / ask for access and make edits/changes etc.

To do this, you can visit https://gitlab.com/krzkoz/linux-dt-todo/ and
next to repository name (top/middle part of page) there should be
"Request Access" link.

Best regards,
Krzysztof

