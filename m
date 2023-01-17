Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79C52670E10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 00:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjAQXwG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 18:52:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjAQXvd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 18:51:33 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB03246D55
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 15:01:53 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id mg12so6739613ejc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 15:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Rm/I8nO9gd2qK++J479RUyAvGB50YCflkNIheUW3mw=;
        b=kpFSFEFu1royNwIwK2EHJAzZZ2zAfVa3bMf74nggMFzAc/3fitC0IZRmBqb9r8I1RY
         t49QMkzlE6Vu2+7OB+uJwzs7vJXixkZVs7t5gRV2FEmtp9V5FS9Sva68+TRy+OlYVYkt
         1nkOniopaEL/T6BOeXAW7zDDS2qt43tAPj2a+hRxikujO9XLqxGnVb6ocVImAspYpogX
         3qwVmICK9wERMKs7PEX3dxj8cmgjQzKiWFOx1+QrsV0a/9T06/2+Qfity6dMNuyT/+ac
         zDRzja8svsbsOT4Ks6M0PvcApxUNdd/TXfjMdhV18vDEymRhuavzegNeftFaqEM40O58
         Zxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Rm/I8nO9gd2qK++J479RUyAvGB50YCflkNIheUW3mw=;
        b=SIHZzUaHMyTRg74uZYon/aAIZ+pKgzPJEXrdLFaTJeib5Yp2U+XIGewb5r/ecpKILJ
         xdiI5wofQD9q6VgV9x6osMpm6uqp7lWmw41osTU3+ioKwomBVQcDa1POZVhwSSH5jxHf
         6Jg7zCP1Ol/1GX/6JmX2t0vHNStcEFO3qn3HkQ4QdClcvdbWdvUJDnKDHGl38gADwBVv
         679LHXf1sXkVP1UPuxoEnCwQPX3noHx4xTevMIjN2SgxO8DAMKXskBfLscvpxUNHLB47
         ZwKiQdwk2TinGNRQh8lIzesF/iRZOWu9D5er1wRfji5j7PUqHrwI8B//H47tW7nuXfLB
         ZoSA==
X-Gm-Message-State: AFqh2krUGRtson1ebZLikxkPGmRLGuoltVw6n2ZMsVE0Ycvha5yNKfac
        CTyi/2djS0JZhD5WvLjl600b2w==
X-Google-Smtp-Source: AMrXdXurc0vhLvVdLRLeDt5w9RkfHwaMIRUkHQW7M1vvDzpCkrBmoNO3oe0Tmc0SmYKQQq8b5+PgYg==
X-Received: by 2002:a17:906:9417:b0:86c:f7ac:71ff with SMTP id q23-20020a170906941700b0086cf7ac71ffmr4846348ejx.10.1673996512516;
        Tue, 17 Jan 2023 15:01:52 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kz11-20020a17090777cb00b007aece68483csm13826994ejc.193.2023.01.17.15.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 15:01:52 -0800 (PST)
Message-ID: <5f8d1b76-5948-3b98-52c0-0f280042fa20@linaro.org>
Date:   Wed, 18 Jan 2023 01:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] clk: qcom: common: use parent_hws in
 _qcom_cc_register_board_clk()
Content-Language: en-GB
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <20221228203555.3130090-1-dmitry.baryshkov@linaro.org>
 <20230111044715.5nbxasuhlqv6t2fw@builder.lan>
 <CAA8EJppzHoHp5BVBJN-ZF0OmwbtKfxhX_qTEPc5cwSnLTvTcJQ@mail.gmail.com>
 <20230117033003.ky2i7fc2l72rhysd@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230117033003.ky2i7fc2l72rhysd@builder.lan>
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

On 17/01/2023 05:30, Bjorn Andersson wrote:
> On Wed, Jan 11, 2023 at 06:49:29AM +0200, Dmitry Baryshkov wrote:
>> On Wed, 11 Jan 2023 at 06:47, Bjorn Andersson <andersson@kernel.org> wrote:
>>>
>>> On Wed, Dec 28, 2022 at 10:35:55PM +0200, Dmitry Baryshkov wrote:
>>>> Switch _qcom_cc_register_board_clk() to use parent_hws.
>>>>
>>>
>>> There's more to this patch then this short sentence, please describe it
>>> further.
>>
>> True, I'll fix it for v3.
>>
>>>
>>> And given Dan's reported-by, I must assume that there's an issue with
>>> the current code. Is there a Fixes?
>>
>> No. Dan reported an issue with v1, thus his Reported-by was included into v2.
>>
> 
> I though it meant "this corrects an issue that was Reported-by".
> 
> IMHO including "issues was fixed during code review after being
> Reported-by" diminishing the value of this trailer - in particular since
> we don't use it broadly to capture anyone else's review feedback.

I particularly use it for the cases when the issue was reported by 
testing robot or by Dan (or Dan's robot), since these emails explicitly 
ask for such trailer.

> 
> 
> PS. I'm definitely in favour of introducing a trailer to give Dan, and
> others, credit for reviews.

Any particular suggestion?

-- 
With best wishes
Dmitry

