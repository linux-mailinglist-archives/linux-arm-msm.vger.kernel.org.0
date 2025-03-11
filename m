Return-Path: <linux-arm-msm+bounces-50980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 546A7A5C870
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 16:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3EDA189FB8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 15:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA61625F7AA;
	Tue, 11 Mar 2025 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiLxVxfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC7025EFA0;
	Tue, 11 Mar 2025 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707526; cv=none; b=OSNyNIycvkMKBGfmOAkFGk0HQgrz+ZqIMpMvJYvWbdk0iFnQJONIiTNVpURV4ox56OSqOg6PvNMgY634DiGaYbxRrhSnG/NYif6ZgMeqqcn/NQdTYeX6oFPPwUOsyJ2UGmE2n0bqiHe8ZenLoTu1VkvjFbpOgQ4Sd3y04C7S6dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707526; c=relaxed/simple;
	bh=HtvJtW5x7rGS6E+g5R+r/WekMuPMy/9Qrk12gsnBDOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1zGgyrAcXzDjA9sYe4gOQqlyoqgisM/L/mmb+Nyv99itn8bHvL5Srsvr79c76jhfe/nPUtUQylI9p64nE5nW0e2DoLk8mkKZqGgfvyta0aHgj+by44JGPzGw8p3gu1VVuQOdyI7Qve3ae0wusNKecIbHDo/1BwdNrvo2lUaYlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiLxVxfc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1081BC4CEED;
	Tue, 11 Mar 2025 15:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741707526;
	bh=HtvJtW5x7rGS6E+g5R+r/WekMuPMy/9Qrk12gsnBDOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XiLxVxfc8ZYpgdwW6Krrqaut3oeTvkHsT2M/mAk7G98IDnkfWbkn31VHNjDch5iBd
	 OhtNDJskdC1WIbfjNfr10Mv1wrsVieMTWRzaxxyhSqtoKozGpvSAqZnotDAWj7BCQE
	 y83SP8Z29JGyGtyvaxHfPBVFY4VVcBZQEwF57XY2u1WgA/RphqI9HC7CajarE5l9c1
	 W9KscJVx2cTR8Nf6rKQO85kJulhC3DD5lwOsm4ebjciI79NtGi8tlTQeq5CVIZ3C2Q
	 V3umsPccgm87OlyeQ2N/Ww3D6bM979sZIEtUFJE8ARzuaT+AuXVNjfiFujmEIpwF3W
	 XhrDVeR5SwMxQ==
Date: Tue, 11 Mar 2025 17:38:38 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
	marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, 
	quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 06/10] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
Message-ID: <h6a6evxcabqwoxejxsnl26zc3dzmxyp62p6em5rsrqmo4i4ovi@mlvha2qewtqu>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-7-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311122445.3597100-7-quic_amakhija@quicinc.com>

On Tue, Mar 11, 2025 at 05:54:41PM +0530, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 and DSI1 controllers
> with their corresponding PHYs found on Qualcomm SA8775P SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 186 +++++++++++++++++++++++++-
>  1 file changed, 185 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>

-- 
With best wishes
Dmitry

