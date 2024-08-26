Return-Path: <linux-arm-msm+bounces-29457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EE495EB60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 10:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 946741C21AC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 08:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF5512E1EE;
	Mon, 26 Aug 2024 08:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nsvkdg4b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3344E75817
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 08:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724659571; cv=none; b=Ip6clYk1FsFoPepsmu7omvL70rzWLKVN0CbZhRNOnrEyauA/bdPRzPMcme+HHIXSR4uRCT+gXXSiUXYQC0a1Lha6N0lELIXAwi34cftSLVW2s9itss4mfcxLWvwjcEKwQSl4eoQzq5OnwXdq3j5uDZJyEnwGhEwTk2TRpX9pkuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724659571; c=relaxed/simple;
	bh=20T+z1/UbHbTVU1JoaoVQa/Dmn44LgaPG0dQ4LmTMiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+Go/rRFSoSlot06Z6Ru0gnIhKcqRJHCHWN7k8PEmCRRIF/RLh1eSBzj7mjxgARcw9ttgswMZj2YREJME9U6H/fbOopluiuLRXVUr26/lweM9Oa6p7s6CYlfOsY2kNT0l/2Y6z5f0YSQt+THchFa1WW98d9wIPtGFgLyapuWW0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nsvkdg4b; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-81fb419f77bso221461039f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 01:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724659568; x=1725264368; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkvVVX0WwYMRkuJr4fT+lZy5RdN02KU4cSUWfXWqpT4=;
        b=nsvkdg4bnf9+5IBqNp/OzJuXRYsynBJOah6w0WfDqVfPNAbM+G0NfeIYXcsrtsLWRM
         zROwXG97lYqvx7vsXmiXohNRm1Pl0DEqT9VZccVs5LGuVZp7Qc/NUyuZQIVY7CLs0bv9
         8oM6BnktztUTmpl9foOqVnxDmIb1BJjCitlRIzfk8qHtvVBJps+PzForuy+CzE7korKn
         JIl8X0w0PLs+fClA4wvsC/y+vA6lDJJdAq8/dn3GK8IqAaU3FNiCEfpkgU78nicnueP7
         R+XQ+PwIV8UQycNSIFk/8j4OYBZ5ehBKBi6Dg7mXLcqdyPHf8Ef7L0WM9Xr7oNLe2Rs5
         oXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724659568; x=1725264368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkvVVX0WwYMRkuJr4fT+lZy5RdN02KU4cSUWfXWqpT4=;
        b=o/XYMvMkemXGBiNVd7nOGu8wLbVJSQeKKyWKuU+BcGYRaJwjoku44bckngmyR35ZT2
         FnyMy+vpCE2mInHeOqCbPU4f4qjerOWq8nwk4cy4ha9hhUkLU0bsdVtV2Opp8qFGIsgx
         Bkj2I8zWYZ+QdDvKu4gGkbA5Bjsrtxsp+0bDsYmsYpiZdYhNGXMftml5I3nMIF0JZrQT
         d+8haCMAOwLaVFy3got767HLVFgyFeD9+Q6QuXDVHM3duXaAtMTHlf6xAFivW6Aegt+z
         CV/sjfYqdnUsAJv/GAH/U+pNyVTwB8JqxuX1WlkdjS0xibqjp+juJRSxeHzoYtd3JSe4
         Adag==
X-Forwarded-Encrypted: i=1; AJvYcCWHrvdoa+a1k6eJ+j8jAHogyH+nghlsyLkKkvTsDGB3i2h/3tUaqmjhkmyTcr3LIY1UgAszHQqlJQ1sJGp6@vger.kernel.org
X-Gm-Message-State: AOJu0YygGL0WtBCQpsfs/jNY2bhb8vCvotQbeh9xEs0aGSK6D8uLBiDR
	Vb06ZCDA0b1B4wVbqwxkfIY0xc/bi5P1PsQs1ETAqc0J+T+y+uMTThPgX5wIeQ==
