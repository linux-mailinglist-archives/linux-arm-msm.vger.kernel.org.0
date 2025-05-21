Return-Path: <linux-arm-msm+bounces-58827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5940CABEAE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 06:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 135FB4E0189
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 04:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBBE22AE4E;
	Wed, 21 May 2025 04:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UqLAT7GQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB64F9CB;
	Wed, 21 May 2025 04:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747801093; cv=none; b=kIOThohTCmIoBVlQ2eMGqxAQk6TiqZTlggNA8kaT5u4u5od3sQav+WMeimhapNGq4rnEQsfKUj9uobthgyrdJTZ+MyNyPUHARv5lWw4ukIUl4h3osBZJ+RcNbBmd+1CCPiOrLurzEk5P0FKwcYxSqGGsOOMhvVxKij4Ii7WLKF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747801093; c=relaxed/simple;
	bh=DB6VT8aKMtNP9KOm3UMQ4Jm/jRsL35dYO+8TqZEQAqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDMjB0Z8eQ8KcGNRtUz09xnMTGpH+bKfn9MXlpIqSVJoud6bHX60DtMpODCuX8at9C3kcO/A1xhmj8We8musB2yo5J/oLo+X/HPfrBAFm2n0hA2288ctodDxqsfk/yG4yulEYk7irlfn4ISAl2OWrNY/IRYoKI6VTXXa5kGfKMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UqLAT7GQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16311C4CEE4;
	Wed, 21 May 2025 04:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747801092;
	bh=DB6VT8aKMtNP9KOm3UMQ4Jm/jRsL35dYO+8TqZEQAqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UqLAT7GQEac+NN8TnTVMZpwpLPeKu9UYJ/HbKyFwY/STWKIzH/drSnuedbW5WxkJh
	 2SdbnbXyx+xJPzwNHCLITv6jrtwWt+OAffvzXpHEEXR48AdMZd2GwNvuWvg11Ntb54
	 wYsf6IXJpOSFtX+EtThYAy9SIsIX+fl/IHEeP1hM=
Date: Wed, 21 May 2025 06:18:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: jianqi.ren.cn@windriver.com
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, robdclark@gmail.com,
	quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
	sean@poorly.run, airlied@gmail.com, daniel@ffwll.ch,
	sashal@kernel.org, quic_vpolimer@quicinc.com,
	quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	quic_kalyant@quicinc.com
Subject: Re: [PATCH 6.1.y v2 1/2] drm/msm/disp/dpu: use atomic enable/disable
 callbacks for encoder functions
Message-ID: <2025052142-wind-chatty-63e5@gregkh>
References: <20250521012109.1977775-1-jianqi.ren.cn@windriver.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521012109.1977775-1-jianqi.ren.cn@windriver.com>

On Wed, May 21, 2025 at 09:21:09AM +0800, jianqi.ren.cn@windriver.com wrote:
> From: Vinod Polimera <quic_vpolimer@quicinc.com>
> 
> [ Upstream commit c0cd12a5d29fa36a8e2ebac7b8bec50c1a41fb57 ]
> 
> Use atomic variants for encoder callback functions such that
> certain states like self-refresh can be accessed as part of
> enable/disable sequence.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Patchwork: https://patchwork.freedesktop.org/patch/524738/
> Link: https://lore.kernel.org/r/1677774797-31063-12-git-send-email-quic_vpolimer@quicinc.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
> Verified the build test

Please see:
	https://lore.kernel.org/r/2025052021-freebee-clever-8fef@gregkh

for why I am not taking any windriver backports until you fix your
development process.  Again.

{sigh}

greg k-h

