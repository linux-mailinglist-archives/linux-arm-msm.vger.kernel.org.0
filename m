Return-Path: <linux-arm-msm+bounces-108137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKdGLbnVCmpK8gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:02:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AAA56945A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCD2D301BA7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7B03E3D89;
	Mon, 18 May 2026 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arypz9Iz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194273E3C5D
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779094665; cv=none; b=sGKKbIey+H6pNsq1SbBLLuBjvQ+AebY/B0pTSwVChmAxJYOw66ukiIJdtoryyNGQXCYZr0NGUVqJUFPVEZK+LJOOHIqWsoWVu2EEdBzqZK0OWbpjPbXjpcHlCUZs4psht+fjdN7hZDyzRFPUEpgLrFxK73xh3RUDqZhPy6WnW+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779094665; c=relaxed/simple;
	bh=ANAMh0DzcRNlvbRQrPFXI4G0Rad0BRN32gWCvVhZ0Cw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMTFhpSP8lMpbmA8AexlXPLKe7Vb4MciieP1fcY3U20BQrETy68ib15vtQ1aTitqGWBkl/t0RG6e0pXC0dsNn1yqJHrQ+fDjVFN5rxOYa46Z8nrSKO5Ki5BRKyLEs6cotfoS7k9xlVC6051qEoo2MEcJrbYgMk1DaM2P+pAgULQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arypz9Iz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D392CC2BD04
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779094664;
	bh=ANAMh0DzcRNlvbRQrPFXI4G0Rad0BRN32gWCvVhZ0Cw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=arypz9Izul2t3KBwjCKAh3yWytnj1xsnOaK3y10oHXFENyMWtQj72bVaYZql0QBlW
	 jcJglUhZP0l0GFr91jYIbUldNyj3T7JFW6ZfRkwiqj6A/I/P2mtcXFMcT7RL+u4TYw
	 t+yKL0AduVAV90GYkrWRfm3IkA4Eoe47L8PWrmRuVKpq7zJv/lI+7saFY0MIyXEjTk
	 44AIENIVHo+SvR5fz2P6I0VKWa60OGnDeu34j0IixXJNmpjwpPjzb8rhEtsG8s8V1C
	 5RMeUlnHzRBaNNe3lcIFL1bctT2YAjM/96fTQTK9zD1HLeme3crlplsaRtD3l/wt7u
	 e438SxUwS4KMA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a884815606so2430146e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:57:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8vT2ybT1dw3lx5kfPk2tjwSM4bJkxnkuYKF2h0sh04L/zdtKpLlKPPQrLdCiB6oA452+W3zq78W9oWXTCV@vger.kernel.org
X-Gm-Message-State: AOJu0YxvRRBmr838JeRyqw8gG0+w+thjXvCZUDG42VjMu3AY/O9tcaLx
	lM1aqvA3+WjAVxw7aRP3Ivj+xHC3Au1WSoDZZ42Rb/rrcFn62M6jT2Oiny4u2CxeSiv5LVcfSG/
	wlC42zT6dl3JWjHIgEFmS5wwT5fCq2OEZUuSpFxlC/w==
X-Received: by 2002:a05:6512:31c3:b0:5a8:73c3:f270 with SMTP id
 2adb3069b0e04-5aa0e60cff4mr4028599e87.8.1779094663370; Mon, 18 May 2026
 01:57:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 01:57:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 01:57:40 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
Date: Mon, 18 May 2026 01:57:40 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mde7Y3CQ3yi=U+999JyHTNacebiK8jJhHuYBGaqn59yYg@mail.gmail.com>
X-Gm-Features: AVHnY4KsCu6BzmdgMNQvyF1FW_Rq2m9POMDMfDCMIANjFpuurD3lttlcdsXaGfQ
Message-ID: <CAMRc=Mde7Y3CQ3yi=U+999JyHTNacebiK8jJhHuYBGaqn59yYg@mail.gmail.com>
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD cells
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
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
X-Rspamd-Queue-Id: 50AAA56945A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108137-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, 14 May 2026 16:25:49 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> MFD core has no way to register a child device using an explicit firmware
> node. This prevents drivers from registering child nodes when those nodes
> do not define a compatible string. One such example is the PSCI
> "reboot-mode" node, which omits a compatible string as it describes
> boot-states provided by the underlying firmware.
>
> Extend struct mfd_cell with a callback that allows drivers to provide an
> explicit firmware node. The node is added to the MFD child device during
> registration when none is assigned by device tree, ACPI, or software
> matching.
>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/mfd/mfd-core.c   | 30 ++++++++++++++++++++++++++++++
>  include/linux/mfd/core.h | 14 ++++++++++++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
> index 7aa32b90cf1eb7fa0a05bf3dc506e60a262c9850..cc2a2a924d6d3044e29a9f864b536ee325ed797b 100644
> --- a/drivers/mfd/mfd-core.c
> +++ b/drivers/mfd/mfd-core.c
> @@ -10,6 +10,7 @@
>  #include <linux/kernel.h>
>  #include <linux/platform_device.h>
>  #include <linux/acpi.h>
> +#include <linux/fwnode.h>
>  #include <linux/list.h>
>  #include <linux/property.h>
>  #include <linux/mfd/core.h>
> @@ -148,6 +149,11 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
>  	return 0;
>  }
>
> +static void mfd_child_fwnode_put(void *data)
> +{
> +	fwnode_handle_put(data);
> +}

