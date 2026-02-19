Return-Path: <linux-arm-msm+bounces-93335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMs4M2CylmmRjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:49:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3202415C794
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BC5930209C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 06:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0DA32142E;
	Thu, 19 Feb 2026 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEOLcARJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770453203BE;
	Thu, 19 Feb 2026 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771483674; cv=none; b=uUFS0wdn90thU82G/swNN2ztWcYylekTWpr/65mYad/BJMuzW76Yhczv+JnA6aMeVmf+AZvWVYHsjV2HvqYxXzaUEn06icdrgyTMm+ycUjaT6h7DRuYZWtPN8BqIJC3XqqcsfQzFAGl5N0bWIrKgqj+fyUP4VGy+9QYVsovRXdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771483674; c=relaxed/simple;
	bh=lzaTHTVPxydKuuWqA5G/SizcM0Ihx6zmnhMas62IGWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnO0TatjYX/RQdt8HVJ7sE6juA0Z/odSmYnKWnoXmeQdQ2s0LZMxVu9GdfHC+FGHAckYnfUsmPVX1JCc6GyT8FtP7DpIFETbFgLfPbW8w8bPH0qnNrxsVDh3zQ2i0cBj8u7SO+dapVsL3r76/ozXMPlQ7QSnuy2bAW5NwuRwblo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEOLcARJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10614C4CEF7;
	Thu, 19 Feb 2026 06:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771483674;
	bh=lzaTHTVPxydKuuWqA5G/SizcM0Ihx6zmnhMas62IGWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEOLcARJlH00LTFXLTZy6ADBI0nizmQX31TwJgOmL19myx1suH5p3fL1UBok32WdQ
	 lXU/y5JzFXyuyCyV9E2CDQXBAP48vZxtn1WEJYRcyyDgnQpUfDgc0sNFyV2OUdLDB1
	 b4XyrxXlk4IONthflKZHscRo9JiXJjQPCN2ERM0Dux8b7T8QQ3uYIm5JqPhHwp7m0D
	 bT9/IBhOslm1NB6dXtjWQCOa1YLmaz+IU4dUqkLONAgctFOdxQGHrern/IsmpRIfQp
	 s+Q+XIKMq38mUJPAHzQ+0SiCoBs37oWlMjjR48ptATGyHJ0eMCRA8T3A6E0PzC5IKf
	 NkbsY99bxt3Sw==
Date: Thu, 19 Feb 2026 12:17:40 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	andersson@kernel.org, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: ice: Remove platform_driver support and
 expose as a pure library
