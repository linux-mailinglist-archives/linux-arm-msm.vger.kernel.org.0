Return-Path: <linux-arm-msm+bounces-111958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a6WpIcwRJ2qwrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 21:02:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0897659F70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 21:02:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EpPBPesJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111958-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111958-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6313C305288E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 18:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4ED738AC68;
	Mon,  8 Jun 2026 18:47:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED28138655C;
	Mon,  8 Jun 2026 18:47:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780944432; cv=none; b=RxP7IrNoXv8P3oPfwg4BQnjttB1yvQ+2UXZLM5WPO5MEqDqP6ip+JL8MNCtoqEluFf1cTLoTTJMkqWGeZR1u9peHuoR1yGzo8ILcHmiMMGyhCHNQXAH9JwlfilZy7R2DC0dPQENJpGpHefJPTd+vHNs6dwE0AsiiQVtNhzFPrew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780944432; c=relaxed/simple;
	bh=jIXOa3IANriRmE+Hrzn/zHPjxWLZE6MoAuaoVvnKymY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B604GOjayNj/+nNfd0eEBMWlc3bzNtlAavb7CTANfMRe0Q0P5rruc4f6YbxRa15V/PkqCF4HXhuld0Fb2/1VZbB+PR6XN1Le9xKVV5q8uRvbQJIr4SXp67Un5ANapqtw5PPgNBrY2y5VnOaWTXDfaQNAVlOwF9KuoATCNOscYBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpPBPesJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E442B1F00893;
	Mon,  8 Jun 2026 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780944431;
	bh=EtweTn+TBzruOlaaXfFvtIoBOUF/n2c1CEY/TA07AuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EpPBPesJA1d0nGq/5LgoelWHamqVlKkLkGBmf1vtA+uguhLm7uKn6i53Wlww8pc+P
	 5pHIw/1Vgh4z5eF+TS2H3jOYVdUIami9SfpvxHVNIaWMy+t38OPDvz8fI9RP84ZZkI
	 ZtDLBO0X2N0GA9xVJyyovimM7A5SaXpgfyQyzkqn4/8ZWtgAVC5X7toUBD26UVid0a
	 PIGtVViiTjIN6j5pN0D7oSyG0DbAwVa/H7lXlkOd+95mMHCdPdfykG2eQxUrawSWg5
	 i2HxRfm092dkSHwOzh3zKN3k+kUKGQBchYrTLDNNB2K4DxP07yuHS5TPk79LA6jBHu
	 hCSt6zyvsyIVg==
Date: Mon, 8 Jun 2026 20:47:08 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/4] i2c: qcom-cci: Fix NULL pointer dereference in
 cci_remove()
Message-ID: <aicOEBDOmFVbtcgr@zenone.zhora.eu>
References: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:rfoss@kernel.org,m:andersson@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andi.shyti@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-111958-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,zenone.zhora.eu:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0897659F70

Hi Vladimir,

On Sat, May 16, 2026 at 02:41:17AM +0300, Vladimir Zapolskiy wrote:
> On all modern platforms Qualcomm CCI controller provides two I2C masters,
> and on particular boards only one I2C master may be initialized, and in
> such cases the device unbinding or driver removal causes a NULL pointer
> dereference, because cci_halt() is called for all I2C masters regardless
> of its initialized state, the bug is present in the driver since its
> inclusion to the Linux kernel.
> 
> Along with this fix a number of driver code simplifications are added into
> the series.
> 
> Changes from v1 to v2:
> * remove junk accidentally added to one of the commit messages.
> 
> Link to v1:
> * https://lore.kernel.org/linux-i2c/20260515152003.1604187-1-vladimir.zapolskiy@linaro.org
> 
> Vladimir Zapolskiy (4):
>   i2c: qcom-cci: Fix NULL pointer dereference in cci_remove()

merged to i2c/i2c-host-fixes.

>   i2c: qcom-cci: Do not check return value of cci_init()
>   i2c: qcom-cci: Move cci_init() under cci_reset() function
>   i2c: qcom-cci: Remove overcautious disable_irq() calls

merged to i2c/i2c-host-next.

Thanks,
Andi

