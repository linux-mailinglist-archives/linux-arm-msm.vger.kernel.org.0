Return-Path: <linux-arm-msm+bounces-35250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB419A68DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 14:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4CE21C20434
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0268D1F708D;
	Mon, 21 Oct 2024 12:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btCSo4Pv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F911F7073;
	Mon, 21 Oct 2024 12:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729514622; cv=none; b=rWI5/EUCKsY3QZZkh5Ah6I8RTn5xOdmgqX7K7j8+rlZ/43QDRvQTbEY73yXg4lBXniBnhQeeIj7GnZWhL58XHh8BgGbVKUdYEdg09UMpyBPwOxvYIKi4+4wJN3p+l5ylJio9ssHzqCKgrHEDL4FDszt7eBiJ1uJaX4zwZd88rDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729514622; c=relaxed/simple;
	bh=fRUIDjE4jHW2pNdM81L5cXV5WWgixKaP1AHVVF2AyaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeU+9hxgw8+CfqQUmkpxIkNIjf11blwGu2b7eFdMuTRJhoZglXAZL1AWr+GqyEXdqHX0PC7Di6U4XOBSQU2r3PfAJARAWpiRXu6XxvvJ4VAXQKz9csa69k9lziEVIsU7VB6wZr+3JfSjL8T6WhfTGKzuceHzRjSApIDv2r999cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btCSo4Pv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729514622; x=1761050622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fRUIDjE4jHW2pNdM81L5cXV5WWgixKaP1AHVVF2AyaQ=;
  b=btCSo4PvBvUn9ESCmzn2xccANpP7lAzjGroEA7oaRPjhrRqLEat/J7E1
   mhDCNVP9VyY2rxpV2xcz4TlBm+9T46pGJn5leEZRulfVrH9weKWDGL6Nk
   wUVBAnznK0xOwO8xWLftNFDLzUmJTdSYCQzCCvvb1t5JvJSDI3dFWn+sA
   bamxZDDYOR4PI2DryeuuAo1sX68OizbpON0qhH1vWwLikqNXtSBX7kiOP
   TFXv/hwuaM5h8muOwIVAzhdvlTZfxK/VLVxquwYaEwMzf/D54lj0tY1Zt
   yDC8kqR/UyLv/zKtrpdlh4u3zN0v8t5kg+aICd7G+zWRXycZ7RTaGYAPW
   g==;
X-CSE-ConnectionGUID: m3H1JD58TKawiN5fkU0oGQ==
X-CSE-MsgGUID: NJQVm1qjQLusEdbaDaqS0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40120504"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40120504"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 05:43:41 -0700
X-CSE-ConnectionGUID: Lm/gV0B2SZSbSxHCk4UahQ==
X-CSE-MsgGUID: /0YQBXbtTlmdjS2J9c05hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="79457725"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa009.jf.intel.com with SMTP; 21 Oct 2024 05:43:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Oct 2024 15:43:36 +0300
Date: Mon, 21 Oct 2024 15:43:36 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RFC] usb: typec: ucsi: Set orientation as none when
 connector is unplugged
Message-ID: <ZxZMeLZ1frxjWnwJ@kuha.fi.intel.com>
References: <20241017-usb-typec-ucsi-glink-add-orientation-none-v1-1-0fdc7e49a7e7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017-usb-typec-ucsi-glink-add-orientation-none-v1-1-0fdc7e49a7e7@linaro.org>

On Thu, Oct 17, 2024 at 07:01:01PM +0300, Abel Vesa wrote:
> Currently, the ucsi glink client is only reporting orientation normal or
> reversed, based on the level of the gpio. On unplug, it defaults to
> orientation normal instead of none. This confuses some of the orientation
> switches drivers as they might rely on orientation none in order to
> configure the HW in some sort of safe mode. So propagate the orientation
> none instead when the connector status flags says cable is disconnected.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 3e4d88ab338e50d4265df15fc960907c36675282..b3bc02e4b0427a894c5b5df470af47433145243e 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -185,6 +185,11 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
>  	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
>  	int orientation;
>  
> +	if (!(con->status.flags & UCSI_CONSTAT_CONNECTED)) {
> +		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
> +		return;
> +	}
> +
>  	if (con->num >= PMIC_GLINK_MAX_PORTS ||
>  	    !ucsi->port_orientation[con->num - 1])
>  		return;

This looks reasonable to me. FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

thanks,

-- 
heikki

