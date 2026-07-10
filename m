Return-Path: <linux-arm-msm+bounces-118292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MS4eKI/wUGo98wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:15:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB2873B269
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:15:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lQ2TnaNk;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118292-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118292-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0A843014C20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F83342DA28;
	Fri, 10 Jul 2026 13:14:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED0F42B73F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:14:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689243; cv=none; b=Xlw3H5q3y4p/KdwDE1gT2WwAX9YNbQAbOq70FJy5IT60MWw5GN48Z37kVuJ/gUCch0F8em3z3NkH7MBjZTNOAF3jXw7JzhgSQiDwv1Sq46qljqomFcoMqeKmkgRlrFYFV/Y3q79em3QPV2YpncOdFT0w7sK49tWNVhdh3pk2X1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689243; c=relaxed/simple;
	bh=f7vBLyNzMSj2AQGpnaqFOaefWYImHsH9b1i1ejYmTYs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzAOzkuzb4+UP/vz/vXlXLTcZR5sZJ1m0JLN3zD3wFK0XsTIsnOfqPYeIJ1PdmV3ESRXjFdO+tGB3IkgaKCx0MsISHW5nmqqz/RrgxCEYGXDXz4OYCzjjM9FkDTKLO2klgRF0zGl3+i9aUFnkVntiWb6BDTkFi7DOJ5XzdpKeU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQ2TnaNk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A941F00ADB
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783689241;
	bh=T6H7LMB/4+PhXJiGpc8gE69jjGwtNnvDvo8BbHdy9mQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lQ2TnaNkYfbZWd0F76fFd8EAlleylnd95DzoJuMgfre3HGKSHgdaxh8saZ4/EoGEF
	 SYdZNpGjywDj0nSqeOFq1j09ChBbNETxMr16CivJyuuwqujKlDKj/1A+VjEG90Zy8W
	 6ZMYBzYRMEdOutDdPRgMBA7b91ZhkVkXsaa8aRINx5NQ2xX7yhg8VoiOn/IUVfNP+O
	 PpY0mq9OodXlR9+SOsW8voV5rFBn7ybt0J2xleV3DXh++xMcLw1J8roYyfjp0QDzr4
	 DnGLJ0MerjemG9yqi1O2TZOPSthzukAVoiUrRYncn7L1a17FiAklsSy5LEkC57lL1v
	 hvly1Y0ObGXbw==
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so574881a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:14:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrjRxA9uMHzBXNCmK91Y7SqKK0rB+L6xVQfu9J4RO+fhXySSGh+U04lKix3pP6vtUKUshS2yUG9dR8g50Gz@vger.kernel.org
X-Gm-Message-State: AOJu0YxV0rsvupeHcwjs/z9bQkyzySB6SCWryNDhBXoeB+RqlZ+fbLel
	gutk0MllqdZbIwqsskwV2MF0tb8a/z1lymi4r/LXaDOsAOyySrTYYgwkYAz12julzZHp2xSe0Da
	eg2Ui13zM5zBbWfwomBeSHDVUkQMKRLtvnLDa4clWMQ==
X-Received: by 2002:a05:6a21:178a:b0:3c0:9c1a:8951 with SMTP id
 adf61e73a8af0-3c0bd32597amr13144316637.73.1783689240568; Fri, 10 Jul 2026
 06:14:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jul 2026 06:13:56 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jul 2026 06:13:55 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260710-monza-wireless-v3-3-46253587af64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com> <20260710-monza-wireless-v3-3-46253587af64@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 06:13:55 -0700
X-Gmail-Original-Message-ID: <CAMRc=MckiTUBCF+UvmFi-ceLpjWW71LXTTHDiY+s5Qn7NCbD6Q@mail.gmail.com>
X-Gm-Features: AVVi8CdQQqAQg6auslUpdHZRLDKr7G6uRL7WcF3-kXQOHwxYL-i8zfzS6d0XT5w
Message-ID: <CAMRc=MckiTUBCF+UvmFi-ceLpjWW71LXTTHDiY+s5Qn7NCbD6Q@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] power: sequencing: Add pwrseq_power_is_controllable()
 API
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118292-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,kernel.org,holtmann.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FB2873B269

