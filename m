Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7DBD28DDE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 11:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgJNJof (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 05:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbgJNJoe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 05:44:34 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50252C0613D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 02:44:34 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 184so2976608lfd.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u+x9J/s88GKzzAtEEy5lsLGaZp5QyJqhlLOkF7vOqHo=;
        b=VN8N3opFkftndSv32mL2dfkZRFrrEJI4iyCLh7u5BqfcSRd7q/KnZ6Nni9Qd5pUaBV
         g2QZRGjkUXMwvziAG2NyuNaMkmjRcAgsH0xn6M/ynTtqdHtDdHOFQwKI2bj19/X8Q/F8
         V0FETougrLA/QlBHK2L5wCJwbzcb250wSsLhXJUosnWAkhLNX7OtmMyJsXxZ9/c4JeR2
         q61MCjYyAxlCNMHvqqgnio3MQh0T8pImGiMTM93riVCIvaIiwUpOi9+bQ2ZsZUSqbrda
         1Y1Of3jpw9FLeARBYy+gZlPep7GKHhs8g7XgZ0rGEOGjA9/DPEuQHwki+HGepDH5j+lS
         x2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u+x9J/s88GKzzAtEEy5lsLGaZp5QyJqhlLOkF7vOqHo=;
        b=EkH5suCWGWQ1vS9WEn/mYRcYq7dPUT5i3Um0WmV3ZyrqdWO6apovMQalkyGzM2lCNB
         /5b2Si6PXOee4jHLNxXWDqSASRhyFjYBO8r1LBVj6PmpCFm2H+LHBTBLidWoKbzP71th
         hziQhRZBLFTmmY12CnWJbMckSyoQgSAt/j9VsIpDZ3BxNf3GWqtfKvHVKFBF/06/M4xy
         QALryrj8SPctRIzAP6Kf6/NaHg5/Enp7DPepVmiMk86l5hakSczm3WmQuGtRwQHGAYrH
         6JU/6W0m8RHb3uMkosPYGsTVj+0Snpm2HDFUF8NQWePSk93yrhEbzfcBxnfJ8xJZ3N8l
         Ksgw==
X-Gm-Message-State: AOAM531/nq1uM0MEZSnt/jtmHxVhb4l+P7lXJQftJEbQBJYf5jVljmsZ
        jZYmldzVJilIArGLgO92v7H0Yg==
X-Google-Smtp-Source: ABdhPJyIO9F8+R8sr0LXYTYFdRfk969bZbzyyF/lg8Iuc/lCHs3/t8j/AQbPM2i8lAz78V+7v9rL0g==
X-Received: by 2002:a19:f704:: with SMTP id z4mr999048lfe.581.1602668672565;
        Wed, 14 Oct 2020 02:44:32 -0700 (PDT)
Received: from [192.168.1.211] ([94.25.229.2])
        by smtp.gmail.com with ESMTPSA id l9sm988631ljc.86.2020.10.14.02.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 02:44:31 -0700 (PDT)
Subject: Re: [PATCH v1 2/3] clk: qcom: gdsc: enable external switchable power
 domain
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20201005225914.315852-1-dmitry.baryshkov@linaro.org>
 <20201005225914.315852-3-dmitry.baryshkov@linaro.org>
 <160264174883.310579.10321983404701479878@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <153b313c-ff06-c91b-5adc-4cc3c5cd1a6f@linaro.org>
Date:   Wed, 14 Oct 2020 12:44:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <160264174883.310579.10321983404701479878@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/10/2020 05:15, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2020-10-05 15:59:13)
>> On SM8250 MDSS_GDSC (and respective dispcc clocks) are children of MMCX
>> power domain. MMCX needs to be enabled to be able to access GDSC
>> registers and to enable display clocks. Use dev_pm/opp to enable
>> corresponding power domain.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> A general question is why is this done in the gdsc code instead of
> somewhere generic? It seems that genpds may need to change the
> performance state of other genpds. I vaguely recall that genpd supports
> connecting different power domains together so maybe this could all be
> handled in the genpd layer instead of here? Then a regulator could be
> put behind a genpd and similarly be connected to the gdsc and turned on
> before turning on the gdsc?

Basically because we need not only to enable the genpd, but also to set 
performance state. This would mean creating a separate regulator driver 
calling dev_pm_genpd_set_performance_state() from enable/disable paths.
Does that seem like a better solution to you?

> 
>>   drivers/clk/qcom/gdsc.c | 56 ++++++++++++++++++++++++++++++++++++++---
>>   drivers/clk/qcom/gdsc.h |  5 ++++
>>   2 files changed, 57 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
>> index bd537438c793..d58575f8f25f 100644
>> --- a/drivers/clk/qcom/gdsc.h
>> +++ b/drivers/clk/qcom/gdsc.h
>> @@ -57,6 +57,11 @@ struct gdsc {
>>   
>>          const char                      *supply;
>>          struct regulator                *rsupply;
>> +
>> +       const char                      *domain;
>> +       unsigned int                    perf_idx;
>> +       struct device                   *pd_dev;
>> +       int                             pd_opp;
> 
> Please document these fields.

Will do.

-- 
With best wishes
Dmitry
