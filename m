Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B721129E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2019 10:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbfECI3q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 May 2019 04:29:46 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50583 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfECI3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 May 2019 04:29:46 -0400
Received: by mail-wm1-f67.google.com with SMTP id p21so6020035wmc.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2019 01:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9BWo4wrOMB7S6ZNUaQSd5jSdL7ORd90HoRUjKXASCiQ=;
        b=HHKoFlguUqMrYs86X0mAjpTHbiYUGjBZBnQY2FzIfEE8KKRzBWHZ8eb57oRe4+Bfp8
         yFXtFxpH7T9X0bXnNj6+VYMnbGFBJ+4kxQmuf9ONuGaS/9yK2/vEzUQPPu8dYC21rhr4
         jdAvNAqaDu5WTi2WjZnyXaDS1H1aQ40jn8LY/rfrD27yN2DWrmsUSaTOXMeE6ioKxmtr
         S4WT3GtCL6xcU7/RgBWqRVN/VdlcdySBgBvnKbzSEIY7pyPXuHbjlgWdX627m1slu3ma
         7GZaoBTOsBUMqkvmPxY/XA93MIZHMWOviSdD8ui/CJX7qRwAudIKteETxeZxnLVntxmo
         26eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9BWo4wrOMB7S6ZNUaQSd5jSdL7ORd90HoRUjKXASCiQ=;
        b=FkKWLc1rKw1aFqi7hsPlVmYDBPZv8UUBIpSS8fBNceL6t1Enobrx7ATk8NtKgX1pfL
         cQv7UugQIcuxNK9dczzssubXCnMnUcDCXjMUgipl1TWRfX3atSUS9gC7ieu8XNR0PWFg
         7km5VL1YVhMNXGrup4ZB7d1td+kt5lpZ6dhSZhKV7lJ+7IqR4km+5WcbYTILpSvO7+Au
         1FM67Sh9G7LDEXz6ux7hvriC6Ja2OC/toc1xlxImBbvCqfbT1BhINBolKZ+MgOYnqTmZ
         aEeYhQy2h/f4kg9JnL6Zr9h124Bb2xCcJq5ILIUZ/Xrn6D37GIH45PH5Tln4mYNUZNez
         BQ3Q==
X-Gm-Message-State: APjAAAXaG5CbErCh697fz+icBE2Qj0QyGv4Nm7cR1ADS9VjEY5EpK0tH
        gncJaRWUp50D4PlvxFhbC8ij2VcsQuA=
X-Google-Smtp-Source: APXvYqyVCwBwURKCdJNbafReM5dEKW0CL0LzHWCrcu7tg33cbbP2AxeFXU3xXgXEccvg/l0jXNBytw==
X-Received: by 2002:a1c:ce:: with SMTP id 197mr5168760wma.105.1556872184621;
        Fri, 03 May 2019 01:29:44 -0700 (PDT)
Received: from [192.168.1.2] (200.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.200])
        by smtp.gmail.com with ESMTPSA id n4sm1714792wmk.24.2019.05.03.01.29.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 01:29:43 -0700 (PDT)
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
To:     Mark Brown <broonie@kernel.org>
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        niklas.cassel@linaro.org, khasim.mohammed@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <a3c281d5-d30e-294f-71ab-957decde2ba0@linaro.org>
 <20190502023316.GS14916@sirena.org.uk>
 <dd15d784-f2a1-78c6-3543-69bbcc1143c4@linaro.org>
 <20190503062626.GE14916@sirena.org.uk>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <229823c4-f5d4-4821-ded1-cc046dd0bd20@linaro.org>
Date:   Fri, 3 May 2019 10:29:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190503062626.GE14916@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/3/19 08:26, Mark Brown wrote:
> On Thu, May 02, 2019 at 01:30:48PM +0200, Jorge Ramirez wrote:
>> On 5/2/19 04:33, Mark Brown wrote:
> 
>>> I'm not sure I follow here, sorry - I can see that the driver needs a
>>> custom get/set selector operation but shouldn't it be able to use the
>>> standard list and map operations for linear ranges?
> 
>> I agree it should, but unfortunately that is not the case; when I first
>> posted the patch I was concerned that for a regulator to be supported by
>> this driver it should obey to the driver's internals (ie: comply with
>> all of the spmi_common_regulator_registers definitions).
> 
> That's not a requirement that I'd particularly expect - it's not unusual
> for devices to have multiple different styles of regulators in a single
> chip (eg, DCDCs often have quite different register maps to LDOs).
> 
>> However, since there was just a single range to support, the
>> modifications I had to do to support this SPMI regulator were minimal -
>> hence why I opted for the changes under discussion instead of writing a
>> new driver (which IMO it is an overkill).
> 
>> what do you think?
> 
> It seems a bit of a jump to add a new driver - it's just another
> descriptor and ops structure isn't it?  Though as ever with the Qualcomm
> stuff this driver is pretty baroque which doesn't entirely help though I
> think it's just another regulator type which there's already some
> handling for.
> 

So how do we move this forward?

To sum up his regulator needs to be able to bypass accesses to
SPMI_COMMON_REG_VOLTAGE_RANGE and provide the range in some other way
hence the change below

I can't find a simpler solution than this since the function does now
what is supposed to do for all the regulator types supported in the driver

 @@ -653,6 +708,10 @@ spmi_regulator_find_range(struct spmi_regulator *vreg)
  	range = vreg->set_points->range;
  	end = range + vreg->set_points->count;

 +	/* we know we only have one range for this type */
 +	if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430)
 +		return range;
 +
  	spmi_vreg_read(vreg, SPMI_COMMON_REG_VOLTAGE_RANGE, &range_sel, 1);

  	for (; range < end; range++)



