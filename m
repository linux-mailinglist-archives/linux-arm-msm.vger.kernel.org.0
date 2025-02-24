Return-Path: <linux-arm-msm+bounces-49169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABAAA41F13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 13:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C37511612EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 12:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC42EEB5;
	Mon, 24 Feb 2025 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oIJwfcMk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F681A0BCD
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740399889; cv=none; b=E8XzA80LVWmuuxvdwFs6Y9ZMDOMRrj+VWhia9YJW6peCDPIxZGhNSC5HLhlrMBULl8xnm5shk8YcXLUWxgIcOIHdCmPdfSwe8xwEUACyyEaIbHN/RZkxNjPa9KofoWeWgc9VlZ21N3SbbXElGzYg5XYJzQUxDSE/vtoYJikN8n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740399889; c=relaxed/simple;
	bh=Lis5HjVK3WM+Degswlw1UlkMf1Me/rIKqyrwVJtfqU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFYKn80Cc3hkhOOErpI3KndulwIBW7GwWY3euTS95SKXZxDhlRnt+IwQr+Sen/gj0CGfVZMF6yzUg45BZYDbKqzxGh7fgwZtR24qIyebVyKu9LDZVG5ZCYVELsYjFBA/egMwPRgruq3BR1RLma5+HGHKoUytQ3z+gw6y/4IVZzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oIJwfcMk; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f42992f608so6640895a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 04:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740399887; x=1741004687; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CzOuuE5AQmIPlvYyxq7yqi7h09eNAtPB9O3gjrpeReo=;
        b=oIJwfcMkfnEX1XrhSul8seuSPE+46c/4HFTZiw5clumOvxxskLZaPSXB4YpyxCLrEl
         tywQJyA2XdDP0EBQe3lrG4qZgsNf0XiPwi8eHbEC9/ORIA2vFfC5qHn4SM8YIC7aHr2z
         IPuuoml/OcxfEOUJJ3BSPLgH29l9xGy+X9aav8FsBMswtrAh1CRjhAc3yJ1ZSZxwJesL
         4VhfkGLWn3NgvMNoyOu2CtmB5gjy5AdOPHGzyQf/qXSwxZR6lLhdltN4p5xxfbVAKPeJ
         o9F6x0ZAwEn2gJBahYvb/Ht1P4XBIsEqoATZZXO9bxRcdS7VBhBVtTA1DbVeMvRFyBno
         ZUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740399887; x=1741004687;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CzOuuE5AQmIPlvYyxq7yqi7h09eNAtPB9O3gjrpeReo=;
        b=eF1r24lFwllcj8nhpWLTMV0Z26Wylx/OH7gRgUMZW2IOS7Y5qRDGMoS9wQNZAGeL0I
         yqyqb+4g1G+5EnFlAan53sGMcDwSVnaf5Ryd0kTj4Bsym0cGtzjEGiPnFnDEu3i97x23
         1QeHW7g/XlZDrWv2Bgke4vkYMDYmtLncbCr1z65r/mnIZ2TNKciUz6vzfDpHF51cH0Dn
         MQukJYzQHQ3d0DL9QtmK1Gd/IeUrhlJ2nvOJKmb4fD5GvBLCwCGxOmDITcRw1Yj6c4Cw
         Gw5n16xIDa/hcR+bmxxRJ9yN/Z/nrTPHKieoIGXic0n3rNio6850ZyjkVLAcaIX224sQ
         0e0g==
X-Forwarded-Encrypted: i=1; AJvYcCXvP2DfqiPos8FRcWIU6T/3zEE5AQoejDNtCeeav5PholBRIZvQRPjACTR32RvjEA1iMLMJppvZFCpNgTKb@vger.kernel.org
X-Gm-Message-State: AOJu0YzaJr0AHiGQ/NRK2L9dS8GACYST/ErkY71uFcPtnKE+IjXAbwUL
	RiFhbRP9caeoJlGoCrQ9CpI3D+2DN2PH3yQl9SXYhDCHrmvK1YZAQJ+nHzLWag==
