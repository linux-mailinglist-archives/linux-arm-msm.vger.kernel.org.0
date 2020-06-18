Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A321FF18D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 14:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgFRMZP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 08:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgFRMZP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 08:25:15 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83259C06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 05:25:14 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id t21so4658383edr.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UJIK3eOWDyPeiIHQU/0dVlnLexDXba9OTxbGB4A2gl0=;
        b=TClc42ft33RKTYHUlkBWRBKsios0AGMU7D9gpjxS2oUwxMcT80bd7DgivTYXhb690C
         XiHzmQA4YzrPiQxrocVdRCO07C3p62JJ/o92jBfwRDpddxb9LjPgbm6kQ6AD6/vYxvT+
         dOYeAVVW4x4ZiiGOWY/tjcNfQeoUSSYKL/EokpoSZjJrkOeEvIteZ7jY0IIWayaALA/8
         +TY1cesiZNA9fFeghI5qxn2sBzNglIr7koVGWACUlK6eDy9KZbD4uE7fn2IXjaJ43R4V
         GYPUXzhtarWhOmZV5l/V7JuMJ0x1YewjoA1k68HsPeyVoPlWRfJJK8YkAIDuiSCmvBmc
         HxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UJIK3eOWDyPeiIHQU/0dVlnLexDXba9OTxbGB4A2gl0=;
        b=COTrmakzs5u2zyQBVJTwdJrAEXYipTHO4/e1Xozc7SJCj7MBToXGprxzgMkJIzqf4k
         lQwhjDT9xm4u6zZuEe7wkBoLAhg9qexjKFjzMeHviCc+ZqZf0VbaBX4816aUAY4oK3+c
         WvWVjh+MLtzgeL4X8g0g8HVIaQiZforJRh4BHY7fOUBif2qN18P2/aS2lqY4mfgCTQff
         qsWKqOr23+ebRZjY8CediWpW8CXXGBBvlwQ5VdT/H+OGZYfD8A9LeNfz71VEEGb4nZ8N
         faDkWQO9HfWB5mtotGNvi6h4B6GYmFmpgnqdGJwVzXB9PQk8Rj9VsCzUKrUYNgzF82rV
         5RKA==
X-Gm-Message-State: AOAM533IBZ6VIjlvHUqvIpyK+Ww0XATv6UOwaSUyDTBLIglKmE9VDByi
        qU79JHQa1tsn/klX6YlfV1cEaw==
X-Google-Smtp-Source: ABdhPJwqR4gqZ3OqNJw1hJs4k/8ksjobysLkcxPc2MEE1KzpZBuqHII90p7CC0TTvHLdEXaJaY+GyQ==
X-Received: by 2002:aa7:c15a:: with SMTP id r26mr3649380edp.21.1592483113177;
        Thu, 18 Jun 2020 05:25:13 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-140.ip.btc-net.bg. [212.5.158.140])
        by smtp.googlemail.com with ESMTPSA id s17sm2157278eju.80.2020.06.18.05.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 05:25:12 -0700 (PDT)
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
 <9bb7fbb6-6309-3f30-dd4f-2ee3d187c074@linaro.org>
 <3ec9bc56-3e31-64fe-320a-2dc153a81f98@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <d715708b-db7a-efb7-5861-aa5bb8dfcd86@linaro.org>
Date:   Thu, 18 Jun 2020 15:25:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3ec9bc56-3e31-64fe-320a-2dc153a81f98@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/18/20 3:11 PM, Rajendra Nayak wrote:
> 
> Hey Stan,
>  
>> On 6/18/20 7:47 AM, Rajendra Nayak wrote:
>>> Hey Matthias, thanks for summarizing this.
>>>
>>> On 6/18/2020 3:45 AM, Matthias Kaehlcke wrote:
>>>> What is the plan for landing these, it seems not all must/should
>>>> go through the QCOM tree.
>>>>
>>>> My guesses:
>>>>
>>>> tty: serial: qcom_geni_serial: Use OPP API to set clk/perf state
>>>> spi: spi-geni-qcom: Use OPP API to set clk/perf state
>>>>     QCOM tree due to shared dependency on change in
>>>> include/linux/qcom-geni-se.h
>>>
>>> That's correct, Bjorn/Andy, can these be pulled in now for 5.9?
>>> They have acks from Greg for serial and Mark for the spi patch.
>>>  
>>>> drm/msm/dpu: Use OPP API to set clk/perf state
>>>> drm/msm: dsi: Use OPP API to set clk/perf state
>>>>     drm/msm tree
>>>
>>> Correct, the dsi patch is still not reviewed by Rob, so once that's
>>> done,
>>> I am guessing Rob would pull both of these.
>>>
>>>>
>>>> media: venus: core: Add support for opp tables/perf voting
>>>>     venus tree
>>>
>>> correct, this is pending review/ack from Stan.
>>
>> I tested the changes in the driver, and they looks fine. But when
>> applied the corresponding change in the DT node I see this message when
>> the streaming is stopping:
>>
>> qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000
>>
>> I tested on v5.7 (linaro-integration). Should I be worried ?
> 
> Is this seen on sdm845 or sc7180, or both?

Seen on sdm845, I don't have sc7180 to test.

I can try it on 5.8-rc1 integration-linux-qcomlt if you think there
might be a fix in rpmh.


-- 
regards,
Stan
