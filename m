Return-Path: <linux-arm-msm+bounces-40411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B868C9E4862
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 00:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DAB32837C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CDD18DF6D;
	Wed,  4 Dec 2024 23:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fY5Oqv6i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4B918C932
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 23:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733353301; cv=none; b=C8dFKJ8wOBeKX8anstIe9HGapDPV57BJxaP6TXC4tAifR19FL5xz3Dvyf1x5ih9tN5gG++cTDDeDjyf+n6G7p65up3bDNbro203yeZou0B0xM8JwvV++njA6V3As9Pc65OiE2x6RUUYPV3pOEpaxwp6L8M+yB0gFLY3vER5o+DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733353301; c=relaxed/simple;
	bh=dZvdIAAIVCb1Gn6fGg1mI/DXu0J+s56rXzMjSqtVB7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5XQEEDhrvIyOReyhdipANoUfoghiicywFyEpz4MG2fvufk8svFs6A6MsKQKKaPzG+v4u9fAZSn8zUqj51htbCv20TTFp+ZZnhhJSPIJCtUWam1qpa7toFpGFD3C9cuTPLNB4MKokTy25c87fjDwmKSZ1ij/OeqejcKTl+S3lQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fY5Oqv6i; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffa8df8850so2440461fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 15:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733353296; x=1733958096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9vaTYGf0bQtIjfkF3yhPnmJiZRJ8Kz7bkXSyKGXSTLE=;
        b=fY5Oqv6iVNGz5a75L+TcLjyw/m0PcoKYfX2u+3vz7J+XJEfIdxt+th9QCWAoAqe2t0
         +MAxCoS2mz0tKnEzfOL5itN7zigHBrKLJMvhtIRqDK05fp5sdWxpQAl8tMAQW/VtOohy
         ScFtWSzw+lPFQk8GIJD+OEqVLuOprqC5Aj0+XTX7fNkdRgFCg5LtGphGyOuokdk9QtON
         jd5THf5Ce5IcMC+knBDKoEWJaGGHW6L4nZFyMJrivM/oWRzMbUjtjPLQd2cLu5DEBusU
         OJoup6a7e0KNG84/wp82ODxa/t/Ro+y/HXtc1IMPx/AzFpZXdXwUA+sUBmQJsEprcs8Z
         REGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733353296; x=1733958096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vaTYGf0bQtIjfkF3yhPnmJiZRJ8Kz7bkXSyKGXSTLE=;
        b=wwtnEZV3q/xaiXm89bzeuI4QV3zY6lzoPI5lNKE/4TZJE0GzRmzf3XPXoJEroQWDH8
         /I3ZV00dywOwo1FJwH72LIVRgGhs0vfNtxSNhcWqYhDWl+m4CARkG3vy6WS42AXiJheP
         /nJI6TnzGnpzUUOffL8mDjrvWqSnEfw9sDwdVnzi1O4DxakgPwvIUKjaGgj6rAJ6QG4P
         Jt5X9kqn0p/i4YbFejnbKfRE6POdmfxDnpPBFA3Hr/XfieCkrTwonGU//3k1VsrFxmUq
         Iso+TCArXD1u5rolif4YYG8kfbAk6z8oa6xN/+ENKYXT8hEc83Goty5eKLtydQ1GUkqT
         OhEA==
X-Forwarded-Encrypted: i=1; AJvYcCVXvLomLEJGIwtN7cUL7D/C5Bd4yq7p/gNEsyIE3LnJsJup/SD4ZD1xE3eo+AT5SsKf97mYSVrfMbHtMgCY@vger.kernel.org
X-Gm-Message-State: AOJu0YwFhdr5iB9MGNzhesN3XUNACsotTI7tiDs4F5K8qe2rEgdFhX6V
	AhBDqCClkd37wnSAWphdSC7PliRMsv1yufSGw9tmIvVt0I88M04uiItfcE/aVYY=
X-Gm-Gg: ASbGncsHaTeB3+up5C/e9olBH+GSbMgfL500ly4yrYvXuU4g4L2dyxEXGAkEry8BSrX
	S44QO2U0Rb7wvliYyh2UASlM2lVDQuH6Lta6FrB83WY3rQ+DbdyEIH0YqZhLfsZqzRRN4I1kNQa
	ubhTMJ65vPTyaU0sSqP9Ndp8fP37HPtC22WuuxAl5JOqcZVLooPR9WuLGquLF6ZuuDy61juXlbB
	PEXshAFcUhvVaj2dDsXOj08Xa2VPYmDjJhpLUd6BqAszezpEowWjKE0bs+DUosyOUqvm0jS5zDj
	ZDLADcziaC7s0GpXqLJpI8+Ah47VWg==
X-Google-Smtp-Source: AGHT+IFTuplv2isdxHj5cnxXRgLfLSYqhiljXH2if0rM2tCYLl4uD9OrVYwTUyo0WS8OVxU2kC/gEw==
X-Received: by 2002:a2e:bd0c:0:b0:2ff:d7e8:b71b with SMTP id 38308e7fff4ca-30009c940a7mr53718381fa.12.1733353296270;
        Wed, 04 Dec 2024 15:01:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020da27f1sm124871fa.37.2024.12.04.15.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 15:01:34 -0800 (PST)
Date: Thu, 5 Dec 2024 01:01:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, 
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	p.zabel@pengutronix.de, quic_nsekar@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 2/6] phy: qcom: Introduce PCIe UNIPHY 28LP driver
Message-ID: <f2yfxyuhoiavwziq3nd64mly3qdxif5abt2qp4qvrizqytqrid@fqfb22rpu6ug>
References: <20241204113329.3195627-1-quic_varada@quicinc.com>
 <20241204113329.3195627-3-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204113329.3195627-3-quic_varada@quicinc.com>

On Wed, Dec 04, 2024 at 05:03:25PM +0530, Varadarajan Narayanan wrote:
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> 
> Add Qualcomm PCIe UNIPHY 28LP driver support present
> in Qualcomm IPQ5332 SoC and the phy init sequence.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Drop IPQ5018 related code and data
>     Use uniform prefix for struct names
>     Place "}, {", on the same line
>     In qcom_uniphy_pcie_init(), use for-loop instead of while
>     Swap reset and clock disable order in qcom_uniphy_pcie_power_off
>     Add reset assert to qcom_uniphy_pcie_power_on's error path
>     Use macros for usleep duration
>     Inlined qcom_uniphy_pcie_get_resources & use devm_platform_get_and_ioremap_resource
>     Drop 'clock-output-names' from phy_pipe_clk_register
> ---
>  drivers/phy/qualcomm/Kconfig                  |  12 +
>  drivers/phy/qualcomm/Makefile                 |   1 +
>  .../phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c  | 307 ++++++++++++++++++
>  3 files changed, 320 insertions(+)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

