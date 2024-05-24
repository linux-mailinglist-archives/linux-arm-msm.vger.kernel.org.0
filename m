Return-Path: <linux-arm-msm+bounces-20382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FF68CE122
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 08:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD6B11F21852
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 06:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A335E1EEE3;
	Fri, 24 May 2024 06:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SJsYf8+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC37511720;
	Fri, 24 May 2024 06:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716533183; cv=none; b=Pb2p4kC5xs5HrRaSjGqxVqsW6V1owIz2I4PEn2ho3YZvB1/KQ2x4qhwnGu/fYP31iD+8zxl7zSfJM/yNjCOcPnaobWnOXSln71xApHz2d3a2qJIW4ykN9u1tAUt7bZi2CsD7A8CHrLkuC8PFXjbpdZY5bFIBAmrmP+CspfO/UFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716533183; c=relaxed/simple;
	bh=0x62kCjeY+J4sbdaaUkUR2ly1ES+mb2DRDWplkfWUds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fYk4UIPZJLvOmhcT7TzjSpieYq09o6iZM9mFDUKEVUvKaMj64bymaHpUqhJWr6md51KpEWpqCUNQmqDnPdh+FysaJNlE55+DDuPvsDVKxLirzBeiZPs0OaqM04nei77riNliBGuQKcnACcEjJYRdkfF1orwSlIjMN3dhSzNYuHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SJsYf8+E; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716533179;
	bh=0x62kCjeY+J4sbdaaUkUR2ly1ES+mb2DRDWplkfWUds=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SJsYf8+E0w6OSLbVoUwUSsolkuQTmZhNQnLJw0QsNGkjkGYFd8n2xohI2RvX5otBP
	 89R+6Situxt4jvifcn/oo6h1jodewOReqLFgkPyO9orxk+p9HUp+wYrFC7qzl8HDEZ
	 7Iug8I4CKu6KR7NsudZhhVAhPKnRF6vR5VhCUZOUF9nMO8lRZLiU3gcIdSKk4hzLK2
	 yLDS4DuHt67z9bG4pm8+ip4ABXYYphDpTcBSlhEfnasesHdepNcZs58eczinwd+R6J
	 KPTwxQuv4O3Nj8hmmAISzONjCXIq08lvpx/QwLGR59wg8MJT17+g5O+Y2/eECAIvcT
	 1XQUtvRcgYCTw==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CC0FA3782112;
	Fri, 24 May 2024 06:46:15 +0000 (UTC)
Message-ID: <b695a2a3-2b4f-400d-a0b7-5d436926f49a@collabora.com>
Date: Fri, 24 May 2024 12:16:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/ci: uprev mesa version
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 mcanal@igalia.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-2-vignesh.raman@collabora.com>
 <2qzmfv3oc6feihwxu3tl37rg6w3qsj2vddu5olvqk6vhqr26cc@bxu5y6ijvtfa>
 <9cd0667a-12ee-4d45-80e8-dc34259bf01d@collabora.com>
 <CAA8EJprVVkQO7aPkehwL2zhYkGRkm4Foc13ErfuY6ikBA_4nLQ@mail.gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAA8EJprVVkQO7aPkehwL2zhYkGRkm4Foc13ErfuY6ikBA_4nLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 23/05/24 15:29, Dmitry Baryshkov wrote:
> On Thu, 23 May 2024 at 09:07, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>>
>> Hi Dmitry,
>>
>> On 20/05/24 16:13, Dmitry Baryshkov wrote:
>>> On Fri, May 17, 2024 at 02:54:57PM +0530, Vignesh Raman wrote:
>>>> zlib.net is not allowing tarball download anymore and results
>>>> in below error in kernel+rootfs_arm32 container build,
>>>> urllib.error.HTTPError: HTTP Error 403: Forbidden
>>>> urllib.error.HTTPError: HTTP Error 415: Unsupported Media Type
>>>>
>>>> Uprev mesa to latest version which includes a fix for this issue.
>>>> https://gitlab.freedesktop.org/mesa/mesa/-/commit/908f444e
>>>>
>>>> Use id_tokens for JWT authentication. Since s3 bucket is migrated to
>>>> mesa-rootfs, update the variables accordingly. Also copy helper scripts
>>>> to install, so that the ci jobs can use these scripts for logging.
>>>>
>>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>>> ---
>>>>
>>>> v2:
>>>>     - Uprev to recent version and use id_tokens for JWT authentication
>>>>
>>>> ---
>>>>    drivers/gpu/drm/ci/build-igt.sh   |  2 +-
>>>>    drivers/gpu/drm/ci/build.sh       |  6 +++--
>>>>    drivers/gpu/drm/ci/container.yml  | 12 +++------
>>>>    drivers/gpu/drm/ci/gitlab-ci.yml  | 44 +++++++++++++++++++++----------
>>>>    drivers/gpu/drm/ci/image-tags.yml |  2 +-
>>>>    drivers/gpu/drm/ci/lava-submit.sh |  4 +--
>>>>    drivers/gpu/drm/ci/test.yml       |  2 ++
>>>>    7 files changed, 44 insertions(+), 28 deletions(-)
>>>>
>>>
>>> [skipped]
>>>
>>>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>>>> index 8bc63912fddb..612c9ede3507 100644
>>>> --- a/drivers/gpu/drm/ci/test.yml
>>>> +++ b/drivers/gpu/drm/ci/test.yml
>>>> @@ -150,6 +150,8 @@ msm:sdm845:
>>>>        BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
>>>>        GPU_VERSION: sdm845
>>>>        RUNNER_TAG: google-freedreno-cheza
>>>> +    DEVICE_TYPE: sdm845-cheza-r3
>>>> +    FARM: google
>>>
>>> I see that this is the only user of the FARM: tag. Is it correct?
>>
>> No, we need to add FARM variable for other jobs as well.
> 
> Why? Even if we have to, we don't have them now and the change doesn't
> seem to be related to the uprev'ing of mesa. So this probably should
> go to a separate commit.

I will move them to separate commit.

Regards,
Vignesh

> 
>>
>>> Also we miss DEVICE_TYPE for several other boards. Should we be adding
>>> them?
>>
>> Yes, device type needs to be added for msm:apq8016, msm:apq8096, virtio_gpu.
>>
>> I will add this. Thanks.
> 
> I'd guess, separate commit too.
> 
>>
>> Regards,
>> Vignesh
>>
>>>
>>>>      script:
>>>>        - ./install/bare-metal/cros-servo.sh
>>>>
>>>> --
>>>> 2.40.1
>>>>
>>>
> 
> 
> 

