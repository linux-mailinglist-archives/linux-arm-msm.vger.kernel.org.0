Return-Path: <linux-arm-msm+bounces-69313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49015B2792D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 08:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C5B25E56D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 06:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9BE13D503;
	Fri, 15 Aug 2025 06:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=true.cz header.i=@true.cz header.b="fskaRwgF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out.xnet.cz (smtp-out.xnet.cz [178.217.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB999A92E
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.217.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755239437; cv=none; b=oP0gURyRv/t3wn/dZ/PJf85q3kold15vCoSXpy3yG/Yzw2/KxA+mPGSjcjNPreV7XnrcSeQpxZCMeyEndH9SdBk8sovWl/UkhmRHndxzWliaj2AAzrHT4aKObOHNyqCt/oYDx557A/NNuo3a1r4RTtdJ7UBnzZPb+6eXyUHgO+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755239437; c=relaxed/simple;
	bh=HN5R66AZfCK7MHGh+aNG1oEqt+2nw0NCyBz9iyCmV6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fn3oc3bG0izJDCIMjMGxTMhYZDTZM0LJM7jtNFVGIrJdxhItwFmPBRQVlf/IeCzwSc07ENAK1sXz5uJfEHiMiq61GtRd3d++T9R7DlCSBgeVpEr6BPa90Ua/X3VGCLnFJFF/hGFYjFrqU/PKRibksgi77/GOytG/cqTIVUgPqk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=true.cz; spf=pass smtp.mailfrom=true.cz; dkim=fail (0-bit key) header.d=true.cz header.i=@true.cz header.b=fskaRwgF reason="key not found in DNS"; arc=none smtp.client-ip=178.217.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=true.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=true.cz
Received: from meh.true.cz (meh.true.cz [108.61.167.218])
	(Authenticated sender: petr@true.cz)
	by smtp-out.xnet.cz (Postfix) with ESMTPSA id 5EE47344B;
	Fri, 15 Aug 2025 08:22:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=true.cz; s=xnet;
	t=1755238963; bh=HN5R66AZfCK7MHGh+aNG1oEqt+2nw0NCyBz9iyCmV6k=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=fskaRwgFE61kJ9LSnqVqor9BeOn1MJzgxtsJrhF/BPOhroxq+3+PZYUuywcVjOzCp
	 hjCjP4FWXIBlzR6ifi/oB+PvipbRVKUm5YB5lKTb93j8oI3y9Q86LTD93AO1fA560q
	 HuKrZP2NCVOMZqRjyL/3IDU1HFWRtFOiTg0g0AIc=
Received: 
	by meh.true.cz (OpenSMTPD) with ESMTP id b76db20f;
	Fri, 15 Aug 2025 08:22:28 +0200 (CEST)
Date: Fri, 15 Aug 2025 06:22:41 +0000
From: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Duke Xin =?utf-8?B?KOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>
Cc: Chris Webb <chris@arachsys.com>,
	Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: add support for Quectel
 RM520N-GL 0x5201 variant
Message-ID: <aJ7SMWSWw5l8rS4I@meh.true.cz>
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
References: <20250512112631.2477075-1-ynezz@true.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250512112631.2477075-1-ynezz@true.cz>

Hi, gentle ping :-) Thanks! Cheers, Petr

Petr Štetiar <ynezz@true.cz> [2025-05-12 11:26:31]:

> From: Chris Webb <chris@arachsys.com>
> 
> I have a router board with a Quectel RM520N-GL 5G module that speaks
> either USB or PCIe. When switched to PCIe mode, the modem present itself
> on PCI bus with following IDs:
> 
>   0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc Device [17cb:0308]
>     Subsystem: Qualcomm Technologies, Inc Device [17cb:5201]
> 
> and is currently being wrongly detected by the kernel as:
> 
>   mhi-pci-generic 0000:01:00.0: MHI PCI device found: qcom-sdx65m
> 
> which results into wrong modem configuration and thus missing wwanX
> netdev. So lets fix it by adding a new device entry for this 0x5201 variant.
> 
> Link: https://lore.kernel.org/mhi/ZqllDCWfiKravZAo@arachsys.com/T/#u
> Fixes: 1cad976a1be9 ("bus: mhi: host: pci_generic: Add support for Quectel RM520N-GL modem")
> Signed-off-by: Chris Webb <chris@arachsys.com>
> Signed-off-by: Petr Štetiar <ynezz@true.cz>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 03aa88795209..0db9543a7edc 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -818,6 +818,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> +	/* RM520N-GL variant with Qualcomm vendor and subvendor ID */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_QCOM, 0x5201),
> +		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
>  	/* Telit FN990 */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },

-- 
ynezz

