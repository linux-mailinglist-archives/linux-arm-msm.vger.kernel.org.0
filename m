Return-Path: <linux-arm-msm+bounces-91443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HaXAyVhgGlj7AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 09:32:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76674C9B35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 09:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 347313003408
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 08:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A005A258CD9;
	Mon,  2 Feb 2026 08:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1IcDypt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1CB23D2B4;
	Mon,  2 Feb 2026 08:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770021154; cv=none; b=P3HPesHfKZkgAt/x+sxho9tOHz3Gi/F9jmsdRf3Cmn+Y3b3/R6v6O9aL+fbJEJt1LSGh1o9p/OtvPBSCy7JhcBu27hyTO14U+SGcN8G5r1gMFuj74tkbRfyoNLzjsRSLtz+WmCOP7RrYNdkkj63+BXHVeKkBAU2XPCmsgUHm80Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770021154; c=relaxed/simple;
	bh=7QXku1Aiu+6hbzD01Hj8C+nKiBwTFCAXRN7TFq2JmK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqE/yd+XNVc3LejP+UTREvhBArhZRYyxevUBbN1UssTqp4ol34sg9rYfFdm79BJGwjNFNjzgg9zHxCrG/d5MgHUiFmiA2JJLt0VF/6w18jUaXylZuairAD8VQLvitvVHwuTCuer43b9hVG+paSDT50n/AR5gG78pjH49H3MGSRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1IcDypt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCE9C116C6;
	Mon,  2 Feb 2026 08:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770021154;
	bh=7QXku1Aiu+6hbzD01Hj8C+nKiBwTFCAXRN7TFq2JmK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s1IcDyptAodtOI5KSz3Q3lPZbGPuNSkvx16GanZrvLDbl5Ff/0nuNZ0Jwyc7Xz5s5
	 RNX5YehHeFx8gwp4SeTqat4JSyy90h+PN8kBb/WKKBG9Q6teItPPV3t5E1mdXD8wk+
	 Ak6jRgWnBOexG+JpzXrw7+ryKFy8M7SiUuuqDIO9BG1pK3/w0qmoFrP32nlKeVWPHD
	 afD+qZWxRMD+b9YwQ1iRvusY7qlXUG2ep6HKTVHd2vAACxqNKgZdhxgzrxZWt3/yAr
	 ZP/TzRKP5pfrZwuXb0v32Z02DwxXCQ9XETqdCpSb5gPh32cc/ElydNtTmyZJ/SRoJb
	 HjfRiMeH7axuw==
Date: Mon, 2 Feb 2026 14:02:28 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
	mani@kernel.org, linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: ice: Avoid probe deferring for un-supported
 ICE feature
