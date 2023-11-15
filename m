Return-Path: <linux-arm-msm+bounces-671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6687EBE18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 08:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6BA31F26423
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 07:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516F03D9F;
	Wed, 15 Nov 2023 07:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MC/G7xp5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905ACFBE9;
	Wed, 15 Nov 2023 07:27:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F418E;
	Tue, 14 Nov 2023 23:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700033243; x=1731569243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CVjv4ZrpGDJbz1IrUPzrrK9YuYaL0aZL0iiRA1BpOhQ=;
  b=MC/G7xp5dXyn/r1I/bX8hWEJMe8OCrmnf8fCf44PqgNoRwBwTx/45u7r
   39au94ODFUdIVHvofCB55hMEaiuve9rb5XlPJTnxkP1AvjIV3JqQCboDf
   UQ3h2ZkQ52O2gVUlhC9vq+RkPxNAM+8nPcZTLbpgx4V0yMxohu/9KOvIC
   xrZFx5WGLeO3CdQXS3BOdyiyHXFM1qFc1Yn2OW65AlNBv782/GP9ITh/T
   4u8uOf6qMzphbI3u+z2wtZnZ20Cq2iEsYF9o33BaG5ExXOUzv1NrIKig0
   r3IGtVy7k/Sg4qPzWAHCXgqWmPzfyiMUm5jFxnOChVplrEF1PkSSp9tHs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="390624057"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="390624057"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 23:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="714800758"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="714800758"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga003.jf.intel.com with SMTP; 14 Nov 2023 23:27:17 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 15 Nov 2023 09:27:16 +0200
Date: Wed, 15 Nov 2023 09:27:16 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: typec: change altmode SVID to u16 entry
Message-ID: <ZVRy1L5JEN3Nda81@kuha.fi.intel.com>
References: <20231113221528.749481-1-dmitry.baryshkov@linaro.org>
 <20231113221528.749481-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113221528.749481-3-dmitry.baryshkov@linaro.org>

On Tue, Nov 14, 2023 at 12:13:28AM +0200, Dmitry Baryshkov wrote:
> As stated in the changelog for the commit 7b458a4c5d73 ("usb: typec: Add
> typec_port_register_altmodes()"), the code should be adjusted according
> to the AltMode bindings. As the SVID is 16 bits wide (according to the
> USB PD Spec), use fwnode_property_read_u16() to read it.
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/platform/x86/intel/chtwc_int33fe.c | 2 +-
>  drivers/usb/typec/class.c                  | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/chtwc_int33fe.c b/drivers/platform/x86/intel/chtwc_int33fe.c
> index 848baecc1bb0..93f75ba1dafd 100644
> --- a/drivers/platform/x86/intel/chtwc_int33fe.c
> +++ b/drivers/platform/x86/intel/chtwc_int33fe.c
> @@ -136,7 +136,7 @@ static const struct software_node altmodes_node = {
>  };
>  
>  static const struct property_entry dp_altmode_properties[] = {
> -	PROPERTY_ENTRY_U32("svid", 0xff01),
> +	PROPERTY_ENTRY_U16("svid", 0xff01),
>  	PROPERTY_ENTRY_U32("vdo", 0x0c0086),
>  	{ }
>  };
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 6ec2a94e6fad..4251d44137b6 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -2238,7 +2238,8 @@ void typec_port_register_altmodes(struct typec_port *port,
>  	struct typec_altmode_desc desc;
>  	struct typec_altmode *alt;
>  	size_t index = 0;
> -	u32 svid, vdo;
> +	u16 svid;
> +	u32 vdo;
>  	int ret;
>  
>  	altmodes_node = device_get_named_child_node(&port->dev, "altmodes");
> @@ -2246,7 +2247,7 @@ void typec_port_register_altmodes(struct typec_port *port,
>  		return; /* No altmodes specified */
>  
>  	fwnode_for_each_child_node(altmodes_node, child) {
> -		ret = fwnode_property_read_u32(child, "svid", &svid);
> +		ret = fwnode_property_read_u16(child, "svid", &svid);
>  		if (ret) {
>  			dev_err(&port->dev, "Error reading svid for altmode %s\n",
>  				fwnode_get_name(child));
> -- 
> 2.42.0

-- 
heikki

