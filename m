Return-Path: <linux-arm-msm+bounces-72314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C963B45BE2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80E1C1897F56
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB79313283;
	Fri,  5 Sep 2025 15:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bpscm9D3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F209715D3;
	Fri,  5 Sep 2025 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084590; cv=none; b=l0EsImoHsg9S+25fXFQFkyDzcVHIbV8eACMVaqH8RqgFk0UnzXOcbWsxY63CCqdn3IVmN8lhsMIsNSpT2NO0SsE2xcSIx9jtsxwWrWEyWtKCM9PVJ0oh1UiQnZhAfrQpQ4iajPN6q9uUCpB9Kn9ZtmIz0hGEW+cOegut6+bMWPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084590; c=relaxed/simple;
	bh=eWcAevp3S4UXAh8xJvmgJDZ8dIZTuYfxGRfOPAGHzjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=by1owLRKA8AWTsfwP4wiLlYEQhuuvoeZldJTy/yWw5C/GcqOVWi5UshlANhKEuG1UxMQWSrPjISlIjB3oWD+wivUbS3enFQu5svIoqR3NwfSrY9BryntMstoucdiNy931kpr0igtwYnlhsYzBY8+5/vsZ2Grt7MCyoeEnVMozco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bpscm9D3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1ADC4CEF1;
	Fri,  5 Sep 2025 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757084589;
	bh=eWcAevp3S4UXAh8xJvmgJDZ8dIZTuYfxGRfOPAGHzjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bpscm9D3qzPLLuVZ8PGfSsrsMMeke//1FuhPUCKteBX0Wm5hUiV5gAge8j/Ckra64
	 aInTQerHYlfhk7oJm/9+Hm3pf/B8H+zHHSc9Zor5bB7VuljHPXzYEkDxGIoI6fCNAl
	 ttCA+kSGwulJQTfjIFQf9SXeZKCwOg0L+D3aNx82O5AohDy4BBlFdgE03bMUiLvcOc
	 mMgexzxxEp5P9XMKAcsOTwRYm89/mSESinr00JvsZAbYTLopcwN9Rnm5KuEF8cxVJw
	 m0Oq0tG7jG53kU1Ao0+RXyHsjrQ5VpZnzM0QuMJ2KcBgequu0mHecqemSbtIT9NpNR
	 BMKW8ijbNJGjw==
Date: Fri, 5 Sep 2025 20:33:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vivek.Pernamitta@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vivek Pernamitta <quic_vpernami@quicinc.com>
Subject: Re: [PATCH v3 6/6] bus: mhi: host: pci_generic: Support independent
 DMA mask for VFs
Message-ID: <adba44ewxcgndetgggknfgqzr7ndagmj5fk72w3rgnfn4d7xe6@ulkzzei25qed>
References: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
 <20250821-vdev_next-20250821_sriov-v3-6-e1b017c48d4a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821-vdev_next-20250821_sriov-v3-6-e1b017c48d4a@quicinc.com>

On Thu, Aug 21, 2025 at 06:25:38PM GMT, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> Certain devices like QDU100 bootloader support only up to a 32-bit DMA
> address range. However, Virtual Functions (VFs) are enabled only after
> the device enters Mission Mode and can support higher DMA address ranges
> (up to 40 bits).
> 
> A 32-bit DMA mask limits addressable space to 4GiB, which is insufficient
> for data transfer requirements over VFs on platforms like QDU100. These
> devices require larger memory regions to be mapped for efficient VF
> operation.
> 
> To address this, configure `dma_mask` independently for Physical Functions
> (PFs) and Virtual Functions (VFs), allowing VFs to use higher DMA mask
> values where supported.
> 
> As per PCIe SR-IOV specification (rev 0.9, Section 1), VFs are capable of
> handling resources associated with the main data movement of the Function.
> 
> This change ensures compatibility with bootloaders that have limited DMA
> capabilities while enabling full VF functionality once the device reaches
> Mission Mode.

Compatibility is with the existing non-SR-IOV devices, isn't it? How does
bootloader comes into picture for them?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

