Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0D44580C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 23:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234568AbhKTWOL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 17:14:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbhKTWOL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 17:14:11 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C69C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 14:11:07 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id t30so24824285wra.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 14:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nX1VQc7JGS93PsTXgzyizvFwr9rOPMi0Bz54dHw9UwY=;
        b=jCzMLBI4pgx1hBWR0vR348kxlEBjdPw6WBTEannHEFs2XgVyx1YDlmubrw7JHCbDn1
         /zo3JeIbZtHpyULaTCOQGi3Sq4zTs18qKN2/4HhgHYtDfdSbYkGhC//WMWpyovwsUFq+
         PpAeeKp5Na4VHOMGYNrgZcybdaJrnnZW1LsOJLySf+j/pfbh8ZC8zAnVqf9P1D4rhD8y
         c6DIVRCCS9F3Q/ygLNeQ0/uoLzEw3YlCzT+9vLjC3PdPf0Fd7lp9/ukveQMaJD6loTNa
         ReWkseznPc8a5zG6/IM1y0MfmGZXTxDEn83ZOo9yhiAQyQJuSAWk9CQmVmh47l6fyjMm
         8jBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nX1VQc7JGS93PsTXgzyizvFwr9rOPMi0Bz54dHw9UwY=;
        b=12HscV0MHnIC1ClIAkICGTf6RZviIjA3m7oBN5/TdC4iU/Mj/eO/yyHBVTMnkv8xMo
         jpj0SjfaQzs0DT+AjwcmQZasO1pJOsCR3CYKPHBI+8BZzW7a26nc7xZc+ltlH4dzovt9
         Ue4nxJYYEnleDP6TE5sJzZixiEX1ssP18QVmltuM8BxFcNTEIWno8GjwDCqXslvTFB0H
         Ao9gB5P6kxzRmK2jK37O0OI0HiPhT8PB8MWjZrDpBhMeMpoaa+2IKv7mjY4cvoOz0fUy
         KYh7p5BEKl1cynUVOAImmpeTbhGh5hXz7mIg7K/4YsFXhhUKO4exqSQWH0lm7EnPgcq7
         eSng==
X-Gm-Message-State: AOAM530yLKC8s8A+wUyjhVtJ20f1hwaxcxRQa/CvaFgCieNdZs0ze2Zl
        Do25oGJfAtT1xn7K+LzH2GSqP5L/e8w=
X-Google-Smtp-Source: ABdhPJxMyADAlzh+/XtHM//pRW9Sta3BxtjybnHUV9bT8ZDN1yntFNvGxHxjzXLCcL/NRqOuiDa+QA==
X-Received: by 2002:adf:dd87:: with SMTP id x7mr21398993wrl.158.1637446265534;
        Sat, 20 Nov 2021 14:11:05 -0800 (PST)
Received: from debian64.daheim (p4fd09ac4.dip0.t-ipconnect.de. [79.208.154.196])
        by smtp.gmail.com with ESMTPSA id e12sm4817570wrq.20.2021.11.20.14.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 14:11:05 -0800 (PST)
Received: from localhost.daheim ([127.0.0.1])
        by debian64.daheim with esmtp (Exim 4.95)
        (envelope-from <chunkeey@gmail.com>)
        id 1moYZc-000Bil-RN;
        Sat, 20 Nov 2021 23:11:04 +0100
Message-ID: <3c73ee75-f588-f598-3942-de0c1738b722@gmail.com>
Date:   Sat, 20 Nov 2021 23:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] ARM: dts: qcom: ipq4019: fix sleep clock
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Pavel Kubelun <be.dissent@gmail.com>,
        Andy Gross <agross@kernel.org>
References: <20211031155650.487158-1-chunkeey@gmail.com>
 <YZWsAN+bWkmiHkM6@builder.lan>
From:   Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <YZWsAN+bWkmiHkM6@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 18/11/2021 02:27, Bjorn Andersson wrote:
> On Sun 31 Oct 10:56 CDT 2021, Christian Lamparter wrote:
> 
>> From: Pavel Kubelun <be.dissent@gmail.com>
>>
>> It seems like sleep_clk was copied from ipq806x.
>> Fix ipq40xx sleep_clk to the value QSDK defines.
>>
>> Also rename the sleep clock node like the GCC driver names it.
>>
>> Link: https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-msm/commit/?id=d92ec59973484acc86dd24b67f10f8911b4b4b7d
>> Link: https://patchwork.kernel.org/comment/22721613/
>> Signed-off-by: Pavel Kubelun <be.dissent@gmail.com>
>> Signed-off-by: Christian Lamparter <chunkeey@gmail.com> (resend)
>> ---
>>   arch/arm/boot/dts/qcom-ipq4019.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
>> index 7a181352b306..ed40bef91e45 100644
>> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
>> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
>> @@ -144,9 +144,9 @@ pmu {
>>   	};
>>   
>>   	clocks {
>> -		sleep_clk: sleep_clk {
>> +		sleep_clk: gcc_sleep_clk_src {
> 
> Underscore is not a valid character in node names, so it should named
> something like sleep-clk.


Ok, this is a bit awkward. The current DeviceTree Specification 0.3v list
the "underscore" in "Table 2.1: Valid characters for node names". (Page 7)
<https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf>

But...
> It would be nice if the clock driver was converted to using parent_data
> and fw_name and a clocks reference in the gcc node to &sleep_clk, but if
> you need something that works with the current implementation then
> 
>    clock-output-names = "gcc_sleep_clk_src"; >
> is your friend.
> 
> 
> But please do consider converting the gcc-ipq4019.c to acquire "xo" and
> "sleep_clk" using parent_data instead.
>


Yes, I think this could be done. Next month around the seasonal holidays,
I do think there will be some free time to run this on the IPQ40xx devices
that would otherwise be blinking away lonely at the office. (Pavel's patch
has been here so long that I knew it is "working".)

So the next series will be:
- change this patch to just fix the clock-frequency value.
- another new patch that updates gcc-ipq4019.c code
   replace all the parent_name with "xo" and "gcc_sleep_clk_src"
   with parent_data + fw_name (in the same way in which
   gcc-ipq6018.c seems to be doing it).

Is there anything I missed?

(I could throw in the sleep_clk -> sleep(-clk) change as well.
But I'll need find a justification for replacing "_" vs "-" there,
since I can't really lean on the Device-Tree spec since it
proclamates that the underscore is a "valid character"?!)

Thanks,
Christian
