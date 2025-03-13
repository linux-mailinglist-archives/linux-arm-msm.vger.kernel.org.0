Return-Path: <linux-arm-msm+bounces-51224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 437D2A5EB62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 07:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7792D17750D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 06:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78FA1F9AA6;
	Thu, 13 Mar 2025 06:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dwX7igfa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D895474C
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 06:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741845651; cv=none; b=paxlv3ANbfL2xqk+i/7fbozfYBENkThjzifLOjGGoH3OWHU5VUVd7x2+hKLjsxO2zKbNe+L9saQieJhblmNk1S7GQRAA4Zev4aZZyntg4mv+gTwKD4fBioFPT1os+6SnXE3TByXGJ/Rk9aG8CwhBSeXP7lBeFlb2ERtBvht7i20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741845651; c=relaxed/simple;
	bh=QW70e1/mfz3TjZGJIpQD+B6tcZSkZLU5rl5INwW+S3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+D/pWhXG++iRpcEGx3+y/Q/241vbLViDn1BQTcJJG0gDaHwC+ZRAZgONs42qz5Kx+1CICXOyYl0hgOTqH+LWdvMB23gfXQwOzSvgbSGv+TrU5B8+oXf+iL/MBAE7X1OoM6BOqwbQj92Rl09GfoS3tsELWwyRZYLvPFfJPaHibQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dwX7igfa; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so1412970a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 23:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741845649; x=1742450449; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BR/Nog4BFFAbGskl6Y3iDgtMEiZ/gcMqksEKy4uZav4=;
        b=dwX7igfaEgVa/tiCi+qwyafZWrTRBFaNflH3xtIKo5wv5qj5djlA+36KcNQCdgtEW3
         SlCfu7lyMcDc2/1ZX/3REK+05elnamA2XbdbHFuHf8pB5nN1k8uqY+GX+PaZbX9EdwKS
         m/9BhdUNDwOliS7opGV2o+OWXr6kagjjD7Yu3g4xvkcbqJaqaqpWxHL0JUaZ33ptjgPV
         8mM+VhRQA1S0Dwcvq7ioQouQt73CXL4CWZ85GTWOOR+d3vN+fBLFUSIHtyfMKrFv3GCM
         lFw5FVtltHBACsq8hthZ0MG9KgpAJO2UlkrQeq0PIr1Jlq0CsjF8K7Ru3mQdUUIxUqcw
         Al/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741845649; x=1742450449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BR/Nog4BFFAbGskl6Y3iDgtMEiZ/gcMqksEKy4uZav4=;
        b=jftZRUXVp8Y1GHWrP5Da37r5+xEsjWReFBHrDLPYtsDuXIN171AW1JZ2usmJLGlSgR
         AZMyoFJRMXuLOvlTdADUvMYQlPyfH9/QO7nqgo7XmMdDv2wB0R0yf2Uiy9FbNZzn0NWA
         UGG0WDjTESlUR6gmZeMPX8MSdNk4Xrm1itVk/0yXQNOnLVcqv2X9GFYP/727gpVAWjpH
         Bggs9rnvAS4SFXhRr34tS7/qH2zjbGX22nn/uFi1Pr2rey7f3/TWBpj4r8yHb4kIwem9
         aqfglnQhqBm3sJsh/BpVbTIhGJwDvItkn8qKy9/w1fHx7u8MLlfrsTm/i7IDrur9qeDu
         v/AA==
X-Gm-Message-State: AOJu0Yx6UCkDThRG/QL1mzuk54PZr8DVA8p85DfclmT1F3WOJfjJgI0X
	EfZYF+529QrV4SkPRgR2YvOt6TrWuEuoWLzbmRaQuzqe9ofZaS1sjZaLYa/GPQ==
X-Gm-Gg: ASbGncubbhjqCzOFBY8C3TivzLXC/vUF7XwKo/EsmbKaIooZ9e9ht0Tz08tz6yPIrzM
	ZBSrALCRxxvThpaAv6NMHFmH+RS4B5dPlsfgMeP38Dfm40xF/XxlSbty+pBYAApPPA+MSSGyAVd
	//fLPHITR9o/pjqQQzCBx0kxZz7hH5DGk4oaOO5mTs9N9TeSvzb5RvxF+eewgDD2/AALaNu/k42
	7Gz0L6HcFXTz14SLB3yd4rsSZ3dFlUns3qpg40QHRt0DFK8vDuKihtR6pZ1c2MD7O3+aXgzJcnq
	vMPOWwr1/wkKZvnL3Za4NwtVNhtaDrlUprlS3aAELwTOLKmbu8F9GA==
X-Google-Smtp-Source: AGHT+IHd7v3l5gC+ULRc3VvMD4ILgDoSZwbG5Pc5B7gUogOGvMxCnx3dXhAQVvQfzF5QcQ4WhJ3dFQ==
X-Received: by 2002:a05:6a20:85aa:b0:1f5:9961:c29 with SMTP id adf61e73a8af0-1f599612c17mr9615691637.21.1741845649523;
        Wed, 12 Mar 2025 23:00:49 -0700 (PDT)
Received: from thinkpad ([120.60.60.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711578d15sm527696b3a.82.2025.03.12.23.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 23:00:49 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:30:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	andersson@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
	kishon@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	kw@linux.com, lpieralisi@kernel.org, p.zabel@pengutronix.de,
	quic_nsekar@quicinc.com, robh@kernel.org, robimarko@gmail.com,
	vkoul@kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH v3 4/6] PCI: qcom: Add support for IPQ5018
Message-ID: <20250313060041.27fdpovo6kerlyft@thinkpad>
References: <20250305134239.2236590-1-george.moussalem@outlook.com>
 <DS7PR19MB8883AB310FF217F669FE32939DCB2@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS7PR19MB8883AB310FF217F669FE32939DCB2@DS7PR19MB8883.namprd19.prod.outlook.com>

On Wed, Mar 05, 2025 at 05:41:29PM +0400, George Moussalem wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add IPQ5018 platform with is based on Qcom IP rev. 2.9.0
> and Synopsys IP rev. 5.00a.
> 
> The platform itself has two PCIe Gen2 controllers: one single-lane and
> one dual-lane. So let's add the IPQ5018 compatible and re-use 2_9_0 ops.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index e4d3366ead1f..94800c217d1d 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1840,6 +1840,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>  	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
>  	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
>  	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },
> +	{ .compatible = "qcom,pcie-ipq5018", .data = &cfg_2_9_0 },
>  	{ .compatible = "qcom,pcie-ipq6018", .data = &cfg_2_9_0 },
>  	{ .compatible = "qcom,pcie-ipq8064", .data = &cfg_2_1_0 },
>  	{ .compatible = "qcom,pcie-ipq8064-v2", .data = &cfg_2_1_0 },
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்

