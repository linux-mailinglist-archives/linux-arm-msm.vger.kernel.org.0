Return-Path: <linux-arm-msm+bounces-26047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B0F92FB75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 15:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9447B1F230C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 13:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8440916FF48;
	Fri, 12 Jul 2024 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r3tSohrQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C5215B13D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720791115; cv=none; b=Pe/r4Y/rWAPxYilvvhD6Lmb1onjSP9UZZGpDHgbTTWUqCQLecL9Z44syUS20RWe5SXAFzi/j3Y6ln2/Sh4R1Ay2WQpq4rM9SYUgsRrhlFaOIL2GuQB8Ffw6VCU7xAlob0LhWak7lXB4oPJOEHxAq0e6jq3eG69VWAuNDYZECVwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720791115; c=relaxed/simple;
	bh=Gx+vHHboITSxTD8ajdFGt5OOusQRXYoFCsCj33l6W74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTVVh0N2cMfjzlqnFgjsDsau4ajG62alpO7UMQgJ8sHjy3mnS2/ng10j4CYv++7OsUmFKHORumk3UyrQkwkE48GcanxMUcu/XojT1tgnEnbjKJ2K4K1fIKona7auQa1a2jp6IeOKHptYCWIKjg6Nu5T/4VtJMQxjAKV4cb/+Tng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r3tSohrQ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-75c3acf90f0so1500691a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 06:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720791113; x=1721395913; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kNb1ihN1alFz3/BtElcEqrqIl7ltF2VXYhD6Fw2SPo=;
        b=r3tSohrQQoa67C62ojSQJtLlHTLvIdjTQZXiihqaiJZq0ANdzAMPcZQHure74usB3c
         lr5xv/vlCGSuy6AU/Lv9SvgESRaeybEq8oY4dasE0oPNCcihfXImVQpXD7oOXw/OjJfi
         Fgo49ff/VD2qK6BWx9a5LiyZLSWdSrA78/b5Ot0kCrsXkGn2WntloSgwmZ6cayNYHQ/G
         hJNNhwLnPVlDPIjasr9IDujExzQ9gbzRGiGfZX3AVZfabCxAO52kCB/Ht1P+TLuLvjfQ
         OtnYb9Y6dEqL+0GWIxPjrKiI84Bk6BHI/OF51/e8eiO9an4Glsv774/AAjB8DJl7wKIR
         4PbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720791113; x=1721395913;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1kNb1ihN1alFz3/BtElcEqrqIl7ltF2VXYhD6Fw2SPo=;
        b=HMjkHjukPjjTsO1tWshyIE4DMNiXsSJZqAYzlxECm68Un7VV1HU1hNq2HSYZNEI3xJ
         LHHy3TrH1o2XMo2Mz3gE1Z1dkjhP0U0phC6n3aj27BpFTqPc4VWb9dwna6NACJ583BNN
         EbM7qC4CXRsI7EdGSB3yPqPWaBp32mofm9tgN4+y6OQCgQFANZL9/jgxwzbVS7tnfV9f
         LkPwt1nWDm5n6XNGBkwjfTa+ZjQq5svc2GgcvGuMY9IyGSlJvcD1RRnO73liBheNLrpq
         glfb/QHLqzrG1NWsdd3fAR+sm+v2t3IN5dbtEPJ/umrVkEeI2ChJrU2WgSm+w77ozPPg
         YrQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcG/WtVXWKziclicxuWyh1dhrWvTAlhaY2mIbGMv69IX5WJXL9te3Jjp1BOr/PB6iamL2P9nm2lQ6GUWX0dzjH0wKDxwKWaZ3OP9Omog==
X-Gm-Message-State: AOJu0YzcxsyP0OmHuo8VgjixQvxdTzEfKclV2Bh/Gusd3WKmtG5hhv2B
	Kt+C1IL71E9iLPIfUNAKLTb72SHPUwnPJ9WROpc+0f5HWMNm04dND3af+Xu7ZA==
X-Google-Smtp-Source: AGHT+IHvSnptOIGLGWHgBJP/C2JCqmDto3SZp+VT8rSojPWOme5D6SRGpVvn0QeDNYQBBYogNgGhKg==
X-Received: by 2002:a05:6a21:670f:b0:1c2:8bcf:a38e with SMTP id adf61e73a8af0-1c29824a910mr12747708637.37.1720791113269;
        Fri, 12 Jul 2024 06:31:53 -0700 (PDT)
Received: from thinkpad ([120.60.61.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ac80d6sm67108565ad.234.2024.07.12.06.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 06:31:52 -0700 (PDT)
Date: Fri, 12 Jul 2024 19:01:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe
Message-ID: <20240712133142.GA3571@thinkpad>
References: <20240711090250.20827-1-johan+linaro@kernel.org>
 <f7e74a6f-0548-4caa-a8fc-8180c619c9aa@linaro.org>
 <Zo-ssBBDbHRLtAwG@hovoldconsulting.com>
 <Zo_zu-RmbZyKijVQ@hovoldconsulting.com>
 <20240711161947.GA4434@thinkpad>
 <20240711164153.GA4992@thinkpad>
 <ZpAPaker8mulvKCj@hovoldconsulting.com>
 <ZpDnSL8as7km9_0b@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZpDnSL8as7km9_0b@hovoldconsulting.com>

On Fri, Jul 12, 2024 at 10:20:24AM +0200, Johan Hovold wrote:
> On Thu, Jul 11, 2024 at 06:59:22PM +0200, Johan Hovold wrote:
> > On Thu, Jul 11, 2024 at 10:11:53PM +0530, Manivannan Sadhasivam wrote:
> > > On Thu, Jul 11, 2024 at 09:49:52PM +0530, Manivannan Sadhasivam wrote:
> 
> > > > My hunch is the PHY settings. But Abel cross checked the PHY settings with
> > > > internal documentation and they seem to match. Also, Qcom submitted a series
> > > > that is supposed to fix stability issues with Gen4 [1]. With this series, Gen 4
> > > > x4 setup is working on SA8775P-RIDE board as reported by Qcom. But Abel
> > > > confirmed that it didn't help him with the link downgrade issue.
> > > > 
> > > > Perhaps you can give it a try and see if it makes any difference for
> > > > this issue?
> > 
> > If there are known issues with running at Gen4 speed without that
> > series, then it seems quite likely that doing so anyway could also cause
> > correctable errors.
> > 
> > Unfortunately, I get a hypervisor reset when I tried booting with that
> > series so there appears to be some implicit dependency on something
> > else (e.g. the 4l stuff).
> 
> The first patch in that series breaks icc handling, which crashes
> machines like the X13s and the x1e80100 CRD on boot. I've just reported
> this here:
> 
> 	https://lore.kernel.org/lkml/ZpDlf5xD035x2DqL@hovoldconsulting.com/
> 

Ah, what a blinder... Thanks for reporting.

But I'm wondering why Abel was not seeing this crash when he tested this series
for 4L.

> With that fixed, and with the hacky dependency on having max-link-speed
> specified in the DT for the series to have any affect at all, the gen4
> stability series indeed seems to make the AER error go away (Abel just
> confirmed using a branch I'd prepared).
> 

Cool, good to know.

> Let's try to get that series in shape and merged in some form as
> everyone will be hitting these Correctable Errors currently with the
> NVMe on x1e80100.
> 

Sure. This series anyway needs respin due to the dependency with the OPP series
that just got merged. But merging it for 6.11 is quite unlikely.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

