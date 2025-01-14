Return-Path: <linux-arm-msm+bounces-44987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAB3A103BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 11:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC31818891D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 10:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FDA22DC4A;
	Tue, 14 Jan 2025 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i3dWHoVv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E8222DC28
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 10:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736849549; cv=none; b=URPfni3AeqDGt2tyvRe4Z5aot/ptLTAoX8F4M39y1gYr3ftX9H2ikEnGoWw3FJmCgiyu5oIunlQI3lTByZ6JPKkFx+1LSat3cepOy+5YCBINr2EFFFToJmWHFQfCUxTNy4H5nMxboN3+uUWBXzgu6dSh+0qw+/05ecDHtLYW8BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736849549; c=relaxed/simple;
	bh=tMig/yT4p4lBmM/9IHHaHq3sOjkzmuVCPMQbW0c1APA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itAebvvZMGUaO8ugQCnv+Hb8tt+lGQOaPPtfRqmV9Rze9GYE4gYYN+F/9gDjoA6zWn2dsgnRAyvBv/uiRIyda0U6DkiDKR67OTBW+VMtsY0iIdNStxcWDz+x1kGfh2MRV4hNrENgjiwMKafYhGtLLQnsMqsx0o04ln9y+FpbMzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i3dWHoVv; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30613802a04so28608781fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 02:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736849545; x=1737454345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c0Qrzgg2ua23heO+J/1apVMe+JOEnRWPI3Yz+eSCuMc=;
        b=i3dWHoVvDG3grs/kTS3HFcqBoqPtT7cXT9CG/VZvcTajfueLyz2pDZ/bkK3U0vYMMA
         xEQWZRe69l4W6IcHborajE2yde/ymZ4KJiH6aDN/D6noIH12q3nJ7+lyWYKtyuzW3Wwv
         ImlgxoB3QcETinU28ux3Ajy8BFem8fXUYO7w5Lfx+IQ5/wee0wBq2lEGAZa5pT6KrVXQ
         izMh74nxUfMyCr4/G2vRjEuytHiEpfld36EynK5JkVr2+7KG15sI9AYijP/Pxar6wdJZ
         mSKie+YxI1O2n+o23Ha5vwMiC+Eu53eRcdQjbR5IUzaVlgvsaghmPAPXLoBRQS/6dahy
         6/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736849545; x=1737454345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0Qrzgg2ua23heO+J/1apVMe+JOEnRWPI3Yz+eSCuMc=;
        b=K7jTwsyj72+hDcsYchsybe/E6YxMlWeV5XqAs1mXG6H+RGVawqkcu6VZ6oYXC7bixY
         sr1BNasWoJL9JOoWxSRFtbYmKF9WcHjNXjpkGV7O2HeT6xzR9UIl/gNGLBz1I3U3DBAK
         Dmczb5lClTwPb7rtV8a51E/1G0CCEu+zXqAgAcAjCj2ss0N7Hy1wg+r1qS2n9VdWs8wT
         KQN08IeS43BjxF4wD6GoXLGb1FRdmOIL96rU+Z1C00uBTvB208e12eGC708msgwSagxF
         XPXS4kbKLVz/3ReI1jPucQ5NzOSZNKhz8k3zPUhmlsZJQSKmGMrdkR7ykXJaUv4Sbk9E
         FjYw==
X-Forwarded-Encrypted: i=1; AJvYcCWskvbTqExqv35Sf/SWkMPFTuwY4L09iyhK9gnofbLO1DtmclBStYoZRiqswTiCWJpaQtLynDsZYJcYNKyv@vger.kernel.org
X-Gm-Message-State: AOJu0YwttZb95JE4CsM6zIFbUBFAkCmbO/A5nYLofoohp6hCYjmmouO8
	c7Fsiq2hzCngFu+OPVJfN12oV/pmJaxRsazjYIIuKNAn3IBp9N79MsB2OwGbX0I=
X-Gm-Gg: ASbGnctu1adka0D6k25fvC1Ff2ZYp3V6z0ZhCHau3zPvT6jEVZjhTSLar5nggHKGCDa
	Ma51eSRxxqs0uQeTKxXNZ3ImxeZQLuSn7uNqDumKICkp+5TERmCsJ5KjbL8qvtEaLVoukkC6l4u
	TI4XLEDks/7rCvO/VAuHo/UnCxofY5sojnP6AUibCU82Hns/jt/NOm2HuzjWFq2mhapaayBKKGa
	yX5K5ejryIA4z4MkEjSVEELpLo3IDr1OVGS3F2mnQLkZFpT00F7Q7U2fAuIhlwwBRKNSmOlpTVR
	UK9iQXbBAUYC2/8rerByExh3MPeTEgavxNIT
X-Google-Smtp-Source: AGHT+IGvwMKyxTPc6XYDYWpAagsTLJobLBRBIaI1VJFHrDhlbJEBvgyteqb/2DjPirIxW8WefT3Djg==
X-Received: by 2002:a05:6512:31c9:b0:542:7217:361a with SMTP id 2adb3069b0e04-542845af299mr7698904e87.10.1736849545347;
        Tue, 14 Jan 2025 02:12:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49f0bsm1625315e87.36.2025.01.14.02.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:12:24 -0800 (PST)
Date: Tue, 14 Jan 2025 12:12:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
Message-ID: <a42wtus7y72mt5adklbwg2hjbuayxkeucs7t4xuzmxyag2mx7b@6wlsomzj4gha>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>

On Mon, Jan 13, 2025 at 01:52:08PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
> binding definition for the PHY driver.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 84 ++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sm8750-gcc.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/clock/qcom,sm8750-tcsr.h>

This a typical comment, please actually update your internal
documentation: don't use GCC's and other clock controller's bindings in
examples for other blocks.

> +
> +    usb_1_hsphy: phy@88e3000 {
> +        compatible = "qcom,sm8750-m31-eusb2-phy";
> +        reg = <0x88e3000 0x29c>;
> +
> +        clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
> +        clock-names = "ref";
> +
> +        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +        #phy-cells = <0>;
> +
> +        vdd-supply = <&vreg_l2d_0p88>;
> +        vdda12-supply = <&vreg_l3g_1p2>;
> +
> +    };
> 
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

