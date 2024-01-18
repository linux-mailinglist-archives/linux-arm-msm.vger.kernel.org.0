Return-Path: <linux-arm-msm+bounces-7538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C64EE831635
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 10:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB5021C229E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 09:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158641F939;
	Thu, 18 Jan 2024 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1JQKLPW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF51BE7F;
	Thu, 18 Jan 2024 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705571602; cv=none; b=XoZgscFhh6Q9RI5BL17/t7/WKlnZ0vdEOvplUQ1/WjMIk/a7DgeQpwF05XnOAjzfoC7CYkPYyL4T+qcsakTjvFnDV3Yf+2KFHEVsbW15IGfH8CZ4QcOZMTbSTLx5fvgxTgsdb2d3Wj49XgRbvKmIyIT9geXIlPOgMNwhvtG50wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705571602; c=relaxed/simple;
	bh=Di3t59ryK/5BiCjERre5tCN0GkzA6F6OzPHGumtvxP4=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=UYCej5qhPd0nXCR/Zjrf6FUHn3wgs5yl6Gl2UvAsSpmUbNHE5zLI6QOB/aWE5VwHsznR3cf5+WkhPz2023ByCHg5VxEdFmlfwboiOd/CnMGnr2/KGzaJDJTUg0WQD2p4OQqeZ/VkkcbtfriZLWXy0sUT3aOglO6lbmJK1BtAaWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1JQKLPW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705571597; x=1737107597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Di3t59ryK/5BiCjERre5tCN0GkzA6F6OzPHGumtvxP4=;
  b=R1JQKLPWAOTZHkhL7HAv7Cvk5qX94TL23bwOsiyYIYtTqQYVz25d+fhA
   aRcm0e0l2W3X3/zSIBBLBX9u9WOJYPWg0xLLL45H8n9VAm3q+PLl+hB2g
   KQH+fOvrY0Kq02WbIX3JHNoSKnOuwszJ3Gfa9QLiaKC11z/odkVgHLx1/
   gDUUikAwqP1IT3JanrV55nFOaL3HJma0rY+TmI75UgY3oeBapXM3LMv1e
   rUAdo7doi/sfXlSE+gLpOduW5CfMEUUOf9sSrkX6ReWPPFek8rbbMCB1Z
   Owo0kw7GMVc7lCo4Pu+oQTTxYW1A/oG3eVGbWwqnP5YAMO07kDmUQp1nQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7099210"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7099210"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 01:53:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="957771490"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="957771490"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga005.jf.intel.com with SMTP; 18 Jan 2024 01:53:09 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 18 Jan 2024 11:53:08 +0200
Date: Thu, 18 Jan 2024 11:53:08 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 05/15] usb: typec: tcpm: fix the PD disabled case
Message-ID: <Zaj1BAHGY8IyW68f@kuha.fi.intel.com>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-5-182d9aa0a5b3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240113-pmi632-typec-v2-5-182d9aa0a5b3@linaro.org>

On Sat, Jan 13, 2024 at 10:55:48PM +0200, Dmitry Baryshkov wrote:
> If the PD is disabled for the port, port->pds will be left as NULL,
> which causes the following crash during caps intilisation. Fix the
> crash.
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> Call trace:
>  tcpm_register_port+0xaec/0xc44
>  qcom_pmic_typec_probe+0x1a4/0x254
>  platform_probe+0x68/0xc0
>  really_probe+0x148/0x2ac
>  __driver_probe_device+0x78/0x12c
>  driver_probe_device+0xd8/0x160
> Bluetooth: hci0: QCA Product ID   :0x0000000a
>  __device_attach_driver+0xb8/0x138
>  bus_for_each_drv+0x80/0xdc
> Bluetooth: hci0: QCA SOC Version  :0x40020150
>  __device_attach+0x9c/0x188
>  device_initial_probe+0x14/0x20
>  bus_probe_device+0xac/0xb0
>  deferred_probe_work_func+0x8c/0xc8
>  process_one_work+0x1ec/0x51c
>  worker_thread+0x1ec/0x3e4
>  kthread+0x120/0x124
>  ret_from_fork+0x10/0x20
> 
> Fixes: cd099cde4ed2 ("usb: typec: tcpm: Support multiple capabilities")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 5945e3a2b0f7..a0978ed1a257 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -6848,7 +6848,8 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>  	if (err)
>  		goto out_role_sw_put;
>  
> -	port->typec_caps.pd = port->pds[0];
> +	if (port->pds)
> +		port->typec_caps.pd = port->pds[0];
>  
>  	port->typec_port = typec_register_port(port->dev, &port->typec_caps);
>  	if (IS_ERR(port->typec_port)) {
> 
> -- 
> 2.39.2

-- 
heikki

