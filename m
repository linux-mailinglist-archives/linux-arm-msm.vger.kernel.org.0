Return-Path: <linux-arm-msm+bounces-80208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 79436C2F32C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 04:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 68B904E569A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 03:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F0929D26E;
	Tue,  4 Nov 2025 03:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCoXatok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8060214C5B0;
	Tue,  4 Nov 2025 03:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762228176; cv=none; b=k0eK4glZ0PVYClyurdnOVKcUp/uNybc3ow4+9RHtXU+gjqoW4pnBHUM3lqOu6E+hdBljVuuAYVcGMvt5l/w7AHL4zxE55vHYDfk1cKe1ClXeve70hXaoGLnQ6zXkgcvZhdOysclmMPJwQ/NUTwn3teThUejBm/Ta0pnUhIYrInU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762228176; c=relaxed/simple;
	bh=6pjQezU4iwekhElF+PBuaDe7tVtkK82fk5KyzqXZ8Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FmIpxTCsvX3GHOo0Kc0PjNeTLTyDnrN85kRn1M4sHZ5jOku/RYIghH+N44VbcO0Iz8cYu9Y3t4NbZSKm7x4HhBsdbezOIYZ14UqnupRVgwz+mFFxGyUiv3cLQ8Vx3ajfVl+nMCTTaWpr9m3EAUAEkTKILYVwal6PIdnQ3lmve6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCoXatok; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33761C4CEF7;
	Tue,  4 Nov 2025 03:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762228176;
	bh=6pjQezU4iwekhElF+PBuaDe7tVtkK82fk5KyzqXZ8Cw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YCoXatokCFxgWqIhTzyTAdEYOahZgkdImF9ovuBfWpKFctgxRRSzyE9Egag2hKZej
	 DovnzgGxYSntC/DoKCHBW0+X8MtqT61p0TtPrh5EWor7chSFr1v5n3oUK6v2A0iSyx
	 zcggZIw7Eu7PHzY0tCDEeT5HLORySxOGJZhPyAnplgDWFPE13JoZbmUXGVcd+Hp7Qb
	 WtdUiywXmFq2l164tZek/Szryui98qGlgwKoeKbjVv/bP4fqru1TO8uX6QnZ+5wOZf
	 TjS4rE3OmzY8ExnBmZR7OX6W6iw+9GCDXI6Sxspsr+Rd4+mR43VlrHdKlnQrv6UiNu
	 V2gnxLxE5/Gjg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Marek <jonathan@marek.ca>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 00/17] drm/msm/adreno: Introduce Adreno 8xx family support
Date: Mon,  3 Nov 2025 21:53:00 -0600
Message-ID: <176222838011.1146775.11549730263195869073.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Sep 2025 11:18:05 +0530, Akhil P Oommen wrote:
> This series adds the A8xx HWL along with Adreno 840 GPU support to the
> drm-msm driver. A8x is the next generation in the Adreno family,
> featuring a significant hardware design change. A major update to the
> design is the introduction of 'Slice' architecture. Slices are sort of
> mini-GPUs within the GPU which are more independent in processing Graphics
> and compute workloads. Also, in addition to the BV and BR pipe we saw in
> A7x, CP has more concurrency with additional pipes.
> 
> [...]

Applied, thanks!

[01/17] soc: qcom: ubwc: Add config for Kaanapali
        commit: 85d55d8cc3ef7f77b249c97e9fac6a0fc5f5daa7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

