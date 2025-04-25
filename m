Return-Path: <linux-arm-msm+bounces-55678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC66A9CDAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 18:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1100C1B86CC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 16:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F1718BC3D;
	Fri, 25 Apr 2025 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eQYG55EC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BBB15573F
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745596938; cv=none; b=JBfkiXxpd7tWHqAG+iw4dG0tVmKyfMmid8md0ijCWgGv7xr6Y7NJ1+tOfx1vkq0UoUGyz1PuZWQjYkF7v+AE7zI/SyAsfya+S5r913GgZoDfJVOHTyOFY+rw60XA3drkDfNACI3fEM2nbXxGjoehr8VxpNGnFXZ30RzkRfbGDeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745596938; c=relaxed/simple;
	bh=DgZXHclJOkx6g9lcO5qu3kZxuqYewO9zEwjAgW0mWLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7sZvXxBMzZD3mIuHEPP6ol7cjHpQw88/9aYtmcXVFxsZDDYHGS6RmTwEJO912CRZEB5Mno/232GaCnly6/Z5Qf3816jxfpuO+DBFbMjRx9Jd5uscUIusKxsSq5wDpDjK6MD+/vLp4bkUlPAW5mzGrtAKgBbVhGhMDJkrD3V+WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eQYG55EC; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-303a66af07eso1923112a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745596935; x=1746201735; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Od8v9uuxXAfd7uGKx+1reVesYOTCW7WP8EaaxY94+tg=;
        b=eQYG55EC+dcfC5h9A4Pc3HSshs+cSL8AniB17QjT0kSQsLT6QYPGVIHKPPIVBMFTWH
         l1BR/bvRLyynOjNpGnIs5qe/iFP/6weS2T6pwjkAaYzYae98zwYA+os9EliBHGcuWFoD
         Ail3wqkGNKZxqj5a9lf9CMoNmtdW9dWbJdq7dqb+DDfRyTIgn/dBwUq+XDmgOnn+oz9C
         j9tsEBRLNWOp75pkUgvvJ8huahfdyH6kRjT6RKOwN1NXYSRCquajI76SwboSnI1W26dm
         zBI0lb6gh/aHmx3LHE0d1ZzDedebUkAZ+CbSERFtYR1637135ptT+VPary2wEpdUM6uV
         hfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745596935; x=1746201735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Od8v9uuxXAfd7uGKx+1reVesYOTCW7WP8EaaxY94+tg=;
        b=Zu9rwsAXuBrIzpaH3wIZFy04HjKaB2GZ5zVoLjRt2KasTFYwkNO3EBeTswnZ5kmDN4
         ZTheALkpPaJ5K2WhydqqmhuHugQ6kZTNfsaTzEIPY20pOk2OgQj3WxPJMfps8orczo/j
         ijPm96fqs8YcjhQS4J3jZRr4ZvG8z3+W5PD4px7g7C4xEWKxfY7Q0t44iEHkHzcxPFM7
         ipta9i/aDnU7Z6aKaE/S1j6wtwmZPHQgvUeLkNBW9tUPHhBVOGJdCTL3BYo7pKYBoA0j
         svQu3YIrKR2eyOrkkcLWupm/YtbnFfMtnpq03yKWjEXVPN2lSHEuvQnlcLyXmOKL+4q/
         7zxA==
X-Forwarded-Encrypted: i=1; AJvYcCU2Mgy/SB9SqHGXdBLc2d48ypNxJj7XTPrMeUHVyhpEpXzAyMpxLKog1gyRb8TOxcDG7KOFqbxS1KpNnIvh@vger.kernel.org
X-Gm-Message-State: AOJu0YzJICjjLVaS0Ajd4Z5OYeuiCseoaqD+s5fJWOV8Y0kWgxX+6NNX
	tpPJnesR5bLo8b6/0D6F6mxyBDFNcabL47UX/kdLTP5CAZxoMeelTo3nrYd23g==
X-Gm-Gg: ASbGncuhNlg8xubBQQ1oXuAJFfsk3R9P960AGGxKx5gYwD3okrUz0YsRh5Sf/n8wES7
	SQ00e7OCKRgCuxrONgPi3F6pznZhafKsHC0HtJzb9WSDN+d9FcwZ0Rr6dgGC1dmZjA7K5Ca7+bV
	A2g4UqBeDNKzijhke6vEKbWJekKRXJ+n3B0Bqa7qT7X4TdjTo7uD3R6Z+7MojR5YpR/cTpBy2HB
	Qyql9YZHSQ25CFdiUWJElp/SDK9chxR1+iQlbDwxUjkw177YCZ9nFEY9nzfcMQZYaRK9QNMX8st
	+KFBAnm26d2RA93tecBF11N0zjjbnDvJvMGxjZs/x4v/g0CB/rwx
X-Google-Smtp-Source: AGHT+IHdQ4Ba18bl0q2QrVTsaExU1b+SHdhITO9CRQcmytTANa1AqTjF3k17LH9+AYX+x/7+IPAHdg==
X-Received: by 2002:a17:90b:264b:b0:2ff:58e1:2bc9 with SMTP id 98e67ed59e1d1-309f7e679aamr4543956a91.25.1745596934960;
        Fri, 25 Apr 2025 09:02:14 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f784ac3fsm1806254a91.45.2025.04.25.09.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:02:14 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:32:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com, 
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v2 03/10] PCI: dwc: Implement .pre_scale_bus_bw() &
 .post_scale_bus_bw hook
Message-ID: <6zuyux2emotjxouvo36ijojz4xel7x7aozyem55pmd3xvpbgjs@6abrkkzj3bib>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
 <20250313-mhi_bw_up-v2-3-869ca32170bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-mhi_bw_up-v2-3-869ca32170bf@oss.qualcomm.com>

On Thu, Mar 13, 2025 at 05:10:10PM +0530, Krishna Chaitanya Chundru wrote:
> Add support for pre_scale_bus_bw() & post_scale_bus_bw() function op's.
> Add support for DWC glue drivers to register for these ops.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 21 +++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h      |  2 ++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index ffaded8f2df7..4da4df62c3f8 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -697,10 +697,31 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
>  
> +static int dw_pcie_pre_scale_bus_bw(struct pci_bus *bus, int target_speed)
> +{
> +	struct dw_pcie_rp *pp = bus->sysdata;
> +	int ret = 0;
> +
> +	if (pp->ops->pre_scale_bus_bw)
> +		ret = pp->ops->pre_scale_bus_bw(pp, target_speed);
> +
> +	return ret;
> +}
> +
> +static void dw_pcie_post_scale_bus_bw(struct pci_bus *bus, int current_speed)
> +{
> +	struct dw_pcie_rp *pp = bus->sysdata;
> +
> +	if (pp->ops->pre_scale_bus_bw)
> +		pp->ops->post_scale_bus_bw(pp, current_speed);
> +}
> +
>  static struct pci_ops dw_pcie_ops = {
>  	.map_bus = dw_pcie_own_conf_map_bus,
>  	.read = pci_generic_config_read,
>  	.write = pci_generic_config_write,
> +	.pre_scale_bus_bw = dw_pcie_pre_scale_bus_bw,
> +	.post_scale_bus_bw = dw_pcie_post_scale_bus_bw,

Please do not add these multi level ops without necessity. Just populate the
callbacks in qcom_pcie_host_init(). DWC has nothing to do with these callbacks.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

