Return-Path: <linux-arm-msm+bounces-119046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AYtuHD48Vmro1wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:40:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1707755428
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:40:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=kUdr7yms;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119046-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119046-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F33FE300DDCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AA245BD7B;
	Tue, 14 Jul 2026 13:32:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E1F3FADFD;
	Tue, 14 Jul 2026 13:32:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035956; cv=none; b=bLCXt7EmZ1Y8kMvMR2WTYF8ZR9GNyqwPRG+bWZPw8fkV/oWPSCd1TPpDgFBYTwm1m8Up07V7OTb0eoluZFLY6OTJbP9lCizuvo5MaUMtYb4wtpVJlp4iXzlBchMOxcudyP24RiRl6FOU4Dsxq3jXgS7eBCHkWON36kabnenJO1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035956; c=relaxed/simple;
	bh=0Ayb5SZkyIQ3JLXUdbuPESyU2c5gycyEFNk1AymdpSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dr4hzOBv2ARa7BrsTNr7Q7lPVNtVG3ypxMNUmcNHh3YXCi27CCGY3UWjnZrJvme1XffojHiADVXwAr0fJH+BciTtH8u3/oleox+sQBENUTYPlrvsSdfdGGb0JwRqR4nJ6FLlNAhLYyHJIbnSpvtM8BY0u1UINIpqqthj09expzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kUdr7yms; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784035953; x=1815571953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0Ayb5SZkyIQ3JLXUdbuPESyU2c5gycyEFNk1AymdpSk=;
  b=kUdr7ymsCLkLj2R1ZmEcq54z6twVupdzPoV6zHicdMFxV/J3Gj3eYoVZ
   TpO2RJTY1LlKdbHIrueldGtbN45YLUpTaKGQDPl8jY4jRHmwct1Tzz5Pe
   CRK6MCtSQQXhSdcQKK4kMQBtqNLhD6XO2lFHZS5DHiwtKUxd69cFZSuit
   t+Agc17AmdBoU/VYDTbUvF3wugNRmxRxMmGxYGXi6FcQSsvnJcIihdDqM
   Ql3LdGInsRZbOMDLeZ4k1cf2+F2HthJeYnV543fDmz+jzH/VL3Yfpxr0H
   M9uamF3vZuIHUaaVsCbJIH1KLaSwKyrH48vNMtiWScbI2eua6XovX/vZ5
   Q==;
X-CSE-ConnectionGUID: +UwPuP0tT0ij0xHC4iNuhg==
X-CSE-MsgGUID: +KYcZ/o8Sk6cBPDnvmPaow==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84620709"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84620709"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 06:32:33 -0700
X-CSE-ConnectionGUID: lI4QUOv3T+eb48ekCNRaLw==
X-CSE-MsgGUID: FU8WawmGQZOHNBE1aiIzWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="294060834"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 14 Jul 2026 06:32:31 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id C221295; Tue, 14 Jul 2026 15:32:29 +0200 (CEST)
Date: Tue, 14 Jul 2026 16:32:28 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH v1] usb: typec: tcpm: qcom: initialize currsrc explicitly
Message-ID: <alY6bJT9_g5t0ZT7@kuha>
References: <20260713182500.GB22956@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713182500.GB22956@altlinux.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119046-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[heikki.krogerus@linux.intel.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:gremlin@altlinux.org,m:bryan.odonoghue@linaro.org,m:gregkh@linuxfoundation.org,m:linux@roeck-us.net,m:casey.connolly@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:lvc-project@linuxtesting.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kuha:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1707755428

On Mon, Jul 13, 2026 at 09:25:00PM +0300, Alexey V. Vissarionov wrote:
> When regmap_read() fails, the execution goes to done: label, where
> currsrc is passed to rp_sel_to_name() and used as an index after a
> proper check. However, to make this situation easier to notice, an
> explicit initialization of currsrc with obviously impossible value
> is suggested. Alas, we can't simply use zero value here because it
> means TYPEC_SRC_RP_SEL_80UA.
> 
> Found by ALT Linux Team (altlinux.org) and Linux Verification Center
> (linuxtesting.org) using SVACE.
> 
> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index bf985efe1cd6bea4..d7cb69cf6044841b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -461,8 +461,8 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
>  	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>  	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>  	struct device *dev = pmic_typec_port->dev;
> -	unsigned int mode, currsrc;
> -	unsigned int misc;
> +	unsigned int currsrc = 0xFF; /* error, easy to notice in the log */
> +	unsigned int mode, misc;
>  	unsigned long flags;
>  	int ret;
>  
> 
> 
> -- 
> Alexey V. Vissarionov
> gremlin ПРИ altlinux ТЧК org; +vii-cmiii-ccxxix-lxxix-xlii
> GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

-- 
heikki

