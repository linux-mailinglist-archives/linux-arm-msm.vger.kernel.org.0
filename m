Return-Path: <linux-arm-msm+bounces-74066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEA3B84213
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 12:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 369C15803DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 10:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CFE2F616A;
	Thu, 18 Sep 2025 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vYbhmY7j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8EC2F6598
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758191635; cv=none; b=cfcIxpn3iy3mzXFKizkzqpS4i69yvH0kaoSXsc7YXeIyfm9X7I3IzCTSCiIeoRYMruMTZowidOuqMDzRuHQFW5aU1/3cor4cC5EB7qAoxDtuiJ8lFXJPO4RFHBkAtYdL8QndQ3wDxLPAjkon2dBZama0jlDh46LzxjwmLmbFVCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758191635; c=relaxed/simple;
	bh=ajqpC0k6vh4Nc161dnIzsEVVzeo/VL7NZREPJ6MVoTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X5E86WzJgoSnzYKHhE1XSL3BV7vtjZMSLYb0yXuaQtuypqYOOzj+hCpreXq8dXIHOPnieExuxsUq3OfwEpPXWjBP0ulGi8DmkUsxrjHU4N0KSyMZLnYVCAUXhl4sBnzpqzc9MXM2BIuhbnfcWojjPPSGOTH501T4paoIYtGmWmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vYbhmY7j; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45f2c4c3853so2821165e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758191632; x=1758796432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8eYG+lwsBg89zkDARtkqh0ytv6M3TN13nMByHYDuJzU=;
        b=vYbhmY7j8CzoPKX8t2IJJQCtbMhVGhagQpniCIYjy1M7d3skwf9eULLbsB90AL6TU0
         zQR/j8XvGF40cjgVLHvmK3tGFNdnGhvnPfTX46FUP47SFmpLFT9VRGVNkSUdxF3bFub7
         /nIYqCRVoLU49/oaSeR4etTRytkj6TJbOdzQjqv2hu9TxnizUxArqKnjmkCupAqHjIXk
         fxFZxV22W6iRALV+gisAJSK+vxl6DeAib2q+oMa2lLDplGV3rmpLIYtdRN++J4cMJYFP
         l0q/5HD483ml0JO8u1LDuu4MJnNUGugqSt3aNJtX3EY2b11gWMn9FGnuvw3MAA9WyUhb
         irog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191632; x=1758796432;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8eYG+lwsBg89zkDARtkqh0ytv6M3TN13nMByHYDuJzU=;
        b=bFsx1bwun8gzSR6uv7KiL6yX/oDkosXFvRZiViO/ce3oBHOAPL7OoXGqqTJUyz4tT5
         iBfAKyKI7ltD+4gbPlwJsqsf4XvFXgWrkQnSWHh1Xf0Tl6KrzIB4tDXvn0fPfFe3M744
         EQvaY4iTRmpVVNkX8eYbIXiirFlPCeGnRHb1W8r952niGTXs5xx5lTvCxMJ/mufXXobV
         fNMw+aYZ8oUQTHJZEsWJuttNnc2CA+0xRhIKu9W+4U5eIlrDEJM24YymN4TC6zJnQRTY
         nhDJcttYqHxfIzeSdRHXnrZKm+pBbcwmda/D0dzzNWv8sPN9t/p7Bm+4x7rEmZk6GNPx
         GW7w==
X-Forwarded-Encrypted: i=1; AJvYcCWtr4x3apItt9WtVNFVKP4YdkXG577APYicBjF5iMn3bVT4PrdLNx/rOIE38NULkh5XDwxuZXgAZni3kYoy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1rmAyKYyQ1eSNqb+ZnEgjSFkMO9l0ecSNLZM9gWdBTQusFyG8
	xW8LX2USZWFvj7UlXpZnu8Sg9yQcmKPYnYQ9+LdCC1aRoVPJ5nIL0+l4Kb2fNaZ64+Web61o5E4
	jiyU5SyA=
