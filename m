Return-Path: <linux-arm-msm+bounces-116303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YO4ZNJClR2qBcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:05:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF007022CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:05:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=isqoo6sg;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116303-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116303-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A6963023066
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 12:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3A43CEB9D;
	Fri,  3 Jul 2026 12:04:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1F73955F9;
	Fri,  3 Jul 2026 12:04:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080296; cv=none; b=IKjW7WuR59YmNWd2Whk356JKeE/rmWAgrKX71QVE7vDc/h5md4IFYWw9+joWT8ajJOfVfvSwmi2iHUhp7/Eo+jqk7UvfkjVigYNtQi71wf4cwrsylwpvpg38PKss3abntXbKTtEsIA/zNyRJmGTaBPuURi8vHnIq1weDrQpmmwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080296; c=relaxed/simple;
	bh=zT943j/0ckAaxNWmkwKXLFV1By2z7RpNfvSZ3vlmhwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGhJcW+4sEmYegTtgI8xobkhFT3qabmVMwGMo4MkQGczsB1Lj7ugNtPTD+JLD85t9ORcLB7JD7HZ3GjuJxPRSrp3Aa83PYoVYyJQfoxos48W6uepiX5t9T5QYThtfrP5h0QunSEV0GXRFfAMTSRwVlfDAIuBHqNd3T4JshOnSaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isqoo6sg; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783080295; x=1814616295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zT943j/0ckAaxNWmkwKXLFV1By2z7RpNfvSZ3vlmhwQ=;
  b=isqoo6sgvsUN6V58Oy5Iq9PxDNFNnhsmfMHinjZEAi4eHlvjZJfHNbMK
   kAFlAcPGv1VQIVlZ7eKdGEsKdbq90gPWaI7Vj6oI5NmtQbYja7VD06KM8
   gvwYgSu9+oV7ciQvswiOMyhm3kIwKIn0GE8lBl6KKhJkqrSAQU5l7mNQ0
   2Ur2v1iJnJlRBEL7EmasS8nhToqW5omy1ZLf+zFG5g8CeK0hwR1DtaU37
   A8SRf2rAImOQMKGCLHNIDmsHZ1ef25fOXJyWd0OdJNRiMyF73k9Z+CcpS
   PU8BnK7Toca9Bt6gSaYz7meatTaDGY5FLUam4ogaU8szNn8i2Far3fZUx
   Q==;
X-CSE-ConnectionGUID: i+L58dt0RKOTF0FULPekyg==
X-CSE-MsgGUID: 1YwR+NUyTQimMdMqCX9juQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101254749"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="101254749"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:04:54 -0700
X-CSE-ConnectionGUID: 9GY13TqhTvOyfjmZ4dtX+g==
X-CSE-MsgGUID: /2FiK+QeTDyJylfL9sbmPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="276306599"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jul 2026 05:04:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 42B5F98; Fri, 03 Jul 2026 14:04:50 +0200 (CEST)
Date: Fri, 3 Jul 2026 15:04:48 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Vasiliy Kovalev <kovalev@altlinux.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: avoid uninit values in
 dev_dbg() error paths
Message-ID: <akelYJEXIZmP5Spx@kuha>
References: <20260630120114.185169-1-kovalev@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630120114.185169-1-kovalev@altlinux.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116303-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[heikki.krogerus@linux.intel.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kovalev@altlinux.org,m:bryan.odonoghue@linaro.org,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lvc-project@linuxtesting.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:from_mime,intel.com:email,intel.com:dkim,vger.kernel.org:from_smtp,linuxtesting.org:url,kuha:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEF007022CD

On Tue, Jun 30, 2026 at 03:01:14PM +0300, Vasiliy Kovalev wrote:
> Several functions take a 'goto done' shortcut on regmap_read() (or
> switch default) failure before assigning locals that the trailing
> dev_dbg() then formats.
> 
> Initialize the affected locals at declaration.
> 
> Found by Linux Verification Center (linuxtesting.org) with Svace static
> analysis tool.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index bf985efe1cd6..c8379cdcb6da 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -366,7 +366,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
>  	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>  	struct device *dev = pmic_typec_port->dev;
>  	unsigned int misc, val;
> -	bool attached;
> +	bool attached = false;
>  	int ret = 0;
>  
>  	ret = regmap_read(pmic_typec_port->regmap,
> @@ -461,8 +461,8 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
>  	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>  	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>  	struct device *dev = pmic_typec_port->dev;
> -	unsigned int mode, currsrc;
> -	unsigned int misc;
> +	unsigned int mode = 0, currsrc = 0;
> +	unsigned int misc = 0;
>  	unsigned long flags;
>  	int ret;
>  
> @@ -535,7 +535,8 @@ static int qcom_pmic_typec_port_set_vconn(struct tcpc_dev *tcpc, bool on)
>  	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>  	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>  	struct device *dev = pmic_typec_port->dev;
> -	unsigned int orientation, misc, mask, value;
> +	unsigned int orientation = 0, misc = 0, value = 0;
> +	unsigned int mask;
>  	unsigned long flags;
>  	int ret;
>  
> -- 
> 2.50.1

-- 
heikki

