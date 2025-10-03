Return-Path: <linux-arm-msm+bounces-75930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B120EBB79AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 18:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FFF6420270
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 16:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF092D0618;
	Fri,  3 Oct 2025 16:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McU/Iv8K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946172F2D;
	Fri,  3 Oct 2025 16:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759510109; cv=none; b=t++e8mdHLL4PtX+EcnArWUbxHdwRg1kmHOl3HEewc6nGDUDCNpiGoIZw4eZAJ7E0m+HzHQZbKX/Pt+Tnf332yKip7un9W9wWpjNE7+d+rGiRIJyv9wExpUahrXJ0SUBrHQcni9LjZ/PUYbgRIG1Kl0+cs85LlTPf41qfalY9h6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759510109; c=relaxed/simple;
	bh=mTTS3zASlb7/HcXha2rZtcb5Q59Jek50cVwEy1p0ab0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6mJTAjW3ne7i3XOrJ0XIKP8/MRGOT/S7Mw79GCvRMnNQC9cN9UGEiZPQxa8JzIlnH+Jl63ies2rPUwfDUoWhe3zGg7UxFHqYGfeRwVlhIrvLo7uPZLtAhx3u7cmApRBkDNKWlYNNCdrfx81TgucP/iJtryF5MSiVC6JtG+N38Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McU/Iv8K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F268C4CEF5;
	Fri,  3 Oct 2025 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759510108;
	bh=mTTS3zASlb7/HcXha2rZtcb5Q59Jek50cVwEy1p0ab0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=McU/Iv8KEfQRqDFEYlZmlNhE94gU8/E5IM1bKJfENDP2FSH5wucVa3VsV5kuoUEJX
	 dwVM9XHPQs3HwlPQE+JoZZeiKLLFdxorBLm5DIX9kf8TIf0u0AnUeraPE7Jz1lkQ03
	 Shd1trAdTUuHEFqW05mqiCPL0htKf5BfrfVTHF+tHOwcSO2fA4ZhQwWtsIxdXjZCDM
	 YV5MnrnzZrTji0tHcAU5ct9oKEeDUwV9QNpw0U+mKTIfo0SH1KEMHWp3r5x4TOQ9Ni
	 5fKGk3pq8IoshzHUQlIkfdEJ1tii9SzC063+GtyiOBQ7fl4b70hku6IBtkRPpHke9F
	 mWUhHJFLefAVQ==
Date: Fri, 3 Oct 2025 22:18:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable UFS ICE clock scaling
Message-ID: <iy6ls7c2bjnzpfcuact4vd5fba7phmng2vlhzaxxix6hlevjbz@gnva4h2d4vsm>
References: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>

On Wed, Oct 01, 2025 at 05:08:18PM +0530, Abhinaba Rakshit wrote:
> This API enables dynamic scaling of the ICE (Inline Crypto Engine) clock,

Which API?

> which is tightly integrated with the host controller. It is invoked by the UFS 
> host controller driver in response to clock scaling requests, ensuring
> coordination between ICE and the host controller.
> 
> This API helps prevent degradation in storage read/write KPIs,
> maintaining consistent I/O throughput performance.

I'd expect clock scaling to save some power, than 'preventing degradation in
performance'.

> 
> The implementation has been tested using tiotest to verify that enabling ICE
> does not negatively impact host controller I/O performance during
> read/write operations.
> 

On which platform?

- Mani

> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
> Abhinaba Rakshit (2):
>       soc: qcom: ice: enable ICE clock scaling API
>       ufs: host: scale ICE clock
> 
>  drivers/soc/qcom/ice.c      | 25 +++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.c | 14 ++++++++++++++
>  include/soc/qcom/ice.h      |  1 +
>  3 files changed, 40 insertions(+)
> ---
> base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
> change-id: 20251001-enable-ufs-ice-clock-scaling-9c55598295f6
> 
> Best regards,
> -- 
> Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

