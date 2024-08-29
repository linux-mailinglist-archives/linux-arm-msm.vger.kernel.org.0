Return-Path: <linux-arm-msm+bounces-29940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A431B963F8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A06F286AA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 09:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3CE18C935;
	Thu, 29 Aug 2024 09:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFeu46MM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A2818C025
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724922607; cv=none; b=O6HP2zwTNccWEJYtcV2gtTUnYef3E/pnVNq9qJgOAteNaTIgtqkAJbZFi6TcX0Xm32qHD3wuhJdgV9bc9mX8a2FPLHExCeHGRx2wvkUsbw4Eu1jDsdytTaeXyqyOMpoeVHwh7gUF9JdxvUIIIXvsidbYJiKtJM3Kp4QfKpyC5pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724922607; c=relaxed/simple;
	bh=tYHbZEyPmka4Yivy4HduNryMYDS8i6bX02kvNnY6E60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AY651XbkrvxBJlVdbJHKn/YNmaGrONvCDWMGVKbwkwKuCtkc0krmk5/do5dE0L9n9k53zjeeY/kfzxjtwkosVTwjQuVqF1J3Zd82XbDJF7YGWpb7zUM4BU6XLhiDZJ3lBYilgg4CdhdGdpOdDPYIGzxk3u0vdZSyEc0DX17BE9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFeu46MM; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5353cd2fa28so533660e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724922604; x=1725527404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O6NBn/HAssV3X2fUR8nleuDhVgAPEyHrLktSv5/fXyE=;
        b=kFeu46MMO6icQAvijxpfRGAQP3wq8BZnztYdcxKH2HTqfwCy1/Ek3nUFE8MMfEy8hb
         uiWDGQj+y/UTT6srut4r+o8CfbfsB+/Sk5FRKQ35tJj7dVabqkdZ8KHQfhZ9PjpQu+Gz
         IrBHVn3hj3unhNdhPSfa1P3BAF2K1WeXs+q6wp59jk3AN0G1w3a34Kcd/ZWFCVa4UFUT
         iPOKkEGcb+SaM3wMJhooQjntVn13K2h/YpUT6Tq7ZjoyFYx3Nbck5zrLNDDSNJfGPoBy
         vrhwu9+2BTwzxrJGycXsJalYX4rz8pVFSkX3NEKOhauLT9EQNPJnWE4WUyun6ZpW3uzT
         mWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724922604; x=1725527404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6NBn/HAssV3X2fUR8nleuDhVgAPEyHrLktSv5/fXyE=;
        b=r9ae9Le47eRHoW6P2b2OoSoiNmYHfVD46sIG37cIn1P+TUboKxiaEo1Un4bKqUJqB+
         gASgfAufJn0gVulG6af8SSHg3LJL46y7hxSAZMCbp6yPRcoZMw03RXqWzF6o+yvnQfk+
         kOOZFaJD8bdWuzwa8NwoWVnjOOhWHIjY0bCuLpl0U1B0ZrUBuIzQkvzT1faBjESkAFxW
         Ye4Shq31BqX5lMhAbjp1165Y/5Sf5NhGwaiUZVYcwzWCpcBR0E5FMHCmODc1+uJzXJvm
         jv+DK0tuCTjIRwz7y39R50VzqOe5RfnO6FS/32VksZdM/nxMLRRcyVDI2J8C6j7Act+B
         XYJA==
X-Forwarded-Encrypted: i=1; AJvYcCU6TsfgDc3pf2aeVXouMke8HrXdyBW+DWMOPkDl1n87UWqNUsPQh5kalMBamxom2ORWeM7tOMWgWxDknJiu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnk/98iHvJ5todKG60IOyAkn8RcNAu7FLRH0NP1uWK9/PTXyF6
	tgDntCqdD9UU1H52WV8pRFnRVcRJCaxgFqtzXeW6BUvdKA1JZC1V+uuH0qF7JQo=
X-Google-Smtp-Source: AGHT+IFvfk0TEfgAeIuX5KuN0s5sCC0/zMMfp6eawrjxG3Ca1XvBQuxc+Kts21vRxC+bjEIR5246Ww==
X-Received: by 2002:a05:6512:3d9f:b0:533:4820:275a with SMTP id 2adb3069b0e04-5353e5bf517mr1240266e87.52.1724922603591;
        Thu, 29 Aug 2024 02:10:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540827b28sm100441e87.140.2024.08.29.02.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:10:03 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:10:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, 
	manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	p.zabel@pengutronix.de, quic_nsekar@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, robimarko@gmail.com
Subject: Re: [PATCH V2 6/6] arm64: dts: qcom: ipq5018: Enable PCIe
Message-ID: <nut3ru5rdjf3k3np47gqbpuczvpsuoismx6hp55ivc5mqmdglz@zyzbra46i6iz>
References: <20240827045757.1101194-1-quic_srichara@quicinc.com>
 <20240827045757.1101194-7-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827045757.1101194-7-quic_srichara@quicinc.com>

On Tue, Aug 27, 2024 at 10:27:57AM GMT, Sricharan R wrote:
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> 
> Enable the PCIe controller and PHY nodes for RDP 432-c2.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  [v2] Moved status as last property
> 
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> index 8460b538eb6a..2b253da7f776 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> @@ -28,6 +28,15 @@ &blsp1_uart1 {
>  	status = "okay";
>  };
>  
> +&pcie1 {
> +	perst-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;

pinctrl? wake-gpios?

> +	status = "okay";
> +};
> +
> +&pcie_x2phy {
> +	status = "okay";
> +};
> +
>  &sdhc_1 {
>  	pinctrl-0 = <&sdc_default_state>;
>  	pinctrl-names = "default";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

