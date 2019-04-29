Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D354BE2AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2019 14:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728125AbfD2McA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Apr 2019 08:32:00 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40626 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbfD2McA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Apr 2019 08:32:00 -0400
Received: by mail-wr1-f68.google.com with SMTP id h4so15770037wre.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2019 05:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J+R3ULFuivqCroDmyHdR6QeN5i6XybMa9wYXAD9HdoI=;
        b=FhjN1q4D9xSQdKRvKqLb6bXiE4x8oKWApJ29y4vHLBKgXmgz/mvifY8jTyLX9LKKOK
         FFpa8rkgEQ1oXBrAb/K59Q/0KVoNsLIftYHqK7KxMhWKW2CKe6eEcCKdA1okcKsd7EUl
         rvKEnvGKtF8H+fRnT6Phc80jJj0a6hs02LBsJKgBLWET6tCQE37IKZL3spAPNTXqBO88
         TeEwb2BSHa5CN1ciFqzdaZdhDt9VzyqaJTE4bROGhFwz+rXDtKMc08DrZKde+/FOWgiC
         AdsvmfHZrsHWCfXQiX6B3eLWz1+30BdOmaSgoGg2+udivvgyGrsYfT9OhzKvSIsgivBh
         R8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J+R3ULFuivqCroDmyHdR6QeN5i6XybMa9wYXAD9HdoI=;
        b=Y121Ji3ttwh+8TEZ4YKGDrWu6YghxGxvy5iQetwAlmcTkd+OexVpSY04wD7TUAJeuy
         JTfdfdjbYFcMn1dJO1Nl3bxp8YRs3QGzie2AT43XbZn3idD5/sp9O5Ia7ocpSs+z2H4q
         L+PSc/LdvQ4+SwgrRRLQccYMCbLEofBXFGZb+HAR+TVIcZlIsOEykJvAG8Xtbcr43yRz
         jXyZjLsc4qX3nd/4YGVBLs9VkHROeicsFPLP44dMditFS1x8zxZN6Y5CnsWtrsaELF7z
         WGtC/KzUngyYvTDCJSOQSbC0hbjFWvvY1jcoqyoFAVcoNJpqYWrLTIyK1hsQ+ayLSx6T
         RQLw==
X-Gm-Message-State: APjAAAV//kdYSVlZQmfrGtme8wjzcXwrr9DRGOfMrSJqoMUK5TjKLyla
        HPIBZ8lWsXjtu/rX8Ut4S8tykkClw88=
X-Google-Smtp-Source: APXvYqzJTCXEuZ49M7Ut3ACdg7WkhG5ySWXB30Pkc5rXI9tabDQxJUF/Ps+PvdWhhZ9XTwdMl0EnaA==
X-Received: by 2002:a05:6000:c2:: with SMTP id q2mr3339535wrx.324.1556541118263;
        Mon, 29 Apr 2019 05:31:58 -0700 (PDT)
Received: from [192.168.1.2] (200.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.200])
        by smtp.gmail.com with ESMTPSA id j13sm24846129wrd.88.2019.04.29.05.31.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 05:31:57 -0700 (PDT)
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
To:     Mark Brown <broonie@kernel.org>
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        niklas.cassel@linaro.org, khasim.mohammed@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <1548675904-18324-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548675904-18324-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20190204090301.GC23441@sirena.org.uk>
 <95276ca0-6896-a595-867a-184a518fa31f@linaro.org>
 <20190425183736.GF23183@sirena.org.uk>
 <022b3c6a-e356-3c5a-3c46-c6edcf4f8cd5@linaro.org>
 <20190427182113.GL14916@sirena.org.uk>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <a3c281d5-d30e-294f-71ab-957decde2ba0@linaro.org>
Date:   Mon, 29 Apr 2019 14:31:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190427182113.GL14916@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/27/19 20:21, Mark Brown wrote:
> On Thu, Apr 25, 2019 at 09:44:00PM +0200, Jorge Ramirez wrote:
> 
>> the way I see it, if I follow your suggestion and since we are not
>> allowed to extend spmi_regulator_find_range(), the only options are:
> 
>> 1) duplicate verbatim this whole function
>> (spmi_regulator_select_voltage_same_range) with a minor change (this
>> amount of code duplication in the kernel seems rather unnecessary to me)
> 
>> 2) modify the struct spmi_regulator definition with a new operation that
>> calls a different implementation of find range (seems a massive overkill)
> 
> Since the point of this change is AFAICT that this regulator only has a
> single linear range it seems like it should just be able to use the
> existing generic functions shouldn't it?  

yes that would have been ideal but it does not seem to be the case for
this hardware.

The register that stores the voltage range for all other SPMI regulators
(SPMI_COMMON_REG_VOLTAGE_RANGE 0x40) is used by something else in the
HFS430: SPMI_HFS430_REG_VOLTAGE_LB 0x40 stores the voltage level in two
bytes 0x40 and 0x41;

This overlap really what is creating the pain: HFS430 cant use 0x40 to
store the range (even if it is only one)

so yeah, most of the changes in the patch are working around this fact.

enum spmi_common_regulator_registers {
	SPMI_COMMON_REG_DIG_MAJOR_REV		= 0x01,
	SPMI_COMMON_REG_TYPE			= 0x04,
	SPMI_COMMON_REG_SUBTYPE			= 0x05,
	SPMI_COMMON_REG_VOLTAGE_RANGE		= 0x40, ******
	SPMI_COMMON_REG_VOLTAGE_SET		= 0x41,
	SPMI_COMMON_REG_MODE			= 0x45,
	SPMI_COMMON_REG_ENABLE			= 0x46,
	SPMI_COMMON_REG_PULL_DOWN		= 0x48,
	SPMI_COMMON_REG_SOFT_START		= 0x4c,
	SPMI_COMMON_REG_STEP_CTRL		= 0x61,
};

enum spmi_hfs430_registers {
	SPMI_HFS430_REG_VOLTAGE_LB		= 0x40, *******
	SPMI_HFS430_REG_VOLTAGE_VALID_LB	= 0x42,
	SPMI_HFS430_REG_MODE			= 0x45,
};

It just needs it's own
> set/get_voltage_sel() operations.  As far as I can see the main thing
> the driver is doing with the custom stuff is handling the fact that
> there's multiple ranges but that's not an issue for this regulator.
> It's possible I'm missing something there but that was the main thing
> (and we do have some generic support for multiple linear ranges in the
> helper code already, can't remember why this driver isn't using that -
> the ranges overlap IIRC?).
> 
> TBH looking at the uses of find_range() I'm not sure they're 100%
> sensible as they are - the existing _time_sel() is assuming we only need
> to work out the ramp time between voltages in the same range which is
> going to have trouble.
> 