X-Gm-Gg: ASbGnct8obC55pw4tH0uw6o7mNAkiXdbi8XmGPC82MytrOO/R3hAABEaw18pZ2p1cpl
	7L15xAndxLQoCYNUY7RY5leTbxqZleopx88a0C1TzTGCP5pgVXS3kd0Y+m3S5D4ukfAeWnmmaEm
	AgQvd9c1qwWXaWutqepsAeXvUbU8sewSkjkZ6AVWO/WBq2ILlOqlcErGi5cYAbexh/iyz5d+Q1W
	hDWXtUtKlY5IlD45i3zR4Rqd1gg6hhpZ1tktxTPH7wa0TvcN20sRRz0lfci0D9rTWrnG5v9nnq1
	jM53Df/woosqX5CTwsFm2AKJ2L73i7PuzZU3KPvPDYMxxZecpDub45ww4i5hB7L9+BZfZwyGlht
	Kgzh5/m4C3FeqD4FhF+XXfVXNC8K5qbh41ltflQlBHrjAXTp1BZdntB8tTS7/WU+RqfaR8SnA9o
	KDH2Y0bg+lReRCLOMmzJzQQ4tZT95Kq3tj0pT3Tg==
X-Google-Smtp-Source: AGHT+IGtskj6EsALihGomkAsZJx+Vh8xJiOZhFyiAAK0fMVOrqoM0VQqMr08kuiyPwXSQoTPkf5j1w==
X-Received: by 2002:adf:ee49:0:b0:3ed:82c:29ae with SMTP id ffacd0b85a97d-3ed082c2d49mr3311185f8f.44.1758191632027;
        Thu, 18 Sep 2025 03:33:52 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee106fd0edsm2803577f8f.53.2025.09.18.03.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 03:33:51 -0700 (PDT)
Message-ID: <a59ccd01-1482-4091-957f-740840ff5112@linaro.org>
Date: Thu, 18 Sep 2025 11:33:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: pm_helpers: add fallback for the
 opp-table
To: Renjiang Han <quic_renjiang@quicinc.com>, quic_qiweil@quicinc.com,
 quic_wangaow@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250724-fallback_of_opp_table-v2-1-2fc61f2407dc@quicinc.com>
 <6dc33f02-6691-4ad8-b04f-423e4e5caea8@linaro.org>
 <b19ff26f-7dc7-4022-aec7-49922ab521cf@quicinc.com>
 <b4e25dd2-caf3-48f0-8e1b-622f3db1b7ca@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <b4e25dd2-caf3-48f0-8e1b-622f3db1b7ca@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/09/2025 11:21, Renjiang Han wrote:
