Return-Path: <linux-arm-msm+bounces-20097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E64CF8CA85C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 09:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2D1E283020
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 07:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12894433DD;
	Tue, 21 May 2024 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qm0vO6hS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D867F;
	Tue, 21 May 2024 07:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716275141; cv=none; b=mf9h68Eo12RIEKSmXZAh4Ec9L6Ehjz6YulVHMoJOmJHFrG/f8Pf7W1wIKB2pIyY4dEjFimL8abmuXHQiBJT6T2BsTzAkSchLj/77l6KH2vVpdQdzfdY3RquzU4m8cY6cbHvOP3LhM2eAiwyTczisnyR5U8Fw1OI5qNujotfmfT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716275141; c=relaxed/simple;
	bh=nS/Dr2W3vGanwW9ifFd+bOFrHEwvBrs3b1sW5lLV82U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXasFjNFRARvwbyr1U+0tEk6mJ6tkL04vEKb1cVP4Me/amhRdRbZZHbo67JEGuYTkG+QVMnaOFsguWme47ZHU82+J5tn/3RaN7acmC3ctDgv5icfB2NGLXLUeeEpTbW7GjyNLXiYbg85qIq1ZTdi9BfDdG8CwqRpjydd3fq6GXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qm0vO6hS; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716275137;
	bh=nS/Dr2W3vGanwW9ifFd+bOFrHEwvBrs3b1sW5lLV82U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qm0vO6hSCRlLszYJes6vtZsP0qVLDOWOlMVSXIEkovjNeL4Dq+Cc+8MXdXP7o9Ngt
	 dEgAlzV+KObOGcAdS/6I44aVkdi+dzENzBC+C8438w5ZDIY3qhWEdam1o+AodVwzjv
	 LXMakGJRGQchKxC8P/1xweTSAiUSv5m/wIebY9OQ7ZoehiIA9kMjvWzZlPc043uEtL
	 I9WPKXT+MUL2ESyAvmJo630D/7kottF1JQB7ihruCKvj6sjbQnA/ZmNcTgV2aj4M44
	 yBEOL1WXeyBsLFdR4/W1aZOQopqDRLXK/J8L1Xq3XC3FW2nsXiT1XtAj/HU/gghFaX
	 X7t22RCH7dZsQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E0B0A378202E;
	Tue, 21 May 2024 07:05:33 +0000 (UTC)
Message-ID: <9ab7eb04-d4c6-4a79-87cb-2d21e4bfa9c4@collabora.com>
Date: Tue, 21 May 2024 12:35:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/ci: generate testlist from build
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-3-vignesh.raman@collabora.com>
 <c7e0a8b1-5be6-460b-b489-2ab5a8248d32@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <c7e0a8b1-5be6-460b-b489-2ab5a8248d32@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Helen,

On 21/05/24 01:54, Helen Koike wrote:
> 
> 
> On 17/05/2024 06:24, Vignesh Raman wrote:
>> Stop vendoring the testlist into the kernel. Instead, use the
>> testlist from the IGT build to ensure we do not miss renamed
>> or newly added tests.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Fix testlist generation for arm and arm64 builds.
>>
>> ---
>>   drivers/gpu/drm/ci/build-igt.sh  |   34 +
>>   drivers/gpu/drm/ci/igt_runner.sh |    9 +-
>>   drivers/gpu/drm/ci/testlist.txt  | 2761 ------------------------------
>>   3 files changed, 39 insertions(+), 2765 deletions(-)
>>   delete mode 100644 drivers/gpu/drm/ci/testlist.txt
>>
>> diff --git a/drivers/gpu/drm/ci/build-igt.sh 
>> b/drivers/gpu/drm/ci/build-igt.sh
>> index 7859554756c4..e62244728613 100644
>> --- a/drivers/gpu/drm/ci/build-igt.sh
>> +++ b/drivers/gpu/drm/ci/build-igt.sh
>> @@ -3,6 +3,30 @@
>>   set -ex
>> +function generate_testlist {
>> +    set +x
>> +    while read -r line; do
>> +        if [ "$line" = "TESTLIST" ] || [ "$line" = "END TESTLIST" ]; 
>> then
>> +            continue
>> +        fi
>> +
>> +        tests=$(echo "$line" | tr ' ' '\n')
>> +
>> +        for test in $tests; do
>> +            output=$(/igt/libexec/igt-gpu-tools/"$test" 
>> --list-subtests || true)
>> +
>> +            if [ -z "$output" ]; then
>> +                echo "$test"
>> +            else
>> +                echo "$output" | while read -r subtest; do
>> +                    echo "$test@$subtest"
>> +                done
>> +            fi
>> +        done
>> +    done < /igt/libexec/igt-gpu-tools/test-list.txt > 
>> /igt/libexec/igt-gpu-tools/testlist.txt
> 
> Just a nit, could you rename the file to ci-testlist.txt ? Since 
> test-list.txt and testlist.txt can be easily confused.

Sure, will rename it. I missed to add the generating testlist print also.

Regards,
Vignesh

> 
> Regards,
> Helen
> 

