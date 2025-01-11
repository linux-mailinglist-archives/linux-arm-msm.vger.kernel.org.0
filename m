Return-Path: <linux-arm-msm+bounces-44792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14172A0A3C5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 14:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D471C7A409E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 13:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9891922EF;
	Sat, 11 Jan 2025 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R926hWDd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FBF139D
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736600945; cv=none; b=D667aCo9kGZ+yKrYYHw1qx433FRuXT7KRMXi0dd1rOOMVisKYPRQ+W2Jo/ObcEo0rX6NI32vRB4+NUAyRyFfNGoTs9/T5XsePgvg+DfYb65FYLWRBZQ4bYWIdafccbbh1G6nS3CGroLNYKkTChswIxCHIJgtDu3tB4CitV7CWLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736600945; c=relaxed/simple;
	bh=IvctZyKtmfsKSEGYJ1deOLYUKt/5qGT9DUlzxgM//7w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=of4wtliWFpChu/YFfp/4o8J/eBVtLaRtuYv8QHyKYgY6yD3RNgiJ6es2iqstDa0nQSfU1LnG+98aMjXcl7dQIF/jkgtfakO4giDaN05tdTKOl6nIWvCa0c1iGxrfnHtxh+BLeP1OuIrnfyYd/IXxhaR3J++eKQ953Ax3q8TqIpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R926hWDd; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a04so2691611fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 05:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736600941; x=1737205741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qx1wyBpWYHJu++PDsnhtF5U0w2Z7xCP50OWt1HUfTZY=;
        b=R926hWDdHqRQHMf/YACt0r0wYs3MvayWvq9DgrokOUFUxev4Mo9SQKH3hXjDWwbkIc
         9Q9nxoD15kPCHxOU8bAKO0q4E/MJi7g1zfCEc/8ZkvSlaVLMBT6qpQQtXyuJL8gADALI
         6GGVTwgMCHK59R3eke/hhVdntAPgchL98yosEOV3L4qb+nmvKDDPYt2h2LXJvo6HZDnC
         afouBptQ7DMEJuk5PBNrI+SR9Qd9VkgT6Y+Y2fnF44rmT92aR7a8y3MfxWisXmmKQdvY
         vbfFyRPrn7o72cCTTXjZ1ev7IA/o3SI3A+ChyOcNA84kn4MkAt9ByBeMdYXSsVUh1Gaz
         hnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736600941; x=1737205741;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qx1wyBpWYHJu++PDsnhtF5U0w2Z7xCP50OWt1HUfTZY=;
        b=OptyAzYSUMrAuRXDDwzI0iAN2n0Dmcc53DLUEjTUvpFaYfsDVa2AvglZJzqg+DeE65
         9ljtl+u/GuNZET9nVh1yk3lnmP9DehUBUfQEXUwU/ESzbKh1EJ9u/oF/SgaZ/m1ipdLB
         z8ixjGSw1HjTzvJDrVzBhzMJLlx4bSjn0QF9zwIfwukJVvLHlvulSG3ADIMQKj0Ubttm
         lT+szT0t8Y9GGLsxmnMyUkj4n9hLWlVRHu/ljVfWER9IpyEkDSbZw/Gk3jfCCf6oE7k/
         8kl2O0lHGqDrYP0ovK801wu1BOrspDTSaIB8b0EIdoSDfosYXyQqv1aequjZuk2nr0rP
         miHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcXQQ0NHLyNXrsYTBkCVN+O69oXxJKe/hD5nwzz5dFKMekseFOkHZbjP4pcNuhemk7bFiwPxPzwlleYiys@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsjq5ap2dTp7b/HhdgzwmHrXUNVTM6qN+9Y4XRboMSSaeGCTpY
	/wkfMnoEVtL0VIcQuHlbBsopU/kzvY5hIMLZD3E4YbRvxhW+SOeBexeqPLot2PE=
X-Gm-Gg: ASbGnctbSfK71SlKzBRRHz7Hrb58kw4sHfPVXQpz3wK/zFMUdZC+fVH7891sK7Jaefi
	lhlfYQu95htNE2gp81pBcCEWUJv3biIw7TpC7uvIo/f3ys5UU8haUZbAbzlImxyruW+pLG1Q01r
	0CPB7Td8Uko5UoHBTeqS8e1MIdxYnerjeFTjylbdyViqeqpv7qkze9i96w3IGUH0hdDdwguA/y3
	SruPpExdT0U39BNcvbn9058f6Vi5/n8nSeBi7vGSxBjM6/sQGZ04CUYq7fPaygzweDbd8fAl8+7
	koxhw8/mKxdfFQy+zi8q/ikG
X-Google-Smtp-Source: AGHT+IET3fM2KyzPq5qZrZvi3XK0YobTnnm/AX8Pu0nvU0MJZHQlXUZxi9ueffT+lleeGgmRDlOzLw==
X-Received: by 2002:a2e:be8a:0:b0:302:1b18:2bfa with SMTP id 38308e7fff4ca-305f45b25e8mr51230021fa.23.1736600941149;
        Sat, 11 Jan 2025 05:09:01 -0800 (PST)
Received: from [127.0.0.1] (85-76-141-224-nat.elisa-mobile.fi. [85.76.141.224])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0f9d82sm8254421fa.65.2025.01.11.05.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jan 2025 05:08:59 -0800 (PST)
Date: Sat, 11 Jan 2025 15:08:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_4/9=5D_drm/msm/dpu=3A_make_fix=5Fco?=
 =?US-ASCII?Q?re=5Fab=5Fvote_consistent_with_fix=5Fcore=5Fib=5Fvote?=
