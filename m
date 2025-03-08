Return-Path: <linux-arm-msm+bounces-50687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7030FA5789F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 06:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D0003B4992
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 05:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEEC5184540;
	Sat,  8 Mar 2025 05:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ix6KklKK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38FD196;
	Sat,  8 Mar 2025 05:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741412600; cv=none; b=TjquYUcYwiNU3ySVwblkl7QGgxUdjrxUD5ICZhLcripnptrWKQ6RrHF1zmkR1qfEvPRsCrJpoL2ZYIih26GOx/bjhzdugCcHu7MO3jKZDaUdaJvVqxDk8ajXriZDgAFNLSy5BYX8k0JZ5TUZ/IvdZpgC+GAmeYdTBALwDzsPurc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741412600; c=relaxed/simple;
	bh=vPGcIo+dX3lU5SKzUanCaLNZJi70a7dPvGebYotrBic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UJqDIBC+XNMaJ2/q9Wawwq5X98uxsz+ajSTurV/NwfxU35QZzm41C0YYv82oVhWsCvRzL5hMXnW3u2rKnuEAxBItfbRIHtSUMNDjkve/ESSR5Pc50ulCpppWaF0CC2JZuW5tg3OCV6EV48wUdrgp2DbYrevh0AjG5bJa3+t4GIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ix6KklKK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4043AC4CEE0;
	Sat,  8 Mar 2025 05:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741412600;
	bh=vPGcIo+dX3lU5SKzUanCaLNZJi70a7dPvGebYotrBic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ix6KklKK61+5qR20kJBOLEDRiMmMcGmlqIoqN3pQimEZaueg+N+2BkzFlLnXUoNg/
	 wKyaHV+uWtIMAYq3MUHH5XA5nSk8AY3VqbKErJVUJbZyAXYHKFr0r7Ad/fVml1KJj6
	 rbTJwv28aMJm9UhT4Y9fJ5pZVjMa8C+SHDVpoY2ghH0Zsau/GrvaB9qD8rK8M/jP+6
	 xDtmgGYj4BLZmP8jy1L0QGGJ6hlnYMHFaUILsKORfyPBxD5wA52RM97Blnv4WxvJkj
	 WzsHNajL6A11Wx3FObOkr/nWq4d26UKnwmOSKa9MvuqgUrCoxJOOsMmlOzZHBpFxV5
	 yD0ZIp+Xo5I3w==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/msm/dpu: Fix uninitialized variable in dpu_crtc_kickoff_clone_mode()
Date: Sat,  8 Mar 2025 07:43:11 +0200
Message-Id: <174141256285.1924437.97313316814458618.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>
References: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Fri, 07 Mar 2025 12:29:39 +0300, Dan Carpenter wrote:
> After the loop there is a check for whether "wb_encoder" has been set
> to non-NULL, however it was never set to NULL.  Initialize it to NULL.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Fix uninitialized variable in dpu_crtc_kickoff_clone_mode()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1b9d131a098e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

