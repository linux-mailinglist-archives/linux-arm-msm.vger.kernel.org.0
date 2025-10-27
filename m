Return-Path: <linux-arm-msm+bounces-78996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 88421C0F90F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 18:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 715884E2936
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 17:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F020311C09;
	Mon, 27 Oct 2025 17:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCiqRJDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0BF1E1C22;
	Mon, 27 Oct 2025 17:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761585261; cv=none; b=L38z9UC+ia734L4AryMcpoCgWwpWCHEooAwzNA8hpar9mWSwoft+Y1JPhjxElmMcbEHz8sogOt4JoudGo5OUleJ2F45eTLC+03l7/fDYI1bfSL/urhNFEum9WRnRrDz21e2YrTW+Wo10/+mByH5QnSd4gcsVN3pEPSzNTfWkt4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761585261; c=relaxed/simple;
	bh=riL/1ZLw+rZSAzmG3LWiquvYVubXh4lPo2gMuGTnZhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcX0jRa8YE+xFfAr0E1vYMBzAw4pPbiE8wpiqHlyr+x1nup771qHRf+WF5mWx+vxxVmFf5qS1zZY5unyKrwzrsejiWuFZ3M7cM6yM/2RoYDY/HnaQxCNGCbAyUgAlKzwHZe0Czr+FePAEPjyi0zeJtDMDt9bq+4ByeN8TxcmOCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCiqRJDA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB6DC4CEF1;
	Mon, 27 Oct 2025 17:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761585260;
	bh=riL/1ZLw+rZSAzmG3LWiquvYVubXh4lPo2gMuGTnZhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nCiqRJDA+4na9AVF0xFYjv6wnEWRHoQPE+dft2faZhJ63T6bpbH3T7/P7P2CP1ptH
	 ibAvGV3SZKL2+jereFKam6Uhk+MeqCT54fH5vgyTDRnHVPH8sOAhMI8VrotdngPsQ8
	 MmasD/CkXAAIEh0BPlq8efTYyN398eGNq/1gxjQ6koLjidYgy5GwE8PkVyFXdPLvC6
	 UnJjQUOnVJurn1sRi3mWnnyI+4x42aiWa5+no/2eStIhgZNbgVaO2t3xPFh5iVPkkc
	 aFpMszJ1c+sf/S0kFumGn4PI3EFNRKgx2+QtplTloxwFflMZF6LPCIfzSSMwCwvsil
	 d6hOlrNPl3CHQ==
Date: Mon, 27 Oct 2025 12:17:13 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <ump2gq7hta5dzul7bwjmb45dtrxezkbticdwis7opl2drmnuyz@wwlanncd6xlb>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
 <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>

On Mon, Oct 27, 2025 at 02:29:01PM +0200, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> > Describe the Universal Bandwidth Compression (UBWC) configuration
> > for the new Glymur platform.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> 
> Bjorn, do you indent to pick up this patch on your own or would you ack
> merging it through the drm/msm tree?
> 

As there's no dependencies between the trees, I can pick these through
the qcom tree now.

Regards,
Bjorn

> -- 
> With best wishes
> Dmitry

