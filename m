Return-Path: <linux-arm-msm+bounces-29762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A9B9625C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 13:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C229128453F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 11:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7B116D334;
	Wed, 28 Aug 2024 11:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dh+Kei9l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7455F4D108;
	Wed, 28 Aug 2024 11:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724843803; cv=none; b=dzDsOJWQ1cuZeC0pp9dVgaXmDPwT9g4JIRUhlejW2MxgbILeW6HCSbPaU3MqbHyV6ljk7JEd/utmcYWhD2vq2pNkxRQXzEnxUoqi8d5+GQtUUWF687NGCkQJLNrp/ktXqHNiX9H4IU3NJhLU8yfkVcaqXGOu4EE/J7hqJDeI+8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724843803; c=relaxed/simple;
	bh=WaqToENXOPqb2z6sLJVOLE/E0rhIdPZwlwNAG/Pv/xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NR1DcZeh+rdVJoVVwQSorX9L/vTkUr5gzRiQilF/mAPKnBCrJj8SOXFqxgDqg8YkxwRZWqhZmW3/dLj3cxpSGOnuGRWf4h7Mv7Qed6DwO8pEJBrvrtPReYI44WhPokctHwyQkWRTkI9mGgyDerLWn6hR+VNZHSllQntPcBa6IYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dh+Kei9l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A81AC98EC6;
	Wed, 28 Aug 2024 11:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724843803;
	bh=WaqToENXOPqb2z6sLJVOLE/E0rhIdPZwlwNAG/Pv/xo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dh+Kei9l669eirm87ad4gnsLiva4otm7C44LdJdRAcBaW99pECuC4yN6K1TvbqCUO
	 dhmBNy6ytoMY+E06TCfrD9kFbeNtDkihlbG3mKFBdm/JRCD1OXsuP7PyzPNXWpmRir
	 fSKvePui931OOHyIwJ2Pw1UOU7+upIo2fwsLBoCVvBPb5AsBkr/1KlL0uD1BugNufy
	 yT2h3IIYlUXAw71Vj60NGLRn99BlDDG7jEx23P5UHs4PZsd/vOoxNprzMVVyaz3UKg
	 c4fwdgJItMGrU7Rk33KBdfAQPcoUzWhopVjbhzMuVVqheBnvE/7NEsIY1r/iKGJq6u
	 Dym/p8aMORQUA==
Message-ID: <3ead166f-8108-4503-ae81-7605585c816b@kernel.org>
Date: Wed, 28 Aug 2024 13:16:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm/a6xx: Store gmu_cgc_mode in struct a6xx_info
To: Rob Clark <robdclark@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
 <20240719-topic-a621-v1-3-850ae5307cf4@linaro.org>
 <CAF6AEGs23d5OqKst+ik-kMMXPCS_0=-a8ndskv3j4NduOVR1Vw@mail.gmail.com>
 <CAF6AEGuB5oB6RZLk+PfYMTV8ybboJymcvzJVu9ByHdu=KyvV+w@mail.gmail.com>
 <CAF6AEGtkikykNKHz0905HZ4FOJYieO5R3jr6-OO8QLYqok25BA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <CAF6AEGtkikykNKHz0905HZ4FOJYieO5R3jr6-OO8QLYqok25BA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.08.2024 10:12 PM, Rob Clark wrote:
> resending with updated Konrad email addr
> 
> On Mon, Aug 26, 2024 at 2:09 PM Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Mon, Aug 26, 2024 at 2:07 PM Rob Clark <robdclark@gmail.com> wrote:
>>>
>>> On Fri, Jul 19, 2024 at 3:03 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>
>>>> This was apparently almost never set on a6xx.. move the existing values
>>>> and fill out the remaining ones within the catalog.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---

[...]

>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -402,7 +402,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>>>         struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>>         const struct adreno_reglist *reg;
>>>>         unsigned int i;
>>>> -       u32 val, clock_cntl_on, cgc_mode;
>>>> +       u32 val, clock_cntl_on;
>>>>
>>>>         if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
>>>>                 return;
>>>> @@ -417,10 +417,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>>>                 clock_cntl_on = 0x8aa8aa82;
>>>>
>>>>         if (adreno_is_a7xx(adreno_gpu)) {
>>>> -               cgc_mode = adreno_is_a740_family(adreno_gpu) ? 0x20222 : 0x20000;
>>>> -
>>>
>>> This does appear to change the gmu_cgc_mode in nearly all cases.. was
>>> this intended?
>>
>> Hmm, and this will only get written for a7xx, so we're dropping the
>> reg write for a690..

Right, this patch is a lot to chew through.. It:

- adds the proper magic value per gpu gen
- removes the sneaky a690 write
- uses the new struct entry

but also

- fails to remove the if (a7xx) check

so I suppose for v2 I can split it into:

1. add the magic values
2. fix the if (a7xx) check
3. use the struct value and drop the a690 one

does that sound good?

Konrad

