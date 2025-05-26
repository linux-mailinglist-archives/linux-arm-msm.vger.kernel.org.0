Return-Path: <linux-arm-msm+bounces-59397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 030DDAC3BAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 10:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B801F165007
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 08:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD03E1A23A6;
	Mon, 26 May 2025 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IDkwSIT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE02198E81
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748248058; cv=none; b=DiWh3p7DbUonhq2v/uz3KqyGGZZD8IhGJeilrdjmd87my98YOrpjWRbeebN/LSvg5CpCz+KgHgk52KdZHi+kjRtqTjf7X4b3Fp61xDfVASacqZ3zNJSdV69LaBQgFHnpbLMfoX95Yp5pga4K99Nt4/jvAmW+oCwebXQAAmP2GMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748248058; c=relaxed/simple;
	bh=RQFxDDJX4sTV7Tlbw+d572ayFyLoBX+0/QWAEvVzFYQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aA916yXvQ1zIDgQrYtVVtMRs8L2zkKrapNf7EgYq810VffOcRNDRp/0Ykp5KMzV4WotEyu2ylT36DAt6ZTQL9Pd0Bnh057qaBDxv/XSbdWPOlHXBj+rz4O461/vJFkVjRftWkH3vrPMCfIdY4jTRiV3khUrViG8nIZyKdj7EM8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IDkwSIT6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so27849665e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 01:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748248055; x=1748852855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//l+SpZWLdaex2pzGku8nTnokra2GDwP8t/4Vkwd2wU=;
        b=IDkwSIT6nLnZsCbmXPHm49A5Q9+1d5xw7MWq+QUIpyvRHNe8zFSCI3qeZnj9DOUpRF
         olEr77sIHGvXq6S6ZvDYj8smH+DQA+neEN+8rR5cSp/kHov5j/akcE01V7FUYa1lJxso
         qYS0mqU/pl+P8eOjSvA4jVsj3QZ7/SesBnalZGb+RvBQyUS2oy3ShltFC50BzUZQnwGT
         8kgycay8QxbBzS1Z6MI4cZZqw6ZXIvIhMoWAThIv0PV9bp6TMUP59+kJmgq8Rw3R8eK9
         /3zyH1ghLaXxqZNPCfE/rR6j+uYV8+WonRC9Wz78Xfet2rxK8T2aqxgR7+BgR2PowB9y
         8CzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748248055; x=1748852855;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=//l+SpZWLdaex2pzGku8nTnokra2GDwP8t/4Vkwd2wU=;
        b=mwhuLCCbMsYF2sONa8CPwYe9DhiapXkj2CVYN8+0Xh/2MfOJXPdFk1CW+CXoeAQ3iq
         yUU0wMTCRgUCTpg8gfIDOMz5QsmrscOMNZ7NTt9XOrEggmmF0WF/DIDUeT7UaiqJZGaf
         aUF60ngNEwY3KTpMLpLTBML0wgymm7FC+y6dJJMEnfgvUjEpyfMxz5f1uAh1V96z+nqO
         u+2ExYpd55LDRI6UJhJ285hMRhZT40tFFMIAeKtYAh8+Y3Bf/vyQuVlaxu4QT40PUKkl
         0fuJNhIzA5WWkgkD0nTmzTFrrU2ywT6Twj7QNpY2Fh6E28N9acKc3Du7xSqjpl2dngER
         ibSA==
X-Forwarded-Encrypted: i=1; AJvYcCX2Si/UO3ag5ol4r5tEOWObxjnKRpNgVAhBRhZ4DmTOZTXGT3aKcoaidvvbtIjxXF3v1qkadqiKF67guAHR@vger.kernel.org
X-Gm-Message-State: AOJu0YwjgZOt4AUeNIHjVB7KBGPz0kW2tAU99ZL/eo0xot8Zf49kZUWq
	QgAKO4fl5QTK0mJvUNCOhPBQLYMwFZuLClts8oy+CVggONWmhyCeDPZKhwie+DzmINY=
X-Gm-Gg: ASbGnctPsoYLvP3f6wamvd91AEj9FxCvhpajx9BiJ83SHHqtnyzoIvfuhAgSzxFykL+
	00kygK2qRpf7J390Ipq+zFW9QwRASAW3tEEn6y7A3DUyHfRkV+C8SnWvDEk2F2co7YCiL1hj5hF
	gD8eNyduE8aW8GutwDH2hR/WeBGWCgpe76nRkXAxk2jZq1sLA8z17HACBlxqt+HnXpmvYS7rcZl
	uwF/zKSIxUhGrz8pGDBJAd8SyQAdqZHMCYcoxZLRtLvW93P8sWYfOVRlwB0Lx9czOmjrguHeTw/
	nKD2wfUyrlGkgIanHSAU/vWmGM2Fr3BwGz+grXJlRUbU5VEfyWaXJIqKQa1qmiBwzKvVGD11drt
	lr2w0nRnYlIR6jOTCiIHwPdGf059m
