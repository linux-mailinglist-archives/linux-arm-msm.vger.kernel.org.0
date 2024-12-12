Return-Path: <linux-arm-msm+bounces-41761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A37B69EEA24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 253D7188CA48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 15:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAA6211476;
	Thu, 12 Dec 2024 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e8DxFlzl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EFD2080FC
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016004; cv=none; b=MDtcAXhNAJ93kh/lMWQr3wnsTu4XuuASWtLodHYtvrTOrZTBzSgqpkUsqsq/qaEBRA1YrVRuErOEWKfIqdUBo2xxcNHW4M86WSIbC0FJsynYWwxTw3two7TMKmVJkY7pZPkfI64rjEkQV1zWDkWCo0BsaQ9wrThQw4VDec8mU5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016004; c=relaxed/simple;
	bh=/wZygdcPbfhCUlwBFtGxcK7TxSYJ5BeDftNO0C1wHg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aa4GCpqmjogs/CDvoXxdni3obLmdhjGa9NWpYrDydU/uF/+lrTNwlQLjd1bd53Ppy3lWxxnY8FIkWkRFleE+OTjeu6yYdWMJ/Mrpue6lP8a0N5hGfxFytMHMgrkF1vD9OP9FEvx+70tboBIuP5+D+n0+i1LdMY/aQ34K5LHRY0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e8DxFlzl; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3023fcface6so184181fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 07:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734016001; x=1734620801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/O98ViGQY1w3fTqJRY4spp8fbDk/chDJNOLVHC54GE=;
        b=e8DxFlzlD/kAqjDBbtpjfHl0MgPX+mZuyVr31LBWRZBiP7Dd4Eyt1wCM8TxOk82Qyz
         2DrFPG7ZY4mC363B3KdkcbITkMqil1x311U858YY2toAspTMckYV4hd2xEy6ZcjW40O3
         pNmr2sP4u06XVKUyByYNCMNeo8yQU0QE0oPcib4yBGG1o4tTRLaapXLIlbdC25FGaxto
         BrVmbtyxHcUS638OoRgI8zMkVEjz6BdeOkiYxCGVCo9padVIz0r7evPcPbQf8oB11XpZ
         U7aT0v6aTcDxii3++JvDQXUL51wNawl0FaSHThuhQtFQUV2dfKxalkNQw840pMbAknhm
         YRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734016001; x=1734620801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/O98ViGQY1w3fTqJRY4spp8fbDk/chDJNOLVHC54GE=;
        b=Nzf+EhnNpRmzPY+eJ6i6it5dOz3w8ioK9VNGX5UC3hCuTkbBHC0OLWFmjuir8sUm3V
         cwIEhBXVhqvysfFeKvJUwEDdE+fEjRcRsoXyO6A6PxPlNFL5mpYIYGmXXKbmketoWVOd
         ObsikgJ99JSpfxNvqImM0SF4JJaC+DInTdFSZStqaVGkoAi8KQL01CGYgcOy+n06pJAl
         5yYEFpHZxHK2ddxvjB/cVRE2L1Gxx4TixZTt7ybTggeZ1W42aIxkT6ePVTCCBFSyctAS
         Xd/d8teMl2kTzN+rH4XeRiDGz3uohu/+8HDm52AzFBNDeGhQDUZ2z/Lt+AFtWNPCx1pC
         c9YA==
X-Gm-Message-State: AOJu0YytBP2xYqrFw57eiuN3KvuZ/zndri2vaXlS7U38wS1h+eaG3uWR
	rpmGa6mx8CE7XhJaN9wzoKNCVUxywO9yZ61xfE8c0IN21kkEhr3e8l+2VdT/YSI=
X-Gm-Gg: ASbGnctRr+ugm70tGBl6ogUFTxTsm2qiPWFQuHokPz1u0IW6pLHDLQIDDKPAqBPsKWq
	nQc3vJTPs+IbFawVKbqaSlgNejFgJ/nu1IFSe7djdgwzREdw0A/RcYmQszUsqw9KDbXQj4oObkJ
	G0+nkQGWSiarlE55hEI8+myu0bDATwDXU5SaDHhpOyw2ud2n5Xi0DxJ56/LCvYEvAGgorezXOGQ
	uGRPx05YPn5FmYaS2D7lMEwcLh6IbGp/IA/XRVEiA0iQJmp/fP0E2CgH5Q5nsg1XdVEtwtHWqSl
	R4XWh2vf0z59hCUkDiSFplObeKgbZP6646U=
