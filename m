Return-Path: <linux-arm-msm+bounces-50595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9873DA55FB3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 05:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D224716ADF6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 04:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524621993B1;
	Fri,  7 Mar 2025 04:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZwN7fCw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E69C19CC3C
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 04:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741323368; cv=none; b=PvsDbq5e8yqWu1PvgD8KjdIlDjoHPPWJ53b8527MLAxQedcp+BSLwNRUbA4p58UHkc8E5lNz1GLW9zSPo9wVIkRevOCZuRVI8YBIvhLVVGGMDYclFuBWrMh34Q8f5VVZdAv7ynEQ1CjUz8NDA0CHE2KF/IxxBrlo6EcHVPOn8hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741323368; c=relaxed/simple;
	bh=/FTvvO/mtnQkcgcKCJW0J9mjF0skEwBxbmqqFY+cVNA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sL6gkEIP0yDMTLZQGC3/ragFs8zZjQdMa+uG7hhYn0LqyGFuGHQouwj/tX02bWdXOsQfoRiLIUY06fonLeiaAxZq4q/bFyA9IvGG/Jp2GhxZUCV/42f/dWArye2H3ZRTPB5X8qKO+jiC7gm4wEeieRUPe83A0XOLsl3BETpLgWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZwN7fCw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8380CC4CEE2;
	Fri,  7 Mar 2025 04:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741323368;
	bh=/FTvvO/mtnQkcgcKCJW0J9mjF0skEwBxbmqqFY+cVNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JZwN7fCwz5L/P/DNiQHydvcpKWVS+HeafEzi8JklRXunsJEvT0NSmskXhAMaNdhjA
	 o2lZ/QZwveT+MUikfpU9U90gcRvy09M4NZa74GeMyHGZWak56oytQ4CCwaOhqR97tY
	 JDw+iPDMAoerXn19vGrnst22qBVBGieAT0tKzmF8vViSTx6yextxlYZt3cVw3tiZpZ
	 Sb9vOyDfDn2AoY8WGTJJZ01iotuWIJoF8R1SHmNBJxu5AiHg7JpszlLCu3jjnJXbYp
	 7oZml8KhgxvIaMua4T13QC8AxQ7CNQEC7lkksqTqGNuorB3c9CHHEAGMmwxtRus+MT
	 ZjtZ4N9PCVpdQ==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 0/8] drm/msm/dpu: rework debugfs interface of dpu_core_perf
Date: Fri,  7 Mar 2025 06:55:48 +0200
Message-Id: <174132327773.1133698.11593954673620366457.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Sun, 09 Feb 2025 05:21:10 +0200, Dmitry Baryshkov wrote:
> Bring back a set of patches extracted from [1] per Abhinav's suggestion.
> 
> Rework debugging overrides for the bandwidth and clock settings. Instead
> of specifying the 'mode' and some values, allow one to set the affected
> value directly.
> 
> [1] https://patchwork.freedesktop.org/series/119552/#rev2
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dpu: extract bandwidth aggregation function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b9aedd32a817
[2/8] drm/msm/dpu: remove duplicate code calculating sum of bandwidths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/795aef6f3653
[3/8] drm/msm/dpu: change ib values to u32
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c54b61102f46
[4/8] drm/msm/dpu: make fix_core_ab_vote consistent with fix_core_ib_vote
      https://gitlab.freedesktop.org/lumag/msm/-/commit/879a7f8c8c2d
[5/8] drm/msm/dpu: also use KBps for bw_ctl output
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f6c782ea7de5
[6/8] drm/msm/dpu: rename average bandwidth-related debugfs files
      https://gitlab.freedesktop.org/lumag/msm/-/commit/40fc01273f07
[7/8] drm/msm/dpu: drop core_clk_rate overrides from _dpu_core_perf_calc_crtc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e7e2495595e0
[8/8] drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6d3175a72cc0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

