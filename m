Return-Path: <linux-arm-msm+bounces-118829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HAgcOlwQVWpJjgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:20:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E073974D883
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:20:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YHZfWHGi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118829-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118829-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83BC1300621D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88BB40BCC4;
	Mon, 13 Jul 2026 16:19:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B9133AD88;
	Mon, 13 Jul 2026 16:19:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959582; cv=none; b=fFYRzoLMUYuIvxV5/yJ7/wKrfETA1q0VLrN2dKUYMyOnMPTpqtY1X2Y/o34TEeT7wRM7oyetjpxwI1j63Gk3nxstKkT5VtrmdAbeJD+fgKA7YQ6MIIeqFExH56Gx8qJ8Dx6vkSuMUuLYvN09ND6oRRqkR1uGhqWkPbP+vqPt2sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959582; c=relaxed/simple;
	bh=UrU/itlOP+rit6cFnakMEDrwKFJ+4WWvWHfwH/2hf38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxbrRZkA17TUd1QyJdqQ+hnB1zpeNXq5SFoEazJzayVGv2/gq/FLsFLK6X/AbVfU4SnEkxySzPribS5Qj4wK6XiZwssXQjPZRGvr6IW0Gi3GFChEGooW1ts4LtsQhE+hepEWgbtM3yzit7ETvSx3mPjrx7XvM8HDxmcRyGCdQ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHZfWHGi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D041F000E9;
	Mon, 13 Jul 2026 16:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783959576;
	bh=7sX79a8gzjULeBFsanRoK3h8jRzavZVqjAH+0r52JCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YHZfWHGiNL7wt3TvUIYLlK4BfKSOHjHBwxYwk/zvwIf2rvEop5c3zO5SQWl1FNDl6
	 sKfWPIc2QkyeFCdUdPj10w69oQF6AbH6ryEwN+hRgJCXVrUUzY99k6/LBPiN+znnZM
	 9J7twPP/a1frJ3fk6piU7PPiQuWByd4KLbmCS2b3GmW3yHRO0QdqGOVbXC190beDxK
	 TdfFAUTo/IrZtav5IcEsvwIBJEE6eRU+b+6AdHdjz/2b9Zgqv+nz9QtkKEZDcDLq4A
	 80MGwLtfTpIUYFSktpkx25fvJnOqLvfRm4QC4fIXU0UHcxVfMU61tfSPdeZN4u9v+e
	 hOXK/Z3egO6kg==
Date: Mon, 13 Jul 2026 18:19:28 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mhi@lists.linux.dev
Subject: Re: [PATCH v6 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
Message-ID: <kwq7tajvlnm5sesmthseleenbah6d5kuj5d2msyspme7je6o2h@rx3dbqyqeywh>
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-4-3a78362c4741@oss.qualcomm.com>
 <n45ii7ekxeefuxw2ydwzsx7lqlfczbgg6obrzmzpytl2fin7j5@vbhmrptcjvcb>
 <21867efc-b5a8-4ed9-92b4-059a020731a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21867efc-b5a8-4ed9-92b4-059a020731a6@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-118829-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,rx3dbqyqeywh:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E073974D883

On Mon, Jul 13, 2026 at 07:46:02PM +0530, Kishore Batta wrote:
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
> > 
> > >   static struct mhi_driver sahara_mhi_driver = {
> > >   	.id_table = sahara_mhi_match_table,
> > > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > > index 391ab146f501c6ce1c81f6138f7c491a49c2f264..82e41632afc555a53dec3d8395558ae039b33bbd 100644
> > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > @@ -300,6 +300,43 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
> > >   	.reset_on_remove = true,
> > >   };
> > > +static const char * const qdu100_image_table[] = {
> > > +	[5] = "qcom/qdu100/uefi.elf",
> > > +	[8] = "qcom/qdu100/qdsp6sw.mbn",
> > > +	[16] = "qcom/qdu100/efs1.bin",
> > > +	[17] = "qcom/qdu100/efs2.bin",
> > > +	[20] = "qcom/qdu100/efs3.bin",
> > > +	[23] = "qcom/qdu100/aop.mbn",
> > > +	[25] = "qcom/qdu100/tz.mbn",
> > > +	[29] = "qcom/qdu100/zeros_1sector.bin",
> > > +	[33] = "qcom/qdu100/hypvm.mbn",
> > > +	[34] = "qcom/qdu100/mdmddr.mbn",
> > > +	[36] = "qcom/qdu100/multi_image_qti.mbn",
> > > +	[37] = "qcom/qdu100/multi_image.mbn",
> > > +	[38] = "qcom/qdu100/xbl_config.elf",
> > > +	[39] = "qcom/qdu100/abl_userdebug.elf",
> > > +	[40] = "qcom/qdu100/zeros_1sector.bin",
> > > +	[41] = "qcom/qdu100/devcfg.mbn",
> > > +	[42] = "qcom/qdu100/zeros_1sector.bin",
> > > +	[45] = "qcom/qdu100/tools_l.elf",
> > > +	[46] = "qcom/qdu100/Quantum.elf",
> > > +	[47] = "qcom/qdu100/quest.elf",
> > > +	[48] = "qcom/qdu100/xbl_ramdump.elf",
> > > +	[49] = "qcom/qdu100/shrm.elf",
> > > +	[50] = "qcom/qdu100/cpucp.elf",
> > > +	[51] = "qcom/qdu100/aop_devcfg.mbn",
> > > +	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
> > > +	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
> > > +	[54] = "qcom/qdu100/qupv3fw.elf",
> > > +};
> > > +
> > > +static const struct mhi_sahara_fw_table qdu100_sahara_fw = {
> > > +	.image_table = qdu100_image_table,
> > > +	.table_size = ARRAY_SIZE(qdu100_image_table),
> > > +	.fw_folder = "qdu100",
> > > +	.non_streaming = false,
> > > +};
> > > +
> > >   static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
> > >   	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 2048, 1),
> > >   	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 2048, 2),
> > > @@ -1399,6 +1436,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > >   	pci_set_drvdata(pdev, mhi_pdev);
> > > +	/*
> > > +	 * Provide Sahara firmware mapping. Sahara consumes it via
> > > +	 * mhi_dev->mhi_cntrl->sahara_fw at probe time.
> > > +	 */
> > > +	if (info == &mhi_qcom_qdu100_info ||
> > > +	    (info->name && !strcmp(info->name, "qcom-qdu100")))
> > > +		mhi_cntrl->sahara_fw = &qdu100_sahara_fw;
> > > +
> > Why are you adding QAIC MHI controller config in pci_generic driver? This driver
> > only handles Modem devices.
> > 
> > - Mani
> 
> 
> Hi Mani, Above one is for QDU100 device. QAIC is not added in this file.
> 

Sorry, my bad. But anyhow, you should provide this mapping table pointer via
'struct mhi_pci_dev_info'.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

