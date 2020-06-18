Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7171F1FED79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 10:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbgFRIUb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 04:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728605AbgFRIU3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 04:20:29 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0968C06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 01:20:27 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id s28so4135012edw.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 01:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6ssZpEEhqBlCG+QFwfF2Dj++wsee6YyRouD6G37tF5I=;
        b=xtqNMnFg8TcJ5w//PSndeHjk7LPoEVOjbgb5QUv95TRaNX2i/D312OmOyFjXT7Mdly
         noddX2L9Ucuga/NbZ6M8YVKZIqf2rsH9stk0wY6IFZo+m6/C63BHOJ6KFQZSeHuI2se7
         9y1EzlXJdQ17EkXu/R3LiZBhZpV+sa0jTv7DOvecpI12kDB5CtoLHrFyvEWJdAIk1KPI
         3LfJDgqQMDQ+di2Yx1Si99kmBfrMGUNoT7pspsmiqkfWtXCMCo2Tc/fnK4XtGlM8YEjZ
         2+2PZzRhT+DfGf1uwC1QPIl+Qkxyv4plR62c+YRLDaSdhKPpQRJEDWifkhj20n4ttrmr
         e5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6ssZpEEhqBlCG+QFwfF2Dj++wsee6YyRouD6G37tF5I=;
        b=Y2j4gHJgX6Ijf6f9RB65uNgJZL0IpHrRx4rsMuj2CznFHltrUbyVvJZWzv0owoWMRr
         bB0/XQgjScecYDZAkdBFcaYY9lUpxsJHWQN9Wv8QM3XQl7Mj7xqpxd4vFxkjQlrcV/qe
         irfMB3yXYL044vaJZbugWF4uirw3ePc5Ce79MDazvYHZ+UhN+aHVwhtRgbt1xWjzC1T8
         EtHZ3nmQltx449BU36EEGUzIMJ3efSm0UchS1qmfclfmxdoYmDnXqfdMe1PB3VKlhduv
         G4bQtvvspoo9fevqPzuqDezpbASnDQsbYnMINNR8zGfgViD7keC/KgnvKU4PYrHvNp9R
         Eixg==
X-Gm-Message-State: AOAM531B6P7Cd5mHbVEYqErYMXCjdAHpcuKI5nY1A/a2sRFnlJjdlRZ7
        hpDoLUdZQdvloyW6LVhAbLdKkQ==
X-Google-Smtp-Source: ABdhPJxChXny9JZcisfnpk3auJs5bbrLwB1ERlt4t7ziM2/oX4d+a6E0djzJNC9mOBh7OcVOvK2nkA==
X-Received: by 2002:a50:ee93:: with SMTP id f19mr2851148edr.256.1592468425960;
        Thu, 18 Jun 2020 01:20:25 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-140.ip.btc-net.bg. [212.5.158.140])
        by smtp.googlemail.com with ESMTPSA id p6sm1731152ejb.71.2020.06.18.01.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 01:20:25 -0700 (PDT)
Subject: Re: [PATCH v6 0/6] DVFS for IO devices on sdm845 and sc7180
To:     Rajendra Nayak <rnayak@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mark Brown <broonie@kernel.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, robdclark@gmail.com,
        robdclark@chromium.org, viresh.kumar@linaro.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
 <20200617221546.GC4525@google.com>
 <4f3d4c91-2a01-8ef5-1ad0-73ed354f930a@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <9bb7fbb6-6309-3f30-dd4f-2ee3d187c074@linaro.org>
Date:   Thu, 18 Jun 2020 11:20:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4f3d4c91-2a01-8ef5-1ad0-73ed354f930a@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajendra,

On 6/18/20 7:47 AM, Rajendra Nayak wrote:
> Hey Matthias, thanks for summarizing this.
> 
> On 6/18/2020 3:45 AM, Matthias Kaehlcke wrote:
>> What is the plan for landing these, it seems not all must/should
>> go through the QCOM tree.
>>
>> My guesses:
>>
>> tty: serial: qcom_geni_serial: Use OPP API to set clk/perf state
>> spi: spi-geni-qcom: Use OPP API to set clk/perf state
>>    QCOM tree due to shared dependency on change in
>> include/linux/qcom-geni-se.h
> 
> That's correct, Bjorn/Andy, can these be pulled in now for 5.9?
> They have acks from Greg for serial and Mark for the spi patch.
>  
>> drm/msm/dpu: Use OPP API to set clk/perf state
>> drm/msm: dsi: Use OPP API to set clk/perf state
>>    drm/msm tree
> 
> Correct, the dsi patch is still not reviewed by Rob, so once that's done,
> I am guessing Rob would pull both of these.
> 
>>
>> media: venus: core: Add support for opp tables/perf voting
>>    venus tree
> 
> correct, this is pending review/ack from Stan.

I tested the changes in the driver, and they looks fine. But when
applied the corresponding change in the DT node I see this message when
the streaming is stopping:

qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000

I tested on v5.7 (linaro-integration). Should I be worried ?


-- 
regards,
Stan
