Return-Path: <linux-arm-msm+bounces-62018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DCDAE39F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 11:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B5B416BE94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 09:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF3D238172;
	Mon, 23 Jun 2025 09:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PJVunKeH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359571F1522
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670704; cv=none; b=Pae0tPPq0Io+AMkgDyPkfTvPZsFarLM5m1okX/4wkE7GgMO8Ep3ONmykcz1V9zvxFF3pSjILqIptvAfNbYKpFJV5/vadA1KkmgTwsJy6aFWqftKOhkxzkHKr4fy0MS7Ypz4SGeLG53y1wEY3uG1MPIYKr1HCmkZkgfeM26YYnKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670704; c=relaxed/simple;
	bh=oTIInUtBcajceOxugmLiZUeylR3Dfyq5iAj14kL/tWU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Jj+4bns2JK9lwBF4cwMME/ua8MDa3PQuW6nkjDUyIzJ/uo2Mn35YKwwyk2Hb5KFiutUNdyhmv+yXurhMBD1QSBn4LcdNSNnH6BIHwFgFK9q2j2X4Snlkptu/uwOR9e62oQNvwElwqJK45vE2ia7g/eiJPm+stUjfC/dHeH2y+eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PJVunKeH; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a54700a46eso2146441f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750670700; x=1751275500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eey89sm+5Q88W5AHsj/l1ITNiGU19HyVgPofAmoDcgo=;
        b=PJVunKeHrNNsP3FK1Z6Ood9psf2srh/qDR5Pr6+xIIuL1Q+f4G071o8e9id7F5mzyN
         L94qoALxHNyj4xSTWefj4csO5axuIvBELkJ9sa4Ka3Jdwv5bu+9YbeMUyc5S1cY7p2Ut
         LQmfQ6ZR/xW1j7d7gH8ARcFnONQnLYtIsZovMxINoBbK4py81MGCtO6O67IRFf3GDZlw
         SFuumIi/uvemQiOB2xlvRcJqPC6qZNl/1ePVF/pS1Z7jvei9aRRzyy88Zq2PgpSo3/79
         RWdL8dRcDz2Ftogvb+1fEG3IhpkdWR2DsDhcoJ/8YQ82WlgN6B9zyuHEW5wGF45nnD8m
         SlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750670700; x=1751275500;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Eey89sm+5Q88W5AHsj/l1ITNiGU19HyVgPofAmoDcgo=;
        b=HdXZKLv6QChHV3goFQKyt32SEJlSGfFXDIvP8NH2cibMoxc+2yd3QBG7+bN12nymVP
         3pH+0bAUgLcfv8rY1l7JWCzFr865yIKwTmf1VXA0+fJtp8DhxpBmh135dytICK5QLqZp
         yP2I0fOKKkLGG2T3zaiqHU1XcAxMRDC1c0qRHTcVrUI1asGAUgUx6JRnCC9wBPk13NXI
         B56SuftwH5/n+mlbAr1Nn8KwQ3qqVs2vfNIzXQWSo6JGKlB9QQSj1iQzItgXByIqZyBR
         bUzYolbkbfqkEpfegKCtFsdxAAu6spbJPdxjLfyeMkctLrGNdaCTk0JEmB44X71p7cWq
         UvoA==
X-Forwarded-Encrypted: i=1; AJvYcCW4nUwzWfJC2XknQIwoL5oJZPP7x2eTtdRDPT9QoEVioUO6pn/2lHGVjdDMVgWTtCIq62RKlZJNjNx5DLQL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4DAzcSGPdRGi3fDP9IN5VsqCeqr7GFrpODoup1W162x1kXilw
	54+nVjDkKVRPMC8vI9sle4xgwP7CesWU5dMyUFBewCb5VhxBMgWsxzg/MPVjCAV9mFo=
X-Gm-Gg: ASbGncuNDKGOKn05K81hOtiS4tUnH57r3aXScempapYzP5E9lcJKd/e45r3xSfavzPr
	TFkna3/Gyg3ZQBwQlgHiw5Tjz+ey6dlToDPG7Fs+h46vFbNqZKgI3KZPHncF7FF9dcHWSCu/HzT
	wLkdx+DbcbWnROuBU9YRsMPI7qkZa8pxbQK9bJs31OILMJQE52L19JOd0EBtetlAiqeSSocDu1H
	LWSjlOBEQpX+UBwtIEJ8nM4ml+D1049UtQ0nNlkD0OMCz9huQZ6ZywfZKA/t549t8aISfs0XMWQ
	tgLhrib/kyMfOGdvdouAod5zhdTqrcowWnBHVOYBbnTZhtZUuaq3xBE3WSGGwgaJiwzQ6beh+Sq
	xqFMQL9/qwTTf20ZViGrUETdWUQc7+zr0qjZ0cm4=
X-Google-Smtp-Source: AGHT+IF2YxW40MYMsJKEVcTIJfeKM3BiB80NGEjeW9CZ5fflZ9WZ+n0CxoOF7elvvYKL5/2xVUsQ0Q==
X-Received: by 2002:a05:6000:288f:b0:3a4:d939:62f8 with SMTP id ffacd0b85a97d-3a6d1322c16mr8812958f8f.32.1750670700464;
        Mon, 23 Jun 2025 02:25:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d? ([2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18215sm8806750f8f.29.2025.06.23.02.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 02:25:00 -0700 (PDT)
Message-ID: <c7444088-9037-452a-94e1-aeefe79c7da6@linaro.org>
Date: Mon, 23 Jun 2025 11:24:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/9] media: qcom: camss: register camss media device
 before subdevices
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <vSVeMnj1dcmWmxoKEUeVmrGbtTJrcjhuCtom4Xf8vz4p_o8rEeZNaeyQGylGdx4vE1lgUmUwTCYq1aWf58n_AA==@protonmail.internalid>
 <20250513142353.2572563-5-vladimir.zapolskiy@linaro.org>
 <c6f463dd-f3e1-457c-b83d-29daaf7a8d00@linaro.org>
 <5f1eeac8-a977-4530-836d-7e0459d9a433@linaro.org>
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
In-Reply-To: <5f1eeac8-a977-4530-836d-7e0459d9a433@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/06/2025 18:14, Vladimir Zapolskiy wrote:
> Hello Bryan.
> 
> On 6/13/25 12:06, Bryan O'Donoghue wrote:
>> On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
>>> A media device can and at least for sake of simplicity should be registered
>>> before V4L2 devices including the ones added on async completion.
>>>
>>> The change removes the second and out of camss_probe() media device
>>> registration path, and it allows to get a working ISP media device
>>> independently from connected or not sensor devices.
>>
>> So are you proposing this change to simply the code or for this
>> secondary reason ?
>>
> 
> This change halves the execution branches with media_device_register()
> usage, this is a nice simplification by itself, isn't it?
> 
> Please let me know your worries about the change, if there are any.

The change is pretty logical and well explained in the commit message,
it make the CAMSS media device functional even without any sub devices.

Which is great for unitary validating the CAMSS on platforms.

I'll add my:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

> 
> -- 
> Best wishes,
> Vladimir
> 