On Fri, 10 Jul 2026 11:57:29 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> On some boards a power sequencing target has no host-controllable enable
> for its function, for instance when the enable line is not wired up to a
> GPIO and is hardwired to an always-on level. The pcie-m2 "uart" target is
> one such example: when the M.2 connector does not route the W_DISABLE2#
> signal to a host GPIO, its enable/disable are no-ops and the host cannot
> gate the Bluetooth function at all or exclusively.
>
> Add a generic pwrseq_power_is_controllable() helper. It reports whether the
> target's final unit provides a host-controllable dedicated power actuator.
> The unit can implement a new optional per-unit is_controllable() callback,
> reporting whether that actuator is effective on this instance (for example
> depending on GPIO presence). If the unit does not provide the callback, it
> is assumed to be controllable.
>
> Note this only describes the target's own enable actuator. It does not
> imply that a power-off reaches an electrical OFF state as a target may
> have multiple consumers. Also, this does not restrict consumers from
> calling pwrseq_power_off() either, which remains valid to drop a vote
> on shared unit resources/dependencies.
>

Thanks. In general it looks good, though I would extend the last paragraph by
mentioning that the fact that the target's final unit doesn't guarantee power
control for the host, doesn't mean that the power is not controlled for its
dependencies. This is what you basically said but it may not be clear to
someone new to this API what a "vote on shared unit resources" exactly means.

> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/power/sequencing/core.c | 39 +++++++++++++++++++++++++++++++++++++++
>  include/linux/pwrseq/consumer.h |  7 +++++++
>  include/linux/pwrseq/provider.h |  9 +++++++++
>  3 files changed, 55 insertions(+)
>
> diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
> index 02f42da915985339d3de507fc36dd158b0035a99..35df55312a71e9dfd3f24a8199b539746466af36 100644
> --- a/drivers/power/sequencing/core.c
> +++ b/drivers/power/sequencing/core.c
> @@ -72,6 +72,8 @@ static DECLARE_RWSEM(pwrseq_sem);
>   *          this unit.
>   * @disable: Callback running the part of the power-off sequence provided
>   *           by this unit.
> + * @is_controllable: Optional callback reporting whether this unit's
> + *                   enable/disable actually control power.
>   * @enable_count: Current number of users that enabled this unit. May be the
>   *                consumer of the power sequencer or other units that depend
>   *                on this one.
> @@ -83,6 +85,7 @@ struct pwrseq_unit {
>  	struct list_head deps;
>  	pwrseq_power_state_func enable;
>  	pwrseq_power_state_func disable;
> +	pwrseq_is_controllable_func is_controllable;

Is there any reason not to put it in struct pwrseq_target? That would avoid
needless duplication of NULL pointers across all units, right?

>  	unsigned int enable_count;
>  };
>
> @@ -104,6 +107,7 @@ static struct pwrseq_unit *pwrseq_unit_new(const struct pwrseq_unit_data *data)
>  	INIT_LIST_HEAD(&unit->deps);
>  	unit->enable = data->enable;
>  	unit->disable = data->disable;
> +	unit->is_controllable = data->is_controllable;
>
>  	return unit;
>  }
> @@ -991,6 +995,41 @@ struct device *pwrseq_to_device(struct pwrseq_desc *desc)
>  }
>  EXPORT_SYMBOL_GPL(pwrseq_to_device);
>
> +/**
> + * pwrseq_power_is_controllable() - Check whether the target provides a
> + *                                  host-controllable power actuator.
> + * @desc: Descriptor referencing the power sequencer.
> + *
> + * Some power sequencing targets provide no host-controllable enable for their
> + * function on a given board, for instance when the enable line is not wired up
> + * and is instead hardwired to an always-on level. For such targets a call to
> + * pwrseq_power_off() is still allowed, so that the consumer can drop its vote
> + * on the (possibly shared) resources, but the host cannot gate the function
> + * on its own.
> + *
> + * Returns:
> + * True if the target provides a host-controllable power actuator, false
> + * otherwise. Also returns false if @desc is NULL.
> + */
> +bool pwrseq_power_is_controllable(struct pwrseq_desc *desc)

