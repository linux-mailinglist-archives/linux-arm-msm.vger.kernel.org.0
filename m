Return-Path: <linux-arm-msm+bounces-31943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC84397B639
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 01:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A15E1C225F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 23:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B71174ED0;
	Tue, 17 Sep 2024 23:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEjo+Gyg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD68A29;
	Tue, 17 Sep 2024 23:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726616236; cv=none; b=nAWewQ2oTG6EANr5e8VRLcZ5JYU7BNuKv48X/sG2ZipHxnlnbsQ7R3S1OgX01ojyXCKBkJPzKYFiPSJo6stNkrAAdLY4QB8XXT8c2iE5oyBbxGS2Z5CwNAYQHd2e4vtZJku8W5ImxPhcGVxF6+yGzjzzBQ60zdvAG+ZIDZknJSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726616236; c=relaxed/simple;
	bh=Tm9TUILRz60Jl4CaoraZYxFgqY8fZWa3v9cSGYs1EIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YaZ+LlfoYChq4pptnCq5uz1nCnuSzHEHC7qsusXtdoOkcVj2MQjt3gYVPxTJgXAbDIVTa2BPMF3gX0snArH2Z9DU5t/tfxKZ7jh+UvcXA+RPSzGQYQaMJBqkOE9uGRpue6x6nCkItHhMQy6oh20dY66fGAeCw5ezO/VfI19B3RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEjo+Gyg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63B3C4CEC5;
	Tue, 17 Sep 2024 23:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726616236;
	bh=Tm9TUILRz60Jl4CaoraZYxFgqY8fZWa3v9cSGYs1EIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jEjo+Gygwb9Qnu4gOyyghOPAxAZeFfmqupRPeHdUViI76EkTb5uFREtWfiwHvpIvw
	 7DPbxsD+N6TBXLSTMeCdhXu+p9NX/OPrDnU+mahfFxOnj+hLCHx0gFwMlKrciOb9h2
	 N24dB0GOAVYwH5lvoWO6/3S1wSbzAsg9WNKKEiACeS0WvrzWcnZMTzxUtzROF2wes9
	 NpnJuc2g6iPmvdB1FmmygMXR21mEBIvQ1QwgzFT9wBLt5GEKjWeyt/LYJWaQS/U36i
	 FGMtX083NDyTlZ1wElOYKK7Yiaaqxj/CWPRXBoHo7yiHkDF6kvHLZ5w/nIcreF60u0
	 OZANZmUq4fpdg==
Message-ID: <59974e61-13f8-4080-850a-55e599c41cb5@kernel.org>
Date: Wed, 18 Sep 2024 01:37:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table
 update
To: Rob Clark <robdclark@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240913195132.8282-1-robdclark@gmail.com>
 <e6991910-5058-4ef0-bfdf-6d33953535dd@kernel.org>
 <CAF6AEGvgS-DD0+qGX_Mud75aES4AQQjmWx2j2gyz7uakTpnp0w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <CAF6AEGvgS-DD0+qGX_Mud75aES4AQQjmWx2j2gyz7uakTpnp0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.09.2024 5:30 PM, Rob Clark wrote:
> On Tue, Sep 17, 2024 at 6:47 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> On 13.09.2024 9:51 PM, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
>>> devices (x1-85, possibly others), it seems to pass that barrier while
>>> there are still things in the event completion FIFO waiting to be
>>> written back to memory.
>>
>> Can we try to force-fault around here on other GPUs and perhaps
>> limit this workaround?
> 
> not sure what you mean by "force-fault"...

I suppose 'reproduce' is what I meant

> we could probably limit
> this to certain GPUs, the only reason I didn't is (a) it should be
> harmless when it is not needed,

Do we have any realistic perf hits here?

> and (b) I have no real good way to get
> an exhaustive list of where it is needed.  Maybe/hopefully it is only
> x1-85, but idk.
> 
> It does bring up an interesting question about preemption, though

Yeah..

Do we know what windows does here?

Konrad

