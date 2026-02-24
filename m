Return-Path: <linux-arm-msm+bounces-93884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIJBNzItnWnENAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:46:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4422F181B8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A5FF30465D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 04:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A541B13C918;
	Tue, 24 Feb 2026 04:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwQhHsdP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8081233EC;
	Tue, 24 Feb 2026 04:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771908393; cv=none; b=UJWGx++ccsmcrvO9rxl6FNiBrezOEpCEmMxZBLFFPaw97I/ovf+a2ReCYo5meF+MLqG7k3smzywlmEZBu4vwmGCgYeFeoBB/CG17Ne+enfTTjDwEeqHjL+KTGtewD4h1X0fBPRMXCpwBkzhVBdRrcQwTlCxte/agd+pofcS5cuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771908393; c=relaxed/simple;
	bh=LxuIlz3HZc/RntD/QzDM0Oh/00bVByZlpuigNwz+R3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFDj1JIioc3d8Fa6Cy+FOJgJqEfD86ke9740KPohhLtkZqzDLjZioMF0oz+WNIEWtgUVYBKZC7D2kqe2BH/dZ8dHtec94unITVXcNxK2XVnswEpKH5ahXoZfdC3f7C2I5YT6kxZ2SWL8MQp9nnXopjL8GmFWzU8qVLvD8ox0C3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwQhHsdP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F45FC116D0;
	Tue, 24 Feb 2026 04:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771908393;
	bh=LxuIlz3HZc/RntD/QzDM0Oh/00bVByZlpuigNwz+R3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwQhHsdP3BJXMWiqNuLzvRrGBmueJ7HrnoW/nLnlModqWiCBQ/Z5t/7UibxamrjzY
	 7sFLmp0HPVQywSarne+hZ6jiYWeFNmLi5USEH9y7D9zAGjBUW+e1Ma1CO7wTTJb39I
	 PDRMGJLwddlbjz8mWEx8vvYPQl1yXPouIBavj+CxItKc6SfTj5XLKqgoOcG++Z7/7k
	 KgPvkYDcdOwnownk+XX+dRLBt3EBIFcd3x9A4JeR7So9PArFDPfDlZZXcodZBKZRgy
	 XnWP6YwKiOBt94f0mEOh8QBbOJfjxJtYRj+pI88ooT+64y/16i2KWrHT95PWQ/03Kb
	 gThV3bg5gGUjw==
Date: Tue, 24 Feb 2026 10:16:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Konrad Dybcio <konradybcio@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/4] soc: qcom: ice: Fix race between qcom_ice_probe()
 and of_qcom_ice_get()
Message-ID: <lrhali5ukotcmxqp4yb2g2jvbrhlanpqc67cpvluex4l63skne@ln3j4xn6qfvx>
References: <20260223-qcom-ice-fix-v3-0-6ca5846329f7@oss.qualcomm.com>
 <20260223-qcom-ice-fix-v3-1-6ca5846329f7@oss.qualcomm.com>
 <h2uhrsjlvovjcj7k2ckpkgrhpuwm6biun4ueq7kyzcm4hqcsjr@y3iiqx2vo6s2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <h2uhrsjlvovjcj7k2ckpkgrhpuwm6biun4ueq7kyzcm4hqcsjr@y3iiqx2vo6s2>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93884-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 4422F181B8A
X-Rspamd-Action: no action

+ Neeraj

On Mon, Feb 23, 2026 at 02:35:04PM -0600, Bjorn Andersson wrote:
> On Mon, Feb 23, 2026 at 01:32:52PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
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
> 
> Did we get confirmation that in the UFS + SDCC case, there's only a
> single ICE instance per SoC?
> 

Right now there is only a single instance per SoC. But Neeraj told me that
upcoming SoCs are going to have multiple instances. But I don't want to spend
too much time on *upcoming* support, but rather fix the current
implementations.

Extending this to multiple instances would just require storing the ice_handle
with node name/address pair in xarray or in some other data structures.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

