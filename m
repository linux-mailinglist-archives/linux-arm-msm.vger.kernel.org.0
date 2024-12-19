Return-Path: <linux-arm-msm+bounces-42778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F20329F794C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 11:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 543CF168C81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 10:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6910D221DBC;
	Thu, 19 Dec 2024 10:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+5u/pRy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4241FAC29;
	Thu, 19 Dec 2024 10:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734603261; cv=none; b=fYgN5Dtj09nji9mkZiL6eu2G4uHF2WItuqtAwZVRM8Gq/5w8xeUtulCcy8dLOACgqcLUNUXL9tWmV4jH1ibzGQsZLa2CQIlXSODdyq2fRcWMn/HXDijRUAZG7zWPqgBrtqKlVUPYoRdrSHclNT299+Vf4jO3Ver0aIqtg/ZDSj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734603261; c=relaxed/simple;
	bh=41LpMb62D3EpqckyjmkYsBIfTP+Hk6XNyWVa6ZEbiys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRQ5X7IKPst6g0ePMhGliPUuYaZErdVc7v/7dRBdU9nmMI1PmnPV4tEvJ7yAioCgjgdgWX6Fgd0lSXe86MZH41j/AZ9PjyHNn4YXOfxqQALMCSpWvBq3JrxHvMpg+rLhECtqckOEEqMi0LgduXVnDcc2r7rzttnOztTxkpL+G1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+5u/pRy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBF2C4CECE;
	Thu, 19 Dec 2024 10:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734603259;
	bh=41LpMb62D3EpqckyjmkYsBIfTP+Hk6XNyWVa6ZEbiys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l+5u/pRy82YXfAkLjmmEojOkPElis9GSEoF6cikqIAzgS3v/RSgP1Bg2qZNLsDncG
	 C6hJKhGZMSdgpXMSTKYhoLz57JSzDTgrrDJvriWuGA2F7nFnvQREuAmMqUnaxEnIrt
	 qvX8Ya8YTW3D7H1SoesBWLH61aHDEFpAQTdFf6T0nGXGFpg8u2uWsq2qSPo3YDYpmv
	 ozuRv+LMGWsnvxPLbguxDHzBC2JNaQQfBV0MbCJqerTH1g0C0LwVLwBNvuMf3SeEiu
	 0YwoyVloSe/jawLsKBF/slX3sHYcjJgHbIuPwo93+Hwtl3fFnrC5zibC17iT/yaPGL
	 GZBEzBHJyZOzg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tODY0-000000001C0-23L8;
	Thu, 19 Dec 2024 11:14:24 +0100
Date: Thu, 19 Dec 2024 11:14:24 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Robert Foss <rfoss@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>,
	Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
Message-ID: <Z2PyANZAL1PkNWc4@hovoldconsulting.com>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
 <Z2E5SGIfAaKugNTP@hovoldconsulting.com>
 <2e7ijil4v3wxzi7y2gsbyhh4o3vrhcbydcpzfcniij6cack3yf@wb2s2m7xet6a>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e7ijil4v3wxzi7y2gsbyhh4o3vrhcbydcpzfcniij6cack3yf@wb2s2m7xet6a>

On Tue, Dec 17, 2024 at 12:38:17PM +0200, Dmitry Baryshkov wrote:
> On Tue, Dec 17, 2024 at 09:41:44AM +0100, Johan Hovold wrote:
> > On Mon, Dec 16, 2024 at 10:27:28AM +0200, Dmitry Baryshkov wrote:
> > > Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.
> > 
> > Please say something about why you're doing this and what the expected
> > outcome of doing so is.
> > 
> > There is currently no way for a third party (e.g. stable or distro
> > maintainer) to determine what this patch does, if it needs to be
> > backported or if it's essentially just a clean up like Abhinav indicated
> > in one of his replies.
> 
> These patches allow using colour transformation matrix (aka night mode)
> with more outputs at the same time. I think at this point only CrOS
> compositor actually uses CTM, so these changes do not need to be
> backported.

Ok, thanks for clarifying. Can you put something like this in the commit
messages so that we have a record of it?

> However they are not cleanups, it was a feedback for the
> SM6150 patch for the reasons expressed in the Abhinav's email.

I don't see any SM6150 patch in the thread. Do you have a pointer?

Johan