X-Gm-Gg: ASbGnctCt6b5vCO/GCwACGa+O0ctm5R691JIUGq7gI4h7FRSs/SrAZkLUfhp8Zanqyg
	PJXRr/G9Go8tgQ0ccpplk7LZTvzBW/1yA8AmU22BbhRXiwVFEglAJcClxybZK3d+84crUDhn2rE
	jEm8UjqdVeYoYdgM0ThF+A5whVEn99oZSZprCLJdtDZ6+KSt+sVbaRPW5SjZTUS2qynYLuDJNDU
	Eka7Lbpu5/LObzaC0W3ILPxYLBlTRwgMqvrxQwlYrS5yzYOIXetdr+5H/xZ+sUU/JQH4uAICvrZ
	7JIhNVd5cTLwNavCxbO843UIKDtKBhqyJBCU
X-Google-Smtp-Source: AGHT+IH/w00sFYxAQuhzHVocmdDGxR/sR2j2LN3gKicNu564R2XT9+1VYMvG9GP5RbWPILjxrB+JCQ==
X-Received: by 2002:a17:90b:53ce:b0:2f6:d266:f45e with SMTP id 98e67ed59e1d1-2fce789de66mr23281750a91.2.1740399887600;
        Mon, 24 Feb 2025 04:24:47 -0800 (PST)
Received: from thinkpad ([36.255.17.202])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb57c5ea71sm18865435a12.8.2025.02.24.04.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 04:24:47 -0800 (PST)
Date: Mon, 24 Feb 2025 17:54:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>, vkoul@kernel.org,
	kishon@kernel.org, p.zabel@pengutronix.de,
	dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
	quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
	quic_devipriy@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
Message-ID: <20250224122439.njrcoyrfsisddoer@thinkpad>
References: <20250220102253.755116-1-quic_wenbyao@quicinc.com>
 <20250220102253.755116-3-quic_wenbyao@quicinc.com>
 <20250224073301.aqbw3gxjnupbejfy@thinkpad>
 <7ffb09cd-9c77-4407-9087-3e789cd8bf44@quicinc.com>
 <ea5de507-1252-4ff3-9b18-40981624afea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea5de507-1252-4ff3-9b18-40981624afea@oss.qualcomm.com>

On Mon, Feb 24, 2025 at 12:46:44PM +0100, Konrad Dybcio wrote:
> On 24.02.2025 9:46 AM, Wenbin Yao (Consultant) wrote:
> > On 2/24/2025 3:33 PM, Manivannan Sadhasivam wrote:
> >> On Thu, Feb 20, 2025 at 06:22:53PM +0800, Wenbin Yao wrote:
> >>> From: Qiang Yu <quic_qianyu@quicinc.com>
> >>>
> >>> Some QCOM PCIe PHYs support no_csr reset. Unlike BCR reset which resets the
> >>> whole PHY (hardware and register), no_csr reset only resets PHY hardware
> >>> but retains register values, which means PHY setting can be skipped during
> >>> PHY init if PCIe link is enabled in booltloader and only no_csr is toggled
> >>> after that.
> >>>
> >>> Hence, determine whether the PHY has been enabled in bootloader by
> >>> verifying QPHY_START_CTRL register. If it's programmed and no_csr reset is
> >>> available, skip BCR reset and PHY register setting to establish the PCIe
> >>> link with bootloader - programmed PHY settings.
> >>>
> >>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> >>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> >> Some nitpicks below.
> >>
> >>> ---
> 
> [...]
> 
> >>
> >>> +     * In this way, no matter whether the PHY settings were initially
> >>> +     * programmed by bootloader or PHY driver itself, we can reuse them
> >> It is really possible to have bootloader not programming the init sequence for
> >> no_csr reset platforms? The comment sounds like it is possible. But I heard the
> >> opposite.
> > 
> > PCIe3 on X1E80100 QCP is disabled by default in UEFI. We need to enable it
> > manually in UEFI shell if we want.
> 
> IIUC this will not be a concern going forward, and this is a special case
> 

I'm wondering how many *special* cases we may have to deal with going forward.
Anyhow, I would propose to atleast throw an error and fail probe() if:

* the platform has no_csr reset AND
* bootloader has not initialized the PHY AND
* there are no init sequences in the kernel

- Mani

-- 
மணிவண்ணன் சதாசிவம்

