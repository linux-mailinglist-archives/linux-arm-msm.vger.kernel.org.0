Return-Path: <linux-arm-msm+bounces-13538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 817AE8740B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 20:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2F701C216DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 19:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D00140E4D;
	Wed,  6 Mar 2024 19:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aVjqSzD5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F66140368
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 19:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709754249; cv=none; b=I36pTwaexF79tGTayWeYVwgB9RJ0/I52R0IebuZYIQOcsfEGnMHyMqf+6TB46T9faCU5lEqdP5Upb1cQBfTFbgGqI5qSqYnRZbB5G9+d7bcJ+SNwSgDNUH+46FhydIF9LAyzOK+MMFzor21a7vpI2aYpqGToQwh7yi0SbIBGjfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709754249; c=relaxed/simple;
	bh=U+62DFfvTUd9cVF7bW1OVpX/9biRZ2d6eaC3T0WRuuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3DhNxLWTqMWOpHCuT85bjiJkjmq7Wt8rolP6j+aagQQZC/gbx2Nb+cr23h2R66Z/8dEk4mhatWFNtk1AWJBM9QyrFrjDMGZrUTyC+PfuMgwoKi630+cbSimXACvlFOdAXyTub+FFUoe5v07Ve/HLuosdYVO69FdW3+sJPgVs4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aVjqSzD5; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6084e809788so10069887b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 11:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709754246; x=1710359046; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mJrG65AeFbyOONi7SjWLiuAQnFw+0U6EBjiSUZknhFc=;
        b=aVjqSzD55hjFDWc00bne2HbCTabOgQrKY2se06qTLHS4FcBShacJ2F5zeyw9904EGb
         5+4nUhCkBGcliBxUlUT6Yt2+wBaYNmGeOPOx2X3HM80SJ41H/5p13SixuQ52HhMr8xYd
         TArJS7MVvnuJHtmsWioSS3LpInDOBw832YOzMSNXtIQSvKxIJAJtRmf53FrpsfeTQV4t
         20n0ciNf02aJx2upgEO2Gf3rDTA70oyJgfPMgmCNsW7M1rg2bOdi9T/a2U7rW4zHxI/d
         CRjFhWCThofDL0uxnPDfuItXnkJwQGTCcnC9KV+k29B+D6Fes5oaryvc+i01OKPaeSjQ
         uLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709754246; x=1710359046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJrG65AeFbyOONi7SjWLiuAQnFw+0U6EBjiSUZknhFc=;
        b=FUYO4Z6dAoQPzMK7fxiN23u+efp2zZj7fGl/6c/zc6pSlK8b8SBjs1W+VB44IF2WbP
         acM7Uzbd/4Hhd6VnKp4C4tDtk54/abY7AZJGv+rIVtB0+NrYV6klI0K2AnGb0wQwrK8m
         IVUQpDVQvhRaTnGHaQJxsni2Oxcg6GoQI/JjvCVtRrlDZuT296gAv3Y1x4pd+CUsKJ/e
         RAptAX8oSkHKiWCRCmqhJ4m6HfwfzK5hYL81aSZ5BWsciCn8kNVKS2/10xSV9eThAuWZ
         SQeRq85dGozX1BJpxfNX9SZ9OZ1g3Yae31qZ6IHi++YvZrIaJEKxN2YD+5ObHut7xC82
         /4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/vwn7P12IcX+VyV8zab9llZeyEMovsnq/Fg0zEzRKze8uZIC1somIML3Fu/pD3jqw1Y9ruRmqL8BNExto5QCfBNQN2WFKHn+PsKQ6MQ==
X-Gm-Message-State: AOJu0Ywav0zL4Za79kVNF5naNp5H2yLHCuI+KEcR7etStYpFT+FoFtv8
	nUbeLFSfq5PsIUGuFcgmAm9h5tG1E8WOIvQ+yRqr7vLC12BeGwHTs8eNzNoymNtUy/Oh0CQUOXl
	c+T+epe4LXERrOLdcbQ347vf/vU8k026OjLHwTA==
X-Google-Smtp-Source: AGHT+IHV00hGxbwLNrRno0/EaPbba2Q0tqVKw89IXjITfrFjO9PtwLCLi8BInz+o5+AXsuIZ4okJKCw3DV2MFKFZRNA=
X-Received: by 2002:a25:ed01:0:b0:dc6:de93:7929 with SMTP id
 k1-20020a25ed01000000b00dc6de937929mr4891662ybh.26.1709754245936; Wed, 06 Mar
 2024 11:44:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306123006.724934-1-amadeus@jmu.edu.cn> <20240306123006.724934-2-amadeus@jmu.edu.cn>
In-Reply-To: <20240306123006.724934-2-amadeus@jmu.edu.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 21:43:54 +0200
Message-ID: <CAA8EJpqYjutM1Kh6QxysB6XNAmXywtOtRJ7KP0LbY5E36kCPvA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] arm64: dts: qcom: ipq6018: add sdhci node
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 14:31, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Add node to support mmc controller inside of IPQ6018.
> This controller supports both eMMC and SD cards.
>
> Tested with:
>   eMMC (HS200)
>   SD Card (SDR50/SDR104)
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 322eced0b876..420c192bccd9 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -441,6 +441,25 @@ dwc_1: usb@7000000 {
>                         };
>                 };
>
> +               sdhc: mmc@7804000 {
> +                       compatible = "qcom,ipq6018-sdhci", "qcom,sdhci-msm-v5";
> +                       reg = <0x0 0x07804000 0x0 0x1000>,
> +                             <0x0 0x07805000 0x0 0x1000>;
> +                       reg-names = "hc", "cqhci";
> +
> +                       interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "hc_irq", "pwr_irq";
> +
> +                       clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> +                                <&gcc GCC_SDCC1_APPS_CLK>,
> +                                <&xo>;
> +                       clock-names = "iface", "core", "xo";
> +                       resets = <&gcc GCC_SDCC1_BCR>;
> +                       max-frequency = <192000000>;

If I understand correctly, GCC_SDCC1_APPS_CLK support frequencies up
to 384 MHz, but here you are limiting it to 192 MHz. Why is it so?

> +                       status = "disabled";
> +               };
> +
>                 blsp_dma: dma-controller@7884000 {
>                         compatible = "qcom,bam-v1.7.0";
>                         reg = <0x0 0x07884000 0x0 0x2b000>;
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

