Return-Path: <linux-arm-msm+bounces-78296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDABBFAFD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 10:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C31C31A02288
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86ABE30ACE3;
	Wed, 22 Oct 2025 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G4vS6xCu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944421FC8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761123188; cv=none; b=r/MqVRsKR+JEAqIGB6bjn0L9Y+Mqxi0QAEotYkP5dJRqZxtM60Pg/wnIEvUirTL7G9NYT/FLBgdtKndM2G5CzEzgfD8K74k88HNRwMVWBI6S8+1tkhW03p6uJGoqrV3ZP2H33y2AAwt6/lejxLb78maFoq+Bz9YWXrlGRuDBoRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761123188; c=relaxed/simple;
	bh=AlKCgkSnSSPFD9Skbx2D0rMe1wy7Q92Jl+BlrTjwwZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tb3ffU9RPKWoWmcDcpifXHOo3f2mGxZd1zZXW5dhxn6cqJ2/Q3mLq89roEqptqF64r24/YLaJVoeRofSuFS9gsHiz3mNTsKz2X2yGXrQGr0YwQKIDQE0cmFzMipg851AzMIqnp9MLKXEU4qkqJyARbASYvuXGXAWKd88HPm4DWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G4vS6xCu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so36703225e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 01:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761123185; x=1761727985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1VMT8mKYgwMl8yULjLBpYiH70IVjoTMUBL7pjvnp2wU=;
        b=G4vS6xCumFze4PR247HPqJYnkGR9llZ6rtlALjCnSKX74MYDu2f4Ot6NQrJXdNlH/5
         sZ9c8lEqjTnBf0H0cooxsz/5q74PKFm+WolFbi8VmJOwz70X3h5bJ7w4088mK+gqX8HM
         ff3he7k/0PQcLGI1FU7ZJtqQaYqHHrp9YA2vWKC8WYAh9wXfqjLvvXnt1EWgGZFSavKF
         Kj34zx9lpF9r8pF/21lmKCU9J1KZqDy8uJ7A0+Qsj508CJLTkCUgQGc7B0Zk1HIZf+yv
         CfizMTFh/1py0kB4O6J3q30+LpjjbiYaMN9zQbIILr+K8pJqV7g/uMKycFjPcCKudplp
         Ixww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761123185; x=1761727985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VMT8mKYgwMl8yULjLBpYiH70IVjoTMUBL7pjvnp2wU=;
        b=Qf3VOAw4/LKnrR6M49Xh4HTkIjUdlrHRxZbCPflby12Ca8t9iYLha51UQj6cE2jrST
         l3MrGvAe4InIzwm9SaC021a/b4rXB3Lwn/8ZSMTMHzwkrC1HZptBGOM/Rbd2oWToae2m
         mwz+VJS4tq51XV8POTsQabAGargZFTGUMsWR6Jtn6teTKHbIpfFIvA8RlZtyvNCCO2em
         DD3pTpm5xfR9gzpGM6Ond916+7H0nX/ASZFwVNylXk9QZbH1ofrKQRBaKKo+iuH7Bg7t
         l1hVZ3o2LLUhLaK1jrJgj1d6JPAvrHUNQn1ACGSmuKnN/wUQPqQ/43eql0yIjf6uA1Gk
         yarw==
X-Forwarded-Encrypted: i=1; AJvYcCVtsmnB+8A0BzlCzqVL8HfcVrIyljxEjrM38URJZh2cWnm4TxwTcgotcx3HPza3L4kwD5ztwRxBdbugkqiy@vger.kernel.org
X-Gm-Message-State: AOJu0YwcjSzB4d1alDCuR5PT8RenZpA6HQgqLq1GDeZlJbEGM4oGh4j3
	LEOvEIkdSg4BnK6fruMzSrGkxz+X1gsGK9T6nGGl1nCDpAdol6BDJsZSjT4c7bxAPss=
X-Gm-Gg: ASbGnctSWkUijoYoOgjhKb9NTFO/yNwwjA62wyWQd04M0sLiZ8x69UA7t8t8wS/b9wL
	1cDnlOL875nSim76lYJRRl+90DPbKE70eM/grAzIQka70xP72az6cQd40RH6xqYVNM0FnrLMngQ
	UWmRs3ObQ818VdvjqyUAHZo4Ky7AxwpT07kPwKhKXOh90FQI/X8LusaR3zZFfHDSqYILpq+UC8u
	XfNnlbJjIJyqC0xlCVZNnD44ofPPc4InACB66b6yb30uM5UARESKA0nHWKYh7JRkjcDYLSuhdJN
	EvqvVO+5SvFnfdFypspGFTNlvjNMwUxqN9MBeXCgzZq8OHiwAZEudqoXOW+8P8YB6W1UnuE2Fea
	s3Q2OQWMcc5bknx8WgmTpRN2bnExWOpPxjmZh7mFLkd4OZSctqqa+va8qIrwNQFwGyN47J192TZ
	Uwh+otGb8=
X-Google-Smtp-Source: AGHT+IHwyfFfA2sTV/MUe2VyGQQg2MXtrnaRyMgy8UiRtfTE0dePiGALEoLXmNajHTlU4ohhAIWQFg==
X-Received: by 2002:a05:600c:3513:b0:471:1415:b545 with SMTP id 5b1f17b1804b1-4711786d625mr156424065e9.7.1761123184620;
        Wed, 22 Oct 2025 01:53:04 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428f709sm34692415e9.8.2025.10.22.01.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 01:53:03 -0700 (PDT)
Date: Wed, 22 Oct 2025 11:53:01 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	Qiang Yu <quic_qianyu@quicinc.com>
Subject: Re: [PATCH v5 6/6] phy: qcom: qmp-pcie: Add support for glymur PCIe
 Gen4 x2 PHY
Message-ID: <rxju35izazp7zrzs6vyy2cxuynzc6k4i4iot5pjahwl2bfoka5@cutpfodvixmp>
References: <20251017-glymur_pcie-v5-0-82d0c4bd402b@oss.qualcomm.com>
 <20251017-glymur_pcie-v5-6-82d0c4bd402b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-glymur_pcie-v5-6-82d0c4bd402b@oss.qualcomm.com>

On 25-10-17 18:33:43, Qiang Yu wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Add support for Gen4 x2 PCIe QMP PHY found on Glymur platform.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Since this is something I already sent upstream here and it is more correct:

https://lore.kernel.org/all/20251015-phy-qcom-pcie-add-glymur-v1-2-1af8fd14f033@linaro.org/

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 86b1b7e2da86a8675e3e48e90b782afb21cafd77..2747e71bf865907f139422a9ed33709c4a7ae7ea 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -3363,6 +3363,16 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
>  	.ln_shrd	= 0x8000,
>  };
>  
> +static const struct qmp_pcie_offsets qmp_pcie_offsets_v8 = {
> +	.serdes     = 0x1000,
> +	.pcs        = 0x1400,
> +	.pcs_misc	= 0x1800,
> +	.tx		= 0x0000,
> +	.rx		= 0x0200,
> +	.tx2		= 0x0800,
> +	.rx2		= 0x0a00,
> +};
> +
>  static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
>  	.serdes     = 0x8000,
>  	.pcs        = 0x9000,
> @@ -4441,6 +4451,21 @@ static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
>  	.phy_status		= PHYSTATUS_4_20,
>  };
>  
> +static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
> +	.lanes = 2,
> +
> +	.offsets		= &qmp_pcie_offsets_v8,
> +
> +	.reset_list		= sdm845_pciephy_reset_l,
> +	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= pciephy_v6_regs_layout,

Definitely not v6 regs here. Needs to be v8.

NAK.