Ah, this seems to answer my previous question, but...

> +
>  static int mfd_add_device(struct device *parent, int id,
>  			  const struct mfd_cell *cell,
>  			  struct resource *mem_base,
> @@ -156,6 +162,7 @@ static int mfd_add_device(struct device *parent, int id,
>  	struct resource *res;
>  	struct platform_device *pdev;
>  	struct mfd_of_node_entry *of_entry, *tmp;
> +	struct fwnode_handle *fwnode;
>  	bool disabled = false;
>  	int ret = -ENOMEM;
>  	int platform_id;
> @@ -224,6 +231,29 @@ static int mfd_add_device(struct device *parent, int id,
>
>  	mfd_acpi_add_device(cell, pdev);
>
> +	if (!pdev->dev.fwnode && cell->get_child_fwnode) {
> +		fwnode = cell->get_child_fwnode(parent);
> +		if (fwnode) {
> +			device_set_node(&pdev->dev, fwnode);
> +
> +			/*
> +			 * platform_device_release() drops only of_node refs.

Which is a separate problem we're discussing elsewhere. It should probably drop
the fwnode reference it holds, not the one of of_node.

> +			 * Track non-OF fwnodes explicitly so they are put on
> +			 * all teardown paths.
> +			 */
> +			if (!to_of_node(fwnode)) {
> +				ret = devm_add_action(&pdev->dev,
> +						      mfd_child_fwnode_put,
> +						      fwnode);

What if the device never gets bound to the driver? The release will never be
called, this is why it's wrong to schedule devres actions for unbound devices
and one of the reasons for patch 1 in this series.

What I suggest for now is: in tear-down path: see if the cell has the
get_child_fwnode() callback and - if so - drop the reference. Add a big, fat
comment saying that this must be removed if we decide to switch to dropping the
device's fwnode reference in platform driver core which may happen soon.

Bart

> +				if (ret) {
> +					device_set_node(&pdev->dev, NULL);
> +					fwnode_handle_put(fwnode);
> +					goto fail_of_entry;
> +				}
> +			}
> +		}
> +	}
> +
>  	if (cell->pdata_size) {
>  		ret = platform_device_add_data(pdev,
>  					cell->platform_data, cell->pdata_size);
> diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
> index faeea7abd688f223fb0b31cde0a9b69dfe2a61ff..abfc26c057d6ee46947ba2b6f2e99f420e74b127 100644
> --- a/include/linux/mfd/core.h
> +++ b/include/linux/mfd/core.h
> @@ -50,6 +50,7 @@
>  #define MFD_DEP_LEVEL_HIGH 1
>
>  struct irq_domain;
> +struct fwnode_handle;
>  struct software_node;
>
>  /* Matches ACPI PNP id, either _HID or _CID, or ACPI _ADR */
> @@ -80,6 +81,19 @@ struct mfd_cell {
>
>  	/* Software node for the device. */
>  	const struct software_node *swnode;
> +	/*
> +	 * Callback to return an explicit firmware node.
> +	 * @parent: MFD parent device passed to mfd_add_devices().
> +	 *
> +	 * Called only if OF/ACPI matching did not assign a fwnode.
> +	 * Ownership of the returned reference is transferred to MFD core.
> +	 *
> +	 * Return a referenced fwnode or NULL if none is available.
> +	 *
> +	 * mfd_cell must be zero-initialized or get_child_fwnode must be NULL
> +	 * when unused.
> +	 */
> +	struct fwnode_handle *(*get_child_fwnode)(struct device *parent);
>
>  	/*
>  	 * Device Tree compatible string
>
> --
> 2.34.1
>
>

