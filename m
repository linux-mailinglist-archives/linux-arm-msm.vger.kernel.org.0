Return-Path: <linux-arm-msm+bounces-9525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81978846DFA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 11:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB9B81C215C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 10:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843D681202;
	Fri,  2 Feb 2024 10:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yWkIHjk5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459F180059
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706869899; cv=none; b=j29JWXSQxfs+A8b+aMjYbT88kEbbX6Hrd8wZFRI/9L6Cb9ceHhTH6jJvanB1wN+OQp8yOysCirCsaWttHMKDXvdlYFQ8uZLYCtzAzucX+8ISpP3aVZKxFPYYiBEVP/wgUbYI96Aua5Tw1xDPp0mtlldf6mwBbuv66JA67yM9CMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706869899; c=relaxed/simple;
	bh=9tCuWptXmQTXPVjGPkphoVl54eQWHUAdfFKj08Jj3Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOv9N8k77Otq6fwWySKZJjqLIXvPGtQQVSuwTyHC2QU4c6441aeX2zlhtIrz8mrvLu3DVpppBJubv1roxQRV9iodTwbT12t7LzLsemgX79cgaW/nbxU+szdZtT4CksbfDp3FC4M3gAd7DT7edptUNDDSm5/i5I9ToZCw1XyodkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yWkIHjk5; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a26f73732c5so298626666b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 02:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706869894; x=1707474694; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TEMqIdmulKhVsjdY20YuljLXuh2/LBX4s4/zE5sYM8o=;
        b=yWkIHjk5w42G1tS6oYex+mk2hXbi/fqqS7EIOq8v/K0HB8clYuAJ2kzqYHy1EINupx
         JGLgIdLgH5rF+9DmfUWtr5UyRtohTaJvv0PPhzf8prWOOEV0vCbUfu1DnD5e4FQFD6Z1
         yFFHYbhZ5eBa1ZvsYAezPc8lIXS8+sSICqlIgU+8RQ299Vkt0uCzXyZQc43pSx6HzzCC
         Z5dnz6Lp2mNdWCEA358ORnJJWoK0ccfpU2ACuZ8UDEQ91GE+/cFUYo1rgnqmJMSvgXWX
         YlAoHRwrbjDsduOwUDXMohUZjK+Y7yt22S76obK+cxmdZivOmCkvcDYRTV8zgixdBqtg
         7O1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706869894; x=1707474694;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TEMqIdmulKhVsjdY20YuljLXuh2/LBX4s4/zE5sYM8o=;
        b=QaHqSdcWDcpELYTWKswwZF0hYRZGlLFhgwWW4fCuFCx9V5YiPVKLm258bMZbuI6pgz
         SWNQisIgD4i/VPyUW0k/3e9iT3YKFm+0tPUlhsGyniOd7vqw62nEjP+mS0sK2Mj+mHIS
         JTjzxhesUahFCt2f9bnQlDSuz5lD/1EGFayGJy982BCUUelQ5ayqz9tGsfDam3/18Ks9
         fAWFQzf94vgkxWsV51XveumYSszrIgKZfnL7o+aRY47rhqtebelFRrA64AUNfubKJikY
         4tpjUa7SsMwztNRm9hNEl2THVJvprpE/zXJEqUGlLOwt27ixb9Wl3XV1iI1KIDPgY/Qu
         nfqA==
X-Gm-Message-State: AOJu0YzPh5GeyuClgECfHy2D5fv7Ec5cy2VVSNU8mEm82QpEreAG5RnY
	vmKQoIIv6z83+YkIwHwjorD6qOiGr0JTSQ1r0lyy+N+lozXPh2lI7mwbn2e/2cs8XssGAsU6UpW
	B
X-Google-Smtp-Source: AGHT+IEHCLOqEe6ybJMe/egvvzUwDgL42WplE40d7hX687OcUa0bqRXLi7rRtnP4KP8+P0IFShaplg==
X-Received: by 2002:a17:906:754:b0:a35:d2f8:4927 with SMTP id z20-20020a170906075400b00a35d2f84927mr3388960ejb.70.1706869894340;
        Fri, 02 Feb 2024 02:31:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXtZKiMJreSxrgd3PdyMOjnQWK0Q8zEmnM9aJHlnfrlvcPypomiCWFQyH80Cf9EhBrgPu1clIIW8QqGoOfArEfVXCTymBaMn4MOSuJTWNUorybzpT/d6kfIhYkDusPmSIBRX5aPbGnMbJeJjDc9VDBLXwgNOJRBUKuoc7e9JX50aFpj7LOBIqDm/MyCanklSMZPxI77jajw+5LP1ZM1MhuONa6BHtSwH6+0GoLfoxoxnFt0BVsIZ+Amgi3qVBEqmP0VKpsUh0LkHLT0h6cgCHU+anj3q4SmvW2f0VhXf/ocSJ3NSqFg2xrOqCwCI3OodkUDir/s7fKd+tbUZGs4BTO47A==
Received: from linaro.org ([62.231.97.49])
        by smtp.gmail.com with ESMTPSA id rf14-20020a1709076a0e00b00a371c568978sm216622ejc.150.2024.02.02.02.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 02:31:33 -0800 (PST)
Date: Fri, 2 Feb 2024 12:31:32 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: neil.armstrong@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] PCI: qcom: Add X1E80100 PCIe support
Message-ID: <ZbzEhOK42tL5tAKf@linaro.org>
References: <20240129-x1e80100-pci-v2-0-a466d10685b6@linaro.org>
 <20240129-x1e80100-pci-v2-2-a466d10685b6@linaro.org>
 <30360d96-4513-40c4-9646-e3ae09121fa7@linaro.org>
 <a0034c34-4af7-4733-93f7-f82f665f36f3@linaro.org>
 <20240202084157.GE2961@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240202084157.GE2961@thinkpad>

On 24-02-02 14:11:57, Manivannan Sadhasivam wrote:
> On Fri, Feb 02, 2024 at 09:13:25AM +0100, neil.armstrong@linaro.org wrote:
> > On 01/02/2024 20:20, Konrad Dybcio wrote:
> > > On 29.01.2024 12:10, Abel Vesa wrote:
> > > > Add the compatible and the driver data for X1E80100.
> > > > 
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > >   drivers/pci/controller/dwc/pcie-qcom.c | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > index 10f2d0bb86be..2a6000e457bc 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > @@ -1642,6 +1642,7 @@ static const struct of_device_id qcom_pcie_match[] = {
> > > >   	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
> > > >   	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
> > > >   	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
> > > > +	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_1_9_0 },
> > > 
> > > I swear I'm not delaying everything related to x1 on purpose..
> > > 
> > > But..
> > > 
> > > Would a "qcom,pcie-v1.9.0" generic match string be a good idea?
> > 
> > Yes as fallback, this is why I used qcom,pcie-sm8550 as fallback for SM8650.
> > 
> 
> Right. Fallback should be used here also.

So after digging a bit more ...

Nope. Fallback approach doesn't work for X1E80100.

The ddrss_sf_qtb clock is, on this platform, under RPMH control,
and therefore not registered by the GCC. This implies this clock cannot
be provided to the pcie controller node in DT, which implies the
bindings are different when compared to sm8550. So dedicated compatible
is needed.

So this patchset should remain as is.

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

