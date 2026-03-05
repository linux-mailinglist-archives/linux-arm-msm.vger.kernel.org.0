Return-Path: <linux-arm-msm+bounces-95626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD37LZp6qWkg8gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 13:44:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A403211ECD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 13:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 448DE303CE8E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 12:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2BB39B4A9;
	Thu,  5 Mar 2026 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgFzGNx1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50F4366DAE;
	Thu,  5 Mar 2026 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714582; cv=none; b=OKepzO2UQhdY12SzxgoEVWGhZ7n9gvQFs9oRGKf86EWuSWg2M88OcDqd3LZl/NByCm0DfRmphtAEFjGlyHzxvON9N+NJ7VPHfidrrpTJEawiyEcYZY6jqT9rsrGzsr3x9kRYlAM2BffLS+o9VK+n/ijgf27zY515ICMLoeL5q1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714582; c=relaxed/simple;
	bh=3GlZ8dbSH/9p2g0p8El8ep4WXI+MyDdKLj11spmChUk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=fY7iXFiJRv/mRD1x10s83PYU1G6F22YANaVfODSYZLmLFiOSfCcYM8QO1Gmmga6itSTXS4bN6OCFGbK+qAXUU92OFvvmH8uJTaAvbezl4DF454emLugTM2HD46yVrpuawfOCTPssvrND+UeIKe9vtGGQd/p4xxI2sWVrA+t43pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgFzGNx1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61DC4C116C6;
	Thu,  5 Mar 2026 12:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772714582;
	bh=3GlZ8dbSH/9p2g0p8El8ep4WXI+MyDdKLj11spmChUk=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=GgFzGNx12a4sekSUlult5vhaiCEQPa/aodzXN8+UHcXB3h8noGgqo4GbdB34J33Bh
	 k0vB3oEX+wHYIMvcx8tVEPu3MyqbFT6qW757DZY8vcFyfVz/noQd5yqrt4neD9+rfs
	 t8vSpAssKPubdnCiqh8XKnSsuO8PffrFbbM1UftRybtTvJAhq+QNNDt9TqI+y270BQ
	 Y1v0vI/P0ullu4h1G5odV1MexgfXfvq8nNVqWq0Z04Q+Ojbx9KJtpwy82SzX4XoAWT
	 jxfHiANb/IJiVmSEOqOPlvSOZZ7IUyw1qnrYoMLDAxgLJPzKcwWrAK3K6kSUFekuYC
	 qEpw/odNELIwg==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 13:42:57 +0100
Message-Id: <DGUUVEFWIFCF.RX8CSJ96ZHMC@kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
 <glaubitz@physik.fu-berlin.de>, <abelvesa@kernel.org>, <srini@kernel.org>,
 <s.nawrocki@samsung.com>, <nuno.sa@analog.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 4/4] driver core: platform: use generic
 driver_override infrastructure
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-hwmon@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-sh@vger.kernel.org>
References: <20260303115720.48783-1-dakr@kernel.org>
 <20260303115720.48783-5-dakr@kernel.org>
In-Reply-To: <20260303115720.48783-5-dakr@kernel.org>
X-Rspamd-Queue-Id: 8A403211ECD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95626-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue Mar 3, 2026 at 12:53 PM CET, Danilo Krummrich wrote:
>  arch/sh/drivers/platform_early.c |  6 ++++--
>  drivers/clk/imx/clk-scu.c        |  3 +--
>  drivers/slimbus/qcom-ngd-ctrl.c  |  6 ++----
>  sound/soc/samsung/i2s.c          |  6 +++---

Some ACKs would be appreciated. :)