User-Agent: Thunderbird for Android
In-Reply-To: <a17204c1-6eb5-4ce4-a302-c5f582055037@quicinc.com>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org> <20250106-dpu-perf-rework-v4-4-00b248349476@linaro.org> <35a22251-c348-4bb7-905c-e24032100a00@quicinc.com> <sklr3ryu35xmoejkmbu35d3jxsg2clk3whmzslxtzcbcb3gjy4@bmcivlzkxqa3> <a17204c1-6eb5-4ce4-a302-c5f582055037@quicinc.com>
Message-ID: <0B5D10CF-35CE-4CF5-9105-5ACCC04EB94B@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11 January 2025 01:49:23 EET, Abhinav Kumar <quic_abhinavk@quicinc=2Ecom=
> wrote:
>
>
>On 1/9/2025 6:02 PM, Dmitry Baryshkov wrote:
>> On Thu, Jan 09, 2025 at 05:40:23PM -0800, Abhinav Kumar wrote:
>>>=20
>>>=20
>>> On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
>>>> The fix_core_ab_vote is an average bandwidth value, used for bandwidt=
h
>>>> overrides in several cases=2E However there is an internal inconsiste=
ncy:
>>>> fix_core_ib_vote is defined in KBps, while fix_core_ab_vote is define=
d
>>>> in Bps=2E
>>>>=20
>>>> Fix that by changing the type of the variable to u32 and using * 1000=
ULL
>>>> multiplier when setting up the dpu_core_perf_params::bw_ctl value=2E
>>>>=20
>>>=20
>>> Actually after looking at this, I have another question=2E
>>>=20
>>> How did you conclude that fix_core_ib_vote is in KBps?
>>>=20
>>> min_dram_ib is in KBps in the catalog but how is fix_core_ib_vote?
>>>=20
>>> It depends on the interpretation perhaps=2E If the debugfs was suppose=
d to
>>> operate under the expectation that the provided value will be pre-mult=
iplied
>>> by 1000 and given then that explains why it was not multiplied again=
=2E
>>>=20
>>> And I cross-checked some of the internal usages of the debugfs, the va=
lues
>>> provided to it were in Bps and not KBps=2E
>>=20
>> Well=2E=2E=2E As you wrote min_dram_ib is in KBps=2E So, by comparing t=
he next
>> two lines, fix_core_ib_vote should also be in kBps, as there is no
>> premultiplier:
>>=20
>>                  perf->max_per_pipe_ib =3D core_perf->fix_core_ib_vote;
>> [=2E=2E=2E]
>>                  perf->max_per_pipe_ib =3D perf_cfg->min_dram_ib;
>>=20
>> And then, as a proof, perf->max_per_pipe_ib is passed to icc_set_bw()
>> without any modifications:
>>=20
>>                  icc_set_bw(kms->path[i], avg_bw, perf=2Emax_per_pipe_i=
b);
>>=20
>
>Understood max_per_pipe_ib=2E But then by the same logic, fix_core_ab_vot=
e is always in Bps and not in KBps because bw_ctl is in Bps=2E
>
>Is it really a discrepancy that fix_core_ib_vote is defined in KBps, whil=
e fix_core_ab_vote is defined in Bps because they are just following the un=
its in which bw_ctl and max_per_pipe_ib were defined in resp=2E

Yes=2E They come in pair, as a part of the user interface=2E If one is in =
Bps and another one in KBps, it is very easy to forget that and misinterpre=
t them or to make a mistake while programming them=2E Not to mention that t=
he threshold files, which are related to AB, are in KBps=2E

>
>>=20
>>>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Ec | 4 ++--
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Eh | 2 +-
>>>>    2 files changed, 3 insertions(+), 3 deletions(-)
>>>>=20
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Ec b/driver=
s/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Ec
>>>> index 7263ab63a692554cd51a7fd91bd6250330179240=2E=2E7cabc8f26908cfd2d=
bbffebd7c70fc37d9159733 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Ec
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Ec
>>>> @@ -125,7 +125,7 @@ static void _dpu_core_perf_calc_crtc(const struct=
 dpu_core_perf *core_perf,
>>>>    		perf->max_per_pipe_ib =3D 0;
>>>>    		perf->core_clk_rate =3D 0;
>>>>    	} else if (core_perf->perf_tune=2Emode =3D=3D DPU_PERF_MODE_FIXED=
) {
>>>> -		perf->bw_ctl =3D core_perf->fix_core_ab_vote;
>>>> +		perf->bw_ctl =3D core_perf->fix_core_ab_vote * 1000ULL;
>>>>    		perf->max_per_pipe_ib =3D core_perf->fix_core_ib_vote;
>>>>    		perf->core_clk_rate =3D core_perf->fix_core_clk_rate;
>>>>    	} else {
>>>> @@ -479,7 +479,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dp=
u_kms, struct dentry *parent)
>>>>    			&perf->fix_core_clk_rate);
>>>>    	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
>>>>    			&perf->fix_core_ib_vote);
>>>> -	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
>>>> +	debugfs_create_u32("fix_core_ab_vote", 0600, entry,
>>>>    			&perf->fix_core_ab_vote);
>>>>    	return 0;
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Eh b/driver=
s/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Eh
>>>> index ca4595b4ec217697849af02446b23ed0857a0295=2E=2E5e07119c14c6a9ed3=
413d0eaddbd93df5cc3f79d 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Eh
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Eh
>>>> @@ -51,7 +51,7 @@ struct dpu_core_perf {
>>>>    	u32 enable_bw_release;
>>>>    	u64 fix_core_clk_rate;
>>>>    	u32 fix_core_ib_vote;
>>>> -	u64 fix_core_ab_vote;
>>>> +	u32 fix_core_ab_vote;
>>>>    };
>>>>    int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>>>>=20
>>=20


