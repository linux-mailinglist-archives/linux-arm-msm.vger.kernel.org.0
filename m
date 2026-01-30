Return-Path: <linux-arm-msm+bounces-91306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBciBEKkfGmMOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:29:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED46BA89D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DDAB300CC9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BEAF37998C;
	Fri, 30 Jan 2026 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NlWo2a3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F905378D87;
	Fri, 30 Jan 2026 12:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769776174; cv=none; b=X3bxdV1/gw/LU9hetq9/ld6UGf1chb6zSB4GcxTJz+zhgNgM3C3wynltZMKicKWi/H4p2fPIiQqVjIhrty82h3oVRPRz/rhFhW3aISjR48wu6UGyPkmS4UEaIj4NJC3Lf7buRTPhnkkIH01yAzp0N8cdLhEZlyPkfEP4PITX+zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769776174; c=relaxed/simple;
	bh=o/OT0sMTNRMVUSC74v9NJjPwkElg+bUEDAM4b0XKUK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G79XsYs3fbUGIadUYu1pfz667fW3c7+LXqorPt6Cv7dhhRTRJsIYCuh9KVZEcL6fTLkfU/GifQYUhIOxEqxMhQQ127Si5o0Y+egbxjT/tj20uhxY0mCNHqAsvvBOwbuiHttLzuVqjifWPl7sBdfuI/4z+5UDWk7TJZHwrnNp7N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlWo2a3E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C36C4CEF7;
	Fri, 30 Jan 2026 12:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769776173;
	bh=o/OT0sMTNRMVUSC74v9NJjPwkElg+bUEDAM4b0XKUK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NlWo2a3ECVXH8iAGm/ou13Y5y8qEbJsCZALVqWdLErCHFm9FUaszQT8CVuVdfQRf6
	 B97CbCkjlbQ1uur73hnOJeqvSljwBKm23W9rk0lHzLDDHtsa+HZCKZT4trQcVS7oOJ
	 KLiwAN57z+BWuXCG8h10VDhkrZuAhQ9UP9mi2GjoPtYQZq8vqPj7FWZuYv0hsaJkh1
	 ZHOsOdmqTwBiXkVT9gN2m8eGL1/ciTPNrod8TNSGCjT9YpcXoEos1TPa8e4xsvzgl8
	 sj6gPTmBkAYiCpDImL8FXxWO6ud+XMbyF3jXOljhLN0wRmM3SEOvbbNp+YTK90Sh5t
	 WMaYbRyJy4abQ==
Date: Fri, 30 Jan 2026 17:59:24 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
	mani@kernel.org, linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: ice: Avoid probe deferring for un-supported
 ICE feature
