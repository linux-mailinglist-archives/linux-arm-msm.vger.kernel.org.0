Return-Path: <linux-arm-msm+bounces-54224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3233A87E6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 13:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 319961894E50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 11:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F1A283C8F;
	Mon, 14 Apr 2025 11:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DunaRyoB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD7B2853F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628855; cv=none; b=W+bUPDhuubxUIlY4IgF+eJoPVzSFLT2kjeXpFlNIXTI2NywMcPfYpEZYiQbZJO7ak/OMGCGD48vv3ji/S7eVxiN8KZzNR5P1ABTsoWhaZ/VFryQ/s3JA0f97DcRqxlYSI3WOsRUb3wzkBhSR2vLlXz477vHB7VJg/wb8SpgiQD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628855; c=relaxed/simple;
	bh=8V4ceruG5PBgZuLKk3o6878Go2CYJK67IJGXeFBYrDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4eWaaMzj4YOOGxAZ2HUXCCZRVsLe0tTzsUsij+DzhKgI2x13dUA3kLNUrjW2vCMq+as1IB3xb/qMPwyAEGNQ8juVwnm9YbEl/y7AQihwcfmzHveb2QiW1hqkQ1yrW55tb+NVlKe+NqSO9Hzzcp+pRW0UvyUPtBx75XCDcfbIQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DunaRyoB; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso4364851a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744628853; x=1745233653; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zFEHcpXAxg/GC10Ly7Ug5qKPKL7Q2jtqdYskUyHbzxU=;
        b=DunaRyoBd3M/pwedP13T+U0hsvSp+qVKtSN9Z18TfFY2g5HlivOl1SMCzfa/y2f8q3
         9sm4qhncPvMMiWbuektaUNIGGzJAqQeMIRFd4CMbN3nntyx1TPdrQAutBoZBfFedpntl
         27CaQ/o1kGIFHDtJ3ApoAbxcclHUzgjO+VOonsJi3oX6+zlmERzY7puyY9kq232WiW+Y
         qjdsmmjNEQRrAE30LW8Q3kni5B7fZzKo3mjyDFFss09cduE5/IGwo2eY6+Miogcrkfuw
         +WUXafnT7YELn6Z5C+TfuGPNijjadhzpFEvuGETNBAU8DiMqYv351qDtUaP5DDZl4beT
         uVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744628853; x=1745233653;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFEHcpXAxg/GC10Ly7Ug5qKPKL7Q2jtqdYskUyHbzxU=;
        b=IkHEAxodK2Y7kH+Yr6LRDg8J3c061f4OVSM+LfmGN7rkXgScexgKv0vsFc3Ur/lCZx
         vqJ3Pdd1Awh/W/D0/N8oqeG/yB0d56byk+UasW9wnPVuRqQEn5L+4Q+z0uXSb0HPyfaX
         NyGyMVZHsvw+oT8SBP9l3Mmv0XSjKrDb9Ql/DBWAL7Zp3JHNi54iv4XLFbfnD0cmNPEX
         9QgbmZQRp8gfbb/xLj6ybeG+Zwl4ouLxAybbLER+CEpOdXocO9Jrrt4VaYpPO9+wc/2X
         OesIUoJ1CJyyURvhEvEZXNB54ilRTEQYtKuFdBiNNO73Qn4GjvYyW0wyyA7kBZrZCYc+
         4ngg==
X-Forwarded-Encrypted: i=1; AJvYcCVdi7k8zaC/1nmDZeCIRtc5yUniQuQNPdiYUzCTrr35c7fOyE6RfJdPX1JhdqVbg7r399rCUY5Go6/zGWgg@vger.kernel.org
X-Gm-Message-State: AOJu0YwUVKDsOwatQFFr+p/VSu7NfFpCWMtcKXxsEhhn4Eb+Ger1wK6X
	lsPLyqQbyQbrs+W/bjQdWqiB9m0WgL2LxBfsULG5tKq6ShGvETXQIBWBOreTbg==
X-Gm-Gg: ASbGncsPehE9KPaJFWd6fEEUppaBFV337lETA8GkmWxePyLazyj8eOVFH1ti6dl0Zn/
	94wl0vZSUs87QPuBv8KuOMg5g3Tt3RHfwORl73cb7xkCe1PxJXVK/yZpl0cOk/YX2WXfj+ztOmP
	kqomVwGyYJQTodJGYOVSpmODKjFELuBazAhRekqtGVsJKTqwrBIQF8XqCZZqe7D0LF8Xi3xtF+m
	Mw5RqzOXFOM+o4yyBx8lLpPIXiTSyQGMSXhhcFNQ/zcJRmJEmm0xO7UPvSFFSDSTfsirgLsdf6f
	NRXoKV4NpxZqq+LuXnGyf4Ydg1YAVVPhBub26E9tk/igS/yWy0A5
X-Google-Smtp-Source: AGHT+IEG8eqgQ0Y8mpznX22CMbhITM96DhKYisQrcLo2Fr6NqPnURcoiXx+TnDQ54ctIZmZC2+bn2Q==
X-Received: by 2002:a17:90a:e7d2:b0:2fe:a79e:f56f with SMTP id 98e67ed59e1d1-308236344famr15907930a91.13.1744628853242;
        Mon, 14 Apr 2025 04:07:33 -0700 (PDT)
Received: from thinkpad ([120.56.202.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b62dsm12164634a91.26.2025.04.14.04.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:07:32 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:37:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org, 
	Tsai Sung-Fu <danielsftsai@google.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [RFC] PCI: pwrctrl and link-up dependencies
Message-ID: <uivlbxghkynwpmzenyr2b3xk4uxeuqf6dow6ao4mptcnzygrw7@ylfqavr3ry44>
References: <Z_WAKDjIeOjlghVs@google.com>
 <Z_WUgPMNzFAftLeE@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_WUgPMNzFAftLeE@google.com>

On Tue, Apr 08, 2025 at 02:26:24PM -0700, Brian Norris wrote:
> + adding pcie-brcmstb.c folks
> 
> On Tue, Apr 08, 2025 at 12:59:39PM -0700, Brian Norris wrote:
> > TL;DR: PCIe link-up may depend on pwrctrl; however, link-startup is
> > often run before pwrctrl gets involved. I'm exploring options to resolve
> > this.
> 
> Apologies if a quick self-reply is considered nosiy or rude, but I
> nearly forgot that I previously was looking at "pwrctrl"-like
> functionality and noticed that drivers/pci/controller/pcie-brcmstb.c has
> had a portion of the same "pwrctrl" functionality for some time (commit
> 93e41f3fca3d ("PCI: brcmstb: Add control of subdevice voltage
> regulators")).
> 

Yes, the goal of the pwrctrl driver is to get rid of this clutter from the
controller drivers.

> Notably, it performs its power sequencing before starting its link, for
> (I believe) exactly the same reasons as I mention below. While I'm sure
> it could theoretically be nice for them to be able to use
> drivers/pci/pwrctrl/, I expect they cannot today, for the same reasons.
> 

If you look into brcm_pcie_add_bus(), they are ignoring the return value of
brcm_pcie_start_link() precisely for the reason I explained in the previous
thread. However, they do check for it in brcm_pcie_resume_noirq() which looks
like a bug as the controller will fail to resume from system suspend if no
devices are connected.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

