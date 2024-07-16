Return-Path: <linux-arm-msm+bounces-26264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D489931F9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 06:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C0A51C21132
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 04:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6FE182B5;
	Tue, 16 Jul 2024 04:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBu1KjmQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9E212E55
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 04:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721103270; cv=none; b=FW9mjowQDi70dXszms4AWsxU1G1M8D8BehPNYqbq8f2YjCVTxJgdN8zIsuH3n9Qk8pbbiZ4iKaePURnGQPJxcKEv1V8Fjr3Ww+HRSxG9HLOKOHkv6HZeRQL9noNVhrfj5ClVfnLhCt2e34gRpMLanZE3913kaQ8aLLrAz6fckGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721103270; c=relaxed/simple;
	bh=Q6fMXng06sCrDolMimf4y00YzugvjyxcoCS6h0VSxQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwHuNP0Z1ziYZsXa5lA6PkLuDc8vuaf2UHYkml2y5dSBOU1mYgiqr5L3A8npvzLby7m1u8L20ctI6Z+Flhp6+h/d48f4j+RcCNwaM0OOGH2aITN9jzB16ZxFgVTHMVX4/KbMQagPAd7K1KEdjLNhHPvZvTB5soe5QOHLbwakNug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBu1KjmQ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fb3cf78fbdso29971485ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 21:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721103266; x=1721708066; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m9fUUwB+okzBEhJbtku9Zj8uDK/lXGOdA1PyDueEIS8=;
        b=gBu1KjmQuB62d9UlWS/VeokmP5+zv3GsSu/mmJQOTtI4Rz+xs9Gkq57HFbDpLGKnnh
         NknJBaHOJ2ccXDqXtfb7uzl0hhOY5etn2rdlJup/X1UQlvw0mvvR5cSnEd0tKgTn4OAy
         LmBtmtMI1vJsIiwJ7O3wqikMbsNk6wR1AlCFhatndt3VxeEhaUI4pbz1UhVZY2vT2Fd3
         Xf/Nu3bkWYkHCnodBxAz2Kb6qlxm9THVWcldfZnY3x9LfVLibXj3PHiWTJhJmnXhGrZq
         Bax7TPE8LpS0xijXvE//AAd4IVm+YvnAzJjtgxkDvWuaQiPLg+ZTr9Ud6I1MPK2pMxY6
         45Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721103266; x=1721708066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m9fUUwB+okzBEhJbtku9Zj8uDK/lXGOdA1PyDueEIS8=;
        b=hCbj8xoPugSJxnLZ3qPFbLGA4mCTPf204ynSBcXSJ1+etW5+sjiYWJnA2AA2+sYD1Z
         mTsPT0Ci/tP0+gJWOJbV6A/34Ps2i7/VfDPHrkYjIsJgY7rO6gHrloz5hPLhzKyJtuPO
         sGTuyERp7juEVs7+IvA3E12lhZ6V4qnryEmP43iQCOTNwhdcGeAmVvoUI9VWS9qG0d4+
         8m9HywCQvfezaoAxLiZS3NC4raF5Hjw+SMhPMP8pefMDg7dnAu7lvtcUtCyaMq+WEjP+
         auNNxxPslukYFSL9SG1/hbecb/UYXFLWUtidDgPMN7qC0hcAJwl7J4de66Z7MtStTE/B
         YwHw==
X-Forwarded-Encrypted: i=1; AJvYcCUb0OiJYLEIsXu81XL3/lKehVwb+YAX4cSg4dWnZ6mm9YuXgxEMrHj+Gk2htWwNfxqeLT0b4nognJc+F2A4r6yXova/xIllkKamWtsnPQ==
X-Gm-Message-State: AOJu0YwRuqUGPGo2mmc/stj09sasl49z1SETen8bng63/MfWMYSmtPI+
	P+YwFMniv2qZAjb3vbzxbpQr2XSL2hfSS4ZLRcNMV5BRaoafoGgHAA+CAOdf9Q==
X-Google-Smtp-Source: AGHT+IE0ztL8RIsOftGMZThcROohqiKseTO2JDvpmlkVCP+8b8LK1YIhEgA/osbAGwBzSst2Of6iGA==
X-Received: by 2002:a17:902:e54d:b0:1fb:43b5:879c with SMTP id d9443c01a7336-1fc3d9811d8mr5861235ad.33.1721103266544;
        Mon, 15 Jul 2024 21:14:26 -0700 (PDT)
Received: from thinkpad ([220.158.156.207])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb6fdc9sm48665165ad.52.2024.07.15.21.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 21:14:26 -0700 (PDT)
Date: Tue, 16 Jul 2024 09:44:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 06/14] PCI: endpoint: Assign PCI domain number for
 endpoint controllers
Message-ID: <20240716041416.GC3446@thinkpad>
References: <20240715-pci-qcom-hotplug-v1-0-5f3765cc873a@linaro.org>
 <20240715-pci-qcom-hotplug-v1-6-5f3765cc873a@linaro.org>
 <5ea6d478-f2da-4b68-8987-79cc5dfb8c86@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ea6d478-f2da-4b68-8987-79cc5dfb8c86@linaro.org>

On Mon, Jul 15, 2024 at 10:02:18PM +0200, Konrad Dybcio wrote:
> On 15.07.2024 7:33 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Right now, PCI endpoint subsystem doesn't assign PCI domain number for the
> > PCI endpoint controllers. But this domain number could be useful to the EPC
> > drivers to uniquely identify each controller based on the hardware instance
> > when there are multiple ones present in an SoC (even multiple RC/EP).
> > 
> > So let's make use of the existing pci_bus_find_domain_nr() API to allocate
> > domain numbers based on either Devicetree (linux,pci-domain) property or
> > dynamic domain number allocation scheme.
> > 
> > It should be noted that the domain number allocated by this API will be
> > based on both RC and EP controllers in a SoC. If the 'linux,pci-domain' DT
> > property is present, then the domain number represents the actual hardware
> > instance of the PCI endpoint controller. If not, then the domain number
> > will be allocated based on the PCI EP/RC controller probe order.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> The PCI counterpart does some error checking and requires
> CONFIG_PCI_DOMAINS_GENERIC. Is that something that needs to be taken
> care of here as well?
> 

Good catch. I excluded the Kconfig check initially during development as it was
selected by most of the architectures. But I clearly failed to revisit it later.

And yes, we do need to use the guard. I also missed freeing the domain during
epc_destroy() which I'll fix in next revision. Thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

