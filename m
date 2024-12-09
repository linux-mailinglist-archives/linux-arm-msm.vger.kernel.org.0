Return-Path: <linux-arm-msm+bounces-40989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A7A9E8FED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C63282E9D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 10:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C3B2165E0;
	Mon,  9 Dec 2024 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRBBZc0S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38B118E02D;
	Mon,  9 Dec 2024 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733739382; cv=none; b=cXgwlozqqEO+PAvdL4SVRgHOxMSsE4Uesti1r0m1rEP0X6ZmfO6Fvptxj2pV9KsnAW9wVns0KnwxbohyLCJ5DhDstiolx8FEWS33aSWnyvKdQtlZopOr4sL11O6v7nIgDv7Fyb3w0f7DYyhslq1h7DgniwS0/J83CsnOiq8xJ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733739382; c=relaxed/simple;
	bh=PpQczTMRlRoCfSfucalSSQ+k0Y9bCRyp5dFa6bogxgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQ71Y8B1qnSoaywhzZI37jbI/qEBAe2RBEYwswSh8oN1Y94FcHoET4iyW7bH8/nF7AhzVwR7fo8IPNYmMij8IxXvrvF/RJWs/yb4HGkhWEnuEH5tl6B14LqiF8dyuhEZAoCoL4wmh4+YJCFBhEAAziEKQjZkUoO1N7iq3ue9vAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRBBZc0S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21335C4CED1;
	Mon,  9 Dec 2024 10:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733739382;
	bh=PpQczTMRlRoCfSfucalSSQ+k0Y9bCRyp5dFa6bogxgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gRBBZc0SILjc2viU8ITTLHkQzhaHu/UAIf2xue3tvihWIKj16Z4XTz0r5NSwp7b5l
	 s3kJSaSBPDJhLY5/3hcYWa8U05HNRBcdlPB02gRbj+oxCRCui36awU27AOzXdObQJu
	 Gm9elqwtZXfMnsFkCgw7lGSUoxYJxHxSn1vwwbIOM2aNkJ1iLo0+cN9D2vSo3Q3syC
	 KQFskq22yd+auuqpHxXK4G2lg+ZkKXurVMxzZoiWUeGuVE9ZWqHKHWKOnrPl13wWtm
	 zo8Y/sPvAwh4e2jX4qL3L1JGQQe/1M8wHtLKNFpTY9/IQkNbNLbaOnCGVVKSgi3G/h
	 kM0uNx2pwcLOQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tKaoQ-000000008Br-33Rv;
	Mon, 09 Dec 2024 11:16:23 +0100
Date: Mon, 9 Dec 2024 11:16:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>,
	=?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3] drm/msm/dpu1: don't choke on disabling the writeback
 connector
Message-ID: <Z1bDdj1XvWfGjM21@hovoldconsulting.com>
References: <20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org>
 <Z1a3jOB8CutzRZud@hovoldconsulting.com>
 <CAA8EJprxosWNWojXWAzkM5eeNXewpT1hpBxCq3irmkuGf==b+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprxosWNWojXWAzkM5eeNXewpT1hpBxCq3irmkuGf==b+w@mail.gmail.com>

On Mon, Dec 09, 2024 at 12:00:07PM +0200, Dmitry Baryshkov wrote:
On Mon, 9 Dec 2024 at 11:25, Johan Hovold <johan@kernel.org> wrote:

> > I noticed that the implementation had this status check also before
> > 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to
> > dpu_writeback.c").
> >
> > Why did this not cause any trouble back then? Or is this not the right
> > Fixes tag?
> 
> If I remember correctly, the encoder's atomic_check() is called only
> if the corresponding connector is a part of the new state, if there is
> a connected CRTC, etc, while the connector's atomic_check() is called
> both for old and new connectors.

Thanks for the explanation.

Johan

