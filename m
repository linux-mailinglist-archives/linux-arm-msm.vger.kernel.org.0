Return-Path: <linux-arm-msm+bounces-58691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAF3ABD518
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 12:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83F638C0D0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 10:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A67426FA67;
	Tue, 20 May 2025 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tjX2seFj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B519B2701B6;
	Tue, 20 May 2025 10:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737157; cv=none; b=BS5mpnKo6BQ1AyW+5JUqqo3RSE17BfYFLU+DZNtb5LVFTKU0M6rGelzPC/90NfX4BSBIHZW64a/1rw9FSDcBXc7GzDRlWjCGz5svfUs6J/H/ReKQmgP8Srk8EG2QUejExIhw7J3sWb9UFH0cePtL2Ux3LjzHrmgOQo0c9/fH7Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737157; c=relaxed/simple;
	bh=zDpmgNIk0KgV9mLpwYhAEJqLphnW13jDgqbiqxHvUZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2s3ogxH4EgRmOEa5PiiTB98BmZ1hxg2NhxPaAoMvpzXRUUk75V1EEDA6+kR1qi6uJIJcII7OAujEcgz4zcgaB2prcc2gEiKZ4ykMIcYjyJp16h983PycJJIyia/qPsDE8l6/2tuUguE+dUu5zgboC2E1IiV25VWoNCBajkjQT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tjX2seFj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692E5C4CEE9;
	Tue, 20 May 2025 10:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747737157;
	bh=zDpmgNIk0KgV9mLpwYhAEJqLphnW13jDgqbiqxHvUZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjX2seFj28kVM1MCXRY+f4rM7a6JeGQTg5sZWiT7PoHTMpa7d71V2Vyq6JSvj9t8a
	 E5o3GukKw7ov8CeHsC+2FgCmGihirW/DYnQRdJxylygaMBXon3pi+ttHqJWjCT5fCY
	 SBHmeb4L7oIBVDXPiE2VyuQ3avQck5Tm14PYsAWs=
Date: Tue, 20 May 2025 12:32:34 +0200
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
Subject: Re: [PATCH 6.1.y 1/2] drm/msm/disp/dpu: use atomic enable/disable
 callbacks for encoder functions
Message-ID: <2025052007-penalize-gummy-61e2@gregkh>
References: <20250512033116.3331668-1-jianqi.ren.cn@windriver.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512033116.3331668-1-jianqi.ren.cn@windriver.com>

On Mon, May 12, 2025 at 11:31:16AM +0800, jianqi.ren.cn@windriver.com wrote:
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
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

If patches are ment to be in a series, please properly send them as a
series, not as individual emails like you did here :(

Please fix up and resend.

thanks,

greg k-h

