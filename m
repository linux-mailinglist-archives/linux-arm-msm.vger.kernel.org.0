Return-Path: <linux-arm-msm+bounces-108505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEtdCWViDGpXggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:15:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3984457F64B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3668430072A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4F34A23;
	Tue, 19 May 2026 13:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWBkg5eQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC18340416;
	Tue, 19 May 2026 13:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196039; cv=none; b=kbjcHD1X0kjCwbq6M4HhtkDnGbEb+x+GtcKHpQmjTVFQkGJ1LB4Y6b2+rFaMUaAinV0IeiodiI7gLSZgDuz5azTMyb3NItu+gmgyAgBXcjEaOsx90L1+oaA0qULKtUDYZvZlOz2mlw0crqAtn4mzj+NkLqpS/qmsiwJ77W1GmdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196039; c=relaxed/simple;
	bh=OugdVeCobSnxk7atKWujQ4WieCK7dcTCbEIrkN3ZV8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C96Ke0sQkKoNxBXpRUNT3KytE1qbnNMK+SfeMI5AaZcovKUFcoFv6YenBymyxFzEn1UWgv5uTNvq70T1xs+ebfkrn4qZoR7NLkn58a5eQaWZYo39e1coSSwmIYhpa3w1O/52ayfoq75Dj7i7qVdpy2YNsFQXvbm+7ogngDkd8DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWBkg5eQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072C8C2BCB3;
	Tue, 19 May 2026 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779196039;
	bh=OugdVeCobSnxk7atKWujQ4WieCK7dcTCbEIrkN3ZV8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EWBkg5eQe+ynpI1zcXySYzK91vsyED6f6TbzzpcCh726nCfEF9G/s0Or3E8rlkvnD
	 aKMtgkG6lvrujLv1HaslX9JZbdSwOtIx1vEx4nOhmi2Xfvkb1Q7bFz+pgfX+2PC//n
	 A4VMOeUlWBMej3VIVp2o3U7u20dXQtql2kubjigzSaqq6OfVG45RWM9DuLfJLWfndU
	 B7v3TiseJBEC47lavYb946FWgF6EtWPDxD7ldeyHbFSHANaoThHliR8FdEcNS+wzv6
	 SL3gkHNW/b/vUEenVESNaIrJPOjMc+7PJuwqcsE2mxKGG9jJwE/y+qRIn3vlxKe3ag
	 o/kh1wSiSFupQ==
Date: Tue, 19 May 2026 18:37:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] PCI: qcom: Add PCIe support for upcoming Hawi SoC
Message-ID: <jtaqjariqueifpo4cbi5jogdrkfll7e4ddf5geupjebhj6mni3@hknbfb5z6uei>
References: <20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com>
 <20260514172151.GA410819@bhelgaas>
 <agYjMZX/cYijEBOm@hu-mattleun-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agYjMZX/cYijEBOm@hu-mattleun-lv.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108505-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3984457F64B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 14, 2026 at 12:32:01PM -0700, Matthew Leung wrote:
> On Thu, May 14, 2026 at 12:21:51PM -0500, Bjorn Helgaas wrote:
> > On Fri, May 08, 2026 at 01:02:13AM +0000, Matthew Leung wrote:
> > > This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
> > > platform features two PCIe controllers: one capable of Gen3 x2 operation
> > > and one capable of Gen4 x1 operation. The first patch adds the device
> > > tree bindings documentation for the Hawi PCIe controller, and the second
> > > patch adds driver support by enabling the Hawi compatible string in the
> > > existing qcom PCIe driver.
> > > 
> > > This series depends on the following prerequisite series:
> > > - [PATCH v3 0/7] clk: qcom: Add initial clock controllers for the
> > >   upcoming Hawi SoC (Change-ID: 20260316-clk-hawi-1ad4cad36d6a:v3)
> > > - [PATCH v4 0/2] interconnect: qcom: Add support for upcoming Hawi SoC
> > >   (Change-ID: 20260311-icc-hawi-d6dc165f8935:v4)
> > > 
> > > These dependencies add necessary headers for running dt_binding_check
> > > against the binding.
> > 
> > These apply cleanly to v7.1-rc1.  I suppose the dt_binding_check thing
> > is the only real dependency?  Is there anything we need to do to
> > enforce the dependency when these get merged upstream during the merge
> > window?
> > 
> 
> Yes, the dependencies are only needed for running dt_binding_check as
> the example dts snippet would produce an error on the missing headers.
> The patches should apply and build cleanly otherwise.
> 
> I thought this check could be a problem for merging so added the
> dependencies for completeness. If the binding check isn't a concern, I
> can drop the dependencies.
> 

No, the dependencies are needed. It is also an indication that we cannot merge
this PCIe binding change, until the dependent headers are merged to mainline.

dt_binding_check should not fail in linux-next or in mainline.

- Mani

> > > Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> > > ---
> > > Matthew Leung (2):
> > >       dt-bindings: PCI: qcom: Document the Hawi PCIe Controller
> > >       PCI: qcom: Add support for Hawi
> > > 
> > >  .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 188 +++++++++++++++++++++
> > >  drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
> > >  2 files changed, 189 insertions(+)
> > > ---
> > > base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
> > > change-id: 20260506-hawi-pcie-f61435ca420c
> > > prerequisite-change-id: 20260316-clk-hawi-1ad4cad36d6a:v3
> > > prerequisite-patch-id: c4fbb0620d748d7f1ee675ade5167775bd31c8ac
> > > prerequisite-patch-id: ae5e212518cc333a1a93564cabfc6abd128df664
> > > prerequisite-patch-id: 3c3816e0d595589fc02383f10e48c83a61fdc9d1
> > > prerequisite-patch-id: cbc13fb819d1c1ee77957393f0958f05db8db864
> > > prerequisite-patch-id: 17e2c0cfbbea826fefa1c67d0f5dc2094ab73d76
> > > prerequisite-patch-id: 150dc74750377f4558deab6b179632872bcbb71c
> > > prerequisite-patch-id: 38fe0da5b18610aeb32c7154f9e50187ccaec6a4
> > > prerequisite-change-id: 20260311-icc-hawi-d6dc165f8935:v4
> > > prerequisite-patch-id: a1ff655f0b21d6259b158ad9f99a95bde31257e6
> > > prerequisite-patch-id: db21b6b20451be8475129faece7ef4191d41273c
> > 
> > I don't know where any of these change-ids or patch-ids come from.
> 
> These were generated by b4 after adding the change-id metadata for the
> dependencies.
> 
> They should refer to the change-ids of the respective patch series:
> - https://lore.kernel.org/all/20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com/
> - https://lore.kernel.org/all/20260506-icc-hawi-v4-0-35447fdc482b@oss.qualcomm.com/

-- 
மணிவண்ணன் சதாசிவம்

