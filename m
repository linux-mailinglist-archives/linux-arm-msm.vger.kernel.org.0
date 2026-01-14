Return-Path: <linux-arm-msm+bounces-88903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE01D1C53C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 05:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AC2C302F901
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 04:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEA021C17D;
	Wed, 14 Jan 2026 04:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgvU07Zy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEF818B0F;
	Wed, 14 Jan 2026 04:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768364263; cv=none; b=fLm2z02regNgjxSyeF/ljSfUmP3SZ8WPxze8KnlMmrilhZyiBwdDp4R0A6m1JWYQQTxxOjpjwH4YkNG8LxSbXufauj1bR/scWFTAX/gYrZ+q7RW/vypFm4r2nP9BRENgbTGY5tz3j3w8rusfj5Srxoy62ZjtZqOFI3X1sbhZ2o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768364263; c=relaxed/simple;
	bh=M7FE3QnNRkr9f25Y4y8b+lnLJ0oWMdKiamOZGwdfvNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3ciAe27CGyuu/mTAl8606ivMdqhauELXxISRBvfM/3Y+CNGwUOJZox+vOLU5DoiiFuSfEVunGTZhCMioaxo2g8ZC7dnm5ePRpuLWsqDTBkqJfw2r/TOyqQpn23kyASeYOIRR72fahK0r21YFXwXqvMq42Z/Y6O2PmucRRdk+WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgvU07Zy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278EAC4CEF7;
	Wed, 14 Jan 2026 04:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768364263;
	bh=M7FE3QnNRkr9f25Y4y8b+lnLJ0oWMdKiamOZGwdfvNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgvU07ZyhmEhM7VFjZgFaLmYGir3LGAjZuFpOEpwMTNIfAecJjfWRu1V2qrN5U72R
	 Sb+7ELU7YsKjD+tPe7gpbPblp//ZCwb1rGbBDmRFqgvN7SQTBnqReWdf64GOdWeO71
	 mt0Bk/G2YP0v0WnZKGpA+K5vR1x0rWiW7Iun+iNqPYDLqv2QOOGzCCzTUQ2KEZ8j5c
	 45GW/VAPR/IGf+7QPmK7J0+vd5DGBkR13M1QJfq3F5P9Q6HyWbnMy5jsdoXScKrxHH
	 h4Msb13V75IcvaZ2+Nsl0LfLS9KGstU+hqn6rE3AOzDd1Hk1j+AxM2SZ2u+7OzgchL
	 joGjDyVmcPerw==
Date: Tue, 13 Jan 2026 22:17:40 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
Message-ID: <h5psb3hw7wqdrqpok6facoefptdfd2qw2ojymk6k64d77a5ie5@iwy2nxmu6l6b>
References: <20260112-upstream_v3_glymur_introduction-v4-0-8a0366210e02@oss.qualcomm.com>
 <20260112-upstream_v3_glymur_introduction-v4-3-8a0366210e02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112-upstream_v3_glymur_introduction-v4-3-8a0366210e02@oss.qualcomm.com>

On Mon, Jan 12, 2026 at 05:52:36PM +0530, Pankaj Patil wrote:
> Introduce the base device tree support for Glymur – Qualcomm's
> next-generation compute SoC. The new glymur.dtsi describes the core SoC
> components, including:
> 
> - CPUs and CPU topology
> - Interrupt controller and TLMM
> - GCC,DISPCC and RPMHCC clock controllers
> - Reserved memory and interconnects
> - APPS and PCIe SMMU and firmware SCM
> - Watchdog, RPMHPD, APPS RSC and SRAM
> - PSCI and PMU nodes
> - QUPv3 serial engines
> - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
> - PDP0 mailbox, IPCC and AOSS
> - Display clock controller
> - SPMI PMIC arbiter with SPMI0/1/2 buses
> - SMP2P nodes
> - TSENS and thermal zones (8 instances, 92 sensors)
> 
> Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
> PMH0110 along with temp-alarm and GPIO nodes needed on Glymur
> 
> Enabled PCIe controllers and associated PHY to support boot to
> shell with nvme storage,
> List of PCIe instances enabled:
> 
> - PCIe3b
> - PCIe4
> - PCIe5
> - PCIe6
> 

Why didn't you run "make qcom/glymur-crd.dtb CHECK_DTBS=1" before
sending patches to the mailing list?!

It would taken you 30 seconds to conclude that I can't do anything with
these patches.

Regards,
Bjorn

