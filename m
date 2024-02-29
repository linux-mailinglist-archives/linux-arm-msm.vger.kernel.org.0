Return-Path: <linux-arm-msm+bounces-12940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CBA86C278
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 08:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B9111F21EBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 07:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255F437163;
	Thu, 29 Feb 2024 07:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UU7Tl3d+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0186D2231F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 07:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709191610; cv=none; b=IMuQdW+uPfEGxxV0gUQJZJ7TfN+2/boo/Fj9GE8OlgADVs4vMv/qY3ZGpZIbkB08vqXg3PwN/7WMGbkEKjHklaEzUjdNYTBUHWWx1M8wn7WsL7nFkTVtkBF5l5s/AZz0A3Bz3WPGmEGIDAuA7isA5pUh7T0FdcYg9vXyAVi/rLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709191610; c=relaxed/simple;
	bh=rMk9Mq5uSwnCF4Vo6oHey/a58txk1WO/19yQeIrkNSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9j+0iAtxmc8IPza22vDHw+Kn8Cc7ue5y1MwzvCbKZq5ZnyRQ/pt8w1BoHuY+6up3qz79gmk+4RD5WFqZrsDFG9bx3CqjCR3elasadS7A5m1IavW8emAt+TgpcKPU/qGfYm6tPWyaCxS4RaYu0xzA2doRK++T+PS+QUNY4WUasI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UU7Tl3d+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8CBC433C7;
	Thu, 29 Feb 2024 07:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709191609;
	bh=rMk9Mq5uSwnCF4Vo6oHey/a58txk1WO/19yQeIrkNSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UU7Tl3d+FHVbZACDNCYqUysPv0VOScznnblvu9KlrKpKNctZzBoF5OTmD/8ZBeUCY
	 cLubMJxr5Xn++8AjAskuej1W1RbIsRXTJDBVvkGv8KH8wl98YQQ3B+QCTUWXs39Etq
	 NHBOd1u9tc0W7up5CfrTfkp8a47Wk0N8gCY88fAeQ/qtZ7sqXuNnesaBq1FAV5YSO9
	 c8JYbJp3FfjKR/Zd1Mc5H8or7YfIqR9a228MXJi3hvN+GL+OVlSH95MuXLIbVq32ry
	 Kkkdb17vs7rdH6BVlK+uAM2vcJj7rmiOjOs/ZQlxXle/m2qneLUemKWKHOoB1dWMvu
	 7YuU18DR0iNIw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rfaoj-0000000009i-0mvc;
	Thu, 29 Feb 2024 08:26:57 +0100
Date: Thu, 29 Feb 2024 08:26:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH] Revert "drm/msm/dp: use drm_bridge_hpd_notify() to
 report HPD status changes"
Message-ID: <ZeAxwVa3aGlstfdr@hovoldconsulting.com>
References: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
 <46fa8e0a-0af2-2a44-f5f9-70fd49649aa4@quicinc.com>
 <Zd8B6T6ROHFCqEyB@hovoldconsulting.com>
 <CAA8EJppvansib9NxqPcuuAVe+qc1i8HmDqNh6+kaDZn6zFijpw@mail.gmail.com>
 <Zd81BWaj5zJeDA2Q@hovoldconsulting.com>
 <a8b68a42-f41d-5ce1-0d14-7fc158dff673@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8b68a42-f41d-5ce1-0d14-7fc158dff673@quicinc.com>

On Wed, Feb 28, 2024 at 10:10:10AM -0800, Abhinav Kumar wrote:
> On 2/28/2024 5:28 AM, Johan Hovold wrote:

> > This is a fix for a user-visible regression that was reported formally
> > two weeks ago and informally (e.g. to you) soon after rc1 came out, and
> > which now also has an identified cause and an analysis of the problem.
> > And we're at rc6 so there should be no reason to delay fixing this (e.g.
> > even if you want to run some more tests for a couple of days).
> 
> Yup, we landed it in msm-fixes now, so this will go as a late -fixes PR 
> for 6.8.

Perfect, thanks!

Johan

