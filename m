Return-Path: <linux-arm-msm+bounces-20703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C59A8D143A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 08:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEC091F22D6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 06:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8564DF6B;
	Tue, 28 May 2024 06:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dNBwFJwO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204C073449
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 06:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716876572; cv=none; b=WheC19D7KUAwk/VsxqoIGeKepKfnaKogxizlIuLqVxnryxlqlwMfK4k12CdIM+lqHr5tw1J8Oo/BoTI1BxQDWw3wlthoBJ1zHH8PHY8PAPzfPQ/yWTZrSwFnMtipy1QT45F89QLeHSTfVcQrnbOOnzQYoMHJfKLnyEXLuB2M+LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716876572; c=relaxed/simple;
	bh=pp09qwZRTGxYxhAVR5DrkACVfVN6ijEh4V9kP4xD9gY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=WqMd+aTwce4hRlHHPuITCMwsa42zbZLdhO8d3eLrl4a0IGcZ/mOyq8+Fs4dFNs+LqbHe0sFQAg2+8O1N1+R/g0ROn4b+HJHhesJNFj4JDk+Zn6tMMYa7KU8OZzYX0I2vPlCWpbmhInozieRwyXDCmC2tb5+I+gmkBuQseCVjSxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dNBwFJwO; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716876568;
	bh=pp09qwZRTGxYxhAVR5DrkACVfVN6ijEh4V9kP4xD9gY=;
	h=Date:To:From:Subject:Cc:From;
	b=dNBwFJwOy28io1NQIQaA8PUPGhDMyTjvdNWOpjlwC9Y3UXaFmLsFlri3eJWdLEoXK
	 y3ByqFn8OZJumxYtvdzboe1Owp54Gv9hMkyrNayqRIc5rfA1obQfknEI9QvrbgUH6N
	 fObR3x5LJfFjbuDsi8hSjaIJqKjY9tKMwgwPHPWC1griMxNI51jvEvY7NlrWUBlVbm
	 TNj4ceN0dItNXtj322Y9SoC7F1CHU9qhREyozoM2E5Rq7TOUF0XaP6aUP5ZZ37c6Fz
	 jSxzuxRFS+JuAKVt6S3t0qNLilKvESHRNE12Hr08kxb+N8WFZ04/DSI7/y1PzeTtEJ
	 p4z1hRHuKJRcQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 494C63782151;
	Tue, 28 May 2024 06:09:25 +0000 (UTC)
Message-ID: <661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com>
Date: Tue, 28 May 2024 11:39:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: flaky tests for msm driver testing
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maintainers,

There are some flaky tests reported for msm driver testing in drm-ci for 
the below boards.

*)
# Board Name: apq8096-db820c
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
dumb_buffer@create-clear

*)
# Board Name: sc7180-trogdor-kingoftown
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
msm_mapping@shadow
msm_shrink@copy-gpu-oom-32
msm_shrink@copy-gpu-oom-8

*)
# Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
msm_mapping@shadow

*)
# Board Name: sdm845-cheza-r3
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
kms_cursor_legacy@basic-flip-after-cursor-atomic
kms_cursor_legacy@basic-flip-after-cursor-legacy
kms_cursor_legacy@basic-flip-after-cursor-varying-size
kms_cursor_legacy@basic-flip-before-cursor-varying-size
kms_cursor_legacy@flip-vs-cursor-atomic-transitions
kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size
kms_cursor_legacy@flip-vs-cursor-varying-size
kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
kms_cursor_legacy@short-flip-after-cursor-toggle
kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
msm_shrink@copy-gpu-32
msm_shrink@copy-gpu-oom-32

Will add these tests in,
drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt

(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh

