Return-Path: <linux-arm-msm+bounces-54324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F4AA8964B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40159189614B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 08:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FC51D07BA;
	Tue, 15 Apr 2025 08:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D69lBGaz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634C81AF0AE
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705083; cv=none; b=OtIAQwlM1Y9VOPxwsgYYFHUd1GZIwoWdboe7a6zIK2I8rYbLf6Qbmqbh/bpGoyGOmHHGiGOmJm9+4RtPgqleH+Z0+VPOzIOvhSYod3R6tYOhT982IiBLP9Ti7aq4h1sfFK8IWOHLZ08drQ3SIE8ptkQeWSyBzbsxGE+0/79Gp6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705083; c=relaxed/simple;
	bh=aNw1qEcSdgkM/iAxlZgi9SL+WfRPwqneqwPkmwf/s5Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mMbuH5UQ9j6g1JnSsCK7EQ89hJs1gZxVXoh+brXpNCA2ZqndG+OoIHduWt1RoV0m38SMbiW11bQBXpOoUxNzVMUnF3SV6DqBLUcRIacor0v4SnAUChNY5w92pTpnxDYfLfry85dlzlzMkBtwXzfduCcjooJAidB5PTJNdvbx3gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D69lBGaz; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c30d9085aso3239051f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 01:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705079; x=1745309879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9R0bq6Xay7hUWOWZTLdriMvdW3Bm293BXWhekm88cU=;
        b=D69lBGazTCXUL3GDlbms8GMOnXIulr4MyaD5vRJZbqlTcNcLQq6iziuSvYEvRMRE3x
         FakxC/cd6O+rfL0NY4zWm5xgi6chzwqj7QwsBRWahrTj0oIV31Lv9ms83axp+w3EKvl6
         f0x/4YU1yx0ohWeb7au96/F6rwjGxIq5GYyeZTjvenn2tXc8mX3thN7pmTKTM+78ge54
         YxSm0dJc7B4ihNEuF2c0aG13M4g/XvLeojIUv5kQ2ALmN+NxcGhLBwN7Y+eid93nXTAl
         PrhSqVgAExBx6g65FxKQdIvfcMQKTqSqxytz4TXTwcMMNwf+uuvYtikIrRZjxlUaIcPc
         HQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705079; x=1745309879;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S9R0bq6Xay7hUWOWZTLdriMvdW3Bm293BXWhekm88cU=;
        b=d8x5itFkJMYPTKv7gx96BYVKW02gXE0c03HKYBsmY6NW9qie/1ue2R412L2BlrH/rR
         VSXkdHu7OKLfJJkTyo2hJJHvqkD+ej/ntytd2r7vKsOasbhnKNMuag+dcHKr2CTvAbDQ
         ZK9KOqdUBNpPyneL5QnsM0kBj+Pzlj/HwJHPt457qKCN/y5HypY+HhYlJVUuWw96I2f/
         zyX926Nei+HgJEccisOoRZMpvsMsXHjSGtMg5nhYIezX5ikgRGzUsIaNn/IjShDMDgX9
         BiWmn5geZ7eMXypcZKsy3Hy0M1R1ruG+KaiwmzvWfmGryDtoQKEk1eQcy+4KMzntjaap
         hkPA==
X-Gm-Message-State: AOJu0YxuuWsj8MzKqmetDomsyTrYI62DlLpiyURLu7Pg6M0FvVk8VXiA
	cydnCCjoUlqhToppDAIKGRFduEigW9r0BkVacWVYOQmhgnN3qP8PDWzMYTwM2jE=
X-Gm-Gg: ASbGncsICANK84o6gv14KURfY3+PxW5wmA7zzV1bE68XhWmF7miVxps0deOwDBgSaqq
	fkw8O5cIHCYx2yFJC9KaFDwYab2z7SQgVEFZHtQDYbs1ylR/tgIGOXx6iVPFRl2x125i2gbpTi9
	Yr8IYt1zBAs3063HXADdxPWwaW23LVo9eovia5Ih0S0la75NA2Fx9fUJtXb4qqkE/NSwfVBLIra
	p5H2lwQLQ2nQscJjyC+wZ3tmRklyeI+v83PzG8YyCEYhrtruHKfCPP9dLWgw/x6SIo28qM1xFiT
	ls2vc/QBvQH41O2QhASlPBsoVNsNcWKbNXuJh/rqQuq9n7c8gFP4mPKkQNi/ZXYNpDZz6DbGeZT
	f1J57G5l9xwG4jpBN1gccm63e0wIh
X-Google-Smtp-Source: AGHT+IGlH94Rv73ba2D5G22X7lVH9eT2jkQiPunHZHRgDARM4xIe1+hQwGc/DsRp941ZCmPOdb90Sg==
X-Received: by 2002:a5d:5c84:0:b0:39c:13fd:ea9c with SMTP id ffacd0b85a97d-39eaaec7b70mr10629699f8f.47.1744705079656;
        Tue, 15 Apr 2025 01:17:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ac71:de35:af4b:b8fb? ([2a01:e0a:3d9:2080:ac71:de35:af4b:b8fb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963c15sm13754713f8f.13.2025.04.15.01.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 01:17:59 -0700 (PDT)
Message-ID: <d80e2553-e5b9-4b79-b96e-f7092ac8d707@linaro.org>
Date: Tue, 15 Apr 2025 10:17:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] interconnect: qcom: sm8650: enable QoS configuration
To: Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250407-topic-sm8650-upstream-icc-qos-v1-1-93b33f99a455@linaro.org>
 <b9f90b0c-cae5-4dc3-817a-183b49f947b9@kernel.org>
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
In-Reply-To: <b9f90b0c-cae5-4dc3-817a-183b49f947b9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/04/2025 19:08, Georgi Djakov wrote:
> On 7.04.25 18:16, Neil Armstrong wrote:
>> Enable QoS configuration for master ports with predefined values
>> for priority and urgency forwarding.
>>
> 
> Hi Neil,
> 
> Thanks for the patch! It looks fine, but i noticed that there should be also
> QoS configuration for the qnm_apss_noc node, but it's missing from the driver.
> Do you know if skipping it was intentional?

The qnm_apss_noc node is not present in the upstream driver, I wanted to add it
in a second time. Or I can do it first as you prefer

Neil

> 
> Thanks,
> Georgi
> 
> 
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/interconnect/qcom/sm8650.c | 327 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 327 insertions(+)
>>
> 


