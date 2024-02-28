Return-Path: <linux-arm-msm+bounces-12856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A16E486AB9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 10:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C6E8282E1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 09:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2DC339A8;
	Wed, 28 Feb 2024 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xyf1gmzH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D2932C8E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709113828; cv=none; b=kZaz+r/oKHrGXawfzL3ZMzTt0b9yz09DmPEdCPd5S+SYS7yyr40eJqGkO707zqnjMhkUZBo5CatBoPQnSkn/s9op5ri/54pNr0/FdcuPkcrHS9v3mOEamdQxAQbAhK5WoE2cPYQ451TeVeU8kyhFhtUHPrPkN/My1jmuISCwi0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709113828; c=relaxed/simple;
	bh=YPzigKlKEeZTK5SZuWn7FXoh9j/+b77zjB/GAGIPYL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qL7EATA6p9/tvFL9UdcTQaKSA9UF6WeZLBtDfuAYWUXyTbvy+i9r+hOXvE6hS6ag5fm1KhaHykrBl/78y88KJTiJBukoPmb6CIMUvc076Y1W9ew0HmASlDPWhGnJrwBTYG5n6kDnzQJS2/vLNQ2kGwzzIHYr7FqgKr4xaw3lybw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xyf1gmzH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A01C433F1;
	Wed, 28 Feb 2024 09:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709113828;
	bh=YPzigKlKEeZTK5SZuWn7FXoh9j/+b77zjB/GAGIPYL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xyf1gmzHdTWuJaJaPpmff6GOqWUjC7eSA2RZkczsfZ6rxIKfhDGIYUsHqsDv6045K
	 6s1t2hKs55Efrr6G/fzO0rBG+WK3AUgKCXkQUsrr/vlUmBUBs7iIbeYJNTxwrT/Me8
	 om5JTtUsE9snVg6Am5ctDYRQ57bn0NbYb4rWrj5yGliyq3NpUKqxaduOB+tinwRHyL
	 x3htVB4Qgxn215wy50twxGXxbm6LOFSEzYQS1yo6cW8Bo7ivfgGRzwfynqL1XjVY4m
	 ior0aTiePMn8/41M8pX+FjCaSEEEY6OntTTGBP98D8F5NJp0Og2xZmxP4Fm4Pp+hWz
	 JpCcSBwyHAL+A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rfGa9-000000004V9-27Bz;
	Wed, 28 Feb 2024 10:50:33 +0100
Date: Wed, 28 Feb 2024 10:50:33 +0100
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
Message-ID: <Zd8B6T6ROHFCqEyB@hovoldconsulting.com>
References: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
 <46fa8e0a-0af2-2a44-f5f9-70fd49649aa4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46fa8e0a-0af2-2a44-f5f9-70fd49649aa4@quicinc.com>

On Tue, Feb 27, 2024 at 02:11:56PM -0800, Abhinav Kumar wrote:
> On 2/27/2024 2:08 PM, Dmitry Baryshkov wrote:
> > This reverts commit e467e0bde881 ("drm/msm/dp: use
> > drm_bridge_hpd_notify() to report HPD status changes").
> > 
> > The commit changed the way how the MSM DP driver communicates
> > HPD-related events to the userspace. The mentioned commit made some of
> > the HPD events being reported earlier. This way userspace starts poking
> > around. It interacts in a bad way with the dp_bridge_detect and the
> > driver's state machine, ending up either with the very long delays
> > during hotplug detection or even inability of the DP driver to report
> > the display as connected.
> > 
> > A proper fix will involve redesigning of the HPD handling in the MSM DP
> > driver. It is underway, but it will be intrusive and can not be thought
> > about as a simple fix for the issue. Thus, revert the offending commit.
> 
> Yes, for fixing this on 6.9 I am fine with this.

Since this is a regression in 6.8-rc1, I hope you meant to say 6.8 here?

> I hope there were not other changes which were built on top of this. So 
> it will be better if we retest internal HPD case as well with this.
> 
> We will do that in a day or two and give Tested-by.

Johan

