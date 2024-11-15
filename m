Return-Path: <linux-arm-msm+bounces-38023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDF89CE0A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 14:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E96F31F23FBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 13:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A350B1D90A7;
	Fri, 15 Nov 2024 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y/cJFaTG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31A31D89E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731678336; cv=none; b=FRFzcQeY9EF768urMYF76O6dn8SxpwSR4RAAipD8O85xWan5v6rih3jg6/Lr+gW3MTGCseiFdw6l/q3LxpAhfXPEGJ35Gt0wp/iO5S35rs+bFxeIDn2Oi5HWnaraRNzyc8BSj8t9Y0bUE0kr7pEQVHC55iWVEQVhFWNsH0Vt9gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731678336; c=relaxed/simple;
	bh=VoybBsY7RTKWBqvK6p4BNsS1WLVg3nffE+yaujNmtgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGJLONdBlLRG893joaJ/+2sgCUpQxrAGY7V1Mbx7gS0SrJ/gFoMhLEvJU+OFcqqAdeuLEJn8cNx8kh3uI7z3P3dvVW4yxhbcwbhkhv+jMDyQ4K06me1P3QjVSfihFRxObiU+QaNsOfs64lHLb25zVZQZcCnv//zcKn2HXrJiKVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y/cJFaTG; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-71811707775so960788a34.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 05:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731678333; x=1732283133; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LuZ9h9BNFcT5uL/Q7ZM7GD2SJeFPeGTf27xjtupqSCo=;
        b=Y/cJFaTGTLHY/LURlE0iRlI3Lv3bxom7+r3lcgn193aSi7b6A/Uc8SYoUl/0PHmw/s
         LH8dLfDH8VbR60ozfym0ur1+tdRuDmcwLGl/chCMFRE4hQlnhskvyPy0NC0fsHvvApL0
         0b22DsCGz/JFUjZXTqggb5PO/qXn0b8Q1S1LQ832iJ/wIilX8AeIEl54IiJYoBouKWmV
         B/3+uAtubmcXO2blSLFLzgnjRMsY6tD4Q0D0BMXns7Ga39Bj4BhWLh6XhrBf5CkTSTd9
         F/22PXm3nzk+TiiQNe0oatLigMz2M9mFSYt/lA8GnaROwcjLnBrUl31s+XTGQXZHQOTb
         hYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731678333; x=1732283133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LuZ9h9BNFcT5uL/Q7ZM7GD2SJeFPeGTf27xjtupqSCo=;
        b=iFIy9ljb1MyzhbTqvvdG+tOJEiusaXR7Ug+9nQHdlXMG3CIG1mfLCX4Exs/pFZSgOH
         FziifZqjSmngVuhlfYFCuWLRg/yUvqL+wfOvgEL2B07g5xpjeFF/5RWdx2DLHTpx14Zc
         TRknF2+5j8O3uPvnMcyitaUsRN1nfJiagwe0uHfW27kGA1CljiVBD4/L8uckSVD6I7oE
         iuNtuhzb5y+twMFn7Bf/aLBiTfSQPjUY1Z/jJBMeoU9jrUIrvYBubzKPMf4rF0twBhOg
         F19wrPk53IfKHNSt3hZ+hJn4J314z3TVJR6dslgVkiMW4hnFxuOT5wUjnZwD5wCjXnuF
         GQ9g==
X-Forwarded-Encrypted: i=1; AJvYcCWuWdMX2kkvaENiC+n2k0Sg0Oj/wllrJU9RJTLUzMiVi++2+Qiqgxp7IWcW+uMklPjyzQrTJOGheRbyDNCj@vger.kernel.org
X-Gm-Message-State: AOJu0YwVrGZtO78ltLmOARdx5XNrQuU4vjpUQPZPOg6oR0SMjLEsTOzM
	a0crpF50pJKhBq/mAfDsxZ8TSosYhuBvYVGzyxiHfoBXrM7f6MnsZoKZUj8dVg==
X-Google-Smtp-Source: AGHT+IGIbW1tQeXnBuOqrUpxgNtqWmpwlGGiTVcd4WBp0pbssH/vd69ZwPhiHwTkU1GfRxG6/U7bqg==
X-Received: by 2002:a05:6830:700a:b0:716:ab1b:6473 with SMTP id 46e09a7af769-71a77a24391mr3208834a34.30.1731678332904;
        Fri, 15 Nov 2024 05:45:32 -0800 (PST)
Received: from thinkpad ([117.193.215.93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1c2c505sm1268434a12.18.2024.11.15.05.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 05:45:32 -0800 (PST)
Date: Fri, 15 Nov 2024 19:15:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
	andersson@kernel.org
Subject: Re: [PATCH v4 1/3] PCI: dwc: Skip waiting for link up if vendor
 drivers can detect Link up event
Message-ID: <20241115134524.xbjgrutbpp7ehjsn@thinkpad>
References: <20241115-remove_wait1-v4-0-7e3412756e3d@quicinc.com>
 <20241115-remove_wait1-v4-1-7e3412756e3d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241115-remove_wait1-v4-1-7e3412756e3d@quicinc.com>

On Fri, Nov 15, 2024 at 04:00:21PM +0530, Krishna chaitanya chundru wrote:
> If the vendor drivers can detect the Link up event using mechanisms
> such as Link up IRQ and can the driver can enumerate downstream devices

"if the driver can..."

> instead of waiting here, then waiting for Link up during probe is not
> needed here, which optimizes the boot time.
> 
> So skip waiting for link to be up if the driver supports 'linkup_irq'.
> 

s/linkup_irq/use_linkup_irq

> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>

With above,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 10 ++++++++--
>  drivers/pci/controller/dwc/pcie-designware.h      |  1 +
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 3e41865c7290..c8208a6c03d1 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -530,8 +530,14 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  			goto err_remove_edma;
>  	}
>  
> -	/* Ignore errors, the link may come up later */
> -	dw_pcie_wait_for_link(pci);
> +	/*
> +	 * Note: The link up delay is skipped only when a link up IRQ is present.
> +	 * This flag should not be used to bypass the link up delay for arbitrary
> +	 * reasons.
> +	 */
> +	if (!pp->use_linkup_irq)
> +		/* Ignore errors, the link may come up later */
> +		dw_pcie_wait_for_link(pci);
>  
>  	bridge->sysdata = pp;
>  
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 347ab74ac35a..1d0ec47e1986 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -379,6 +379,7 @@ struct dw_pcie_rp {
>  	bool			use_atu_msg;
>  	int			msg_atu_index;
>  	struct resource		*msg_res;
> +	bool			use_linkup_irq;
>  };
>  
>  struct dw_pcie_ep_ops {
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

