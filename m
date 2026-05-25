Return-Path: <linux-arm-msm+bounces-109555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDecEzzoE2pdHQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:12:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ACE5C6381
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D14A3002886
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 06:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A946355F2B;
	Mon, 25 May 2026 06:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxoqceW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADCF33CEA7;
	Mon, 25 May 2026 06:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779689528; cv=none; b=YrdjzU8dyZSUfR2jLXJEFU7/XMGV3ut2jpdy4sYgNQeN0Q0hjlCc68VbcmrQP8a2Kd3aIYBNEHpnFsjzLq1bVkwby2Gu3tMc/oSjuW8ybzio4XwygZ8XU0pMXmwhtTZaYUFruZKGW1eN0A5mnNuFvwFOk8YP7jUOiNIg71ywZKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779689528; c=relaxed/simple;
	bh=le6vfuVB5iClPHLjgSOz/NXFGP2l+us/Tr2Saz96LPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feJY7pyYn2OAgNbjOmZ1tgR9c/bj/kZEuARZwtN5XPBrVWguxCFGn2or91ulfQuEb8+Hc0KJ3409t4USLYQDTzLaRx84OvXJTiuKCgUALw+bk3yCMVazvzI9T9nq4PUWxvoXLV1r6IvDB1RFFloFvLgdKEZWilmRJ/iD8J3VblM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxoqceW7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44801F000E9;
	Mon, 25 May 2026 06:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779689526;
	bh=G8bK9DHL3yrRtTJDYvR/fM9TPKsL9n1FAheSMDdVqw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YxoqceW7J1kdqpjLfbnjUze6Pxw2Dh4sJiTMMxNwPzefSv2kqYsVkKDEeYt9AAItt
	 rPTflhH22yns/Q2Jw83ykeM98Bl5iJ7VtaNNciGPTq9wX9B+xr5gr19pOjgNwpu5aZ
	 1ZfzFIFAYgn7RbhyJsteZ+bycjlOwg1t9rEFpqT5m8HyavyVl/Cs9/dawK4MENhYo/
	 3e3B6Tdz05j+3S4hpj8aAUmgbLGcATbvYUntmmxu+GQ07SQDgCgBNzvNGP1wVbA02T
	 1XdzC4V+P5Z7hyd16DJldtNz1V17rAVu/uYbC+yKQa9q3g8JxhFI2FZzMRnyQWVte+
	 O+akx4EznKF8g==
Date: Mon, 25 May 2026 11:41:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 3/4] PCI: qcom: Add Support for Eliza
Message-ID: <k7sncylpd4qg2x3qhqjho6ml2d64vpvbo6nrpyqzwloeyckzvd@d6v3s6avedzt>
References: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
 <20260521-eliza-v1-3-97cdbe88389d@oss.qualcomm.com>
 <20260522-discerning-sympathetic-moth-daa9e7@quoll>
 <5593d136-569e-4ba9-9a2f-e635125899aa@oss.qualcomm.com>
 <c751f5f9-f9c2-4575-a029-0be4148e1aee@kernel.org>
 <t6wljnlnz77dvthbohlr7v4qlhsqzvykhcm6evmtnvkgtqk34w@o7sl6nq5lkbi>
 <fecce3a2-5c45-4e30-ad1b-2173b697960d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fecce3a2-5c45-4e30-ad1b-2173b697960d@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109555-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 12ACE5C6381
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:03:09PM +0200, Krzysztof Kozlowski wrote:
> On 22/05/2026 12:48, Manivannan Sadhasivam wrote:
> > On Fri, May 22, 2026 at 11:34:30AM +0200, Krzysztof Kozlowski wrote:
> >> On 22/05/2026 11:31, Krishna Chaitanya Chundru wrote:
> >>>
> >>>
> >>> On 5/22/2026 12:21 PM, Krzysztof Kozlowski wrote:
> >>>> On Thu, May 21, 2026 at 07:35:31PM +0530, Krishna Chaitanya Chundru wrote:
> >>>>> Add support for Eliza soc, which has two PCIe controllers capable
> >>>>> of 8GT/s X1 and 8GT/s X2, using the cfg_1_9_0 configuration.
> >>>>>
> >>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >>>>> ---
> >>>>>  drivers/pci/controller/dwc/pcie-qcom.c | 1 +
> >>>>>  1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> >>>>> index af6bf5cce65b..40f0a5f247eb 100644
> >>>>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> >>>>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> >>>>> @@ -2123,6 +2123,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
> >>>>>  static const struct of_device_id qcom_pcie_match[] = {
> >>>>>  	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
> >>>>>  	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
> >>>>> +	{ .compatible = "qcom,pcie-eliza", .data = &cfg_1_9_0 },
> >>>> So compatible with sm8550. Why isn't this explained in commit msg of
> >>>> the binding?
> >>> No, PCIe controller is not compatible with sm8550, we are just re using the boot
> >>> sequence used by the sm8550.
> >>
> >> Then with what it is compatible? You cannot use someone else's match
> >> data and claim they are not compatible. This is contradictory to itself.
> >>
> > 
> > 'cfg_1_9_0' is the match data of base PCIe IP v1.9.0, not just SM8550. The 'ops'
> > callbacks for 'cfg_1_9_0' are compatible with PCIe IPs used in many SoCs such as
> > SM8550, SM8450, SM8350, SM8250, SM8150, SDX55, SC8180X, and SC7280. And Eliza is
> > also falling into the same category.
> > 
> And if all implementations uses the same SW interface, why are you
> claiming these are not compatible?
> 

I didn't 'claim' these SoCs are not compatible. In fact, I explicitly said that
Eliza is compatible with the base IP v1.9.0. But the resources such as clocks,
regulators might be different between them, though the SWI is compatible. So
Eliza deserves a new compatible.

Also, the direct baseline of Eliza is not supported in upstream. So by
'compatible', if you are referring to 'fallback' in DT, then using SM8750 would
be appropriate.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

