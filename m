Return-Path: <linux-arm-msm+bounces-80980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A02C460B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C81904E2D18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 10:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225C4211A14;
	Mon, 10 Nov 2025 10:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LIT+guEJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805462FFFA8
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762771736; cv=none; b=ufBAScWBZdcpBgErS4+RMwiNoN3QT/t7kv0XusmegZxetufU6z4xlRTqm2L/oST+4mn3eSIArQGCKqjwiZPMMv3bvYDW9oZEL32IH+Hl5iRfqXOzj1s3wXew8v/YIaj607LaOWseyD+CuQjIdPN4vWi1S+7rYcaEWi5CCzMJDCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762771736; c=relaxed/simple;
	bh=xrxwoznpXpxNSfNbja8LI6AG/5ekNGybu+V3S1CSNQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjUh/gXqQfn+gCawZ02cPhUQ8H8r7AWKGnjPaEpK/8YRfwWl2+vEPP08Jn+IBDvdND00MGZuX1lCA3Idjsa3d1collzNMEFM7GCrF3Al/KGD7qZTHywJPYzlLve7o3fxiCJCR8B/dOcqnv4xkA2R51hFmlDP7Orizuz85WyKdHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LIT+guEJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2981f9ce15cso8180015ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762771734; x=1763376534; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+cJ0HZa/RIQ3oZ9bdzNteTdSwTIuu4RhJvYmWAVNz08=;
        b=LIT+guEJ1I5Z0jOjLZ8hHfBipi0MTaV/dK4py9deFJ3fpUB6a4PO14NHgX7AD+BcEw
         JwQ1V0Rvfmpay6Oq+iVrVs0sSwT4RzOJWkjva9THjhoPcjOZEXguwA6avgrDxYzpFtgx
         P3xbd51v0k1j/ybNzpjLfqftUyk2cWxajAKAtxhKReQla7RbR9heY1VcfynjkOhuBq/p
         CbHjhSjwa0sThA5TJqq0MZjAE4L3AVivVBVzgeIkSiPS3OoIPGDyYYYzBHfssGPOAee/
         z4F4NWjSfGvox3JP7mwbaaw8oYAaxxgvADNqUJV4PHmNcoY0GIgarnfhLoNlOaeEmxqs
         Vrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762771734; x=1763376534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cJ0HZa/RIQ3oZ9bdzNteTdSwTIuu4RhJvYmWAVNz08=;
        b=eEsSGc0yUpqgks3UOZeiL9X55pAs0V2ybGa6zFYnNb850jE6ZY4BLsSysb93AsYvtw
         cx4O6YHIZQd4AsYwEXMHubU1KKt3ZxPhDlLUxKwmv5Tx4V/hRSnQlP2tVan/yXyP4k92
         g+TBjoy59dJ2gcHdFs6ojsKR8R6QNU9gsJo6HAVUBvEMR5Ly6EbiSMy64FGGa2jvQzBS
         xy+C+HszXvTLUSsD2xBh3KnanhopZc7HkVwY/wDeJ1vXib/O7E7dxF0MGfN0e5x/pZ7O
         PampM0v3VdT7gT2g6adCKU2yHX7dDzXb+wVYWLTbwHLEBANN58Yd8CopC1NFUxY3b+2a
         6rqA==
X-Forwarded-Encrypted: i=1; AJvYcCUFzXzQ3yg375xJIM4M7hqbUoGOnF9r+AHi+wLFTYGTR7dPlckWdke1lawz2kwd4v13oK14Kc4swKoPz9Qv@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbq/00drqfk2aE2Cbe0ofbNKTHp7XGMHeg9Jazh87oY472ttrj
	YZd3E8EnYt65/xXgOrkMbHYDobmwrNOQLOM1dMduVpm7rgKEKTD3bFGVTAadhx002OstBuzM4Gf
	M08de3mT7k/IiPRuxs0u5omFB/E2+MvyPux119KyFxw==
