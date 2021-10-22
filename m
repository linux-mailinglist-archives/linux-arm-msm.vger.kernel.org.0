Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8634373AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 10:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbhJVIdZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 04:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232165AbhJVIdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 04:33:24 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BDFC061764
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Oct 2021 01:31:07 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id w19so3912343edd.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Oct 2021 01:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+s3RKjcGG+MOOi5e3FStCyMo3mus4CdAelMYmF9XjNI=;
        b=XA6b/fmmHaNPaJQ3RWZTTghGLmKtShh6KbyR2G7KJhw/Dx2kZN+ehZcl1lgX9u/iPM
         3jf1s1h/0pRoiNYq7JNYf4RHU4Ew5+3dKl+rddx82JmMj887Yd0Qvhejhf/JTty8tIEV
         655GZsYB1eyWoOPS9rEr7vTrFCdt6myHuW+zwyt2bYlIWSErX2wEDuiFkSxDNemfy5/p
         7XwCzABaOuK0O1+c6vsIHnaH0YBrwdo7CukTK9IvEquCe3tVlpqi2NisDNYrOzddI71c
         F9Y/Dj0y1vw4P1gOLHkcY1+VFIFk2Rt5OSt0fZBlUmPagryhXyWfxo01DiTtVzXL9hR/
         2EEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+s3RKjcGG+MOOi5e3FStCyMo3mus4CdAelMYmF9XjNI=;
        b=K5CCma5vC+CZ2idjWdaJa8nFda5J7g0nx+eCmCcD9X28vrF03qOKoG1jkIgeJ8TdCv
         zRc77TwOtWsR9xK6FMVATvEZZF0tYveQFmImyzWdxPJyO3k4KCGITYXCzojqeXWs8HZQ
         WvdxqZ6ZyQXdkiqUaVbEMuHaPwsMlWHWopmU9Qv/eRgpUwlWQGFWfDVnsXN95KghhE+7
         HpsF5aSseepiWYOikWbco+SxtWzC8nTMhrpHdnkLWf5vMYwKsD2H3LP0J3s4oxvD1wuH
         5h7Y3HBj69S9WNFBk1JQuZYhHx4mU/8sQkRCDhVeHCUSofo8zntoi/zWSdSt43Ic7r15
         ntpg==
X-Gm-Message-State: AOAM533KUh4SQS0OQIgfQCo0CujMKobv/P68z6GD2xDR0tHVQgFGmZjQ
        kuBlffWuU+vUA49xeGfROzBE9g==
X-Google-Smtp-Source: ABdhPJyjALlIYBx258q1rME3+PI/RUJSvPoCUA5pHFn2TnQwq1Dol04vdP1h5OJqKSklFppy+EzwbQ==
X-Received: by 2002:a17:906:5805:: with SMTP id m5mr13683921ejq.221.1634891464458;
        Fri, 22 Oct 2021 01:31:04 -0700 (PDT)
Received: from [192.168.1.15] (hst-221-79.medicom.bg. [84.238.221.79])
        by smtp.googlemail.com with ESMTPSA id e7sm4448621edk.3.2021.10.22.01.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 01:31:03 -0700 (PDT)
Subject: Re: [RESEND PATCH v6] arm64: dts: qcom: sc7280: Add venus DT node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, stanimir.varbanov@linaro.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
References: <1632199829-25686-1-git-send-email-dikshita@codeaurora.org>
 <YUpZaQ42ldzEKtV/@builder.lan>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <68a9da44-b568-85e9-6ec4-28fc8d95633f@linaro.org>
Date:   Fri, 22 Oct 2021 11:31:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUpZaQ42ldzEKtV/@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dikshita,

On 9/22/21 1:15 AM, Bjorn Andersson wrote:
> On Mon 20 Sep 23:50 CDT 2021, Dikshita Agarwal wrote:
> 
>> Add DT entries for the sc7280 venus encoder/decoder.
>>
>> this patch depends on [1].
>>
>> [1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=529463

Please drop those two lines above.

> 
> The stuff you write here will be forever imprinted in the git history
> and it's already unnecessary, given that the patch you reference here is
> available in linux-next.
> 
> Things you want to mention, but shouldn't go into the git history, put
> those below the '---' line.
> 
>>
>> Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>

I guess this should be :

Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>

but checkpatch --strict should complain about this, no?

>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 75 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 75 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index a8c274a..f171ababc 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -63,6 +63,11 @@
>>  			no-map;
>>  			reg = <0x0 0x80b00000 0x0 0x100000>;
>>  		};
>> +
>> +		video_mem: memory@8b200000 {
>> +			reg = <0x0 0x8b200000 0x0 0x500000>;
>> +			no-map;
>> +		};
>>  	};
>>  
>>  	cpus {
>> @@ -1063,6 +1068,76 @@
>>  			qcom,bcm-voters = <&apps_bcm_voter>;
>>  		};
>>  
>> +		venus: video-codec@aa00000 {
>> +			compatible = "qcom,sc7280-venus";
> 
> I do however now see this compatible defined in a binding in linux-next,
> so you definitely should have listed that patch as a dependency - and
> preferably held off sending me 6 versions (plus resend) of a patch that
> I can't merge.
> 
> Please ping me once the binding is merged, so that I know when I can
> merge this patch.
Bjorn, the binding is in linux-next now.

-- 
-- 
regards,
Stan
