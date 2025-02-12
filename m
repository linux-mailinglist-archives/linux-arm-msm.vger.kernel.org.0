Return-Path: <linux-arm-msm+bounces-47765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5BA32889
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 15:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48E291884BF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 14:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C346520F092;
	Wed, 12 Feb 2025 14:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sIxLR7y7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9127020E314;
	Wed, 12 Feb 2025 14:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739370940; cv=none; b=cBZoH3otNTob85XsxbcDGJjCFgKMXRRzNtDAOGdghpitebHvDpRexiFf2NZ6NlmHbB5BtX6LFXWj0FUCGo9XNZDLeXwkHa1tVH68LqzxAypLEy8sby1myKlJR4B1n0Dim+hkgk+6NmuvqxKqQ2H0htWXQFxg270rSuhWfF67BYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739370940; c=relaxed/simple;
	bh=k9FJCp/EzqgT8t9ccuHwMGiXvLArAc9zO7kzZEzxqco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGTHnKP+kpa8oOmqyoKwjnoyU/cbzahxOzh6Y77inVXA2LVQQKbAKnPz+82T6nA4aCTj9pe5k+T7Q3+skkWpo3KCee3G80sS/L+6iyS0wnShABD+CPBBmtLfukmlTgzkm+m6JZXDv0Vb5MRxiwhKhDv1KfxoSjT0vDJGopDL3I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sIxLR7y7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39E7C4CEDF;
	Wed, 12 Feb 2025 14:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739370940;
	bh=k9FJCp/EzqgT8t9ccuHwMGiXvLArAc9zO7kzZEzxqco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sIxLR7y7ahfCJf7INhdJVZuc2vgomq0+pFO44mEH0BAED2jguVIqmCKFOuZxbrsBv
	 Mn4rCHDajZI2WJOxBV/4EVZmkyZTJVTrGr/h9alK1XA5QW9rE3spcS6QWI2czg/QGi
	 hVvm+eLKAxi2itsBAInUkjXuI1j/e7+GDJe1gmRNOmMVsSUE+vAfCqFrVs+hKDs+mP
	 CMRwKYbhxNykxXNYQQS8nz0dTK+W7BlC/NRe47EZ+dnePrzBKqbmenk6HIU35fU8vs
	 CZaTf/PN5SOJUaw69mJZzofEHkAaaHvxttBzmDLTulfvBh9FS9qck4XPT2xjHDJpSt
	 G+C0z+mE5bRrQ==
Date: Wed, 12 Feb 2025 08:35:38 -0600
From: Rob Herring <robh@kernel.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Add MST support for qcs8300 platform
Message-ID: <20250212143538.GA3554863-robh@kernel.org>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>

On Wed, Feb 12, 2025 at 03:12:23PM +0800, Yongxing Mou wrote:
> This series of patches introduces how to enable MST functionality on
> the qcs8300 platform. The qcs8300 platform uses dpu_8_4 hardware, which
> is the same as the sa8775p, but it only has one DPU. So it only has one
> DP0 controller, supporting 4-stream MST. This patch only enables 
> 2-stream MST, using intf0 and intf3. The first and second patches are
> modifications to the correspond dt-bindings, third patch is the dp 
> controller driver after not reuse sm8650, fourth patch is the qcs8300
> dts modification which add the clk support for stream 1.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
> This patch depends on following series:
> https://lore.kernel.org/all/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com/
> https://lore.kernel.org/all/20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com/
> https://lore.kernel.org/all/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
> https://lore.kernel.org/all/20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com/
> 
> ---
> Yongxing Mou (4):
>       dt-bindings: display/msm: Redocument the dp-controller for QCS8300
>       dt-bindings: display/msm: Add stream 1 pixel clock for QCS8300
>       drm/msm/dp: Populate the max_streams for qcs8300 mst controller
>       arm64: dts: qcom: qcs8300: Add support for stream 1 clk for DP MST
> 
>  .../devicetree/bindings/display/msm/dp-controller.yaml     |  5 +----
>  .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml | 14 ++++++++------
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi                      | 12 ++++++++----
>  drivers/gpu/drm/msm/dp/dp_display.c                        |  8 ++++++++
>  4 files changed, 25 insertions(+), 14 deletions(-)
> ---
> base-commit: 7ba9bcc5090556c007d9a718d7176e097fe54f19

Your series doesn't apply because this commit doesn't exist in any repo 
I have.

Rob

