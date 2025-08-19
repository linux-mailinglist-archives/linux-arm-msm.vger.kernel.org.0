Return-Path: <linux-arm-msm+bounces-69704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BB7B2BDE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11637686007
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20AF31A046;
	Tue, 19 Aug 2025 09:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mzf+KhSB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD82238C0F
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596883; cv=none; b=jWxaVadzMfnqWpqvlSV1QxjU6vmvetAl8fVCu/Miyj+lrrO6lVPe7XfDHuOijEqSaCXvrGwvballZvHAPqTp9taN4HyEznGd7jvZFOd0hICkFeR+bA7G5qaUccseYUoSjHokt9Y+gq/vOI2EHI8iOtzKP+fEbCJeMCcTDyuVRiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596883; c=relaxed/simple;
	bh=uZvw0QlVxkN0efin+XFZpqCnIHi42Poi4/cExNi1u3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pWpObBUdH0udBfp14soNCoolOTNpyLBAZoIqub7MOo/TZOSCed2YeHrtcsb8Vfs1eYfA6lY499M9SYtAjmhApjl4PNBZbu/as+oy4+BdhfMwMVUBvb+sOk8nYsoAPtyZhY2XAez619vTZrEnGGg1IMnd1ERbXQQj/kTdIXecFZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mzf+KhSB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b9e41101d4so2675436f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596880; x=1756201680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :reply-to:content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv13I0/TXUmz+bhbfk6XvmSO5m56jpoJAdOTbAp2Skg=;
        b=mzf+KhSBvZ19eR3wYEYEYTx3zUK5ocfscrqIZfyu3JvAs2/gyyYiOksPGRXiyLmafQ
         OUGLDOTc0RX3WLwoDZCX/b4fp45zflyFaUbocYAeiQNaDq3h/YdDxXArVnEvMYLrUNHU
         SGSJnZxWsKZkBGGgWUxYHAIj3vf/Edse8RbpNSMTPw5nLYtHNCgu6s/pHMF4ZC3DAfaX
         Y1EOoR9HZE52FDBTJjIT0pNGd0BfUVn6Qda38X1XRohTi549aX0U04JeUwLDyEGCpdpk
         gM8hcL1EwHEn3bkVfXD/trkHRDxpgIKfp5zsjXxe3LFS1Y/WZjj09RKPo05NFxBcPCNI
         ZJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596880; x=1756201680;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :reply-to:content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jv13I0/TXUmz+bhbfk6XvmSO5m56jpoJAdOTbAp2Skg=;
        b=Dw+M/NBwojmSWc9b3QAFMeUaXb0qFl71qad9yxwBh0JRfgLGSVq0B2wGlc5dVsEZLz
         igLUA/45K4TA5J6MjNJF1Wb25hSqPt7KIVKNMbb8YnvV2L93SVKabunwwTJvBQ8mpW5T
         CBEhE5K9uLKE0uDCZdSn/MlHl/7v55SgKOI6Mx05yKnHORQglu02prs46KriJv8vE+HB
         rml2lMpI7mWBK2+5ELNUjkqNFV0TVKFT0CrKMEYAlvnKLlSkOWnhlBAeBK62kRNp5Lu2
         LDFmu4ejxek7jw6ENRasOORr8f+0GJ8mOKQeEP2/9bqnSTc5DAns5khKCTLVAP4wWdjt
         mL7w==
X-Forwarded-Encrypted: i=1; AJvYcCUMUbJcofbRLZoTKGv3NZBYLxalmupCHMtXDyrnVuqsNnqpAm9dVr9rZDSTR2LmCkLJJq2ee1/5ligWlKlD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxn0rtRzGl7HzIk+bRfjUrAU9eNIJ/LlyetU2ejt8y4oHL4ReK
	8+/CqcoyIYLNitxBMwwnQUHI6JvDgzohhkoIYy+ovhNEFfpaY+0tAu06QqPCmA9Vo9s5eP7acOm
	qmZh2RkY=
