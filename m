Return-Path: <linux-arm-msm+bounces-41772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDBF9EEB60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 769F51883D46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 15:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0372153FC;
	Thu, 12 Dec 2024 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a0mqSv03"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83702AF0E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016744; cv=none; b=dzjRoRM8eqb1PTxTojXkMkm9R0nwDPuPuMiG2cDfQpMooBQIwQqge6uzv9badp/FwhAQjTAAYMJkHeQ8gVJMahbfznEiKUTQsQ/LAGeXq/9XotxGPe2LRkFEB4dr2BNSbAf9dqduGbFI/9UOL/i1xlID+5lV4AJcyCvP9zWU0PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016744; c=relaxed/simple;
	bh=YPL5Rcw9NwOwjZl7LuLRepPy6/WVmCF0fWjOw9gg3dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yiqxe+6TkctDJt9tteCCwUwvgjZeKqdMq5KZgmB/jboTlU4F13mC6eHjuCBS4PSD0d4YG6hiUwNzlNbm+qyxaThqXRO4hNFGdlNwRDmTb+fD81PlNhsgu/73MLdg0AfUjUPFqu5ME6hWk/KumrK/KE0PuyAt5uspACH0MxQHr0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a0mqSv03; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9e44654ae3so101911166b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 07:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734016741; x=1734621541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5s3jzibw/eg/WW/zvL3ff5i+HaWQ3JQi8QuJHkqXcc=;
        b=a0mqSv03NhGMAY9goch3AVMxSSeUVBTgkJSplOMMZLWLJpi3ROCEJu+V7z/4PZZowa
         PYlk05w9TUM1YoLGMnUTBjDY06Q40TLDDW93OBjBpt4y+iQiu637dj5tgFZvztN02afi
         +zbjuVwyGnsGO85k3mYlCyrFq+17NQI8dt6sWmeTsuIfm8FBYZXVRw/y5X9XimQzVZjU
         6u1lfBNZRXdyZmzvolXNw9KwmqcYSu4rAqOkASFq3rQ419wvlWoIYGaCBRaK/YYWDTO4
         lQ9yqKepS0RiBqoz+1AA3xe6fg3wcGwMQTWgsxMO8cqrvRkmdwEA3ZDHxGMTIBQXCscE
         k2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734016741; x=1734621541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5s3jzibw/eg/WW/zvL3ff5i+HaWQ3JQi8QuJHkqXcc=;
        b=dutpauDJhhZs7UMRDJ7MeraCImHeyYJIKbKJV2Avbo647Dar7nYZ4zMLfNZBA60yPl
         hNs80SnC/yTJ+mbA3Xc5LSmEXgxLUY1Ytnf7FH2SblIxB61PvzDtQtsHh6cMdeLeknZD
         iCWqfa051dTijyEFItFrX49RtsZhlEXRl2KY9vCBEB0dTUoz/reMBzF8kpnfFpTYFnUV
         V8l/e+cMDUNUOybjv6r2GqXwiNGeLKYbcAe6RrFHtKWtt/HUXnalztMTcrt/p8TgklHA
         jOM4rFYBijhNNfTAK4M/QPvRUT+R/07bISsoA5XkY6NmapoKBIP4zA18LEkJk+JugPj8
         /CbA==
X-Gm-Message-State: AOJu0Yz24OK9DJxDgf/R2Ld/OOB/oxOBCyaiEbtpnSfM3vlWXkfjfJUH
	+gJNIjR/Yw76jEOYlGrL3FS59DFulxCk3ng2b0hA3u+QsNp5s8bWZsgURBUVknU=
X-Gm-Gg: ASbGncu8Dhzo0pjbEC3ArMZdXA46ErEYyXi8cT92OaiZUN9+Va6BIZsuJ6Ym/q3kT2q
	XU9Q8XVUe9kh6zbaZ9ZFz5uOLTkbqdXqDvDUBZNXQI6XtMPdOCtcNzn0c7jQzhH5Mz2HY1nf8sZ
	fk1MLetXnYEDPHKgoSgZaW3ZStEXQ1brkK4KUDp754GVDgKbP3PyNx/0vVOMmgULkl/Buq3Zcu9
	ZrbHAP1r7hmFWX7Devopuk2ZqHcxK1PX1ZadvHi77jwnI1OTYNTwC5PPbBR1VsL/QxlYg==
X-Google-Smtp-Source: AGHT+IH+1eH05FyuvRpMmJ+Z4vENHiIUCNWjM4MAUe8J599EQaMvlhkwlKUCZlQTLZmum7gFLPpFcw==
X-Received: by 2002:a17:907:7856:b0:aa6:2b8b:20c6 with SMTP id a640c23a62f3a-aa6b11a0dd4mr666606166b.20.1734016740937;
        Thu, 12 Dec 2024 07:19:00 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68fc81ccbsm546363766b.138.2024.12.12.07.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:19:00 -0800 (PST)
