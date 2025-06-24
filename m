Return-Path: <linux-arm-msm+bounces-62175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 089F1AE603D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 11:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFF231924436
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 09:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0535B27AC2F;
	Tue, 24 Jun 2025 09:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXpk7PdQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B521279DD4;
	Tue, 24 Jun 2025 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756054; cv=none; b=WYHrFzq1lbZmV4sa5I2zFrV1gy/y22H87TDQqyiByljW7FxQXSlbM+p7AoaBoAGTCqzYNO+3Kzcgopw5+vYvHBDuC3gwgGaDUwDNIwTOLawegO/USJwemNQK2gGKPoddjWtw+67boiqlsuVZTf0h0icAAqLEAegEvIVMU/w0GTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756054; c=relaxed/simple;
	bh=LImjdI/yU6Pe3jIPDaALZwPgLQGhX4tSMeDeFG4akNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3ifqAVWnsMYfkeVFTk0GuDW0PwA5TZWbf/eR17hOy8OUBEU600rHssvxqaxzKd1kNbkOjISMEbugPDe0b2y09zN0P3CrhZq6gBH7Ykl5XDbWu4pMZIILYggzjftfEvu+FNCUY+8XZZMwt8Rw0HF20ECb3vGZih3lbz9OcjZrRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXpk7PdQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750756054; x=1782292054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LImjdI/yU6Pe3jIPDaALZwPgLQGhX4tSMeDeFG4akNI=;
  b=cXpk7PdQSwENHkV7oOU0MfNOcFZOicbs316bmV0E59SSOsh4hW1uvWNs
   evfUsgU7HcZPFtaOPwbAvx8DF3hRshgyUUuFAnFq3+qq3c0c+3MX8RQrW
   tKskYvP827GQsmv++UB0q+NsL7uzbTFhpPRkkiSyBxSuHHOgYFd8k5SH6
   EYRtpBgBcXGsVYoyu4YssaDL1tuoITN5hWkt1cahooxkyrVdZ19DCkoQD
   WNiyqJ0zBXd0IBQ/UZvQydx2s0B/PpwlY2QRzXmpqe/sRHJE53fLP25eZ
   G86HoAsoAt+8SvvasfV2s6lYtvjwS9odMZBRyz0BnOPEU4abCgb+r2AOe
   g==;
X-CSE-ConnectionGUID: 1Rcl+j4WQn6UljEdQnSivA==
X-CSE-MsgGUID: +uINwZwvRLKNHKB5WCxiuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63251918"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="63251918"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 02:07:33 -0700
X-CSE-ConnectionGUID: LNJ52oFbQHuKRGfw+S9VOg==
X-CSE-MsgGUID: mZKINAqeRj+hasMGPN8SIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151609097"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa009.jf.intel.com with SMTP; 24 Jun 2025 02:07:30 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 Jun 2025 12:07:28 +0300
Date: Tue, 24 Jun 2025 12:07:28 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/8] usb: typec: ucsi: add recipient arg to
 update_altmodes() callback
Message-ID: <aFpq0GutBucmKWLw@kuha.fi.intel.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
 <20250621-c630-ucsi-v1-2-a86de5e11361@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-c630-ucsi-v1-2-a86de5e11361@oss.qualcomm.com>

On Sat, Jun 21, 2025 at 09:12:57PM +0300, Dmitry Baryshkov wrote:
> The update_altmodes() is executed only for connetor's AltModes, because
> that's what required on the CCG platforms. Other platforms (like Lenovo
> Yoga C630) requires similar fix for partner's AltModes. Extend
> update_altmodes() callback to accept the recipient as an argument and
> move corresponding check to the CCG UCSI driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c     | 5 ++---
>  drivers/usb/typec/ucsi/ucsi.h     | 3 ++-
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 4 ++++
>  3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 01ce858a1a2b3466155db340e213c767d1e79479..e913d099f934c7728cb678fc8e21e75ab0a00cce 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -531,13 +531,12 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
>  	 * Update the original altmode table as some ppms may report
>  	 * multiple DP altmodes.
>  	 */
> -	if (recipient == UCSI_RECIPIENT_CON)
> -		multi_dp = ucsi->ops->update_altmodes(ucsi, orig, updated);
> +	multi_dp = ucsi->ops->update_altmodes(ucsi, recipient, orig, updated);
>  
>  	/* now register altmodes */
>  	for (i = 0; i < max_altmodes; i++) {
>  		memset(&desc, 0, sizeof(desc));
> -		if (multi_dp && recipient == UCSI_RECIPIENT_CON) {
> +		if (multi_dp) {
>  			desc.svid = updated[i].svid;
>  			desc.vdo = updated[i].mid;
>  		} else {
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 5a8f947fcece29f98c0458f9eb05c0c5ede2d244..d02f6a3e2f50a4044eb3f22276931017cc624532 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -82,7 +82,8 @@ struct ucsi_operations {
>  	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci,
>  			    void *data, size_t size);
>  	int (*async_control)(struct ucsi *ucsi, u64 command);
> -	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
> +	bool (*update_altmodes)(struct ucsi *ucsi, u8 recipient,
> +				struct ucsi_altmode *orig,
>  				struct ucsi_altmode *updated);
>  	void (*update_connector)(struct ucsi_connector *con);
>  	void (*connector_status)(struct ucsi_connector *con);
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index e9a9df1431af3a52c00cc456f5c920b9077a1ade..d83a0051c737336af2543fc2f6d53a131ffe9583 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -394,6 +394,7 @@ static void ucsi_ccg_update_get_current_cam_cmd(struct ucsi_ccg *uc, u8 *data)
>  }
>  
>  static bool ucsi_ccg_update_altmodes(struct ucsi *ucsi,
> +				     u8 recipient,
>  				     struct ucsi_altmode *orig,
>  				     struct ucsi_altmode *updated)
>  {
> @@ -402,6 +403,9 @@ static bool ucsi_ccg_update_altmodes(struct ucsi *ucsi,
>  	int i, j, k = 0;
>  	bool found = false;
>  
> +	if (recipient != UCSI_RECIPIENT_CON)
> +		return false;
> +
>  	alt = uc->orig;
>  	new_alt = uc->updated;
>  	memset(uc->updated, 0, sizeof(uc->updated));
> 
> -- 
> 2.39.5

-- 
heikki

