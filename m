Return-Path: <linux-arm-msm+bounces-108136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOtLLJjUCmpK8gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:58:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCAD5693B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A88BB301C3ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3A83E3C46;
	Mon, 18 May 2026 08:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiUPWewp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7A63E1207
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779094407; cv=none; b=ezdj+LgRknCAiB6NucjYTjTbKC8A6M+jErjDJIGHmpzWCrBV3Cr3ICaSLXV7QlzIIGJ2mhDHg2YQmtlBoGhIEwf2Xbtz/xiDbR2CpZkXZjVev8YCmHYPmuxyTwMoBJLLCZKupR39NLhEgIF7xBSfDPqkc56GwtHourVMzXDVedk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779094407; c=relaxed/simple;
	bh=BeY2D1xhKXuMNqWiLMcfM8mpDskYF1/TSSDTA7pllLc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRTh/DLaRW6+X7PHXIhMQQx4DmigqT+LUMIPu9nCFMwVyH/gd8qO3bNX17AoD/ZdGE9wWr5d5BWglAKKtCVk3uXjmnGHkaNNzaTThTUOftOFd92tb+BpklfFVbS6uUWK83MFVG2hHFPujiw0i8dhc9qj8y7yd6lB0vU1n4njq5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiUPWewp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6120C2BD01
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779094406;
	bh=BeY2D1xhKXuMNqWiLMcfM8mpDskYF1/TSSDTA7pllLc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=BiUPWewpY7R5J0SFM+oxT1KFVOoRyuzVuZK4mkARnjO3rH1mtxsBxdRfjVRpND3ZQ
	 udKva8WH8yafbXxhS5Rf0Umgh9L1/2aOJIWOnoVjtTgSzNB/751Bu95d+eV+BPi5eG
	 yZiDT6sxun6iz9iTeLvsPVNwEohNheDlEw3i2ohSkyzmWtC8Fd5aYX4FooRtY6Aie+
	 xAgy/XlMO6Ow5KJklTNJOZxeLgBdLk6+hvkKG9xec0+Kbq5nlV0auoN/HvHHRw/xm6
	 5eWtMLdmJ8g3TmeYLeP+eMnw7KAZs8R7dFGuSsHXr6+xr5H5RGzgCvvK3iG0k+6wRR
	 uC0lkvB9Nvmiw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e97e73234so18737521fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:53:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8f96wtq6lTqM4arIctEeEdzU0volq46rNOOdkZAx4Qb8iehQ2+83+0/oAJuS3SNP0YkfcR85E7AyKrRasK@vger.kernel.org
X-Gm-Message-State: AOJu0YwAJoBWmIg7nQUyZ+w17sMOtd6sTRy41Ajkro4d1PVdAnqIbaET
	OCBO7KGh51QeJ8mDF8RBnNPvT9Ag7YGP6teQE7hbRCB32w2C6YY4rUmltkBseNGp58lZJX6W2ZT
	SLhBD/PTxKFR9Hg9S4ITGWjK5NbMfQ9Y/MsRqZg192A==
X-Received: by 2002:a05:651c:548:b0:393:7ab3:6d50 with SMTP id
 38308e7fff4ca-395619b0770mr39038201fa.6.1779094405178; Mon, 18 May 2026
 01:53:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 01:53:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 01:53:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-9-28a5bde07483@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-9-28a5bde07483@oss.qualcomm.com>
Date: Mon, 18 May 2026 01:53:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdMKGm2R28Kh3baXTWa8Bo5Yt8ybnL11-12ZJF8BbDB9w@mail.gmail.com>
X-Gm-Features: AVHnY4KUs56aRoXVmyMp6zYpUiaetiLn907dXUa8eSIFV9OSLRkKS3ZdNxw4t9A
Message-ID: <CAMRc=MdMKGm2R28Kh3baXTWa8Bo5Yt8ybnL11-12ZJF8BbDB9w@mail.gmail.com>
Subject: Re: [PATCH v22 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
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
X-Rspamd-Queue-Id: 1FCAD5693B0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108136-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, 14 May 2026 16:25:50 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> The PSCI "reboot-mode" node does not define a compatible because it is a
> configuration of boot-states provided by the underlying firmware. With
> the new firmware-node based cells in mfd-core, this node can now be
> exposed as a proper child cell.
>
> Add the psci-reboot-mode child cell to the psci-mfd driver and associate
> the reboot-mode node as its firmware-node.
>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/mfd/psci-mfd.c      | 18 ++++++++++++++++++
>  drivers/power/reset/Kconfig |  2 +-
>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
> index 7affd6bb09dd83452664edeccb09290fe4f43186..852d8e294a438d4ee6789c556d16a83739af2013 100644
> --- a/drivers/mfd/psci-mfd.c
> +++ b/drivers/mfd/psci-mfd.c
> @@ -7,11 +7,29 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
> +
> +static struct fwnode_handle *psci_reboot_mode_get_child_fwnode(struct device *parent)
> +{
> +	struct fwnode_handle *fwnode;
> +
> +	fwnode = fwnode_get_named_child_node(dev_fwnode(parent), "reboot-mode");
> +	if (!fwnode_device_is_available(fwnode)) {
> +		fwnode_handle_put(fwnode);
> +		fwnode = NULL;
> +	}
> +
> +	return fwnode;

Is this reference put anywhere once the cell is torn down?

Bart

> +}
>
>  static const struct mfd_cell psci_cells[] = {
>  	{
>  		.name = "psci-cpuidle-domain",
>  	},
> +	{
> +		.name = "psci-reboot-mode",
> +		.get_child_fwnode = psci_reboot_mode_get_child_fwnode,
> +	},
>  };
>
>  static int psci_mfd_probe(struct platform_device *pdev)
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index d9d1f768b8691abc3b32f2675519f2ddbaf19b84..79559206d5852ae5eae4c8eb2c390901cea7531c 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -350,7 +350,7 @@ config NVMEM_REBOOT_MODE
>
>  config PSCI_REBOOT_MODE
>  	bool "PSCI reboot mode driver"
> -	depends on OF && ARM_PSCI_FW
> +	depends on OF && ARM_PSCI_FW && MFD_PSCI
>  	select REBOOT_MODE
>  	help
>  	  Say y here will enable PSCI reboot mode driver. This gets
>
> --
> 2.34.1
>
>

