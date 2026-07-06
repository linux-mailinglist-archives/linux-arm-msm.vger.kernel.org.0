Return-Path: <linux-arm-msm+bounces-116641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LclzIndSS2prPQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:00:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 666E470D403
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:00:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZnR2iyCu;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116641-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116641-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BDC8316C35E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 06:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0117B3E2ADC;
	Mon,  6 Jul 2026 06:28:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA633E1694;
	Mon,  6 Jul 2026 06:28:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783319312; cv=none; b=Iq+1CKpJS4LiWhoS3spx3/kFvWWI35yKHrzMhfolsocluCMP+oaCf63aqQ2zDsWKIe77jl29XVFA6VZdR28SU06FfDEW0j39/1Jjg5zj9Wlc93go9f4l01/iAtDjmT3yFlEGgaihWDR0YfDANKOVrVAsFOJFKrMvHstK7Oo0sIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783319312; c=relaxed/simple;
	bh=6XbsQdF8GuzqJQwl1M0ADx+QPrS5rN2AspTPjcUnpaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ki/LoPqZmt+LlgDW6omAUUK+uyQh5t8g2Smrd6q8fa45nmENJrkrLoerg9Ut8Ugqko1+RuRB8bc8VjV25IFmYnFwkfzkfGJuEA6JeFAxR4Q9LlUVDT9hRlmVGzf9YcfFtf5snyOxbKxQSpbi9yZ4IMUx1Y7uHfHUFzlSsA+Mmq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnR2iyCu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F211F000E9;
	Mon,  6 Jul 2026 06:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783319302;
	bh=Ye7G5EZua0xTQJFms00R5y5onjJr/+3qC88iA6OL8Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZnR2iyCuERN8IDCcBKfIOUQ/cLpC+s/pT2InQ9sfanHqvUnYLHxs7aG6OPoutPH8T
	 Jxka55VVdzSAkDhAhApN9kOPobvNqKsZYIN8r05ioD6UjkJaqHQMCb0QBAQJVT8zVn
	 wPe+U0Etwy4Rx1QpW0Z7GeJ4FupLAKJkssjDiXttcXI/IyqVDAXSWXYsspdAbTI95G
	 qv1AjDtrwkPz2YpQU1iBRXiA3MT8AmUK0Ss8YxTTApbejOvRDIT/RRf9cH2xPpd48i
	 moF3zhzX0pR0opqoLWDGNnWEKXUwjO3jEo55EQZee/iId2fLvs7H7yZ904ZDIzB0ek
	 hDYbe5DNVzOew==
Date: Sun, 5 Jul 2026 23:28:20 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/9] usb: misc: qcom_eud: improve enable_store API
Message-ID: <aktLBCoLndUKX9r5@hu-petche-lv.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-6-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501170635.2641748-6-elson.serrao@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116641-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:elson.serrao@oss.qualcomm.com,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:quic_schowdhu@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[peter.chen@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,hu-petche-lv.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 666E470D403

On 26-05-01 10:06:31, Elson Serrao wrote:
> Currently enable_store() allows operations irrespective of the EUD state,
> which can result in redundant operations. Avoid this by adding duplicate
> state checks to skip requests when EUD is already in the desired state.
> Additionally, improve error handling with explicit logging to provide
> better feedback.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 7fbb74bf1599..f656ffc8818a 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -162,18 +162,27 @@ static ssize_t enable_store(struct device *dev,
>  	if (kstrtobool(buf, &enable))
>  		return -EINVAL;
>  
> +	/* Skip operation if already in desired state */
> +	if (chip->enabled == enable)
> +		return count;
> +
>  	if (enable) {
>  		ret = enable_eud(chip);
> -		if (!ret)
> -			chip->enabled = enable;
> -		else
> -			disable_eud(chip);
> -
> +		if (ret) {
> +			dev_err(chip->dev, "failed to enable eud\n");
> +			return ret;
> +		}
>  	} else {
>  		ret = disable_eud(chip);
> +		if (ret) {
> +			dev_err(chip->dev, "failed to disable eud\n");
> +			return ret;
> +		}
>  	}
>  
> -	return ret < 0 ? ret : count;
> +	chip->enabled = enable;
> +
> +	return count;
>  }
>  
>  static DEVICE_ATTR_RW(enable);
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen

