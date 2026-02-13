Return-Path: <linux-arm-msm+bounces-92737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CkvBc+JjmmVCwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 03:17:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A87132613
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 03:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D16A83042762
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 02:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351C519539F;
	Fri, 13 Feb 2026 02:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONdoe+fa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E24A17D2;
	Fri, 13 Feb 2026 02:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770949067; cv=none; b=npzvhoKo8OaotNLMmnNDVtLTqRNRKAOjq2xljW6WfUCTNzXccZEjkwdnfzIqqO4/hqfJdEJw32wvsvYsYxZcDQnjVRCjsKW4SkvyXZQGRCOd8YLmzLFxukkzMpwKuYbTiQmvCtQh5R6tI1Hg8fpMdKzVAmO/lo/zv4vRPK0Quf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770949067; c=relaxed/simple;
	bh=jcn/tgnFKkNrRO9Qp2BKNUBc3hhBvbOk0me8Jij/eW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mF2bMDwy03HAW1pcS2WTBVOadt8t2ikmV/lahtPkQyMVmATmH6yDOaF3ulcXCKGcRc2RiDS78amDpp45rpHw/9t2dIPS7WVHfI7SfNECKZzj2GDqn1l7TEfvTJzX8LaXgHenOmHw1cgs85Qa5vpVpwwog+L4+WlQwBLgANPcxz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONdoe+fa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2CAFC4CEF7;
	Fri, 13 Feb 2026 02:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770949066;
	bh=jcn/tgnFKkNrRO9Qp2BKNUBc3hhBvbOk0me8Jij/eW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ONdoe+faYA8iPCOxVbp+REhPAA5BwqK6pOII8ZPfhf4OBkKsmqS1wUi1OEoxpvED9
	 Ke81p4BTYJL9qG50tNSahM8SwWdsfPG9J6cEm2Fy3NDkwus979NlohLEA5SyK4SryA
	 EN51/E+ZNCOd9dIbmfaRdvAm4eqvJpwvvsdsxgi3MPJhubo7Yb3XU6LZdUexUJ5xzt
	 slzzwa8qfDGiwi1hhEbW4guaH9v20Nks0gGyy7r84aJBu5sx4vfKkdxnnT9Ve4kVba
	 epIZB0YHrgVdUufiYJHyyKeb79zbzqBaucfFCADlo/jEraouW7RxOgPVEt6Wdipu9K
	 DS///vG42hm/Q==
Date: Fri, 13 Feb 2026 07:47:37 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, stable@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] soc: qcom: ice: Remove platform_driver support
 and expose as a pure library
Message-ID: <gsm6l7b3sjrddyiaykhiai2pthvpuo4vilp6houmhgkgnfu4af@lodndyakg7bj>
References: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
 <20260210-qcom-ice-fix-v2-1-9c1ab5d6502c@oss.qualcomm.com>
 <20260213010253.GA6208@quark>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260213010253.GA6208@quark>
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
	TAGGED_FROM(0.00)[bounces-92737-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87A87132613
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 05:02:53PM -0800, Eric Biggers wrote:
> On Tue, Feb 10, 2026 at 12:26:50PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> >  drivers/soc/qcom/ice.c | 118 ++++++++++++++++++-------------------------------
> >  1 file changed, 44 insertions(+), 74 deletions(-)
> 
> I don't yet know enough to be confident that this is the correct fix,
> but there are a few things I noticed that look like bugs:
> 
> > +static DEFINE_MUTEX(ice_mutex);
> > +struct qcom_ice *ice_handle;
> 
> ice_handle is used only in this file, so it should be static
> 
> > @@ -643,41 +645,42 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> [...]
> > +	ice = qcom_ice_create(&pdev->dev, base);
> > +	if (IS_ERR(ice)) {
> >  		platform_device_put(pdev);
> > -		ice = ERR_PTR(-EINVAL);
> > +		return ice_handle;
> >  	}
> 
> This error path returns NULL, where this patch seems to have been
> intended to remove NULL as a possible return value.
> 

Oops... I should return 'ice' here, not 'ice_handle'.

> > -static void qcom_ice_put(const struct qcom_ice *ice)
> > +static void qcom_ice_put(struct kref *kref)
> >  {
> > -	struct platform_device *pdev = to_platform_device(ice->dev);
> > -
> > -	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
> > -		platform_device_put(pdev);
> > +	platform_device_put(to_platform_device(ice_handle->dev));
> > +	ice_handle = NULL;
> >  }
> 
> Elsewhere ice_handle is protected by ice_mutex, but this seems to modify
> it without holding the mutex.
> 

I'll add it.

> I'm also wondering what happens if all consumer devices are removed.
> platform_device_put() gets executed on the ICE platform_device for each
> one, but does that actually drop the last reference and cause the
> resources allocated with devm_*() to be freed?  On do they stick around
> until/unless the ICE device is actually removed as well?
> 

No, they'll stick around because the platform device itself won't be removed.
of_qcom_ice_get() increments the refcount due to of_find_device_by_node() and we
keep the refcount as we expect the platform device to be available until all the
consumers call devm_of_qcom_ice_put(). Then we'll finally drop our own refcount.

But I get your concern that we are not freeing the ioremap.

> >  static void devm_of_qcom_ice_put(struct device *dev, void *res)
> >  {
> > -	qcom_ice_put(*(struct qcom_ice **)res);
> > +	const struct qcom_ice *ice = *(struct qcom_ice **)res;
> > +	struct platform_device *pdev = to_platform_device(ice->dev);
> > +
> > +	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
> > +		kref_put(&ice_handle->refcount, qcom_ice_put);
> >  }
> 
> Above probably should use the ice local variable, not ice_handle.
> 

Ack.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

