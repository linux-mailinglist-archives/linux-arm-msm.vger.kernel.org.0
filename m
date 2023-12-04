Return-Path: <linux-arm-msm+bounces-3187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A74802D72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 09:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 520C8280DBC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 08:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C557F9C3;
	Mon,  4 Dec 2023 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBYUMdw3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE5EEAE5
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 08:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3194AC433C7;
	Mon,  4 Dec 2023 08:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701679427;
	bh=7hGwnvV/znPEpwiJjYANraB69RFrj7nI1Ml8VtCdtzk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RBYUMdw3ArodhkfMx8zay/IvAnAFif4xxhoS4zaNWoAYILdNfED141Z6aYyHO2uk4
	 HWLIqNzpNXYt2E9Vz0+Xl3dPFT+fLDbTJbH5Ld9j+qtI8oh1LENwxmUuOkpW03XhbJ
	 ns7H5dPeyn3TvQSUEqUZVyBVn6HQPUlBd7/tSmUkjL2GJkB3f6RoSLAnZLNN9e3iJ2
	 AH842rmIvM8J2rYR+nKEw3IUTthhVg8dDxEmCHIbA76jRGa05f7jJ0AZzYeJx/mKlf
	 75EgHvSzA/bVMYeE7SHCAUvok19GNpQ7kw5CLzLLXEIGX7aZbEp6V58Tm9NaNhcHXw
	 qyKyoLrmZrlGg==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20231202225552.1283638-1-dmitry.baryshkov@linaro.org>
References: <20231202225552.1283638-1-dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH RESEND] drm/drv: propagate errors from
 drm_modeset_register_all()
Message-Id: <170167942469.3617818.5168906828473373855.b4-ty@kernel.org>
Date: Mon, 04 Dec 2023 09:43:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Sun, 03 Dec 2023 01:55:52 +0300, Dmitry Baryshkov wrote:
> In case the drm_modeset_register_all() function fails, its error code
> will be ignored. Instead make the drm_dev_register() bail out in case of
> such an error.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime


