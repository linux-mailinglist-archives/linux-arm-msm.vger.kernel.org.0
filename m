Return-Path: <linux-arm-msm+bounces-22080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0EB9005D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 16:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF7B1B2843B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 14:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB47196446;
	Fri,  7 Jun 2024 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pWqigHdY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1507115B986
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 14:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717768828; cv=none; b=gIYkEY7ar7NvolWPn4Z6wdGfW5UbD3tvk3rtGonOyFIWwKw55oyNxsIUHazeU0B9FX0R7N/8mjr0u/yOjKRsVOQ/EcMRIThQdANUpoyQKgCZyqwAMgicBHOXNb0huk+FtWYO1dhpabJY1cG+BKVvQO5RQsPfDfszIpNdAPmQ2So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717768828; c=relaxed/simple;
	bh=OOA1+hRiYDrMPbwUCoHpN5UM+d1N1dzdE5Ks/+ep6J0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nRBjQh8ZY21/Y0J3UwBfoKGt/mJbbOHK8EMLptJP2w1P/pI81LwvjykxshcrDftrJ9nqXCRug+5lod9XFIPKn6shqEOENsFZWbljou1OAJVpcbciwlBh5q/PJD8gWcY289i1HiBlgiLl5QMQe3k0zZtHXG1/4LKzKgLf9+EdfIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pWqigHdY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-356c4e926a3so2039293f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 07:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717768824; x=1718373624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKigPxOyIsTI2bSkZ71iXyzsI+rxMVn90vvi1arrb7c=;
        b=pWqigHdY7H5UzJb/4d65Yp+BMSKX/xXgd1rRa1S1p+YwyfnSeY93A1qkWMz6rYWCuR
         edM8qysAVJr5/J+hP43jx2spRHu3dDYmFyX5Y1b9y4hYi48MADKZAI7a2sBqfwynfWz7
         LDKRlcAS5DQb7Y/al7xE/4Oh+f8Ub7b8ZMGbBrAoIZUod394XwL98xys6zgk1VWNkekr
         YbVJ66BfBFv9a/3VG/C+2DLV49U8nO0OqdKisx2d5lIeWT8vn8jxSfc0p4kDesuvFTpC
         WuqfFr4iGhiQS6avYKl3e/qL7J+7qpQVd2U/Ssg9zm0ySFlTJ7QRPi/9FdygkbYo5BKz
         R+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717768824; x=1718373624;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jKigPxOyIsTI2bSkZ71iXyzsI+rxMVn90vvi1arrb7c=;
        b=RamGKg/quX3Axf6xo/zCQtSw1CRAnqWQNdQW/yWroj8DpDmjDEiok1+/X/kugAYPqJ
         AW+vWIQHhO8cia0RL/QyPzOWzPtRTyJ4/OPoYyskc0GBvG2Y99VmcgovspbDQBlvUj03
         n0yUXUWPvKTYiZ+y8c50SqmNnrX5YumiKVgeIRY7zoFa3HcuhWKiEXFkXFXpMmKeSoeM
         7wyf3AD1YPCNO1D6/ug438vimXCPUfGJRk6CDJWCMSOQchu9AxpY9OckfrPpMO5zOkjW
         uAIHzKVX3XH2JcxR34+ub0Tb1Zxzx8nQDM2+eU6TeMHBJjXOORyScDOdHIS85ixNJlnD
         5JwA==
X-Forwarded-Encrypted: i=1; AJvYcCW7zKn9hnKuW96h51ARcJCgBzFaOdIWazRIeppdE9L9wxGJdAnCHl74xh0v47pBohqvpu3WScSchXZZJoIRg17VJDpNRpoMgkH9ch4+lw==
X-Gm-Message-State: AOJu0YwdM6BIphLcL5XVozHk/eXcgv3fR+dkcycQpoWSMzSZIps6MZEc
	ksCg6TgVtYyoLj+Se1OACVcWAkYyJ7mh5l8FtEPj0cgk5npad1rSni3eabRYqZI=
X-Google-Smtp-Source: AGHT+IGmS4HUnGooP5PlDCBfYxj44NfY1lReEaODhxoscoFCiBWltIk+cWqWgfLs0yNvpSTRw/DqfQ==
X-Received: by 2002:a5d:4acb:0:b0:354:f142:65b0 with SMTP id ffacd0b85a97d-35efed534c9mr1907495f8f.37.1717768824112;
        Fri, 07 Jun 2024 07:00:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404? ([2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5fc11fcsm4056145f8f.99.2024.06.07.07.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 07:00:23 -0700 (PDT)
Message-ID: <ac155efa-de85-4bc0-9af3-2190d4d1a60d@linaro.org>
Date: Fri, 7 Jun 2024 16:00:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/4] usb: typec-mux: nb7vpq904m: unregister typec
 switch on probe error and remove
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-0-c6f6eae479c3@linaro.org>
 <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-2-c6f6eae479c3@linaro.org>
 <cnqpgfjcqqedk3xqkfbjacjikc5jwktev6c3kwmbq7cwut3eyk@xqyhgi5xgzgf>
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
In-Reply-To: <cnqpgfjcqqedk3xqkfbjacjikc5jwktev6c3kwmbq7cwut3eyk@xqyhgi5xgzgf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2024 07:50, Dmitry Baryshkov wrote:
> On Thu, Jun 06, 2024 at 03:11:14PM +0200, Neil Armstrong wrote:
>> Add the missing call to typec_switch_put() when probe fails and
>> the nb7vpq904m_remove() call is called.
>>
>> Fixes: 348359e7c232 ("usb: typec: nb7vpq904m: Add an error handling path in nb7vpq904m_probe()")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/usb/typec/mux/nb7vpq904m.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> I'd say:
> 
> Fixes: 88d8f3ac9c67 ("usb: typec: add support for the nb7vpq904m Type-C Linear Redriver")

I should add both yes, it won't apply with only 88d8f3ac9c67

> 
> Nevertheless:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> 
> 


