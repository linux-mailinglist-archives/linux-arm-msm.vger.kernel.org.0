Return-Path: <linux-arm-msm+bounces-96562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IHFL/7hr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:18:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C40192482F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CED73063ECB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F31943D503;
	Tue, 10 Mar 2026 09:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWOQR4dI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05D443C05F;
	Tue, 10 Mar 2026 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134001; cv=none; b=hWn+P4V//JJ6u4JCOe5w3SzqNxbtQMO5Qr+LocGUTOyXXySORuxaOoHzv2F/OQveyEhgmD/MhuBdSKixdMZCantECyi5f1HxVYeVvPR5k8N+4ybroqujAFJzkZgVEwykmM93EjcT6rphuf5ozgkLAn7NJAC1MvRZOENrEPfEVXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134001; c=relaxed/simple;
	bh=YgBSSWJOLAPIY1j7LLySyhhXgjILR07IFdTrSHWCGvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ei5Mez+mlYAULC3QNFuacaNWZpkPW51V3Ltj7Wmp/QybkivlQYtf/WBQaEQelaZ7AoF4Jp2mFhrBJGbglvj1lETux/g3tVk+S6yyqyfOm2W2J1tWVTUH/dB0adjPLrXXpFfqru7fZz18dYvesodgFefdSrr0BQ5FsOvUEcMfUJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWOQR4dI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E32C19423;
	Tue, 10 Mar 2026 09:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773134000;
	bh=YgBSSWJOLAPIY1j7LLySyhhXgjILR07IFdTrSHWCGvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YWOQR4dINGL+jpW3GtdFrNmA5BLZGV9CyRcKmSvwX3v8bAa0ATG2fOv5Mt6oFPtvM
	 x9XnyEDB5Cxx2kHWcLSYqNZYi8vwE1JYwPTAsOfOecwNQJ978AbtYGXn4Pnnza+YTn
	 LoCzHut4LT4opTPafOpjHf73gxyGvhcX74gIgbwF6NawzNGowKUy/44FAXrGdhaLO/
	 LoVYj6LWhbaDaAwovrI9ZrWV8fV6cxlE4M1YrhD2566TcOuqoA0kIT9LTT3OIuTR1g
	 XVXu+oMuggJEzubeK2Mi4dkfZ6DDkJ6Wtm0Kwq30Ev+f6h+RwA/cmTU+lOftXB3OsJ
	 9bssYnYtoEIBA==
Date: Tue, 10 Mar 2026 09:13:16 +0000
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: wcd934x: Unroll regmap and irqchip on removal
Message-ID: <20260310091316.GC183676@google.com>
References: <20260309-wcd934x-unroll-regmap-v1-1-9a5fb305540e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309-wcd934x-unroll-regmap-v1-1-9a5fb305540e@oss.qualcomm.com>
X-Rspamd-Queue-Id: C40192482F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96562-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Mon, 09 Mar 2026, Bjorn Andersson wrote:

> When the slimbus-up event is handled a new regmap is created, an IRQ
> chip is registered on this regmap and then the MFD devices are added.
> 
> But the regmap is left dangling if either any of those operations are
> failing or if the slimbus-down event ever comes. Which manifest itself
> as an error print from debugfs once the next slimbus-up event happens.
> 
> Likewise, if for some reason a slimbus-down event would be followed by
> a slimbus-up event without the MFD being torn down by the slimbus
> controller inbetween, we're going to have a dangling irq_chip.
> 
> Add cleanup of the registered resources on failure and on removal.

I don't understand.  Why isn't devm_* working here?

And if you want to force-remove, why not devm_regmap_del_irq_chip() in
the error path instead?  If you end up using this, then you could go the
other way (the preferred method) and use devm_mfd_add_devices().