Message-ID: <aa060993-3171-490f-bcb8-48ca0084f06c@linaro.org>
Date: Thu, 12 Dec 2024 15:18:59 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] clk: qcom: Support attaching GDSCs to multiple
 parents
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
 <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-3-5d93cef910a4@linaro.org>
 <ec2d1916-45b5-4b90-ade2-3fdc091fc0b8@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ec2d1916-45b5-4b90-ade2-3fdc091fc0b8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/2024 15:06, Vladimir Zapolskiy wrote:
> Hi Bryan.
> 
> On 12/11/24 18:54, Bryan O'Donoghue wrote:
>> When a clock-controller has multiple power-domains we need to attach the
>> GDSCs provided by the clock-controller to each of the list of power- 
>> domains
>> as power subdomains of each of the power-domains respectively.
>>
>> GDSCs come in three forms:
>>
>> 1. A GDSC which has no parent GDSC in the controller and no child GDSCs.
>> 2. A GDSC which has no parent GDSC in the controller and has child GDSCs.
>> 3. A child GDSC which derives power from the parent GDSC @ #2.
>>
>> Cases 1 and 2 are "top-level" GDSCs which depend on the power-domains 
>> - the
>> power-rails attached to the clock-controller to power-on.
>>
>> When dtsi::power-domains = <> points to a single power-domain, Linux'
>> platform probe code takes care of hooking up the referenced power-domains
>> to the clock-controller.
>>
>> When dtsi::power-domains = <> points to more than one power-domain we 
>> must
>> take responsibility to attach the list of power-domains to our
>> clock-controller.
>>
>> An added complexity is that currently gdsc_enable() and gdsc_disable() do
>> not register the top-level GDSCs as power subdomains of the controller's
>> power-domains.
>>
>> This patch makes the subdomain association between whatever list of
>> top-level GDSCs a clock-controller provides and the power-domain list of
>> that clock-controller.
>>
>> What we don't do here is take responsibility to adjust the voltages on
>> those power-rails when ramping clock frequencies - PLL rates - inside of
>> the clock-controller.
>>
>> That voltage adjustment should be performed by operating-point/ 
>> performance
>> setpoint code in the driver requesting the new frequency.
>>
>> There are some questions that it is worth discussing in the commit log:
>>
>> 1. Should there be a hierarchy of power-domains in the clock-controller ?
>>
>>     In other words if a list of dtsi::power-domains = <pd_a, pd_b, ..>
>>     should a specific hierarchy be applied to power pd_a then pd_b etc.
>>
>>     It may be appropriate to introduce such a hierarchy however reasoning
>>     this point out some more, any hierarchy of power-domain dependencies
>>     should probably be handled in dtsi with a chain of power-domains.
> 
> If so, the description shall be found under Documentation/devicetree/ 
> bindings/

I agree, I don't get your statement here, are you asking for additional 
text ?

