Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975D128DDF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 11:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgJNJqn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 05:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgJNJqn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 05:46:43 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40D2C061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 02:46:41 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id v6so2936245lfa.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 02:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R+Jr7an/bPNcJoQouoOjXAzOqRnOkKwIrBPsDy4iYiw=;
        b=WsEk0uQAbfipxXpERvDtMhF9W8fXNXhnLJsC0M9nyEVt/ra4OqnpDBX+hxv/3b8ek7
         wHg6ZKnZ2ZnlwTQrXhLs9yLQugb3DlRd1i2PubbvqRNg0xdkSQTfW2TDpbTDNefbqAFp
         OKGGc4tIYOnxbNzVW5CRNwflJYz/7F4El8AI6hP+uORZN8jlqGxwL4w5teUAVXpLkq5l
         YzLATjoOSpferpIGjfg8mj5ptN08fNhcY2aqd4R2SaOOUszR2DlgIr2Rg/Ev/JSs+Bvm
         UW160oC0SEjlGuJiDMtb+bUaWpZE0L5zN3nHSooA7SqDp/QqbiyjMrMvBf6vox1Hz3Sb
         CXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R+Jr7an/bPNcJoQouoOjXAzOqRnOkKwIrBPsDy4iYiw=;
        b=mlSTSXbcX0NWtFQ18XdFTMv/9eTW6xhJEjBKzQVauwZy5ZOwlW/DcxiqFaJ5aB7fnA
         XSMXsgkSvpw+i4GEu4mmZ9eaZNqDLMmRG4MsFZRJfFpygNoesDAbaSC/TVoY7RYEe+SL
         eyAOBdwnLpbPjEfqGSbofTS3M9aAKtwVighZkZ4bJVHRTS6h8ybHCwABnFJhWivHvuhr
         F1tFjVOpEDYswyZo9m0d5upkxll9Pf3TbA0m43BbW3TKfKV+dW7YI22rW3lpUpUWJDkN
         oc8NAUoXJhPXYVqomfMQG3JhDnJFMfuAWi0UTQV5nEX8itZfueOvEJ3QbuvtHreO5smO
         Jc4Q==
X-Gm-Message-State: AOAM532pq+F+iNe++da2MxDAhq4/cVWTH9wxtIdOxByto+J1um6Paj37
        9G/SNm0aqXKkega+mMcLuqkNPg==
X-Google-Smtp-Source: ABdhPJzyjzotFJ4/VSS6QdBloBjcRqaMnOCq3r59EFlfvuZyOa9cG/ACiRP2lmKbfb3ZHBHNxumuZQ==
X-Received: by 2002:ac2:4d58:: with SMTP id 24mr1092648lfp.32.1602668800207;
        Wed, 14 Oct 2020 02:46:40 -0700 (PDT)
Received: from [192.168.1.211] ([94.25.229.2])
        by smtp.gmail.com with ESMTPSA id y184sm930340lfa.245.2020.10.14.02.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 02:46:39 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] clk: qcom: dispcc-sm8250: handle MMCX power domain
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20201005225914.315852-1-dmitry.baryshkov@linaro.org>
 <20201005225914.315852-4-dmitry.baryshkov@linaro.org>
 <160264179823.310579.6191463434860127602@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <5523b613-c659-45f9-90ce-2c51f3ee8c79@linaro.org>
Date:   Wed, 14 Oct 2020 12:46:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <160264179823.310579.6191463434860127602@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/10/2020 05:16, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2020-10-05 15:59:14)
>> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
>> index 07a98d3f882d..3941054a7b07 100644
>> --- a/drivers/clk/qcom/dispcc-sm8250.c
>> +++ b/drivers/clk/qcom/dispcc-sm8250.c
>> @@ -963,6 +963,8 @@ static struct gdsc mdss_gdsc = {
>>          },
>>          .pwrsts = PWRSTS_OFF_ON,
>>          .flags = HW_CTRL,
>> +       .domain = "mmcx",
>> +       .perf_idx = 0,
> 
> Does a perf_idx of 0 mean off? Or just "not off"?


It means 'use performance state with index 0 declared in the DTS'.


-- 
With best wishes
Dmitry
