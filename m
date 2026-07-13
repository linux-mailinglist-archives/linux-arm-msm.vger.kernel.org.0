Return-Path: <linux-arm-msm+bounces-118835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cXgvH1AcVWo2kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 19:11:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D1574DE3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 19:11:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=e+vKztkQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118835-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118835-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7556D3011793
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 17:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E24F344D90;
	Mon, 13 Jul 2026 17:11:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A256343893;
	Mon, 13 Jul 2026 17:11:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783962702; cv=none; b=eylbBQ13n56gRdVFE4U7CBYsr7uCVtZBumDDERYr8tYcOaib+3nQjb1sgvl4QEKHjRjOt8VSeelatkn/K8A2ro8jKRa8hhXdw8kNlPpEoPYFqqwDPHcoXaUeQhaC0u2Fx1Dx6IVf2u2He0XmGXMo8zjtvZcm7RT7Qt4yQ3nrLeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783962702; c=relaxed/simple;
	bh=7ShsLbO26RpGQqch7SoZexIphrs3eIZdhot/Rwa+/RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCLRRBaMZxtxMAw3lgvR7E8+k/AkdWIHSFpnuDAkI+67BLGdAVZS9pu/MANDFIbBz/REGPg1P/PcZW4aENpL1LhsABcw1X4Jf8O1AyxQMmP/fHP8evLGPs0h6/cZVbXWRhPumZOOo/rjM79sqysjxiyckKmktAt2MNtGwGHDiKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+vKztkQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D476C1F00A3A;
	Mon, 13 Jul 2026 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783962700;
	bh=aKs5fgpDGbjVA4/sXLKlz6OKtuurHs4tokGqg7EWMoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e+vKztkQrTN6Z/ZBNoq8MDxk7OygKY4LjFgOuc805M9uXn+0AX5F6zAeSRmZ2V/UO
	 Ekwk+cVf30C7PX9dTHhvphnSortuqtHoOeIWQHHRQi7ojJtmTy+CPHVKizZsyP4tB+
	 J/JghSIxCQT/MU59liHhrsxpBk32DpA25EpL01zVtbQ+aPUxtkZjadEx2yjBZDzCUf
	 oHed6rXNVHmrJv84x5CgbLu4oY9OfesW4J8K74funNYXeyZUpfQ19tBZF/kwmF0a/3
	 mVtnJbdSKzgEzCXxIldQbyG+/RRO2C8T/5GV17mo5+2lpZYBjVji0tM1ANevk2iejN
	 qCABn3bIsKFxQ==
Date: Mon, 13 Jul 2026 19:11:30 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mhi@lists.linux.dev
Subject: Re: [PATCH v6 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
Message-ID: <wbez5pvslz2opnjd2mih7b4noce2oghbdi3ncxyrpg7u7vocas@zj4zzxh53myv>
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-4-3a78362c4741@oss.qualcomm.com>
 <n45ii7ekxeefuxw2ydwzsx7lqlfczbgg6obrzmzpytl2fin7j5@vbhmrptcjvcb>
 <a05e7dcc-7d8b-4db0-bd51-754184afb7c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a05e7dcc-7d8b-4db0-bd51-754184afb7c1@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kishore.batta@oss.qualcomm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mhi@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118835-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08D1574DE3E

On Mon, Jul 13, 2026 at 12:55:52PM +0530, Kishore Batta wrote:
> 
> On 7/9/2026 11:49 AM, Manivannan Sadhasivam wrote:
> > On Wed, Jul 01, 2026 at 04:07:38PM +0530, Kishore Batta wrote:
> > > The Sahara driver currently selects a firmware image table based on the
> > > attached device, but it does not recognize QDU100 devices that expose the
> > > protocol on the SAHARA MHI channel. As a result, the host cannot associate
> > > QDU100 devices with the correct firmware namespace during image transfer.
> > > 
> > > Extend the probe time variant selection to match the SAHARA MHI channel and
> > > associate it with the QDU100 firmware folder. Add a firmware lookup
> > > fallback for cases where an image does not have an explicit entry in the
> > > device's firmware table. This allows required images to be provisioned by
> > > the platform.
> > > 
> > > This change only affects devices matched on the SAHARA MHI channel and
> > > does not change behavior for existing AIC100 and AIC200 devices.
> > > 
> > > Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> > > ---
> > >   drivers/bus/mhi/host/clients/sahara/sahara.c | 27 +++++++++++++++--
> > >   drivers/bus/mhi/host/pci_generic.c           | 45 ++++++++++++++++++++++++++++
> > >   2 files changed, 70 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
> > > index e339c67e236af271645ca81cc517efd9eead87e4..9adbd84859073d8024ba2a5fcfa33897439d6759 100644
> > > --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
> > > +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
> > > @@ -189,6 +189,7 @@ static bool is_streaming(struct sahara_context *context)
> > >   static int sahara_find_image(struct sahara_context *context, u32 image_id)
> > >   {
> > > +	char *fw_path;
> > >   	int ret;
> > >   	if (image_id == context->active_image_id)
> > > @@ -201,8 +202,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
> > >   	}
> > >   	if (image_id >= context->table_size || !context->image_table[image_id]) {
> > > -		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
> > > -		return -EINVAL;
> > > +		if (!context->fw_folder) {
> > > +			dev_err(&context->mhi_dev->dev,
> > > +				"Request for unknown image: %u (no fw folder)\n", image_id);
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/%u",
> > > +				    context->fw_folder, image_id);
> > > +		if (!fw_path)
> > > +			return -ENOMEM;
> > > +
> > > +		ret = firmware_request_nowarn(&context->firmware,
> > > +					      fw_path,
> > > +					      &context->mhi_dev->dev);
> > > +		kfree(fw_path);
> > > +		if (ret) {
> > > +			dev_err(&context->mhi_dev->dev,
> > > +				"request for unknown image: %d\n", image_id);
> > > +			return -EINVAL;
> > > +		}
> > > +		context->active_image_id = image_id;
> > > +		return 0;
> > >   	}
> > >   	/*
> > > @@ -870,8 +891,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
> > >   static const struct mhi_device_id sahara_mhi_match_table[] = {
> > >   	{ .chan = "QAIC_SAHARA", },
> > > +	{ .chan = "SAHARA"},
> > >   	{},
> > >   };
> > > +MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
> > This change should belong to a separate patch.
> 
> There was a review comment from Jeff(v4, patch 3) to move to this change to
> the patch which adds QDU100 support so that it doesn't break bisect. Please
> let me know if i need to move it to a separate patch altogether ?
> 

Since it is a new device support for Sahara, bisect is not really a problem. But
I do see a value in keeping everything in a single patch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

