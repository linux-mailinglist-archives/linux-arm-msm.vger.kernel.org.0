Return-Path: <linux-arm-msm+bounces-11720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D8285A981
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 18:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7250A1F252CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 17:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B4A3F9F8;
	Mon, 19 Feb 2024 17:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DqRGKItn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F83A3A1CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 17:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708362158; cv=none; b=bjvKnAWVGM5WvjPO2a4zW7Ne/7rkDzXq3kj42niCRDJxNw+qfCYGmWdu2eWDhy7qHnwnWyway7OcSVFVNnqG76QClEWduHIWuDIocOwi5WXOjzFjebRGXen8KLD4Wne0mcuQtp3f1hYWHMYNMZmAlXMs0RTk1qgm/n1wZ/RkPOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708362158; c=relaxed/simple;
	bh=SbHdXbCngdhqPo45u6wZhRhqPpziPXWeHo/J9esLF34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AueJus4Y6hMTK6J9qWMw3smaNfZUMSzecKBHI4PGKaIDRu5m8uhpKmyB7VUg2JcBdC3idhsb2USqJxfQwNmegWRAXsi52+im/4W6PEbx6UjKWOpjk1I38Tq2OMy8vXq2Z/HGLwAyudzZQVVua17ogzhjU7sn6Ek9abM+ywKJ3G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DqRGKItn; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708362155;
	bh=SbHdXbCngdhqPo45u6wZhRhqPpziPXWeHo/J9esLF34=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DqRGKItn0eYPSl4Tuuavzq0q43rKpLAojaaPARo/XlxGZFiuJ6kF3hblOUVIU1RU/
	 LLs6V7U0s7WEjPFHwfTWet2Fg+ByBAISXu1g2NKp7cxmhWUCubROiDxShT5ji5C+et
	 /wyulPFdZM16X1Rh/IM7Bnis3gcbRCD9UKIYA/MJmHTB3xjojMWwr9R2UCaUANJlTJ
	 1b5SDWrz9A9W81DfbOqF5IleM7BUoaEHk6NtgYeWe1b997TNU/opS51FqTlNFMDLIR
	 YEsT3ulNBt7y0blBDxlYsPZdvOJiv3J5ECqi/Rk5nZWocB8308cV+4SKo+OXFbUbxk
	 XioC/qOhsb4Ng==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D51593781FF7;
	Mon, 19 Feb 2024 17:02:31 +0000 (UTC)
Message-ID: <7463d514-b8f0-415b-b35e-264eced4fe1c@collabora.com>
Date: Mon, 19 Feb 2024 14:02:28 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: skip suspend tests for both msm-sc7180 machines
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20240216205650.2446153-1-dmitry.baryshkov@linaro.org>
 <0a120b86-702a-8dd2-9554-e1ccda7cee62@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <0a120b86-702a-8dd2-9554-e1ccda7cee62@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19/02/2024 11:47, Vignesh Raman wrote:
> 
> On 17/02/24 02:26, Dmitry Baryshkov wrote:
>> The commit ea489a3d983b ("drm/ci: add sc7180-trogdor-kingoftown")
>> dropped the msm-sc7180-skips.txt file, which disabled suspend-to-RAM
>> tests. However testing shows that STR tests still can fail. Restore the
>> skiplist, applying it to both limozeen and kingoftown machines.
>>
>> Fixes: ea489a3d983b ("drm/ci: add sc7180-trogdor-kingoftown")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt   | 2 ++
>>   .../drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt   | 2 ++
>>   2 files changed, 4 insertions(+)
>>   create mode 100644 
>> drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
>>   create mode 100644 
>> drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
>>
>> diff --git 
>> a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
>> new file mode 100644
>> index 000000000000..327039f70252
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
>> @@ -0,0 +1,2 @@
>> +# Suspend to RAM seems to be broken on this machine
>> +.*suspend.*
>> diff --git 
>> a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
>> new file mode 100644
>> index 000000000000..327039f70252
>> --- /dev/null
>> +++ 
>> b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
>> @@ -0,0 +1,2 @@
>> +# Suspend to RAM seems to be broken on this machine
>> +.*suspend.*
> 
> Acked-by: Vignesh Raman <vignesh.raman@collabora.com>
> 

Applied to drm-misc/drm-misc-next

Thanks
Helen

