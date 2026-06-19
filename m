Return-Path: <linux-arm-msm+bounces-113849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tnPrCk5HNWo1rAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:42:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB376A6249
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:42:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=u3kRRVtG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113849-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113849-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D74C3025E5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 13:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF943278161;
	Fri, 19 Jun 2026 13:42:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E0F27FB3A
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 13:42:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781876547; cv=none; b=lRIDwC3yGHGyZ/UMcBk0Sjj/5tVsivVAnRVLvdan+iKbDgfTv1Mv86Cji+zRroRqyk/kqpaedfO+pU0FeOSVRwPsK3dbeufJWS2EPjrRSlfNWooFoEhkx9s4SMtJGn5uLpBZq6ho6ILGNKAv1Sebir79BH+9oTr+gxl/2ej4utA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781876547; c=relaxed/simple;
	bh=Zrl1wOMoOgmqzdTlUagiOko2coepMWkdVl+x/HpvvBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtmFmOcmppDQynt4fZ/vKwLGsOKLqKdfkEnMvY1XaiDVtfI3t41gCgaIsYCuIk4Pj+/EiDT/aETAogTSI4T5ukm0aEIUtMGWXGVXXUuif+wg6K3Q8Mt4EiBQK9Ds8fT4HsM1H41ixcPu/YvMU+tT/U+TTEMZyYAEL+esCN9wioI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u3kRRVtG; arc=none smtp.client-ip=95.215.58.172
Message-ID: <7466d545-85e0-4dab-aa3d-79c8e3a9cbda@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781876534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uj+34lCOzaDBkdO/bp8/xj6EAViL47S5OKUJ18GAU00=;
	b=u3kRRVtGyo2myHKBAsNqi+QRWO7R0QsWz7L1AZILvsRe5g6ktaFfrmaQcLdEU/EBkYul6N
	934H4xgm4NxLijJmhkAq3l79VKa/0D0nAc7Bj7w54nN+2/QyDAxtKzeu0TNI2j0k6z93Qe
	149MJzMsohBS239zjsVitMG35/2Z1z8=
Date: Fri, 19 Jun 2026 15:41:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/10] Expand SoundWire enumeration helper coverage
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
 vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com, jack.yu@realtek.com,
 shumingf@realtek.com, srini@kernel.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113849-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ckeepax@opensource.cirrus.com,m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pierre-louis.bossart@linux.dev,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierre-louis.bossart@linux.dev,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.dev:dkim,linux.dev:mid,linux.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AB376A6249


> The patch series in [1] added a new helper to remove common boiler plate
> waiting for a device to enumerate on SoundWire, however, many devices
> also wait for enumeration during probe. This series updates things to be
> suitable such that we can call the same helper at probe time when the
> unattach_request is not valid.

So if we are no longer testing for unattach_request, should this be definition and its use be removed?
Looks like there were multiple evolutions since the initial patch
"soundwire: sdw_slave: track unattach_request to handle all init sequences",
is an additional cleanup needed?

> There is one final step outstanding which is to add a core helper
> that waits for a device to drop off the bus. This is not include
> in this series and should be the last step of this process.

Humm, I am not following why the core needs to wait for a device to drop off. 
If there's a bus reset or device reset, it's almost immediate.
It the devices loses sync then the core wouldn't wait either since it's not expecting the device to drop-off.



