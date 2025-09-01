Return-Path: <linux-arm-msm+bounces-71366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0A0B3DB6C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DA3C1893E52
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 07:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1572EDD44;
	Mon,  1 Sep 2025 07:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lgrAG/j6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CCE2853E2
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756712977; cv=none; b=ZU8tKSwr5jIp4P4TQEYhRQAREiZN1zFT6kk2/lfUpCUx7qw8xmt1/sLNv6ZXNqM+Q2c1T0gZWh7Gi0d3LoxiRGa/bSbfpinDsj4DV7Hui53y/1oBn5p2K1lbF1/8v7xZqugYjNw9frBB+fXXhcOBcV7z7VDV4aNUytbad+CDONw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756712977; c=relaxed/simple;
	bh=wt7jMIX425N5nVqlgcRtissbwXHoecRg/KMwSPDH1RA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=o7wP4ugPmJgLhbloEYgnWU8EyoUJlNlqQxd/jWDNVie1QcxtYqcdGiFCMpp8Z/1cy7GX6IhROhUqFwQdSzZW6DxQccXqi7hSLEWKBmyXMdXSn6MvvkZUQ0h45mvxScvJsopiAW51cVabNLhQ61SARfxRPctn1Id2zkLLVUKMVd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lgrAG/j6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b7e69570bso17967585e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 00:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756712974; x=1757317774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFAUVdnouAwZ3cp4lqEcKiYkIXhIbzxnN6Z1FUOocpw=;
        b=lgrAG/j6TpLDKGEGTyiIIERkHrIyWa9EKJk5Omxrs5RKPc+rx2ZviH3+PvIESrWMMS
         O6xM/UJ8OKML+aC9wmY8UIggicHGb23EdRK0kpIaoVf3TvFplChcH1GVqeZXOSDJNugQ
         GX/15v0aO8naF82R8QUySKl+FxlqMl6ce2y9R0RTv1k4vHuJoByr1BnYzMKph+01QoVh
         EfuiXlJ+7L7lvJTKgiQAs8d9TlHuptoRdD7tCPuC/FNTanfQq/z64H+DYDaByXQuJ2Wg
         2PEOfsTjiLFCSDlROqsMk0TJCiAaxiM4LSMxyj0/mAa03WW6LwlAIfpk7iZm2c9fDmnf
         cjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756712974; x=1757317774;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qFAUVdnouAwZ3cp4lqEcKiYkIXhIbzxnN6Z1FUOocpw=;
        b=f+jwXYE+1SeE8YtOokEorba1HZkfB4rbRcoN2ulGkseHIyCEwdOJlb/TGQknrBprj4
         Hutty2/47NQ2utGoSZYAO2+HbUndtiSrErzzP2N4bTU1JzyGMaJ8ZwgGGBIG8lIIdivn
         KgnnLc+2RCYKGcS9vDRUNV/j63scD/Ntc6wAJaVPAK4aI7TKxXyfSUXA5+1huK3sWH3P
         bYnnfVXh/FkbgLjY0vnCTHaUmmPbMolc8p68xp6XOFyKTlRHMuJqYoS9whtXD82E+c3r
         yRCcD4ERqAMVl5vDSx2xih05o6cKuCFyUWUWiXeyWByd4UUBN+OFXfUz37tCeH+up4O2
         hWew==
X-Forwarded-Encrypted: i=1; AJvYcCXXCv8aNw419WIt/rtPsPxtlwTafFwSeyCwAXazJrQStUPIKVNniuqvrzGniNM4IfxEg4OeQB9S33ciYE5m@vger.kernel.org
X-Gm-Message-State: AOJu0Yz36ibvz+LFb1PRwN/h3cMBBKAIYkeremEhbtUih9imIxyghcQ3
	aRH+oPbSAfhbftjXEm34QsC3LJOPCXHhWMPF777r/OKSFPhDY4pniwv0j/rjH+ZINHU=
X-Gm-Gg: ASbGncsO6VJ6TzkYd7IVkdQhhnVcbEB12CzQCTmLAXBmS3flBbI19DUEq7baII02dxv
	x+wI71di40dIZhxsAlTsCzr0x+hP3/IEbH/sdDxut2OMVKWe08AY9wQvITylyEMyc9M9nwTWccE
	c1X/Bzet+zubM8xjH+AkCKUid0vKVaBkdVPF1PLFGic36JhCn8WXcVC5wrc30tYUoseLqx39Eoh
	rTY7GbSTQWFdwXFvPmVXGemBZ69kl7my9Nl31RVug3RH4qliV0c+rTpWzkmSTAfmkTBKmWP+Ts6
	Lf/GAu7I7CiXAzuwHrR8q7hIRgrgFLEA5Ro5IEYMouiSQDgCmx46H0SBvHAb5dLiPItQGhTbIT9
	e45CtcxJYUEpwLwbVw+UgsYy/M6q1HVEsVedsAkmpMfIaW0Z63bhwiOr3lgPvDMvpZ17fBFy5Ws
	EhXD8sbac=
