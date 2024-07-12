Return-Path: <linux-arm-msm+bounces-26010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F32592F54D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 08:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF9F11C21938
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 06:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9D413CFAB;
	Fri, 12 Jul 2024 06:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="4sFKQdJl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070681805E
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 06:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720764338; cv=none; b=g6+1i+bDTqCkWHE7yNxd3q91OOBECqWr7zRyAWQyZsQqTyntZApTVg+8csVcGQBOyVU0i4TnX7leVZaoQS8Muw4q4jj8wcsCCGKHu4w6u1eYhr9te8U4RJBg24r2RFuiwZ+1MRXZFLmSZzccTL/ej+bcGhkrOuTDl7jmRuZf2uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720764338; c=relaxed/simple;
	bh=sE5ateBKu6nPkk+PxU1Z0qEr2527gv5KTx61mgKeTQs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TMzV0ydfw7WNotq5VDQ3i4lUsLsrAXxyZySrprZ/yysojd2U+J7nE0ibueUVDUbmwkIZkG8thKFcPoXzNXLutPUe/JW5ZuCSXcf9+dqEJ1igcbBYWfgP+v+nVlwL0bLfFPtMrVR3JyTk3DaPbVrXnzCtlzwQ6f5urwkL6y+NkxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=4sFKQdJl; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720764332;
	bh=sE5ateBKu6nPkk+PxU1Z0qEr2527gv5KTx61mgKeTQs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=4sFKQdJlG1+OENc5v4NbZI8Z5AKFwfXo7PtwC1FShiBhL1dCgTusB7RS1hSJ8hlXS
	 q4djMOYeIoY154lNj5rfRMSze3ZKJd+3RSrqIGuNWiSSWp/+yEZRxX/JSKM2UCZ/w3
	 HA+PDyCa5d8V/EZIBnP+/hLIh7ezDX5JDwBohECmkBl6ggS2HYk7OT/QqzHVQYapov
	 a27scYv7bbpa8NeB+mo3vknQl1nC3Yr7CnUIGtZcTTvMfwtyHYEeSg6xqknnWT0F1F
	 GkqUjU8eIoIVlVyvbpPg8QIzxkQLYGxegh2AH8ng0FhnY19NUj9V71P5KSCiFgneps
	 Z11nWzRTdDsEA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C99E737821F1;
	Fri, 12 Jul 2024 06:05:29 +0000 (UTC)
Message-ID: <c96d719b-1d26-4f16-812f-ede92da3869f@collabora.com>
Date: Fri, 12 Jul 2024 11:35:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: flaky tests for msm driver testing
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
To: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
References: <661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com>
In-Reply-To: <661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maintainers,

On 28/05/24 11:39, Vignesh Raman wrote:
> Hi Maintainers,
> 
> There are some flaky tests reported for msm driver testing in drm-ci for 
> the below boards.
> 
> *)
> # Board Name: apq8096-db820c
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> dumb_buffer@create-clear
> 
> *)
> # Board Name: sc7180-trogdor-kingoftown
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> msm_mapping@shadow
> msm_shrink@copy-gpu-oom-32
> msm_shrink@copy-gpu-oom-8
> 
> *)
> # Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> msm_mapping@shadow
> 
> *)
> # Board Name: sdm845-cheza-r3
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> kms_cursor_legacy@basic-flip-after-cursor-atomic
> kms_cursor_legacy@basic-flip-after-cursor-legacy
> kms_cursor_legacy@basic-flip-after-cursor-varying-size
> kms_cursor_legacy@basic-flip-before-cursor-varying-size
> kms_cursor_legacy@flip-vs-cursor-atomic-transitions
> kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size
> kms_cursor_legacy@flip-vs-cursor-varying-size
> kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
> kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
> kms_cursor_legacy@short-flip-after-cursor-toggle
> kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
> kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
> msm_shrink@copy-gpu-32
> msm_shrink@copy-gpu-oom-32
> 
> Will add these tests in,
> drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
> drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
> drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> 
> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)
> 
> Please could you have a look at these test results and let us know if 
> you need more information. Thank you.

There are some flaky tests reported for msm driver testing in drm-ci 
with the recent IGT uprev 
(https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0e7f4e6a20d550252c4f355d5a303b1d9c8ff052)

*)
# Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
# Bug Report: 
https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
# Failure Rate: 100
# IGT Version: 1.28-gf13702b8e
# Linux Version: 6.10.0-rc5
kms_lease@page-flip-implicit-plane

*)
# Board Name: sdm845-cheza-r3
# Bug Report: 
https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
# Failure Rate: 50
# IGT Version: 1.28-gf13702b8e
# Linux Version: 6.10.0-rc5
kms_cursor_legacy@short-flip-before-cursor-toggle
kms_cursor_legacy@flip-vs-cursor-toggle
msm/msm_shrink@copy-mmap-oom-8s

The expectation files have been updated with these tests,
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt

https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt

Regards,
Vignesh

