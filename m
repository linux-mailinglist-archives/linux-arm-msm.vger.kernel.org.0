Return-Path: <linux-arm-msm+bounces-62179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0AAAE6093
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 11:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48E794C1834
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 09:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F8627AC4C;
	Tue, 24 Jun 2025 09:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1eVO5Lj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD4127AC48;
	Tue, 24 Jun 2025 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756615; cv=none; b=HWLMQeWmYi5ph2TihBmkCcLHfHInlTCW9jhTIUI+yiVepGLBo4tH4gzrimNl7p9ShH/PLNrLM7QvsgZaOTVGJ0XigrR6TqtwAx5m3S153lCgC/f+BC8Ne5TtdXEe3xsfcMGUSqRTWXC+NKqe1jBuYwbUozys25KJwAVFCJZ+U3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756615; c=relaxed/simple;
	bh=1UkrTPngst7ysoOn0/y2t6Rdz+jkdOaSrNS6D53UmbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQWK0eqE93b8adGTWPgH/BCpsdkuxTaj8Ebv+GzDhbqPhXc4jbrEl3zoXd0IkyYmOPUEN0wwFmZ2NCkjpzevcoCK8WlPZ4lgnAIjrv66yXVLZhLOV3LPWR9RMauZL1uL0JTCin8JgqQuxpqrArbSC3loLaWH/FhC9jHLkmvILhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1eVO5Lj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750756614; x=1782292614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1UkrTPngst7ysoOn0/y2t6Rdz+jkdOaSrNS6D53UmbE=;
  b=c1eVO5LjSb/yussrT2SFDU3lpWW8ljgfAXYZzK6bR4dAwjVYQgMuyVT9
   7d7OYoX79g12JzT5y9uBtZTGanaihLHGXMa8UFSjDOA5egWtaaMXwF8yM
   MbOntRPxUxOZfeSWo82xqZo9CS7JqV4zrEW/IS+5cIUz46wHo5AwrHda6
   unOt4nomXA3f+/3bHcDo+CAPemCNh2FZTTybc/DLLZgPoYr0RykyfQuDo
   LVJhNcB/RAz8iKf5f7Z3iucutcPLoM1jyB+NQ437CoLbJY8eTGSDQI00m
   EHXrTTwJ4BX7G+Af3e3s+Sz39OW/0qHN7Z/gK572P4n9s3P+CP5bOaks7
   Q==;
X-CSE-ConnectionGUID: R+ZLZZaUShiIYcnMPPV4fQ==
X-CSE-MsgGUID: LQdtCnb0TzWeu7vLx8NE0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56663887"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="56663887"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 02:16:53 -0700
X-CSE-ConnectionGUID: XEvBU3DYQlOCQIQGZievow==
X-CSE-MsgGUID: V8wyaJoJTFyROARz7z3xFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="182889254"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa002.jf.intel.com with SMTP; 24 Jun 2025 02:16:50 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 Jun 2025 12:16:48 +0300
Date: Tue, 24 Jun 2025 12:16:48 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 6/8] usb: typec: ucsi: yoga-c630: correct response for
 GET_CURRENT_CAM
Message-ID: <aFptAN0CsQycSc-2@kuha.fi.intel.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
 <20250621-c630-ucsi-v1-6-a86de5e11361@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-c630-ucsi-v1-6-a86de5e11361@oss.qualcomm.com>

On Sat, Jun 21, 2025 at 09:13:01PM +0300, Dmitry Baryshkov wrote:
> On Lenovo Yoga C630 the EC handles GET_CURRENT_CAM command, but it
> returns 1 if DisplayPort is active and 0 otherwise. However in order to
> let UCSI drivers handle AltModes correctly, it should return 0 / 0xff.
> Correct returned value.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> index 506faf31b6e3a056e067f2bb69f5e9e5ea40e514..76afd128d42a2573ff55433f815c2773462a6426 100644
> --- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> +++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> @@ -111,7 +111,15 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
>  		return 0;
>  	}
>  
> -	return ucsi_sync_control_common(ucsi, command, cci, data, size);
> +	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* UCSI_GET_CURRENT_CAM is off-by-one on all ports */
> +	if (UCSI_COMMAND(command) == UCSI_GET_CURRENT_CAM && data)
> +		((u8 *)data)[0]--;
> +
> +	return ret;
>  }
>  
>  static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
> 
> -- 
> 2.39.5

-- 
heikki

