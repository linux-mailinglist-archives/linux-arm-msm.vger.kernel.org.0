Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3AC33DA83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 18:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238772AbhCPRUA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 13:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238667AbhCPRTd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 13:19:33 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA7C3C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Mar 2021 10:19:32 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t18so15869808lfl.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Mar 2021 10:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HU7tSHpBcN7HhMkKOa8L+bsgXHmuW2pr4tFJdSL3Ecs=;
        b=SRYGVyi34X/FTJCszSL15VKnWDu7/g3swczk4mbChaSpJnQl0tQVZCmNbDGtFiiSVZ
         JqpsZNkRoivn/35kGk/Ba+NX1S17YMt/6pB0QpI/EYCH/2U39W1MISHlGyfcOSljzS+u
         Kw93/JcbB6TCLDcHgl1kkm2IJws/NnNiXGZLwPmFNX+lS9MXDZscIOT23uGQq98zZHoE
         yImlhgnl3R3ZgFomN2BCSJWX49jcOYG4jPogx4RmLMgH2qHRg6SUol6zW5ePfAmR9fYJ
         3vo0VGoKidUjWNmzDYyqSSwMY5KsOEyr10kg8/pX6914O6x7q3Crq9RXyIn6Y5kf32Pb
         tAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HU7tSHpBcN7HhMkKOa8L+bsgXHmuW2pr4tFJdSL3Ecs=;
        b=QZ0KAgp+mADW5ssbKrVQd3ZweBNGjer09Zb/S04JLhAn7pr0r8LPQNnCjUVokMWkhj
         wkq29BLF9lhE8M+saVWty1/MAkh3hmqUpIjQtSiv2RymUeDUjOaQCMiKIXYFq4U6WJbf
         8o7qOTKw06WB/c3TVn7/+XJOdM/dm8pypjyr97mFuVllMVjFxpzIPTUhpwlB4sFyOAP7
         6w+oiHOxc+lt0lCmIRecBxHQ6VgCrTBAN2dWq8agZ1eAqhJmH3CBHVut9qUTQ65Y3Ru3
         zmh22jKNF7uv+Qifpf9gYtnsGimb0Id+cdPJT+zTgdgDAL0TK9jFP7o0MmGaFocwgSby
         XNiA==
X-Gm-Message-State: AOAM531t+0KJBKlJkkhb0TZ5/51fo387fOZtShu1T9HVgpZrc95yyLB0
        e3ZLjvfm8l2C2VowvaavxLy7Rg==
X-Google-Smtp-Source: ABdhPJzvXQEx3IpPZrr03iuOY+bRgbGEagsThCcHJZzftvfJ9GA3xzuRZhU+TzLZlYFiD/C9A52Iaw==
X-Received: by 2002:a19:f50e:: with SMTP id j14mr11949931lfb.299.1615915171215;
        Tue, 16 Mar 2021 10:19:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f26sm3118503lfe.118.2021.03.16.10.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 10:19:30 -0700 (PDT)
Subject: Re: [PATCH v13 4/4] dt-bindings: msm/dp: Add bindings of MSM
 DisplayPort controller
To:     khsieh@codeaurora.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
References: <1614950952-13351-1-git-send-email-mkrishn@codeaurora.org>
 <1614950952-13351-4-git-send-email-mkrishn@codeaurora.org>
 <000586cb-8364-e4c9-2707-c54f58a0246c@linaro.org>
 <14139b5aca1f35ecf096d5a096c9dbc8@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <8ab6f5d2-68c3-7d7a-367a-97e9cccde56e@linaro.org>
Date:   Tue, 16 Mar 2021 20:19:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <14139b5aca1f35ecf096d5a096c9dbc8@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/03/2021 19:45, khsieh@codeaurora.org wrote:
> On 2021-03-14 06:28, Dmitry Baryshkov wrote:
>> On 05/03/2021 16:29, Krishna Manikandan wrote:
>>> Add bindings for Snapdragon DisplayPort controller driver.
>>>
>>> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
>>> Signed-off-by: Vara Reddy <varar@codeaurora.org>
>>> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
>>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>>> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>>
>> Krishna, Stephen, I've a question basing on our experiments with the
>> DP on sm8250.
>> Which driver will reparent dispcc's DP clocks to the DP_PHY clocks?
>>
>> We can do this using the assigned-clocks-parents either in the dispcc
>> or in the DP nodes. Which would be preferable?
> at sc7180.dtsi, it is done at DP node

Could you please add those lines to the dtsi example you are providing?


-- 
With best wishes
Dmitry
