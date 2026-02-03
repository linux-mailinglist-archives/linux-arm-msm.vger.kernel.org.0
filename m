Return-Path: <linux-arm-msm+bounces-91672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLqdHA/qgWkFMAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:29:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7234D9035
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F77B3003EDA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 12:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDF933F8AE;
	Tue,  3 Feb 2026 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qxOmyYkq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089A93346B9;
	Tue,  3 Feb 2026 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770121374; cv=none; b=FP3yA90OSuF8TgFYZaQDN2JFGspzCX/b2goDInCpiwiGpN79tnoQtcdVxUqHNjzi0w6vkugAZs3fDeHeiMVfrCoq2LLtOBikgzoSjrGXAAwMZiONAlxIVvv9Zyqvf2xJ7T7+V6jOkCLFDGvL3KS9TFYgXkY9CbnxoFbaMnaEYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770121374; c=relaxed/simple;
	bh=jA4SOFwwGqS7Y5D8Xh6HPOqx+FyTk1VZmn2wiqaGTlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaMu718S38zfjU29u1kecM29FKdv/Z7VoDGiRbE9RDlMs02wH7+HFCAGjk0sPYQBz5JKEVKTHXDCkf7qJkSkabrjgC1MOzIAPecf2cUzvNg5b1wW2IesFsrpGeplMz8ffr4YEqh/IG6qcLoUuC+LIt7cCce+UfrYvjcLsDinx9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qxOmyYkq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124FEC116D0;
	Tue,  3 Feb 2026 12:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770121373;
	bh=jA4SOFwwGqS7Y5D8Xh6HPOqx+FyTk1VZmn2wiqaGTlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxOmyYkqN3LWubDnyL0JEn6gZOfTqVVdUCqhEu5P2vrgWiOiypkVoVLXMJe45aOih
	 s+m5zyw1C2Kk0u3yAPCSPVbUFePRHynLwJYI95bg+hPKGXzgW+JoA2Gtt7pzQJgZDd
	 KQJZX48zJcjwH17Bzn9Lq/uSvKaZs0oX6toJ7+ccbJQIqth2/olFXYncMuyjvkuDgq
	 juJTRexYyZzjaVFBlYNNPdu0X3bAYQjzS+yMevLvwWeXu79ewvC0/f/SSrAyyEUQhr
	 uBVsFeMr/VOcNzjpgWWKVgHbFfcl/Hx9Vj8qsFfPn7VJytCZ+Y++mnEwnDDdm4WrVq
	 USbrOL8RCOcew==
Date: Tue, 3 Feb 2026 17:52:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, andersson@kernel.org, konradybcio@kernel.org, robh+dt@kernel.org, 
	abelvesa@kernel.org, linux-kernel@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v2] soc: qcom: ice: Stop probe deferring once ICE isn't
 detected
Message-ID: <ype5m4nami3eaebeobylfxi3vfic25tlhqzapscbhavrzalxy3@sjhsa4ye57fk>
References: <20260202082534.121042-1-sumit.garg@kernel.org>
 <eec7aa76-bdef-4c61-8138-1cf111378afb@oss.qualcomm.com>
 <frq54ya6nounvn3rmqklbkrhobds3dznpaxkcnlmcjr7gtbkgu@qi5xyb4o4sno>
 <edc737f7-0148-105c-8121-4be0d758647c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edc737f7-0148-105c-8121-4be0d758647c@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-91672-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7234D9035
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 12:20:56PM +0530, Neeraj Soni wrote:
> 
> 
> On 2/2/2026 4:25 PM, Manivannan Sadhasivam wrote:
> > On Mon, Feb 02, 2026 at 11:51:51AM +0100, Konrad Dybcio wrote:
> >> On 2/2/26 9:25 AM, Sumit Garg wrote:
> >>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>>
> >>> ICE related SCM calls may not be supported in every TZ environment like
> >>> OP-TEE or a no-TZ environment too. So let's try to stop probe deferring
> >>> when it's known that ICE feature isn't supported.
> >>>
> >>> This problem only came to notice after the inline encryption drivers were
> >>> enabled in the arm64 defconfig by: commit 5f37788adedd ("arm64: defconfig:
> >>> Enable SCSI UFS Crypto and Block Inline encryption drivers").
> >>>
> >>> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> >>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>> ---
> >>>
> >>> Changes in v2:
> >>> - Keep the probe deferring intact but stop it once it's know ICE SCM
> >>>   calls aren't supported by the TZ firmware.
> >>>
> >>>  drivers/soc/qcom/ice.c | 11 +++++++----
> >>>  1 file changed, 7 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> >>> index b203bc685cad..5a630c9010ee 100644
> >>> --- a/drivers/soc/qcom/ice.c
> >>> +++ b/drivers/soc/qcom/ice.c
> >>> @@ -559,7 +559,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >>>  
> >>>  	if (!qcom_scm_ice_available()) {
> >>>  		dev_warn(dev, "ICE SCM interface not found\n");
> >>> -		return NULL;
> >>> +		return ERR_PTR(-EOPNOTSUPP);
> >>>  	}
> >>>  
> >>>  	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
> >>> @@ -648,11 +648,14 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >>>  	}
> >>>  
> >>>  	ice = platform_get_drvdata(pdev);
> >>> -	if (!ice) {
> >>> +	if (IS_ERR_OR_NULL(ice)) {
> >>>  		dev_err(dev, "Cannot get ice instance from %s\n",
> >>>  			dev_name(&pdev->dev));
> >>>  		platform_device_put(pdev);
> >>> -		return ERR_PTR(-EPROBE_DEFER);
> >>> +		if (PTR_ERR(ice) == -EOPNOTSUPP)
> >>> +			return NULL;
> >>
> >> The consumer drivers check specifically for -EOPNOTSUPP, let's
> >> just return that
> >>
> >>> +		else
> >>> +			return ERR_PTR(-EPROBE_DEFER);
> >>>  	}
> >>>  
> >>>  	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
> >>> @@ -726,7 +729,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
> >>>  	}
> >>>  
> >>>  	engine = qcom_ice_create(&pdev->dev, base);
> >>> -	if (IS_ERR(engine))
> >>> +	if (IS_ERR(engine) && PTR_ERR(engine) != -EOPNOTSUPP)
> >>>  		return PTR_ERR(engine);
> >>
> >> This essentially says "probe succeeded, device not operational",
> >> I have mixed feelings.. That said I'm not sure about the lifecycle
> >> of a platform_device, i.e. can we set the drvdata and return an error
> >> in .probe anyway?
> >>
> > 
> > No. Let's remove the probe() altogether and expose this driver as a pure
> > library.
> > 
> The ICE driver already acts as a library for legacy DT case where consumer device provides 'ice'
> reg range. It was made dedicated platform driver as ICE is a common IP for UFS and SDCC. See here:
> https://lore.kernel.org/all/20230407105029.2274111-4-abel.vesa@linaro.org/

I know. That's why I said 'pure' library.

> I think it will be better if we resolve the race between probe() and *of_qcom_ice_get().
> 

I don't yet see a need to make it as a platform driver. So I removed it and made
the driver as a pure library:
https://lore.kernel.org/linux-arm-msm/20260203080712.15480-1-manivannan.sadhasivam@oss.qualcomm.com/

- Mani

-- 
மணிவண்ணன் சதாசிவம்

