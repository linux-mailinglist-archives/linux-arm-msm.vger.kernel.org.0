Return-Path: <linux-arm-msm+bounces-111138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hPoeFOUeIWo2/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:44:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A554663D4D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:44:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Mj7NLYPk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111138-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111138-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 920203015D18
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 06:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA273CBE70;
	Thu,  4 Jun 2026 06:44:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB403803F2;
	Thu,  4 Jun 2026 06:44:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555489; cv=none; b=A/nNlS5HJS3VMPNWlEby26r07RGIXX4FAaA7fF9KMjeoke+MQkDl6QlfrcppO4HK4wV+Wp6N+Ng7gJG/S1ibm0korCr76n8o61AdF6eBaHkx/pv/T7b4N7RDhQhmSZ+nd4BkowSLKdIYkNi572uzORLCJJXnUjc87JrjWANMYt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555489; c=relaxed/simple;
	bh=r8AFu0ndSrfVB6Cb6f69ES56jOfrNKW13ofKNIPaLY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ip1+tpzT5M8Wpk/pbz6G2rXLklufQznoGj1Vg1jHEES+xUeLCW98pxU9yu2kKeXkWEYlRqaqoGzeq8e/TVlcW9+tzuXjQJYbtuxfl5u/n6Zd3pZbZxmzzBNhhBKuujNGO0PMlAtaucwqdnMPPdx84K/V47z1OMZQmCpRarpdtlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mj7NLYPk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302261F00893;
	Thu,  4 Jun 2026 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780555487;
	bh=hQ9VvpoH7tgPamI9TfpHp94chB77RXIhjUGPPGWvSJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mj7NLYPk5kYP0l7XRTiqVPM2rWwTKBQYmtAtZf3FgQd9s3gxtxT3aP2Xzr7+XYVH8
	 EG/x7q9yaD7xHHQN+w+RIqI9WATr4DR21KONKeyPQAl9M2qgaLUY+ID17O3hjU3Edm
	 0mct33cWIT3kGb22AX7WNMW7nJwWt9HbhQsJsECQgmAkbyVEDydQ/tyLzLVyK4WYRn
	 BhlvpfNZ0cfdjERmC3WKdYn8HryVMvlMcovtH/et6UzMXpCHdsOCSkU2l5VBk3xOzH
	 inGBnXiJJvnfX4q2MLGSHaux8UO5X4y8QjsN6Dx4kdy49CkrIxDfYhZ3N4QsmS8RmQ
	 7Ot3lMkOaP2Og==
Date: Thu, 4 Jun 2026 12:14:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, lgirdwood@gmail.com,
	pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
	peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
	jack.yu@realtek.com, shumingf@realtek.com, srini@kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 01/10] soundwire: Always wait for initialisation of
 unattached devices
Message-ID: <aiEe3DIvuQOU2O7p@vaman>
References: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
 <20260603144443.593230-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603144443.593230-2-ckeepax@opensource.cirrus.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111138-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ckeepax@opensource.cirrus.com,m:broonie@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.dev,linux.intel.com,realtek.com,vger.kernel.org,opensource.cirrus.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,vaman:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A554663D4D6

On 03-06-26, 15:44, Charles Keepax wrote:
> Currently in sdw_slave_wait_for_init() the waiting can be skipped
> if unattach_request is not set. Doing so was added in [1] likely
> because the core used to do a complete() on the completion so
> waiting in the case an unattach hadn't actually happened would
> block for the full timeout. However patch [2] updated the core to
> use complete_all() which means that the wait_for_completion() will
> now simply return if the device is already attached skipping the
> completion doesn't add much.
> 
> Additionally, unatttach_request is only set if the host initiates
> a bus reset. However, the host doing a bus reset is not the only
> reason a device may be unattached from the bus. Other options
> could include the driver probing before the device enumerates, a
> sync-loss, or the device itself powering down.
> 
> Removing the skip using unattached_request, doesn't cost much in
> terms of efficiency and allows the sdw_slave_wiat_for_init() helper
> to be used outside of runtime resume.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

