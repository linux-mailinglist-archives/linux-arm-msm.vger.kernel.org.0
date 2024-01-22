Return-Path: <linux-arm-msm+bounces-7846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBD9836ED4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 19:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DA591F2FD97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 18:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378C762A0A;
	Mon, 22 Jan 2024 17:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V6fINjAq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00D9629F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 17:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705944337; cv=none; b=LfYHOWdqb4PNcj9Uyq/xqAx3mWBI4qzomxzGGL2dbshoCIkzS5fqLw72BE4pN1qgABk2S6GKvmVJ/K1NVcJbtbE3dw7zFa2Gk/0hcifSbwhdL3NWChlzKFrALJ2reW8QlT03bEwrksk0hPx2Q1VKYuaj/PnWLd2EaNesZLrgXfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705944337; c=relaxed/simple;
	bh=gCpxvZ3Cr8PY8P8B+/AhrkttFfZIceXbRbsl7hJtitE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8exwAihtEPiITXhl3dOlUhdAUhTh2wLK8k0XaWwI/7zmh7eOwvzNXdDVLmG/sjSXy1xP95qy1rKvWH4QCmyNoAcY7/OPpPfgL0uzzjgqclkBoKgIWRHf54OXPswBrRmm1EElBEelhDpGBCkEIAWaAt6gQuh0s1HY0MILz0FwSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V6fINjAq; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6dbd56b5357so893915b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 09:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705944335; x=1706549135; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FDs5RA9l/1YLjMhJ9/RhnqWe/iFg+T34uR8dnP0JYX4=;
        b=V6fINjAqQDFSlLl/pgb9PtlLhcbrf3wsV3UwEdNDr/RO3tTg9obUPIU95P0pG+nipG
         sTzBMMn7RBfoP0Xuu7p8gg16GxeUuxDesUJCxJw1dhfipaQtRDN0dSi0e5PP6rwd/X3l
         zGFDI/3z2IzthzKSLVnUqF/p5OQPm63fE63ehdGBnuuhyNrkuKN70klKnaHVywTQ7h+x
         SVRumG537VZJbisWOdkaTTCnTx7onD63GAk1qb27efeOMHxUE6m6Wl2TU+20Dd0earPa
         W+e5PC6KISDcPeooGcFTXZtD2ueFew2Q/yuXqyYTF0nTBfuTn5cwiAULcew65bp2QEnT
         GJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944335; x=1706549135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDs5RA9l/1YLjMhJ9/RhnqWe/iFg+T34uR8dnP0JYX4=;
        b=OzmbGBJt+U00qVwwqbXMKrwiJ+vuPt5mxSiXf78NER98RFqgU/bZk4sUuNK/zCjVYB
         ZIuWnb4ssMQTbE86+RyQEmKdqRqeOum/CoxzcU4UoSl+5kInb0VqKRTXMTCXPOco//V1
         ZI0tJx6vRLknxp6hTqe3bJRMzD+RmBAIXowRZKrq7DS3bmPtFRezBEeRJ3u4R6JF5izR
         hBoJRrpav/x/X4VlPhbcXH3WoZbgRlt7bLI5rrlMMpPTB6Pyu5CKUEPaTiKY975+AjRW
         pPMwfgH0BQ5l8WIOYiWLQTioBxewNc7H4171Dxl+ozFFkA16+zkggpxk7f869HNxuy5S
         RxTA==
X-Gm-Message-State: AOJu0YzU1K+bivD7eamaYxqFn8B53tqXNHNrYYzYRCSPRdFsTqZ5ws1E
	82wzPMt7BsxsVlIPrM8wttwPtMwv62V2e3BTO1sowPfsu7GfZPP977IDAh1yQ/jTIM/aXiEQD3c
	=
X-Google-Smtp-Source: AGHT+IGaWgbzrTPeDp6/8A8YcX7oqDjO3MT5GsSJh1yK79sQrbwCwjkt/1tC82IwjEynZJ3VA6iy8A==
X-Received: by 2002:a05:6a20:11a6:b0:19a:63:70dd with SMTP id v38-20020a056a2011a600b0019a006370ddmr1362052pze.36.1705944335124;
        Mon, 22 Jan 2024 09:25:35 -0800 (PST)
Received: from thinkpad ([120.56.197.174])
        by smtp.gmail.com with ESMTPSA id h3-20020a056a00218300b006dbd341379dsm3749903pfi.68.2024.01.22.09.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 09:25:34 -0800 (PST)
Date: Mon, 22 Jan 2024 22:55:28 +0530
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
Message-ID: <20240122172528.GE3176@thinkpad>
References: <20231227-topic-8280_pcie_dts-v1-0-13d12b1698ff@linaro.org>
 <20231227-topic-8280_pcie_dts-v1-1-13d12b1698ff@linaro.org>
 <ZY6sh8nlEUyEfL0u@hovoldconsulting.com>
 <20231229170334.GA9098@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231229170334.GA9098@thinkpad>

On Fri, Dec 29, 2023 at 10:33:34PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Dec 29, 2023 at 12:24:55PM +0100, Johan Hovold wrote:
> > On Wed, Dec 27, 2023 at 11:28:26PM +0100, Konrad Dybcio wrote:
> > > The PCIe GDSCs are only related to the RCs. The PCIe PHYs on the other
> > > hand, are powered by VDD_MX and their specific VDDA_PHY/PLL regulators.
> > 
> > No, that does not seem to be entirely correct. I added the power-domains
> > here precisely because they were needed to enable the PHYs.
> > 
> > This is something I stumbled over when trying to figure out how to
> > add support for the second lane pair (i.e. four-lane mode), and I just
> > went back and confirmed that this is still the case.
> > 
> > If you try to enable one of these PHYs without the corresponding GDSC
> > being enabled, you end up with:
> > 
> > [   37.709324] ------------[ cut here ]------------
> > [   37.718196] gcc_pcie_3b_aux_clk status stuck at 'off'
> > [   37.718205] WARNING: CPU: 4 PID: 482 at drivers/clk/qcom/clk-branch.c:86 clk_branch_wait+0x144/0x15c
> > 	
> 
> Technically this patch is correct. PHYs are backed by MX domain only and not
> GDSCs. Only the controllers (PCIe, UFS, USB) are backed by GDSCs. The fact that
> you are seeing issue with PCIe Aux clock suggests me that this clock may not be
> applicable to the PHY but it needs to be enabled for working of the PHY somehow.
> I'll try to find the details on how exactly it is needed.
> 
> But if I get the answer like, "This clock is also sourced to PHY directly", then
> we may need to add dual power domain for PHY (both GDSC and MX).
> 

So I answer I got from Qcom is that this clock is only applicable to the PCIe
controller and not PHYs. On some platforms, there is a separate PCIE_PHY_AUX_CLK
coming from GCC that is used during L1SS state. I think that caused confusion
while adding PHY support for followup platforms and folks just used PCIE_AUX_CLK
since they couldn't find the actual PCIE_PHY_AUX_CLK.

I've prepared a series to fix this mess, but I want to know how you end up
seeing the above "clk status stuck at off" issue. Is there an actual usecase for
powering up PHY without controller or you just experimented with it?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

