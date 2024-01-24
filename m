Return-Path: <linux-arm-msm+bounces-8132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F15A783AA28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 13:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22DB61C20FE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 12:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25E577F17;
	Wed, 24 Jan 2024 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tgXQZVbk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D45F77F0D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706100250; cv=none; b=G762D0PRtGAgOOoQCGsALslBcdqQiiof8HZgFimS7wrkB5jvRjI9B8bfRj67yHhxjaG/nsADvNZGlZwWZ2Y5iaNbLwuZZRLUlQCYhfcu7hbNbsaJ0jEpQsFWm63j9XVnFAT+fMKhz9mZrVyJ8XSh6R1yT1jXCjTljPSrDR0KNWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706100250; c=relaxed/simple;
	bh=u4Pd9/GQ/D35q1MW5OAVVQkGORRVo9EB40xBQcaVozw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k7ZsY9n26nkuTWteJm3+HGE3BYV79kOlL3b06FDlwrp0VzR8DZbCaPkJFLkMwONGxDOZXk6m26cY5UHXvWMOU+8b/J4y5G15/jfZeuerKvf7xs6WSWrB3TA+rUnyVSIx9eK4Z7zAwk3DZ++iDB7OXMGX0G9SHLN+jdjDVehhKGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tgXQZVbk; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d70a986c4aso24015785ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 04:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706100249; x=1706705049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqgyZ2Sqd1xfKm+m9+hAQsolUxve6GqD3pgIanjN3gI=;
        b=tgXQZVbkdhs88Upq/Nd3zj1B87PbuGMrRz9GfkMEeUGRjeCHQZvRohe4I1Onx4voCU
         zOFPWJWwhsnnCYAMgL/pK9kNAevWdJS0J/vAc/I4fZ7gd3f6HlE7HaeRnkl9kQ1AJHpJ
         DVwbtpYLHh4UQQNsrprorUpG1z+g3L154VD52SO5RUGGg8tLwNDi2cMjwo0cH8Kfw9iH
         232GeJ9zuxTzfeJPf7Y8o3gkB8JDfdnAmPJxBNSp1HzJDQ/sodMgTeEFGtlsSG+CESWD
         n85BF3NdnMhV9rrbMAuqpAGTUU9jrKh+yY3z4b2f2HEa29wRaPy5AjJhhJHeTQiCryNy
         9Z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706100249; x=1706705049;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UqgyZ2Sqd1xfKm+m9+hAQsolUxve6GqD3pgIanjN3gI=;
        b=E7Qtbx7bwNy/QIZH/xF6JpTCvI0Di+IjeLTIIjObRWJKQmGsOMo6P25+SUuHC9wc0P
         7kKWEGI2L7AGOLkjLLOL4uluhyaKHSyUZPNYwAdRAVhPaWtOGzz3SehaQ2mUL8sEycFt
         HvER9vsBGV7vqsJcAyazxkyctN/H6fyfZxgRHhfQiagn15bc47ud3KEk4IBHb/z8uEC4
         ZchPKJpGQlFEKUV3gdz7FOu3tLG0Ad/EbVHYVG3O+haxnQQOHYrhNh8YxRdYOUwXh9W2
         aRDpBtEKTf+EMEYBijMyN8Ob20TNefFvQZYUsGCqz62yb8D/pBziMfqMxPL8u55JKcgZ
         gd3A==
X-Gm-Message-State: AOJu0Yx15exBRb9GhPGo1Jynj3YwXK6nJmAasJxtKOGO+Bc+EMVHbxq2
	5P8GWs2Hq1Xd5ztCfgU7LsDPe6clZWam6HPkWwuTOiuHQgIsUVLPy/JirCaRvh4=
X-Google-Smtp-Source: AGHT+IEXa7RfusqR1CTMjKxwfYkcc5NreShNdiyPmCYjDdFQjM3CAZJBYQZApMhGDQO+88mJATMAjw==
X-Received: by 2002:a17:902:bcc1:b0:1d6:f263:5699 with SMTP id o1-20020a170902bcc100b001d6f2635699mr575890pls.30.1706100248630;
        Wed, 24 Jan 2024 04:44:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:fd4f:fd82:e4fb:1654? ([2a01:e0a:982:cbb0:fd4f:fd82:e4fb:1654])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902e9cc00b001d7035b11d6sm10368325plk.254.2024.01.24.04.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 04:44:08 -0800 (PST)
Message-ID: <f8ec55a3-967f-40dc-9008-b4f5061023e4@linaro.org>
Date: Wed, 24 Jan 2024 13:44:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 0/3] usb: typec: ucsi: Adding support for UCSI 3.0
Content-Language: en-US, fr
To: Abhishek Pandit-Subedi <abhishekpandit@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: pmalani@chromium.org, jthies@google.com,
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Saranya Gopal
 <saranya.gopal@intel.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20240123223039.1471557-1-abhishekpandit@google.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240123223039.1471557-1-abhishekpandit@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/01/2024 23:30, Abhishek Pandit-Subedi wrote:
> From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> 
> 
> Hi Heikki,
> 
> This series starts the work adding UCSI 3.0 support to the UCSI driver.
> 
> There's a couple of pieces to start here:
> * Add version checks and limit read size on 1.2.
> * Update Connector Status and Connector Capability structures.
> * Expose Partner PD revision from Capability data.
> 
> These were tested against on a 6.6 kernel running a usermode PPM against
> a Realtek Evaluation board.
> 
> One additional note: there are a lot more unaligned fields in UCSI now
> and the struct definitions are getting a bit out of hand. We can discuss
> alternate mechanisms for defining these structs in the patch that
> changes these structures.
> 
> Thanks,
> Abhishek
> 
> 
> Abhishek Pandit-Subedi (3):
>    usb: typec: ucsi: Limit read size on v1.2
>    usb: typec: ucsi: Update connector cap and status
>    usb: typec: ucsi: Get PD revision for partner
> 
>   drivers/usb/typec/ucsi/ucsi.c | 51 ++++++++++++++++++++++++++--
>   drivers/usb/typec/ucsi/ucsi.h | 64 ++++++++++++++++++++++++++++++++---
>   2 files changed, 109 insertions(+), 6 deletions(-)
> 

[    7.417925] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: Registered UCSI interface with version 1.1.0

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD

[    9.085733] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: Registered UCSI interface with version 1.1.0

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD

Thanks,
Neil

