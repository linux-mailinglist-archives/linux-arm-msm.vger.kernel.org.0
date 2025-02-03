Return-Path: <linux-arm-msm+bounces-46796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF5DA25FDD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 17:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B41E1887BC8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 16:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CFA204C05;
	Mon,  3 Feb 2025 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WSit5eS9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D521C139
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 16:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599986; cv=none; b=fqL66yHhjos/NbhxERNkwlMRnm8izgpMBb/FO6itOGuQJHUnIowsznbbeEyeh7d7I6kNnlJqyxVi0dvwa3fVEADsD1UG5/mXs1qjfgjUxvW+4WRmbq912gtawrnkgtpv30ShotAqjbdYcS4zQ8stXRqkgHxd4WKb8aDFxKWLo14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599986; c=relaxed/simple;
	bh=OVibP8ReQyd3HQmntDn0iiGBJZzdEqwa87ZWcwRodw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFVgt7R4O7ManciesvBc4J7ZDgSyRxnbjf8ZYBVg92kZgmPht7KBh6O+J+8W1oaEwuLA/HjcEKxhklO8JEeRAVFatfvwEp0FS7eOlCD+Bzaf7CBISpcCxs1nG4CtLlxa38wdjwtpTYzd5NIEZiXIzwin78NQeXzzxcn5XLZXqtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WSit5eS9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21ddab8800bso63823765ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 08:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738599984; x=1739204784; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fpVOevLK/nWn6zp5PxG8PfTYQAwpuKIZhTQ2q8JK1sU=;
        b=WSit5eS9RXGVOCTJ3Sf5kWBU2jEnJtiLb2D33Jc9Fzs4GRqZg+EycRTOA9O1CIJ0bN
         sOAiQfW4sp2VOnxF8AAUuD4ao5paRh5xkz73HC868qZvza6H5dFzFL5zvg0xuDEcFgnn
         l0iuXzPwRvAqeusDkzxbelsPpSnPde+Nae6xU3Kq96zoXEH0Tv3mgUKxDXMpIACO9AYh
         tXi+qaajoQYgkQhjS+yVk91rq6q6/K9NOo2N+g1W6nMyrb+WimMzKd9zmApa8cKMPYYa
         0zf4aSdOfvmfh/h3QX0ldaflPIKJGJzUfYEvgqkkJRFywKOWi3894COOjLhkpL6sNM67
         6zSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599984; x=1739204784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpVOevLK/nWn6zp5PxG8PfTYQAwpuKIZhTQ2q8JK1sU=;
        b=lT+mJ7WXazP9+XLmDYQrb+Yy2Z/v6rEVCUSK2itFp6+SbvQnrrCAH+8eRZFx3yZLLo
         sh+38VpKUFSfx8Sj7CJdmuK1DSyvtabIxDTnowunozQtSNJlNKsSl4Yi9z925KPmlsk/
         brkjqjicbcVmbhnsy4n2Tv/uh1eOBbnvE0QiieTkcI2mkDR0+ah8mr/aS3Eti70iWvGU
         jHx0RNb6e2q21XdcTACpEMYTO0oRc9YVNbBVk1I8xI3GYBKXTZLKGlokzW/GEVQwFYUK
         4AXO72jEh1+nhLGY4dKZfKLPZns8T7ISm5GCEevypFdaj4zLOAuTl63LJoj0qzj0n5Di
         l6UA==
X-Forwarded-Encrypted: i=1; AJvYcCWZF5cjcJf0xos3DAi0FomBH1WOZlxFg6fT4Vz0BLqyNHC7KxwzLct26VK6CPyOssM4Zn/6OIfAUJAbaqmw@vger.kernel.org
X-Gm-Message-State: AOJu0YwCDRpmdlP9jpTQ++s1iFH74HFDyXX20fkyMV4oijx3PlN4GXrP
	L3yrF86LHKOdDhUfYJkTOcl2g+FWZNiHEXMVz+Cbn4U3hlDEr+ukiDAekV31Gw==
X-Gm-Gg: ASbGnctPXmjemx0M4Jh+MCu9vxZAp5/1QD5Qdct7qSkEQkqs+3YmVBDzr0IS2ThGAs0
	CXy2CXdqXRgkLjgBxVaiBlYR+stxgSdWBM857TnSc/dNbhFHqqsBclFUuSgddYFILZQn/dzoq7K
	0hZ1mQ2Gy0x5ziJEmnPHCnSjB4CHpmT9WlKbHmu+HVr7kTac/PZneSq4dw413kjNPk/s3v68Axh
	E1SBzqpHcWmkVsGsRTgbHmRIg/Vh0os4Ipjex6Xyl9KVp1X6djLr6i5xXDQ6a27NwMhj/yE01HD
	WW7aHd2TlcDTSsPANKvHXxlsiQ==
X-Google-Smtp-Source: AGHT+IFOuXKAdtxhNw7CHCzZkSB+L34XynX4lNUCqGi6tRRgVguTo3ptD/9ETnLqXyet7OFZO69Avw==
X-Received: by 2002:a17:902:f68a:b0:21a:8769:302e with SMTP id d9443c01a7336-21dd7c65746mr352286105ad.14.1738599983682;
        Mon, 03 Feb 2025 08:26:23 -0800 (PST)
Received: from thinkpad ([120.60.129.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee1fasm78854315ad.44.2025.02.03.08.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:26:23 -0800 (PST)
Date: Mon, 3 Feb 2025 21:56:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, p.zabel@pengutronix.de,
	dmitry.baryshkov@linaro.org, quic_nsekar@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Praveenkumar I <quic_ipkumar@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 6/7] arm64: dts: qcom: ipq5332: Add PCIe related nodes
Message-ID: <20250203162617.sstmdvv7d3k53izf@thinkpad>
References: <20250122063411.3503097-1-quic_varada@quicinc.com>
 <20250122063411.3503097-7-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122063411.3503097-7-quic_varada@quicinc.com>

On Wed, Jan 22, 2025 at 12:04:10PM +0530, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add phy and controller nodes for pcie0_x1 and pcie1_x2.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One minor comment below.


[...]

> +			assigned-clocks = <&gcc GCC_PCIE3X2_AUX_CLK>,
> +					<&gcc GCC_PCIE3X2_AXI_M_CLK>,
> +					<&gcc GCC_PCIE3X2_AXI_S_BRIDGE_CLK>,
> +					<&gcc GCC_PCIE3X2_AXI_S_CLK>,
> +					<&gcc GCC_PCIE3X2_RCHG_CLK>;
> +
> +			assigned-clock-rates = <2000000>,
> +						<266666666>,
> +						<240000000>,
> +						<240000000>,
> +						<100000000>;
> +

Does the drivers really need to set clock rate for these many clocks?

No, as per the reply to my similar question to IPQ5424:
https://lore.kernel.org/linux-arm-msm/9206e44c-da4f-4bdb-850f-fac511f4ddc7@quicinc.com/

- Mani

-- 
மணிவண்ணன் சதாசிவம்

