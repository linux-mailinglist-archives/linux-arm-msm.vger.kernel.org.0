Return-Path: <linux-arm-msm+bounces-29562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE15960478
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 10:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECEB11F23BE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 08:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C42197A92;
	Tue, 27 Aug 2024 08:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jBJM1EbD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAF9199E84
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724747584; cv=none; b=lbjThA9PYyShrmrx77JaPNpXwq8G4HVRcMjFb8RdhNssp9nbIKCL2Mxqe74/FLnIfdpYSTEY+dPL33F4BsVvQrY8pEJruA3FrKzm1iGp94a82xbX0oG3BFvu1hhKabpvSKGz9XLNBtYyEtjXtHw/HczzGI8IC3rHpOYWnbgbDdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724747584; c=relaxed/simple;
	bh=M0Q46YRt7b9YHADZL32hHtvvl7AwCNCHYajLxrNxZA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZh/8ehV+L7k8NWvbBLy7XB6Pv2AF0/7RakRoZvP7o2NmOCtEzkWUWL1TMfXJ/jl1xTVTDcG83aWcoQVaFepbyFoLAVabUSV+eu/wvDFbSlplu1Yu/LtAkSioMkjfumPsmSZUpnGjTGN6N/wc5oDVMamPCvXS99NLwlju2q7/Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jBJM1EbD; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2021537a8e6so46921685ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 01:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724747582; x=1725352382; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zc3JzuFaE5GcnJFm2AtVlHywrBGXAOtwHwNOckOeDnA=;
        b=jBJM1EbD6ZykmObWDbLM7ap50tzYvGpyYwXZMhYaMPI3hdw3SrueqkeU9yJ50NWQ7J
         JGEWAAON8jiV2hcqVsePEvLDaeaUyhBqEWhjEZriDu9AZSrlb9+JGlByH86P2M8s297t
         I3tTlaOzo8T4MfM0uSyDmUSAFSCq6HJE3+wjO7jtx5zChXi9jz5gcwuLyYYUlG1J/7+g
         ZBgscJKFbgiVutiVSoX1vL039ojNLTmtIez9k3AWHHMk3+j2soOndhGHM31fVkmny2pu
         +f86GQ0ZN+na2MllUd+6jttAxKb1w+ZFAH2e76qr4zI9BUgNAkMGzTOg1BwPMqq+3J+M
         Mxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724747582; x=1725352382;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zc3JzuFaE5GcnJFm2AtVlHywrBGXAOtwHwNOckOeDnA=;
        b=hy4b1wMU587RGiXwnhiVvFy9wWcIAj4J6vCTqDcCZQB+fOcW6ZLiTzMJuOhPugtX2G
         Wt/3Phq8f1ceQl2STDGFxxSg737nyuKE3yOnMCscwQcJl9XP+myLbv7BaiqakCF64fPp
         l/GfcVCNLW5eaXdZjBYMJI9J/3lN2IUZTqfzk0yS/ZIXAWgeZ9FbrGB4xIklCugw4aFD
         haDwRpCzvlr7VodIW8hZE5wa2cxXCTVJ4GRvwSwlYmIJVZhOw+ls5LnWU/1Gf5d+XX7W
         O/YzBiDPslCBb7fGThEzhI+/07XfrbJZYc5ijsvq7L9FqtLPOE5SRKRr7Tb0i+MRZ9CZ
         JgSw==
X-Forwarded-Encrypted: i=1; AJvYcCXNdBee4E4AeM1a4PJTklDuWBEdv9x9GfRnnbeE1QIpme2l5bkBsLYp3jaqmaaq3e+fVFbwQyFhuI56dymF@vger.kernel.org
X-Gm-Message-State: AOJu0YwmKYEeireZIxqNankWRAS0e9gP534TANYkkJEdgY+eP6TN1nKA
	gvI1g0w4UBZHAtjbZsu/DIdy4BwfGFCIm2LhKsp91iHXpFJg8T8ogGWGENWDrA==
X-Google-Smtp-Source: AGHT+IEMaGd8avwuLHYUKAq8n6l8KJIiU8JdyzSEAV7GOkwNV6F2xm4E9P821RIz07e0YabwVS5b4Q==
X-Received: by 2002:a17:902:ced1:b0:202:2c07:f50d with SMTP id d9443c01a7336-2039e4c1f94mr166376385ad.34.1724747582438;
        Tue, 27 Aug 2024 01:33:02 -0700 (PDT)
Received: from thinkpad ([117.213.96.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038558be10sm78777365ad.118.2024.08.27.01.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 01:33:02 -0700 (PDT)
Date: Tue, 27 Aug 2024 14:02:55 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Mank Wang <mank.wang@netprisma.us>
Cc: "duke_xinanwen@163.com" <duke_xinanwen@163.com>,
	"loic.poulain@linaro.org" <loic.poulain@linaro.org>,
	"quic_qianyu@quicinc.com" <quic_qianyu@quicinc.com>,
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] bus: mhi: host: pci_generic: Add support for
 Netprisma LCUR57 and FCUN69
Message-ID: <20240827083255.ob7rusg2qd5alppw@thinkpad>
References: <PH7PR22MB30386647BE2D813B502226CF81942@PH7PR22MB3038.namprd22.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR22MB30386647BE2D813B502226CF81942@PH7PR22MB3038.namprd22.prod.outlook.com>

On Tue, Aug 27, 2024 at 01:58:33AM +0000, Mank Wang wrote:
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
> Both of these modules create IP interfaces through MBIM.
> And these modules can be checked for successful recognition through the
> following command:
> $ mmcli -L
>     /org/freedesktop/ModemManager1/Modem/0 [NetPrisma] LCUR57-WWD
> 
> $ mmcli -L
>     /org/freedesktop/ModemManager1/Modem/0 [NetPrisma] FCUN69-WWD
> 
> Signed-off-by: Mank Wang <mank.wang@netprisma.us>

Applied to mhi-next!

- Mani

> 
> ---
> V1 -> V2:
> 1.Add comments to provide testing methods and IP interface creation methods.
> 2.Remove unnecessary comments.
> 
> Signed-off-by: Mank Wang <mank.wang@netprisma.us>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 14a11880bcea..2c44aab8695a 100644
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
> @@ -680,6 +681,26 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
>  	.mru_default = 32768,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_netprisma_lcur57_info = {
> +	.name = "netprisma-lcur57",
> +	.edl = "qcom/prog_firehose_sdx24.mbn",
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
> @@ -778,6 +799,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
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

