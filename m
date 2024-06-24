Return-Path: <linux-arm-msm+bounces-23845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C802E9140F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 06:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82140282F1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 04:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B7079F6;
	Mon, 24 Jun 2024 04:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vuqg5stB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B172E6FD0
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 04:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719202282; cv=none; b=ucWuict30ArlIDPUhiLjG2RloWqC8W4e1J/7Y6BEshJSIckBeTGq84bBKifb6qy+AVTbwGyzV94YqUOJ8HqnJK3ohw81Lwf9VzVyqTuGzx30gHrlsCvzPUt/Y8ism9U1xtapA6lyA4UQXeTN6LVOMyCc6fRxq9Wo7/n1qTXyIPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719202282; c=relaxed/simple;
	bh=9u8o52EWGziA0Df9Qmtvc0vTwC7W/h7kedKatOM/y1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGgq2aH2Wu8XQsDMgB/HnJ58AbdvYsJ2CsLPmQpNnEobAyzxbQ5jUhhFB91FNObs6w5TP3hy7B3mS7oM7lcKUAgrDRfzHeS8qUoZr6V1fySeF9bZ2ybIU7YyG3Lu8yRPjG3qHOvaGht3RoKzzoF5zMPvGd5dIkAO0QCZjFdU+0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vuqg5stB; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f47f07aceaso29933675ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 21:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719202280; x=1719807080; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JNrb55ZnmxeoPLWrQNF1x0WvyveJ4F7DKPXc18CwF+4=;
        b=vuqg5stBCmUKDgGeoNrAmGd0Pm3pd0vGwJRvg5ALX+M7oMwjxpiPfEtvhOcqfwgcMw
         bL3bsmiX6Cj/GGtHHmKJUZ+KzQ/r0sbQrffOuHWAevr3XpORgEzr4Hd7luNQZyf3UdZD
         lXY6p4qRzjO5DdqXEnUMrv0J5pf8JR2gIVylK4wuJ2wJsmAt7tHo0sFip5XS5F0oV+79
         uAh6yGaFYg3ReHrAbNkTs5kEoQSxC9Sc3hu09TxHMF8yyMkcBlrj8iRPfaKxFljvf0qC
         lBx/YuqZX7v2kk9Skb11OTZjyQol7KC2bsE4Bcb6aecUMsjYqWCGdrBtcESrvSFkBYql
         CdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719202280; x=1719807080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNrb55ZnmxeoPLWrQNF1x0WvyveJ4F7DKPXc18CwF+4=;
        b=iXTJEHmX7vdpaxuiavKYMnKPw/KcMjxhvp7ByE1Cz50cONFB3AArWTUeVvAjpn6PtJ
         i5EIYTtDCD/4oRKFPJD1iVn/JgXzNIN7YveDIxNe4XGTMUcH2CGBuckHVB+39bRpljLg
         PFwbU1VGWGgD7+V/5fbRFhbZocAvmWD1ZAhficzzochrLQrNhT87ou95bQQg/K0rK9pW
         NZkFC5GTt9B7hzhkbAf4lQBTY8WaaJPxE8TKobAjULfFDH3nW+DmVmjgGWq3UdIsWeEH
         PEoN/sKsZQRHKXT6yI6dhWyMR/Rek8BHMEVPD0BEzRvtdk4QwwPM1hCGwFIqD9wXos3Y
         UIpw==
X-Forwarded-Encrypted: i=1; AJvYcCUXQOIMnDEBYaqfmPAh30PNoryNkiThZQSZPvELRrA2l99C94HmY2zgn+1cTp2GDSvDDUYTZJSl/Vn3uO+prS46IXYXBpXSbZsvJpz8/w==
X-Gm-Message-State: AOJu0Yy3kz7PKesjewwXchG+CER1yy01ltVMyyf1fgjVBftAHD3AnLbu
	gGWqfrnkK0uqpqHQYDFo6nqhIqiLI15ygyIL8su6W9wWp0Mtk004Oe4xs7cayg==
X-Google-Smtp-Source: AGHT+IE40mJUbLjZTjhBUbiX2PjvjDfMIW/+xRH0/mNF4kLsH0BV+JMXKi371+iExmIKX0c+N42rXQ==
X-Received: by 2002:a17:903:32c4:b0:1f7:2a95:f2d7 with SMTP id d9443c01a7336-1fa15943813mr53029915ad.59.1719202279886;
        Sun, 23 Jun 2024 21:11:19 -0700 (PDT)
Received: from thinkpad ([220.158.156.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c5f7csm52448915ad.140.2024.06.23.21.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 21:11:19 -0700 (PDT)
Date: Mon, 24 Jun 2024 09:41:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org, quic_kathirav@quicinc.com,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 5/8] PCI: qcom: Add support for IPQ9574
Message-ID: <20240624041114.GB10250@thinkpad>
References: <20240501040800.1542805-1-mr.nuke.me@gmail.com>
 <20240501040800.1542805-15-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240501040800.1542805-15-mr.nuke.me@gmail.com>

On Tue, Apr 30, 2024 at 11:07:56PM -0500, Alexandru Gagniuc wrote:
> IPQ9574 has four PCIe controllers: two single-lane Gen3, and two
> dual-lane Gen3. The controllers are identical from a software
> perspective, with the differences appearing in the PHYs.
> 
> Add a compatible for the PCIe on IPQ9574.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index ea81ff68d433..e61888e6c63d 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1551,6 +1551,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>  	{ .compatible = "qcom,pcie-ipq8064-v2", .data = &cfg_2_1_0 },
>  	{ .compatible = "qcom,pcie-ipq8074", .data = &cfg_2_3_3 },
>  	{ .compatible = "qcom,pcie-ipq8074-gen3", .data = &cfg_2_9_0 },
> +	{ .compatible = "qcom,pcie-ipq9574", .data = &cfg_2_9_0 },
>  	{ .compatible = "qcom,pcie-msm8996", .data = &cfg_2_3_2 },
>  	{ .compatible = "qcom,pcie-qcs404", .data = &cfg_2_4_0 },
>  	{ .compatible = "qcom,pcie-sa8540p", .data = &cfg_sc8280xp },
> -- 
> 2.40.1
> 

-- 
மணிவண்ணன் சதாசிவம்

