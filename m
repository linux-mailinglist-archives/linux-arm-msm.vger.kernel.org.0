Return-Path: <linux-arm-msm+bounces-61492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEEAADB77E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 19:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93C9B188D737
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 17:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531F2288C29;
	Mon, 16 Jun 2025 17:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sqps2wqk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B719288C1E;
	Mon, 16 Jun 2025 17:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750093258; cv=none; b=gkp2EImUYzxuw22KTV6ta/MWC8GCNNWcb2Tvz3X0w8jEzm7Jouhmonm5HA2sOmfYP55IMjAQKNDK2aft6Uddw4YGn6pxe41vwxwDmSne2+h3hCOvqScFvg6c75v3rTR9K2reP3SnXR3MsDWO0pjX2LzW6fKz5+bQ83w0tT5zw/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750093258; c=relaxed/simple;
	bh=LIHLqXxyRllxlm8oEjNBIkiTqf6Esvz9pt+PybPh+8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3K7krg65fVfZXCwQH0aJXUdo1nXc21tNyAqIFIjyaQSSYBjIXFYjs+nfC1X/pX689P3GjV4icQK37zAdVmuyGVBlJc819uFH8XrxUfcJDWOqa7N0rhWsC1boY88Y/q3XhUU389d8M/k+2e43/MMyNcr56w/EHysmt26xWwfuss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sqps2wqk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C23C4CEED;
	Mon, 16 Jun 2025 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750093258;
	bh=LIHLqXxyRllxlm8oEjNBIkiTqf6Esvz9pt+PybPh+8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sqps2wqkYACDdWCldgDyoINfGS/q9F47Al4KIwSAMuvb6MUI785rHmI4DfBCiGUGb
	 GWP+hm3eHJe6/TjGVsAK/r73eAA2/eDetRCVeKrKzHtRzZSH2SmTk5gx1c2WIobJ6r
	 f2+NjZdE/hIaVR4zipV0NBucIJbaoN11C+Rk/uxryeVrl8nczuHXf1vi8/Lz1yk4ho
	 B9OtOHBSRFJSVIyJsHoD1gQVbCaenD8FXEuo5kygidn8yWpKFgB8S0vTj0pNuCIebU
	 PBnx8zNs4sQvg70enXwvDljxViSGhB+3iD9VFXu5/Qrx5K0RSTEvUY58vQdquHa6oO
	 M7F7oWuEaBGiA==
Date: Mon, 16 Jun 2025 22:30:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp-combo: Add missing PLL (VCO)
 configuration on SM8750
Message-ID: <aFBNxvggJXYKQ4d1@vaman>
References: <20250616062541.7167-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616062541.7167-2-krzysztof.kozlowski@linaro.org>

On 16-06-25, 08:25, Krzysztof Kozlowski wrote:
> Add missing DP PHY status and VCO clock configuration registers to fix
> configuring the VCO rate on SM8750.  Without proper VCO rate setting, it
> works on after-reset half of rate which is not enough for DP over USB to
> work as seen on logs:
> 
>   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* max v_level reached
>   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #1 on phy 0 failed. ret=-11

Hey,

This does not apply for on phy/fixes

Can you please rebase

-- 
~Vinod

