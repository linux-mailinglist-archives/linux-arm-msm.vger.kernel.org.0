Return-Path: <linux-arm-msm+bounces-43684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA1E9FEA9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 21:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EC6816215E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 20:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C7D1946DA;
	Mon, 30 Dec 2024 20:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bshTT+hf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E17819340D
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 20:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735590754; cv=none; b=rce/ocG2f740druHQIxv+yRICZQZQsw1Juq5XnqXLbR2jUJaMh9E2yzl2CdW7BeRoPkFFyJwQbEOiWVLGVtZiDTUblQ8JrMP6fPPbogRBtgdIjsLnu0SWz7tzvbhADwSCbVHO1jFmmbxKjFpFF6ffoQhaCMNtVb6AFQBzvQfgzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735590754; c=relaxed/simple;
	bh=bZYw2r5oOyrmTwDfLz6CNZZIKHc7PL13H43dAGE315E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIQFoKVTev2dPoCsgzMP2ethieEEeLsr0nk54mmKTOcp6z9XTE5uFxdtX65q5oKJHDA4FAbv2j5AB+sGuZ2DDbXplC3E1TTB+J8mcwqcOB929rA9fNjaEffUK2h/GRCa3He6229g9RayaL8MHEsZMHVBD0/FUnmrb0dDHso0qWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bshTT+hf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3862b364538so5451198f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 12:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735590751; x=1736195551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3pq0s3ckIiTlqXik31Tw6lXUUphfCKc9DjHpksYo6NA=;
        b=bshTT+hfGWwLSlYr1AS75D2MVfndFzPOTEvdoQG432ny9BIFc5l6wgP4T18DDF8NZl
         tYn/dSnBJvYHwRjK0n9d+fv+/PaLwLGDi4RdDxxVHhsBKmsDSX6INWLez8/4mlNTt8nm
         llNyLDWw1ERViMGRK++hC1hk+Iw+PNlYDhQgGrqfGkwZ375cMOl5bGMCG94UCGyTAoq5
         GXMF7LhCgfAGwGiNOKtv/F6oq+nyRGcaO0I/Dx+3K6c/PS/s/Pp0hr3a66Y7H3MRQLH6
         IbiQkhqG0f2EA5xhcINXenHmSiesE7cB/uFT8ri5kz2qG8PcgZNTmIeaeHZ+y/XmM+3d
         4D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735590751; x=1736195551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3pq0s3ckIiTlqXik31Tw6lXUUphfCKc9DjHpksYo6NA=;
        b=h8NeaBSWfhU6i2C2ewPLnnFUSCTPL1fSxGFCOGktWRD1qd54jXJPE64Ud+2KHnUG0q
         VS3r2NiLi6N9dk+5xd1iQ4PRib6qNj7HUmyxq2Dk5ORuE8vYwunRI1QhmXGAfC9KVjx6
         0T+1zW/E+0h7Eag+RyV9XXGjVXF9/+4UW1c5IkMJlr4V2vekoyIdzZ3uf6uZ5j5hwYzt
         Y48rsq1nTL39SHfdDzwbkorHcRBkCKNkl21rioZJmI/HMuEmsW2AtZWhx13Kbpf2y7U4
         4Ij0XpgOYdz89ym8YEp8pKvKtmxDtN3gj/j65J+AeoLIkxZstYi10cPaDxK4JtPYjtv8
         q/0g==
X-Gm-Message-State: AOJu0YxqGBvTtvqc/i7fwaXuIKuvQ8LReAdaqWh6aihdXc5eKfMcLg6W
	zeESfwDb1hKdgZwG/IsJuC4JKVp3LXMTss8jUn4V7g5H1Ck9mD/Nk1VWindKjEE=
X-Gm-Gg: ASbGnctX0zz2qb18VcOp+hHy0qVeruMCKf4OIsQhZNP04qKpi3cp1cvrOvCARaVmIfl
	tAHtd7pTBXm52/geE96RokFr88q01YtFE480JttcO3llgAMF4SKZOVsAhB855/OAENczF2yty9f
	/kjghyQ2dYGRzeOhr/vw7L1/7v7joot6R308UGe0Jw9hO5o3QAbxjQhcwHVPDcId8L7wypR/Rfw
	FwzP1Y0xFGtljko9iVcz+ZpKUoeUFa0tVm4KwZKn/fGrJBD5WayE5J1EaTi9ntToto7LNNfZeI=
X-Google-Smtp-Source: AGHT+IGnMunM/UAWS3Rwrx3prMio8qRf5DD/jYD0DbMIHgWiFAB26vYnuoJYyxLlaG3R4f9Ruoy8wQ==
X-Received: by 2002:a05:6000:703:b0:385:f7e5:de88 with SMTP id ffacd0b85a97d-38a229ec5b0mr27423543f8f.3.1735590751612;
        Mon, 30 Dec 2024 12:32:31 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c84840asm30889572f8f.61.2024.12.30.12.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 12:32:31 -0800 (PST)
Message-ID: <8dee006c-cc1a-4274-8691-2d58372bc022@linaro.org>
Date: Mon, 30 Dec 2024 20:32:30 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Add missing fixes in fastrpc_get_args
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Ekansh Gupta <quic_ekangupt@quicinc.com>,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
 <173557534277.273714.16861047953843054499.b4-ty@linaro.org>
 <qd32erndjbtspx4im5u2ge2vgdc4qwwvxhkoaefxwzkue5x7kc@ghk5fdkma6vm>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <qd32erndjbtspx4im5u2ge2vgdc4qwwvxhkoaefxwzkue5x7kc@ghk5fdkma6vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/12/2024 18:22, Dmitry Baryshkov wrote:
> On Mon, Dec 30, 2024 at 04:15:42PM +0000, Srinivas Kandagatla wrote:
>>
>> On Wed, 18 Dec 2024 15:54:27 +0530, Ekansh Gupta wrote:
>>> This patch series adds the listed bug fixes that have been missing
>>> in upstream fastRPC driver:
>>> - Page address for registered buffer(with fd) is not calculated
>>>    properly.
>>> - Page size calculation for non-registered buffer(copy buffer) is
>>>    incorrect.
>>>
>>> [...]
>>
>> Applied, thanks!
> 
> May I ask, why they are being accepted with the obvious checkpatch
> warnings?

If you are referring to this warning.
WARNING: Invalid email format for stable: 'stable <stable@kernel.org>', 
prefer 'stable@kernel.org'

I tend to fix such small warnings before applying. These are fixed now.

> 
> What kind of process is being followed, as those patches had review
> comments to be implemented in the next iteration.

I apply these patches if it looks good to me. This also helps with 
getting it tested from wider audience via linux-next.

I do run TFLite workloads before it ends up in char-misc, but not for 
every patch.

sorry If I missed any blocker comments, but your comments were more on 
the cover letter content and asking about the work loads which triggers 
these bugs.

Are these patches breaking any of your test-cases?


--srini


