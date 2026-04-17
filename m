Return-Path: <linux-arm-msm+bounces-103503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMW6MiIA4mna0QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:40:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A30894196D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1C8130CEB71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667B23B19B7;
	Fri, 17 Apr 2026 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQ4yvM8x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5973B3893;
	Fri, 17 Apr 2026 09:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418237; cv=none; b=ABof8e/l5T0l1lFJwoIf9a5mJ8jI6T17aD5qsIyhGhnZYRPnmhAq0wMRjszDkE0YLaj27fmip5h94pyFJDsH6SfxNsh6mFeEUELpGItA7YhZm36AGBFHzsN1FBr/LSaPZ0jh7IfqnMesC1zefIQMBhV85MzSow4KBfAdAQRWPY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418237; c=relaxed/simple;
	bh=OODs1MyWgSNpasOw1hA23+RBFDlFstERAlbq/6b8wFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCPv4e6tfEHTHkiGtOITszbg6Yb915McLvSFNdoKd+YDKyae8nFZ5Q2dXQPpsPFmDqwnzyi2Ie9y+xHS6js0qH2X+elyJjedDXOi+xzRBaGj7biW8LTimk6bu53uhBlIpuPKwxpjou2VRZIAQQPsQiVByBZdbv02Mhy9V4v8m88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQ4yvM8x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303EBC19425;
	Fri, 17 Apr 2026 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776418236;
	bh=OODs1MyWgSNpasOw1hA23+RBFDlFstERAlbq/6b8wFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQ4yvM8xZuYo5PhUwW7XO6XulbcBvJxlhXl5LrlvIh/+8jcRKiL67KjYutgYM5uaU
	 VszdfvA6AMmK+afpqvMNJE9X9WXuvqdoibKjoHhzWNezzqZAqJrwlKrBtY4rIMaotC
	 o7MIGj71S0HF6oaAS62twx1qsb0/IORu2Bbvz0kuLBevRtNlQa7UuDTRnYhZEeSQiO
	 Zf8yTncQxGk0yB61rWjeueGOYmme70h08ms00D0UGrTfV8O4i2PYP21zGlS3wpf597
	 vAkMcStb88LoJ8tKUMK+Fz9npwFujSqiwtZAcQl0e4n2ov7s4PQ49uA5sC4JIm6QEK
	 75EQgr1j2LB2g==
Date: Fri, 17 Apr 2026 15:00:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krishna chaitanya chundru <quic_krichai@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Set max OPP before DBI access during resume
Message-ID: <znmi4ouobk2sak6g5i7mlcbbxrhrldtaifw3jsrwwfh6wtuau7@dgbvihjsnbph>
References: <20260416-setmaxopp-v1-1-6a74e2d945a0@oss.qualcomm.com>
 <23078bf0-838f-4a57-be8b-6ba2dd0a27d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23078bf0-838f-4a57-be8b-6ba2dd0a27d5@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103503-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: A30894196D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 10:18:44AM +0200, Konrad Dybcio wrote:
> On 4/17/26 6:16 AM, Qiang Yu wrote:
> > During resume, qcom_pcie_icc_opp_update() may access DBI registers before
> > the OPP votes are restored, which can trigger NoC errors.
> > 
> > Set the PCIe controller to the maximum OPP first in resume_noirq(), then
> > proceed with link/DBI accesses. The OPP is later updated again based on
> > the actual link bandwidth requirements.
> > 
> > Also introduce a small helper to reuse the max-OPP setup path shared with
> > probe.
> > 
> > Fixes: 5b6272e0efd5 ("PCI: qcom: Add OPP support to scale performance")
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 42 +++++++++++++++++++++-------------
> >  1 file changed, 26 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 9fdfc88ac15120b2b01cad746772ae612a2c9690..c9b201a1c033a9849e97db9ee4d07d26655d5a6c 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -1613,6 +1613,22 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
> >  	}
> >  }
> >  
> > +static int qcom_pcie_set_max_opp(struct device *dev)
> 
> Can this be a small non-zero vote instead?
> 

It won't make a difference. We are going to update the vote right after it.
Furthermore, it will allow us to group the logic into one helper and call from
both probe() and resume().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

