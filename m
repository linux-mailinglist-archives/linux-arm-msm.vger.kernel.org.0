Return-Path: <linux-arm-msm+bounces-61614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 802F3ADD102
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 17:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B8AD18826FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 15:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72912E8894;
	Tue, 17 Jun 2025 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdkxNXlR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87781865EE;
	Tue, 17 Jun 2025 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750172875; cv=none; b=dqnj9FXkzJodzkPjHBJBhXGSCV3GSRZGtdxfn69YdMe3E+iZdAbmwArr2xe4cwElQVsT0/ELRNaouxQPV6vNunFUEGiZy6Wc98DXcGERIIgUckqCbajDJvuZqvcdNS7JTtKFCtXviNYAnRAW2+76EQ200O24qDwZTmtElqdle4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750172875; c=relaxed/simple;
	bh=RTyos+xArpipmhaa2xrTlTzTHqAS6FVIM1VdIIXaLUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Ck3EB5WpYnM433HZnPH683+EW8hdaz9FNqcGNMs/Vcf4WTe6/bynBuwgVp++gM8vugB7tcpuRMu74WaQYUYYm3euMfV8kdGfgnZkXyalmtx/x+eS2c+W/AB3EO2AlM2TO6wFsIBkagrBdCHv8T3aX3ComNpDUZUAEMiQTft/sOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdkxNXlR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3487EC4CEF0;
	Tue, 17 Jun 2025 15:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750172875;
	bh=RTyos+xArpipmhaa2xrTlTzTHqAS6FVIM1VdIIXaLUE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=KdkxNXlRcbvUaRalV/h1f37I0zs53G4KItGNuBuj79IToFYcdMed2en2wiXdBK1dr
	 6tRbc9kb0Spvx49WRn2iANMoKCYiCwdWkVX740Mo/w67zMGHQCZEB/i/10ngNmX2zI
	 jt9WbXuhvLLuFyi/XxzZayQ1g9MwisbhB/3w+3pa402eGhxz8Sma2sJnOP7Sju37vA
	 nzMu3rzSDFVv31QJVvWWaAue9XNSHM0RIfKRcWqNUT0HTSulqww9p9LqnXPvMAIZgk
	 SWO0wN1A+39JFFUgEhd2zp3pm4FadgWK5pOjzunlz3DW09/3sD6vamp+vYM1WxStcn
	 z+eRv/MsDvKdA==
Date: Tue, 17 Jun 2025 10:07:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.o>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	chaitanya chundru <quic_krichai@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
	amitk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	jorge.ramirez@oss.qualcomm.com, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7] PCI: Add pcie_link_is_active() to determine if the
 PCIe link
Message-ID: <20250617150753.GA1135993@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581123048.1308046.1750170680177.JavaMail.zimbra@raptorengineeringinc.com>

On Tue, Jun 17, 2025 at 09:31:20AM -0500, Timothy Pearson wrote:
> is active
> 
> Introduce a common API to check if the PCIe link is active, replacing
> duplicate code in multiple locations.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>

Duplicate post?  You can check https://lore.kernel.org/linux-pci/ to
see whether it appeared on the list.