X-Google-Smtp-Source: AGHT+IFzu9DWaslxdEFSgpjGR3l4yPYyJktjmTZ/FF1vEJqTSXIz10xyxcwYQuLFRxS0fhlqWlfWhA==
X-Received: by 2002:a05:600d:108:10b0:442:d9f2:c753 with SMTP id 5b1f17b1804b1-44d5bb93604mr27003115e9.26.1748248054978;
        Mon, 26 May 2025 01:27:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4? ([2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd99edsm226889525e9.36.2025.05.26.01.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 01:27:34 -0700 (PDT)
Message-ID: <70b6d885-ca52-4731-9a78-80dd25248e2f@linaro.org>
Date: Mon, 26 May 2025 10:27:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/5] power: supply: qcom-battmgr: Add charge control
 support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?=
 <me@kuruczgy.com>, Sebastian Reichel <sre@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
 David Collins <david.collins@oss.qualcomm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kernel@oss.qualcomm.com
References: <20250523-qcom_battmgr_update-v1-0-2bb6d4e0a56e@oss.qualcomm.com>
 <20250523-qcom_battmgr_update-v1-5-2bb6d4e0a56e@oss.qualcomm.com>
 <db0e40b6-22f3-46aa-b35d-7a8729370ddf@kuruczgy.com>
 <1b1c4617-0e5b-40c8-9a66-d243b48c0977@oss.qualcomm.com>
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
In-Reply-To: <1b1c4617-0e5b-40c8-9a66-d243b48c0977@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/05/2025 08:19, Fenglin Wu wrote:
> 
> On 5/24/2025 5:29 AM, György Kurucz wrote:
>> Hi!
>>
>>> +static int qcom_battmgr_set_charge_control(struct qcom_battmgr *battmgr,
>>> +                       u32 target_soc, u32 delta_soc)
>>> +{
>>> +    struct qcom_battmgr_charge_ctrl_request request = {
>>> +        .hdr.owner = cpu_to_le32(PMIC_GLINK_OWNER_BATTMGR),
>>> +        .hdr.type = cpu_to_le32(PMIC_GLINK_REQ_RESP),
>>> +        .hdr.opcode = cpu_to_le32(BATTMGR_CHG_CTRL_LIMIT_EN),
>>> +        .enable = cpu_to_le32(1),
>>> +        .target_soc = cpu_to_le32(target_soc),
>>> +        .delta_soc = cpu_to_le32(delta_soc),
>>> +    };
>>> +
>>> +    return qcom_battmgr_request(battmgr, &request, sizeof(request));
>>> +}
>>> +
>>> +static int qcom_battmgr_set_charge_start_threshold(struct qcom_battmgr *battmgr, int soc)
>>> +{
>>> +    u32 target_soc, delta_soc;
>>> +    int ret;
>>> +
>>> +    if (soc < CHARGE_CTRL_START_THR_MIN ||
>>> +            soc > CHARGE_CTRL_START_THR_MAX) {
>>> +        dev_err(battmgr->dev, "charge control start threshold exceed range: [%u - %u]\n",
>>> +                CHARGE_CTRL_START_THR_MIN, CHARGE_CTRL_START_THR_MAX);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /*
>>> +     * If the new start threshold is larger than the old end threshold,
>>> +     * move the end threshold one step (DELTA_SOC) after the new start
>>> +     * threshold.
>>> +     */
>>> +    if (soc > battmgr->info.charge_ctrl_end) {
>>> +        target_soc = soc + CHARGE_CTRL_DELTA_SOC;
>>> +        target_soc = min_t(u32, target_soc, CHARGE_CTRL_END_THR_MAX);
>>> +        delta_soc = target_soc - soc;
>>> +        delta_soc = min_t(u32, delta_soc, CHARGE_CTRL_DELTA_SOC);
>>> +    } else {
>>> +        target_soc =  battmgr->info.charge_ctrl_end;
>>> +        delta_soc = battmgr->info.charge_ctrl_end - soc;
>>> +    }
>>> +
>>> +    mutex_lock(&battmgr->lock);
>>> +    ret = qcom_battmgr_set_charge_control(battmgr, target_soc, delta_soc);
>>> +    mutex_unlock(&battmgr->lock);
>>> +    if (!ret) {
>>> +        battmgr->info.charge_ctrl_start = soc;
>>> +        battmgr->info.charge_ctrl_end = target_soc;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int qcom_battmgr_set_charge_end_threshold(struct qcom_battmgr *battmgr, int soc)
>>> +{
>>> +    u32 delta_soc = CHARGE_CTRL_DELTA_SOC;
>>> +    int ret;
>>> +
>>> +    if (soc < CHARGE_CTRL_END_THR_MIN ||
>>> +            soc > CHARGE_CTRL_END_THR_MAX) {
>>> +        dev_err(battmgr->dev, "charge control end threshold exceed range: [%u - %u]\n",
>>> +                CHARGE_CTRL_END_THR_MIN, CHARGE_CTRL_END_THR_MAX);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if (battmgr->info.charge_ctrl_start && soc > battmgr->info.charge_ctrl_start)
>>> +        delta_soc = soc - battmgr->info.charge_ctrl_start;
>>> +
>>> +    mutex_lock(&battmgr->lock);
>>> +    ret = qcom_battmgr_set_charge_control(battmgr, soc, delta_soc);
>>> +    mutex_unlock(&battmgr->lock);
>>> +    if (!ret) {
>>> +        battmgr->info.charge_ctrl_start = soc - delta_soc;
>>> +        battmgr->info.charge_ctrl_end = soc;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>
>> These function names sound quite generic, but AFAIU this patch is only adding charge control support for the SM8550. Is sc8280xp and x1e80100 also expected to be supported using the same qcom_battmgr_charge_ctrl_request format?
> 
> No, sc8280xp and x1e80100 don't support it. So I didn't add the support for them.

And what about SM8650 and SM8750 ?

Neil

> 
> These are generic functions are similar to "qcom_battmgr_update_charge_time" and "qcom_battmgr_update_info" which are only used for sc8280xp platform. Even right now charge control is only supported in mobile platforms starting from SM8550, however, it could be potentially supported in battery management firmware of any future platforms and the same functions could be reused.
> 
>> Thanks,
>> György
> 


