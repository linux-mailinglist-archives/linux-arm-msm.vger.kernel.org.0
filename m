Return-Path: <linux-arm-msm+bounces-91480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGhqAjGEgGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:02:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFD4CB671
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2D393043D06
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224A9359703;
	Mon,  2 Feb 2026 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0OUSvti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B7B333438;
	Mon,  2 Feb 2026 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029708; cv=none; b=FB6+en37IIVWF7JypkBTJUo6iYIPytruTfqwB3xguXgRuzH2w/QUMu7VCkJqhCo69v0BrnmKXSD55V2BOMoiq5SottGIqA4EK59AKloDDkfKMhQA2C/8wfUc8kaS5cGT/2jrPmJlvglEc55rkaVDgA/dO+DJQycOQdirOsB/EHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029708; c=relaxed/simple;
	bh=TcNcAWNMzvVTOymWNovQ4GgOFhl7MElbIQNg87yK16o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDT12pwJwkgiQPOh/nQxFvExvZ5Fq73bEuqCQnkihGA+0NRcpvm284zPRuiE0W87kzCG2YYatJ7GOO7UaW19ZNIr/b7K9O3vJb27E/XkE/bZ6LbA6GIR3qQv/ZUT4v50EomBd1MeNf8hIU8AVAa0YlQGlMfjkBwVSNBi+sB248c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0OUSvti; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84A5C116D0;
	Mon,  2 Feb 2026 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770029707;
	bh=TcNcAWNMzvVTOymWNovQ4GgOFhl7MElbIQNg87yK16o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0OUSvtiL/dAbe/XEnR8gt9C23nIb8Jl/UgKiTUf8W4WI3JhEc+MDAMfH6gzZPY8y
	 yaY3dBfQFQjWH73QUJzYC3E2K9ZZL5cHNhh2vixJbOfqpWM3SdxFwOKHe+XSLPYUKo
	 IPK/rpIrKN36LiDgvwWu+ILIQ1EBIZnDtXtB8s6WejENI0lJgySv5TUjYkFKT14DIj
	 p/9Pdf39614p7UPU2p34BhZ+D9EB30dfTxzr95nJ/rfpP9DcCNRCsK1T2br6bhJIdB
	 FIMuFGNZbjhGvFRZVoJiI6BnKuUVqcTE/9VcF6BpyrWE7LVI+EG8zcAIxXm+fbT2uC
	 EtJA6DMrudWMw==
Date: Mon, 2 Feb 2026 16:25:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	abelvesa@kernel.org, linux-kernel@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: ice: Avoid probe deferring for un-supported
 ICE feature
Message-ID: <ptm2hbyboiqu3e5al5am4vugjyeexoizu5zr6buyw5uzi5wsur@yrns7zmwppqh>
References: <20260130091118.147379-1-sumit.garg@kernel.org>
 <4ad700f3-da8f-4175-9172-3fc4d87d8152@oss.qualcomm.com>
 <aXx_UDTkdYHY04FR@sumit-xelite>
 <4f629971-94cb-44aa-9502-4f5ebfd63937@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f629971-94cb-44aa-9502-4f5ebfd63937@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91480-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5FFD4CB671
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 10:59:18AM +0100, Konrad Dybcio wrote:
> On 1/30/26 10:52 AM, Sumit Garg wrote:
> > On Fri, Jan 30, 2026 at 10:34:26AM +0100, Konrad Dybcio wrote:
> >> On 1/30/26 10:11 AM, Sumit Garg wrote:
> >>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>>
> >>> ICE related SCM calls may not be supported in every TZ environment like
> >>> OP-TEE or a no-TZ environment too. So let's try to avoid probe deferring
> >>> when it's known that ICE feature isn't supported.
> >>>
> >>> This problem only came to notice after the inline encryption drivers were
> >>> enabled in the arm64 defconfig by: commit 5f37788adedd ("arm64: defconfig:
> >>> Enable SCSI UFS Crypto and Block Inline encryption drivers").
> >>>
> >>> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> >>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>> ---
> >>>  drivers/soc/qcom/ice.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> >>> index b203bc685cad..ab9586b8caf5 100644
> >>> --- a/drivers/soc/qcom/ice.c
> >>> +++ b/drivers/soc/qcom/ice.c
> >>> @@ -652,7 +652,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >>>  		dev_err(dev, "Cannot get ice instance from %s\n",
> >>>  			dev_name(&pdev->dev));
> >>>  		platform_device_put(pdev);
> >>> -		return ERR_PTR(-EPROBE_DEFER);
> >>> +		return NULL;
> >>
> >> Wouldn't this wreck the "actually need to defer" case, i.e.
> >>
> >>
> >> qcom,ufs probes first
> >>   calls devm_of_qcom_ice_get()
> >>     "ice" reg is missing, non-legacy case
> >>       qcom,ice is absent (not yet probed)
> >>         return NULL
> >>
> >> ...
> >>
> >> qcom,ice probes
> >>
> >> ?
> > 
> > Since qcom,ufs depends on qcom,ice via a phandle, so isn't the probe
> > orderering automatically taken care off? Or that isn't the case here?
> 
> No, that's guaranteed by devlink only with certain properties.
> 
> In this case though, I think it could make sense to add it to the
> "suppliers" list in drivers/of/property.c.
> 
> I don't know if vendors adding their custom properties there is a
> pattern that +Rob will be happy about though..
> 

Yeah. I initially considered adding 'qcom,ice' as a supplier, but was not sure
of its reception. So decided not to pursue this path.

I think there is no point in exposing the ICE driver as a platform driver and
allow it to race against the of_qcom_ice_get() API.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

