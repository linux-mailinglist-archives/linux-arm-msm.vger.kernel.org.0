Return-Path: <linux-arm-msm+bounces-11746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB3B85AD40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 21:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E0351F244F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 20:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B417746B9F;
	Mon, 19 Feb 2024 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="POyGkjmL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A43144373
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 20:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708374835; cv=none; b=IDtYxyhy2tawV7v3jtkT47ufTHYB7eVqzxoohg5JW+v+MRzet9071e58smDXgOOgZOuW4DXGbVZNkwEebFvlNx9hARbThLcz2l5mfcOE99QxQ2Blbj0u4eR+jbyQxR1/SW7XQ91o7znogGFchhif8VOaQ44RIlqkSybICekcZek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708374835; c=relaxed/simple;
	bh=eJx4ueyARjnhoEogmvdV9S2dD8rwP35ldmK1e636iTc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tOfuAsi+9DvAfzrF1omKp57/8DztZhAcTvc+Ppp5s9CaoTYAPdpdCf6Qm6cFghpn28EElVHQVUBHieBYnWRByjBz1ecjhZtgsWMeDXD80ieEbyPqwl3Jr8YTDgdaBwO62m2Gwpjm0kAitr1hGiwwsiNB7l4oGXu7jK+SqPjKeeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=POyGkjmL; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708374832;
	bh=eJx4ueyARjnhoEogmvdV9S2dD8rwP35ldmK1e636iTc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=POyGkjmL71+Qbsr/dhESuohV+BYaEp9A/98Spu5GOhr5r2GAMer6uva2+lsVpHPBy
	 I/PMGCfxZrg+yTrzDFZeG1BB/hEn93y31182dFiUQfLEilzEVHNcIoFZQmOF23DsA/
	 I0J+JGcXb3SKXYQ+LJ7McfU2iOZMNRWKT8rT5/1R8q5VA7FC3TpJYWqJrIIShH29/i
	 8e56Ox1itf4n7fSfsb8yKjk9K/TkaEdzz9XReNcmA9TyVQnFRZ2sdfKIbS2+rpTXDF
	 uY8KehuEQs/cr1hOg+WJisjqgiFrFNycbPE+GFoojW4+Y8BgQVwWS5SxLejDoMv7KC
	 yWyFWrCgEztRw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B147137820C1;
	Mon, 19 Feb 2024 20:33:48 +0000 (UTC)
Message-ID: <78aae417-b152-446c-b53b-20ea4b39958c@collabora.com>
Date: Mon, 19 Feb 2024 17:33:48 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/ci: mark universal-plane-sanity as failing on
 SC7180
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
 <20240218041204.2522828-3-dmitry.baryshkov@linaro.org>
 <dc9872dc-c51a-4f8b-8963-9f92e43c7246@collabora.com>
In-Reply-To: <dc9872dc-c51a-4f8b-8963-9f92e43c7246@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19/02/2024 17:25, Helen Koike wrote:
> 
> 
> On 18/02/2024 01:12, Dmitry Baryshkov wrote:
>> The test kms_universal_plane@universal-plane-sanity fails on both SC7180
>> platforms. The drm/msm returns -ERANGE as it can not handle passet
>> scaling range, however the test is not ready to handle that. Mark the
>> test as failing until it is fixed.
>>
>> ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Test assertion 
>> failure function sanity_test_pipe, file 
>> ../tests/kms_universal_plane.c:438:
>> ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Failed 
>> assertion: drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id, 
>> output->config.crtc->crtc_id, test.oversized_fb.fb_id, 0, 0, 0, 
>> mode->hdisplay + 100, mode->vdisplay + 100, IGT_FIXED(0,0), 
>> IGT_FIXED(0,0), IGT_FIXED(mode->hdisplay,0), 
>> IGT_FIXED(mode->vdisplay,0)) == expect
>> ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Last errno: 
>> 34, Numerical result out of range
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>


Applied to drm-misc/drm-misc-next

Thanks
Helen

> 
>> ---
>>   .../gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt    | 1 +
>>   .../drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt    | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git 
>> a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt 
>> b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> index 7e4d8744fcc6..f0576aa629e8 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
>> @@ -15,3 +15,4 @@ kms_plane_alpha_blend@alpha-7efc,Fail
>>   kms_plane_alpha_blend@coverage-7efc,Fail
>>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>>   kms_rmfb@close-fd,Fail
>> +kms_universal_plane@universal-plane-sanity,Fail
>> diff --git 
>> a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> index 7e4d8744fcc6..f0576aa629e8 100644
>> --- 
>> a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> +++ 
>> b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
>> @@ -15,3 +15,4 @@ kms_plane_alpha_blend@alpha-7efc,Fail
>>   kms_plane_alpha_blend@coverage-7efc,Fail
>>   kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>>   kms_rmfb@close-fd,Fail
>> +kms_universal_plane@universal-plane-sanity,Fail