Message-ID: <aXykJIuEwbeWuhs5@sumit-xelite>
References: <20260130091118.147379-1-sumit.garg@kernel.org>
 <4ad700f3-da8f-4175-9172-3fc4d87d8152@oss.qualcomm.com>
 <aXx_UDTkdYHY04FR@sumit-xelite>
 <4f629971-94cb-44aa-9502-4f5ebfd63937@oss.qualcomm.com>
 <aXyXtK10_t-OBOxn@sumit-xelite>
 <2697d1e1-8421-46aa-b58f-10608a2bea2c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2697d1e1-8421-46aa-b58f-10608a2bea2c@oss.qualcomm.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91306-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7ED46BA89D
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 12:55:53PM +0100, Konrad Dybcio wrote:
> On 1/30/26 12:36 PM, Sumit Garg wrote:
> > On Fri, Jan 30, 2026 at 10:59:18AM +0100, Konrad Dybcio wrote:
> >> On 1/30/26 10:52 AM, Sumit Garg wrote:
> >>> On Fri, Jan 30, 2026 at 10:34:26AM +0100, Konrad Dybcio wrote:
> >>>> On 1/30/26 10:11 AM, Sumit Garg wrote:
> >>>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> [...]
> 
> >>> Since qcom,ufs depends on qcom,ice via a phandle, so isn't the probe
> >>> orderering automatically taken care off? Or that isn't the case here?
> >>
> >> No, that's guaranteed by devlink only with certain properties.
> > 
> > Okay I see. The other alternate solution I can come up is following to
> > keep the deferred probing intact. Let me know your thoughts on this:
> > 
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index ab9586b8caf5..76bf9f94fbaf 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -559,7 +559,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> > 
> >         if (!qcom_scm_ice_available()) {
> >                 dev_warn(dev, "ICE SCM interface not found\n");
> > -               return NULL;
> > +               return ERR_PTR(-ENODEV);
> >         }
> > 
> >         engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
> > @@ -648,11 +648,14 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >         }
> > 
> >         ice = platform_get_drvdata(pdev);
> > -       if (!ice) {
> > +       if (IS_ERR_OR_NULL(ice)) {
> >                 dev_err(dev, "Cannot get ice instance from %s\n",
> >                         dev_name(&pdev->dev));
> >                 platform_device_put(pdev);
> > -               return NULL;
> > +               if (PTR_ERR(ice) == -ENODEV)
> > +                       return NULL;
> > +               else
> > +                       return ERR_PTR(-EPROBE_DEFER);
> >         }
> > 
> >         link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
> > @@ -726,7 +729,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
> >         }
> > 
> >         engine = qcom_ice_create(&pdev->dev, base);
> > -       if (IS_ERR(engine))
> > +       if (IS_ERR(engine) && PTR_ERR(engine) != -ENODEV)
> >                 return PTR_ERR(engine);
> > 
> >         platform_set_drvdata(pdev, engine);
> 
> This looks more robust. Although the UFS and MMC drivers today check
> for EOPNOTSUPP, so perhaps throwing that would be even better

Sure, I can use that error code instead.

> 
> > 
> >> In this case though, I think it could make sense to add it to the
> >> "suppliers" list in drivers/of/property.c.
> >>
> >> I don't know if vendors adding their custom properties there is a
> >> pattern that +Rob will be happy about though..
> > 
> > Not sure if that's a shorter path as I would like to see fix for this
> > issue backported as well.
> > 
> > Aside, not sure how much stable ICE feature itself is as I got following
> > crash with QLI boot firmware on Kodiak:
> > 
> > [    5.172970] SError Interrupt on CPU6, code 0x00000000be000000 -- SError
> > [    5.172986] CPU: 6 UID: 0 PID: 241 Comm: (udev-worker) Tainted: G   M                6.19.0-rc5-next-20260115-gc1a0fee87a05 #9 PREEMPT 
> > [    5.172996] Tainted: [M]=MACHINE_CHECK
> > [    5.172999] Hardware name: Qualcomm Technologies, Inc. Robotics RB3gen2 (DT)
> > [    5.173003] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [    5.173010] pc : qcom_ice_create.part.0+0x6c/0x24c [qcom_ice]
> > [    5.173024] lr : qcom_ice_create.part.0+0xe4/0x24c [qcom_ice]
> 
> Could you please decode the pc value with ./scripts/faddr2line?
> My compiler produces different output
> 
> ./scripts/faddr2line vmlinux(or path to .ko) <symbol_name>
> 

This points at:

static bool qcom_ice_check_supported(struct qcom_ice *ice)
{
-->   u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);

$ ./scripts/faddr2line ./drivers/soc/qcom/qcom_ice.ko qcom_ice_create.part.0+0x6c/0x24c
qcom_ice_create.part.0+0x6c/0x24c:
readl at /home/sumit/build/upstream/linux/./include/asm-generic/io.h:232 (discriminator 1)
(inlined by) qcom_ice_check_supported at /home/sumit/build/upstream/linux/drivers/soc/qcom/ice.c:118 (discriminator 1)
(inlined by) qcom_ice_create at /home/sumit/build/upstream/linux/drivers/soc/qcom/ice.c:587 (discriminator 1)

To me it looks like an issue related to access control policy. Note that
it's the Gunyah based stack only where this issue is seen.

-Sumit

