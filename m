Return-Path: <linux-arm-msm+bounces-20422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6648A8CEA7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 21:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9788C1C20C6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 19:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC6E39ADB;
	Fri, 24 May 2024 19:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAc1TrLe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F2A1BF3F;
	Fri, 24 May 2024 19:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716580526; cv=none; b=mc8jgekEs0wuhj43uGsP1BDY7jnAF6H2G/zLRUbe3BVy46Ahlso6qudTrtrty0SpCBnWNRpRmHp1+Y/qoWMI9sos7hZWbxRCdYiRbSIMv31NospKd5WBtt4qbcXvnbTV0er5OSfne+MbRQ6uLsDCPaBI9I6U4UYj35GIRe8neRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716580526; c=relaxed/simple;
	bh=7VuedSna3jlpMz1Ez302GvwvBggA0TN+vKBdyi103Og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A+nYxlKl5pSF74jvLicOA6DxdcOvetsb/37Vgp0k1BYYnGm2siTITWjyfoaIbZQpRvW2bAVeBpWrdUByeY7dZ8I9NsPWHWLSymo0wN4DpUgxjByInzIMoeUPpAwPhDK8fyBJ3itDiBqyXYbeuJmCFd2diSLTdtbisK/ySGTLBlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAc1TrLe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29619C2BBFC;
	Fri, 24 May 2024 19:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716580526;
	bh=7VuedSna3jlpMz1Ez302GvwvBggA0TN+vKBdyi103Og=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=dAc1TrLeJLJnfPxhon1hmn9JftZ0nFTUxbFnPDMf6BFSPe/GBhYWdTSLLwjEqffdV
	 gpuzKVWU1xchtB+3IIC2Hr32hKycQoBwOZrpPKepIIIqvx1i/isGnqlTUaJTC2yoU8
	 tfJDhxU+mJ5JdzaQg6Z0YNRdYsNWVSngNcWoOnvs1sphVT+sAIU69++hsiktgfaoIt
	 PVpqMAMmUSo3SazS/LBqZ1vymoDnZQseB3oDkJ/n5NhxI2ks+MpI+4YMq7TKvnfBiB
	 GaQaSVoY0IqYxZEWtlYtTMhaCF75anUDTIIcR696cSsUZD3tZd3bOk4FWOJrYPuFcw
	 LKuWM/tusZmzA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B532DCE0962; Fri, 24 May 2024 12:55:25 -0700 (PDT)
Date: Fri, 24 May 2024 12:55:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: sfr@canb.auug.org.au
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jon Hunter <jonathanh@nvidia.com>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] Build failure and alleged fix for next-20240523
Message-ID: <287206c0-b53d-4aa1-b35c-0725adc5e9ef@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello!

I get the following allmodconfig build error on x86 in next-20240523:

Traceback (most recent call last):
  File "drivers/gpu/drm/msm/registers/gen_header.py", line 970, in <module>
    main()
  File "drivers/gpu/drm/msm/registers/gen_header.py", line 951, in main
    parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
AttributeError: module 'argparse' has no attribute 'BooleanOptionalAction'

The following patch allows the build to complete successfully:

https://patchwork.kernel.org/project/dri-devel/patch/20240508091751.336654-1-jonathanh@nvidia.com/#25842751

As to whether this is a proper fix, I must defer to the DRM folks on CC.

							Thanx, Paul