> 
> On 9/4/2025 11:33 AM, Renjiang Han wrote:
>>
>> On 7/28/2025 11:20 PM, Bryan O'Donoghue wrote:
>>> On 24/07/2025 08:53, Renjiang Han wrote:
>>>> Since the device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX
>>>> do not include an opp-table and have not configured opp-pmdomain, they
>>>> still need to use the frequencies defined in the driver's freq_tbl.
>>>>
>>>> Both core_power_v1 and core_power_v4 functions require core_clks_enable
>>>> function during POWER_ON. Therefore, in the core_clks_enable function,
>>>> if calling dev_pm_opp_find_freq_ceil to obtain the frequency fails,
>>>> it needs to fall back to the freq_tbl to retrieve the frequency.
>>>>
>>>> Fixes: b179234b5e59 ("media: venus: pm_helpers: use opp-table for 
>>>> the frequency")
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>>>> ---
>>>> Since device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX do not
>>>> contain an opp-table and have not configured opp-pmdomain, they still
>>>> need to use the frequencies defined in the driver's freq_tbl.
>>>>
>>>> Therefore, if calling dev_pm_opp_find_freq_ceil to obtain the frequency
>>>> fails in the core_clks_enable, it needs to fall back to the freq_tbl to
>>>> retrieve the frequency.
>>>>
>>>> Validated this series on QCS615 and msm8916.
>>>> ---
>>>> Changes in v2:
>>>> - 1. Update the returned error value as per the feedback.
>>>> - Link to v1: https://lore.kernel.org/r/20250723- 
>>>> fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com
>>>> ---
>>>>   drivers/media/platform/qcom/venus/pm_helpers.c | 11 ++++++++++-
>>>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/ 
>>>> drivers/media/platform/qcom/venus/pm_helpers.c
>>>> index 
>>>> 8dd5a9b0d060cddfeafd4da477ade0c7aeb6c390..77c12273dbb9505244e260fc8fa635e4fe045236 100644
>>>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>>>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>>>> @@ -40,6 +40,8 @@ static int core_clks_get(struct venus_core *core)
>>>>     static int core_clks_enable(struct venus_core *core)
>>>>   {
>>>> +    const struct freq_tbl *freq_tbl = core->res->freq_tbl;
>>>> +    unsigned int freq_tbl_size = core->res->freq_tbl_size;
>>>>       const struct venus_resources *res = core->res;
>>>>       struct device *dev = core->dev;
>>>>       unsigned long freq = 0;
>>>> @@ -48,7 +50,14 @@ static int core_clks_enable(struct venus_core *core)
>>>>       int ret;
>>>>         opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>>>> -    dev_pm_opp_put(opp);
>>>> +    if (IS_ERR(opp)) {
>>>> +        if (!freq_tbl)
>>>> +            return -ENODEV;
>>>> +        freq = freq_tbl[freq_tbl_size - 1].freq;
>>>> +    } else {
>>>> +        dev_pm_opp_put(opp);
>>>> +    }
>>>> +
>>>>         for (i = 0; i < res->clks_num; i++) {
>>>>           if (IS_V6(core)) {
>>>>
>>>> ---
>>>> base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
>>>> change-id: 20250721-fallback_of_opp_table-4ea39376f617
>>>>
>>>> Best regards,
>>>
>>> Note to self add a
>>>
>>> Closes: 
>>> CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com
>> Thanks for helping review this patch. But I'm sorry, may I ask how to
>> understand this comment?
>>
>> This patch has not been picked yet.Is there anything else I need to do?
> I’d appreciate any thoughts you might have on this.
>>>
>>>
>>> ---
>>> bod
>>

Marked as "Not applicable" on media-ci patchwork - you should have 
received an email about that.

* 7881cd6886a89 - media: venus: Fix OPP table error handling (6 weeks ago)
* b179234b5e590 - media: venus: pm_helpers: use opp-table for the 
frequency (3 months ago)
* 14423fc3a4a21 - media: venus: pm_helpers: add compatibility for 
dev_pm_genpd_set_hwmode on V4 (5 months ago)

git checkout -b linux-next/master-25-09-18 linux-next/master
Updating files: 100% (10211/10211), done.
branch 'linux-next/master-25-09-18' set up to track 'linux-next/master'.

b4 shazam b4e25dd2-caf3-48f0-8e1b-622f3db1b7ca@quicinc.com
Grabbing thread from 
lore.kernel.org/all/b4e25dd2-caf3-48f0-8e1b-622f3db1b7ca@quicinc.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 5 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v2] media: venus: pm_helpers: add fallback for the opp-table
     + Closes: 
CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com (✗ 
DKIM/linaro.org)
     + Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com> (✓ 
DKIM/quicinc.com)
   ---
   ✗ No key: ed25519/quic_renjiang@quicinc.com
   ✓ Signed: DKIM/quicinc.com
---
Total patches: 1
---
  Base: using specified base-commit d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
Applying: media: venus: pm_helpers: add fallback for the opp-table
Patch failed at 0001 media: venus: pm_helpers: add fallback for the 
opp-table
error: patch failed: drivers/media/platform/qcom/venus/pm_helpers.c:48
error: drivers/media/platform/qcom/venus/pm_helpers.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am 
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"

---
bod

