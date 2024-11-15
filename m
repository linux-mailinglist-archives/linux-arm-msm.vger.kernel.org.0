Return-Path: <linux-arm-msm+bounces-38025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3D09CE0D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 15:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D34D2883D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 14:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9211CCB4A;
	Fri, 15 Nov 2024 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQiE5xHB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B811B6D18
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 14:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731679224; cv=none; b=YAD+7+DJEKUajSJY7w8x9B01qTtdsuF6+jbeOHTIWAPnKGRUxEi4Q/MpHMv67Jx4F5gykPPLfiPqS9Z9MbXM+lgUB4b0uCedzQlFAGzF1Gu/xK5ei/3zYncBBtrO8r6tTH/3Eh1zUXPxZ/1eYr0hCfQ9s3wSERwjjutK2084ELY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731679224; c=relaxed/simple;
	bh=wITQEuGHifPLZfrjNBLGf1/VYU3ldYv0BLlgjaO4tNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GV21g11jfm5csF+22qCpMVQ3AlukMKLROvVGmGUlnw/DsCxEwoAGDeXn/ML7J1qW0LuMHaacJ7pG7FkzexrXx0SaoYW+m63HEHlVaSBS5ZQbDssJvt4Is8HJ5cLCA/A4H10Cl7Ivag5DF1HYv4vyyjuakHdbtfXzkSQZAtgECP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQiE5xHB; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7240d93fffdso666683b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 06:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731679222; x=1732284022; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wfpzUgAKV0jqCB/bxXS4WblmHJxx7PtLijC6sKxlHnQ=;
        b=DQiE5xHBvOw4lA8aOTP9hmVR3UpC6iAPMWAthWcmEChe8KH+ny9oRM6dixWaU3t5bx
         JAYzS8mFJ3GYln/Uq7Jxx8FKCppUhAb3wvKz5fluVaWp454Z5wnThX7Au50hhwttVjAB
         N4BZmk7xsOUNrskDp1+Z10Su7VJ1nDUkKt0N+BAIYcRfBGiodsvWEEYFZIfi1QwFkfhd
         e1Yoke2NLfQylFqXctNbKdC+5gU/msGhPsEDgwuHtVQC/kvEWVWpt64Lb8JpbVLoxknh
         jfkrYgWo6anebDwpOKXR9e0lvZCQqOTUGi9OIHLtQ4yOmu73a5TMsmjkIsMqFWpX9hrA
         zXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731679222; x=1732284022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfpzUgAKV0jqCB/bxXS4WblmHJxx7PtLijC6sKxlHnQ=;
        b=uqcO9ylAh7EyxoXgL9Rl+ZTlGyBl6m2WyeGQ29vARx2PNMIMCW2otLtEu+E7N2P6pV
         30sw1pHo9+6m86QD97CVpc8oXmz5D2LAE4eBH59ig9iQmijTF1d0cr5TflQhGDkt38RA
         qy628OhjAGMoTf4fnNtAkZckUKl+FbX9w360GJRRyLpxGgYFk9VI58WbwYW9fEntCFwb
         mMXsaw+AKWgLCOXSNBNaALzYseqP8+eO/TMrG33UtyKgxBO8Zvx8TGPskuvv52/xgf0J
         6Tffsm1lHHFSeabI5g9ec/Vs+SryGhvKEliFtuAmUqYkeYkQnNJwJo54ABgFfVzDjzOP
         H5Eg==
X-Forwarded-Encrypted: i=1; AJvYcCW6lAIKeJMkyzJp1Ygo04II9Po0xK7XOoXDt5YAqBS/2geQBJ3bFYYDxqaV0XTgUmwo3KWVGS4tWqj8S+66@vger.kernel.org
X-Gm-Message-State: AOJu0YwFK1pbr+JRUx6dfhKWortaA4S+qX/C0qkJTv9EKkoQjwileG+k
	e8D45Q2kfhpfyTaOPNXQzWhGK0JlbHCnS8pLA1vSh+vIuV3vCU/+zZfarzvrag==
X-Google-Smtp-Source: AGHT+IF2wtEKwXutObdUBNcfljb4mzMuPVgleqWOzqod5ZcyZXK+6BYBJljNVhpODn7AtoJMoCNd5Q==
X-Received: by 2002:a05:6a20:729b:b0:1dc:154a:81fb with SMTP id adf61e73a8af0-1dc90c05ecdmr3582385637.44.1731679221986;
        Fri, 15 Nov 2024 06:00:21 -0800 (PST)
Received: from thinkpad ([117.193.215.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770ee81csm1362494b3a.32.2024.11.15.06.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 06:00:21 -0800 (PST)
Date: Fri, 15 Nov 2024 19:30:13 +0530
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
Subject: Re: [PATCH v4 2/3] PCI: qcom: Set linkup_irq if global IRQ handler
 is present
Message-ID: <20241115140013.ichb3ntic6jicsy5@thinkpad>
References: <20241115-remove_wait1-v4-0-7e3412756e3d@quicinc.com>
 <20241115-remove_wait1-v4-2-7e3412756e3d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241115-remove_wait1-v4-2-7e3412756e3d@quicinc.com>

On Fri, Nov 15, 2024 at 04:00:22PM +0530, Krishna chaitanya chundru wrote:
> In cases where a global IRQ handler is present to manage link up
> interrupts, it may not be necessary to wait for the link to be up
> during PCI initialization which optimizes the bootup time.
> 
> So, set use_linkup_irq flag if global IRQ is present and In order to set

s/In/in

> the use_linkup_irq flag before calling dw_pcie_host_init() API, which
> waits for link to be up, move platform_get_irq_byname_optional() API

s/API/call

> above dw_pcie_host_init().
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index ef44a82be058..c39d1c55b50e 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1692,6 +1692,10 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, pcie);
>  
> +	irq = platform_get_irq_byname_optional(pdev, "global");
> +	if (irq > 0)
> +		pp->use_linkup_irq = true;
> +
>  	ret = dw_pcie_host_init(pp);
>  	if (ret) {
>  		dev_err(dev, "cannot initialize host\n");
> @@ -1705,7 +1709,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  		goto err_host_deinit;
>  	}
>  
> -	irq = platform_get_irq_byname_optional(pdev, "global");
>  	if (irq > 0) {
>  		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
>  						qcom_pcie_global_irq_thread,
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

