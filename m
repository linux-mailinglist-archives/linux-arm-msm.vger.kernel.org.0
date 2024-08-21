Return-Path: <linux-arm-msm+bounces-29204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C0F95A003
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 16:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5202B240B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 14:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B998F1607B0;
	Wed, 21 Aug 2024 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQjNdJ2K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D72132111;
	Wed, 21 Aug 2024 14:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724250862; cv=none; b=Wzadf6LyXany2/40hfGTCtYPVdRejIMwQOuqgV9WoJUEGIEUydCtJdYxuRaRt+LXd7R7BghyNF46VBMr/Zn/cwLXNgTyQbx8vliLd/u/BHnHIz+B9MqactEfQ6FZSgDCefacpS2MjHKsw5CYZ8yTf5e3QmBN/9Oja1JwELnScS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724250862; c=relaxed/simple;
	bh=bUZVo5y0uo9wGVTTsOaA5HDns+wyi0nCGXSLbh+/Yxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsB+lZs16IfgD+N+7C76fum4CPZfAHYQQ2mn9Bu7oSvnobQK0EsWZ/iGCUrm4aQCDu4YxoWOO/nZFsyrMrKtY+fZxXNy4tkrgbmTJz7t+DEiY8Ilzv7DdUYGsUlTzd07mdgas5L06GNnoBhEuV/Je2dXD4V03XLZQGfUpx61D+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQjNdJ2K; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5bed72ff443so6274116a12.1;
        Wed, 21 Aug 2024 07:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724250859; x=1724855659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UR+KwYc9lrWNXtCafAT5/wVnX1MflyYbcpT1ZdueVMM=;
        b=WQjNdJ2Kvr61/qjjku+wKJ6DDuhUFcckwpNY6SUGhJ0ISgRA+te/LQ7vyE9EAB40OA
         Ey2jmZEbMuDbOk1OaSd4aZ6L3hjzTe1NquGqqMJueGhw1Gnd8nvvimn7MUNoHUKxqwEo
         tvfuYqjuq06g69ny/gNMxf5zl4O8Q7Nv8IJuSqH1QqnnelONQNe+2PLjAO/vG7XUeVDU
         /TOdw3Fg9gkl+1//83hmFrLREH9TJF96sRI23M/b1v3++0+ZkhoQPQULr7TgYeob9rU3
         kQ1k8sBfKGfmGoWA9dGHbeGPhvDQaA5c+oJahbmULmDVVtF4ayx2F7ONJ+YYxTCXN5Ez
         7zTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724250859; x=1724855659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UR+KwYc9lrWNXtCafAT5/wVnX1MflyYbcpT1ZdueVMM=;
        b=FLOsDmtH28FM9m6GXROw+EVf6B5ZmGS9I9ou8PR4TodTvyYQbKLWXdHjXAyXxUANdJ
         P4hR6dj3qEZ/oh+/umVZuKiwIKt2zVDHObXVYOQabHHjTbZsvXBAHbu8k7JKB5OJ2M9m
         x3CpW0yUVpB2bGiGmcZtq/psGg0qsvEFMR1LZgBtra+rmjujeYEJoOkDxHIUSESk9D+7
         jTBP7Ksuz2MUiCTwGe3kAPqXG6lPna0Ob7SKNjHfuzU8S7mwEOU29A3Hp1RuHGEx5ToK
         hJ0dj11yxfPvAoKQ7xmX+Phh2sPg74JYw0m+65SjafmqRlSHDFobrlhqb4d+Eb9ABLXN
         SnVA==
X-Forwarded-Encrypted: i=1; AJvYcCWZdn+IoZGHJR9xz0QeJhEjUH9zIxsw7faIBotiStf0FZ9HdsS6u4FqaAVnn7q59EPUWp4jqs+Gbk/1T5/S@vger.kernel.org, AJvYcCX6q1HOlxMQEtvm77KnfaKSeptbNeBUPvWTq3sV2Lp0KGlN8PtBALT+A+9OAmO+N4vDtC/ImFXnxdZChFSB@vger.kernel.org
X-Gm-Message-State: AOJu0YyXcaAE7RIlhuQpmgL1+w4RG6lkL3MhQN2vc9ulpjW9rQUofMSw
	MYGBQCizcaZvE909kb4PHo0FY+daOJTW8koYpe8JBIaTk6EpF0um
X-Google-Smtp-Source: AGHT+IG00gtDcFSOH4+sQGkIehK6jaUt+gJZWvpFBFTs9mKnIYjUOIRHHw+Pbxh2Ln0y3OO1unQn0g==
X-Received: by 2002:a05:6402:320d:b0:5a3:a9f8:cf20 with SMTP id 4fb4d7f45d1cf-5bf1f25be42mr2012925a12.34.1724250858531;
        Wed, 21 Aug 2024 07:34:18 -0700 (PDT)
Received: from [192.168.1.14] (host-80-104-252-9.retail.telecomitalia.it. [80.104.252.9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebc081db4sm8112609a12.88.2024.08.21.07.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 07:34:18 -0700 (PDT)
Message-ID: <14591112-4455-49b4-8b1a-3feffc4d343f@gmail.com>
Date: Wed, 21 Aug 2024 16:34:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-4-7bda26c34037@gmail.com>
 <20240819200837.etzn7oaoamnceigr@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240819200837.etzn7oaoamnceigr@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/24 10:08 PM, Akhil P Oommen wrote:
> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wrote:
>> This patch implements preemption feature for A6xx targets, this allows
>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>> hardware as such supports multiple levels of preemption granularities,
>> ranging from coarse grained(ringbuffer level) to a more fine grained
>> such as draw-call level or a bin boundary level preemption. This patch
>> enables the basic preemption level, with more fine grained preemption
>> support to follow.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
> 
> No postamble packets which resets perfcounters? It is necessary. Also, I
> think we should disable preemption during profiling like we disable slumber.
> 
> -Akhil.
> 

You mention that we disable slumber during profiling however I wasn't 
able to find code doing that. Can you please clarify which code you are 
referring to or a mechanism through which the kernel can know when we 
are profiling?

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


