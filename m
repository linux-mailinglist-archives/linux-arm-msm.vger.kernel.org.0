Return-Path: <linux-arm-msm+bounces-15199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0CF88C422
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 14:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EFD12E7499
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 13:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1370175805;
	Tue, 26 Mar 2024 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUu4VDnr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988837440B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711461325; cv=none; b=lb2k8thL7k+zOFf8PnXzcXWuw2EFqeNusOmijXt9v4Ed9Fe7MDsZOmUF3kwikL8F/v3+C4KtVdPv/kXKqIpAdU1TfwHKGEqGo6OHGp2IaskI/rZYJjtZv/AKWwbYE/mHOU0bP7uECiFRtqFYN/rc9cjWof+kelFZEHL2a3/Lbao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711461325; c=relaxed/simple;
	bh=g5rSC54oRDFG3++0xhSBEsvKtp7+DPDEaeW7Lwz7adU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrCP/Pi+2qnkfb8CiTyadKI+hZmxvgCZSmH1LRxCxn95SOdhplcPkeLpw+Solzqr0INKsAf7THWV709EPTZRocrEVOgTqDMbzkMBuBZl0cWAwJ3UeYtBSJqGiPGzUUj7+9nQQhy8Jj7NdqOvrdESkdL5Xn9cdO7Xnhwo2nhhfn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUu4VDnr; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e0511a4383so40357565ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711461322; x=1712066122; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b1M0Y1XkDNHVcLc0TZz7shYAMA8ewv5L9mN1HcUgUKI=;
        b=sUu4VDnrSwxRC3gNcm/nSsPWzWDG6gi4nkSoSyZKBT4i0bo1riIQhZ/E9xvjDMg372
         fMGvRNssPASKjSM7xrhrIa4usa0ZpkdZohfFIbrp3clfQeJEhXTJCUyiJysDWGIfx3Jd
         L5gHQkTZJ8n3CiM/jdkSd4ub1HKaJJdSU4FF1j4DoZv++egH7uLMhDOh++eC1GjFK5LP
         ehSMKqe/6n4l5uPHILheH9qMhMTcKPq2FhxO8FyrzKTU/H6Y8+l2ZH9prl0PPr1kbVbZ
         3XNZZbiiqL361fRW+Iyk1Y12BSNa6SPq/9RGcj+MDyFY/VlsBcHMu8AAODEVOThZr9J/
         FrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711461322; x=1712066122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b1M0Y1XkDNHVcLc0TZz7shYAMA8ewv5L9mN1HcUgUKI=;
        b=Hkxl0i+ITkqMVrpyV19bVXtlwKfbizAy0cIwgs63ve+fL8rRUkhp6Sr9L6Z97RYJS8
         52S51C+4X9pUuh4LHXFX7Bbl7TqIr17kDToNoIxMAgU3IrgGouuvt5KKkNMu6+KV8P8/
         YgbNp1DcQ2mgVsAxq3nqO+UST02NrtdA9QcDRXSNLMA2C5UGDsCJ1ZwJtqdVwfRWJshy
         VEr/6r+8gHXznFsO4owWdKtbaeOYRqoBdsCD/bpjlNvx1ulT55wYjDgdPhwewW8HCnn+
         oc6TuXhcrUNyQnhPBrbTL472M/RoWFGyw5fHchq/5Bg7GXZh3DHGuZZ9vQBfTwSTx8P6
         J2sw==
X-Forwarded-Encrypted: i=1; AJvYcCVS5whs/993KHF4TZoe/HbygGDkKvL097BC279YxA0djx2M61mnwfHHyqDlToC7J8l2g5jrzgTxF8KVAg429dzY+b1UfjfH4zNYPPI1xg==
X-Gm-Message-State: AOJu0YyaGOifVtNrMIiT6fCup/M3kXeO+3TD2v6YinGbxEPzg4HEtggy
	+5ja5FYlDU/6QFt1ciyu/UDJYOV5JKOoXd6n2eqdZSBcgvcir5NHbuDDgj/ZcA==