X-Google-Smtp-Source: AGHT+IE14MNMnJz/dTmMXrxFZE1GO2GsfhXBXLXTNOED5Orn8DKvtf61Cpi9sYgA4TkhBdRdPZ3h9w==
X-Received: by 2002:a05:6e02:190c:b0:39b:2669:4e44 with SMTP id e9e14a558f8ab-39e3c985c60mr130046555ab.8.1724659568225;
        Mon, 26 Aug 2024 01:06:08 -0700 (PDT)
Received: from thinkpad ([220.158.156.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac98b32sm7134309a12.2.2024.08.26.01.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 01:06:07 -0700 (PDT)
Date: Mon, 26 Aug 2024 13:36:03 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Mank Wang <mank.wang@netprisma.us>
Cc: "duke_xinanwen@163.com" <duke_xinanwen@163.com>,
	"loic.poulain@linaro.org" <loic.poulain@linaro.org>,
	"quic_qianyu@quicinc.com" <quic_qianyu@quicinc.com>,
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Netprisma
 LCUR57 and FCUN69
Message-ID: <20240826080603.joynf4hqklgt6kph@thinkpad>
References: <PH7PR22MB30388908C5E6DCE67E98C68681B02@PH7PR22MB3038.namprd22.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR22MB30388908C5E6DCE67E98C68681B02@PH7PR22MB3038.namprd22.prod.outlook.com>

On Tue, Jul 30, 2024 at 03:01:05AM +0000, Mank Wang wrote:
> Add Netprisma LCUR57 and FCUN69 hardware revision:
> 
> LCUR57:
> 02:00.0 Unassigned class [ff00]: Device 203e:1000
> 	Subsystem: Device 203e:1000
> 
> FCUN69:
> 02:00.0 Unassigned class [ff00]: Device 203e:1001
> 	Subsystem: Device 203e:1001
> 

Can you please add a note on how this modem is tested? Like using any modem
manager commands, how the IP interface is created (IPA or MBIM) etc...

> Signed-off-by: Mank Wang <mank.wang@netprisma.us>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 14a11880bcea..054420ca4c8f 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -26,6 +26,7 @@
>  /* PCI VID definitions */
>  #define PCI_VENDOR_ID_THALES	0x1269
>  #define PCI_VENDOR_ID_QUECTEL	0x1eac
> +#define PCI_VENDOR_ID_NETPRISMA	0x203e
>  
>  #define MHI_EDL_DB			91
>  #define MHI_EDL_COOKIE			0xEDEDEDED
> @@ -680,6 +681,28 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
>  	.mru_default = 32768,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_netprisma_lcur57_info = {
> +	.name = "netprisma-lcur57",
> +	.edl = "qcom/prog_firehose_sdx24.mbn",
> +	/* LCUR57 uses the same controller configuration as quectel_em1xx */

No need of this comment here and below.

- Mani

> +	.config = &modem_quectel_em1xx_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = true,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
> +	.name = "netprisma-fcun69",
> +	.edl = "qcom/prog_firehose_sdx6x.elf",
> +	/* FCUN69 uses the same controller configuration as quectel_em1xx */
> +	.config = &modem_quectel_em1xx_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = true,
> +};
> +
>  /* Keep the list sorted based on the PID. New VID should be added as the last entry */
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> @@ -778,6 +801,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* T99W175 (sdx55), HP variant */
>  	{ PCI_DEVICE(0x03f0, 0x0a6c),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w175_info },
> +	/* NETPRISMA LCUR57 (SDX24) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1000),
> +		.driver_data = (kernel_ulong_t) &mhi_netprisma_lcur57_info },
> +	/* NETPRISMA FCUN69 (SDX6X) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1001),
> +		.driver_data = (kernel_ulong_t) &mhi_netprisma_fcun69_info },
>  	{  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> -- 
> 2.34.1
> 



-- 
மணிவண்ணன் சதாசிவம்

