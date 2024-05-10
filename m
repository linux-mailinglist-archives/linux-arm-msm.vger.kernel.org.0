Return-Path: <linux-arm-msm+bounces-19706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C045A8C25E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 15:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F199E1C20D51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 13:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943157E583;
	Fri, 10 May 2024 13:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="y6ng1k1C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07AF5472A;
	Fri, 10 May 2024 13:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715348234; cv=none; b=XrP1/k+bm80sSrF3+zBXijSHNKOVZNGuTlR7i5x7RWXgpnrEUXWeqYXWGOROhZQSzB2+DP5ZMQJw/x1tx0nJO1TIFhIH4mje78pBDVE7/6L1mmB0kxLY7t/FKHlFiO94Eo0z0CcydMGe7PPqv7c2+sJ3zu0Dk/O/slOCafptNDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715348234; c=relaxed/simple;
	bh=3Jq1Hi7P/s1vouFwybYjISD8sE06aiZGtuaccX8h5E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NiGljH7inV01u/dGb4lOF3OwFyTwjnF94N2PGMOGAJOJc1+AfvO6y600qkBNf6CvBEp1w3jsnc0vXLTFrHcu9GtRa44eeNFMlfcjuWlrbE+g6V3MFPKdYWQaz77be5tZ05sCOyuCeRglVp70d9s77uYKJ7S8Qt5z/Uh+Q0L7OQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=y6ng1k1C; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715348230;
	bh=3Jq1Hi7P/s1vouFwybYjISD8sE06aiZGtuaccX8h5E4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=y6ng1k1CJmLR2SuMPRKqpljD80OMMjZpbOloF8AOvEl6Eq1ivcCRtNcDPEgbdM9Vq
	 YwryKLfdKhALR7DVA11jzg++215zWNssyG6VMw7lS0npoakBNJ/HBHYBLrMv3chicy
	 JYvp4xYEaQheUuoDfOO9DZsL/rshooJcjEgmB3mYH0RiMwEM2cHpDxY5i0L4Zv3fV4
	 7UiREiX6GLNcczr0CBuKCByAs3ifsG+xgndnrFzFrYekFEXJpI5kKquAtkb3BTEc/O
	 BXmJjaPFg2Gd9taG3Uhyw89Givq1kQxjTYjQUYX/J4qQEL0Mr5+5II7ULDYrOYnH1F
	 J5pdV33EB+QoA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CCA413781183;
	Fri, 10 May 2024 13:37:05 +0000 (UTC)
Message-ID: <c86ab913-dc0a-4ded-951a-5ae9ccb334b2@collabora.com>
Date: Fri, 10 May 2024 10:37:03 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/ci: validate drm/msm XML register files
 against schema
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <20240503-fd-fix-lxml-v2-2-f80a60ce21a1@linaro.org>
 <69b593b7-109c-825f-3dbb-5e8cce63ff01@quicinc.com>
 <CAA8EJpp4x+NEpMAGtgOmu-0NY8ycTu0iQX6-1Vv76mkKPea_Cw@mail.gmail.com>
 <24fb0b07-af03-1341-d98c-46f4f167fbbb@quicinc.com>
 <CAA8EJporB9jjKtT-XS4PcRSYzi+FJh1smsjnBCgy8f5JvDtjAg@mail.gmail.com>
 <e082de17-f4f7-1923-cfe0-10916c2e3caa@quicinc.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <e082de17-f4f7-1923-cfe0-10916c2e3caa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/05/2024 21:07, Abhinav Kumar wrote:
> 
> 
> On 5/3/2024 5:02 PM, Dmitry Baryshkov wrote:
>> On Sat, 4 May 2024 at 01:38, Abhinav Kumar <quic_abhinavk@quicinc.com> 
>> wrote:
>>>
>>>
>>>
>>> On 5/3/2024 1:20 PM, Dmitry Baryshkov wrote:
>>>> On Fri, 3 May 2024 at 22:42, Abhinav Kumar 
>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 5/3/2024 11:15 AM, Dmitry Baryshkov wrote:
>>>>>> In order to validate drm/msm register definition files against 
>>>>>> schema,
>>>>>> reuse the nodebugfs build step. The validation entry is guarded by
>>>>>> the EXPERT Kconfig option and we don't want to enable that option for
>>>>>> all the builds.
>>>>>>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>>     drivers/gpu/drm/ci/build.sh  | 3 +++
>>>>>>     drivers/gpu/drm/ci/build.yml | 1 +
>>>>>>     2 files changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/ci/build.sh 
>>>>>> b/drivers/gpu/drm/ci/build.sh
>>>>>> index 106f2d40d222..28a495c0c39c 100644
>>>>>> --- a/drivers/gpu/drm/ci/build.sh
>>>>>> +++ b/drivers/gpu/drm/ci/build.sh
>>>>>> @@ -12,6 +12,9 @@ rm -rf .git/rebase-apply
>>>>>>     apt-get update
>>>>>>     apt-get install -y libssl-dev
>>>>>>
>>>>>> +# for msm header validation
>>>>>> +apt-get install -y python3-lxml
>>>>>> +
>>>>>>     if [[ "$KERNEL_ARCH" = "arm64" ]]; then
>>>>>>         GCC_ARCH="aarch64-linux-gnu"
>>>>>>         DEBIAN_ARCH="arm64"
>>>>>> diff --git a/drivers/gpu/drm/ci/build.yml 
>>>>>> b/drivers/gpu/drm/ci/build.yml
>>>>>> index 17ab38304885..9c198239033d 100644
>>>>>> --- a/drivers/gpu/drm/ci/build.yml
>>>>>> +++ b/drivers/gpu/drm/ci/build.yml
>>>>>> @@ -106,6 +106,7 @@ build-nodebugfs:arm64:
>>>>>>       extends: .build:arm64
>>>>>>       variables:
>>>>>>         DISABLE_KCONFIGS: "DEBUG_FS"
>>>>>> +    ENABLE_KCONFIGS: "EXPERT DRM_MSM_VALIDATE_XML"
>>>>>>
>>>>>
>>>>> Wouldnt this end up enabling DRM_MSM_VALIDATE_XML for any arm64 
>>>>> device.
>>>>>
>>>>> Cant we make this build rule msm specific?
>>>>
>>>> No need to. We just need to validate the files at least once during
>>>> the whole pipeline build.
>>>>
>>>
>>> ah okay, today the arm64 config anyway sets all arm64 vendor drm configs
>>> to y.
>>>
>>> A couple of more questions:
>>>
>>> 1) Why is this enabled only for no-debugfs option?
>>> 2) Will there be any concerns from other vendors to enable CONFIG_EXPERT
>>> in their CI runs as the arm64 config is shared across all arm64 vendors.
>>
>> I don't get the second question. This option is only enabled for
>> no-debugfs, which isn't used for execution.
>>
> 
> Ah I see, makes sense.
> 
>> I didn't want to add an extra build stage, just for the sake of
>> validating regs against the schema, nor did I want EXPERT to find its
>> way into the actual running kernels.
>>
> 
> This answered my second question actually. That basically I didnt also 
> want EXPERT to find its way into actual running kernels.
> 
> Hence, I am fine with this change now
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> But, I will wait to hear from helen, vignesh about what they think of this.


lgfm

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

