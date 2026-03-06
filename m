Return-Path: <linux-arm-msm+bounces-95722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0E7lBZyFqmkhTAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 08:43:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C62821C951
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 08:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ECBD3015E02
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 07:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA6A37883D;
	Fri,  6 Mar 2026 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0EjM5fm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7148375F96;
	Fri,  6 Mar 2026 07:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772782989; cv=none; b=qrbEEiANuPsLc9fFUyWPqFpDNcw9apolNN3K/hV1jeWq1kyZxXu8mJAFw69V+n7PkaZpobdcfVbC79ngmsyGxy1sdRgrkzDN5Grcz8PweUuLKpZmMB40iOuKf0SJJ0JdO2m4Lw2464LHxeg5KkLlh9pDEjtRriMM1yiRXXETxfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772782989; c=relaxed/simple;
	bh=yWhMxQCi4S4VYAmWyXvM6CWmIG51FJKeHCKDvgC7Q94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlNhOBCbov3mgXoj2rhazBEYA1visE0zg5lOvO214O962Y6bkTuxc6yb8ypnPB4Rt5CiGUfrbgD91plglyPBfDwWI2uKKceDmQgGFKVPwwZoPkcFQ2iW02GiRF4lNf9rN0CLuiQXZmScdg9YgPh9n8FRDxVdLLZWUscjTSbb/jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0EjM5fm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F952C4CEF7;
	Fri,  6 Mar 2026 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772782988;
	bh=yWhMxQCi4S4VYAmWyXvM6CWmIG51FJKeHCKDvgC7Q94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0EjM5fmYxvo/Lt/wgXfh8B+MU4O/qjcQOIqLjUMOEwj6kmK8yzlF+ZXOS3wjPKox
	 gLdOtSW26YNuv9gJkb1sSvzwiiKnKoSH4uLZlyRx8P31tLJCsRwb5bB66tvHuFZC5i
	 WrArfH0UtHAtarYag7xjN0UhkBVL/zUIb/oFqY2psxB7xrb7riG155Rwx5giwxVXeb
	 ByoboaogFoCBp2dBuJ1OWpe9Po0W1dnrjpS85+KeHPdnljhLJV62450IsXDMQXiss6
	 zaLDrSvR3iPh+W/CKcZeq8jL8uaHqqtY3jEhrdhfiWi73Qheybumde+5fG3Ej3ZgdB
	 lIvTZfNxlJgAg==
Date: Fri, 6 Mar 2026 13:12:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, 
	Hemant Kumar <hemantk@codeaurora.org>, Bhaumik Bhatt <bbhatt@codeaurora.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] bus: mhi: host: pci_generic: Add
 pm_runtime_forbid() in remove callback
Message-ID: <3wjtmsjf6yxuhbtwjlg3tyxqfs4bjdktb4koxvdx26ljfxuwnu@3zvmme3palbi>
References: <20260303-b4-async_power_on-v2-0-d3db81eb457d@oss.qualcomm.com>
 <20260303-b4-async_power_on-v2-2-d3db81eb457d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303-b4-async_power_on-v2-2-d3db81eb457d@oss.qualcomm.com>
X-Rspamd-Queue-Id: 6C62821C951
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95722-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 01:02:14AM -0800, Qiang Yu wrote:
> Add pm_runtime_forbid() to balance the pm_runtime_allow() call made
> during probe. Without this, the device remains in runtime PM allowed
> state after driver removal.
> 
> Fixes: 855a70c12021 ("bus: mhi: Add MHI PCI support for WWAN modems")
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 0395a8ea52b0e874209ca56cd20ed04419038cdb..b6b21d0f3388d61b771062b8077f836a6bf8f9f8 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1459,6 +1459,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  		mhi_soc_reset(mhi_cntrl);
>  
>  	mhi_unregister_controller(mhi_cntrl);
> +	pm_runtime_forbid(&pdev->dev);

I moved this to the start of mhi_pci_remove() while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

