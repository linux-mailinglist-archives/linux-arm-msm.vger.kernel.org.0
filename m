Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C60A211834
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2019 13:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbfEBLdW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 May 2019 07:33:22 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38736 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfEBLdW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 May 2019 07:33:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id k16so2843811wrn.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 May 2019 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DXweF0jQ0QB/k/rGJN+kfbonyACUsE7waASKG6bvRoQ=;
        b=bbEOY3UBWHA9nrQiL1gJZ2/gGVMCmQ6IF+6rrt9NByakcOnI7qfP0GyEywuponu8xB
         Dv2Bb3Jc64sYLe+fXZr2qbenmUgi8hnFHldZqseiduLJ2q/YlmgBNbXjTURjAkHNn3Ou
         pa1yF34FYttPcROYRQITT0SEDMbW+CZAzXOI/p89sIqxq5rKvuW+VXXOxJ66KwyR+Qn+
         M1ynLwYzCUjoYIHrm2VcbjzjSyM1NRBx8z49mmDG7tTys2sFTZL1nL8QX5xPGWDR427+
         uq5L3RbwTSfeZVFJ9fWZOpBY7qyLSOJIVHGVM7VPRC0Z7yd1BZH8a9qefylcyFkJST8K
         KBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DXweF0jQ0QB/k/rGJN+kfbonyACUsE7waASKG6bvRoQ=;
        b=E2HMM0co0iiL49fa/szNzqyrq8B6Z2oOf5Zgj2LUa+kGAnq0QiXbi9omr9kl+9O9bC
         OR9o/VAZPHwbLDLrzCiHgyh2FD+TuJP4Fn9XiM0fpyEuzAtxyoNc3LuX0McTjNPYKkN1
         p/V/GhMuVXYgFYwCC9wcjsOOG4PkjVJ3vGjr38Z5ae5sIBmhYS7sDUy/HpDCAnUAbkm4
         z8Cw1LLpyP8ODY+bc1jIgRcbho0f2tuBhl42XmBkvbVQKclocfutLNqEpqbFSIjDX5GO
         ZKelHre7Cds5dFgVs4kUc8AaSZ8hcS/bCA/D5CVrp3jqZCuuWbC+VKqfSlynWCoJInXK
         lnHA==
X-Gm-Message-State: APjAAAUnrD/AsfUO1WSRcnkLfP9zUuGKDGMU7zai922ism4NA/RXE804
        4E27qOx8MZW5xUIcNu5FjZac8OHP6IE=
X-Google-Smtp-Source: APXvYqxu8aql4ZZQg5YXmNj8g7st+xGNdi3S5rbgFkkYK/EFDweHigpikBPQV/f0CEJTqIh4taQtQA==
X-Received: by 2002:adf:c748:: with SMTP id b8mr2404630wrh.292.1556796650078;
        Thu, 02 May 2019 04:30:50 -0700 (PDT)
Received: from [192.168.1.2] (200.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.200])
        by smtp.gmail.com with ESMTPSA id k16sm844785wrd.17.2019.05.02.04.30.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 04:30:49 -0700 (PDT)
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
To:     Mark Brown <broonie@kernel.org>
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        niklas.cassel@linaro.org, khasim.mohammed@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <a3c281d5-d30e-294f-71ab-957decde2ba0@linaro.org>
 <20190502023316.GS14916@sirena.org.uk>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <dd15d784-f2a1-78c6-3543-69bbcc1143c4@linaro.org>
Date:   Thu, 2 May 2019 13:30:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190502023316.GS14916@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/2/19 04:33, Mark Brown wrote:
> On Mon, Apr 29, 2019 at 02:31:55PM +0200, Jorge Ramirez wrote:
>> On 4/27/19 20:21, Mark Brown wrote:
> 
>>> Since the point of this change is AFAICT that this regulator only has a
>>> single linear range it seems like it should just be able to use the
>>> existing generic functions shouldn't it?  
> 
>> yes that would have been ideal but it does not seem to be the case for
>> this hardware.
> 
>> The register that stores the voltage range for all other SPMI regulators
>> (SPMI_COMMON_REG_VOLTAGE_RANGE 0x40) is used by something else in the
>> HFS430: SPMI_HFS430_REG_VOLTAGE_LB 0x40 stores the voltage level in two
>> bytes 0x40 and 0x41;
> 
>> This overlap really what is creating the pain: HFS430 cant use 0x40 to
>> store the range (even if it is only one)
> 
>> so yeah, most of the changes in the patch are working around this fact.
> 
> I'm not sure I follow here, sorry - I can see that the driver needs a
> custom get/set selector operation but shouldn't it be able to use the
> standard list and map operations for linear ranges?

I agree it should, but unfortunately that is not the case; when I first
posted the patch I was concerned that for a regulator to be supported by
this driver it should obey to the driver's internals (ie: comply with
all of the spmi_common_regulator_registers definitions).

However, since there was just a single range to support, the
modifications I had to do to support this SPMI regulator were minimal -
hence why I opted for the changes under discussion instead of writing a
new driver (which IMO it is an overkill).

what do you think?

> 
>>
>> enum spmi_common_regulator_registers {
>> 	SPMI_COMMON_REG_DIG_MAJOR_REV		= 0x01,
>> 	SPMI_COMMON_REG_TYPE			= 0x04,
>> 	SPMI_COMMON_REG_SUBTYPE			= 0x05,
>> 	SPMI_COMMON_REG_VOLTAGE_RANGE		= 0x40, ******
>> 	SPMI_COMMON_REG_VOLTAGE_SET		= 0x41,
>> 	SPMI_COMMON_REG_MODE			= 0x45,
>> 	SPMI_COMMON_REG_ENABLE			= 0x46,
>> 	SPMI_COMMON_REG_PULL_DOWN		= 0x48,
>> 	SPMI_COMMON_REG_SOFT_START		= 0x4c,
>> 	SPMI_COMMON_REG_STEP_CTRL		= 0x61,
>> };
>>
>> enum spmi_hfs430_registers {
>> 	SPMI_HFS430_REG_VOLTAGE_LB		= 0x40, *******
>> 	SPMI_HFS430_REG_VOLTAGE_VALID_LB	= 0x42,

ah, this definition I can remove and use the common one above. I'll do that.
>> 	SPMI_HFS430_REG_MODE			= 0x45,


>> };
>>
>> It just needs it's own
>>> set/get_voltage_sel() operations.  As far as I can see the main thing
>>> the driver is doing with the custom stuff is handling the fact that
>>> there's multiple ranges but that's not an issue for this regulator.
>>> It's possible I'm missing something there but that was the main thing
>>> (and we do have some generic support for multiple linear ranges in the
>>> helper code already, can't remember why this driver isn't using that -
>>> the ranges overlap IIRC?).
>>>
>>> TBH looking at the uses of find_range() I'm not sure they're 100%
>>> sensible as they are - the existing _time_sel() is assuming we only need
>>> to work out the ramp time between voltages in the same range which is
>>> going to have trouble.
>>>
>>

