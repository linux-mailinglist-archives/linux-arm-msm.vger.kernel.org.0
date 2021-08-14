Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753B43EC215
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Aug 2021 12:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237828AbhHNKqe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Aug 2021 06:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237861AbhHNKqe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Aug 2021 06:46:34 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B2AC0617AF
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Aug 2021 03:46:05 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id a201-20020a1c7fd2000000b002e6d33447f9so855948wmd.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Aug 2021 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GifoOqx6SBFwu3FmttmT9/vPFr3vQ27vYXItoPzfJbw=;
        b=iGKh7WrVF4MYNXHXmMuE4HGs2rA+BEqWJdnXx5ZB4V8/VbbgOA+EVrDUxNhEIqD3ou
         ornGW1iaYUVFiU29FPznnm5EeccA8yzASP2GO1Og95jGLgHz+Fux3CiVQh/3ppoU4wCj
         e6TXhrqpVniBVAAQhPCmNpBv327gwXRClqIw+d4GbEJubjreuydBJ0Ez2wAVAnNGlQGI
         s0gW6WB6TEi5rFjmilKmtFyCj3STAbLcnKrZiCet9tNZLODUSkClFeSs1EcXdfvmcNOn
         KhQSrlr4wcrwm3hvLDkDAjrL16ZM2AyYi85tdEAV/Z0lRBefuHBYKa+aSzTVOFm3/Vzo
         ozmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GifoOqx6SBFwu3FmttmT9/vPFr3vQ27vYXItoPzfJbw=;
        b=JDf9AnYmMhYmNH5080bEXz91e8fmgqBq9fqlO8e2Z7UhzMUY8q9u0h+OO81XQGLbLu
         8wHg1mmBxKvrp61Wou6Khpskebpl9KFUQgQvSncTBlUOa/sMiybrEQAIX0FEfxllplO9
         9bBVVtJyEufHTZIUdljixt+baHQes8yImJwiFhg3Y8+fKYZ68gnbzDdqickT8sxXv7AF
         htV9eTDZ/5TSUhi2kjM73PvnFZ0rAZE5rBTskVabYRo+wDiPOb8Prk45abOLETta/bC9
         UQZHNcRVZKna9Rq+LlDAlwxMd55zb+sIf0zBlAZIQeHllT3X3l4vITlG2qD4S9IQRfKu
         26nw==
X-Gm-Message-State: AOAM532aVBoln8ggysSGmDfIfeoyvCifWs1FIHr55Caae4drIcu0iKm/
        O0JB1CY6qfwrFBuXM9Y31sspRQ==
X-Google-Smtp-Source: ABdhPJwD51MeaLVeBz/WK26aIMBhej+CHSLIoF//Z0NKAcKPUzPRVFdORiIYFrqgmWAsn3DfbaNlBQ==
X-Received: by 2002:a05:600c:20f:: with SMTP id 15mr6639569wmi.176.1628937964110;
        Sat, 14 Aug 2021 03:46:04 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:5df3:d0eb:3945:640d? ([2a01:e34:ed2f:f020:5df3:d0eb:3945:640d])
        by smtp.googlemail.com with ESMTPSA id f2sm4210847wru.31.2021.08.14.03.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Aug 2021 03:46:03 -0700 (PDT)
Subject: Re: [PATCH v8 1/5] cpuidle: qcom_spm: Detach state machine from main
 SPM handling
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, rjw@rjwysocki.net
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, jeffrey.l.hugo@gmail.com,
        jami.kettunen@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        stephan@gerhold.net, robh@kernel.org, bartosz.dudziak@snejp.pl
References: <20210729155609.608159-1-angelogioacchino.delregno@somainline.org>
 <20210729155609.608159-2-angelogioacchino.delregno@somainline.org>
 <YQsbBQAdGhX7eO+5@builder.lan>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <f688b8b4-4fdb-4497-22db-920bd67d255e@linaro.org>
Date:   Sat, 14 Aug 2021 12:46:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQsbBQAdGhX7eO+5@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/08/2021 00:56, Bjorn Andersson wrote:
> On Thu 29 Jul 10:56 CDT 2021, AngeloGioacchino Del Regno wrote:
> 
>> In commit a871be6b8eee ("cpuidle: Convert Qualcomm SPM driver to a generic
>> CPUidle driver") the SPM driver has been converted to a
>> generic CPUidle driver: that was mainly made to simplify the
>> driver and that was a great accomplishment;
>> Though, at that time, this driver was only applicable to ARM 32-bit SoCs,
>> lacking logic about the handling of newer generation SAW.
>>
>> In preparation for the enablement of SPM features on AArch64/ARM64,
>> split the cpuidle-qcom-spm driver in two: the CPUIdle related
>> state machine (currently used only on ARM SoCs) stays there, while
>> the SPM communication handling lands back in soc/qcom/spm.c and
>> also making sure to not discard the simplifications that were
>> introduced in the aforementioned commit.
>>
>> Since now the "two drivers" are split, the SCM dependency in the
>> main SPM handling is gone and for this reason it was also possible
>> to move the SPM initialization early: this will also make sure that
>> whenever the SAW CPUIdle driver is getting initialized, the SPM
>> driver will be ready to do the job.
>>
>> Please note that the anticipation of the SPM initialization was
>> also done to optimize the boot times on platforms that have their
>> CPU/L2 idle states managed by other means (such as PSCI), while
>> needing SAW initialization for other purposes, like AVS control.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
>> Tested-by: Stephan Gerhold <stephan@gerhold.net>
> 
> Rafael, Daniel, any objections to me picking this patch through the qcom
> tree?
> 

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
