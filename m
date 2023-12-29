Return-Path: <linux-arm-msm+bounces-6084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC33F8200AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 18:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 981CE28485B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 17:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A74D12B7C;
	Fri, 29 Dec 2023 17:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ecCNE3lp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777C312B6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6da202aa138so1128645b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 09:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703869423; x=1704474223; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dnGz3/95ZNgpRtUtsrg42smO9ALzI4JQqm7ZTY5JDAo=;
        b=ecCNE3lptdnkGUNVk0wfRN+I5c5ARbFya5SK5PKhIClezApqFL0fnR77QhV46w7TNv
         VG4r6hezzX6HUZwasT8p4Rl0vsb0tSrM88YN+bGVC1Wr2QUbDQAdKm0y47Gg04HcZ3Ud
         7iueGcTodv0bg4ml9fsqCw39YIDGiHec8hGVDipnL6S7gsW3nfTuD2ZSpS5YhryPUUqf
         YXXvyV1tI6NzFqBeHZxVCSCZDMhp5V+vuafkFs9OCgk993WGigh13aZe0uPCIJbuZfm/
         2ym2AMxq9kB9t5+1MO9mv8+MKJ5supIl+lwM3lox0Eoui9dAKiOmG52QCNxlGO/fUOgC
         JAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703869423; x=1704474223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnGz3/95ZNgpRtUtsrg42smO9ALzI4JQqm7ZTY5JDAo=;
        b=oLu75ub7VYf5URWJawujCSn8XiZlG/ybYzPgY2/BSMWRbXxY3KB6OLRDg25RRR+9yB
         q926DjvQR1q7Ll7yCwekkgw3hx/xhI3sUwuoh2RQI2uxt7yQKxCdw4XbqCNEz6b6QW6G
         0lpbNng1EUZdLZvgWsmLcBHeZzD8zpKg58APx8+6b+yIa01R5Lu4qFIiGgztm8+Ir5sQ
         QgwCSBxpvIwPE6DysBzUs180OapX97ya2DW/JPnV5kG9w7kBubHEIy/RiMDn0E/OVUmC
         /NYbZHhYYessDOzTzKT+AIuRZa5MlLElTERQP3BPXGJQlYodpw5oNusiqZO7rBfYPagp
         GjCQ==
X-Gm-Message-State: AOJu0YyKW/yrPtmJxidE27kP2EU+wrgv5UQMIqZYitch3pzXt1nnEi0K
	Wje1jhFruJ6/yM/BH3lqwTveDtTNjhVq
X-Google-Smtp-Source: AGHT+IHFnhTrgMRS7SY2RLFvJWaczD/REIhArzInITGghfYwmVt1ULQ1+WDhHrDr0KFMNo0xwJu/6w==
X-Received: by 2002:a05:6a00:849:b0:6d9:bce7:d8e3 with SMTP id q9-20020a056a00084900b006d9bce7d8e3mr9836852pfk.24.1703869422684;
        Fri, 29 Dec 2023 09:03:42 -0800 (PST)
Received: from thinkpad ([117.207.24.172])
        by smtp.gmail.com with ESMTPSA id p2-20020a056a0026c200b006d99170ab87sm12720099pfw.182.2023.12.29.09.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 09:03:41 -0800 (PST)
Date: Fri, 29 Dec 2023 22:33:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc8280xp: Fix PCIe PHY
 power-domains
Message-ID: <20231229170334.GA9098@thinkpad>
References: <20231227-topic-8280_pcie_dts-v1-0-13d12b1698ff@linaro.org>
 <20231227-topic-8280_pcie_dts-v1-1-13d12b1698ff@linaro.org>
 <ZY6sh8nlEUyEfL0u@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZY6sh8nlEUyEfL0u@hovoldconsulting.com>

On Fri, Dec 29, 2023 at 12:24:55PM +0100, Johan Hovold wrote:
> On Wed, Dec 27, 2023 at 11:28:26PM +0100, Konrad Dybcio wrote:
> > The PCIe GDSCs are only related to the RCs. The PCIe PHYs on the other
> > hand, are powered by VDD_MX and their specific VDDA_PHY/PLL regulators.
> 
> No, that does not seem to be entirely correct. I added the power-domains
> here precisely because they were needed to enable the PHYs.
> 
> This is something I stumbled over when trying to figure out how to
> add support for the second lane pair (i.e. four-lane mode), and I just
> went back and confirmed that this is still the case.
> 
> If you try to enable one of these PHYs without the corresponding GDSC
> being enabled, you end up with:
> 
> [   37.709324] ------------[ cut here ]------------
> [   37.718196] gcc_pcie_3b_aux_clk status stuck at 'off'
> [   37.718205] WARNING: CPU: 4 PID: 482 at drivers/clk/qcom/clk-branch.c:86 clk_branch_wait+0x144/0x15c
> 	

Technically this patch is correct. PHYs are backed by MX domain only and not
GDSCs. Only the controllers (PCIe, UFS, USB) are backed by GDSCs. The fact that
you are seeing issue with PCIe Aux clock suggests me that this clock may not be
applicable to the PHY but it needs to be enabled for working of the PHY somehow.
I'll try to find the details on how exactly it is needed.

But if I get the answer like, "This clock is also sourced to PHY directly", then
we may need to add dual power domain for PHY (both GDSC and MX).

> Now, you may or may not want to describe the above in the devicetree,
> but this makes it sound like you're trying to work around an issue with
> the current Linux implementation.
> 

Adding MX domain to PHY in devicetree is definitely not a workaround. It is the
actual hardware representation. MX is the always on domain, and when CX collapse
happens during suspend state, it will ensure that all the analog components
(like PHY) are kept powered on. Otherwise, we will see link down issues.

But, I heard from Qcom that _only_ on this platform, MX is not backing the PCIe
PHY. I can correlate that with my encounter with PCIe issues after forcing CX
power collapse.

I haven't looked in detail on how this series fixes that issue though.

- Mani

> > Fix the power-domains assignment to stop potentially toggling the GDSC
> > unnecessarily.
> 
> Nothing is being toggled unnecessarily, and generally this is just
> another use count increment.
> 
> > Fixes: 813e83157001 ("arm64: dts: qcom: sc8280xp/sa8540p: add PCIe2-4 nodes")
> 
> So not sure a Fixes tag is warranted either.
> 
> > @@ -1895,7 +1895,7 @@ pcie3b_phy: phy@1c0e000 {
> >  			assigned-clocks = <&gcc GCC_PCIE3B_PHY_RCHNG_CLK>;
> >  			assigned-clock-rates = <100000000>;
> >  
> > -			power-domains = <&gcc PCIE_3B_GDSC>;
> > +			power-domains = <&rpmhpd SC8280XP_MX>;
> >  
> >  			resets = <&gcc GCC_PCIE_3B_PHY_BCR>;
> >  			reset-names = "phy";
> 
> Johan
> 

-- 
மணிவண்ணன் சதாசிவம்

