Return-Path: <linux-arm-msm+bounces-41829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FB49EFB7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFA9B188E92E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F6518784A;
	Thu, 12 Dec 2024 18:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I3sLJQUu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B046017AE1C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734029390; cv=none; b=E2NZafsq8w/YwdtzvUS76NOSHSdNVye+wOpzksfuBqF7PpyUG05XCLoswP/+cK8JnCaoCWMd7zxJcZ3u0by9vNGPmN57Y0q/tYHYSFmZ7AqG1y8KQ40LElvCwXuZkXbrh39AKTCzI+Jza2j2b/1VaVW59iBzhzMauEDXhRStZgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734029390; c=relaxed/simple;
	bh=gdusdgM+tOrapuzK1gOwLCfjM5lWR2C0aoCJbFh2Fkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L5v8J0Me8vGJuQQiTt1c/zPuThDYg8NyzlL+ZOCeimw1ZN1IzJAv41ra6rHbM+Ef33awIR5seIDxQK/NEtrNyld76LjerTiYyoMLyMD44oGF0UUFdW2+PE9UrnkN0pa98GiedWL6L5wWfRdWoh4dCyf4ZdHiWj3LJwW20mLB1XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I3sLJQUu; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5402a4547dbso148480e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734029386; x=1734634186; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wqwA/TXrFgxFvz5oKkOb/d2OYG3I/edU/ThKJyicfXg=;
        b=I3sLJQUueeSZrp8lj6gryiAqrnpYecak/MyYuixc1ZpEheuGByYxBLDHvx9ejZ/RJJ
         tZ1jj30QiiNpkiNk2Ntyxn9ZQlVv4IxEg3TdpLsQE+u9PN7ImoVzGQy1gcgovMUzDTF1
         YzwvIxtxxbFBZzbg30MKc0xyMzASS5nI6oxWGEMLyZw60iBQG3NxNFzC3wjjbBJ0x0e3
         QXF3jycOIwZeSMZcohZpVVhdbyS1OLVrQfux/n0OKIHqlMItmL/aQKi3RYC1L/PE5FYC
         e4LVrPQx/2XmB2IyBDUk7zggEX+0vuoZMMiZjYjK27dbtcquFMuWvnoZQVwHcxD5/6oV
         /tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734029386; x=1734634186;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wqwA/TXrFgxFvz5oKkOb/d2OYG3I/edU/ThKJyicfXg=;
        b=Pci5bdcuQXtIAtpq2UKB3S9GaXSkOMXG3wuXyuGR0m9mHNm7WxUxt/chw5T0UPnDoM
         UEOkMj3LO+46jTQqiJAk9Bk9UYy/+xFDEjfHjoru9Bp8ujXX1YeFdDhKRmNEiuIZCKHB
         q1t8lDvQygtovMejTNOQKWOrqdGFyUav5aBbDSi+KwD4TxvMgkhSzdY9JG7bE3Oo117a
         q0FKAsiLB252pLh72S6Hfj8yU0pasloTmUgLqgWD0hmd4y9CcuMVBIvODlIP/xbNt1Tg
         aJ8xKdEwbUfS4+uiKXpsZxqefNvSlLBEO8Tj8PTd2OUS+C1i4pKIz8uYsOR/DHG9jteG
         Va6A==
X-Gm-Message-State: AOJu0Yyhq1QTkpeWgKYXlfTxkpMtv3OL9ZrwinHLFbDAo8PEtnaDHXDN
	KnaxNH9bhxB8Tfdkfk4GuumhZAc+dxgOFa60S3n/S9/codUh1wQ27bsUWAyqYk0=
X-Gm-Gg: ASbGnctO7BE03Glo/6w1JghQ9xK8iku4pQgp/vFXjOkRV33Ui7fLp6rLOxcYIefenC5
	5Vk97giq+xv+B7lTkpEAgps7cknoG/+Rrh0Ezx2NHzIRlf07xMb/2U/k8U/y4IOc9Y67tuS2u2i
	2PWp7cE9VEKFDhaViyDFjpX9kPg9bt5fptGBGFLi3KRcRL5xLo4eEd/pYn7DIa3HBynqibP+07J
	+jihg+vwHGOIL/kGqs9SWJNMU6e0kU7JjvDY6I9oQH8RSpXCj5nJRV4IOowLVuuEt/4SSqA0Sg6
	TSWIxqSo4aoYtTYwJw7P5mU6QRwlofllIdI=
X-Google-Smtp-Source: AGHT+IGP4XSihhMLyyVKecpq7C5bnwA22bJtR1rnJo7Hh88k9CEggi9RZqQeMrAAGF/XHb+nkDLT+Q==
X-Received: by 2002:a05:6512:3da8:b0:53e:38fd:7521 with SMTP id 2adb3069b0e04-54034105871mr196133e87.5.1734029385688;
        Thu, 12 Dec 2024 10:49:45 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401a3bc85asm1645810e87.206.2024.12.12.10.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:49:45 -0800 (PST)
