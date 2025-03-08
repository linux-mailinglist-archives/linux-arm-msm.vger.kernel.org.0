Return-Path: <linux-arm-msm+bounces-50688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DA5A578A8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 06:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53C103B4B33
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 05:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06568190497;
	Sat,  8 Mar 2025 05:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blccUPlJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CD2196;
	Sat,  8 Mar 2025 05:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741412603; cv=none; b=E8qNhOs19VOA935ABjd+eVLTNUlFkrfw+1uMpK+c9vSPVdIjv7fWE9MA8tQpbd4/uxYa3kfxVQ/JuScuD4oJXy7RKpRdksnqLPBI1N02JudJVbAD+5W545SJ7oAZznndZ/ZWr6CsB1pUzz5q2x3l0mDvB5uwIS29tXFnSBDlefI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741412603; c=relaxed/simple;
	bh=lvNTCquoZYOLdzB9Rda/Upj28Ljqn6eKuZ5H/y0HYfc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jIQEfiIElKhNivv4RdP6EJTBmfYfUk1Wk8RXAGFrl3FLo7kga6S1Td25dyFtBSBs/v0PK0t8wxW/52yXrUHzwOzWNRvGIk8C6LxDUUAbtjxLPGE/8IbdxTUKMSN/r77Ic0OFX7uJsm9yPpJyU2UG4fruGH64fq2T/TV3mKipFko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blccUPlJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92ED0C4CEE4;
	Sat,  8 Mar 2025 05:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741412603;
	bh=lvNTCquoZYOLdzB9Rda/Upj28Ljqn6eKuZ5H/y0HYfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=blccUPlJjQ5fUZrnnFy4BsUZWcIANLNXgj+t+/+5ezyO9zO4vj/rfNBQbi8Yn058h
	 krWcPw5ooXABPzvywoDqJWxrtD//lBhvybvU5eSLXmOJZedxPnlCxOcHmlfwnj9mQB
	 0mZdt+Lw6+ndNTDjKXDfmcoLMANL9y2+c2UU7TErGR++Cevz/8vu8z0Wu01SMVJhPM
	 rc4tVhxiXGiz5GvPWq4k0iC2KeYyWwUCg/3e29lARzZPW7yvRc0s42gCcBXB/B3v9k
	 CliKBOq2bHokpZz5L2LQnPN8IPk+zjGznt4kRJEMjY6hmlrQfe8UNUZ3D15P1uo5dP
	 Edp+hbNr76plg==
From: Dmitry Baryshkov <lumag@kernel.org>
To: robdclark@gmail.com,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	quic_abhinavk@quicinc.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] drm/msm/dpu: Remove duplicate dpu_hw_cwb.h header
Date: Sat,  8 Mar 2025 07:43:12 +0200
Message-Id: <174141256286.1924437.12866846639274689100.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>
References: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Fri, 07 Mar 2025 09:50:30 +0800, Jiapeng Chong wrote:
> ./drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: dpu_hw_cwb.h is included more than once.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Remove duplicate dpu_hw_cwb.h header
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2060a2db1253

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

