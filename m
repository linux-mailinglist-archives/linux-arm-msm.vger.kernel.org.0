Return-Path: <linux-arm-msm+bounces-50308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FF7A4F509
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 04:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C49531664BC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 03:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1A41624F2;
	Wed,  5 Mar 2025 02:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhfcpH3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C911E1547E9
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 02:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741143597; cv=none; b=bSJmBSS8N5Hyv+gYx8ABRhNBIakhxJUEIPwrS8DGZIWt5IcDgzqCjEIK0YnF09yEIgFE8+FwTFR4jzfSsAFuP2WQze8ERP2OpO32tKtmEsLINTaUFLuLvuksYLELxBihw811SpthRKm0yysCH+uyK5cK+SuOeG/5W67J5Vc5ezs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741143597; c=relaxed/simple;
	bh=mPfqHmUHSKSQaPUHjpb/9HaN5cORCw2qlntCpea6OSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBMnJd5PvKNrL1npk0MORO1pZ2l0kz2BeT+pvoihuP/SDPc1egaOzk8MIcgib7C0FvjBE2Vek/HT6uqiAkYjBE7y/bOv6N7jrEvlUv9HS5geiq7chRr45IappmKXwU+BiT9JQEaZt5bmOJ0IHmSN4UISqB/l3+Neph2O8628J/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hhfcpH3D; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30b936ffc51so41824051fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 18:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741143593; x=1741748393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WJvKJ68rlC+sLGTBZdabg/gqDqFQctmrcG+n8a+ztWA=;
        b=hhfcpH3DgQDHlNmLDjqVdm7pv7/hbZyVaAikr+HqQjlP2ZoLaXUf18cpGQerOi0QN9
         rore8oT+1oDsxSwkjZAaKEMyrjAUQrQYvYphBj8GR56FIo/i9hR847DWKW4K31QWh679
         n7bcbLXWNakusR1jNmx4tMDsQuJn4UIraeraHt2wJ/JGvstLOPs7ra6F9L4HwWL4Ve1c
         ncoI+AWZSxl0xYw6emH1iqCPWax4Q6iDaCYLyuMi82i+8a8Z/cgvKuj9eniLF2YygUmU
         ee21AaQnfD9H88fkOA413xZg0K66ZuADh/4YjfLt6hRHOaa9ULx1qlh0LCSSPhRKquI2
         jNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741143593; x=1741748393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJvKJ68rlC+sLGTBZdabg/gqDqFQctmrcG+n8a+ztWA=;
        b=AdqRhKun96VXiVxSm5Tvu0jLJKauJoNBRvQuQIIan1m28mVYlqm5YhZ9pfEZmlFKVS
         hUdYBu9VM76hXqTz6NRSB6GTMaderKuBdP/MXkRLIQ8rVfa8eNXPYzLFlfxNo3IDh5GV
         ob3VVH6Tj/XjGOUP3bf6maurB1zwoCa9LidoiNIuiSSkvksIPFYwg9LmJNJ/fJXol/EO
         ay9EO1WF/B3WX6FZg4pjXIJcDkTON/pES3Vxo8ZESCjThKOIsqy+XoUPQ2sZ+5hX6RrR
         oeEXGiidT+RtTapquL8sEt0rKJCWHftS78F1eWUV6k4YmvB1AdnyEAlFONj3AjSOU3DH
         mAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqVnGO16ZybTjU3s91ZcL1SSO2P+POhDFgP3hhTa4aFJX5DoE2OjuwAI6B47btlAr4l6xEfOKBYqZ2Lmip@vger.kernel.org
X-Gm-Message-State: AOJu0YyuiU7cBWSQRItGh0hFwSK+DND2E4X5TZsMxyNEhvXnvxZOmDpp
	Cv8QCOXX/1UttXU0XpybO1gpq9EkTcx93aqZFtJ+wtU3ujwlFgdHbVz5Q9f3Iyk=
X-Gm-Gg: ASbGncuPdQ9CLkHz6AdrLfOAcTlgMPy9tMjoI6GR8j3YcRFWgdxvIOnEf6T6U04rqQp
	gRHlcSHyMeTA1suE+vWzd5nOS0hCfX8vu2A05XxpKf0PSy/u/8WHfxC0RIl32lcCSorsLzkEsFa
	wmO8eZtNHCB82ShA0Hrog7mNGUBV29EgpMIA/1t1Hf4ASMGeGVLNzy1txsfiESzjr545qfOJc2+
	+tYnffiv7dULhU2RKukplBuoY4XuUrmEWGLGxoYgIyQJtOfRrPp1yX+QTjJpveZizNgxi4gfvTU
	gx9Cae4sd7nt3l1WamKxppCWQJuhe31xUvyyd5L9PYXwW18XX7pXRjdS/Iqj4SnUWv8KFpAXQDP
	Famua/oUzbeJQ60Xkd4u0X+nK
X-Google-Smtp-Source: AGHT+IGkLyEj88NKFgMk5Dc/qcrMMu5c5mz/edvqKr7cxRFirThc+Fkx33VXvY/6F71lJ9O4B98xLQ==
X-Received: by 2002:a05:6512:ac7:b0:549:39ca:13fc with SMTP id 2adb3069b0e04-5497d382f6bmr469921e87.49.1741143592852;
        Tue, 04 Mar 2025 18:59:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54962415d13sm925305e87.257.2025.03.04.18.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:59:51 -0800 (PST)
Date: Wed, 5 Mar 2025 04:59:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 9/9] arm64: defconfig: Add M31 eUSB2 PHY config
Message-ID: <xgryihmtcbvhimm4fr2pcrhjcwdp6djfrgtwj4a5kl4tukeavb@de5irgx54w5p>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-9-a698a2e68e06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-9-a698a2e68e06@quicinc.com>

On Tue, Mar 04, 2025 at 01:56:42PM -0800, Melody Olvera wrote:
> Add configs for the M31 eUSB2 PHY for SM8750 USB.

Please use git log on the defconfig to check what is usually required
from the commit messages. The defconfig is not Qcom-specific so you can
not expect somebody to know what is SM8750 or why does it require a PHY.

> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 3a3706db29822036d25a7228f8936e2ad613b208..7a7187475a11206e708a5a2c6dd51736e16932e9 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1587,6 +1587,7 @@ CONFIG_PHY_QCOM_QUSB2=m
>  CONFIG_PHY_QCOM_SNPS_EUSB2=m
>  CONFIG_PHY_QCOM_EUSB2_REPEATER=m
>  CONFIG_PHY_QCOM_M31_USB=m
> +CONFIG_PHY_QCOM_M31_EUSB=m
>  CONFIG_PHY_QCOM_USB_HS=m
>  CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
>  CONFIG_PHY_QCOM_USB_HS_28NM=m
> 
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

