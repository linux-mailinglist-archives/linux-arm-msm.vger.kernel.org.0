Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D835565C375
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 17:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbjACQAd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 11:00:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbjACQAc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 11:00:32 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FBF12626
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 08:00:31 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id b3so46233071lfv.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 08:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fsEzWFiMVhRqX2IFEPw8asDdcQK9y3UraFOcKRzBzCg=;
        b=BPV6b+Qwim5BalbzVnJ6nZUkbCljHaizqzeos+hbzBV2gcgFWYcp7JnVFN+jt86Pug
         tP77izEL1ADvjJyz7zPTKK9sSnTzyuVVwUgEvrgiAbjXehtBlruJcjru2fEAmBnpa77P
         vS1DFxQMcAPJGP1S/JIedx/eC+F1XFgjso66soIDLSSi5B5qMWUsOmp3/IyiZOS3dtvP
         MsDT+DDteytECWc7QWND/4LfXSvLjAPi1Fcqu0dBVbwd3p974WXo3kjY6L6vf8D23gib
         6RC9yKNnU9iq/q24e+OctmKXMdvpYbMbdKeV+z9fU1jvPDKk2slUov/q6BsHR2sIfEcw
         O/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsEzWFiMVhRqX2IFEPw8asDdcQK9y3UraFOcKRzBzCg=;
        b=YulwRWPk1MpsHJeW81dEkALUFK6rO4NV7oiVzXZ0EL1QCNVj3LjVg+7V/iBOGpncfB
         kiEDZc0Rm76dNHgDjiecMOh6skGfBqm2nd0WSS8u6MRVFBrxfFU6yyvssd/ysNpNq1wX
         PkO+GpW2Ln1IEzG/AwtWSEl0OFQ1sQ0KZ2Q8hqSnaTHAMSGjAWlj/x8F/uUTOV8k0bto
         XUgZxJ2laOzpNlHuF+xBcuWaDOyhGqsck0WIrwBlZBZyTDvuwEp1hrIOumNovrC3XnD7
         DZzTDzS9KrmIyk9iNetCsJhCirq4cFdPRReRLFbgqJLZDh/22lVgwPQES74wG3d+OVrn
         lFYg==
X-Gm-Message-State: AFqh2kpN8CATAiITy2jUsifm2QFevHEsZcVvrTb8PEeI/127H08CUPNb
        m3WtOkcYre4oDBP69yvxOYpLrA==
X-Google-Smtp-Source: AMrXdXucfa+6dsTdEF05zpniX4JCgXxQZApYR5KwR6nyG+e03FSeQg0Sm8IsDKLktspatDf/o4lBSA==
X-Received: by 2002:a05:6512:2624:b0:4b5:8e1e:867b with SMTP id bt36-20020a056512262400b004b58e1e867bmr12760289lfb.59.1672761629251;
        Tue, 03 Jan 2023 08:00:29 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id p14-20020ac24ece000000b004cb40db03desm242737lfr.55.2023.01.03.08.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 08:00:28 -0800 (PST)
Message-ID: <e2493080-f7fd-50de-173f-2e46fa846e23@linaro.org>
Date:   Tue, 3 Jan 2023 18:00:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 15/21] clk: qcom: gpucc-msm8998: switch to parent_hws
Content-Language: en-GB
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
 <20230103145515.1164020-16-dmitry.baryshkov@linaro.org>
 <CAOCk7Nr4smGnQS-yh1hGKFFXzeUUt86JSdiuoSun7vJ11z9SWQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAOCk7Nr4smGnQS-yh1hGKFFXzeUUt86JSdiuoSun7vJ11z9SWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/01/2023 17:08, Jeffrey Hugo wrote:
> On Tue, Jan 3, 2023 at 7:56 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Change several entries of parent_data to use parent_hws instead, which
>> results in slightly more ovbious code.
> 
> obvious -> obvious
> 
> Also, you are changing one of two parent_data structs in this file.
> That's not "several".  It's really not clear why you are touching one,
> but not the other.  Can you be more specific about what is going on in
> this particular file?

The other struct has .hw and .fw_data entries so it can not be switched 
to just clk_hw enumeration.

I agree, that one is not 'several' (yeah, I was just using template for 
commit messages), I can change that for v2.

-- 
With best wishes
Dmitry

