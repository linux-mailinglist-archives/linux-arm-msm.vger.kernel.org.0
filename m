Return-Path: <linux-arm-msm+bounces-51230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1ABA5EBC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 07:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91A5B16D9C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 06:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86E81D88D0;
	Thu, 13 Mar 2025 06:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AE/Wt8a4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705EC78F4A;
	Thu, 13 Mar 2025 06:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741847499; cv=none; b=bZd/Gsby6QAXOnFVvFDH536qsIkDc/DjFk8oeXoJpoitlBFTAq+nCDp3Qvln+x8282etm217Jct9Nb8P2Ux6R5UjN6oRp97l6UuECcQMn+Iq7Z2R15ixLqel1ihFDGXJZ6plJTGI1CXZA441pJGfsUdBc929MwFKgvryEQCdf60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741847499; c=relaxed/simple;
	bh=r9wOzZAb7lh74joaS/3Q8N4jgKKEEgxKxSDaj1n8jHs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aYXGYCCaSYsBkRHyCoRZy6+qn/WDOZhrvyVCiBaqybPSP9IxtGZkEmEzFOyM8UXABoSw8HnLbC+PeQtmjrN7X24RGYUr+LacjsiQtNFCET061TprwTHpsGlNYwvNXCU7bW61eKVInaQkDhHVFMOvhdBqXnFIE5KugV9cQ/FofUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AE/Wt8a4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741847495;
	bh=r9wOzZAb7lh74joaS/3Q8N4jgKKEEgxKxSDaj1n8jHs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=AE/Wt8a4kPLLiHdH/OKdrQl3Hum7kZPqP6rP6CikppGajHzQaRyqWJge8hO6LRKIf
	 9Xrf1WBtlp7RZxOV1kRcMg/X1/D9zZk/AL85JkkRGUz2m2xQERI/KjX72eDw7UjEvr
	 S+/JQ/bfgQ0V2dN9wj7e6NFur3MAbCuy7/sHgj0ToexfqtvjL1GGreKz5IRsUkyI4X
	 SvYramnoCq2kBkcyjMLWN0GqvyTQdYc3HfQY43zJPFp1iOrgzB5Rac5D3VWXZ1D1g2
	 MRYJqm3cOuQ6VIGvRqPylgP+hNojpMc5lr/ukPavLPEUyOP7oAGjJONk9krMjfSvwF
	 p1H1x0ukgql3g==
Received: from [192.168.50.250] (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0584117E1521;
	Thu, 13 Mar 2025 07:31:31 +0100 (CET)
Message-ID: <f716925c-d8f8-4713-9f02-a373297ab5a3@collabora.com>
Date: Thu, 13 Mar 2025 12:01:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ci: add kms_cursor_legacy@torture-bo to apq8016
 flakes
From: Vignesh Raman <vignesh.raman@collabora.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 lumag@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20241204-cursor_tor_skip-v2-1-f03bcbc4b455@quicinc.com>
 <cc9501d1-c779-4728-a609-ce83a73f46f6@collabora.com>
Content-Language: en-US
In-Reply-To: <cc9501d1-c779-4728-a609-ce83a73f46f6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Abhinav,

On 13/03/25 07:40, Vignesh Raman wrote:
> Hi Abhinav,
> 
> On 05/12/24 01:29, Abhinav Kumar wrote:
>>  From the jobs [1] and [2] of pipeline [3], its clear that
>> kms_cursor_legacy@torture-bo is most certainly a flake and
>> not a fail for apq8016. Mark the test accordingly to match the results.
>>
>> [1] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481
>> [2] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430
>> [3]: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1322770
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>> Changes in v2:
>> - Fix the failure rate from 100 to 33 as thats the accurate one
>> - Link to v1: https://lore.kernel.org/r/20241204-cursor_tor_skip-v1-1- 
>> f5f0bba5df7b@quicinc.com
>> ---
>>   drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/ 
>> drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>> new file mode 100644
>> index 000000000000..2fb192c92559
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>> @@ -0,0 +1,5 @@
>> +# Board Name: msm-apq8016-db410c

Board name should the dtb name. In this case, apq8016-sbc-usb-host

# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/72

Please add the bug report link as well for flake test. I have created an 
issue in msm.

With this fixed,
Reviewed-by: Vignesh Raman <vignesh.raman@collabora.com>

Regards,
Vignesh


>> +# Failure Rate: 33
>> +# IGT Version: 1.28-ga73311079
>> +# Linux Version: 6.12.0-rc2
>> +kms_cursor_legacy@torture-bo
> 
> Reviewed-by: Vignesh Raman <vignesh.raman@collabora.com>
> 
> Regards,
> Vignesh
> 
>>
>> ---
>> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
>> change-id: 20241204-cursor_tor_skip-9d128dd62c4f
>>
>> Best regards,
> 