X-Gm-Gg: ASbGncs3Zh9f/Qg+0nVxqakVOtye9HRjfLtdGATyKx4tk1Y8I7n1Gaa2yL5/ks5bKK0
	wHdhlWVouu819X04yRBZDQheDEnC5U+aRS1FVlA6/IrkMFdUHd5dmuW0Y9Z9Bvoww00NPNAFgwB
	hJpuR0Yd4Z+cs0K1QileVYDor9pX7cB/z9Ib3CX/KaHZGFnf/ChQZLBwMFk3qPXDthA+O7vUQtF
	50Aej5rycKQstf83US1nIzaiFIXfIbkHV4Fe2qdrDZQ1ijNroO8aGUls17lAKtpLK+UOnkHaafE
	h2FwqjS08IwZng==
X-Google-Smtp-Source: AGHT+IE0FRG82nD93aofUD0cfwt+8b4Cf99CbEmLHNKF85pla2dK3w+D2zv8As6P254OUXAtQqh7YN7RNUqhVZAS+EA=
X-Received: by 2002:a17:903:41d2:b0:297:c0f0:42a1 with SMTP id
 d9443c01a7336-297e56d0d34mr99121845ad.44.1762771733753; Mon, 10 Nov 2025
 02:48:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107044319.8356-1-manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20251107044319.8356-1-manivannan.sadhasivam@oss.qualcomm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 10 Nov 2025 11:48:40 +0100
X-Gm-Features: AWmQ_blifxa081st-IFJuyykgPdA-ffOj8SxBaRYKjoJg0IU0sOOhKrJk_VvJmc
Message-ID: <CAKfTPtBd=D9gTfyfcAjH8ucMtDFP-7jZHkZq8HN+yVCnNmK8Aw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] PCI: dwc: Check for device presence in suspend and resume
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	bhelgaas@google.com, will@kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org, 
	zhangsenchuan@eswincomputing.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Nov 2025 at 05:43, Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> Hi,
>
> This series aims to fix the usage of dw_pcie_link_up() API to check for Link up
> during system suspend. The motivation for this series comes from recent
> discussions [1] [2], where developers wanted to skip PME_Turn_Off broadcast in
> dw_pcie_suspend_noirq() API when devices are not attached to the bus. They ended
> up using dw_pcie_link_up() to check for the device presence due to the bad
> example in the pcie-qcom driver which does the same. The usage of
> dw_pcie_link_up() API here would be racy as the link can go down at any time
> after the check.
>
> So to properly check for the device presence, this series introduces an API,
> pci_root_ports_have_device(), that accepts the Root bus pointer and checks for
> the presence of a device under any of the Root Ports. This API is used to
> replace the dw_pcie_link_up() check in suspend path of pcie-qcom driver and also
> used to skip the PME_Turn_Off brodcast message in dwc_pcie_suspend_noirq() API
> and to skip waiting for the link up in dwc_pcie_resume_noirq() API.
>
> Testing
> =======
>
> This series is tested on Qualcomm Lenovo Thinkpad T14s and observed no
> functional change during the system suspend path.
>
> - Mani
>
> [1] https://lore.kernel.org/linux-pci/CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com/
> [2] https://lore.kernel.org/linux-pci/27516921.17f2.1997bb2a498.Coremail.zhangsenchuan@eswincomputing.com/
>
> Changes in v2:
>
> * Skipped waiting for link up in dwc_pcie_resume_noirq() if there was no device
>   before suspend.
> * Fixed the kdoc for pci_root_ports_have_device()
>
> Manivannan Sadhasivam (3):
>   PCI: host-common: Add an API to check for any device under the Root
>     Ports
>   PCI: qcom: Check for the presence of a device instead of Link up
>     during suspend
>   PCI: dwc: Check for the device presence during suspend and resume

You already queued it but FWIW
Tested-by: Vincent Guittot <vincent.guittot@linaro.org>

>
>  .../pci/controller/dwc/pcie-designware-host.c | 13 ++++++++++++
>  drivers/pci/controller/dwc/pcie-qcom.c        |  6 ++++--
>  drivers/pci/controller/pci-host-common.c      | 21 +++++++++++++++++++
>  drivers/pci/controller/pci-host-common.h      |  2 ++
>  4 files changed, 40 insertions(+), 2 deletions(-)
>
> --
> 2.48.1
>

