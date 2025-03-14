Return-Path: <linux-arm-msm+bounces-51369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F49DA609FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 08:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74FCC3A5050
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 07:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AA81607AA;
	Fri, 14 Mar 2025 07:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FGMJFNom"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92FD15252D
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 07:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741936944; cv=none; b=LJ6TvalcAHzCthcG0xaJfL1BD6y/I/5zalROW+bQU7JlHINoExNKIKHc7lb4huu1vs3Y+oFcMpZWZuBtoQKzYq932FEhBTRPELj3o8aXij9gly3xaytl3w11FA/FXTkl76YsVuyFUWvHenT1Wonf9vc54d5tntDnu7HlKgJq548=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741936944; c=relaxed/simple;
	bh=b1J5tmKFP2elSXFUa6Q8dnEcz99VVBKKN0SRPPG50W8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0vag8HqcOEdVEH9sFVE9bIBXaji2ZHmeR/rMnxLDjcVZEJlNs3+c961Xc5Ux+mj2I8SRsFLxybkodMiSEu/OSEXHIX2FwMCFCHcuQuxS6rYvGJzvR365WdPEMauMOE8vMPyNXjTQeqAgieQ/pHPsXDbUBKZyMsLzh/fX7CQ8+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FGMJFNom; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39123d2eb7fso155197f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 00:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741936941; x=1742541741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7HUWZLB6XvkRSYV5keU5hc5SgzMl7bKgaxvzLFxeeb0=;
        b=FGMJFNomgotjyLwdvv4OyYeUsdtw2datKSSDtc/zhrUvSwCMd1YwBQxeUNWXFczRb8
         nT8Rj4AcbOLZ/zFOquwsnFnnmk4r7qhwhZcEINcaOnuGWwsvXFYaSC2VRvfBESSqOVj/
         iXqhxDT5VWktASKqmdIWORVLR48Tc+KQ89iuqTgfrJdux07NAuarDgGiIjTooza1jmA2
         a0fSrgZeYHpynSd9IoEnYPDLZsROMb0llGdCqLKiqLTw/GqBodej8dBldSVidh5q8blD
         bYDS3hUUs21MI/uUQxeuS5gDYRc5KtXy5YDO3OGKTQW7a7Uj8gLNiNDVYffVBCOmq94o
         avjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741936941; x=1742541741;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HUWZLB6XvkRSYV5keU5hc5SgzMl7bKgaxvzLFxeeb0=;
        b=jvaxG92knNhITrpBIae0y6vbF3rHKuj7tawh0n0w1yUKWmv16rhluVjWI2y4cqEKko
         X6pIqrcmOQ9WcSH7yT1olbBRC7ehj9GQLpPg9sxlqZbkloBfVbSLlbFVoi+ntMETNTaW
         bxEreimKnK8M6rLo7Ko6CIUs9wBoWTE3B5ULi6v72YjiHztohyHiB411B9jv6ICngLLu
         Kqzh8PnC/0EcqxHIwqLo3m9EaIdJ/vJ0yktE2zszgePEq7EDVfNR0L0wPHU2KxbRy4HN
         iRMHdvW8+p/LxJTS5WuuRBU5QCvhOO+CXx7971Z0iHzbEtTzwoOAuU1K4yWXDxJed9Sp
         BbfA==
X-Forwarded-Encrypted: i=1; AJvYcCUmGGbBwL2rgJkIsQfv1uaW2MUUnVH97AfK2MN1aIQZ0EBvb7ZgFpRoGov2SFpz0ceJFI5Ls0O+wDkcGhDv@vger.kernel.org
X-Gm-Message-State: AOJu0YyYF8iv7q1maklKSI9/6tVfdk+QC0EbC7aIR1ZzF0mviAAiEkAk
	1yH7Ck1ECNHFKpKG9x6h24vgEarx6PQ9A7L5UM7NHbogJwKrTIAJ4VA9wu2wKpE=
X-Gm-Gg: ASbGncsaZCyrVJhYQd0chg+r4XCOtCzxNqMrm8zGLs+B+h5UDkgORWh1DCv0+yn3kiU
	yrChBlpziF68KBwMfqboZ+kQjuYzOE2eOFaWFE2xvGuGAb4G/86nX+sss+xyVtmfZQITRw0uFEV
	QU/XYxE2w2CDMtbqe26+WL4tzt284Tb4h+vH7Omk0YLZFVl/6ixn9+mI3MNg6lbrINIQOm0IWAH
	kuM9fhKjIp8G/LNLcl8i9utbuPNTaoNalARh62BKrJjekpLfHwAfoN/aWqWRVlXzs2yDKfWnLsz
	oA0GtzRjOeGowHr8kiY8WHHcIk+TQ24seJLMD6WnX/yfhbpVDm+TIzgHwVh5LK4a0fegbpeUYg=
	=
X-Google-Smtp-Source: AGHT+IFqpUaO5BAfoMAWgpp/S+O2lpqO7jCO2UugS/12kRgniuV1f4bQhR/s6iZFyVH1bsT9wmCuew==
X-Received: by 2002:a05:6000:186f:b0:391:2b54:5fb5 with SMTP id ffacd0b85a97d-3971f40fecemr667494f8f.10.1741936941192;
        Fri, 14 Mar 2025 00:22:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975febsm4713500f8f.59.2025.03.14.00.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 00:22:20 -0700 (PDT)
Message-ID: <6957575c-9957-48b8-b828-0a6b48d4a743@linaro.org>
Date: Fri, 14 Mar 2025 08:22:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] dt-bindings: power: qcom,kpss-acc-v2: Add MSM8916
 compatible
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Robert Foss <rfoss@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>
 <a7d76aff-0dc2-4b0e-9ee8-f433d8e745f6@linaro.org>
 <wccjda6emgvsgn3t5qj7kfsih2stcelnvwu45qok4bbln5kk74@drqp7wrrges4>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <wccjda6emgvsgn3t5qj7kfsih2stcelnvwu45qok4bbln5kk74@drqp7wrrges4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/03/2025 23:53, Bjorn Andersson wrote:
>>
> 
> Where are you carrying these? Are there any other patches on your list
> that have fallen through the cracks?


Since 4-5 years I have a branch on top of next for pending patches for
Samsung (initially) and Qualcomm (since ~3 years) bindings, where I
collect all my and other people's work related to 0-dbts-check
wanrnings. The point is to avoid duplicated work. Around 2022-2023 the
branch grew to and kept size of around 100-120 patches. I was rebasing
it daily.

I don't maintain that branch anymore, so for dtbs-check it has probably
just 10 patches in total (remaining ~30-40 patches now is some other my
work). I also rebase it once per month or two months.

That Rayyan's patch is there since ~July/August last year, just like few
things for IPQ, qcom,pm8941-pon, DWC3.
https://github.com/krzk/linux/commits/pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next/

https://github.com/krzk/linux/commit/f6761796e02330b92653b35ba4b1c20ff304dded
https://github.com/krzk/linux/commit/fdd475359f378760085d3680423b291eca4bf808
https://github.com/krzk/linux/commit/855535ad2c4346b49f48c3fea6adbeea2262ffd8
https://github.com/krzk/linux/commit/f648bb95180f131241a5c7a7808c9f0865379c75

> 
>> https://lore.kernel.org/all/20240710155226.130086-1-rayyan.ansari@linaro.org/
>>
> 
> I'm picking Ryan's patch through the Qualcomm tree...
Thanks! That was my intention. Whenever subsystem maintainer skips such
simple driver binding, please don't hesitate to pick it up.

Best regards,
Krzysztof

