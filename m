Return-Path: <linux-arm-msm+bounces-92513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDRXJW45i2neRgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 14:58:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A2D11BA18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 14:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACAB3305149B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC762352F9C;
	Tue, 10 Feb 2026 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBWb6pa6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DFF34167B;
	Tue, 10 Feb 2026 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770731669; cv=none; b=EjKm5y6zvle1DQ2c7FTf5KjH7rS2lEX/YAbSHk9S0rnEdcGR7HgTvX/avKrOAqH7B6sDuT2MT+wZ9P5KpInu9lYzTSDW1ZcRwkczVf/WTv4lLTkx3aunXOZUINIObpFfMNLL2fOKPXCSU98UPGklfEu7FGsX5Z2KyrAr9i35Ah8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770731669; c=relaxed/simple;
	bh=nwZUHE376cmJsamlkoacloSAsBqHZzZIso7GijVf1J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTNYisHDHfjvVy26rPDIC9/4UwhsUIfqKlkIDFxHS9ZRYKn/uTrAwD7LAceSEjWBOUTfh9gAvlbhRBZoNiocHoUuIBviA60A32t5Mod2SJxBaX6hXus68rym5/eXbzToAkTQG2bmFvQYCElpkRJ8sbTibWUBDE5UhiyNysBbs74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBWb6pa6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46D8C116C6;
	Tue, 10 Feb 2026 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770731669;
	bh=nwZUHE376cmJsamlkoacloSAsBqHZzZIso7GijVf1J8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBWb6pa6t4WHkLe39BI2VgLpPgF8zmW7A5Lt5Y8xhwKkTY42Fr3Pv5SxQrd7KqIX9
	 9UEY1ylBKH88fbCydDHF4kzDMlDC+loO3xKKJ0CJA2gYgS0Xo+0XJn3w0Ep8kMj7sX
	 rRYrmPKh6SrB5Fx6w8Y3zbYg+lJ0vZSJ+LeTZRQAt7b+dqPRUT4oQw0hO/ARbQvOh8
	 UvydUuHKRajAjVjVwPqA2MGuCtMt5j1GHyZ8pe6EKVNhUbVrbk8n5cTo5rLeWaeONd
	 dGqLdfNc/d4FVQrX6WXuQO72orHFCgsMLjpYBev5DGCMOBKnWISPLONvawvRq6AvWM
	 0gy0J87OovdKA==
Date: Tue, 10 Feb 2026 19:24:20 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>, stable@vger.kernel.org, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] soc: qcom: ice: Remove platform_driver support
 and expose as a pure library
Message-ID: <h3b67ea7kkofh3jtmgvxvago5cejf3gyjwzdynkigk6ljdtp6w@dmg76x46tcjf>
References: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
 <CAPDyKFocm3yRTG0TJJRxfDvJMjvvvri5fzi_HoNY4YSd-41oKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFocm3yRTG0TJJRxfDvJMjvvvri5fzi_HoNY4YSd-41oKA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92513-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 25A2D11BA18
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 02:43:53PM +0100, Ulf Hansson wrote:
> On Tue, 10 Feb 2026 at 07:56, Manivannan Sadhasivam via B4 Relay
> <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
> >
> > Hi,
> >
> > This series removes the platform_driver support from Qcom ICE driver and
> > exposes it as a pure library to the clients to avoid race conditions with ICE
> > SCM call availability.
> >
> > Merge Strategy
> > ==============
> >
> > ICE patches (1,2) through Qcom tree and MMC/UFS patches (3,4) through respective
> > subsystem trees as there is no dependency.
> 
> Just wanted to double check that this is really correct....
> 
> The propagated error codes (or NULL) are changed in patch1/patch2, so
> is it really okay to pick the mmc/ufs patches (patch3 and patch4)
> independently?
> 

Darn... No, I was being stupid here. Without patch 2, removing NULL check in
patches 3 and 4 will break the respective drivers, but patch 1 is fine though.

Thanks for spotting this. All patches should go at once through Qcom tree.

- Mani

> Kind regards
> Uffe
> 
> >
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> > Changes in v2:
> >
> > * Added MODULE_* macros back
> > * Removed spurious platform_device_put()
> > * Added patches to remove NULL return
> >
> > ---
> > Manivannan Sadhasivam (4):
> >       soc: qcom: ice: Remove platform_driver support and expose as a pure library
> >       soc: qcom: ice: Return proper error codes from devm_of_qcom_ice_get() instead of NULL
> >       mmc: sdhci-msm: Remove NULL check from devm_of_qcom_ice_get()
> >       scsi: ufs: ufs-qcom: Remove NULL check from devm_of_qcom_ice_get()
> >
> >  drivers/mmc/host/sdhci-msm.c |  10 ++--
> >  drivers/soc/qcom/ice.c       | 127 ++++++++++++++++---------------------------
> >  drivers/ufs/host/ufs-qcom.c  |  10 ++--
> >  3 files changed, 58 insertions(+), 89 deletions(-)
> > ---
> > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > change-id: 20260210-qcom-ice-fix-d2a3a045b32d
> >
> > Best regards,
> > --
> > Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >
> >

-- 
மணிவண்ணன் சதாசிவம்

