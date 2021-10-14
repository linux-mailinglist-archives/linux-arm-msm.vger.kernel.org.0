Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0279642DE9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 17:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbhJNPuJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 11:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhJNPuH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 11:50:07 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E40BC061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 08:48:02 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 62-20020a9d0a44000000b00552a6f8b804so8206991otg.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 08:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=hbR9jDVBBL9LrB2pOCJprmyW22OK6/fYxG0rLyaPsnY=;
        b=EjF8K3nQwSMekVFW1o8P1faUwLJg1gRx+DrYQ5Nj0Vk0otvVw1UXqCPwRhh2sjA11A
         e5bd3BEAzCvYUJOvue+ux2bajAADtWrsFc5jo6hvHRreXXLwrFPdv+VqSXcpInc4+lqf
         4zt/nKRq4dOYe1i7fI45wM6GAQeQ9IDnbKSjPbCfL7+onrbzUp4sYfgkKta3DrqJYX/s
         6rdpflPVv+yo1Q4x95Xag15wT0aqAr60XS8k8JRZ+d4eWfkei0eOARSMJbp9+jL9hL25
         litux9HwEseWdPllEcY+h1IV+57CZe8cCRcEvQlyfao9r4CCsXrIhuflH4c7vgRI5hfe
         uOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=hbR9jDVBBL9LrB2pOCJprmyW22OK6/fYxG0rLyaPsnY=;
        b=FM2IaVn7ElKkdMPUStbvji63U3pItgmGNVnz24sQg4T7cOFdcUsec4saAjgOVM6tXJ
         aQlANv+LZKYq3F8L2TIR+yERFyo1ZRc4RsRKvwXVPlwI9Q5FK/00BKPzkIHwgr+NIub5
         nKeEAkfaWT2tcOcYwuLnN060HVjPVjjVFp4hRlbY4cnFtIT0pZdtTJcFGHN51JsWGFa/
         F7YM6OZN+jaxtCCHq6iHpTnWcO5oAW3Gv0UHRNqR4rCvskcQgf6GeBkNZs09kWNggzsA
         tmpEcXoXaz1ktPZGuFLGGYLIGCavaJoS9IYPT2b1uQB63ctlwJAKsJFIouOWa5AjTv8K
         eQzw==
X-Gm-Message-State: AOAM533EOFImH4cBkyWCXb9tgL+dowRgdPuTy906tP/mXbFR0/aeugkB
        A5mq6DvEWKi9JHrJTqQfZXRRzQ==
X-Google-Smtp-Source: ABdhPJyV8JHhzDTk+XAt2v0znsmcOuwCvRI1zbpN1/FJFEKYcfFu0izzrK4q+k6YmAncYOWYLalj+g==
X-Received: by 2002:a9d:2c22:: with SMTP id f31mr3156570otb.303.1634226481508;
        Thu, 14 Oct 2021 08:48:01 -0700 (PDT)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id s18sm636867otd.55.2021.10.14.08.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 08:48:00 -0700 (PDT)
Message-ID: <34f333b7-ee76-874a-18c2-fb4c353e691d@kali.org>
Date:   Thu, 14 Oct 2021 10:47:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: Revert "arm64: dts: qcom: sm8250: remove bus clock from the mdss
 node for sm8250 target"
Content-Language: en-US
From:   Steev Klimaszewski <steev@kali.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
References: <20211014135410.4136412-1-dmitry.baryshkov@linaro.org>
 <298400eb-fe8d-6a92-6ff4-6188a8f3161a@kali.org>
In-Reply-To: <298400eb-fe8d-6a92-6ff4-6188a8f3161a@kali.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/14/21 10:42 AM, Steev Klimaszewski wrote:
>
> On 10/14/21 8:54 AM, Dmitry Baryshkov wrote:
>> From: Amit Pundir <amit.pundir@linaro.org>
>>
>> This reverts commit 001ce9785c0674d913531345e86222c965fc8bf4.
>>
>> This upstream commit broke AOSP (post Android 12 merge) build
>> on RB5. The device either silently crashes into USB crash mode
>> after android boot animation or we see a blank blue screen
>> with following dpu errors in dmesg:
>>
>> [  T444] hw recovery is not complete for ctl:3
>> [  T444] [drm:dpu_encoder_phys_vid_prepare_for_kickoff:539] [dpu 
>> error]enc31 intf1 ctl 3 reset failure: -22
>> [  T444] [drm:dpu_encoder_phys_vid_wait_for_commit_done:513] [dpu 
>> error]vblank timeout
>> [  T444] [drm:dpu_kms_wait_for_commit_done:454] [dpu error]wait for 
>> commit done returned -110
>> [    C7] [drm:dpu_encoder_frame_done_timeout:2127] [dpu error]enc31 
>> frame done timeout
>> [  T444] [drm:dpu_encoder_phys_vid_wait_for_commit_done:513] [dpu 
>> error]vblank timeout
>> [  T444] [drm:dpu_kms_wait_for_commit_done:454] [dpu error]wait for 
>> commit done returned -110
>>
>> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi 
>> b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index 8c15d9fed08f..d12e4cbfc852 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -2590,9 +2590,10 @@
>>               power-domains = <&dispcc MDSS_GDSC>;
>>                 clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
>>                    <&gcc GCC_DISP_SF_AXI_CLK>,
>>                    <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> -            clock-names = "iface", "nrt_bus", "core";
>> +            clock-names = "iface", "bus", "nrt_bus", "core";
>>                 assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>>               assigned-clock-rates = <460000000>;
>
>
> Is this the correct fix for the issue?  I see those same messages on 
> the Lenovo Yoga C630 every so often as well as the blue screen, 
> however I see them on both 5.14 (which does not have the related 
> commit to this), and in 5.15-rcX, which does.  Or does this just 
> revert it enough that it doesn't occur as often?
>
Apologies, I hit send too soon.  To test here, I reverted 
111c52854102983f which is the related sdm845 commit, and the first 
reboot to test reverting it, I ended up with the bluescreen and the 
messages mentioned in the commit message above.
