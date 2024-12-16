Return-Path: <linux-arm-msm+bounces-42290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E6E9F29B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 06:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C16911881628
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 05:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECA3157469;
	Mon, 16 Dec 2024 05:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gmA9RupJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0292DECF;
	Mon, 16 Dec 2024 05:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734327940; cv=none; b=sSjU0aqnsvkgUAzzlxgGTMWInDXbiNitKhk6mOr/QPscwis9fW3wvgrPdnyX8m1eM8gnU5eJcVbZh17uMDYoaWObc41ZHQ/6/lU055NEZdk5cKynFLzbt7YJJmOEb6GgT8cO0Wfxd9et7iUpRFNnoE7vFlcg8e3thNis5+16gwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734327940; c=relaxed/simple;
	bh=NFnPSyCtd3ps3+TJDsq8UKYTFYz9rkyKLyypRCEEKE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZp0ceMp4eKzzBwjk2zJaWfVsX81T1wqzQEfrVIkoA4BY7Zv7rD/Vy5FsDgUugtIwRQN+w1eDN3ZQRVvLQvO+C35CExG7Qb2qXTaJWvATCXJHZ6vFT13VdOIOLnsB5F1z0Qm0Nd415LLKsdp9MvBEtq03GgQ6qbJC4YyVKGJ0sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gmA9RupJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734327935;
	bh=NFnPSyCtd3ps3+TJDsq8UKYTFYz9rkyKLyypRCEEKE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gmA9RupJYdqiZ5WAtJIcA7FVRT/WYvzjGt083zjvZGti+W8H7BEziuMuV9Rc7L4e8
	 ct7bz7ajOqtyQtEYsxHCKdaFLlKOgbSznw4Pc7A6gUlq9BwFtuScEhPsTcCLlcNNkN
	 KhEsi6Ok9gyixXZfH40KJsqdjPuOBQYt4wAZ50Xx7XHqynmIyuwwW3yWHMqJysce8D
	 QYRMVP2ilWqozEDBYFtlho+8YFdGNgyfjuOxJJd+i7Re8eTSwWoRQn+40OIoKq5P2w
	 /jCnkF6wcqy8whklKd5HBJKhMkeG2E9oJvztnbA1cQg9CdvWv8xgWy/3PAkSlqo5KD
	 cKe1GjtN4SCtQ==
