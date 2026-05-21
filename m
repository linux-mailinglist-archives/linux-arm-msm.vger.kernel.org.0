Return-Path: <linux-arm-msm+bounces-109031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F53CQ3tDmqwDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:31:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDCE5A40F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAA9B303799F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC2F3BED1E;
	Thu, 21 May 2026 11:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YknBrn9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AEC38B131;
	Thu, 21 May 2026 11:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362809; cv=none; b=HERwawApsb/z9XeU+ALT0us4DsMDmcGmTv91zCg1PQ+J+HJXGCoYPjgJCp05W9BndLO8XaIiszYLQoCeWSFN3WPicNEg/D7bGE3aPQiKE/wl2p+oYMDpXdgfSzEj+r2PMUc4r+RypPn2+cnWVqPskGKO5p4Ii0Y8E6l/BX4Rz8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362809; c=relaxed/simple;
	bh=yEN8fhIxz2UwS5kyxtEBBv0dMXYljGUB8RPNNFeQVkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Akor51YfEX0X4aMVCNVubUC7JjKArywun36vRFDJoI4lJVFr+dthb9sz26gHuWrzYkKKQY7F/y856Kk316y9GOfOY+s18bF/goKWX3b30LefqBdncGaothxOSiKciSH5a839qmFrjv4/CpjFv7yzwz+G1DsPZZSdh+4BqBdmZcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YknBrn9k; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207021F000E9;
	Thu, 21 May 2026 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779362808;
	bh=UZOTOngkbfj30aKE5h0OheISuX6tazoHMxsmKuVcuU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YknBrn9kiMeaSTRI5stxMpPOhLCuv//1zvSkCq9TrxnhvQVUZi90Ibx6SNCLL2+c9
	 1f9NhY9sd9GPPpZl+xrHLLtgsR0jHAQrg2aAIdocwHaUOOJnoZS1Oq1XQ3Aome8SpV
	 nB8o+D12abKjKOLGHshtpVVCPx/trcADPRHMA/dbbxJcR5NQ2dp7TjQse3XlQlk82h
	 pPLFc954YP2q/udXd94u/7aALaBOfqHoXXVA67i7koQng6GhIR8dEKsHehwnAELkLl
	 ikQcgsaQmJxnSiolThEawMr79VBhwBN4ckowU42WuBQznI+D203WXd2Zb2TtdTaXd/
	 Uv+MRCmq+cMHA==
Date: Thu, 21 May 2026 12:26:38 +0100
From: Lee Jones <lee@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
Message-ID: <20260521112638.GD2921053@google.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109031-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com,vger.kernel.org,lists.infradead.org,broadcom.com,oss.qualcomm.com,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 6DDCE5A40F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 14 May 2026, Shivendra Pratap wrote:

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
> +			 * Track non-OF fwnodes explicitly so they are put on
> +			 * all teardown paths.
> +			 */
> +			if (!to_of_node(fwnode)) {
> +				ret = devm_add_action(&pdev->dev,
> +						      mfd_child_fwnode_put,
> +						      fwnode);
> +				if (ret) {
> +					device_set_node(&pdev->dev, NULL);
> +					fwnode_handle_put(fwnode);
> +					goto fail_of_entry;
> +				}
> +			}
> +		}
> +	}

mfd_add_device() is getting very busy now with support for all of these
different registration APIs.  Suggest that we start breaking them out.

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

I'm very much against pointers to functions if they can be avoided.  Why
does fwnode need this and none of the other APIs do?

>  	/*
>  	 * Device Tree compatible string
> 
> -- 
> 2.34.1
> 

-- 
Lee Jones

