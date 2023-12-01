Return-Path: <linux-arm-msm+bounces-2831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A95E380052C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 09:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62C5F1F20D67
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 08:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D4815E95;
	Fri,  1 Dec 2023 08:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxgvgbWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3407E15E92
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 08:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9066FC433C7;
	Fri,  1 Dec 2023 08:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701417971;
	bh=rSTgwpB4g0HFcXSHaBEs360QwFlsfjE5INflcdboa6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bxgvgbWMEJ996BM61zZpPKE1MFIbj/k5V8TbNU7apa3Wb1IQwowCQR8wyo+Vc8UbW
	 gtAd2d0aA9g1Eke/dZmv5v4yHxQKmoo2AW7Hpe+trJfxlhIR+lVal1W/1O2KH0lksH
	 1ds/DqxuZYCb1bQ5rHCwI+zvhr/KjA5BoufD5hDsReZ2+31HYGTsxw5/x90mZXiz9v
	 9oPc+3PwFG9L1uczidEz60/ufBYaPuKwTT6HvBFUzV6RFLi1HxmbCrZ1Y4beb1C+3a
	 9n39e2EEv2A0TVsXhUA10xh7KDMblgJn9Opzw2llVou4V2GrB8NZBQmTEPU1ddD0Ed
	 2X4Im0pVhtn/A==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r8yXt-0005H6-2b;
	Fri, 01 Dec 2023 09:06:46 +0100
Date: Fri, 1 Dec 2023 09:06:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in sc8180x catalog
Message-ID: <ZWmUFdWif3QGrqQc@hovoldconsulting.com>
References: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>

On Thu, Nov 30, 2023 at 04:35:01PM -0800, Bjorn Andersson wrote:
> Similar to SC8280XP, the misconfigured SAFE logic causes rather
> significant delays in __arm_smmu_tlb_sync(), resulting in poor
> performance for things such as USB.
> 
> Introduce appropriate SAFE values for SC8180X to correct this.
> 
> Fixes: f3af2d6ee9ab ("drm/msm/dpu: Add SC8180x to hw catalog")

Missing CC stable tag?

> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Johan

