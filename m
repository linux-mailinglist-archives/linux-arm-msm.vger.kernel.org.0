Return-Path: <linux-arm-msm+bounces-110315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLuYFV7JGWpXzAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 19:14:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E62FB606389
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 19:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 762953004D21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D636B37BE9F;
	Fri, 29 May 2026 17:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HA0VAkF+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ACF376A1C;
	Fri, 29 May 2026 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780074843; cv=none; b=EDOoLPTw3klQIHKPuaCDwr1XS+Izj76TCi8vzSYC6qErZGtAYeIdX8Kz1pivQlqr11IFiD+ga9fP4kGdFdvHvXkfiBKoyVqB1mkcMMVeL0I1eKCbsaF8luGSfE316YBSYyrcZKzfspgMWofwzNWmjcdAVPO+2YXbbodUDkpecH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780074843; c=relaxed/simple;
	bh=BwTMy1rpw1ixoG7Bq6gcaG/UoUmrCqMZRcFmAW3gPSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h6ynxvmcpyyF3qgEyXhhdZKaCWzS6j137Rs+uplXi3reQ1jIx8gpP0JdU67b/WQzGFMYo0wMVrMOAyDhHcXY+cvbbzzsYXL4qOZsrjk+PMOj7TA3BJ0aPjnhsd8GLw3s1cFmZo2VgBFQjuQczmWlAB67dCVEZUnU/UVnGP9c/j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HA0VAkF+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641991F00893;
	Fri, 29 May 2026 17:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780074842;
	bh=FOngmApMBrQO8uj3ai8G4vkQzIPcP8Ggyb/B7X9jiE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HA0VAkF+ZdznJDiNbldi/HgfrVJ63DSBEyskhz9QG5BShGd6nJbuCc2syGLjeSSNm
	 T7PXFS3KuDO1NZd1sVmSFVTLFEoQ8nTqgOHE9n6dRa+42IDw60MmR3Byr9fK60d9Xq
	 ruSedHMfqJUmUYqACtYtwFixkVtMfwJymIs4r/AeiHwdXJ4aAGlIWszCoSn8H52Kxh
	 sAOsuHxIO/IgTsNtnmbJ5r5bFTmRoFCKdKJg9vBILH5me9x4Gqiy+5Dn/Xu6Eq8e8R
	 cOCViNu8yP/qJ9MQgacQcQ7exaMK4MNot6MbMH2gmEaZjdFbbA1Lj3xisTdWGVWoti
	 4CA6fblr3QY3g==
Message-ID: <f1ee6c54-25b5-4d9d-864f-26e349bb22c5@kernel.org>
Date: Fri, 29 May 2026 19:13:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Remove DRIVER_GEM_GPUVA feature flag
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Laura Nao <laura.nao@collabora.com>, steven.price@arm.com,
 liviu.dudau@arm.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 kernel@collabora.com
References: <20260421084701.24227-1-laura.nao@collabora.com>
 <20260529191027.40e1ec5b@fedora>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260529191027.40e1ec5b@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110315-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E62FB606389
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/29/26 7:10 PM, Boris Brezillon wrote:
> I took the liberty to queue this one to drm-misc-next even though it
> was lacking R-b/A-b from Nouveau/Pvr maintainers because
> 
> - it's pretty trivial
> - it's been posted more than a month ago
> - we need it to make progress on the Tyr side
> - if it's broken (I honestly doubt it), we still have a full release
>   cycle to revert
All good, thanks for queuing it up; I saw you message this morning and had it on
my list to reply.

- Danilo

