Return-Path: <linux-arm-msm+bounces-50978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1974A5C83E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 16:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9CAD1885879
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 15:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4607125E832;
	Tue, 11 Mar 2025 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEpYTsR/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1899B255E37;
	Tue, 11 Mar 2025 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707467; cv=none; b=OhKiCtrTTQRkphMTsK8oCwzCbOgwRnviwsLYSQlA7M1Sr5iakmZdSNYut6oilLQ4sw0tAcRmTpNiSGlL6o1uKuG0++5cBOq4/IY9yAFfv+1UdsF/DtQGNQoX8lvwZy/PPW8xpUv8skCtJq9wEZeS5J77HjHhLxq3kO/g/93apJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707467; c=relaxed/simple;
	bh=faNtoBW2boCa3GF4XBiEqy0uua30voE9qSLT5TswaP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vo3TUNCvG55q55FaHIaFFAWVaKrIlUa8AI8KSFjq2SJqAX2fpOuWpIpDPV7XlUF5WE6QAOwkL3/PxNieN1cUp4cJ0cN/ZylLz8d1YVQzgXS53/m8+BIC2eFQYgbfnE+HOefAd+sIGTKyV6J5pfm2St8VGkpxQBX2x0LZ0mHaBL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEpYTsR/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCF5C4CEEA;
	Tue, 11 Mar 2025 15:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741707466;
	bh=faNtoBW2boCa3GF4XBiEqy0uua30voE9qSLT5TswaP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEpYTsR/YO6P/QO2SGxhuaDPc6SCPR/pvCZIJJ53IRErPRB+fr0F9mq4lpoKbop+i
	 8ZiNXX4gqB6BrnA0cwG8Wq/jjj8IM5l+uwOzBsaZpcD6fNTAT9wXOgspBMbGS/kRpW
	 1mlGFv0cMr8gtnm8ftP6XAnwysBdrb5hkMGgT5YUcEXln6ehI78o0T0RrLLNiKtMJ2
	 w++DChQUgCtb6X8jlYuoDINV2F/AXu8K+g6iqVHWFDY5QfiPquexxhWD3W2DM+jGRW
	 JPU2zeT7xe6kg6uyBoSLGFhgS/ZcHPpeokQyn5hMdp28CrzefsEl6m6QLGtD/8jqhL
	 GX3iseaDsqu9g==
Date: Tue, 11 Mar 2025 17:37:39 +0200
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
Subject: Re: [PATCH v2 04/10] drm/msm/dsi: add DSI PHY configuration on
 SA8775P
Message-ID: <t2p4ysihumnknyq7p7ns4gy3q2t3cwxu6nzyqdweseckrwdcqe@lou5yockzogd>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-5-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311122445.3597100-5-quic_amakhija@quicinc.com>

On Tue, Mar 11, 2025 at 05:54:39PM +0530, Ayushi Makhija wrote:
> The SA8775P SoC uses the 5nm (v4.2) DSI PHY driver with
> different enable regulator load.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 27 +++++++++++++++++++++++
>  3 files changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>

-- 
With best wishes
Dmitry

