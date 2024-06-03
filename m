Return-Path: <linux-arm-msm+bounces-21444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D72978D7CBC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76A761F2104E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 07:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3AB85025E;
	Mon,  3 Jun 2024 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="it7kWkBN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1114A9B0;
	Mon,  3 Jun 2024 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717401013; cv=none; b=PZCtY8TXA3m/bxILcSZ9V5hLcp6quFh/I4TLuVdUQR2Njq1V839X5AtsgTWvWAwiSoS0TN5YsKE0K5Oh0K7dXG2Wc8tMkQb8sufihswVW6Dv37S7Yk9j8Pf3NB+il7WURlc+iFLVpJq7kaK0/oyHUGKSiF3U0DYBllskS7Sq5jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717401013; c=relaxed/simple;
	bh=bQlI9YMS22qymPKDMk4SXp/XJcph5kSjXXhPH31SMjE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=bTF72YVFfw5sBhESV0iNwrNPAFbsoMngQM35YSZ6hLQ9Sf5+ayvWBYiRRCcPzNtqjU7nlxoSIkXJTxV1M3dvTzl6BonS179TDMkPeBYbPkbnvnYa3rADkEXfej5hC71C5jSL4FJzsTrQzl0xXMCmzVgVbYzNdiQB7ahXyj5hJHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=it7kWkBN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFF3C2BD10;
	Mon,  3 Jun 2024 07:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717401013;
	bh=bQlI9YMS22qymPKDMk4SXp/XJcph5kSjXXhPH31SMjE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=it7kWkBNx425GZX9DlLNkdFDQEOHMB2O7V9ylBZd8A4QESV8J4/L/x/GezUCN7469
	 uQMJcjfJx93n44wWQkGZZ1Wme4LAAUneYA/8CpyheDo4ixNxORqjQsGrm9jxciKpuC
	 6Lw/eHBa6xrRAnNZbrF5saPP6qeq2322l8/MFl0LR+gy9SdBb2SbG73zz4uIyLsp1m
	 gijbvJe51wcaX8Tj3/ukZE+36v6j4+tcOVwwVqEV7Zv8bvYlwlcFIANB5cLX4Vxrg2
	 +mTCaJb2B5Jqyg0b1n3d0EdzbICPhKFrb1hMJliXgGebmy6mdzI+6MJtD9i3l8Sn26
	 8lTyKBHFEGOKQ==
Message-ID: <f04da052e216872986251486c5d305ca@kernel.org>
Date: Mon, 03 Jun 2024 07:50:10 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 5/9] drm/msm/hdmi: turn mode_set into atomic_enable
In-Reply-To: <20240531-bridge-hdmi-connector-v4-5-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-5-5110f7943622@linaro.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sean Paul" <sean@poorly.run>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Fri, 31 May 2024 23:07:28 +0300, Dmitry Baryshkov wrote:
> The mode_set callback is deprecated, it doesn't get the
> drm_bridge_state, just mode-related argumetns. Turn it into the
> atomic_enable callback as suggested by the documentation.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

