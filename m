Return-Path: <linux-arm-msm+bounces-33637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF939962F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2414DB251DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C5618C031;
	Wed,  9 Oct 2024 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgxJ++v3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B178517F4F2;
	Wed,  9 Oct 2024 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728462763; cv=none; b=IkXNOevJsqOmyPkZu4b6g9Ve+kf88qV1kwDw57G5gGC9QJbCiAhuBFmE/LDZYDk146v0xmfrnAptHdOvkBJP5qprqfDa5sdatoOQ6IWxzqaheNSPznlc33mFCZzpR81a7eQAmzjzp6U1pl+Qk53SkfBDSJ+1qbN+xpm4Vp3Rhpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728462763; c=relaxed/simple;
	bh=MRliL4d42oUFXT18/ClLP8fTTYxYtkZUYzUSobahq2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iluB1q15vC0dL/2r1CLlFsko4rtaFjAb2G2ml55/yRMbhLZco3RW9WAXz2JVhlLzuG/rTlNr9iUhLzam+zIWa0Cv39iem89xUhtT9uQrxtM3YieF9ey59mzXTiytn+HiS0mNafr1NB8APiIm82zoLmIiYBXpilFCr6NLpC4hDjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgxJ++v3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728462762; x=1759998762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MRliL4d42oUFXT18/ClLP8fTTYxYtkZUYzUSobahq2M=;
  b=GgxJ++v364+WIFTjbq6H1FEjoVt0/G/AoErksCLI4Bgw0qmtkCyoClqz
   zVoBjst+wA8OiTqbVbhX4+OuEhoIHJHoCmStQe05WcJcEclNJAH13a01v
   4K/MzqLcCCY4/KnZNQu+nia6ErrgJ45KNh5Lou6gS/qDLO1/WKGNvznL/
   YRQdOTRtWDFWLcO8eTHDFjMPg3Okzda6WZcwSqpoAqSVcpAsMqj7Di+z6
   cgB6gw7Qij8aEuXW5/HFKtotQwZ9h3gD/mPlUjN6EWVrG4J9GyhdV0LCN
   t1SaulEE4Rbz7v16/NURYPGIvQpviz8/aTj5mJqDZsXa1TV9Qi6KsZ+fO
   Q==;
X-CSE-ConnectionGUID: vz/C6V8AT0auudXitzpYFA==
X-CSE-MsgGUID: qajLH360S8arpfMximpNAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27562217"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="27562217"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 01:32:41 -0700
X-CSE-ConnectionGUID: ocGgrH2RRbmZ7C4sjWawXQ==
X-CSE-MsgGUID: NiV5zVWyTN65KIIlFTgllQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76188299"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa009.fm.intel.com with SMTP; 09 Oct 2024 01:32:38 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 09 Oct 2024 11:32:37 +0300
Date: Wed, 9 Oct 2024 11:32:37 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	"open list:QUALCOMM TYPEC PORT MANAGER DRIVER" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: fix sink status being
 overwritten with RP_DEF
Message-ID: <ZwY_pVEKE-GsXIvw@kuha.fi.intel.com>
References: <20241005144146.2345-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005144146.2345-1-jonathan@marek.ca>

On Sat, Oct 05, 2024 at 10:41:46AM -0400, Jonathan Marek wrote:
> This line is overwriting the result of the above switch-case.
> 
> This fixes the tcpm driver getting stuck in a "Sink TX No Go" loop.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index a747baa297849..c37dede62e12c 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -432,7 +432,6 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
>  			val = TYPEC_CC_RP_DEF;
>  			break;
>  		}
> -		val = TYPEC_CC_RP_DEF;
>  	}
>  
>  	if (misc & CC_ORIENTATION)
> -- 
> 2.45.1

-- 
heikki

