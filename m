Return-Path: <linux-arm-msm+bounces-48608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E17A3D22D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 08:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 739D23BD4DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 07:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F481E5B68;
	Thu, 20 Feb 2025 07:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="agtM5qoz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B17F1E4937
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 07:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740036202; cv=none; b=o6G+rPXK0rWZUsS+U5j2ccIIK1KA45Wo6XGermg4kWz7uoWhap0Zl1tVjt7MgwAIQtibQmVELSCtDTk7jaGsH4LE5uqcmiJrN31icL8q8TUjkg86vjieQhjWZX+kcGK6NUY98/fTMQS/4LmngJn0tFkcJu9VVd0L7WNSmxQMQQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740036202; c=relaxed/simple;
	bh=K9ZzoyM+1e7NO7J3zZUXwBhWI7XOqAzjHQnjtaar3Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMlmU5OqDDW3xFrjiafGhr/Nxq3p12xtWd/OVdk/lBFCmBrfBdRa1SDJjnQ5fhX552i9EtvwftQ7hf25WASft4YlUzK+STmqparrnivqm/FpAXshMuz0umOcRZVq7nH+qGAS0XZk1Vz4nA32YnzA0XY0WKcDwyf0j/EQxRDnpIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=agtM5qoz; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22114b800f7so9651425ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 23:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740036201; x=1740641001; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MBR10xYOtbIjIrHbSQCuv8sZHXeBgnoMVNUybGZJ2DI=;
        b=agtM5qozeRV1lBkKO8JEekz8289DS0m1DLp0uFYMR9rAJOJw3bZB5H1vYUcZ0OOyqd
         YX/5aPXLMgwb/JTmZ9PB+dDjUQa6f1MO3a7ST7jCUvHF+SqcBEWykwqtLpsyHILyxg2K
         wE+cgorKR7jMmQGHOnPM2rGHp7BrqyVAJb3mKVLzRkbvonI/xIz9YKsN3lgghMxe8hd9
         Wty+AixQLkbAg019zbSleNakrQwFaiN8fGswDJJbwA212EDCMAkzQ1C1aIDTXwScAD9B
         3uPESW7AvdDE5sMBBW/3HoMBefDngooH2bMoL1XyTpGnyEXB94fP8FVpHmvrgnC49owt
         80fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740036201; x=1740641001;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBR10xYOtbIjIrHbSQCuv8sZHXeBgnoMVNUybGZJ2DI=;
        b=vlCRVZxmJIUVn/x9W8IuU+r4ccmESe8MWehjd93rv2f8AiDVmJoss5w+o9f8FqcxRS
         PfKTvy/3LW8ZJ+H8kOwfp9rZ4J4EhKLOCUw6HxTB0fo7aSyjuqOh2H7l20rouv07TX5r
         Frt0Is+su0mVjSlybeLvcP2/emHm5W8sMk6XmJtmy4jkNnEgp3ywtVgEb3agXAPP221Q
         HlMyTVLarEMU7KQYnv+PbcEn6trrVdDmiOzBVucSiorhz2CaoRftfuQRheeNjGWSjXA5
         iWbnBOsRevJ/6Qz0QazYKQhEuXU6xxhsNDROtdwWlcs1W8sgyezokA4/+AmV4uM/5MLi
         0t2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDf/S+R2wRVmywgmdcjnAnOm4JCEtCmDyzxi+Iyc2x8734YDTZvO3Qiuyr5VCgXMwbGoOrGYO89/s+1Uwe@vger.kernel.org
X-Gm-Message-State: AOJu0YzchEZ0mMK1gHtQY34xXypBzHvZtRUWJmNlPf1kXDRW8dqh794P
	2jnUsE/Pl4Yzbmc0XSehkB8Poo9atKdurjHkBkClr21Mq8WtwhaHDEbVUh6PGw==
X-Gm-Gg: ASbGncveJiMCsEaNax+xn0I+vXXmjK2dGxMxNRmFYcqSuYDpzMGLe6S4eeheugtKito
	9dwe7BfVRql2VKEglH92rbs+7+jpGidahpnyRT5XxVq1MaVn3KLySCwt98V7NRPcc0IUX1OZEdQ
	xhPyZDfQTk8Jj5OZaj5XIyurgPQ4iwLVCayn90FyDPYALSjtLg4AHQQUvqCtAPscLTA/fJiDRe8
	7p3O31oYx0NFvdLlvLUmJcKaARqvTHmtqr/zpyNRskiepEvOggzXAYZYCXC1G+LKJrE7LP0Uvkl
	9ZSNTuetFFt7r01bCGlgOe7Nng==
X-Google-Smtp-Source: AGHT+IH9J0UpkJyiDrwNycJp/VSjSgTQ57aAkzHJRzuBfh3r1oEjseg2xJjXQ71AdNSHN8VrWOQlLw==
X-Received: by 2002:a17:903:1d0:b0:21f:3e2d:7d58 with SMTP id d9443c01a7336-22170773856mr86334165ad.13.1740036200747;
        Wed, 19 Feb 2025 23:23:20 -0800 (PST)
Received: from thinkpad ([120.60.70.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5348f1esm115522325ad.51.2025.02.19.23.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 23:23:20 -0800 (PST)
Date: Thu, 20 Feb 2025 12:53:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mrinmay Sarkar <quic_msarkar@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] PCI: dwc: pcie-qcom-ep: enable EP support for
 SAR2130P
Message-ID: <20250220072310.kahf4w4u43slbwke@thinkpad>
References: <20250217-sar2130p-pci-v1-0-94b20ec70a14@linaro.org>
 <20250217-sar2130p-pci-v1-4-94b20ec70a14@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217-sar2130p-pci-v1-4-94b20ec70a14@linaro.org>

On Mon, Feb 17, 2025 at 08:56:16PM +0200, Dmitry Baryshkov wrote:
> Enable PCIe endpoint support for the Qualcomm SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom-ep.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index c08f64d7a825fa5da22976c8020f96ee5faa5462..dec5675c7c9d52b77f084ae139845b488fa02d2c 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -933,6 +933,7 @@ static const struct of_device_id qcom_pcie_ep_match[] = {
>  	{ .compatible = "qcom,sa8775p-pcie-ep", .data = &cfg_1_34_0},
>  	{ .compatible = "qcom,sdx55-pcie-ep", },
>  	{ .compatible = "qcom,sm8450-pcie-ep", },
> +	{ .compatible = "qcom,sar2130p-pcie-ep", },

Could you please use a fallback? I'd prefer to not add compatible to the driver
unless it requires special config.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

