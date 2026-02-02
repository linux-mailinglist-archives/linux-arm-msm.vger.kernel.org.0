Return-Path: <linux-arm-msm+bounces-91481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP38DkiEgGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:02:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC391CB68E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 697B1300DF45
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59EA333438;
	Mon,  2 Feb 2026 10:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5CQcJqu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23992BE7C0;
	Mon,  2 Feb 2026 10:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029763; cv=none; b=Ba29CppMc2Miqp/LY0OHAVIFt08VBpq9y9Dcw7a6/09FMCx7WUlSCC4WuER4xnQfmFlWHV/B4eMxXAaYNkZGwGD/PlYAQBxpTW+rFwauG6eRhIbIZrDBonvO4Frmr+aF+75fQ4HvWzIRNrtk9vjngOt3bWyZRPktkBZrAPUwLKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029763; c=relaxed/simple;
	bh=sfz1GPbSIkmGsv1GF4V21EtKLcv6b75js8+tuOQz3Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Phgc/bHhBM709whZhR6WSgZjk0qg4YfBwX6vSpuEjtryzJogooB+ZVy+LJ2LTdLQuQlxshEsm33UmXzzWiAQWQd9qwqdC6UFxzbfO3KyrwzOBNobHSI41fw1wsC47mSPONbE/9ErJIDXdkae6+EXn7+HVHSNl1lL3NmO0jTHh5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5CQcJqu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53360C116C6;
	Mon,  2 Feb 2026 10:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770029763;
	bh=sfz1GPbSIkmGsv1GF4V21EtKLcv6b75js8+tuOQz3Ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5CQcJquPXmmhnUXjk8m4D3MjnK4R8F6pGxZFvSV98m4b6xrZScStnw8wH/wc32xr
	 /ZGahz6BuXd5ULnMTo/Mz8SAVOI7u3VZaBcEx91cDYrrGB70AMrxZiqUUs7AYYv5ou
	 LIeORugcXI7F91U0pQRG8YqApd7YYInsyhZFzOUs8e6JxqaaIvcXEW1XW+IakM8cHe
	 3uAqctLtteAvaI0pj65Leao+utdt/xMs7vfAvHWZvnNhI2MOSyaJcZX8wIWtmf/fhs
	 378d6WTAAhhV7sk03XiQQxciGO/vq4EumktAK/ZZim0s61E/Qs9sWAIYA6bcTPiRu1
	 JX2McTA0rpbDA==
Date: Mon, 2 Feb 2026 16:25:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, andersson@kernel.org, konradybcio@kernel.org, robh+dt@kernel.org, 
	abelvesa@kernel.org, linux-kernel@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v2] soc: qcom: ice: Stop probe deferring once ICE isn't
 detected
Message-ID: <frq54ya6nounvn3rmqklbkrhobds3dznpaxkcnlmcjr7gtbkgu@qi5xyb4o4sno>
References: <20260202082534.121042-1-sumit.garg@kernel.org>
 <eec7aa76-bdef-4c61-8138-1cf111378afb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eec7aa76-bdef-4c61-8138-1cf111378afb@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-91481-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AC391CB68E
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 11:51:51AM +0100, Konrad Dybcio wrote:
> On 2/2/26 9:25 AM, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > ICE related SCM calls may not be supported in every TZ environment like
> > OP-TEE or a no-TZ environment too. So let's try to stop probe deferring
> > when it's known that ICE feature isn't supported.
> > 
> > This problem only came to notice after the inline encryption drivers were
> > enabled in the arm64 defconfig by: commit 5f37788adedd ("arm64: defconfig:
> > Enable SCSI UFS Crypto and Block Inline encryption drivers").
> > 
> > Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> > 
> > Changes in v2:
> > - Keep the probe deferring intact but stop it once it's know ICE SCM
> >   calls aren't supported by the TZ firmware.
> > 
> >  drivers/soc/qcom/ice.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index b203bc685cad..5a630c9010ee 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -559,7 +559,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >  
> >  	if (!qcom_scm_ice_available()) {
> >  		dev_warn(dev, "ICE SCM interface not found\n");
> > -		return NULL;
> > +		return ERR_PTR(-EOPNOTSUPP);
> >  	}
> >  
> >  	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
> > @@ -648,11 +648,14 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >  	}
> >  
> >  	ice = platform_get_drvdata(pdev);
> > -	if (!ice) {
> > +	if (IS_ERR_OR_NULL(ice)) {
> >  		dev_err(dev, "Cannot get ice instance from %s\n",
> >  			dev_name(&pdev->dev));
> >  		platform_device_put(pdev);
> > -		return ERR_PTR(-EPROBE_DEFER);
> > +		if (PTR_ERR(ice) == -EOPNOTSUPP)
> > +			return NULL;
> 
> The consumer drivers check specifically for -EOPNOTSUPP, let's
> just return that
> 
> > +		else
> > +			return ERR_PTR(-EPROBE_DEFER);
> >  	}
> >  
> >  	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
> > @@ -726,7 +729,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	engine = qcom_ice_create(&pdev->dev, base);
> > -	if (IS_ERR(engine))
> > +	if (IS_ERR(engine) && PTR_ERR(engine) != -EOPNOTSUPP)
> >  		return PTR_ERR(engine);
> 
> This essentially says "probe succeeded, device not operational",
> I have mixed feelings.. That said I'm not sure about the lifecycle
> of a platform_device, i.e. can we set the drvdata and return an error
> in .probe anyway?
> 

No. Let's remove the probe() altogether and expose this driver as a pure
library.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

