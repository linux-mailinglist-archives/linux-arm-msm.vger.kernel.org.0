Return-Path: <linux-arm-msm+bounces-86092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 819C7CD4A40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 04:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BF913005FD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 03:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB647316180;
	Mon, 22 Dec 2025 03:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="urevJR3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1253FF1;
	Mon, 22 Dec 2025 03:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766374583; cv=none; b=OmS1581HjBUHrVVSk6A8sNVl5YROy92OAw1Ux1uqJGVw8f4aTwjcPKb9bS+wgvkcYgy+mpS2lmNU8VjYoZkKBB5gJa+tFFE5LzQvp1MwCLsB8i3F1cvo8LJa5aAHfVPlKS0T48rmcb8jwOj+G27iQpxQlS5ea2vinFmLdIHmumw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766374583; c=relaxed/simple;
	bh=yHQL+u5bRCA9+5yahgsy4iO/GeYU0Lgq9dPDHGBdOmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6nHoH2ENGf4RLjU0/dws3VAxWGiLAzLaJ8iYahED0LSjeG27eDXyZk8AS2QquZ9Cl6Rk+smOjwnyxuej45SmbzL6UE7Xsj9AsWZAfHAObzUfTRWQ5DtxdFPO8wlsaYFHCvgzJ0/crHJ3lYRvN9hm7Wl3MWwEg84UvTI25wlAkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=urevJR3E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93E9C4CEFB;
	Mon, 22 Dec 2025 03:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766374583;
	bh=yHQL+u5bRCA9+5yahgsy4iO/GeYU0Lgq9dPDHGBdOmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=urevJR3E6hG1tdzsZzhzf87p6YDxRzsXLg9yE+9MJ66LmyGrQ7st4W/kZB/lp433v
	 U8lIodydi6/t2IP7YfBmvqdVs66zyCI8eORXNmC9+4qa15cUWpQRwh2wYeFW+YaiVE
	 y+76ERdjjN7uptYN+7Y/kYhg65tDGLVh5wQAkq8q04kwuaS7tsQCh7Aqa7jSYuV8YT
	 iEIyGGvu8wCYpAwqfxR5aKkmIb+j7hQMktaeIQY3VJJOqxhTo8o4K2jPVfcRLn0m++
	 J5vwWH2na5P/G5TVATT52COD9P1SwxcLnfG5I6XP66qBtedOW78Crp3T51dCyPQGOM
	 08WQqmhv1nhJw==
Date: Sun, 21 Dec 2025 21:36:19 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com, 
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
Message-ID: <rqjl2tqvqourjc5qowehxdemgge3idfy7icmipc7oltkj7tuet@ypsdpbm3gvkp>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
 <20251219-upstream_v3_glymur_introduction-v3-3-32271f1f685d@oss.qualcomm.com>
 <5mxpioeokzvn22oirgvp4gwjxvn6acvwfe65sch24fpapklvl2@x2rd3b4nrbx3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5mxpioeokzvn22oirgvp4gwjxvn6acvwfe65sch24fpapklvl2@x2rd3b4nrbx3>

On Sun, Dec 21, 2025 at 05:17:34PM +0200, Abel Vesa wrote:
> On 25-12-19 20:16:56, Pankaj Patil wrote:
> > Introduce the base device tree support for Glymur – Qualcomm's
> > next-generation compute SoC. The new glymur.dtsi describes the core SoC
> > components, including:
> > 
> > - CPUs and CPU topology
> > - Interrupt controller and TLMM
> > - GCC,DISPCC and RPMHCC clock controllers
> > - Reserved memory and interconnects
> > - SMMU and firmware SCM
> > - Watchdog, RPMHPD, APPS RSC and SRAM
> > - PSCI and PMU nodes
> > - QUPv3 serial engines
> > - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
> > - PDP0 mailbox, IPCC and AOSS
> > - Display clock controller
> > - SPMI PMIC arbiter with SPMI0/1/2 buses
> > - SMP2P nodes
> > - TSENS and thermal zones (8 instances, 92 sensors)
> > 
> > Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
> > PMH0110 along with temp-alarm and GPIO nodes needed on Glymur
> > 
> > Add glmur-pmics.dtsi file for all the pmics enabled
> > 
> > Enabled PCIe controllers and associated PHY to support boot to
> > shell with nvme storage,
> > List of PCIe instances enabled:
> > 
> > - PCIe3b
> > - PCIe4
> > - PCIe5
> > - PCIe6
> > 
> > Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> > Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> > Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > Co-developed-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> > Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> > Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> > Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-pmics.dtsi   |   11 +
> 
> Separate patch for each file, please.
> 

Why? We just told folks that we want the introduction of a new platform
consolidated into 2-3 patches.
And this would give us 6 small patches each one adding a trivial (and
presumably incomplete) pmic files.

What I don't know though is why we have pmh0104-glymur.dtsi and
pmh0110-glymur.dtsi, why are these "-glymur" ones? And why do we have
glymur-pmics.dtsi? The times we've done <soc>-pmic.dtsi, we've put all
the pmics in that one file, not just 6 includes...

Regards,
Bjorn

> Abel