I think, we should call it simply pwrseq_is_controllable(). I was thinking
about pwrseq_target_is_controllable() but it's redundant: a pwrseq handle is
already associated with a concrete target. When you say "power" it suggests
a concrete thing that's "controllable" but it may be a ragulator, it may be
a GPIO or reset. I'd just go with pwrseq_is_controllable().

> +{
> +	struct pwrseq_unit *unit;
> +

might_sleep();

> +	if (!desc)
> +		return false;
> +

Please follow the pattern in other functions where we guard against the
device's concurrent removal with pwrseq->rw_lock.

> +	unit = desc->target->unit;
> +
> +	if (!unit->enable && !unit->disable)
> +		return false;
> +
> +	if (!unit->is_controllable)
> +		return true;
> +
> +	return unit->is_controllable(desc->pwrseq);
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_power_is_controllable);
> +
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>
>  struct pwrseq_debugfs_count_ctx {
> diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
> index 3c907c9e1885dc2958043a9a733fbe20bdf95f6e..ea2b87a521bceb7fb51e79c3b03fdb50f38bf94f 100644
> --- a/include/linux/pwrseq/consumer.h
> +++ b/include/linux/pwrseq/consumer.h
> @@ -25,6 +25,8 @@ int pwrseq_power_off(struct pwrseq_desc *desc);
>
>  struct device *pwrseq_to_device(struct pwrseq_desc *desc);
>
> +bool pwrseq_power_is_controllable(struct pwrseq_desc *desc);
> +
>  #else /* CONFIG_POWER_SEQUENCING */
>
>  static inline struct pwrseq_desc * __must_check
> @@ -58,6 +60,11 @@ static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
>  	return NULL;
>  }
>
> +static inline bool pwrseq_power_is_controllable(struct pwrseq_desc *desc)
> +{
> +	return false;
> +}
> +
>  #endif /* CONFIG_POWER_SEQUENCING */
>
>  #endif /* __POWER_SEQUENCING_CONSUMER_H__ */
> diff --git a/include/linux/pwrseq/provider.h b/include/linux/pwrseq/provider.h
> index 33b3d2c2e39decafac6c6fca9254ad4329d90e94..42c7a37355869ecd0ae8e59b3a8c8716c7ff9ce8 100644
> --- a/include/linux/pwrseq/provider.h
> +++ b/include/linux/pwrseq/provider.h
> @@ -6,12 +6,15 @@
>  #ifndef __POWER_SEQUENCING_PROVIDER_H__
>  #define __POWER_SEQUENCING_PROVIDER_H__
>
> +#include <linux/types.h>
> +
>  struct device;
>  struct module;
>  struct pwrseq_device;
>
>  typedef int (*pwrseq_power_state_func)(struct pwrseq_device *);
>  typedef int (*pwrseq_match_func)(struct pwrseq_device *, struct device *);
> +typedef bool (*pwrseq_is_controllable_func)(struct pwrseq_device *);
>
>  #define PWRSEQ_NO_MATCH 0
>  #define PWRSEQ_MATCH_OK 1
> @@ -26,12 +29,18 @@ typedef int (*pwrseq_match_func)(struct pwrseq_device *, struct device *);
>   *          this unit.
>   * @disable: Callback running the part of the power-off sequence provided
>   *           by this unit.
> + * @is_controllable: Optional callback returning whether this unit's

s/returning/checking/

> + *                   enable/disable callbacks actually control power on this
> + *                   instance (for example when the controlling GPIO is wired

s/instance/unit/g

> + *                   up). If not provided, the unit's power is assumed to be
> + *                   always controllable.
>   */
>  struct pwrseq_unit_data {
>  	const char *name;
>  	const struct pwrseq_unit_data **deps;
>  	pwrseq_power_state_func enable;
>  	pwrseq_power_state_func disable;
> +	pwrseq_is_controllable_func is_controllable;
>  };
>
>  /**
>
> --
> 2.34.1
>
>

Bart

