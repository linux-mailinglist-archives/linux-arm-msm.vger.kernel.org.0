Return-Path: <linux-arm-msm+bounces-41232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D329EAA7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0333E16631B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 08:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B6822F3AB;
	Tue, 10 Dec 2024 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMz5dKEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5283C3594F;
	Tue, 10 Dec 2024 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733818975; cv=none; b=tygjtJTEFxqiExK5Dq2v6mKXBPDMg1EyVPXou3e4lVPGVNWIF2pJgYibnpTKmVA7VRpre37hfW4ON+r32KGv1NWjQqrII09AFoG2dbmboHiVaoH9dlYuhvcjhJdqHSvD3Hq/Xi5YDsGfpjMUhA9e2yOPsTPuxSSrZfOLOf5TvHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733818975; c=relaxed/simple;
	bh=H/PTpiyd1g/IZatSOIJyE5v4tK2Tp2P8REfRjdVko4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNlq31vvUjLlxXWRlUS3oocfzbdvNqAU7AiBTFI5bw53zpEr6vf1b2R6SGJuGZqgDJpw/LHcMu6mAziM5I5u/X+CV1hvHJvAfiZwvKHRaz+a/pTIyDf04RIYy1l6cu9OiLY49Mi8u47Un9CtoOHP2nAZcw1FsGRbdwYoi5x55gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMz5dKEA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D04C4CED6;
	Tue, 10 Dec 2024 08:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733818974;
	bh=H/PTpiyd1g/IZatSOIJyE5v4tK2Tp2P8REfRjdVko4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMz5dKEA2L6xUVKxPshuIC2YwO4FaUZg7x7jYtbc2WI2Pmc6Sk91T+zJJmQ3B650t
	 M8sHLArKw3RI1w066pghtaLGlY9QW7el0OsHkFud61JlgSNujaSSWVcFXfMXrtQrUc
	 uq3Kto9hUGYZmplgdRUpvq0pXA3Zzi1LziHC9TTWjyZ3RoQawq+KqKzpwz1egySdZw
	 vQNg16EMvxf5k9WXM0C9DhqMDxt+6HQ55UIhpeTdsFV8KYf7rg9wdWmkXVoCc2NM1q
	 fjK5fuSGIErg6pQ10vnr5oyUpcWb9U1mqQi+HjnL8o4wKYfbr+iVQGuNcbqIv+YG0G
	 0dVFd0hbmS60w==
Date: Tue, 10 Dec 2024 09:22:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/9] dt-bindings: display/msm: dsi-controller-main:
 Document SM6150
Message-ID: <td3344qs5xhvwiigmq7rn5kmxvn5haa4tqjmgiwcrppmolpdkz@3f6hcxguxlx2>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-2-2d875a67602d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210-add-display-support-for-qcs615-platform-v4-2-2d875a67602d@quicinc.com>

On Tue, Dec 10, 2024 at 02:53:53PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Document general compatibility of the DSI controller on SM6150.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


