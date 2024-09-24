Return-Path: <linux-arm-msm+bounces-32234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F6B983FDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD4011F23254
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 08:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5119E14B976;
	Tue, 24 Sep 2024 08:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CvuFzrI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6914513B586;
	Tue, 24 Sep 2024 08:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727165109; cv=none; b=td5Ff9RIbZbhi39sPodROxnGmEoeW2Z8gcwrlcCpX3TliARxqqhB3fHEV7VXzt3EM0wPQF0D6Q6m2MQTzxOC8nJcwFAyDvdD3s3pLrLSslWbgQqG62uw+gytix9tyPhrwP4zZXzwEfbfUfm7gE5SDZT1TGp6FQoJrF5/UrL3rmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727165109; c=relaxed/simple;
	bh=bkob+FdVbT5JvRwKp/3RFu5HC+yR0/AGxmQWAMBAfxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EleAETJiprAmLAVMTzAZ4c5/8dSHWYe9wKAr6/ElBo/iDtPFYxrn23QghNdRrPsmIr4VHe6EmZA4FNltRTM9lZU2K9UGm2Z51XHjkALNfhg17b24p+kagVBY9wRsqFg4sWavdVmx6e1pqTdXQvWFe8LaAjNsfIW4OoAkDs5JRn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CvuFzrI0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727165105;
	bh=bkob+FdVbT5JvRwKp/3RFu5HC+yR0/AGxmQWAMBAfxw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CvuFzrI0AhizshttZzgCNh2wASf80PcmQTwldXXkfRp3FLPhvWPKcfrWEvbKo1Xfl
	 pYUdAvUXHnxCiRj+ansAs1Y/4qEBT2Zw5XVVCJNP0uIbVQ8vrmon7R8FFrcoXCUH6s
	 9pJCTeDwuMeOV60sdTU3fT/wzcFnRngPhHowoQrpxGM+RtY4qCuVp/9cxh0gpJy1qA
	 vosjvZo289g0RSv045JmPKfysGhGUkc9uWvpxbNbbTk4ORi2A8gXcPDYXBJXyeGyMz
	 H+BP1y/ML/KeP7+lTIDUgycgFbxCGaC693LhuQAEtPJhFvvXYKON7YacpsDKrw3Ovw
	 10HNVyTURjyPg==
Received: from [192.168.50.250] (unknown [171.76.80.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D1CC17E1045;
	Tue, 24 Sep 2024 10:05:02 +0200 (CEST)
Message-ID: <58a9334d-26eb-4106-806a-59e5e728aed5@collabora.com>
Date: Tue, 24 Sep 2024 13:35:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs/gpu: ci: update flake tests requirements
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 mripard@kernel.org, rodrigo.vivi@intel.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240924022600.1441969-1-vignesh.raman@collabora.com>
 <CAA8EJprUUUc0iDph-HPrW1anrdnzYju7+JERQdHbwxvznq=H4w@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAA8EJprUUUc0iDph-HPrW1anrdnzYju7+JERQdHbwxvznq=H4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 24/09/24 11:46, Dmitry Baryshkov wrote:
> On Tue, 24 Sept 2024 at 04:26, Vignesh Raman
> <vignesh.raman@collabora.com> wrote:
>>
>> Update the documentation to require linking to a relevant GitLab
>> issue for each new flake entry instead of an email report. Added
>> specific GitLab issue URLs for i915, xe and other drivers.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>   Documentation/gpu/automated_testing.rst | 15 ++++++++++-----
>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
>> index 2d5a28866afe..f73b8939dc3a 100644
>> --- a/Documentation/gpu/automated_testing.rst
>> +++ b/Documentation/gpu/automated_testing.rst
>> @@ -67,20 +67,25 @@ Lists the tests that for a given driver on a specific hardware revision are
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
>> +https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/ for i915 drivers
>> +https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/ for xe drivers
> 
> drm/msm for msm driver, please. Otherwise we can easily miss such issues.

Sure, will add it in v2. Thanks.

> 
>> +https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers
>> +
>>   drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
>>   -----------------------------------------------------------
>>
>> --
>> 2.43.0
>>
> 
> 

Regards,
Vignesh

