Return-Path: <linux-arm-msm+bounces-114074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g5TMHiXlOWomywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:45:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C15536B3561
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:45:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=N8dhNW7o;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114074-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114074-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7710E30378B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 01:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9245A364059;
	Tue, 23 Jun 2026 01:37:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D27913E02A;
	Tue, 23 Jun 2026 01:37:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782178631; cv=none; b=gEx+MRuKdY60kVqxP0cc5h+xsO6vxBp1ssaW0u3hTN2iNNGZT0xp6aR3eyup7jHOVtTMi5zYzkUxlvEQnXuKUFjpFiimyea5hY66k7nLdhN7r6FnoLnccuK5Z8b30WTGNZAQpHWR1KF6A9zEt0lcgg0rI0uOLvf0YQjhPpBL72Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782178631; c=relaxed/simple;
	bh=NnB/IyFKuLnp20aj9Vf2RVJR9A/MNwpCPFaR6OXvqLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DijkOZMj4TUVkRZ3RoX+0akHWlKK2FQSUtmyggcWZRwkdNJ8G5eMQdplct+YJO04ecZ7cujYeWVUVkKBgrdeGig+IGYQ5qlVJ/jSnJ+F1iE5KN1nYfsi0kZCb+j5IzRibUrIHb03D2IP9EZ0/nHJhbc+DWAQKya9TFV14vDqlWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8dhNW7o; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44ABD1F00A3A;
	Tue, 23 Jun 2026 01:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782178630;
	bh=jDksLzjv3HPUwFc/MLqnuTWykelMNarcYe/lF1zr4xI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N8dhNW7oZNrCrmamhx3o4XVsiksPaAi6C34/6qFM05Ir8H7EyciktXDmueXzdPzK8
	 646qoweDMQvVDx5LExI+luCrbvfTSOR1BHESKK+3MgAsPlwT4nLQiCvm2OCDBdJh0z
	 hEkBFEWdiPQHFNtt/S4DfvmeYni2+jq+s8vtH4+LQOhYiMXD7lsIQOdKcAz4gAEyxO
	 SGdOA0M9RkqY8iECjCbPCxq6wtlEXfzzgEWYJy35SzU1a6xUO4vL69fmNUsPqxji1O
	 Yd5GwFoCh6Kt95l6pmtN+i8tfwHtvFGDQjmPnwAr939ZdVXC4R5pV3ujSCIPUJP6b/
	 Vs1/JYr17XMuA==
Date: Mon, 22 Jun 2026 20:37:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
	kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of: Fix RST inline emphasis warnings in of_map_id()
 kernel-doc
Message-ID: <178217862199.3896734.18392819970621877080.robh@kernel.org>
References: <20260619-iommu_map_kdoc_fix-v1-1-9573e1cf30b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619-iommu_map_kdoc_fix-v1-1-9573e1cf30b3@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114074-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vijayanand.jitta@oss.qualcomm.com,m:saravanak@kernel.org,m:devicetree@vger.kernel.org,m:lkp@intel.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C15536B3561


On Fri, 19 Jun 2026 11:16:47 +0530, Vijayanand Jitta wrote:
> The @filter_np parameter descriptions in of_map_id() and of_map_msi_id()
> contained the text '*filter_np' in prose. Docutils interprets a leading
> '*' as the start of RST emphasis (italic), but finds no closing '*',
> triggering:
> 
>   Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2134:
>   WARNING: Inline emphasis start-string without end-string. [docutils]
> 
>   Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2260:
>   WARNING: Inline emphasis start-string without end-string. [docutils]
> 
> Fix by wrapping '*filter_np' in double backticks (*filter_np) to
> render it as an RST inline code literal, which is also the correct
> kernel-doc convention for pointer expressions.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606130111.ldC96rqf-lkp@intel.com/
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/of/base.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!


