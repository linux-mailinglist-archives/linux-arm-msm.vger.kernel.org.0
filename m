Return-Path: <linux-arm-msm+bounces-38423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6C9D3570
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 09:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 142E41F2211F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 08:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3408F149C42;
	Wed, 20 Nov 2024 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mg5ROsZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05034184F;
	Wed, 20 Nov 2024 08:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732091535; cv=none; b=RiArnSQ7YBvT3Sv1X06O/fM5ke2Qv3cjqZyETtoDNtKKkC9JGydoTAxWTRB3FSS53sj/gkxu061DJ12u2zJq6h6gG9jVTJ6K+Sxz1ciuXNGJoBPDft5OtKpAijyJQQKcbxo35MtNT23SOYUOw5Lt/s2tLjyWw8rCEUH7V/5BPhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732091535; c=relaxed/simple;
	bh=dXNHNSXuadyJpwK+4KKoncxf22sSJQuUbxURN0kr3Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMjjOSQE5gf/8rJhAPr4yd9vA5FIS+Z272PsS/rp1zcmXWfkaqXROzT006vnqicg1JB1r421Inh0DqesdNvZzHWTYEyjcABBXYazXJE8T9Py261cyZYW2lkzr4ngHZ9Jz9Llk+bHdhLhzKDH9xdBrrBWUWlOEfVksKsLwnNlFNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mg5ROsZ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8073DC4CED0;
	Wed, 20 Nov 2024 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732091534;
	bh=dXNHNSXuadyJpwK+4KKoncxf22sSJQuUbxURN0kr3Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mg5ROsZ82qDNrjFvMfa3k85muGd/SAuUgfqiQuBBiq8aTAHKVrI5Mlw9WY1ZkiPi6
	 QX5QyPCChWgPrM2nhIX0unWkeQOgb4NdMKeSbd4LUfXcdTEAcCulJV4qIPGhNTWP7Z
	 jygIbqKXEoj5oTVVLgZ0Wz5IogX7kkYcNqaPYHtm5S4tv4LTle5qznElpqhWisPUi2
	 Le3LUUNUyWqlZ7MqVrAlfVmzqrklA2FOq/oYCtFX6i25jiOY0e/AIG2OjkSKqw962Q
	 qNY0SH11OhnqVJi4MKJmdIiPZHIgArpxtQ34LmmMjcKf3l2n0VkBhEpEh863rs04be
	 xj1hKcu4l9lOQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tDg84-000000007oI-0jgg;
	Wed, 20 Nov 2024 09:32:04 +0100
Date: Wed, 20 Nov 2024 09:32:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Leonard Lausen <leonard@lausen.nl>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [v2,1/2] drm/msm/dpu1: don't choke on disabling the writeback
 connector
Message-ID: <Zz2ehK4KoUbpdbBv@hovoldconsulting.com>
References: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
 <ZzyYI8KkWK36FfXf@hovoldconsulting.com>
 <2138d887-f1bf-424a-b3e5-e827a39cc855@lausen.nl>
 <ZzyqhK-FUwoAcgx1@hovoldconsulting.com>
 <4f145884-2c91-4e32-a7bc-b439746c6adb@lausen.nl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f145884-2c91-4e32-a7bc-b439746c6adb@lausen.nl>

On Tue, Nov 19, 2024 at 10:02:33PM -0500, Leonard Lausen wrote:

> The finding is that while 6.10.14 with this patch applied still suffers from
> that regression, 6.11.9 and 6.12 do not face the CRTC state regression.
> Therefore, whatever issue the patch uncovered in older kernels and which
> justified not merging it before due to regressing basic CTM functionality, is
> now fixed. The patch should be good to merge and backport to 6.11, but from my
> perspective should not be backported to older kernels unless the interaction
> with the DRM CRTC state issue is understood and an associated fix backported as
> well.

Thanks for testing. The 6.9 and 6.10 stable trees are EOL and backporting
to 6.11 should not cause any trouble then.

Johan

