Return-Path: <linux-arm-msm+bounces-32445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D706F985510
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 10:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C1BA1F24287
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 08:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697AC157487;
	Wed, 25 Sep 2024 08:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yc9/tr21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A407615A87C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251528; cv=none; b=aYWIKBLhkSd6se+lCGMU/y7SSET3WwfAZxIeezxvdZgSkN/wDDq8eDsP1a/KiEdEMEE7YdO6EwCiS2uVJehUz9BckJXuWdFSPfQQwV+xUfagcp+7sJG/nLGYupyRq22sD06M5ILPWo0yIrmI9xaTMz9c5FMkRs/yy79X5B7JSeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251528; c=relaxed/simple;
	bh=Ge+7LszBaOT5Dm6+t5UCLcHOk904zSSAP9mOUFtAaLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwvbbI4WitjfdP4CNutroXC/O5nvYKO7+oRFKgMJ1nMuY5A2nuFEG0nNolYCcUsHlwhz5zQQHAYxnRGiHdMhZrPIBPysbX0Bn52m89cuIhEKS/kJ2DERY+StKKiFH5pABREsXDYwJrmnHGwDYOWpTmeyy0KwdMljLDPqZbqCOx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yc9/tr21; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37cc5fb1e45so187662f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727251524; x=1727856324; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fmE1UeERqrchW40NVacg6nrSR6Vcco0wZ6da4wq9+7A=;
        b=yc9/tr21EW3GzcNSMPS2Z+skDSEURgLHh543NbLFnQy/R3ccxmO4zmG48598TV3/8R
         MbQl/HfzMXpMd6YqAXIGT8giyg3w1d7+bczZL0jJwnnLZOEsbTHZanyFKjvG+HvJjr64
         GHbcJCSrI4S2wu9ru5NELW5sFvLnGcChKkjvpbCaAB2wuejaC4uXagXB/ofxLTvRF9oo
         D+Pkch73c++xHNqwtxx+x640Kj+CBdDIfiGICpZ3fCy3VZaQ2Hx5s9eMK5yowW1Xwbo3
         m7LpIbi/d2xfX0z6cgq1Do6TlnTsSyOPXXRR5nngfz2yc96Q9o3nDi1AT5SiQZvv5F/G
         F+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251524; x=1727856324;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmE1UeERqrchW40NVacg6nrSR6Vcco0wZ6da4wq9+7A=;
        b=TyeapFi9J1uJvBG5tVHm1Hfw8jaQtd0V3OR1J22zYBFL4IqW9e5Ow+uCRph0LdwuHP
         lNZFK6fBxhm/nIoh4tJ5y/7eyC+x1vx6Z80ET4a5sH8BMEWm00oW1EnXrSgfVmLx2G0i
         cgGCBLvaEXAv9GgVZgEOWZb/nVnBSj+EiLHvy+bDuNaDIq8UwrxZC0EVRI69z37VS+v8
         cpyYY4MupbQZOzlt3UEgerWCsz8ZoHod0UM2vdcmdTLeCZGSxUPGbbUAicXSjsVTDoOE
         7HYQfS9ZDLqx4Av4A0ks+REwqVqCYOV/GTQS2UIB+veM0clnw2I0Tr3CYaWBRMNEWmbH
         OMsw==
X-Forwarded-Encrypted: i=1; AJvYcCX1WKtx+Hpxj4P6MtKsBcUOmh65W9ESPE1e4HlcUdBsip9EkNPnY+ftMCMrjISl01oGWH4kOda6U+WEvqx2@vger.kernel.org
X-Gm-Message-State: AOJu0YxhhgGLyD/0o15ktPuf2+h8aGEC0jdm8nytw+xIMWlw/g6VZ+jS
	17+j7AmX7ArqmiqTYhYVYRrBFMtplvUQuYpH4iVS+2v31WAlatzc0ojlq5l0Rw==
X-Google-Smtp-Source: AGHT+IGu+EQFdqJdQRNdKI2O1nnUzgvF8rHWsav7UIwu3lMA5nKO4ePunuX3F80nTqxwvNWJ8lBRwg==
X-Received: by 2002:adf:e7cf:0:b0:374:c64d:5379 with SMTP id ffacd0b85a97d-37cc247945emr1246796f8f.27.1727251523891;
        Wed, 25 Sep 2024 01:05:23 -0700 (PDT)
Received: from thinkpad ([80.66.138.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e90cd8c5asm40971185e9.1.2024.09.25.01.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:05:23 -0700 (PDT)
Date: Wed, 25 Sep 2024 10:05:22 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, vkoul@kernel.org, kishon@kernel.org,
	robh@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	abel.vesa@linaro.org, quic_msarkar@quicinc.com,
	quic_devipriy@quicinc.com, dmitry.baryshkov@linaro.org,
	kw@linux.com, lpieralisi@kernel.org, neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: x1e80100: Add support for PCIe3
 on x1e80100
Message-ID: <20240925080522.qwjeyrpjtz64pccx@thinkpad>
References: <20240924101444.3933828-1-quic_qianyu@quicinc.com>
 <20240924101444.3933828-7-quic_qianyu@quicinc.com>
 <9a692c98-eb0a-4d86-b642-ea655981ff53@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a692c98-eb0a-4d86-b642-ea655981ff53@kernel.org>

On Tue, Sep 24, 2024 at 04:26:34PM +0200, Konrad Dybcio wrote:
> On 24.09.2024 12:14 PM, Qiang Yu wrote:
> > Describe PCIe3 controller and PHY. Also add required system resources like
> > regulators, clocks, interrupts and registers configuration for PCIe3.
> > 
> > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> 
> Qiang, Mani
> 
> I have a RTS5261 mmc chip on PCIe3 on the Surface Laptop.

Is it based on x1e80100?

> Adding the global irq breaks sdcard detection (the chip still comes
> up fine) somehow. Removing the irq makes it work again :|
> 
> I've confirmed that the irq number is correct
> 

Yeah, I did see some issues with MSI on SM8250 (RB5) when global interrupts are
enabled and I'm working with the hw folks to understand what is going on. But
I didn't see the same issues on newer platforms (sa8775p etc...).

Can you please confirm if the issue is due to MSI not being received from the
device? Checking the /proc/interrutps is enough.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