> Fixes: 6ac7e4d7ad70 ("mfd: wcd934x: Add support to wcd9340/wcd9341 codec")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/mfd/wcd934x.c | 49 ++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
> index 3c3080e8c8cf7ecaaa62e255c7e01a850e65e9ad..b03cc91cc3a6a114a34efdb278420ae3dfa016eb 100644
> --- a/drivers/mfd/wcd934x.c
> +++ b/drivers/mfd/wcd934x.c
> @@ -170,29 +170,56 @@ static int wcd934x_slim_status_up(struct slim_device *sdev)
>  	ret = wcd934x_bring_up(ddata);
>  	if (ret) {
>  		dev_err(dev, "Failed to bring up WCD934X: err = %d\n", ret);
> -		return ret;
> +		goto err_regmap_exit;
>  	}
>  
> -	ret = devm_regmap_add_irq_chip(dev, ddata->regmap, ddata->irq,
> -				       IRQF_TRIGGER_HIGH, 0,
> -				       &wcd934x_regmap_irq_chip,
> -				       &ddata->irq_data);
> +	ret = regmap_add_irq_chip(ddata->regmap, ddata->irq,
> +				  IRQF_TRIGGER_HIGH, 0,
> +				  &wcd934x_regmap_irq_chip,
> +				  &ddata->irq_data);
>  	if (ret) {
>  		dev_err(dev, "Failed to add IRQ chip: err = %d\n", ret);
> -		return ret;
> +		goto err_regmap_exit;
>  	}
>  
>  	ret = mfd_add_devices(dev, PLATFORM_DEVID_AUTO, wcd934x_devices,
>  			      ARRAY_SIZE(wcd934x_devices), NULL, 0, NULL);
>  	if (ret) {
> -		dev_err(dev, "Failed to add child devices: err = %d\n",
> -			ret);
> -		return ret;
> +		dev_err(dev, "Failed to add child devices: err = %d\n", ret);
> +		goto err_del_irq_chip;
>  	}
>  
> +	return 0;
> +
> +err_del_irq_chip:
> +	regmap_del_irq_chip(ddata->irq, ddata->irq_data);
> +	ddata->irq_data = NULL;
> +err_regmap_exit:
> +	regmap_exit(ddata->regmap);
> +	ddata->regmap = NULL;
>  	return ret;
>  }
>  
> +static void wcd934x_slim_status_down(struct slim_device *sdev)
> +{
> +	struct device *dev = &sdev->dev;
> +	struct wcd934x_ddata *ddata;
> +
> +	ddata = dev_get_drvdata(dev);
> +
> +	mfd_remove_devices(&sdev->dev);
> +
> +	if (ddata->irq_data) {
> +		regmap_del_irq_chip(ddata->irq, ddata->irq_data);
> +		ddata->irq_data = NULL;
> +	}
> +
> +	if (ddata->regmap) {
> +		regmap_exit(ddata->regmap);
> +		ddata->regmap = NULL;
> +	}
> +}
> +
>  static int wcd934x_slim_status(struct slim_device *sdev,
>  			       enum slim_device_status status)
>  {
> @@ -200,7 +227,7 @@ static int wcd934x_slim_status(struct slim_device *sdev,
>  	case SLIM_DEVICE_STATUS_UP:
>  		return wcd934x_slim_status_up(sdev);
>  	case SLIM_DEVICE_STATUS_DOWN:
> -		mfd_remove_devices(&sdev->dev);
> +		wcd934x_slim_status_down(sdev);
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -276,7 +303,7 @@ static void wcd934x_slim_remove(struct slim_device *sdev)
>  	struct wcd934x_ddata *ddata = dev_get_drvdata(&sdev->dev);
>  
>  	regulator_bulk_disable(WCD934X_MAX_SUPPLY, ddata->supplies);
> -	mfd_remove_devices(&sdev->dev);
> +	wcd934x_slim_status_down(sdev);
>  }
>  
>  static const struct slim_device_id wcd934x_slim_id[] = {
> 
> ---
> base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> change-id: 20260309-wcd934x-unroll-regmap-f9e08834f9d7
> 
> Best regards,
> -- 
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 

-- 
Lee Jones [李琼斯]

