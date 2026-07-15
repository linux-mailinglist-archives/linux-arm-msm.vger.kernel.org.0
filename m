Return-Path: <linux-arm-msm+bounces-119250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1rUZFyeJV2rzWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:20:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB1E75E9A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:20:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=alrwdUAo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119250-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119250-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12A3C304544F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727043E639F;
	Wed, 15 Jul 2026 13:14:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA7D2931CF
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:14:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121288; cv=none; b=n1ADJbfE9+de6gvslR666ekA3obQFWgggqn49QIkUldW/ISuGwHH6yIjy2rq5ub7xaopwrg/S4yVNwFarqFQb68eDd8MwXbO8BIkvfz9S37lT4LYenHFGGKuREYbWtw7luOtqJCCErQb17WHzPGnlNZ0yDg625VUpfAsoXhTsuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121288; c=relaxed/simple;
	bh=pus+rxasav/taGhpBUi7QPYt39f/1MtSdVTeOE25RvE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ee0HP4l5qR/cwUMeNQBYfRM5sT3mLKgHOfVz799plnRH8EM36aPHKViqTq5R4LjCTqcMrbMyyxqPOCNlC6LXXFODVbA6Iqtaq9JqpqdT66jJ3KbWmtAdoWmVY0vjeEHlrBe96CufRdjqGja9t5aLMOzw5qVhr+FKbSpXA3ZzSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alrwdUAo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD041F0155D
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784121287;
	bh=rDr2xKpUyoKz6duCK7Yln8g9yTIWkjHlaDKvOTnbv9c=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=alrwdUAowOICmwjwDWN8wv13EoPuwNeKSLO3+zU0fHS04iyJjdCz7ZamR7TElXeJD
	 kyeWb2mqhnceQoak5ZrhY51MvQ1akCChlBU5EsNNAUzb0IOM8fr4mjbG6Y1BFpRU3r
	 iNOEsgt5pGmy+zrRJxrnJppst+eQaCsAlrtmnl6p402klNpzjBvYUJCYVBnFxvHBWs
	 fWq+ro2GpHe0PWhQ10+Lds5R4bn1aHkypqfG0Bb1hPthI0wsGjfVtm1btOWLtYD7rA
	 s18SBxGIVsL7IlWqlLa6YrtXkcXKqZTWgk/togik844KFE752DvAMo1vj91Pucsbou
	 KkHobdoAy5ZQg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c74722e27so21495701fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:14:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpQwL0ivSBYnjKktX8jWpBGUcYoq5mRSnAI/hLpDNygYbR375wP+sWH6NR7PXRAdW9C80XatLHT6YqaGhbg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl7xpsfy/IlQ7EJdXSAUWik0QUoCHjTNYqd8m81Nf6v1Jwzn6F
	Sgh+X4seJr2tH0RtZpgVf2uwo5fofZvGwocnNSj0BF2HZpcDO1aw0gAMLcezzQ5S4ZwG8sgnsct
	iyQV9hZDhNefplAoZiN3Vzq1ODYK/5HaVhnmp+Io3ug==
X-Received: by 2002:a2e:bc0e:0:b0:39b:1026:e0cc with SMTP id
 38308e7fff4ca-39c94c88bf2mr49157651fa.15.1784121285577; Wed, 15 Jul 2026
 06:14:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 08:14:42 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 08:14:42 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 08:14:42 -0500
X-Gmail-Original-Message-ID: <CAMRc=MezSb1hohMsNPR96-hnTr0fjrqZ2ZDKUhwnOWycW3Muzw@mail.gmail.com>
X-Gm-Features: AUfX_mz41Xlqsl3ycck_QpukCeA4vsvH01ocLqEI9wOAfWdaf7PIm5nU2rkpdD8
Message-ID: <CAMRc=MezSb1hohMsNPR96-hnTr0fjrqZ2ZDKUhwnOWycW3Muzw@mail.gmail.com>
Subject: Re: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, mfd@lists.linux.dev, 
	Srinivas Kandagatla <srini@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Sebastian Reichel <sre@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119250-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shivendra.pratap@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:conor@
 kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,lists.linux.dev,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AB1E75E9A8
X-Rspamd-Action: no action

On Tue, 14 Jul 2026 19:16:37 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> The PSCI "reboot-mode" node does not define a compatible because it is a
> configuration of boot-states provided by the underlying firmware. With
> the new firmware-node based cells in mfd-core, this node can now be
> exposed as a proper child cell.
>
> Add the psci-reboot-mode child cell to the psci-mfd driver with a
> named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
> reboot-mode failures.
>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/mfd/psci-mfd.c      | 30 +++++++++++++++++++++++++++++-
>  drivers/power/reset/Kconfig |  2 +-
>  2 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
> index 7affd6bb09dd..8c6b78ac471b 100644
> --- a/drivers/mfd/psci-mfd.c
> +++ b/drivers/mfd/psci-mfd.c
> @@ -7,6 +7,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>
>  static const struct mfd_cell psci_cells[] = {
>  	{
> @@ -14,10 +15,37 @@ static const struct mfd_cell psci_cells[] = {
>  	},
>  };
>
> +static const struct mfd_cell psci_reboot_mode_cell[] = {
> +	{
> +		.name = "psci-reboot-mode",
> +		.named_fwnode = "reboot-mode",
> +	},
> +};
> +
>  static int psci_mfd_probe(struct platform_device *pdev)
>  {
> -	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>  				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
> +	if (ret)
> +		return ret;
> +
> +	fwnode = device_get_named_child_node(&pdev->dev, "reboot-mode");
> +	if (!fwnode)
> +		return 0;
> +
> +	fwnode_handle_put(fwnode);
> +
> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				   psci_reboot_mode_cell,
> +				   ARRAY_SIZE(psci_reboot_mode_cell),
> +				   NULL, 0, NULL);
> +	if (ret)
> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);

Why do we have to look up the named node here anyway? Shouldn't MFD core handle
that already in a generic way?

Bart

