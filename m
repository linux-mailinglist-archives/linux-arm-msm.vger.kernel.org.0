Return-Path: <linux-arm-msm+bounces-110114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNenCzE4GGqkgwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 14:42:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A275F231F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 14:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C1CB30210FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFB83EFD2C;
	Thu, 28 May 2026 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnusktYs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF3F3E833F;
	Thu, 28 May 2026 12:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779972139; cv=none; b=cjEC8C3JgZUy+98D1TO3oeqL/PyKv3JGqAA8Km3/kr+4xUnEuHuv6NBFAzQgcB8coowuhu++cm6fWKurcQte0nkPHhm7hAauymKcKiq4v13sVWcgYEdth2pYLO1++U8sjkQHEbjB2sssJHTQ7RkGWk4UtWDkHF4UvBG8qSKVYWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779972139; c=relaxed/simple;
	bh=KJ4bXx5Jhw4lK4DMTDthJ7vwOLfI0qyGPlE0N0k3tkE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ov5BPTr5OruqaY+tJkcUhvn4s311X90n7RXyo66NGkmjKOzJY6tLaTH7HQDNvRA94//waZz6DxF7Cemfhu6Bc46tYvZvnPXp2j4WuKPlILC8qM5m6EaSsMNVs0/wUPKAiTVDFtpHvQCsk4ZCmie8qBFcpl3qgXH6q/kx67xlsMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnusktYs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779972138; x=1811508138;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KJ4bXx5Jhw4lK4DMTDthJ7vwOLfI0qyGPlE0N0k3tkE=;
  b=nnusktYshzMQ94YAo/WY9vYTMd1a8k73O/tWynnaZr80teMuvPzRd58g
   Y0FWXio5DsattbKR3+6k0K5RAz7uTNvSFl/dnqOvAdN9t7jidR8r+VmnB
   FFMqn/McRxIgmiCl9NH8ygWSfRgiROpCdB5Rhv3rGT+gSkvcRUL+GtzyE
   lLXliu2qniesiJcpVjGg9rJhn3G2ulhs08cjR2tj1/G+tJKE+ZnsgnlrR
   6aJoygkIH2vbdwAcQgaQTWd21pxddfL68QQWNUniNv+7BFm3mB1oRsRSD
   tv6ccbycFvP1MzwIRqNn0oyUun0mXTvoQ74kpe/ZdlmuIoB7M0BG/whvS
   Q==;
X-CSE-ConnectionGUID: bE5lkuKcTpCYnxi4BdCaDw==
X-CSE-MsgGUID: xyShKGAGTe+iVfYRdvflWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79960828"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="79960828"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:42:17 -0700
X-CSE-ConnectionGUID: Zgvm9re8QNyOT84HzR7Xsg==
X-CSE-MsgGUID: VOwf1bD0QlSg9PmMEtsr2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="242634568"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:42:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 28 May 2026 15:42:04 +0300 (EEST)
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
    krzk+dt@kernel.org, conor+dt@kernel.org, 
    Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net, 
    neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
    mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
    simona@ffwll.ch, jikos@kernel.org, bentiss@kernel.org, 
    luzmaximilian@gmail.com, Hans de Goede <hansg@kernel.org>, 
    Douglas Anderson <dianders@chromium.org>, 
    Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org, 
    devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org, 
    linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 3/7] platform/surface: SAM: Add support for Surface
 Pro 12in
In-Reply-To: <ab458aadea651396d9ea7629419a32dc7510c593.1778822464.git.harrison.vanderbyl@gmail.com>
Message-ID: <6808166a-423c-c801-497a-ed95cccc8d0c@linux.intel.com>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com> <ab458aadea651396d9ea7629419a32dc7510c593.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110114-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,chromium.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,intel.com:dkim,linux.intel.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 35A275F231F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 15 May 2026, Harrison Vanderbyl wrote:

> Add a SAM client device node group and registry entry for the
> Microsoft Surface Pro, 12-inch with Snapdragon.
> 
> This set enables the use of the following devices.
> 1: cover keyboard
> 2: cover touchpad
> 3: pen stash events.
> 
> The battery info and charger info devices have been
> purposefully omitted as they are also reported by
> other drivers and cause conflicts.
> 
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---
>  .../surface/surface_aggregator_registry.c         | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index 0599d5adf02e..884049961415 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -422,6 +422,19 @@ static const struct software_node *ssam_node_group_sp11[] = {
>  	NULL,
>  };
>  
> +/* Devices for Surface Pro 12" first edition (ARM/QCOM) */
> +static const struct software_node *ssam_node_group_sp12in[] = {
> +	&ssam_node_root,
> +	&ssam_node_hub_kip,
> +	&ssam_node_tmp_sensors,
> +	&ssam_node_hid_kip_keyboard,
> +	&ssam_node_hid_sam_penstash,

Hi,

Could you please confirm this penstash is correct (sam vs kip)?

Sashiko suggested it might be wrong but take it's report with a grain of 
salt, it's AI after all and sometimes seems to extrapolate about HW to a 
sibling HW without any real knowledge:

https://sashiko.dev/#/patchset/cover.1778822464.git.harrison.vanderbyl%40gmail.com

-- 
 i.

> +	&ssam_node_hid_kip_touchpad,
> +	&ssam_node_hid_kip_fwupd,
> +	&ssam_node_pos_tablet_switch,
> +	NULL,
> +};
> +
>  /* -- SSAM platform/meta-hub driver. ---------------------------------------- */
>  
>  static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
> @@ -500,6 +513,8 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
>  	{ .compatible = "microsoft,arcata", (void *)ssam_node_group_sp9_5g },
>  	/* Surface Pro 11 (ARM/QCOM) */
>  	{ .compatible = "microsoft,denali", (void *)ssam_node_group_sp11 },
> +	/* Surface Pro 12in First Edition (ARM/QCOM) */
> +	{ .compatible = "microsoft,surface-pro-12in", (void *)ssam_node_group_sp12in },
>  	/* Surface Laptop 7 */
>  	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
>  	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },



