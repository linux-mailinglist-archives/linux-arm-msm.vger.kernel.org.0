Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56DBC34515F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 22:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhCVVDk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 17:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbhCVVDL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 17:03:11 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FED8C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 14:03:10 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id k25so14570172oic.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 14:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=J+A9ojsnNjMrHE9ArfI7Q+0i6qI+gIjNjX+u2wcLwkw=;
        b=ssSV4kY1qipo+HgUrIqJwJZXtjviSAd4xuz5qC4DXpD7dpaY6coOBSf7O/Tv843YSX
         +L9xzhyfYhwkoPQ4O05Zk6Zh2dfULIYbq+qE8AkAf5JngW/eynu/x677EVSIYDN6gbCn
         CVkDV+hqkR7a+3PIpiIzzGjS5TmyY8U9Ym1WktgReljX9I+tG4TskdJsd66l1A1T+Nwu
         44F+SkAQUhirAC1wBxFFlsVAmzxnNFhCw0oCpKAbCpn0Fb/jvdhjGCtuHrNYfSL7t4XK
         A42uqMrN8uM26Wjpxqb0iMkIgtVMqocW9jz9rmPx0QA5vWCEBD62rA7ntrx4Aw3A5qZZ
         E73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J+A9ojsnNjMrHE9ArfI7Q+0i6qI+gIjNjX+u2wcLwkw=;
        b=REMNJVJ5pfgIxIXYiNcA69wQZqTsx8wirH3s5GPGyS3Yhdborj7OhkOzB4/TY7/bWO
         P01XBF+O9djoD2PZ8UDXUPYtm/bTJpkGgz4iENrTBJqqoF5kwCfp3vXqieXs2zQZk6Er
         XJACqlDIF2do0EgBQrEplDDz+4jDx67MkQmtDGwPWNIpWRNeniq1rSu+hJ6KBm1TvI6J
         TqgHlqfxPBRemZgxH7NADu3jvB3Fs3VM7KGxBFbZM4BN4BA67L0cR+hdwPhRThCiES84
         iuiiMdC35iLeWxCLc8PyvwIFdD0gx5kuOsH0L+x4HkauLIS+OmgXDajA36zyIMRjMuQi
         kIKw==
X-Gm-Message-State: AOAM531PPXo5R/IDZDF/4QaTP06+0U4td6XhMNTjlMELAF4+awUOjADr
        PNDnAIR0aOZfPB29K4RbL6PaiIw6EH+Dn8oD
X-Google-Smtp-Source: ABdhPJzYdFQuIv1tG2Dp7uDERs0a7koUI0SZCtJNWz0ClNr21Dy7PtBQdei5kRSYW2By/9RZpoqzVQ==
X-Received: by 2002:a05:6808:ab0:: with SMTP id r16mr703284oij.34.1616446987678;
        Mon, 22 Mar 2021 14:03:07 -0700 (PDT)
Received: from ?IPv6:2806:10b7:2:e880:2c32:cfff:fe8e:de1f? ([2806:10b7:2:e880:2c32:cfff:fe8e:de1f])
        by smtp.gmail.com with ESMTPSA id n17sm3409664oic.8.2021.03.22.14.03.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 14:03:07 -0700 (PDT)
Subject: Re: [PATCH 5/5] arm64: dts: qcom: msm8916: Enable modem and WiFi
To:     linux-arm-msm@vger.kernel.org
References: <20210312003318.3273536-1-bjorn.andersson@linaro.org>
 <20210312003318.3273536-6-bjorn.andersson@linaro.org>
 <YFTA8gEPp1x6o/9f@gerhold.net>
From:   Anibal Limon <anibal.limon@linaro.org>
Message-ID: <4d0c3a46-5657-4e48-f7c7-1b653978b1af@linaro.org>
Date:   Mon, 22 Mar 2021 15:03:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFTA8gEPp1x6o/9f@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/19/21 9:19 AM, Stephan Gerhold wrote:
> Hi Bjorn,
> 
> On Thu, Mar 11, 2021 at 04:33:18PM -0800, Bjorn Andersson wrote:
>> Enable the modem and WiFi subsystems and specify msm8916 specific
>> firmware path for these and the WCNSS control service.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> The changes itself look good to me, but the commit message is really
> misleading. It does not mention anywhere that the change actually just
> enables "modem" on apq8016-sbc instead of "msm8916". :)
> 
> Also, WCNSS was actually enabled before already (with the default
> firmware path). In my opinion, it would be clearer to change the
> firmware-name for it in an extra patch.
> 
>> ---
>>   arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 12 ++++++++++++
>>   arch/arm64/boot/dts/qcom/msm8916.dtsi     |  2 +-
>>   2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
>> index 6aef0c2e4f0a..448e3561ef63 100644
>> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
>> @@ -305,6 +305,12 @@ &mdss {
>>   	status = "okay";
>>   };
>>   
>> +&mpss {
>> +	status = "okay";
>> +
>> +	firmware-name = "qcom/msm8916/mba.mbn", "qcom/msm8916/modem.mbn";
>> +};
>> +
>>   &pm8916_resin {
>>   	status = "okay";
>>   	linux,code = <KEY_VOLUMEDOWN>;
>> @@ -312,6 +318,8 @@ &pm8916_resin {
>>   
>>   &pronto {
>>   	status = "okay";
>> +
>> +	firmware-name = "qcom/msm8916/wcnss.mbn";
>>   };
>>   
> 
> How do I get a .mbn from the wcnss.{mdt,.b??} files provided in the
> DB410c firmware package? I guess I should just run them through
> https://github.com/andersson/pil-squasher?
> 
> Also, is the single file format (mbn) preferred now? Not sure if there
> is any significant difference except having less files laying around.

Same issue here, where can I get mbn file?,

After change the file to use wcnss.mdt this patch works.

Regards,
Anibal
> 
> Thanks,
> Stephan
> 
> 