X-Google-Smtp-Source: AGHT+IGCHJsVNeNFIhfvJaRBPxfq+foN6JZUPLah8jpJwqCp2Bz493COAu9+f9Y5GGf9k2n7G5+5gg==
X-Received: by 2002:a2e:a98a:0:b0:302:1cfa:2460 with SMTP id 38308e7fff4ca-30251cf9c61mr646791fa.3.1734016000595;
        Thu, 12 Dec 2024 07:06:40 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3021df72603sm13524291fa.100.2024.12.12.07.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:06:39 -0800 (PST)
Message-ID: <ec2d1916-45b5-4b90-ade2-3fdc091fc0b8@linaro.org>
Date: Thu, 12 Dec 2024 17:06:37 +0200
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-3-5d93cef910a4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 12/11/24 18:54, Bryan O'Donoghue wrote:
> When a clock-controller has multiple power-domains we need to attach the
> GDSCs provided by the clock-controller to each of the list of power-domains
> as power subdomains of each of the power-domains respectively.
> 
> GDSCs come in three forms:
> 
> 1. A GDSC which has no parent GDSC in the controller and no child GDSCs.
> 2. A GDSC which has no parent GDSC in the controller and has child GDSCs.
> 3. A child GDSC which derives power from the parent GDSC @ #2.
> 
> Cases 1 and 2 are "top-level" GDSCs which depend on the power-domains - the
> power-rails attached to the clock-controller to power-on.
> 
> When dtsi::power-domains = <> points to a single power-domain, Linux'
> platform probe code takes care of hooking up the referenced power-domains
> to the clock-controller.
> 
> When dtsi::power-domains = <> points to more than one power-domain we must
> take responsibility to attach the list of power-domains to our
> clock-controller.
> 
> An added complexity is that currently gdsc_enable() and gdsc_disable() do
> not register the top-level GDSCs as power subdomains of the controller's
> power-domains.
> 
> This patch makes the subdomain association between whatever list of
> top-level GDSCs a clock-controller provides and the power-domain list of
> that clock-controller.
> 
> What we don't do here is take responsibility to adjust the voltages on
> those power-rails when ramping clock frequencies - PLL rates - inside of
> the clock-controller.
> 
> That voltage adjustment should be performed by operating-point/performance
> setpoint code in the driver requesting the new frequency.
> 
> There are some questions that it is worth discussing in the commit log:
> 
> 1. Should there be a hierarchy of power-domains in the clock-controller ?
> 
>     In other words if a list of dtsi::power-domains = <pd_a, pd_b, ..>
>     should a specific hierarchy be applied to power pd_a then pd_b etc.
> 
>     It may be appropriate to introduce such a hierarchy however reasoning
>     this point out some more, any hierarchy of power-domain dependencies
>     should probably be handled in dtsi with a chain of power-domains.

If so, the description shall be found under Documentation/devicetree/bindings/

