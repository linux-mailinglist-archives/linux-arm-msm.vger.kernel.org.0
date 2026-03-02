Return-Path: <linux-arm-msm+bounces-94930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GBrBLOLpWmoDgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:08:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 113C21D97C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A77BB301CC7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8D23D5232;
	Mon,  2 Mar 2026 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P34GWGZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A4836EA97;
	Mon,  2 Mar 2026 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772456566; cv=none; b=riKIwqc0D84/cgpoYA+yN7mjWXXOp3OXtVm+g0Krj88b/vmylp7x6qojs85pD6+q+py228g/uct16cpVJF83Ja0zMNE1Y3vpytvYrbruFWgT4CJbxh9xCEDA4v4Tlh8xCIfCT6oMg8ByFMCdWwaxq4AqqTKsB1zfrSQnKzHgNxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772456566; c=relaxed/simple;
	bh=tvQbPWh9zBD8AmK6ovLnwO1ZZ2dYVs2CTC8gfkbuoP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVg3sXUCYTDdUBZFTUiENq1zT24tDZ0KBbvH4NIB8b6InRpq92Z+g0zx18uUturhsMvaxesxqEVHNMab2mTkIC9b3dbHIeHHqoOcOLEwc5paXXAI9fB63nobdX/05rzXJNfi9tWaKAiMATallyB+R6uGChuIt/i2D4ej84eOdbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P34GWGZM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D56C19423;
	Mon,  2 Mar 2026 13:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772456565;
	bh=tvQbPWh9zBD8AmK6ovLnwO1ZZ2dYVs2CTC8gfkbuoP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P34GWGZM5JlkPygmke9K4O46YU16DBi5pIlrUBDSoNn9iYWsoXGx4j1sd2SlgAgUg
	 mwPIxF1Wid7RIVJRJOQaB11Mk4kDdM72uJjMT8hE1OYVoMLcK7odUEGQ6XKGnRul8r
	 BPLCJHUvqsBJ4yqaFbH/RBc5VolCEwETirMLf+zde2PQKa3MLQP65BkBFfmEZAFGoM
	 ubNcTq0O1BXzC7PqJtZupuLWTqgsTi/ol9n3f+Bk9YXpJ/Aydkd0FOmteLNSwekWQC
	 dzHGbN8DCgHkPgpShpHUeQD2eLrtU52GLTvHSmRocO3Wv5SLOpW7Maj2QX0pdcOiQH
	 WQiSyS3tSMfzw==
Date: Mon, 2 Mar 2026 18:32:31 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/4] soc: qcom: ice: Fix race between qcom_ice_probe()
 and of_qcom_ice_get()
