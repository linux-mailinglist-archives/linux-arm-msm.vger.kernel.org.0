Return-Path: <linux-arm-msm+bounces-42483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDD39F4637
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 09:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4985F1679B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 08:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F201DC745;
	Tue, 17 Dec 2024 08:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5arzDkP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32571D88C4;
	Tue, 17 Dec 2024 08:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734424903; cv=none; b=B1VNlJGldahRaOvhDMqU70ftuLAWHBHnzZdzhYReQ4WclDU2FdcrttycuAAMojbXX0V+cJxCsaiRrvE4jCC5evj2tXiulplfHkz/qvHAhU+ZHZOpM0xFXuleksXIhUwalrN+PYXIZCYxVXRkk3IyvcMsXS2CXFjgOXzNeZhZHno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734424903; c=relaxed/simple;
	bh=D+wSx9Afy4rDKFVT4VamMlGTvUye5qQYDZIaMP5OHiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agAiC43Rb6HWJ4fJNWPMNaRpsfJqYj0afJBPbZ13o9PRh0oTEnClqWmvWtvqVnKCZxJm+693Xyd98GiEl8QpDghidAYPAIG4wtFmrw0owgRJ3ZBo/CvD4vYryxTLijrjmZqbAZHczq6WW8ldM9nUWdsEcuII2ulPv6ER3JRnaJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5arzDkP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954BCC4CED6;
	Tue, 17 Dec 2024 08:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734424902;
	bh=D+wSx9Afy4rDKFVT4VamMlGTvUye5qQYDZIaMP5OHiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h5arzDkPatzr3nbQxyJVcP8TNxxt35kvCrZbY5fFam3pzk3ciAeeIxxRHZSnW/DFX
	 WgwkjnmHMSApjAJ9Qss9sSgiOkFred1lfuPjyAyn3zaTgTdR/0/wSJ+mXk6CICWPGz
	 Q2QEPb2+OrTPgrocfvWrD2/3ZKaB0Ft0p4krZYj3tikdTdl0e3+epGbGnWW2BIR165
	 /DEZ6mcOGRWRMfJwnX5xilHzIHS8ixTft9K2wI9I2qY9j0NIoVy+kA9VlEplk2Juh5
	 /FkUonRr5ic9mqHkRSeYp+b5vhe1IfOXTSOqd3GFCv+q8aS8+ymf76n+W7o/fILjrN
	 Z8tS0kwnrjf1Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tNT9E-000000006GN-2TkS;
	Tue, 17 Dec 2024 09:41:44 +0100
Date: Tue, 17 Dec 2024 09:41:44 +0100
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
Message-ID: <Z2E5SGIfAaKugNTP@hovoldconsulting.com>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>

On Mon, Dec 16, 2024 at 10:27:28AM +0200, Dmitry Baryshkov wrote:
> Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Please say something about why you're doing this and what the expected
outcome of doing so is.

There is currently no way for a third party (e.g. stable or distro
maintainer) to determine what this patch does, if it needs to be
backported or if it's essentially just a clean up like Abhinav indicated
in one of his replies.

> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Johan

