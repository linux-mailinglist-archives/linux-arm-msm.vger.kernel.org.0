Return-Path: <linux-arm-msm+bounces-3189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3B4802D8B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 09:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A72121C20A40
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 08:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52155FBE8;
	Mon,  4 Dec 2023 08:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9/YXd2F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353A8FBE5
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 08:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAC1C433C7;
	Mon,  4 Dec 2023 08:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701679794;
	bh=uG10quNAaJD23Flc15bDB89K/G4XtxgxZ8Ig/bMsvwg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Z9/YXd2FuWQfC8SXxbmvuad2BsQzC8grc2YLa+GPJ9JTXbwydLMq7kC3vFMhd70yo
	 4O83uHoCRZoBgTGTXAZOQoDlC+xFt3t0RXEa1FA7Glgsa5AEGCBrmGws3Qjgkp9znB
	 Mdz3alfvFgkPbN/LLj5W7cHkE4HPPzN0azApR3Hug5B3aGkZnrh7LssoEnSsfAmFoJ
	 ZzJQrW632grwyeq03MA/ZGZ6MR3LtXSl/aOtSDGnAgRXcIcEFrDfE6W77KMvL7n2gC
	 gsxFVmQFJoxEmHDM52t/rrrMG5YP/0qIR5+/SU7rV8gNKjwfYVF3WpATtGcO/Ye9Fo
	 YcIv0PIw+JfjQ==
Message-ID: <335240cdb8b6b980c2380bdc25fb2833.mripard@kernel.org>
Date: Mon, 04 Dec 2023 08:49:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RESEND 1/5] drm/atomic: add private obj state to state
 dump
In-Reply-To: <20231203000532.1290480-2-dmitry.baryshkov@linaro.org>
References: <20231203000532.1290480-2-dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Rob Clark" <robdclark@gmail.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Sun, 3 Dec 2023 03:05:28 +0300, Dmitry Baryshkov wrote:
> The drm_atomic_print_new_state() already prints private object state via
> drm_atomic_private_obj_print_state(). Add private object state dumping
> to __drm_state_dump(), so that it is also included into drm_state_dump()
> output and into debugfs/dri/N/state file.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

