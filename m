Return-Path: <linux-arm-msm+bounces-87642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C9CF70B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 08:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CEED302DB3F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 07:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5B6309F02;
	Tue,  6 Jan 2026 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yt24FCGb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CA6308F05;
	Tue,  6 Jan 2026 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767684856; cv=none; b=Nl6AvkzyjpWhOPfCMF9pWtssiaa2zhHXd6o66rHYkI/6aeplv907/8f/b5fOguV/LfLJm7Z0WrbgYRmWlPXYEcNrYyK/j+0UD3Zpd0aC7QcZqm+OQdXLhNzcWySDMemFa9YSmNLfWGAlX9MFQqRd/ZiETUniy2nBit8jbuVNW1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767684856; c=relaxed/simple;
	bh=1+5IaY7xoiAk/BM78Y40LMMDGt+LUOh1ShmSFG/Nggo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rp/hwVCe/bV0NnoL7tAZ7pL3ArdHBj44R4icUSXfNkpx15R7CJ3dSuXmBlG2Qjjh+AKgBlkODSr0bcyuyx+hJvoPQ+bRdMPkd6ciplU316RL/BoYwp0AX4gPXvHaZdDQIKeKFO/2ERMC5YHZc0pRI9s/oOzdGGjWBqUH9Ic8SQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yt24FCGb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48DAC116C6;
	Tue,  6 Jan 2026 07:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767684856;
	bh=1+5IaY7xoiAk/BM78Y40LMMDGt+LUOh1ShmSFG/Nggo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yt24FCGb+SPbEogUgJcbYcAkNOOKzMeoSOR9/1e82dbOnQF2uEH7wEVz0obGkHGaD
	 tT63R300p/k3veRzL6aImLBESVGyZFTxCLjZOzqLEXuh9MlIWHKVIdwWmgAKl6jGym
	 tQTBxvyTHue+KtrxXqD3Spe151Dxab+BtuoRX6litdbCvohQRzBXk8j8VjhLDMENL1
	 AH4r9ViKUtqrIo5Aus+gUTIilzXIeWMY2E4Ixuw3TjwTo0+hcSGVxClU7/3IR6R7je
	 eIbF5F7nc714BcZGRa4/OjOE1oSi5do7QaNb4xsIY0I+qvxQ4xvC6UcMizLlTroP1r
	 JKIdzZsmj25YQ==
Date: Tue, 6 Jan 2026 08:34:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com, 
	andersson@kernel.org, konradybcio@kernel.org, taniya.das@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, manivannan.sadhasivam@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V3 2/4] dt-bindings: ufs: qcom,sc7180-ufshc: Add UFSHC
 compatible for x1e80100
Message-ID: <20260106-tremendous-tuscan-boobook-fbfa20@quoll>
References: <20260105144643.669344-1-pradeep.pragallapati@oss.qualcomm.com>
 <20260105144643.669344-3-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260105144643.669344-3-pradeep.pragallapati@oss.qualcomm.com>

On Mon, Jan 05, 2026 at 08:16:41PM +0530, Pradeep P V K wrote:
> Add UFS Host Controller (UFSHC) compatible for x1e80100 SoC. Use
> SM8550 as a fallback since x1e80100 is fully compatible with it.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  .../bindings/ufs/qcom,sc7180-ufshc.yaml       | 37 +++++++++++--------
>  1 file changed, 22 insertions(+), 15 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


