Return-Path: <linux-arm-msm+bounces-11744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2281085AD3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 21:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C01C51F24471
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 20:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8943E470;
	Mon, 19 Feb 2024 20:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m3/JpcsH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FB950267
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708374832; cv=none; b=CxBgUJ/1eTiKZfhf4UPN7FUHcUfhfkV7DY79fiKXJGcwpsrYZuIriOM6T/qKMjQAxExSb/INpndVxHfHwVa2RdDniqaM48N+f4OJ4BtWQdrBcOFKbOOwuEvzwzhCAFd0fjhBq2tWN4UdT3//IL+7uoP2Ipc67RY2AzM5pgbDrkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708374832; c=relaxed/simple;
	bh=K6Ytl/lqMVYg6fJc17OpXmjO3ywU54h38AH2unjhRTg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EI/8L32Jwo8MOaUzGior5a8Qb7nfpbpE8scp9TcHZsnhEXGWSe9jSLWZhniQuKC4r1O6k8QDX0sWTmec/utPfYu9BopIoGlmsyLxqj5VRyUa4doaHsOXuz9CK0cEzTt9syhLWi0pyZ+5Gs+RiAA8O6lD5TyjSSYar/4uscf1Zzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m3/JpcsH; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708374829;
	bh=K6Ytl/lqMVYg6fJc17OpXmjO3ywU54h38AH2unjhRTg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=m3/JpcsH8XjuXIte54zpm5HGEme+qIbQS8RZQ9EURDO5V808RmCC02iQpiroElPlr
	 bByGoc6iJaiAQJFRHmc6ieCrGRt6dcCi6r1WSupmqB2GhSmSQoYGpH0f8JlJtV/m49
	 9vIjlojQPt26XT28KM7ahDPyYtO+BsmNf5xSmDfE6MfICPwl2BmJxiP5s53vt/WqxE
	 a88vJi3PXc6PkUciZuXgJGtzZ2MmTK5pVdW3XYzElU8TXR025KudqrJ40/4ieTZYEZ
	 ijjRTvSuvY3FZ70ERuf8R8MrbFp305pyNRRiVZnn9U7o8O/wfCbqtPViUYxfDdn0bp
	 rDXaPmK5wklzQ==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 868193782085;
	Mon, 19 Feb 2024 20:33:45 +0000 (UTC)
Message-ID: <f0a7267d-1271-4925-a13c-ef40ed233e76@collabora.com>
Date: Mon, 19 Feb 2024 17:33:43 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/ci: update msm-apq8096-fails list
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
 <20240218041204.2522828-2-dmitry.baryshkov@linaro.org>
 <d62d3507-20ee-4230-ba2e-c530ea5a9a60@collabora.com>
In-Reply-To: <d62d3507-20ee-4230-ba2e-c530ea5a9a60@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19/02/2024 17:26, Helen Koike wrote:
> 
> 
> On 18/02/2024 01:12, Dmitry Baryshkov wrote:
>> Mark two tests as passing on the APQ8096 / db820c platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>


Applied to drm-misc/drm-misc-next

Thanks
Helen

> 
>> ---
>>   drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt 
>> b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>> index 2cd49e8ee47f..88a1fc0a3b0d 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>> @@ -1,4 +1,2 @@
>>   kms_3d,Fail
>>   kms_addfb_basic@addfb25-bad-modifier,Fail
>> -kms_force_connector_basic@force-edid,Fail
>> -kms_hdmi_inject@inject-4k,Fail

