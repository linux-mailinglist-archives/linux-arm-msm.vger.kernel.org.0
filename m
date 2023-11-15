Return-Path: <linux-arm-msm+bounces-678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A93927EBE5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 09:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DBA82812D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 08:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68895239;
	Wed, 15 Nov 2023 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8acyOhc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2C6522D
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15325C433C7;
	Wed, 15 Nov 2023 08:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700035709;
	bh=FrpH99pmwPh2F9FlzZlkzcWpBUQxotTE5nvhX+03e28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8acyOhcKcJVYn2zmm5mfTdkmaM4/PFGG/coN2r2+xcaqdrKMtxCDNnsKmhw10ZrZ
	 R56BstdttA7H1SFLYPpSw2G07DIc2rFfVd/fAu3gMnUlDr+Y1DnEs21uFapMElYRVv
	 VrKXAPeOx8+3iuHKaa/hPruqVejo0c1xZzSLaA/vaDo9Wttwe6IPIFZD+1Vjq5EqUu
	 EE2w4FwtfWShvYXu/o/rfmFUG2V3dElv1XvYKP+IAz0VrZCkrCpXXbTBHVlKBccqwN
	 T3+0z00arlYyJQ7x92TKYbnobj66fx3OzE77LSzNVBn2kOY9GMhwuetlECmjg40fHV
	 LE70K5H9G8CCA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r3Awk-0001ZJ-0N;
	Wed, 15 Nov 2023 09:08:26 +0100
Date: Wed, 15 Nov 2023 09:08:26 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dp: don't touch DP subconnector property
 in eDP case
Message-ID: <ZVR8ei0Dv3Cvoe4A@hovoldconsulting.com>
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
 <20231025092711.851168-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025092711.851168-2-dmitry.baryshkov@linaro.org>

On Wed, Oct 25, 2023 at 12:23:09PM +0300, Dmitry Baryshkov wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> In case of the eDP connection there is no subconnetor and as such no
> subconnector property. Put drm_dp_set_subconnector_property() calls
> under the !is_edp condition.
> 
> Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

