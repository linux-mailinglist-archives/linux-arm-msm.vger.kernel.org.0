Return-Path: <linux-arm-msm+bounces-32553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5183A986F38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 10:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 077CB1F21D9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 08:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB181A42AD;
	Thu, 26 Sep 2024 08:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W7qGOs/W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DD71A4F2B;
	Thu, 26 Sep 2024 08:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727340461; cv=none; b=NIdNX8ImFgEKm7Qf8UUXevnE0t3d3aTCYy1qiFDn/Q43DhAb8OVDFbQUQMTkR1t5PS/s9rBdfdly0SRJOLECHDC9NaGbnZ37Nt7ntY6oiQrck3iH8KfVrh043spUVBsaz2Mx3SCgvdZTB0WZehYNnTJeJJuc1Iv+pP8onvw1Gos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727340461; c=relaxed/simple;
	bh=Vvzgd1LgiFFFjFTb0+aUplSVjTmllj9XrlLOmFGWpvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgCiXHQFVa1+16IrGqmsspUYZKmMA6DPUbEJ896HP8rGkhASngCMaVROyr6LkBmyaIwfMrCZaImVxLm4xUTC61m+9QOdZK+i65P2oa8rfs8P6zQCxh6wLCAJjiXGXnYsnTkpdx1FZ+M99Opqugen3cHFcqquugll9pPTh++A9os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W7qGOs/W; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727340457;
	bh=Vvzgd1LgiFFFjFTb0+aUplSVjTmllj9XrlLOmFGWpvw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W7qGOs/WXTcXx3RVTvEB2eSz0bFlxfIYGcY9VZKLpS7wzZyyKhJEQKdhfCBCZWKv9
	 9M5yQ2aIMD9mnlwpL3oETbnJqGqSCa7DWtGW9smRY1pQ9sA2H6SXCxDrGePgnGnV6B
	 G7LV/i6hn/yhLeyBfU5SgJw4bZrVOAfBb/FVNK2qn08z9tV1PotXjmwBrJxNjvEv+O
	 C0DoHfqKT8zEw7l+OIobUsRFyHZTP5RgvXDTRAmsqOnK8I+f4QN33YFAnmdJL8ykb+
	 X8sROyY544rjCZ5yvcOvQdlCNze3jQuNlxypIAGUuOIi+k4iULFsbHZFUgYhmh4Qn/
	 sPYjix2VxY4Vg==
Received: from [192.168.50.250] (unknown [171.76.80.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 50E1317E1048;
	Thu, 26 Sep 2024 10:47:34 +0200 (CEST)
Message-ID: <9470f582-7873-42c6-b5a5-35f841e4f693@collabora.com>
Date: Thu, 26 Sep 2024 14:17:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/gpu: ci: update flake tests requirements
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, rodrigo.vivi@intel.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240926070653.1773597-1-vignesh.raman@collabora.com>
 <20240926-athletic-gregarious-markhor-cc78ac@houat>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20240926-athletic-gregarious-markhor-cc78ac@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maxime,

On 26/09/24 12:56, Maxime Ripard wrote:
> On Thu, Sep 26, 2024 at 12:36:49PM GMT, Vignesh Raman wrote:
>> Update the documentation to require linking to a relevant GitLab
>> issue for each new flake entry instead of an email report. Added
>> specific GitLab issue URLs for i915, xe and other drivers.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>> - Add gitlab issue link for msm driver.
>>
>> ---
>>   Documentation/gpu/automated_testing.rst | 16 +++++++++++-----
>>   1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
>> index 2d5a28866afe..f918fe56f2b0 100644
>> --- a/Documentation/gpu/automated_testing.rst
>> +++ b/Documentation/gpu/automated_testing.rst
>> @@ -67,20 +67,26 @@ Lists the tests that for a given driver on a specific hardware revision are
>>   known to behave unreliably. These tests won't cause a job to fail regardless of
>>   the result. They will still be run.
>>   
>> -Each new flake entry must be associated with a link to the email reporting the
>> -bug to the author of the affected driver, the board name or Device Tree name of
>> -the board, the first kernel version affected, the IGT version used for tests,
>> -and an approximation of the failure rate.
>> +Each new flake entry must include a link to the relevant GitLab issue, the board
>> +name or Device Tree name, the first kernel version affected, the IGT version used
>> +for tests and an approximation of the failure rate.
>>   
>>   They should be provided under the following format::
>>   
>> -  # Bug Report: $LORE_OR_PATCHWORK_URL
>> +  # Bug Report: $GITLAB_ISSUE
>>     # Board Name: broken-board.dtb
>>     # Linux Version: 6.6-rc1
>>     # IGT Version: 1.28-gd2af13d9f
>>     # Failure Rate: 100
>>     flaky-test
>>   
>> +The GitLab issue must include the logs and the pipeline link. Use the appropriate
>> +link below to create an issue.
>> +https://gitlab.freedesktop.org/drm/i915/kernel/-/issues for i915 driver
>> +https://gitlab.freedesktop.org/drm/xe/kernel/-/issues for xe driver
>> +https://gitlab.freedesktop.org/drm/msm/-/issues for msm driver
>> +https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers
>> +
> 
> I can't comment for the others, but drm-misc at least still requires
> reporting issues by mail, so, no, sorry, we can't switch to gitlab only
> for now.

In https://gitlab.freedesktop.org/drm/ we have xe, i915, msm, nouveau, 
and amd (only for issues). In drm-ci we test i915, msm and amd.
So I will add GitLab links for these and for other drivers use email 
reporting. I will reword this section. Thanks.

Regards,
Vignesh

