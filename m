Return-Path: <linux-arm-msm+bounces-76179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 961A1BC0B14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 10:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98E5019A08E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 08:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7372E1747;
	Tue,  7 Oct 2025 08:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gznl10my"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F142E11C7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826056; cv=none; b=FN6XTrdNagyFa0gZETWhamoW9JHPHi6doCcU7ztE+fZbKjgpzJgPD+wfxuwNxabku4lMxOHW86W3fdwfLNJ9Zowamg8qhuhEh2kLaL+sQfN8MFPibvCkfNa1OrKsV7GrpX4J59lfSuU5Cnf6gkB5pHYulgYRoj+cGYBmnrAf4BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826056; c=relaxed/simple;
	bh=hnCPQFDJioFXFqwrcNntVGijjFsq5IgSQsQaRCg8dks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iucp3nH87lgSNy5ONXHWhoktEQBC+ic97agLHin1fwfWINYNqonUvQ6WzZEAF6kh0SEmD3EH7PUIydtsK4KQZvYQKlRqag2I0jf6rr0iJxnhavxyAzsudJM1hafjTf/Hh6yVYcLwGxwT3QdybOjCO18yhB0ZCVBd/sSGD7goRVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gznl10my; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e47cca387so62755175e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 01:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759826052; x=1760430852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QiLtkw4r+z3ELHzrkww79sYrVN4+kJqV9+CE0aX/r8k=;
        b=Gznl10myooEzq6wPdYbpIgHXK0odaCTNYIKa/UILeJNvFcbdqfxcisLhmRfcfKuOv1
         AByn817tiHfMfr7iGn0vpMzfQqycJ+JHUtPUdgBOqmlPVtUGSnLdZhkZ7aRd7+g0M1CG
         8qb98PRYsvMNbEA6JUM6REunxggElAQUVfjbzqJbiIt3xwmhQWVZexZ9VmXjlLLJFQs/
         fEmAhV+39s5ItYWp4K3G8G2rR5nnpBMgkFtVR179MiCSnu8nZmRn2I/3/PXuhZi2FfVf
         8KefWav68CwdkLTRlteoSRXQaHghVBtbYGpA6mORLMeIis6EsXMZ4Imeyz5Qs/rxeOhH
         tXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826052; x=1760430852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiLtkw4r+z3ELHzrkww79sYrVN4+kJqV9+CE0aX/r8k=;
        b=bSfurcISEwtk2tGL8u6sp98YodLEgbOXzO3ibFS8zIS5HVEx03PSdFqGumuCWEMsBN
         8spn5xxtaXHN+fM7gOhptAU8qY8JUhwzWi4GV+N37UoG6VzjrCtgeVb/7O35/OSsYftF
         RUXLXbm/ikOb6D03bY2KHF8cRtwrWJenwj2s4GYNkJYBM9jszpG3cFs7XtODao9NI6+z
         s4Ddb0A/Ibj9H+80irdAYp32RbpAl9oFxp9RptN/XmuHMPbon0vE2bUj0OMVQMlifdRO
         aNZpq9MuJpRIRdnGk7cY+fC7uM+s+j/9NSsGj4FJYpRsJiFBWXvrgrTEmDnDAFG7rhs5
         dBJA==
X-Forwarded-Encrypted: i=1; AJvYcCXl8mQfjGhot+5yLl2sy5WLtlCB/U2+cxy0PFsmXwAdRGl15KlPL9S3X0ysMp7UhqoD8ez8dr196yR/ABuT@vger.kernel.org
X-Gm-Message-State: AOJu0YyO+5s/tfIzkhxlZoEPk4jb5Oz5icGdK3R6YNM/d41kLtSeBoM4
	0DY1+i2xkXEbv5+TjLYGYojaLp8IdV5ZujPRWtuYVKGVA5PxT5xZJYM/yyj8TqqiYfU=
X-Gm-Gg: ASbGncsAhSj0QsNxNzszPLUmaR022cU5+FAcsCC817nKWDvTDMlErZaEYQFS/y9Is1q
	pF2NgOanIyD6xgI9Zb7ZMu+u1b3o/l0I/+bF07AC2eZqUJbv1Pby6IllEE34Y4s50AOY+LymtfJ
	IpZDNV/ODU2iymze0d3G7PkcRjCts38S9u4cwJvfqSuocxXm+Af1aDSLnzSXcBNzyT1Ychf4nN+
	4/fu744/zBbLeT62ajcP7aUJHWUnRmxnA3hJupEQINNGdxBSxT41ZbOEsKUHMA4LmLcepTfpOxe
	8lwtmfPxMyFGAiTCHIUBbmGLOaW/ijWSOQk2TQ/bi+E1SBCOFcaRmKnJJC0nLvOnyUb/pkfp/OV
	7bahnjVnU3Lp8sSzA9Dz9S4cJcYwV3eMZ1XudJ248MEtYpSI=
X-Google-Smtp-Source: AGHT+IHzRBYvsifqIJW6l/DvFTb1GpI73cPAH1fs6Lrdh2C0kde6p/0HuIOkdP0J3Z8Xj3L4jdedOg==
X-Received: by 2002:a05:6000:2210:b0:3ee:114f:f89f with SMTP id ffacd0b85a97d-4256714faf6mr10470825f8f.15.1759826052003;
        Tue, 07 Oct 2025 01:34:12 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e960asm24204750f8f.37.2025.10.07.01.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:34:11 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:34:09 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e80100: Extend the gcc input
 clock list
Message-ID: <dz4rjtwdl6gqhn6g5prqvnifrgortzgjpwatbpf3n7kn22tniz@yjteyofk2gtr>
References: <20251003-topic-hamoa_gcc_usb4-v2-0-61d27a14ee65@oss.qualcomm.com>
 <20251003-topic-hamoa_gcc_usb4-v2-3-61d27a14ee65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-topic-hamoa_gcc_usb4-v2-3-61d27a14ee65@oss.qualcomm.com>

On 25-10-03 20:14:40, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> With the recent dt-bindings update, the missing USB4 clocks have been
> added.
> 
> Extend the existing list to make sure the DT contains the expected
> amount of 'clocks' entries.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