>     One power-domain provider would point to another via
>     dtsi::power-domains = <>.
> 
>     For the case of GDSC on/off there is no clear use-case to implement
>     a mechanism for a dependency list in the GDSC logic in-lieu of already
>     existing methods to do dependencies in dtsi::power-domains = <>.
> 
>     A defacto ordering happens because the first power-domain pd_a will be
>     powered before pd_b as the list of domains is iterated through linearly.
> 
>     This defacto hierarchical structure would not be reliable and should
>     not be relied upon.
> 
>     If you need to have a hierarchy of power-domains then structuring the
>     dependencies in the dtsi to
> 
>     Do this:
> 
>     pd_a {
> 	compat = "qcom, power-domain-a";

Please remove spaces in compat property values.

>          power-domains = <&pd_c>;
>     };
> 
>     pd_b {
>          compat = "qcom, power-domain-b";
> 
>     };
> 
>     pd_c {
>          compat = "qcom, power-domain-c";
>     };
> 
>     clock-controller {
>         compat ="qcom, some-clock-controller";
>         power-domains = <&pd_a, &pd_b>;
>     }
> 
>     Not this:
> 
>     pd_a {
> 	compat = "qcom, power-domain-a";
>     };
> 
>     pd_b {
>          compat = "qcom, power-domain-b";
> 
>     };
> 
>     pd_c {
>          compat = "qcom, power-domain-c";
>     };
> 
>     clock-controller {
>         compat ="qcom, some-clock-controller";
>         power-domains = <&pd_c, &pd_a, &pd_b>;

IMO it's a very fragile scheme, and like I've stated above at the bare
minimum for future usecases the description shall be found outside of
commit messages, preferably in the device tree bindings documentation.

>     }
> 
>     Thus ensuring that pd_a directly references its dependency to pd_c
>     without assuming the order of references in clock-controller imparts
>     or implements a deliberate and specific dependency hierarchy.
> 
> 2. Should each GDSC inside a clock-controller be attached to each
>     power-domain listed in dtsi::power-domains = <> ?
> 
>     In other words should child GDSCs attach to the power-domain list.
> 
>     The answer to this is no. GDSCs which are children of a GDSC within a
>     clock-controller need only attach to the parent GDSC.
> 
>     With a single power-domain or a list of power-domains either way only
>     the parent/top-level GDSC needs to be a subdomain of the input
>     dtsi::power-domains = <>.
> 
> 3. Should top-level GDSCs inside the clock-controller attach to each
>     power-domain in the clock-controller.
> 
>     Yes a GDSC that has no parent GDSC inside of the clock-controller has an
>     inferred dependency on the power-domains powering the clock-controller.
> 
> 4. Performance states
>     Right now the best information we have is that performance states should
>     be applied to a power-domain list equally.
> 
>     Future implementations may have more detail to differentiate the option
>     to vote for different voltages on different power-domains when setting
>     clock frequencies.
> 
>     Either way setting the performance state of the power-domains for the
>     clock-controller should be represented by operating-point code in the
>     hardware driver which depends on the clocks not in the
>     gdsc_enable()/gdsc_disable() path.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/clk/qcom/common.c |  1 +
>   drivers/clk/qcom/gdsc.c   | 35 +++++++++++++++++++++++++++++++++++
>   drivers/clk/qcom/gdsc.h   |  1 +
>   3 files changed, 37 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index b79e6a73b53a4113ca324d102d7be5504a9fe85e..9e3380fd718198c9fe63d7361615a91c3ecb3d60 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -323,6 +323,7 @@ int qcom_cc_really_probe(struct device *dev,
>   		scd->dev = dev;
>   		scd->scs = desc->gdscs;
>   		scd->num = desc->num_gdscs;
> +		scd->pd_list = cc->pd_list;
>   		ret = gdsc_register(scd, &reset->rcdev, regmap);
>   		if (ret)
>   			return ret;
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 4fc6f957d0b846cc90e50ef243f23a7a27e66899..cb4afa6d584899f3dafa380d5e01be6de9711737 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -506,6 +506,36 @@ static int gdsc_init(struct gdsc *sc)
>   	return ret;
>   }
>   
> +static int gdsc_add_subdomain_list(struct dev_pm_domain_list *pd_list,
> +				   struct generic_pm_domain *subdomain)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < pd_list->num_pds; i++) {
> +		struct device *dev = pd_list->pd_devs[i];
> +		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
> +
> +		ret = pm_genpd_add_subdomain(genpd, subdomain);
> +		if (ret)
> +			return ret;

It's needed to rollback call pm_genpd_remove_subdomain() for all added
subdomains on the error path.

> +	}
> +
> +	return 0;
> +}
> +
> +static void gdsc_remove_subdomain_list(struct dev_pm_domain_list *pd_list,
> +				       struct generic_pm_domain *subdomain)
> +{
> +	int i;
> +
> +	for (i = 0; i < pd_list->num_pds; i++) {

To be on the safe side, and especially because the order on the list has
high importance, please remove subdomains in the reverse order.

> +		struct device *dev = pd_list->pd_devs[i];
> +		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
> +
> +		pm_genpd_remove_subdomain(genpd, subdomain);
> +	}
> +}
> +
>   int gdsc_register(struct gdsc_desc *desc,
>   		  struct reset_controller_dev *rcdev, struct regmap *regmap)
>   {
> @@ -558,6 +588,9 @@ int gdsc_register(struct gdsc_desc *desc,
>   			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
>   		else if (!IS_ERR_OR_NULL(dev->pm_domain))
>   			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> +		else if (desc->pd_list)
> +			ret = gdsc_add_subdomain_list(desc->pd_list, &scs[i]->pd);
> +
>   		if (ret)
>   			return ret;
>   	}
> @@ -580,6 +613,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
>   			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
>   		else if (!IS_ERR_OR_NULL(dev->pm_domain))
>   			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> +		else if (desc->pd_list)
> +			gdsc_remove_subdomain_list(desc->pd_list, &scs[i]->pd);
>   	}
>   	of_genpd_del_provider(dev->of_node);
>   }
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 1e2779b823d1c8ca077c9b4cd0a0dbdf5f9457ef..dd843e86c05b2f30e6d9e978681580016333839d 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -80,6 +80,7 @@ struct gdsc_desc {
>   	struct device *dev;
>   	struct gdsc **scs;
>   	size_t num;
> +	struct dev_pm_domain_list *pd_list;
>   };
>   
>   #ifdef CONFIG_QCOM_GDSC
> 

--
Best wishes,
Vladimir

