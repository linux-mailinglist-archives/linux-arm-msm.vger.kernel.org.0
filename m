Return-Path: <linux-arm-msm+bounces-34971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C239A40F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 16:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E19C1F2463A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 14:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4A813C8F9;
	Fri, 18 Oct 2024 14:19:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08A824A08;
	Fri, 18 Oct 2024 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729261140; cv=none; b=c6IlQQOjLVMGUw+qQoUqCucUOejvEwf7lzLhtTwLpB93eznjgIA/3Lri709dcnlfeyLg6zh/50EaulzeYvDt26ace9sAhkOSwjEA3ueL11iF1GrMCdtxgRsKeBgJuaLVuUYQ1NZzunAbUgzPAZnO4inbZCnSCsSznA1LVY49DBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729261140; c=relaxed/simple;
	bh=yn35QLjFcNR3g0fNUv67vzQph/HVlIz1lIwzFeQlswg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChRff3BF6icZ2AUta6LP5YWHgIYB3ax/uGP8E2OSN36n5Ip0Subfhe7DTFmqe2+H7urFPY4IURVeFiIKC4x0cgacoKcb3x+j6Nqq7KW8SfXhi+tQYsQackWIbS/5DavfndBBtLUPLHgLG3WeRuqTMfF74LyD10QPs99AdZK9bBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEF09497;
	Fri, 18 Oct 2024 07:19:27 -0700 (PDT)
Received: from [10.57.78.54] (unknown [10.57.78.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E86E3F58B;
	Fri, 18 Oct 2024 07:18:56 -0700 (PDT)
Message-ID: <545e23ed-85fb-48f1-8d34-58c5f0b6506e@arm.com>
Date: Fri, 18 Oct 2024 15:20:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/gpu: Check the status of registration to PM QoS
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
 quic_abhinavk@quicinc.com, marijn.suijten@somainline.org, airlied@gmail.com
References: <20241018111811.3534385-1-lukasz.luba@arm.com>
 <dpwmookr5owd43efowmnoxbtbzstvezgczpbzwxb5rwu3h3zaf@luim5srcbo6f>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <dpwmookr5owd43efowmnoxbtbzstvezgczpbzwxb5rwu3h3zaf@luim5srcbo6f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/18/24 13:02, Dmitry Baryshkov wrote:
> On Fri, Oct 18, 2024 at 12:18:11PM +0100, Lukasz Luba wrote:
>> There is a need to check the returned value of the registration function.
> 
> Why?

The question can be:
why this driver doesn't check errors from frameworks during the
registration?

Is it a generic practice in that code (I hope not)?

When you check the API doc you will see that this fwk can fail and
return some error and the other functions in driver shouldn't
assume blindly that it was OK.

All other places in the kernel check that return value from
the PM QoS framework.

> 
>> In case of returned error, print that and stop the init process.
>>
>> Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>> ---
>>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
> 