> 
>>     One power-domain provider would point to another via
>>     dtsi::power-domains = <>.
>>
>>     For the case of GDSC on/off there is no clear use-case to implement
>>     a mechanism for a dependency list in the GDSC logic in-lieu of 
>> already
>>     existing methods to do dependencies in dtsi::power-domains = <>.
>>
>>     A defacto ordering happens because the first power-domain pd_a 
>> will be
>>     powered before pd_b as the list of domains is iterated through 
>> linearly.
>>
>>     This defacto hierarchical structure would not be reliable and should
>>     not be relied upon.
>>
>>     If you need to have a hierarchy of power-domains then structuring the
>>     dependencies in the dtsi to
>>
>>     Do this:
>>
>>     pd_a {
>>     compat = "qcom, power-domain-a";
> 
> Please remove spaces in compat property values.

Not real names but, sure.

>>          power-domains = <&pd_c>;
>>     };
>>
>>     pd_b {
>>          compat = "qcom, power-domain-b";
>>
>>     };
>>
>>     pd_c {
>>          compat = "qcom, power-domain-c";
>>     };
>>
>>     clock-controller {
>>         compat ="qcom, some-clock-controller";
>>         power-domains = <&pd_a, &pd_b>;
>>     }
>>
>>     Not this:
>>
>>     pd_a {
>>     compat = "qcom, power-domain-a";
>>     };
>>
>>     pd_b {
>>          compat = "qcom, power-domain-b";
>>
>>     };
>>
>>     pd_c {
>>          compat = "qcom, power-domain-c";
>>     };
>>
>>     clock-controller {
>>         compat ="qcom, some-clock-controller";
>>         power-domains = <&pd_c, &pd_a, &pd_b>;
> 
> IMO it's a very fragile scheme, and like I've stated above at the bare
> minimum for future usecases the description shall be found outside of
> commit messages, preferably in the device tree bindings documentation.

So I stated above "Not this" very deliberately.

Thou shalt not rely on the ordering of power-domains in the dtsi.

> 
>>     }
>>
>>     Thus ensuring that pd_a directly references its dependency to pd_c
>>     without assuming the order of references in clock-controller imparts
>>     or implements a deliberate and specific dependency hierarchy.
>>
>> 2. Should each GDSC inside a clock-controller be attached to each
>>     power-domain listed in dtsi::power-domains = <> ?
>>
>>     In other words should child GDSCs attach to the power-domain list.
>>
>>     The answer to this is no. GDSCs which are children of a GDSC within a
>>     clock-controller need only attach to the parent GDSC.
>>
>>     With a single power-domain or a list of power-domains either way only
>>     the parent/top-level GDSC needs to be a subdomain of the input
>>     dtsi::power-domains = <>.
>>
>> 3. Should top-level GDSCs inside the clock-controller attach to each
>>     power-domain in the clock-controller.
>>
>>     Yes a GDSC that has no parent GDSC inside of the clock-controller 
>> has an
>>     inferred dependency on the power-domains powering the clock- 
>> controller.
>>
>> 4. Performance states
>>     Right now the best information we have is that performance states 
>> should
>>     be applied to a power-domain list equally.
>>
>>     Future implementations may have more detail to differentiate the 
>> option
>>     to vote for different voltages on different power-domains when 
>> setting
>>     clock frequencies.
>>
>>     Either way setting the performance state of the power-domains for the
>>     clock-controller should be represented by operating-point code in the
>>     hardware driver which depends on the clocks not in the
>>     gdsc_enable()/gdsc_disable() path.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/clk/qcom/common.c |  1 +
>>   drivers/clk/qcom/gdsc.c   | 35 +++++++++++++++++++++++++++++++++++
>>   drivers/clk/qcom/gdsc.h   |  1 +
>>   3 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index 
>> b79e6a73b53a4113ca324d102d7be5504a9fe85e..9e3380fd718198c9fe63d7361615a91c3ecb3d60 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -323,6 +323,7 @@ int qcom_cc_really_probe(struct device *dev,
>>           scd->dev = dev;
>>           scd->scs = desc->gdscs;
>>           scd->num = desc->num_gdscs;
>> +        scd->pd_list = cc->pd_list;
>>           ret = gdsc_register(scd, &reset->rcdev, regmap);
>>           if (ret)
>>               return ret;
>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>> index 
>> 4fc6f957d0b846cc90e50ef243f23a7a27e66899..cb4afa6d584899f3dafa380d5e01be6de9711737 100644
>> --- a/drivers/clk/qcom/gdsc.c
>> +++ b/drivers/clk/qcom/gdsc.c
>> @@ -506,6 +506,36 @@ static int gdsc_init(struct gdsc *sc)
>>       return ret;
>>   }
>> +static int gdsc_add_subdomain_list(struct dev_pm_domain_list *pd_list,
>> +                   struct generic_pm_domain *subdomain)
>> +{
>> +    int i, ret;
>> +
>> +    for (i = 0; i < pd_list->num_pds; i++) {
>> +        struct device *dev = pd_list->pd_devs[i];
>> +        struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
>> +
>> +        ret = pm_genpd_add_subdomain(genpd, subdomain);
>> +        if (ret)
>> +            return ret;
> 
> It's needed to rollback call pm_genpd_remove_subdomain() for all added
> subdomains on the error path.
> 
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void gdsc_remove_subdomain_list(struct dev_pm_domain_list 
>> *pd_list,
>> +                       struct generic_pm_domain *subdomain)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < pd_list->num_pds; i++) {
> 
> To be on the safe side, and especially because the order on the list has
> high importance, please remove subdomains in the reverse order.

The order shouldn't have any meaning at all but I agree the removal 
should happen in reverse order anyway.

I've tried to make the point in the commit log that we 100% _shouldn't_ 
rely on the order a pd gets added by a for(){} loop.

If one PD depends on another then that dependency should be expressed in 
the dtsi with an explicit power-domains = <> from one domain to the other.

IMO that's the right way to express such a dependency - via an explicit 
statement in the dtsi not a defacto outcome as a result of a for() loop 
in gdsc.

---
bod

