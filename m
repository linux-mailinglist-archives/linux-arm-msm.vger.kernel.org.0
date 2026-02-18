Return-Path: <linux-arm-msm+bounces-93282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C4xLZWxlWkHUAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 13:33:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1689B1565C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 13:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8F60300EFAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88EC3161AA;
	Wed, 18 Feb 2026 12:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9dM+KVn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D3E30F7FA;
	Wed, 18 Feb 2026 12:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771418002; cv=none; b=jAWNeRZJO1QdZAjHHEhszSUKJLESJSO123+m40dpC5WbmhmwYSBT8goZHalJV6VMo9eMYFpxINR86EO2qovFlAZP+T4oxOgOxC0WOccFpQhR5SEx0YERKlqWfL2a+ID/3UcPDzpIhYo+Gn3+0kmKy57lNloNv5SxqvghvSSO6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771418002; c=relaxed/simple;
	bh=onXJKG7ABpWysLLjHoB0FgkcOtPQuvl7ThpLtjN1wno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFGkP5/aBSPhBxdU9/iVDCR04iTk6vt/VG5MFvW8HRzPw9rNYHuiGA2NlRfXgdP7YnDfBBYnYZ9brslmVFwj9pgGBfOfhPX9DdJy4pRydCZ3g8/73t72JvraVRYls+vZP40jWMjHCgblvaxFEZIswskavjqpBSAoU6y3Z/dedIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9dM+KVn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19B8C19424;
	Wed, 18 Feb 2026 12:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771418002;
	bh=onXJKG7ABpWysLLjHoB0FgkcOtPQuvl7ThpLtjN1wno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D9dM+KVnFofAmcGqIps4U3wTWoSnPT8rf5sNM9imouD8LmX0ZYz0s5ivZjJP++vuZ
	 Oppn+ckqo6ODDrfaT0gzbg/w0mV2vS6YuqM09iu2KoRpY6MiK2rK/aEhmKVUpDeI40
	 RLrR0bmvc+h45jzRqchndMO9+AdnpuPwtVakvSaQTkIRS9JU3EdChxHEzqcIG/VSot
	 rIJEnGlvLD2MqsLiEu2ALuKZI1mQDopC914AIBq15v/rqy/AHn69+9wCCfsGgLqT3w
	 +CFVAJUOSlDgcCxUb4RbCrCqbllyMjhCOc29u7qH7TF//mk4Yjjm9KDqImq+F9S/Ep
	 ldmd/hUWBobbA==
Date: Wed, 18 Feb 2026 18:03:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Stanimir Varbanov <svarbanov@mm-sol.com>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Prevent GDSC power down on suspend
Message-ID: <6osboej6luxekrw4okhlbf3irednx7gduhmqbzqkkgd3ldm2cn@esalet4ruwcb>
References: <20260128-genpd_fix-v1-1-cd45a249d12f@oss.qualcomm.com>
 <zfs6krk2whthgdjl2s2w4o5pjwimzw37afoiyrqllykrk6jugt@4ijk5iqplohr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <zfs6krk2whthgdjl2s2w4o5pjwimzw37afoiyrqllykrk6jugt@4ijk5iqplohr>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93282-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1689B1565C6
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 08:13:48AM -0600, Bjorn Andersson wrote:
> On Wed, Jan 28, 2026 at 05:52:42PM +0530, Krishna Chaitanya Chundru wrote:
> > Currently, the driver expects the devices to remain in D0 across system
> > suspend, but the genpd framework may still power down the associated
> > GDSC during suspend. When that happens, the PCIe link goes down and
> > cannot be recovered on resume.
> > 
> 
> The GDSC is a child of CX, so by keeping it always-on, you effectively
> put an always-on vote on CX, forever preventing CXPC.
> 
> In fact, this is one of the reasons why the PCIe GDSCs on most targets
> is marked PWRSTS_RET_ON (in the clock driver) so that the "off state"
> doesn't actually turn off the GDSC, but it relinquishes the inherited
> vote on CX.
> 

So this means, you favor the patch that marks the PCIe GDSCs as PWRSTS_RET_ON?

> > Prevent genpd from turning off the PCIe GDSC by using
> > dev_pm_genpd_rpm_always_on() so that the power domain stays on while
> > the controller is suspended. This preserves the link state across
> > suspend/resume and avoids unrecoverable link failures.
> > 
> 
> We are able to suspend/resume a whole bunch of platforms today, which
> one are you on?
> 
> That said, while we can suspend/resume, we're not allowing CXPC today.
> On many systems the main culprit is the icc_set_bw() vote in
> qcom_pcie_suspend_noirq().
> 

Yeah, I still need to look deeply into this part. The stray vote keeps the PCIe
link active as irq core tries to masks the MSIs at the very end of suspend. This
design works fine for firmware controlled suspends, but not for kernel
controlled ones.

- Mani

> Regards,
> Bjorn
> 
> > Fixes: 82a823833f4e ("PCI: qcom: Add Qualcomm PCIe controller driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 5a318487b2b3f6c61d8f5b1fd5cdf2738a1f1dcd..314cf334a313dff35efaf0c023597e6eef483925 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/pci.h>
> >  #include <linux/pci-ecam.h>
> >  #include <linux/pm_opp.h>
> > +#include <linux/pm_domain.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/phy/pcie.h>
> > @@ -2052,6 +2053,11 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
> >  		pcie->suspended = true;
> >  	}
> >  
> > +	if (pcie->suspended)
> > +		dev_pm_genpd_rpm_always_on(dev, false);
> > +	else
> > +		dev_pm_genpd_rpm_always_on(dev, true);
> > +
> >  	/*
> >  	 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
> >  	 * Because on some platforms, DBI access can happen very late during the
> > 
> > ---
> > base-commit: 1f97d9dcf53649c41c33227b345a36902cbb08ad
> > change-id: 20260128-genpd_fix-3aa413d9a383
> > 
> > Best regards,
> > -- 
> > Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

