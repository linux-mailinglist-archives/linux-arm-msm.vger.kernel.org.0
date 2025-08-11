Return-Path: <linux-arm-msm+bounces-68545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0AAB21461
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99CDA188374A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2382E285C;
	Mon, 11 Aug 2025 18:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AY6KtuB0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9072E266E;
	Mon, 11 Aug 2025 18:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937027; cv=none; b=iXfa77IlMhnjQbd1M+kmjNVI7HhUahBzKLve/7TkY2pO9EIl2nR6VCZpDngdYgj7oi1Qz+OTCl/HnmPLx6zTuTMMpe7gMBRCnqnwIwkMVgdwym5TfcC9rt3FZuOMKOjbRSH7/kz10X4AEOBzRcKng6gEGIVV3UkrDO0bOZe/0Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937027; c=relaxed/simple;
	bh=ToeU378XNa7mcFjM8LmFCjP4twLYSzkkMioVIdczQs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwRPk2pKSmTt6UCfCbh2Nkoe6PLJNWdq/j2Sv97GYFsgQRjIkF0iWk8lWbQ7JOGoEhx0t6JEgs4TQ2RZa9PmkmzFxoTGcd5/lLwUQNHYOvYI5gPMxklCPUhSkQhSuPoLO3jyEREKqyb0Oum/0giu8qF58RrXK56/JAKZhcA5YA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AY6KtuB0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AD5C4CEED;
	Mon, 11 Aug 2025 18:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937027;
	bh=ToeU378XNa7mcFjM8LmFCjP4twLYSzkkMioVIdczQs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AY6KtuB04J369OsmZY5WPLLMHlWxEKtMRYDNHKEnd69l2I5cg7SmoWrcxrGAViOEq
	 YqI0agLeXYlF3Vmd7NeIr8m7C64aA2w/pNGvA+XRIEeTDGbVZjediEj9D/Ia3tujcf
	 kMg5sGrj+B2PYD4KDGOVFPWa9PoP283rRMlIf8fu1111PhpuyGPenM2Vaaw/H8F/LD
	 yX9Vfq2ZY9OPHCmHInwtoJC67o2teJIMv6QBO5ut5FI2i5DTKwNIru8AUKMRki/COv
	 Y2ZE+WIMCX5yvK0Nq3Sl7ZV7pbEP8fjyWO0Ts2IwtEi2uC+TnVR7GwaVM3gMwLF/1W
	 jxS6lDg0lU9sg==
Date: Mon, 11 Aug 2025 13:30:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Yongxing Mou <quic_yongmou@quicinc.com>, 
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
Subject: Re: [PATCH v6 5/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
Message-ID: <aw6epwnox2shu6tb2btsgnewnhs7ifmur2o7fyuz7ucegtzl4u@57r7q35fxh3n>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-5-dbc17a8b86af@quicinc.com>
 <xfhxrzrzct6n25jtoaacptf2grd44gazfm7fkiyqlhq5bjqujz@bjvacutguagv>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xfhxrzrzct6n25jtoaacptf2grd44gazfm7fkiyqlhq5bjqujz@bjvacutguagv>

On Wed, Aug 06, 2025 at 06:32:20AM +0300, Dmitry Baryshkov wrote:
> On Wed, Aug 06, 2025 at 11:16:49AM +0800, Yongxing Mou wrote:
> > The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
> > the SC8280XP as fallback for QCS8300 according to the specification.
> > 
> > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > ---
> >  drivers/soc/qcom/ubwc_config.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Bjorn, is there a chance that you'd ack merging this through the msm
> tree?

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> 
> -- 
> With best wishes
> Dmitry