X-Google-Smtp-Source: AGHT+IEvo5gEev1pOaIge4iAPVDCYZYnhg74I6cnBK5MKrWVgUvYE2R3wq25uTqs186q9y1es2PNOQ==
X-Received: by 2002:a05:600c:4fcd:b0:45b:7185:9e5 with SMTP id 5b1f17b1804b1-45b85525cddmr59925615e9.5.1756712974015;
        Mon, 01 Sep 2025 00:49:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:881c:7d0e:ad0a:d9a? ([2a01:e0a:3d9:2080:881c:7d0e:ad0a:d9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm225181805e9.5.2025.09.01.00.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 00:49:33 -0700 (PDT)
Message-ID: <b897d082-0d74-46fc-a0e4-7745347ba597@linaro.org>
Date: Mon, 1 Sep 2025 09:49:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3] usb: typec: ucsi: Add support for READ_POWER_LEVEL
 command
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, pse.type-c.linux@intel.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20250814163028.18058-1-venkat.jayaraman@intel.com>
 <91cb0acb-73c4-4d3a-9aa8-1056f367d82e@linaro.org>
 <aKbI4DnIDD9fD_Gz@kuha.fi.intel.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <aKbI4DnIDD9fD_Gz@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/08/2025 09:21, Heikki Krogerus wrote:
> On Tue, Aug 19, 2025 at 11:47:58AM +0200, Neil Armstrong wrote:
>> Hi,
>>
>> On 14/08/2025 18:30, Venkat Jayaraman wrote:
>>> Add support for UCSI READ_POWER_LEVEL command as per
>>> UCSI specification v2.1 and above to debugfs.
>>>
>>> Following power related fields will be exposed as files in debugfs:-
>>> peak_current (Peak current),
>>> avg_current (Average current) and
>>> vbus_voltage (VBUS voltage)
>>>
>>> These files will be updated either when a READ_POWER_LEVEL
>>> command is sent from OS or when a device is connected.
>>>
>>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>> Signed-off-by: Venkat Jayaraman <venkat.jayaraman@intel.com>
>>> ---
>>> Changelog v3:
>>> - Rebased to kernel 6.17-rc1
>>>
>>> Changelog v2:
>>> - Removed extra space in declaration
>>> - Made the call to debugfs_create_file single line for clarity
>>>
>>>    drivers/usb/typec/ucsi/debugfs.c | 31 +++++++++++++++++++++++++++++++
>>>    drivers/usb/typec/ucsi/ucsi.c    | 16 ++++++++++++++++
>>>    drivers/usb/typec/ucsi/ucsi.h    | 13 +++++++++++++
>>>    3 files changed, 60 insertions(+)
>>>
>>
>> This commit causes the following warning:
>> [    8.646179] ------------[ cut here ]------------
>> [    8.650986] Access to unsupported field at offset 0x59 (need version 0210)
>> [    8.651044] WARNING: drivers/usb/typec/ucsi/ucsi.c:1296 at ucsi_handle_connector_change+0x380/0x414 [typec_ucsi], CPU#0: kworker/0:0/9
>> <snip>
>> [    8.832491] Hardware name: Qualcomm Technologies, Inc. SM8550 HDK (DT)
>> [    8.839228] Workqueue: events ucsi_handle_connector_change [typec_ucsi]
>> [    8.846084] pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
>> [    8.853277] pc : ucsi_handle_connector_change+0x380/0x414 [typec_ucsi]
>> [    8.860031] lr : ucsi_handle_connector_change+0x380/0x414 [typec_ucsi]
>> <snip>
>> [    8.944023] Call trace:
>> [    8.946570]  ucsi_handle_connector_change+0x380/0x414 [typec_ucsi] (P)
>> [    8.953328]  process_one_work+0x148/0x28c
>> [    8.957502]  worker_thread+0x2c8/0x3d0
>> [    8.961401]  kthread+0x12c/0x204
>> [    8.964759]  ret_from_fork+0x10/0x20
>> [    8.968474] ---[ end trace 0000000000000000 ]---
>>
>> on:
>> 8550-hdk:
>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253312#L1418
>> 8550-qrd:
>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253306#L1560
>> 8650-hdk:
>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253308#L1494
>> 8650-qrd:
>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253309#L1594
>> x1-crd:
>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253311#L2226
>> x1-qcp:
>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253310#L2160
>>
>> I guess the version should be checked.
> 
> Venkat, can you be prepare the fix for this?
> 
> thanks,
> 

Gentle ping, can this be fixed ? Should I send a revert patch ?

Neil