X-Google-Smtp-Source: AGHT+IHNOqXq6qL+ejk+jw9dkVs1U9l/d19WyMAcSDikAR4pgbYIYUs/kI+YvP7/ptELAWipSgmUOA==
X-Received: by 2002:a17:902:f68a:b0:1e0:a678:5b55 with SMTP id l10-20020a170902f68a00b001e0a6785b55mr1175640plg.11.1711461321584;
        Tue, 26 Mar 2024 06:55:21 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d2c100b001e0c91d448fsm3213867plc.112.2024.03.26.06.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 06:55:21 -0700 (PDT)
Date: Tue, 26 Mar 2024 19:25:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/11] PCI: qcom-ep: Disable resources unconditionally
 during PERST# assert
Message-ID: <20240326135514.GB13849@thinkpad>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
 <20240314-pci-epf-rework-v1-1-6134e6c1d491@linaro.org>
 <Zf2s9kTMlZncldWx@ryzen>
 <20240326074429.GC9565@thinkpad>
 <ZgKiUogkgrMwV1uD@x1-carbon>
 <20240326111021.GA13849@thinkpad>
 <ZgLR8jWfBcZB8laa@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgLR8jWfBcZB8laa@ryzen>

On Tue, Mar 26, 2024 at 02:47:30PM +0100, Niklas Cassel wrote:
> On Tue, Mar 26, 2024 at 04:40:21PM +0530, Manivannan Sadhasivam wrote:
> > 
> > I was planning to drop enable_resources() from Qcom driver once the DBI rework
> > series gets merged. Because, the resource enablement during probe is currently
> > done to avoid the crash that is bound to happen if registers are accessed during
> > probe.
> > 
> > But what your observation reveals is that it is possible to get PERST# assert
> > during the EP boot up itself which I was not accounting for. I always assumed
> > that the EP will receive PERST# deassert first. If that is not the case, then
> > this patch needs to be dropped.
> 
> From what I saw when having debug prints from my old email to you:
> https://lore.kernel.org/linux-pci/Zalu%2F%2FdNi5BhZlBU@x1-carbon/
> 
> 
> ## RC side:
> # reboot
> 
> ## EP side
> [  845.606810] pci: PERST asserted by host!
> [  852.483985] pci: PERST de-asserted by host!
> [  852.503041] pci: PERST asserted by host!
> [  852.522375] pci: link up! (LTSSM_STATUS: 0x230011)
> [  852.610318] pci: PERST de-asserted by host!
> 
> 
> 
> So in my case, I assume that the RC asserts PERST during a SoC reset.
> 
> This is obviously from the RC driver asserting PERST + sleep 100 ms +
> PERST deassert:
> [  852.503041] pci: PERST asserted by host!
> [  852.610318] pci: PERST de-asserted by host!
> 
> The two before that:
> [  852.483985] pci: PERST de-asserted by host!
> [  852.503041] pci: PERST asserted by host!
> 
> appears to be because the RC I am using, incorrectly sets the PERST gpio as
> ACTIVE HIGH:
> https://github.com/torvalds/linux/blob/v6.9-rc1/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts#L300
> 
> Well, at least they are bug compatible and sets the output to:
> https://github.com/torvalds/linux/blob/v6.9-rc1/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L170-L184
> 
> 0 and the 1, which, since the DT binding is incorrect, will actually
> do the right thing and assert and the deassert PERST.
> 
> The problem seems to be that the initial flags:
> https://github.com/torvalds/linux/blob/v6.9-rc1/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L242-L243
> is: GPIOD_OUT_HIGH
> 
> which explains why I get the extra:
> [  852.483985] pci: PERST de-asserted by host!
> before
> [  852.503041] pci: PERST asserted by host!
> 
> with basically no time between them..
> 
> 
> I guess I should send a patch to set the initial value to
> GPIOD_OUT_LOW, so that the RC driver does not trigger a
> "spurious" PERST deassertion when requesting the IRQ.
> 
> 
> So I think this patch should be fine if the RC is not buggy,
> but as we can see, in reality there are at least one platform
> in mainline that does manage to get this wrong.
> 

I've validated with x86 and Qcom RCs so far and didn't see this behavior. So I
guess I'll just keep the patch for now.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

