Return-Path: <linux-arm-msm+bounces-103180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uICKBVJw3mleEQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:50:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 078EF3FCBD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D61C301F1BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD9E3E8C5E;
	Tue, 14 Apr 2026 16:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qLFpEGvN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA462253EC;
	Tue, 14 Apr 2026 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776185405; cv=none; b=SFWSUHYj/F/21jmZvg/gM7em7WlvfeVsvL2k11kyVywHmN8FBWrLZVrEhGm6e1/JUVfBrPYTvN8EUvPFSLCxjsZNDHGgy/MhxgMgkt+oQ7/lHJQ/i1sa0/EYIY9eT66jbJtDXY4Lcg+yT7fAylASXd/Somql2Wka746gn0wZXhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776185405; c=relaxed/simple;
	bh=Dge0DCS/QYtIgyrk1+RNGXNQhBsk1R+oQTAvvrTBHr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgBrcqtMHNUbz6oO1y+FuO2pqpQB33U3rMeoyVtZEsKVnhYi9xFTMRdm6VG1ap59S+Xt8zYYWsOHGXWehPQTIL4ES1xGmHytQkanf4YMgnnNE7pIWrbtyMc9v9JKFVPDcvc4PkYpyQ5KOY56vDRTIW7hu/0oGuk2bLFRdObpN38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qLFpEGvN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F30C19425;
	Tue, 14 Apr 2026 16:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776185405;
	bh=Dge0DCS/QYtIgyrk1+RNGXNQhBsk1R+oQTAvvrTBHr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLFpEGvNOn2J0c3amth0T/BSS+qAPInX3J/3HfeiAHDkONa2ZuJWdBe2JmaB48Vsy
	 8yH51OyTrvDIOmka54WHeVakebbJVkeAn5lSkClMKw5rdVnpJMF7H8+02i/sxwXgCD
	 4co+tT3gSWcz22dRr8rE1irOoT5huoJmemctg5mA=
Date: Tue, 14 Apr 2026 18:49:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: ekansh.gupta@oss.qualcomm.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] drivers: base: Add generic context device bus
Message-ID: <2026041418-volley-composer-6363@gregkh>
References: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
 <20260414-computebus-v1-1-4d904d40926a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-computebus-v1-1-4d904d40926a@oss.qualcomm.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103180-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,gmail.com,ffwll.ch,8bytes.org,arm.com,arndb.de,oss.qualcomm.com,quicinc.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 078EF3FCBD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:01:15PM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Introduce a new generic bus type for synthetic context bank devices
> that require IOMMU context isolation. This bus provides a shared
> infrastructure for accelerator and GPU drivers that create virtual
> devices representing IOMMU context banks.
> 
> Currently, drivers like host1x implement their own bus types for
> context devices. This generic implementation allows multiple drivers
> to share the same bus infrastructure, simplifying the IOMMU subsystem
> integration and reducing code duplication.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/base/Kconfig        |  3 +++
>  drivers/base/Makefile       |  1 +
>  drivers/base/context_bus.c  | 24 ++++++++++++++++++++++++
>  include/linux/context_bus.h | 15 +++++++++++++++
>  4 files changed, 43 insertions(+)
> 
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index f7d385cbd3ba..479bc4bb442b 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -4,6 +4,9 @@ menu "Generic Driver Options"
>  config AUXILIARY_BUS
>  	bool
>  
> +config CONTEXT_DEVICE_BUS
> +	bool

So this is a context-free bus?  I.e. no documentation?

:)

This feels really odd, this "bus" isn't doing anything at all.  So why
do you need it and can't use auxbus or faux?  

You say something about an iommu, but yet this has no information about
an iommu at all, so why are they somehow special?

You need to provide a lot more information here, sorry.

greg k-h

