Return-Path: <linux-arm-msm+bounces-117211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gdm1MpDCTGompQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:10:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA4B7198BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:10:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Y0o00ujl;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117211-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117211-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BEFA308992C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253E738F247;
	Tue,  7 Jul 2026 09:07:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D101E37AA9F;
	Tue,  7 Jul 2026 09:07:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415232; cv=none; b=lX5RBg9jsAZRNIv9da29JaA38Xg7IDmiJMW3iKtQYkiQOpMcnUtRw7k/7IrXoxAaq+bITaUf4c3dKAlcCJLVmpRRfXc8nltArUMtnbI9mgg5Yp64neSiwaaoRusqAmZwDuLbFqItoAoGCgwHQUirCZ+RUfWcRzegSzyL00YOM/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415232; c=relaxed/simple;
	bh=gVY3iRWoJPje433nYucl93kbMIGsxUeX/697NT+uj6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p++CxF8nDLbBRujq1/MuRT9Unfs0l2roDrl8LD+iVkZyWvcydryfT+IOM1ufD5DcfbKLLoCty8HDH5hrLWXGmeWt+glZTcVurlZx0fOVF05EBsM0MxHdbqdlmZ8uLKpxxG9O40qELzfIDXF/YXGDEwJBBZUfxaxxhkDe2/yFv9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y0o00ujl; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783415231; x=1814951231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gVY3iRWoJPje433nYucl93kbMIGsxUeX/697NT+uj6w=;
  b=Y0o00ujlsdweZAQQOcLnr/0V/G/zOaRCbbRnGvmOqv2L6cy7Lu0+CFrE
   6L2PXgLDBRbL1QQLXx9dlIHKCmRzq8TcRW9qQWsRVQJR4LNB1SuV5O02r
   +mNLdFH+goNZAhGv4klK99UAlEo0KgzmNa21C+MAqz3hfymAQoGSPryAb
   BtZ/I08iQXR73N8fiLmjWJHUb0taTqkzHGtd5MeLxnK3AIgmdpEuqKodd
   s/gscvkzkmuXBO1qHCoutmtgmGqFtB5g9yW4zQU7qbREFz99zlpq6/I+N
   DNkPjKWoTN81R5s8HqOvIhWvNLQj7wz0RfRWKN8/WbNMycaHoJHjYSB/q
   Q==;
X-CSE-ConnectionGUID: F+eiPi34Qg6EM0C75cOITw==
X-CSE-MsgGUID: sEL7zRZcTHebAS0qh5djuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="87740981"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="87740981"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:07:11 -0700
X-CSE-ConnectionGUID: CIM2WCXfQH6G4eHBrtF8Bw==
X-CSE-MsgGUID: s6S0Sy4+TAelQsVBP8aVYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253474346"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.178])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:07:03 -0700
Date: Tue, 7 Jul 2026 12:07:00 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, sboyd@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org, srini@kernel.org, vkoul@kernel.org,
	neil.armstrong@linaro.org, sre@kernel.org, krzk@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, quic_wcheng@quicinc.com,
	melody.olvera@oss.qualcomm.com, quic_nsekar@quicinc.com,
	ivo.ivanov.ivanov1@gmail.com, abelvesa@kernel.org,
	luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
	mitltlatltl@gmail.com, krishna.kurapati@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pm@vger.kernel.org, kernel@collabora.com,
	stable@vger.kernel.org, Sashiko Bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v10 01/11] spmi: Fix potential use-after-free by grabbing
 of_node reference
Message-ID: <akzBtOjs0Blb1pnF@ashevche-desk.local>
References: <20260707083730.33977-1-angelogioacchino.delregno@collabora.com>
 <20260707083730.33977-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707083730.33977-2-angelogioacchino.delregno@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117211-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:angelogioacchino.delregno@collabora.com,m:jic23@kernel.org,m:sboyd@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:sre@kernel.org,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_wcheng@quicinc.com,m:melody.olvera@oss.qualcomm.com,m:quic_nsekar@quicinc.com,m:ivo.ivanov.ivanov1@gmail.com,m:abelvesa@kernel.org,m:luca.weiss@fairphone.com,m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-pm@vger.kernel.org,m:kernel@collabora.com,m:stable@vger.kernel.org,m:sashiko-bot@kernel.org,m:ivoivanovivanov1@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,arndb.de,linuxfoundation.org,linaro.org,oss.qualcomm.com,quicinc.com,gmail.com,fairphone.com,vger.kernel.org,lists.infradead.org,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BA4B7198BD

On Tue, Jul 07, 2026 at 10:37:20AM +0200, AngeloGioacchino Del Regno wrote:
> As noticed by Sashiko during a review run of an unrelated patch,
> in of_spmi_register_devices(), for_each_available_child_of_node()
> is used to loop through children, and to also assign a node to a
> newly created SPMI child device.
> 
> Problem is that the refcount is dropped at every iteration so, in
> the specific case of DT overlays, a use-after-free may occur when
> an overlay is dynamically unloaded!
> 
> To resolve this, increase the of_node refcount when assigning (in
> function of_spmi_register_devices) and release the reference in
> spmi_device_remove().

...

>  void spmi_device_remove(struct spmi_device *sdev)
>  {
> +	if (IS_ENABLED(CONFIG_OF))

Unneeded check.

> +		of_node_put(sdev->dev.of_node);
> +
>  	device_unregister(&sdev->dev);
>  }

-- 
With Best Regards,
Andy Shevchenko



