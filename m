Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9151D4050
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 23:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbgENVmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 17:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727837AbgENVmF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 17:42:05 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5DCC05BD09
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 14:42:04 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id i15so684474wrx.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 14:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yI1U8AUDDWNI+XLdCwvv3rQd/eXkcVvXBcnHMoqn2qs=;
        b=Kk1bCOr+u0FZ27Ewkgo62P8UuxadSMbSCNxeDyztymTB+LAUTxnvfBx3RKlx8eaDBq
         4gRT1WWY3+SYT8cT9GDQ9735amGfk5TXyyUGW/yi29CejUWYEFd/16MeVgD5sWoQ5OSo
         Tgvz0PxpMiQ2OsiNskkJ21U01V81g9N09C2MvATjUyDiL313bTfOsylyNWH+0YJW2wyb
         Wt93Al6Ou9B2ql9V3jjVMwGbbfq6xQ4z5E/5VZC5Qb+Pc5XpXyvnmihbVNgrsE7HHat6
         3gNtsoydhQWTtpT/WxmG37CoTNcL0aIK7eP7onAZ5SxJJKHym0OATkLunzM9zlc54mXz
         qzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yI1U8AUDDWNI+XLdCwvv3rQd/eXkcVvXBcnHMoqn2qs=;
        b=subRpE0+LSmw/XyQ9TVtWCYt8quAiZEg4UibaC/0eTAL74cxWwONwexK3maNAxwNx+
         JgI89BWJAlwZHwa4z7XmPC6ILbbSbv/+IRiusvSrvx4UGh1Ucy3S+m7wVV9L4oxRvbmn
         x4D21RNQl4SbEZ95IJ3kZizcmCop13/52zRyWXXu40BozUoeUuoeKqrHsPvYLiXJJQfg
         XxMtJB+QMLV8RwcLg1Rmk+CZMV92NnhPxpQ8n0LMNLw5bvXPubR2SXAYaue5vzjbYLjR
         MqB7gu7TrH9kfo5rZpj/9384KbADymnXrXmJM8W3msdB7jpkXH3kmgjjyatR+7XPYlLN
         sG2A==
X-Gm-Message-State: AOAM5320AdxwH8r58wqaPvwNkVFbsdtBj7/lAIxIV0MmtG8eKzaZwSYM
        UMxAvKRroFRAVCQk860062ArgA==
X-Google-Smtp-Source: ABdhPJwjLsGzxSnhBdTpwCv1KxMeZM+KqYK5ICQ+zgFr9Y8weXPm1qgo3lpneSurN2sf/JsKaNVavQ==
X-Received: by 2002:a5d:60c3:: with SMTP id x3mr506758wrt.48.1589492523207;
        Thu, 14 May 2020 14:42:03 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p8sm406400wre.11.2020.05.14.14.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 14:42:02 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock
 Controller
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de,
        vincent.knecht@mailoo.org, konradybcio@gmail.com
References: <20200512115023.2856617-1-bryan.odonoghue@linaro.org>
 <20200512115023.2856617-3-bryan.odonoghue@linaro.org>
 <158949186096.215346.4442403798485610696@swboyd.mtv.corp.google.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <ae2045bf-52f9-9be8-b48a-90d65c1ab96d@linaro.org>
Date:   Thu, 14 May 2020 22:42:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158949186096.215346.4442403798485610696@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/05/2020 22:31, Stephen Boyd wrote:
> Quoting Bryan O'Donoghue (2020-05-12 04:50:23)
>> This patch adds support for the MSM8939 GCC. The MSM8939 is based on the
>> MSM8916. MSM8939 is compatible in several ways with MSM8916 but, has
>> additional functional blocks added which require additional PLL sources. In
>> some cases functional blocks from the MSM8916 have different clock sources
>> or different supported frequencies.
>>
>> Cc: Andy Gross <agross@kernel.org>
>> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: linux-clk@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> 
> Is this a co-developed-by tag?

Yep. I'm squashing down about 30-some internal patches to this one patch 
here including one or two from Shawn in this set.

I wasn't quite sure what the etiquette on Co-developed was i.e. it 
wasn't something git allowed me to specify with a "git commit -s 
--co-developed="xyz"" so I just retained the SOB.

Looking through git logs I see an example

I'll apply a
Co-developed-by: Shawn Guo <shawn.guo@linaro.org>

for v5.

>> +static int gcc_msm8939_probe(struct platform_device *pdev)
>> +{
>> +       int ret;
>> +       struct regmap *regmap;
>> +
>> +       ret = qcom_cc_probe(pdev, &gcc_msm8939_desc);
>> +       if (ret)
>> +               return ret;
>> +
>> +       regmap = dev_get_regmap(&pdev->dev, NULL);
>> +       clk_pll_configure_sr_hpm_lp(&gpll3, regmap, &gpll3_config, true);
>> +       clk_pll_configure_sr_hpm_lp(&gpll4, regmap, &gpll4_config, true);
> 
> We should probably configure these before registering the clks. Can you
> do the usual, map registers, configure stuff, and then
> qcom_cc_really_probe()?

I think so. If there was a good reason to configure the plls after the 
registration, I can't recall what that was, maybe the original flow from 
downstream ...

>> +
>> +MODULE_DESCRIPTION("Qualcomm GCC MSM8939 Driver");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_ALIAS("platform:gcc-msm8939");
> 
> The module alias isn't needed right?

Nope g/msm8916/s//msm8939/g - I can zap that.

Thanks for the review.

---
bod