Message-ID: <tbmsoi5the4y2gbocwbqecictrbrpwxx4grugaimc24bu5oacu@4yucsbmyhv5d>
References: <20260223-qcom-ice-fix-v3-0-6ca5846329f7@oss.qualcomm.com>
 <20260223-qcom-ice-fix-v3-1-6ca5846329f7@oss.qualcomm.com>
 <5e9a399a-074b-4b41-2e10-f2ed654eafcf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e9a399a-074b-4b41-2e10-f2ed654eafcf@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94930-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 113C21D97C0
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 03:41:54PM +0530, Neeraj Soni wrote:
> 
> 
> On 2/23/2026 1:32 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > The current platform driver design causes probe ordering races with
> > consumers (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE
> > probe fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops
> > with -EPROBE_DEFER, leaving consumers non-functional even when ICE should
> > be gracefully disabled. devm_of_qcom_ice_get() doesn't know if the ICE
> > driver probe has failed due to above reasons or it is waiting for the SCM
> > driver.
> > 
> > Moreover, there is no devlink dependency between ICE and consumer drivers
> > as 'qcom,ice' is not considered as a DT 'supplier'. So the consumer drivers
> > have no idea of when the ICE driver is going to probe.
> > 
> > To address these issues, introduce a global ice_handle to store the valid
> > ICE handle pointer, and set during successful ICE driver probe. On probe
> > failure, set it to an error pointer and propagate the error from
> > of_qcom_ice_get().
> > 
> > Additionally, add a global ice_mutex to synchronize qcom_ice_probe() and
> > of_qcom_ice_get().
> > 
> > Note that this change only fixes the standalone ICE DT node bindings and
> > not the ones with 'ice' range embedded in the consumer nodes, where there
> > is no issue.
> > 
> > Cc: <stable@vger.kernel.org> # 6.4
> > Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> > Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/ice.c | 44 +++++++++++++++++++++++++++-----------------
> >  1 file changed, 27 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index b203bc685cad..3c3c189e24f9 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -113,6 +113,9 @@ struct qcom_ice {
> >  	u8 hwkm_version;
> >  };
> >  
> > +static DEFINE_MUTEX(ice_mutex);
> > +static struct qcom_ice *ice_handle;
> > +
> >  static bool qcom_ice_check_supported(struct qcom_ice *ice)
> >  {
> >  	u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
> > @@ -608,7 +611,6 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >  static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >  {
> >  	struct platform_device *pdev = to_platform_device(dev);
> > -	struct qcom_ice *ice;
> >  	struct resource *res;
> >  	void __iomem *base;
> >  	struct device_link *link;
> > @@ -631,6 +633,22 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >  		return qcom_ice_create(&pdev->dev, base);
> >  	}
> >  
> > +	guard(mutex)(&ice_mutex);
> > +
> > +	/*
> > +	 * If ice_handle is NULL, then it means the ICE driver is not probed
> > +	 * yet. So return -EPROBE_DEFER to let the client try later.
> > +	 */
> > +	if (!ice_handle)
> > +		return ERR_PTR(-EPROBE_DEFER);
> > +
> > +	/*
> > +	 * If ice_handle has error code, then it means the ICE driver has probe
> > +	 * failed. So return the handle for the client to digest it.
> > +	 */
> > +	if (IS_ERR(ice_handle))
> > +		return ice_handle;
> > +
> >  	/*
> >  	 * If the consumer node does not provider an 'ice' reg range
> >  	 * (legacy DT binding), then it must at least provide a phandle
> > @@ -647,24 +665,16 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >  		return ERR_PTR(-EPROBE_DEFER);
> >  	}
> >  
> > -	ice = platform_get_drvdata(pdev);
> > -	if (!ice) {
> > -		dev_err(dev, "Cannot get ice instance from %s\n",
> > -			dev_name(&pdev->dev));
> > -		platform_device_put(pdev);
> > -		return ERR_PTR(-EPROBE_DEFER);
> > -	}
> > -
> >  	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
> >  	if (!link) {
> >  		dev_err(&pdev->dev,
> >  			"Failed to create device link to consumer %s\n",
> >  			dev_name(dev));
> >  		platform_device_put(pdev);
> > -		ice = ERR_PTR(-EINVAL);
> > +		return ERR_PTR(-EINVAL);
> >  	}
> >  
> > -	return ice;
> > +	return ice_handle;
> >  }
> >  
> >  static void qcom_ice_put(const struct qcom_ice *ice)
> > @@ -716,20 +726,20 @@ EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
> >  
> >  static int qcom_ice_probe(struct platform_device *pdev)
> >  {
> > -	struct qcom_ice *engine;
> >  	void __iomem *base;
> >  
> > +	guard(mutex)(&ice_mutex);
> > +
> >  	base = devm_platform_ioremap_resource(pdev, 0);
> >  	if (IS_ERR(base)) {
> >  		dev_warn(&pdev->dev, "ICE registers not found\n");
> > +		ice_handle = base;
> >  		return PTR_ERR(base);
> >  	}
> >  
> > -	engine = qcom_ice_create(&pdev->dev, base);
> > -	if (IS_ERR(engine))
> > -		return PTR_ERR(engine);
> > -
> > -	platform_set_drvdata(pdev, engine);
> 
> This allows the driver to set the data per ICE device instance which allows
> the addition of multiple ICE platform devices. For example this patch:
> https://lore.kernel.org/all/20260217052526.2335759-1-neeraj.soni@oss.qualcomm.com/
> utilizes this capability. I think it doesen't harm to keep this support. 
> Moreover, the issue which your patch intends to address do not need this to be removed.
> 

Hmm, ok. I figured out that if we store the err ptr in drvdata, we can fix the
race and also allow multiple ice instances in a SoC. So sent v4 incorporating
this change.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

