Return-Path: <linux-arm-msm+bounces-111993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ay4EDWd7J2pvyAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 04:33:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C06D665BDC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 04:33:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="F/w5++Du";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111993-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111993-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A946301643E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 02:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF5630CDB6;
	Tue,  9 Jun 2026 02:33:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4D0233942;
	Tue,  9 Jun 2026 02:33:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780972386; cv=none; b=mhkFypnoKlwbiq7gflrcfBxZwmrJLCzUOSV79wDyATXse4T3/3+QXF3kyDR4O2KTRj2HScB9V63jM5M4yKqBzRlHFcAlDFI56afYH1D+kys/dcBxy2bvfcPPw2XPSOPCJDTAOBW6mCo0/GyQbamwN2ASyvjiJQAHRRaT0WJlgsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780972386; c=relaxed/simple;
	bh=VEVhjuAxx0lE5TrJAfzggkZGPv96OZWRnPsClvKS28E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEHs2JoSDOFUiETnWgZ7JHkMO5bxPRtvbllEpw9eRLOh3pIqr5d33Zz6eGmAG6ELcJow9xigonuSpwLK+903WkJQY+qmbnvaWvj3UsFthopd6up2I0vhXanCR6ZX6b8E6jhX19KI5UVmCWa6w5jWVolej7pGzJB7SIc3qRSQxRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/w5++Du; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F701F00893;
	Tue,  9 Jun 2026 02:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780972385;
	bh=ySf90SoK/xpVvcIjk9r/laYSraE3mRxguDgAhimCiLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F/w5++DuTntLDVMTpU2d07x5fPv2M6QXWR7S4B2Now5s84ESWhejQlkTeTGDtdApX
	 rS2qmXxscuVSSF8c0nSxWO9jr15PIRI8WnQq9B4RY4ifaD6diwj8ivEbYAzXsXwdmN
	 t4rReT6P8OOd3lUa5YVLazqU/FzIAdr9vdsn/LSn3R5UqVWHpb/TUBZ953c5ZMhNvc
	 sRZWXk6eoWy2lFBtaRJk2sU8IXgLpmFxglIc8aU8J1R/CciZLUdkaFQ2cRyM1Yw1lq
	 hVXZXpApkLztfYabsnUqJurMdGXIvqHdIxONZJKDnFACq+hbYmtjyaIYRFzgUwndUv
	 l/LdRJD94ZJeQ==
Date: Mon, 8 Jun 2026 21:33:01 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <aid5y4dd62fHi63l@baldur>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <20260520082747.7seyyua4gfv256ev@hu-mojha-hyd.qualcomm.com>
 <e67907bc-ce96-4654-b210-2ae8f35cacc7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e67907bc-ce96-4654-b210-2ae8f35cacc7@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111993-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:konradybcio@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gokul.krishnakumar@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C06D665BDC7

On Thu, May 21, 2026 at 11:42:49AM +0800, Jingyi Wang wrote:
> 
> 
> On 5/20/2026 4:27 PM, Mukesh Ojha wrote:
> > On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> > > Subsystems can be brought out of reset by entities such as bootloaders.
> > > As the irq enablement could be later than subsystem bring up, the state
> > > of subsystem should be checked by reading SMP2P bits.
> > > 
> > > A new qcom_pas_attach() function is introduced. if a crash state is
> > > detected for the subsystem, rproc_report_crash() is called. If the ready
> > > state is detected, it will be marked as "attached", otherwise it could
> > > be the early boot feature is not supported by other entities. In this
> > > case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> > > can load the firmware and start the remoteproc.
> > > 
> > > Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > > Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > ---
> > >   drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 58 insertions(+)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > index da27d1d3c9da..ac2a00aacd2e 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > @@ -60,6 +60,7 @@ struct qcom_pas_data {
> > >   	int region_assign_count;
> > >   	bool region_assign_shared;
> > >   	int region_assign_vmid;
> > > +	bool early_boot;
> > >   };
> > >   struct qcom_pas {
> > > @@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
> > >   	return qcom_q6v5_panic(&pas->q6v5);
> > >   }
> > > +static int qcom_pas_attach(struct rproc *rproc)
> > > +{
> > > +	int ret;
> > > +	struct qcom_pas *pas = rproc->priv;
> > > +	bool ready_state;
> > > +	bool crash_state;
> > > +
> > > +	pas->q6v5.handover_issued = true;
> > > +	enable_irq(pas->q6v5.handover_irq);
> > > +
> > > +	pas->q6v5.running = true;
> > > +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> > > +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> > > +
> > > +	if (ret)
> > > +		goto disable_running;
> > > +
> > > +	if (crash_state) {
> > > +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> > > +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> > 
> > I am not sure if this is already discussed, but what if it is the first
> > crash with recovery and coredump enabled? What would be in the dump,
> > nothing? As there is no segment, is it expected since Linux did not load
> > this?
> > 
> > This is even true if it is a crash after a successful attach.
> > 
> 
> It is suggested by Bjorn:
> https://lore.kernel.org/all/qfls6xlvfppqw7p6rjpmzqesh6sbob4myfc6dz47qh3jywqrjk@5xiutkbybk5d/
> 

I requested that we try to recover the subsystem if we determine that is
has crashed, but Mukesh is talking about the fact that we don't have the
ELF header for that image to there are no segments loaded to perform the
coredump against.

I'm not aware of a discussion related to this...

> I did a hack to test the recovery by setting crash_state true, it can recovery
> (stop and start) successfully with below patches:
> https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/
> 
> For coredump, it will return from the first "list_empty(&rproc->dump_segments)" check in
> rproc_coredump as segments are not configured in attach.
> 

This is what Mukesh is asking about.

Regards,
Bjorn

> Thanks,
> Jingyi
> 
> 
> > @Sibi, has this series been tested on Glymur with KVM?
> > I don't see the iommu property in the below patch.
> > https://lore.kernel.org/lkml/20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com/
> > 
> 