Message-ID: <aYBhHMCyWMiVkuB_@sumit-xelite>
References: <20260130091118.147379-1-sumit.garg@kernel.org>
 <4ad700f3-da8f-4175-9172-3fc4d87d8152@oss.qualcomm.com>
 <aXx_UDTkdYHY04FR@sumit-xelite>
 <4f629971-94cb-44aa-9502-4f5ebfd63937@oss.qualcomm.com>
 <aXyXtK10_t-OBOxn@sumit-xelite>
 <2697d1e1-8421-46aa-b58f-10608a2bea2c@oss.qualcomm.com>
 <aXykJIuEwbeWuhs5@sumit-xelite>
 <ef1611c9-4698-45ed-8ccc-fbad42acd8da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef1611c9-4698-45ed-8ccc-fbad42acd8da@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91443-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 76674C9B35
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 01:36:28PM +0100, Konrad Dybcio wrote:
> On 1/30/26 1:29 PM, Sumit Garg wrote:
> > On Fri, Jan 30, 2026 at 12:55:53PM +0100, Konrad Dybcio wrote:
> >> On 1/30/26 12:36 PM, Sumit Garg wrote:
> >>> On Fri, Jan 30, 2026 at 10:59:18AM +0100, Konrad Dybcio wrote:
> >>>> On 1/30/26 10:52 AM, Sumit Garg wrote:
> >>>>> On Fri, Jan 30, 2026 at 10:34:26AM +0100, Konrad Dybcio wrote:
> >>>>>> On 1/30/26 10:11 AM, Sumit Garg wrote:
> >>>>>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>
> >> [...]
> >>
> >>>>> Since qcom,ufs depends on qcom,ice via a phandle, so isn't the probe
> >>>>> orderering automatically taken care off? Or that isn't the case here?
> >>>>
> >>>> No, that's guaranteed by devlink only with certain properties.
> >>>
> >>> Okay I see. The other alternate solution I can come up is following to
> >>> keep the deferred probing intact. Let me know your thoughts on this:
> >>>
> >>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> >>> index ab9586b8caf5..76bf9f94fbaf 100644
> >>> --- a/drivers/soc/qcom/ice.c
> >>> +++ b/drivers/soc/qcom/ice.c
> >>> @@ -559,7 +559,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >>>
> >>>         if (!qcom_scm_ice_available()) {
> >>>                 dev_warn(dev, "ICE SCM interface not found\n");
> >>> -               return NULL;
> >>> +               return ERR_PTR(-ENODEV);
> >>>         }
> >>>
> >>>         engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
> >>> @@ -648,11 +648,14 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >>>         }
> >>>
> >>>         ice = platform_get_drvdata(pdev);
> >>> -       if (!ice) {
> >>> +       if (IS_ERR_OR_NULL(ice)) {
> >>>                 dev_err(dev, "Cannot get ice instance from %s\n",
> >>>                         dev_name(&pdev->dev));
> >>>                 platform_device_put(pdev);
> >>> -               return NULL;
> >>> +               if (PTR_ERR(ice) == -ENODEV)
> >>> +                       return NULL;
> >>> +               else
> >>> +                       return ERR_PTR(-EPROBE_DEFER);
> >>>         }
> >>>
> >>>         link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
> >>> @@ -726,7 +729,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
> >>>         }
> >>>
> >>>         engine = qcom_ice_create(&pdev->dev, base);
> >>> -       if (IS_ERR(engine))
> >>> +       if (IS_ERR(engine) && PTR_ERR(engine) != -ENODEV)
> >>>                 return PTR_ERR(engine);
> >>>
> >>>         platform_set_drvdata(pdev, engine);
> >>
> >> This looks more robust. Although the UFS and MMC drivers today check
> >> for EOPNOTSUPP, so perhaps throwing that would be even better
> > 
> > Sure, I can use that error code instead.
> > 
> >>
> >>>
> >>>> In this case though, I think it could make sense to add it to the
> >>>> "suppliers" list in drivers/of/property.c.
> >>>>
> >>>> I don't know if vendors adding their custom properties there is a
> >>>> pattern that +Rob will be happy about though..
> >>>
> >>> Not sure if that's a shorter path as I would like to see fix for this
> >>> issue backported as well.
> >>>
> >>> Aside, not sure how much stable ICE feature itself is as I got following
> >>> crash with QLI boot firmware on Kodiak:
> >>>
> >>> [    5.172970] SError Interrupt on CPU6, code 0x00000000be000000 -- SError
> >>> [    5.172986] CPU: 6 UID: 0 PID: 241 Comm: (udev-worker) Tainted: G   M                6.19.0-rc5-next-20260115-gc1a0fee87a05 #9 PREEMPT 
> >>> [    5.172996] Tainted: [M]=MACHINE_CHECK
> >>> [    5.172999] Hardware name: Qualcomm Technologies, Inc. Robotics RB3gen2 (DT)
> >>> [    5.173003] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >>> [    5.173010] pc : qcom_ice_create.part.0+0x6c/0x24c [qcom_ice]
> >>> [    5.173024] lr : qcom_ice_create.part.0+0xe4/0x24c [qcom_ice]
> >>
> >> Could you please decode the pc value with ./scripts/faddr2line?
> >> My compiler produces different output
> >>
> >> ./scripts/faddr2line vmlinux(or path to .ko) <symbol_name>
> >>
> > 
> > This points at:
> > 
> > static bool qcom_ice_check_supported(struct qcom_ice *ice)
> > {
> > -->   u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
> > 
> > $ ./scripts/faddr2line ./drivers/soc/qcom/qcom_ice.ko qcom_ice_create.part.0+0x6c/0x24c
> > qcom_ice_create.part.0+0x6c/0x24c:
> > readl at /home/sumit/build/upstream/linux/./include/asm-generic/io.h:232 (discriminator 1)
> > (inlined by) qcom_ice_check_supported at /home/sumit/build/upstream/linux/drivers/soc/qcom/ice.c:118 (discriminator 1)
> > (inlined by) qcom_ice_create at /home/sumit/build/upstream/linux/drivers/soc/qcom/ice.c:587 (discriminator 1)
> > 
> > To me it looks like an issue related to access control policy. Note that
> > it's the Gunyah based stack only where this issue is seen.
> 
> Please first check if that's not just a lack of power, because apparently
> we never guaranteed that would be present, see:
> 
> https://lore.kernel.org/linux-arm-msm/20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com/
> 
> https://lore.kernel.org/linux-arm-msm/20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com/

Thanks for these references. TBH, if there are some known issues with
ICE then it shouldn't be enabled in the common defconfig. BTW, it looks
like Mani is already looking into proper fix for this issue as per
offline communication.

-Sumit