Received: from [192.168.50.250] (unknown [171.76.86.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C069517E10C2;
	Mon, 16 Dec 2024 06:45:29 +0100 (CET)
Message-ID: <8edba6c9-cf7d-4616-8791-65abd108f538@collabora.com>
Date: Mon, 16 Dec 2024 11:15:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: add kms_cursor_legacy@torture-bo to apq8016
 flakes
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
References: <20241204-cursor_tor_skip-v1-1-f5f0bba5df7b@quicinc.com>
 <193931869a5.f923adf2270026.8321075661083367617@collabora.com>
 <20a3955e-3d10-47c5-8e68-d70342805010@quicinc.com>
 <19393604e18.f9b6fe7d298023.1937039548910081216@collabora.com>
 <a03ae7e8-391e-4303-91fc-15a59979fd2a@quicinc.com>
 <ed90ca8c-ed81-419f-a5db-a4e8bcd35835@collabora.com>
 <ac13139d-1cbf-47dd-b200-1a511ffc9453@quicinc.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ac13139d-1cbf-47dd-b200-1a511ffc9453@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Abhinav,

On 14/12/24 01:09, Abhinav Kumar wrote:
> Hi Vignesh
> 
> On 12/11/2024 9:10 PM, Vignesh Raman wrote:
>> Hi Abhinav / Helen,
>>
>> On 12/12/24 01:48, Abhinav Kumar wrote:
>>> Hi Helen / Vignesh
>>>
>>> On 12/4/2024 12:33 PM, Helen Mae Koike Fornazier wrote:
>>>>
>>>>
>>>>
>>>>
>>>> ---- On Wed, 04 Dec 2024 16:21:26 -0300 Abhinav Kumar  wrote ---
>>>>
>>>>   > Hi Helen
>>>>   >
>>>>   > On 12/4/2024 11:14 AM, Helen Mae Koike Fornazier wrote:
>>>>   > > Hi Abhinav,
>>>>   > >
>>>>   > > Thanks for your patch.
>>>>   > >
>>>>   > >
>>>>   > >
>>>>   > > ---- On Wed, 04 Dec 2024 15:55:17 -0300 Abhinav Kumar  wrote ---
>>>>   > >
>>>>   > >   > From the jobs [1] and [2] of pipeline [3], its clear that
>>>>   > >   > kms_cursor_legacy@torture-bo is most certainly a flake and
>>>>   > >   > not a fail for apq8016. Mark the test accordingly to match 
>>>> the results.
>>>>   > >   >
>>>>   > >   > [1] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481
>>
>> The test passes - 
>> kms_cursor_legacy@torture-bo,UnexpectedImprovement(Pass)
>>
> 
> Yes, thats the problem
> 
> https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481/viewer#L2696
> 
> 24-12-04 03:51:55 R SERIAL> [  179.241309] [IGT] kms_cursor_legacy: 
> finished subtest all-pipes, SUCCESS
> 24-12-04 03:51:55 R SERIAL> [  179.241812] [IGT] kms_cursor_legacy: 
> finished subtest torture-bo, SUCCESS
> 
> Here it passes whereas it was marked a failure. Hence pipeline fails.

Yes it fails due to,

Unexpected results:
  kms_cursor_legacy@torture-bo,UnexpectedImprovement(Pass)

In this case, we need to remove this test from fails.txt

> 
>>>>   > >   > [2] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430
>>
>> There are no test failures
>>
> 
> No, thats not true
> 
> https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430/viewer#L2694
> 
> 24-12-04 04:18:38 R SERIAL> [  170.379649] Console: switching to colour 
> dummy device 80x25
> 24-12-04 04:18:38 R SERIAL> [  170.379938] [IGT] kms_cursor_legacy: 
> executing
> 24-12-04 04:18:38 R SERIAL> [  170.393868] [IGT] kms_cursor_legacy: 
> starting subtest torture-bo
> 24-12-04 04:18:38 R SERIAL> [  170.394186] [IGT] kms_cursor_legacy: 
> starting dynamic subtest pipe-A
> 24-12-04 04:18:38 R SERIAL> [  170.661749] [IGT] kms_cursor_legacy: 
> finished subtest pipe-A, FAIL
> 24-12-04 04:18:38 R SERIAL> [  170.662060] [IGT] kms_cursor_legacy: 
> starting dynamic subtest all-pipes
> 24-12-04 04:18:38 R SERIAL> [  170.713237] [IGT] kms_cursor_legacy: 
> finished subtest all-pipes, FAIL
> 24-12-04 04:18:38 R SERIAL> [  170.713513] [IGT] kms_cursor_legacy: 
> finished subtest torture-bo, FAIL
> 24-12-04 04:18:38 R SERIAL> [  170.721263] [IGT] kms_cursor_legacy: 
> exiting, ret=98
> 24-12-04 04:18:38 R SERIAL> [  170.737857] Console: switching to colour 
> frame buffer device 128x48
> 
> Please check these logs, the torture-bo test-case did fail. The pipeline 
> was marked pass because it was an expected fail.
> 
> So we have two pipelines, where one failed and the other passed. So 
> thats a flake for me.

Yes agree. So if we had removed the test from fails, deqp-runner would 
have reported this as flake.

deqp-runner runs the test and if it fails, it retries. If the test 
passes on retry, it is reported as a flake.

> 
>>>>   > >   > [3]: 
>>>> https://gitlab.freedesktop.org/drm/msm/-/pipelines/1322770
>>
>> The job is same as 2
>>
>> In this case, the test passes and deqp-runner does not report it as 
>> flake. So we only need to remove it from fails file.
>>
> 
> No, like I mentioned above we have a pass and a fail.
> 
>>
>>>>   > >   >
>>>>   > >   > Signed-off-by: Abhinav Kumar quic_abhinavk@quicinc.com>
>>>>   > >   > ---
>>>>   > >   >  drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt | 5 +++++
>>>>   > >   >  1 file changed, 5 insertions(+)
>>>>   > >   >
>>>>   > >   > diff --git 
>>>> a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt 
>>>> b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>>>>   > >   > new file mode 100644
>>>>   > >   > index 000000000000..18639853f18f
>>>>   > >   > --- /dev/null
>>>>   > >   > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>>>>   > >   > @@ -0,0 +1,5 @@
>>>>   > >   > +# Board Name: msm-apq8016-db410c
>>>>   > >   > +# Failure Rate: 100
>>>>   > >
>>>>   > > Is failure rate is 100%, isn't it a fail than?
>>>>   > > (I know we have other cases with Failure Rate: 100, maybe we 
>>>> should fix them as well)
>>>>   > >
>>>>   >
>>>>   > Maybe I misunderstood the meaning of "Failure rate" for a flake.
>>>>   >
>>>>   > I interpreted this as this test being flaky 100% of the time :)
>>>>
>>>> Ah right, I see, inside deqp-runner (that auto-retries).
>>>>
>>>> I'd like to hear Vignesh's opinion on this.
>>>>
>>>> (In any case, we probably should document this better)
>>
>> deqp-runner reports new (not present in flakes file) or known (present 
>> in flakes file) flakes
>>
>> 2024-12-11 07:25:44.709666: Some new flakes found:
>> 2024-12-11 07:25:44.709676:   kms_lease@page-flip-implicit-plane
>>
>> 2024-12-11 13:15:16.482890: Some known flakes found:
>> 2024-12-11 13:15:16.482898: 
>> kms_async_flips@async-flip-with-page-flip-events-atomic
>>
>> we add it to flakes file if deqp runner reports new flakes. Another 
>> case where we update flake tests is when a test passes in one run but 
>> fails in another, but deqp-runner does not report it as flake.
>>
>> Regards,
>> Vignesh
>>
> 
> The confusion here i guess is about what to mention as a "Failure rate"
> 
> Failure rate means how many times it fails (like normally) ? In that 
> case 100% which I used is wrong and I used 33% instead for which I have 
> pushed v2.

Yes, 33% is correct and please remove this test from fails.txt

Regards,
Vignesh

> 
>>>>
>>>> Regards,
>>>> Helen
>>>>
>>>
>>> Can you let me know which way we need to go?
>>>
>>> Just in case I did post a v2 fixing this, 
>>> https://patchwork.freedesktop.org/patch/627276/
>>>
>>> If thats the way to go, can you pls take a look?
>>>
>>> Thanks
>>>
>>> Abhinav
>>>>   >
>>>>   > Out of the 3 runs of the test, it passed 2/3 times and failed 1/3.
>>>>   >
>>>>   > So its fail % actually is 33.33% in that case.
>>>>   >
>>>>   > I think I saw a Failure rate of 100% on 
>>>> msm-sm8350-hdk-flakes.txt and
>>>>   > mistook that as the rate at which flakes are seen.
>>>>   >
>>>>   > Let me fix this up as 33%
>>>>   >
>>>>   > > Regards,
>>>>   > > Helen
>>>>   > >
>>>>   > >   > +# IGT Version: 1.28-ga73311079
>>>>   > >   > +# Linux Version: 6.12.0-rc2
>>>>   > >   > +kms_cursor_legacy@torture-bo
>>>>   > >   >
>>>>   > >   > ---
>>>>   > >   > base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
>>>>   > >   > change-id: 20241204-cursor_tor_skip-9d128dd62c4f
>>>>   > >   >
>>>>   > >   > Best regards,
>>>>   > >   > --
>>>>   > >   > Abhinav Kumar quic_abhinavk@quicinc.com>
>>>>   > >   >
>>>>   > >   >
>>>>   > >
>>>>   >
>>>>

