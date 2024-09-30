Return-Path: <linux-arm-msm+bounces-32737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B52D989B81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 09:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E2841C21319
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 07:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CC2155316;
	Mon, 30 Sep 2024 07:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Oz0MJoD/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA3F1552F6;
	Mon, 30 Sep 2024 07:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727681535; cv=none; b=nQN8jDuhCmS5ERCWJWBDAga9r6ihjzGRnE4So97sKpidhABxweQgDo8R11p4tSKLqG2wMe0iVJv92/62ANKN5K4gexHL0CzGS+W6ArXcx+GkrWVzvcF2tpYWDRq0iaFmVHc/ei2nHT9f2CXxVGhFAssOUYLZAlZFIJ3KHcjdoWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727681535; c=relaxed/simple;
	bh=M3ZGR3m5dE/OcpAuJgNW07sMzVd9xcG6hbRIN3GQi5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ntV7kpBja6qvX7WsGQvHKel6y9q5IcCOyHmPg8GC8I74v6FoC5RCmEjPUGCMviN+aSNotr0FQfJ46ufvK+JrbfxJ08zUTKW+PA+FfvN3Gdi2vLZDiIJhL9rUYhBRnvHRL/53vnkeP/EWf2hox9atjrs0gK8gddk6KT9BezTi+p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Oz0MJoD/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727681531;
	bh=M3ZGR3m5dE/OcpAuJgNW07sMzVd9xcG6hbRIN3GQi5s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oz0MJoD/WjoceXAqgBvUNpAstd9dV0jBR191CXDs3DaHEQv8fB6tEEkb3khrgiisE
	 nh7tdsJ05/IcW/muYpcMYD2UbZ59bvLNKjDb7A7RsthSIIYy9ISk7EtNcjZZJJ/j4b
	 46HY0ZSLujeCZ2Euue+8cxgFYaU/00AGdTSqrFGu+tvTdK4XrGCbrxAmA25H//DWD1
	 gnBnOgQkZjyB3Rxtdykg0mDYBmcB8VRkDHDSZOdUCxlY8BYcGNoed0Ur7HnpY3zSJe
	 +ONzA6kcS7zMAeoKr1mZ7/oMykf0KM1jTOBErKvVlvh8ykoNrOxERefW/OQ7/gJea/
	 VGMkeeuORJQXg==
Received: from [192.168.50.250] (unknown [171.76.80.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E73717E1047;
	Mon, 30 Sep 2024 09:32:07 +0200 (CEST)
Message-ID: <5fd48673-571a-4750-9704-e172f7ea372f@collabora.com>
Date: Mon, 30 Sep 2024 13:01:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/gpu: ci: update flake tests requirements
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, mripard@kernel.org, quic_abhinavk@quicinc.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240927052416.1833889-1-vignesh.raman@collabora.com>
 <ZvbCzqvyeTI_j2cD@intel.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ZvbCzqvyeTI_j2cD@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rodrigo,

On 27/09/24 20:05, Rodrigo Vivi wrote:
> On Fri, Sep 27, 2024 at 10:54:14AM +0530, Vignesh Raman wrote:
>> Update the documentation to specify linking to a relevant GitLab
>> issue or email report for each new flake entry. Added specific
>> GitLab issue urls for i915, msm and amdgpu driver.
>>
>> Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # msm
>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>> - Add gitlab issue link for msm driver.
>>
>> v3:
>> - Update docs to specify we use email reporting or GitLab issues for flake entries.
>>
>> ---
>>   Documentation/gpu/automated_testing.rst | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
>> index 2d5a28866afe..03769b4a17cf 100644
>> --- a/Documentation/gpu/automated_testing.rst
>> +++ b/Documentation/gpu/automated_testing.rst
>> @@ -68,19 +68,24 @@ known to behave unreliably. These tests won't cause a job to fail regardless of
>>   the result. They will still be run.
>>   
>>   Each new flake entry must be associated with a link to the email reporting the
>> -bug to the author of the affected driver, the board name or Device Tree name of
>> -the board, the first kernel version affected, the IGT version used for tests,
>> -and an approximation of the failure rate.
>> +bug to the author of the affected driver or the relevant GitLab issue. The entry
>> +must also include the board name or Device Tree name, the first kernel version
>> +affected, the IGT version used for tests, and an approximation of the failure rate.
>>   
>>   They should be provided under the following format::
>>   
>> -  # Bug Report: $LORE_OR_PATCHWORK_URL
>> +  # Bug Report: $LORE_URL_OR_GITLAB_ISSUE
>>     # Board Name: broken-board.dtb
>>     # Linux Version: 6.6-rc1
>>     # IGT Version: 1.28-gd2af13d9f
>>     # Failure Rate: 100
>>     flaky-test
>>   
>> +Use the appropriate link below to create a GitLab issue:
>> +amdgpu driver: https://gitlab.freedesktop.org/drm/amd/-/issues
>> +i915 driver: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues
> 
> Probably good to add:
> 
> xe driver: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues

Sure, will add it.

> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks.

> 
>> +msm driver: https://gitlab.freedesktop.org/drm/msm/-/issues
>> +
>>   drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
>>   -----------------------------------------------------------
>>   
>> -- 
>> 2.43.0
>>

Regards,
Vignesh