Message-ID: <7c4fe280-e9dc-4af1-9ecd-ed6ec6f16cc6@linaro.org>
Date: Thu, 12 Dec 2024 20:49:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] clk: qcom: Support attaching GDSCs to multiple
 parents
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
 <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-3-5d93cef910a4@linaro.org>
 <ec2d1916-45b5-4b90-ade2-3fdc091fc0b8@linaro.org>
 <aa060993-3171-490f-bcb8-48ca0084f06c@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aa060993-3171-490f-bcb8-48ca0084f06c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bryan.

On 12/12/24 17:18, Bryan O'Donoghue wrote:
> On 12/12/2024 15:06, Vladimir Zapolskiy wrote:
>> Hi Bryan.
>>
>> On 12/11/24 18:54, Bryan O'Donoghue wrote:
>>> When a clock-controller has multiple power-domains we need to attach the
>>> GDSCs provided by the clock-controller to each of the list of power-
>>> domains
>>> as power subdomains of each of the power-domains respectively.
>>>
>>> GDSCs come in three forms:
>>>
>>> 1. A GDSC which has no parent GDSC in the controller and no child GDSCs.
>>> 2. A GDSC which has no parent GDSC in the controller and has child GDSCs.
>>> 3. A child GDSC which derives power from the parent GDSC @ #2.
>>>
>>> Cases 1 and 2 are "top-level" GDSCs which depend on the power-domains
>>> - the
>>> power-rails attached to the clock-controller to power-on.
>>>
>>> When dtsi::power-domains = <> points to a single power-domain, Linux'
>>> platform probe code takes care of hooking up the referenced power-domains
>>> to the clock-controller.
>>>
>>> When dtsi::power-domains = <> points to more than one power-domain we
>>> must
>>> take responsibility to attach the list of power-domains to our
>>> clock-controller.
>>>
>>> An added complexity is that currently gdsc_enable() and gdsc_disable() do
>>> not register the top-level GDSCs as power subdomains of the controller's
>>> power-domains.
>>>
>>> This patch makes the subdomain association between whatever list of
>>> top-level GDSCs a clock-controller provides and the power-domain list of
>>> that clock-controller.
>>>
>>> What we don't do here is take responsibility to adjust the voltages on
>>> those power-rails when ramping clock frequencies - PLL rates - inside of
>>> the clock-controller.
>>>
>>> That voltage adjustment should be performed by operating-point/
>>> performance
>>> setpoint code in the driver requesting the new frequency.
>>>
>>> There are some questions that it is worth discussing in the commit log:
>>>
>>> 1. Should there be a hierarchy of power-domains in the clock-controller ?
>>>
>>>      In other words if a list of dtsi::power-domains = <pd_a, pd_b, ..>
>>>      should a specific hierarchy be applied to power pd_a then pd_b etc.
>>>
>>>      It may be appropriate to introduce such a hierarchy however reasoning
>>>      this point out some more, any hierarchy of power-domain dependencies
>>>      should probably be handled in dtsi with a chain of power-domains.
>>
>> If so, the description shall be found under Documentation/devicetree/
>> bindings/
> 
> I agree, I don't get your statement here, are you asking for additional
> text ?

No need, I think I grasped your idea here.

