Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 506DB6A238C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Feb 2023 22:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbjBXVPB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 16:15:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjBXVO7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 16:14:59 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39BB6F414
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 13:14:55 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id s20so780935lfb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 13:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3tMET32MC/ilQvKVfykq58VVtfmdUTziBlgOazLd3M=;
        b=U5eD5dgQMqr90/i1TZVqTWa3upSJ8famKFMQf6b9Y4qBH8DJcyBWCDB2wSBsxCCQmV
         WZ+8aokL4OdbZAaMkkA3m8qy6FibDv5B7fgz1TTrT0aGeRrgnzz5GhFtpuDI2LAXzVpY
         DtucP8KdYrdXIDcb25gdulIleYmRNT2tNiEGSn5/gRHJ0+UmPNDswbe8uz6mpLEYYBSv
         OQgWVLtwRv7wwHFb1npF/UZFjkqNwbH1gZlmtMGoclhGA9W/4uZ+5+qs2dD5baNy7YBY
         IQ9ZJdMJNw6jKamY4dAgdrItDX1BkWNO0DYQo+EkdY9p3tH6CFWPy92vySc2VVVINtLc
         JMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3tMET32MC/ilQvKVfykq58VVtfmdUTziBlgOazLd3M=;
        b=kN5OVQuC63NSc9qdxL+SsjDfzGdg8pb37TYd3eo0a+zLKPF0xxb8sEubMhq+0N0wrn
         icsXDA9SgJj5GUyhesBs+pYd5tut/53GyMCODiANA/OJK2cBzsxVSg+2GXiIT5RFc/K5
         2MZC8LLARXd4h+DdijY2XfmAymZ/yeP3X1u5WlZBqnJoJZxy4DLQWEkr5AW5wsD7UIp8
         zJqknZUqVQSmAWpfhKayLMD23l65HQlulaPAhP5gI0yjVojd4N3ZEueDQmrYeNvU245M
         S4F8FzYCc21mq4PJyLX/1NnQ3Tlskclmbt5ksZT0Md+zwncUt3NHSQwM75selFY4Jeiv
         poHw==
X-Gm-Message-State: AO0yUKVSvbjnG65WpeExrJi6RegoQiui0N350u07EO0hNxF5YkpgbLW7
        pqYEGIpo0I9U/iGha3Ymu4ie5Q==
X-Google-Smtp-Source: AK7set+KuQfh3hQTyj9cvtkBXBPxyynq+nrRD1q1YjjoI1lEyvxDbAvco71W6uCiJgOUd/RvpsNOzg==
X-Received: by 2002:ac2:4842:0:b0:4d5:a6ad:53e8 with SMTP id 2-20020ac24842000000b004d5a6ad53e8mr6464231lfy.27.1677273294064;
        Fri, 24 Feb 2023 13:14:54 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z7-20020ac25de7000000b004db44dfd888sm2750lfq.30.2023.02.24.13.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 13:14:53 -0800 (PST)
Message-ID: <54004e9c-256c-15b2-9c55-8bd88ebb0c85@linaro.org>
Date:   Fri, 24 Feb 2023 23:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH 2/2] drm/msm/dsi: use new
 dpu_dsc_populate_dsc_config()
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-3-git-send-email-quic_khsieh@quicinc.com>
 <525078f5-44be-9a75-a737-ddcc6e097700@linaro.org>
 <21623a6d-7f83-5d2c-068c-f600a1834ac9@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <21623a6d-7f83-5d2c-068c-f600a1834ac9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/02/2023 23:09, Abhinav Kumar wrote:
> 
> 
> On 2/24/2023 1:04 PM, Dmitry Baryshkov wrote:
>> On 24/02/2023 21:40, Kuogee Hsieh wrote:
>>> use new introduced dpu_dsc_populate_dsc_config() to calculate
>>> and populate drm_dsc_info instead of hard code value.
>>
>> DPU is an optional component, so DSI driver should not depend on the 
>> DPU driver.
>>
> 
> Today, the implicit dependency is already there. Without the DPU DSC 
> blocks, the DSI cannot operate in compressed mode.

It can not operate, but one will compile w/o other driver.

> 
> But, from a SW standpoint I agree we can separate this.
> 
> We can move this one level up to the disp/ or msm/ folder
> 
> What do you think about that?

I think about drivers/gpu/drm/display/drm_dsc_helper.c

> -- 
With best wishes
Dmitry