X-Gm-Gg: ASbGncvG1wCyGJ1KQjE6+nwY8wNVBCY9yeSGuUTU4qFedAmEw/6OJVnLTktJKJW8kcm
	Bo7e0bXcOZVkPKx0zgc8Ef/kdacZYBeMaEqlTwjSdOENIXznbY7Nl6hhGkIPNdL93iejhsuD5aY
	RnYceIOajM0Dynbv92g+CMs2eoWpXkl2l/Qsj6GTWcb4Ehy4CfTaXDhvnLiVmxAC1EXCLKZ3oHP
	h+B8gyaeav8OOMCghFot392cQHkF7+Fn6CrCkRNFAVkufp6b+tzZbdv7teG3ANsvwodwja0CHdO
	yQ+cMa/Q0f4kciQ94FahUMrAp9r5/P08xjBRuJvKh0gOSc7qYIf2PNi4flzCGU3hFbDpcV5H76L
	Ga+X8Op5khFWzrzCCZuw7uF5t1FdAjoGTWSra+l2OUPUO6zL8CNsyGL/k5ERvT0ggQLKtrI3s
X-Google-Smtp-Source: AGHT+IHOxn+x6X9d76/zE+6NfMmOpr/k+JuYhSKm6pN0fgDwmmrAI973XoBrmCuTM1ZZXSiLVplWkQ==
X-Received: by 2002:a05:6000:40db:b0:3b5:e714:9c1e with SMTP id ffacd0b85a97d-3c0ea1e299cmr1507911f8f.12.1755596880006;
        Tue, 19 Aug 2025 02:48:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:e7a:79e6:53ed:ce35? ([2a01:e0a:3d9:2080:e7a:79e6:53ed:ce35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c748a9esm206392985e9.19.2025.08.19.02.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 02:47:59 -0700 (PDT)
Message-ID: <91cb0acb-73c4-4d3a-9aa8-1056f367d82e@linaro.org>
Date: Tue, 19 Aug 2025 11:47:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: typec: ucsi: Add support for READ_POWER_LEVEL
 command
To: Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
 pse.type-c.linux@intel.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20250814163028.18058-1-venkat.jayaraman@intel.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250814163028.18058-1-venkat.jayaraman@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/08/2025 18:30, Venkat Jayaraman wrote:
> Add support for UCSI READ_POWER_LEVEL command as per
> UCSI specification v2.1 and above to debugfs.
> 
> Following power related fields will be exposed as files in debugfs:-
> peak_current (Peak current),
> avg_current (Average current) and
> vbus_voltage (VBUS voltage)
> 
> These files will be updated either when a READ_POWER_LEVEL
> command is sent from OS or when a device is connected.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Venkat Jayaraman <venkat.jayaraman@intel.com>
> ---
> Changelog v3:
> - Rebased to kernel 6.17-rc1
> 
> Changelog v2:
> - Removed extra space in declaration
> - Made the call to debugfs_create_file single line for clarity
> 
>   drivers/usb/typec/ucsi/debugfs.c | 31 +++++++++++++++++++++++++++++++
>   drivers/usb/typec/ucsi/ucsi.c    | 16 ++++++++++++++++
>   drivers/usb/typec/ucsi/ucsi.h    | 13 +++++++++++++
>   3 files changed, 60 insertions(+)
> 

This commit causes the following warning:
[    8.646179] ------------[ cut here ]------------
[    8.650986] Access to unsupported field at offset 0x59 (need version 0210)
[    8.651044] WARNING: drivers/usb/typec/ucsi/ucsi.c:1296 at ucsi_handle_connector_change+0x380/0x414 [typec_ucsi], CPU#0: kworker/0:0/9
<snip>
[    8.832491] Hardware name: Qualcomm Technologies, Inc. SM8550 HDK (DT)
[    8.839228] Workqueue: events ucsi_handle_connector_change [typec_ucsi]
[    8.846084] pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
[    8.853277] pc : ucsi_handle_connector_change+0x380/0x414 [typec_ucsi]
[    8.860031] lr : ucsi_handle_connector_change+0x380/0x414 [typec_ucsi]
<snip>
[    8.944023] Call trace:
[    8.946570]  ucsi_handle_connector_change+0x380/0x414 [typec_ucsi] (P)
[    8.953328]  process_one_work+0x148/0x28c
[    8.957502]  worker_thread+0x2c8/0x3d0
[    8.961401]  kthread+0x12c/0x204
[    8.964759]  ret_from_fork+0x10/0x20
[    8.968474] ---[ end trace 0000000000000000 ]---

on:
8550-hdk:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253312#L1418
8550-qrd:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253306#L1560
8650-hdk:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253308#L1494
8650-qrd:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253309#L1594
x1-crd:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253311#L2226
x1-qcp:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253310#L2160

I guess the version should be checked.

Neil

