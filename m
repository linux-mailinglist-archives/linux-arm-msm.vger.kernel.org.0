Return-Path: <linux-arm-msm+bounces-41365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB209EBDE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 23:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65BC41667EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 22:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B3E1D0143;
	Tue, 10 Dec 2024 22:33:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF9F1EE7DC;
	Tue, 10 Dec 2024 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733870031; cv=none; b=AoZhY8cqFPMQxC88pKg0E0NJ6u+ZbeYmsDHC8MkaFSdFwGoWQZTn1L3WTM5tym8T/+2LxWvYoRSzbsluujTfycvbaiSbNOjRn8Urk8pmtdye3RadflIUCkt4OYPwr9tn9+zdXQhRb5yY9auHEVj5ZD4k2FHbQ29gpNDv9DM3UkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733870031; c=relaxed/simple;
	bh=LfscyWWl6+HGjgaF7cqByFfruwjVxqGh4cFTwHTDglk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQdhj22MT66dWHHwKFCJ7QBhiHzommRfK3lOFq085AYXs4oyZj/jDE969re5hRtv02iP9Ou30qVeC3yCfRGRUm+a2Tiz8pgW9gi4V/6sKhJCEjay7IN4X8Ux7rUFxd84y79xpTaM61JEpaBRZmxWGcrpSWw/YZNQ9AHqe2dcgkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 23CEE1F8B2;
	Tue, 10 Dec 2024 23:33:46 +0100 (CET)
Date: Tue, 10 Dec 2024 23:33:44 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 0/3] drm/msm/dp: Fix and utilize TPG with a debugfs
Message-ID: <zmbipw4zmcdabimxdd4adyzeqhy5dyoburjxene4ub62ws2pym@drvsjowufdh2>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>

On 2024-12-02 12:41:57, Abhinav Kumar wrote:
> DP Test Patten Generator is a very useful tool to debug issues such
> as blank screen or corruption seen on the DP monitor by isolating it
> to whether the corruption is coming from further upstream such as DPU
> OR from the DP controller and below. It was noted in [1] that this API
> is unused. Rather than dropping the API, it should be fixed and used.
> 
> Hence, this series fixes the DP Test Patten Generator API and also utilizes
> it by adding a debugfs for it.
> 
> [1] : https://patchwork.freedesktop.org/patch/623508/?series=141074&rev=1

This all sounds great, but perhaps the "unused function" issue applies to the
DSI TPG from your series at [1] as well.  There, the patch describes where to
insert the function call, but I remember that the contents of that function also
changed over time.

Are you planning to add a debugfs entry, or perhaps entries to configure the
pattern bits for DPU's DSI TPG as well, as suggested in [2]?  Or should someone
else look into it to make it useful again?

[1]: https://lore.kernel.org/linux-arm-msm/1626922232-29105-2-git-send-email-abhinavk@codeaurora.org/
[2]: https://lore.kernel.org/linux-arm-msm/CAA8EJpqjWbEbgn9Sw=Hd8f7pP+NXDeM308jG8HirKjk7QcfOxA@mail.gmail.com/

> 
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Stephen Boyd <swboyd@chromium.org>
> To: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Abhinav Kumar (3):
>       drm/msm/dp: account for widebus in msm_dp_catalog_panel_tpg_enable()
>       drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for tpg
>       drm/msm/dp: add a debugfs node for using tpg

Should TPG be capitalized in these titles, as it is an abbreviation with
capitalized words in your description as well?

Thanks!

- Marijn

> 
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++--
>  drivers/gpu/drm/msm/dp/dp_debug.c   | 61 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
>  3 files changed, 76 insertions(+), 2 deletions(-)
> ---
> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
> change-id: 20241202-tpg-3f7543c036ac
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

