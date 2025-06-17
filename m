Return-Path: <linux-arm-msm+bounces-61582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA4CADC889
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 12:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3F601899783
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 10:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A546B2DA764;
	Tue, 17 Jun 2025 10:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnMpDcRX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B21A2D9EFD;
	Tue, 17 Jun 2025 10:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156754; cv=none; b=Bm/iYZJ2KB6TKtUpX6OF9fU7u2N54hzgFTKJBaPiqRL32k8WTenOKSDJtQ/5r5GjhalLeYX84fu87CIijQpcTdeUK/Dm+5/XRuBoV3QtBYXPPFn+8rpxmbeuSQ9pk1BUAfQ10JAyWN5V3QCp0h5uF98vIDLNrm4hgMFWrJESusc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156754; c=relaxed/simple;
	bh=zfe8QtqZfAkq5Z9cBvdQsM5VqULg0+gYDZijw/m4oLs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mEsyg88iEIGKjF6XkBdAPqAV2dp6yNIr1SAYclV11yP9rtImVZXzw/7iFckWU9Y6F/tbE2xG2UNYLwsMtfgKKTzXdkZXGlJr0JHxmP3+rXMwq6+7VSMnxqfzox5j9IYv867PFJr9ffMFzb1cOlPSPYfidWbUkz7Aly0mRyyoZoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnMpDcRX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F95C4CEED;
	Tue, 17 Jun 2025 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750156754;
	bh=zfe8QtqZfAkq5Z9cBvdQsM5VqULg0+gYDZijw/m4oLs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cnMpDcRX8fQkNX8Ae/Dejx4iFzjO5yabVZDZyVsI8OdUsG8niRSJOLo+Ny65JF9pe
	 MmiXko8VmpRk84v6hQAo0FBIbYyBrakv5LveH9UsqYSO+KwbcgzZX1aDDcT03J0uVd
	 xZMXQaEY+AImtJATZ1Sy3Mei0lEYUxFgInXaJx8/qal47m3ErbUdsRvCY5DNShrQ3q
	 3wlXYdjDHyRpRDn2qKMYjxw5RaNwglPtFFbErHpx/bVxJfhJqu8lk90nmv1/w5KRum
	 Db5FTu+Rdsi4tDB5EmbRMlFAiMvebJ+khc5A+fAH/G/oSV/DWWvorR48I0gEGOmr0+
	 s8/dGV2lAbW2g==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250519145837.958153-1-alexander.wilhelm@westermo.com>
References: <20250519145837.958153-1-alexander.wilhelm@westermo.com>
Subject: Re: [PATCH v4] bus: mhi: host: fix endianness of BHI vector table
Message-Id: <175015675154.27093.16774093277776625388.b4-ty@kernel.org>
Date: Tue, 17 Jun 2025 16:09:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 19 May 2025 16:58:37 +0200, Alexander Wilhelm wrote:
> On big endian platform like PowerPC the MHI bus does not start properly.
> The following example shows the error messages by using qcn9274 wireless
> radio module with ath12k driver:
> 
>     ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
>     ath12k_pci 0001:01:00.0: MSI vectors: 1
>     ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
>     ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
>     ath12k_pci 0001:01:00.0: failed to start mhi: -110
>     ath12k_pci 0001:01:00.0: failed to power up :-110
>     ath12k_pci 0001:01:00.0: failed to create soc core: -110
>     ath12k_pci 0001:01:00.0: failed to init core: -110
>     ath12k_pci: probe of 0001:01:00.0 failed with error -110
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: host: fix endianness of BHI vector table
      commit: 3010503f3e064d6145095cc6612456e4950ae618

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


