Return-Path: <linux-arm-msm+bounces-42531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E389F4AC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 13:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5998C188DA63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 12:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC761F03DF;
	Tue, 17 Dec 2024 12:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDaf9b2b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DD01EB9E8;
	Tue, 17 Dec 2024 12:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734437651; cv=none; b=duPGji7cP2QDoNGI81SjHsdJqr57FcZzKn/br8x+ZR8xTrk28DkbuWM6pYNXDPAyyylyRhQ6VRzte2s3wO/wqT2D4R0wfGklg8K2egb9aCkd5DwWKhc71cRSmYYcboRQ7f8YXDk95Ne5MMF8LtIWsUx0xUfk+l4dM5Bdz1DQzWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734437651; c=relaxed/simple;
	bh=Me423sa5I67z9UM4znPFMq2P7Rm7CICtNtEVzRss7kY=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=f+GlFTFcMXzQFu4087gAc/bhR4F2PIBwTNkQbZpCQSZshRuMAO/hsrlcyRlMyBzA5eKrcpxEecM2JcSKp9LHQ4QFCFvNuF7VyHqbKpcyEAatptOSZVFJ8RD/cvCGTAr1zxb8hemNd83iliI2mTOt7ytYAqEuNGg3uVZ1SoSMnlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDaf9b2b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35442C4CED4;
	Tue, 17 Dec 2024 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734437650;
	bh=Me423sa5I67z9UM4znPFMq2P7Rm7CICtNtEVzRss7kY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=hDaf9b2bvvMJ1/Jkx+IK+tRESOpOWyyDu3Ef0Wg+UyqQW+2w7YYT+os++DM6MeQQu
	 hYIe61BEhARPSwGkRXUhM7+gc332hwepEBZrO9thhLqX74LMITzQuWo7SgpP4mBaFJ
	 hNpNyKV/tEEQvmDF60/uxKGYhYGmwJoxHQ1Jpa1tVWCSkE9P2Jcmc7QJPeHbW0Yvc3
	 gUXHnn36/Wp99YAMBMG7dlB6AZ2ZDMwT2F8gfQzXgHDxDie9eLMB+S7iMQT3glOAZx
	 qeCH5longT0/T3MGvfzjJagC9GiNIEWDQCzZLzPzptdS8lb9kgmbGGbPoMQVeSOcU1
	 BaizcBBk9JY1w==
Message-ID: <4fa319f13b4d57580a3a9e38021882a4@kernel.org>
Date: Tue, 17 Dec 2024 12:14:07 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 04/25] drm/tests: Add test for
 drm_atomic_helper_check_modeset()
In-Reply-To: <20241216-concurrent-wb-v4-4-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-4-fe220297a7f0@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, quic_ebharadw@quicinc.com, DavidAirlie <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, JessicaZhang <quic_jesszhan@quicinc.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Rob Clark" <robdclark@chromium.org>, "Rob
 Clark" <robdclark@gmail.com>, "Sean Paul" <sean@poorly.run>, "Simona Vetter" <simona.vetter@ffwll.ch>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Mon, 16 Dec 2024 16:43:15 -0800, Jessica Zhang wrote:
> Add a test for drm_atomic_check_modeset() specifically to validate
> drm_atomic_check_valid_clones() helper
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

