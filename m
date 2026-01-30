Return-Path: <linux-arm-msm+bounces-91259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBFYBlx/fGk8NgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:52:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C729B9129
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C514E3003828
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 09:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C317732E733;
	Fri, 30 Jan 2026 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gp/AG6+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09E22D9EC2;
	Fri, 30 Jan 2026 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769766742; cv=none; b=b8k43fH4mfhyFXIxAmItaeAEhhBS1suvoHBbnhn1FKoalrECxW3MWhdmf55AQyC/GtBgUEXo/3P8tJ5EL2kUfH+I4KLgMb0/OP5RVgn6jhEgnweCoZdDbd1Ax13bdePSHV5vO74QptlGTsXDbwN5TQT50wnzU+ZsPctcgtc4NM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769766742; c=relaxed/simple;
	bh=wvHeKQFimn/BDIsBmfAIthkdHvqv4dzGB9E2A0rGal4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnWDqNxY+zN0PYyHIiGi4I5IMfTFFwUtUtAOrfm3EGr2JDquvzNDNDipIOZBTQiY2Y0QS8GWrMjqqsBgtEd48WNVWVi2KPdZTAMQJvVZSfg9PCUYTSBmrzHUsp4uTExe08uo1XC6xmpOAQ0z7EIpraQSa10kD3+T4n6qxcckM5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gp/AG6+e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710ECC4CEF7;
	Fri, 30 Jan 2026 09:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769766742;
	bh=wvHeKQFimn/BDIsBmfAIthkdHvqv4dzGB9E2A0rGal4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gp/AG6+ernD9j2Jussl1JiURaJm/wAgEhdwha562qZx6wdvR1gOeGlmY29T9RA+Zz
	 CO5wkDnQKRN0gCMyRZmyJzJl2ThxCfGx20eOcNM95G2RKGEYnsiXBISDZGe8Y5dWf9
	 VEMSGKa7j+qjTi6mcJ6isfVbfGKrDjW/gTwBBqDLot3r++ReeyuxiFa74RvdYrMG0O
	 Ba+DGIal71qdTWRwTqL0bydGCnGZMwpCrcMLqkHGEQfqKbT7QFs6qYregmdQ97HVz1
	 NyPHi7nCOQdFrcNxobkuv8F+oYIlmeeF5x2UlYxdj2jt8FDZ3hKOKJdKOHxl6w/CGc
	 JkXDtOTsVRH6A==
Date: Fri, 30 Jan 2026 15:22:16 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, abelvesa@kernel.org, mani@kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: ice: Avoid probe deferring for un-supported
 ICE feature
Message-ID: <aXx_UDTkdYHY04FR@sumit-xelite>
References: <20260130091118.147379-1-sumit.garg@kernel.org>
 <4ad700f3-da8f-4175-9172-3fc4d87d8152@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ad700f3-da8f-4175-9172-3fc4d87d8152@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-91259-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 3C729B9129
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 10:34:26AM +0100, Konrad Dybcio wrote:
> On 1/30/26 10:11 AM, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > ICE related SCM calls may not be supported in every TZ environment like
> > OP-TEE or a no-TZ environment too. So let's try to avoid probe deferring
> > when it's known that ICE feature isn't supported.
> > 
> > This problem only came to notice after the inline encryption drivers were
> > enabled in the arm64 defconfig by: commit 5f37788adedd ("arm64: defconfig:
> > Enable SCSI UFS Crypto and Block Inline encryption drivers").
> > 
> > Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/ice.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index b203bc685cad..ab9586b8caf5 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -652,7 +652,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >  		dev_err(dev, "Cannot get ice instance from %s\n",
> >  			dev_name(&pdev->dev));
> >  		platform_device_put(pdev);
> > -		return ERR_PTR(-EPROBE_DEFER);
> > +		return NULL;
> 
> Wouldn't this wreck the "actually need to defer" case, i.e.
> 
> 
> qcom,ufs probes first
>   calls devm_of_qcom_ice_get()
>     "ice" reg is missing, non-legacy case
>       qcom,ice is absent (not yet probed)
>         return NULL
> 
> ...
> 
> qcom,ice probes
> 
> ?

Since qcom,ufs depends on qcom,ice via a phandle, so isn't the probe
orderering automatically taken care off? Or that isn't the case here?

-Sumit

