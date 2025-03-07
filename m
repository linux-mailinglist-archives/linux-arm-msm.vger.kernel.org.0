Return-Path: <linux-arm-msm+bounces-50593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A23A55FAB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 05:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBCCE1896264
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 04:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C97197A67;
	Fri,  7 Mar 2025 04:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULo03jYg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F364642D;
	Fri,  7 Mar 2025 04:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741323362; cv=none; b=GN0hBhw/QIiLWRl8bO5yejOaiPet5q2ngdWyERpVJXDahAu/kRiNWV6ifH/DzIhOhxmCKbn4SVQqgBFsulHSNCJq7LgsBJ5S/vKLtdnb3isX/dnwy4N3QjfqCBhk+ZDU+0flrTf7VAAODA6UCnhAAi0AvLP/pUjbQGQ5hkjom9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741323362; c=relaxed/simple;
	bh=XWXNbvIxximv5SHxdHtGkkmkTEQ52Z6C89taO57X5vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hHQdb6xGqSMgbpAf4odBwq6B6eaJUtgb3H8Udcrr/8Bfjru6nBF+bHKPn8NxjuP4WuB7L6hyLp24frVf+6FvhUZFo3JL/0c+R8ha5MaI/FWCekI6ZTnFAJFTFNgGg0L2GSjz0Wu/sug+ez6X+Zh7EpZnai1edSM+Qh8NXHTRQow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULo03jYg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A0EC4CEE2;
	Fri,  7 Mar 2025 04:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741323362;
	bh=XWXNbvIxximv5SHxdHtGkkmkTEQ52Z6C89taO57X5vg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ULo03jYgTl/A7Sx10Lga84AvKwy1O12N+xCjWJyIPIArQaZa5HBodckhx42j5xwIr
	 6AoZldOCszwDEgq1EMj6SJKsz70+HZmADYyW7vbcd8RHYp4Fz8FozS0bKTgUnU5NmP
	 LGOxjePjhQvnjV598JHP/+GZ27VSh8VBWFFwqKiJWvKgaNOjcGCWT6sEJJiVJ/uFOI
	 Q32kIV+6yErdgDDa8ZglQJvyk25+3yd5M5k+jaWRDibXba4DJhPcp/3XuuZVQGDvj2
	 0la0QWB+sfqL3gddVr9NgVGCIkemlp+3zyeTv4adp1eFo/pJ0iPtCVyH/RLlDnv/Z6
	 YIAtiLLFZN4Gg==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Chandan Uddaraju <chandanu@codeaurora.org>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Sravanthi Kollukuduru <skolluku@codeaurora.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Archit Taneja <architt@codeaurora.org>,
	Rajesh Yadav <ryadav@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2 0/4] drm/msm/dpu: follow rules for drm_atomic_helper_check_modeset()
Date: Fri,  7 Mar 2025 06:55:46 +0200
Message-Id: <174132327775.1133698.7325717045129206986.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
References: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Thu, 23 Jan 2025 14:43:32 +0200, Dmitry Baryshkov wrote:
> As pointed out by Simona, the drm_atomic_helper_check_modeset() and
> drm_atomic_helper_check() require the former function is rerun if the
> driver's callbacks modify crtc_state->mode_changed. MSM is one of the
> drivers which failed to follow this requirement.
> 
> Rework the MSM / DPU driver to follow the requirements of the
> drm_atomic_helper_check_modeset() helper function.
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dpu: don't use active in atomic_check()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/25b4614843bc
[2/4] drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7d39f5bb82c0
[3/4] drm/msm/dpu: simplify dpu_encoder_get_topology() interface
      https://gitlab.freedesktop.org/lumag/msm/-/commit/41921f231abf
[4/4] drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2dde2aadaed1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