Message-ID: <i55xjnbuortawc32flfxa6lihk3l2oqdccdmctngvyq4iw62wt@s4kuycrczgyx>
References: <20260203080712.15480-1-manivannan.sadhasivam@oss.qualcomm.com>
 <spejairpdsb5sa3jwuogkl3edkglqoxa4eqz6zriq5w53ic4a6@4gyymeidqy5d>
 <14de409a-d6b4-7c17-d04c-7d26f16469e5@oss.qualcomm.com>
 <dinx3z2aumwfoipcijxsequulmb7sxaeti5eo5wjug4fjssxbz@v3azphuen74m>
 <ae80421d-2a45-bce9-d05f-b135c26216b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae80421d-2a45-bce9-d05f-b135c26216b2@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-93335-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3202415C794
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 11:27:07AM +0530, Neeraj Soni wrote:
> 
> 
> On 2/18/2026 7:11 PM, Manivannan Sadhasivam wrote:
> > On Tue, Feb 17, 2026 at 10:03:27AM +0530, Neeraj Soni wrote:
> >>
> >>
> >> On 2/3/2026 1:40 PM, Manivannan Sadhasivam wrote:
> >>> On Tue, Feb 03, 2026 at 01:37:12PM +0530, Manivannan Sadhasivam wrote:
> >>>> The current platform driver design causes probe ordering races with clients
> >>>> (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE probe
> >>>> fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops with
> >>>> -EPROBE_DEFER, leaving clients non-functional even when ICE should be
> >>>> gracefully disabled. devm_of_qcom_ice_get() cannot know if the ICE driver
> >>>> probe has failed due to above reasons or it is waiting for the SCM driver.
> >>>>
> >>>> Moreover, there is no devlink dependency between ICE and client drivers
> >>>> as 'qcom,ice' is not considered as a DT 'supplier'. So the client drivers
> >>>> have no idea of when the ICE driver is going to probe.
> >>>>
> >>>> To avoid all this hassle, remove the platform driver support altogether and
> >>>> just expose the ICE driver as a pure library to client drivers. With this
> >>>> design, when devm_of_qcom_ice_get() is called, it will check if the ICE
> >>>> instance is available or not. If not, it will create one based on the ICE
> >>>> DT node, increase the refcount and return the handle. When the next client
> >>>> calls the API again, the ICE instance would be available. So this function
> >>>> will just increment the refcount and return the instance.
> >>>>
> >>>> Finally, when the client devices get destroyed, refcount will be
> >>>> decremented and finally the cleanup will happen once all clients are
> >>>> destroyed.
> >>>>
> >>>> For the clients using the old DT binding of providing the separate 'ice'
> >>>> register range in their node, this change has no impact.
> >>>>
> >>>> Cc: stable@vger.kernel.org
> >>>> Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>> Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>>> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> >>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/soc/qcom/ice.c | 100 ++++++++++++++++-------------------------
> >>>>  1 file changed, 39 insertions(+), 61 deletions(-)
> >>>>
> >>>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> >>>> index b203bc685cad..b5a9cf8de6e4 100644
> >>>> --- a/drivers/soc/qcom/ice.c
> >>>> +++ b/drivers/soc/qcom/ice.c
> >>>> @@ -107,12 +107,16 @@ struct qcom_ice {
> >>>>  	struct device *dev;
> >>>>  	void __iomem *base;
> >>>>  
> >>>> +	struct kref refcount;
> >>>>  	struct clk *core_clk;
> >>>>  	bool use_hwkm;
> >>>>  	bool hwkm_init_complete;
> >>>>  	u8 hwkm_version;
> >>>>  };
> >>>>  
> >>>> +static DEFINE_MUTEX(ice_mutex);
> >>>> +struct qcom_ice *ice_handle;
> >>>> +
> >>>>  static bool qcom_ice_check_supported(struct qcom_ice *ice)
> >>>>  {
> >>>>  	u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
> >>>> @@ -599,8 +603,8 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >>>>   * This function will provide an ICE instance either by creating one for the
> >>>>   * consumer device if its DT node provides the 'ice' reg range and the 'ice'
> >>>>   * clock (for legacy DT style). On the other hand, if consumer provides a
> >>>> - * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
> >>>> - * be created and so this function will return that instead.
> >>>> + * phandle via 'qcom,ice' property to an ICE DT node, then the ICE instance will
> >>>> + * be created if not already done and will be returned.
> >>>>   *
> >>>>   * Return: ICE pointer on success, NULL if there is no ICE data provided by the
> >>>>   * consumer or ERR_PTR() on error.
> >>>> @@ -611,11 +615,12 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >>>>  	struct qcom_ice *ice;
> >>>>  	struct resource *res;
> >>>>  	void __iomem *base;
> >>>> -	struct device_link *link;
> >>>>  
> >>>>  	if (!dev || !dev->of_node)
> >>>>  		return ERR_PTR(-ENODEV);
> >>>>  
> >>>> +	guard(mutex)(&ice_mutex);
> >>>> +
> >>>>  	/*
> >>>>  	 * In order to support legacy style devicetree bindings, we need
> >>>>  	 * to create the ICE instance using the consumer device and the reg
> >>>> @@ -631,6 +636,16 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >>>>  		return qcom_ice_create(&pdev->dev, base);
> >>>>  	}
> >>>>  
> >>>> +	/*
> >>>> +	 * If the ICE node has been initialized already, just increase the
> >>>> +	 * refcount and return the handle.
> >>>> +	 */
> >>>> +	if (ice_handle) {
> >>>> +		kref_get(&ice_handle->refcount);
> >>>> +
> >>>> +		return ice_handle;
> >>
> >> How will this work for a device using both UFS and eMMC storage (one being primary storage
> >> and other being secondary)? UFS and eMMC will have seperate ICE DT node so returning same
> >> handle to both clients will not be correct.
> >>
> > 
> > I'm not aware of any platforms using separate ICE nodes. All are using shared
> > node only. Which platform are you referring to?
> 
> Example talos uses both UFS and eMMC:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/talos.dtsi#n699
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/talos.dtsi#n1398
> 

These are not using *separate* ICE DT nodes, but just have their own ICE MMIO
regions. This is already handled in this patch which parses the ICE region first
if available.

> For few more targets where eMMC is used along with UFS, the patches to add ICE handle for eMMC is in flight with this patch:
> https://lore.kernel.org/all/20260217052526.2335759-1-neeraj.soni@oss.qualcomm.com/
> 

So this adds a new ICE node, but just for eMMC. Are you saying that there will
be ufs_crypto node as well?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