>>
>>>      One power-domain provider would point to another via
>>>      dtsi::power-domains = <>.
>>>
>>>      For the case of GDSC on/off there is no clear use-case to implement
>>>      a mechanism for a dependency list in the GDSC logic in-lieu of
>>> already
>>>      existing methods to do dependencies in dtsi::power-domains = <>.
>>>
>>>      A defacto ordering happens because the first power-domain pd_a
>>> will be
>>>      powered before pd_b as the list of domains is iterated through
>>> linearly.
>>>
>>>      This defacto hierarchical structure would not be reliable and should
>>>      not be relied upon.
>>>
>>>      If you need to have a hierarchy of power-domains then structuring the
>>>      dependencies in the dtsi to
>>>
>>>      Do this:
>>>
>>>      pd_a {
>>>      compat = "qcom, power-domain-a";
>>
>> Please remove spaces in compat property values.
> 
> Not real names but, sure.
> 

It's just to be aligned with the principle of least astonishment, thank you.

>>>           power-domains = <&pd_c>;
>>>      };
>>>
>>>      pd_b {
>>>           compat = "qcom, power-domain-b";
>>>
>>>      };
>>>
>>>      pd_c {
>>>           compat = "qcom, power-domain-c";
>>>      };
>>>
>>>      clock-controller {
>>>          compat ="qcom, some-clock-controller";
>>>          power-domains = <&pd_a, &pd_b>;
>>>      }
>>>
>>>      Not this:
>>>
>>>      pd_a {
>>>      compat = "qcom, power-domain-a";
>>>      };
>>>
>>>      pd_b {
>>>           compat = "qcom, power-domain-b";
>>>
>>>      };
>>>
>>>      pd_c {
>>>           compat = "qcom, power-domain-c";
>>>      };
>>>
>>>      clock-controller {
>>>          compat ="qcom, some-clock-controller";
>>>          power-domains = <&pd_c, &pd_a, &pd_b>;
>>
>> IMO it's a very fragile scheme, and like I've stated above at the bare
>> minimum for future usecases the description shall be found outside of
>> commit messages, preferably in the device tree bindings documentation.
> 
> So I stated above "Not this" very deliberately.
> 
> Thou shalt not rely on the ordering of power-domains in the dtsi.

Yes, this is correct, and my understanding is corrected in turn.

>>
>>>      }
>>>
>>>      Thus ensuring that pd_a directly references its dependency to pd_c
>>>      without assuming the order of references in clock-controller imparts
>>>      or implements a deliberate and specific dependency hierarchy.
>>>
>>> 2. Should each GDSC inside a clock-controller be attached to each
>>>      power-domain listed in dtsi::power-domains = <> ?
>>>
>>>      In other words should child GDSCs attach to the power-domain list.
>>>
>>>      The answer to this is no. GDSCs which are children of a GDSC within a
>>>      clock-controller need only attach to the parent GDSC.
>>>
>>>      With a single power-domain or a list of power-domains either way only
>>>      the parent/top-level GDSC needs to be a subdomain of the input
>>>      dtsi::power-domains = <>.
>>>
>>> 3. Should top-level GDSCs inside the clock-controller attach to each
>>>      power-domain in the clock-controller.
>>>
>>>      Yes a GDSC that has no parent GDSC inside of the clock-controller
>>> has an
>>>      inferred dependency on the power-domains powering the clock-
>>> controller.
>>>
>>> 4. Performance states
>>>      Right now the best information we have is that performance states
>>> should
>>>      be applied to a power-domain list equally.
>>>
>>>      Future implementations may have more detail to differentiate the
>>> option
>>>      to vote for different voltages on different power-domains when
>>> setting
>>>      clock frequencies.
>>>
>>>      Either way setting the performance state of the power-domains for the
>>>      clock-controller should be represented by operating-point code in the
>>>      hardware driver which depends on the clocks not in the
>>>      gdsc_enable()/gdsc_disable() path.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>    drivers/clk/qcom/common.c |  1 +
>>>    drivers/clk/qcom/gdsc.c   | 35 +++++++++++++++++++++++++++++++++++
>>>    drivers/clk/qcom/gdsc.h   |  1 +
>>>    3 files changed, 37 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>>> index
>>> b79e6a73b53a4113ca324d102d7be5504a9fe85e..9e3380fd718198c9fe63d7361615a91c3ecb3d60 100644
>>> --- a/drivers/clk/qcom/common.c
>>> +++ b/drivers/clk/qcom/common.c
>>> @@ -323,6 +323,7 @@ int qcom_cc_really_probe(struct device *dev,
>>>            scd->dev = dev;
>>>            scd->scs = desc->gdscs;
>>>            scd->num = desc->num_gdscs;
>>> +        scd->pd_list = cc->pd_list;
>>>            ret = gdsc_register(scd, &reset->rcdev, regmap);
>>>            if (ret)
>>>                return ret;
>>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>>> index
>>> 4fc6f957d0b846cc90e50ef243f23a7a27e66899..cb4afa6d584899f3dafa380d5e01be6de9711737 100644
>>> --- a/drivers/clk/qcom/gdsc.c
>>> +++ b/drivers/clk/qcom/gdsc.c
>>> @@ -506,6 +506,36 @@ static int gdsc_init(struct gdsc *sc)
>>>        return ret;
>>>    }
>>> +static int gdsc_add_subdomain_list(struct dev_pm_domain_list *pd_list,
>>> +                   struct generic_pm_domain *subdomain)
>>> +{
>>> +    int i, ret;
>>> +
>>> +    for (i = 0; i < pd_list->num_pds; i++) {
>>> +        struct device *dev = pd_list->pd_devs[i];
>>> +        struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
>>> +
>>> +        ret = pm_genpd_add_subdomain(genpd, subdomain);
>>> +        if (ret)
>>> +            return ret;
>>
>> It's needed to rollback call pm_genpd_remove_subdomain() for all added
>> subdomains on the error path.
>>
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void gdsc_remove_subdomain_list(struct dev_pm_domain_list
>>> *pd_list,
>>> +                       struct generic_pm_domain *subdomain)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < pd_list->num_pds; i++) {
>>
>> To be on the safe side, and especially because the order on the list has
>> high importance, please remove subdomains in the reverse order.
> 
> The order shouldn't have any meaning at all but I agree the removal
> should happen in reverse order anyway.

It would be so nice.

> I've tried to make the point in the commit log that we 100% _shouldn't_
> rely on the order a pd gets added by a for(){} loop.
> 
> If one PD depends on another then that dependency should be expressed in
> the dtsi with an explicit power-domains = <> from one domain to the other.
> 
> IMO that's the right way to express such a dependency - via an explicit
> statement in the dtsi not a defacto outcome as a result of a for() loop
> in gdsc.
> 

Right, agreed!

--
Best wishes,
Vladimir

