Return-Path: <linux-arm-msm+bounces-69606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B63B2AE18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 18:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDB3616AD19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 16:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7E73376BA;
	Mon, 18 Aug 2025 16:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoUjYCOK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CDC2036FA;
	Mon, 18 Aug 2025 16:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755534378; cv=none; b=UnMKxsF3aYcXOdDQGNUMnL6fVvPluRWKDRWTNQfRL9i76DF7uNaWF8j2/kStuMMGTtI+I+Iz4lu12N+xkAdQFszKcc2xpzj8aoC5YIHLBbVWlSlFgVF2Wa2qFYw04fOvEdhu5ERbc1fIV+jOU74LoZmfw8S6mWRpTMXc5K9Hd44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755534378; c=relaxed/simple;
	bh=ZwkwKLm+9X4AKLx18Kn7SY8j79i1RmrxvQJj90SGHG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7yUWHl8nmsIKtVMPyuXYEBmSiILoazOBSGqgVB/yc/KPV0NE3B3K5G0bkuOkusT4MT6kjPgaWx0qcfG6U7O8stBqezFhocJsqNHAntafjwAauygy3CkoHVcGKRLwc93oZR9bQuQVk+vV8Oq7EOmXSiPu2Kv73sH9X1CPch5Znk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoUjYCOK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ABEAC4CEEB;
	Mon, 18 Aug 2025 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755534377;
	bh=ZwkwKLm+9X4AKLx18Kn7SY8j79i1RmrxvQJj90SGHG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoUjYCOKlvn63f5fLt/oPtGXuXlIB3qI/s1uwCSlxibX/y6DChK9BSYT2KFxHOK7N
	 JQOAB4wpvBP/cqfQYWaU21NSkbhmZ3ycZki5Tb1XbTQ9HmjmawmOuDNfztGe1oXhM5
	 oMYRvwG57tl16BcpLJQcmLiZHDEI2JocqPQD7qwss1jWsdLqa0gY5nHLU/xhUggeE9
	 WuGTnngOEQwYXlr04Z/QHYpd2TLqCfCDHHqWGm5ndGcik0ACZ7FJMzx1W+3lL2gAGJ
	 lBQUaLiKJZxOdGS/YG5gCmbnCX2ajyk8GkBpyx98eTuZaLtW1sbK7uLMABL9dO+ySC
	 9wh+aU1KevT5Q==
Date: Mon, 18 Aug 2025 21:56:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add more Foxconn T99W696
 modem
Message-ID: <2cnllzjs4w4s5hqelhdpyfsnxlnb4amtueyijqndavkypumr5l@46q4k4lut6a2>
References: <20250729085726.106807-1-slark_xiao@163.com>
 <ma7am34lifhb3avqyiodtbsfmlmi6s5tsw7kqf2rp2eyiq3uqw@ty57xdfbe5ao>
 <7eb35c0c.93ee.198bcc85d6c.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eb35c0c.93ee.198bcc85d6c.Coremail.slark_xiao@163.com>

On Mon, Aug 18, 2025 at 06:45:04PM GMT, Slark Xiao wrote:
> 
> 
> At 2025-08-18 16:14:28, "Manivannan Sadhasivam" <mani@kernel.org> wrote:
> >On Tue, Jul 29, 2025 at 04:57:26PM GMT, Slark Xiao wrote:
> >> There are more platforms need support Foxconn T99W696 modem.
> >> This requirement comes from Lenovo side since they want 1 platform
> >> to correspond to 1 modem SKU.
> >> 
> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> ---
> >>  drivers/bus/mhi/host/pci_generic.c | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >> 
> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >> index 4edb5bb476ba..1fc43f1b86be 100644
> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> @@ -932,6 +932,24 @@ static const struct pci_device_id mhi_pci_id_table[] = {
> >>  	/* Foxconn T99W696.00, Foxconn SKU */
> >>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe146),
> >>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> >> +	/* Foxconn T99W696.05, Lenovo T14 */
> >> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe150),
> >> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> >> +	/* Foxconn T99W696.06, Lenovo T15 */
> >> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe151),
> >> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> >> +	/* Foxconn T99W696.07, Lenovo T16 */
> >> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe152),
> >> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> >> +	/* Foxconn T99W696.08, Lenovo P14s */
> >> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe153),
> >> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> >> +	/* Foxconn T99W696.09, Lenovo P16s */
> >> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe154),
> >> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> >> +	/* Foxconn T99W696.10, Lenovo P1 */
> >> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe155),
> >> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> >
> >Since all T99W696 derivatives are using the same config, can't you use below?
> >
> >	PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, PCI_ANY_ID),
> >		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> >
> >I'm presumed that all 0x0308 based modems are T99W696 derivatives.
> >
> >- Mani
> >
> Hi Mani,
> Yeah, this is really helpful.
> So shall I update the previous T99W696 IDs with this new match case?
> 

Yes please.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

