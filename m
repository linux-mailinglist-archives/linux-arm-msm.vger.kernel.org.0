Return-Path: <linux-arm-msm+bounces-92915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAPEM+H1kmlY0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:48:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 798B0142799
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B58873005589
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D89024A076;
	Mon, 16 Feb 2026 10:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzchyL5w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8751D5CD1
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771238879; cv=none; b=HkvfZDX89IWQfVUXU5KAVr2MH4aESkFmVQzEVYdCxkVnTE+S57mo4N6pshneuVUROvOkiSuKRC5m7FbEczwWAp6SMk6jF3j0Vh7ghYXiWjD//J5pn+ztq4PJvF9oaTemDx6+hjuAUKPF3sBXIUrlv2VGzxK7hj0FXIfj3eCDmS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771238879; c=relaxed/simple;
	bh=FmAZrnEMpRdb4yfHQsqQJsWHQI/ak9gpcuvRuiLF1+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WacRJiPobiF0DkrxImfz1I1qfPlUBsTmrzhTjtKQ81ONhaJB3wKgg9pZ/JNOBgfdDNZ9SoFcenKlMPSb61hIcVDWBftPOGfVoFSeiJxskasyYikEQTwicAlaGQ9TnXIbhVcfHOQxFfZjddyAR7kB5dYArk9BNwKfmhC9QOEun5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzchyL5w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F2AC116C6;
	Mon, 16 Feb 2026 10:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771238879;
	bh=FmAZrnEMpRdb4yfHQsqQJsWHQI/ak9gpcuvRuiLF1+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jzchyL5wiDBMLgrCWCbIz/r52isLwIkXzVmTDxY80jp4YJDnBoFC8AcHiDmVdsZ7r
	 j5XHC3utpe9hGF2KTdpPo51Sluh5i1PuoBHpoT9kW6Hb1lqzPAViUpDjTfeWSfS44C
	 /Mw+HIw8emtwJIgiAS8sRAqMXNtlx/p8f4NaRTcTEUNN27MhtAXux8AsOi935WI69R
	 5VfMN4/no2JTKpyCXYXU9Mcm/HpduJ8KzGbG5k5Un/PctUBYhVAlleWDaYyZ8FE+Xm
	 TkzRYXgY6snF0xT4AifbldJJsb/iI/8UF2bdpr9JNsbQkALnCKiP1DB47sWg6qjGZN
	 4Aa60+Kma7aVA==
Received: from johan by rho.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vrw8w-000000000cw-3O8B;
	Mon, 16 Feb 2026 11:47:55 +0100
Date: Mon, 16 Feb 2026 11:47:54 +0100
From: Johan Hovold <johan@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, vkoul@kernel.org,
	kishon@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] phy: qcom: snps-femto-v2: Fix possible NULL-deref
 on early runtime suspend
Message-ID: <aZL12oyiLumpf39e@hovoldconsulting.com>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
 <20260205160240.748371-6-loic.poulain@oss.qualcomm.com>
 <aY7pvakkOnaYsd5p@hovoldconsulting.com>
 <CAFEp6-3yk3sPXj+hGuWvAFsFJAXjH4kWLV8k_5_v9Hax0XxaOg@mail.gmail.com>
 <aY8Asvu-1u0e02oJ@hovoldconsulting.com>
 <CAFEp6-0rzkqc0ajN72q=mv3U-TT0JHMSPmnJD6ohKuLmbPz2-A@mail.gmail.com>
 <20260213201550.vk5cosmoewokarlx@skbuf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213201550.vk5cosmoewokarlx@skbuf>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92915-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: 798B0142799
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:15:50PM +0200, Vladimir Oltean wrote:

> Another comment upon reviewing this driver's runtime PM use (although
> this is at most something that may result in a patch for "next"):
> 
> This driver uses hsphy->phy_initialized to make sure qcom_snps_hsphy_suspend()
> isn't called unless qcom_snps_hsphy_init() was called.
> 
> Don't we achieve the same behaviour by replacing "hsphy->phy_initialized = true"
> with pm_runtime_get_sync(dev) and "hsphy->phy_initialized = false" with
> pm_runtime_put(dev)?

No, the device can still suspend before phy_init() is called.

What would work, and which should probably be preferred over adding
these phy_initialized flags, is to increment the pm usage counter before
enabling runtime pm and decrementing it after the PHY has been created.

Johan

