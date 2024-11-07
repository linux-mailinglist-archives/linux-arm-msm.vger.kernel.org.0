Return-Path: <linux-arm-msm+bounces-37206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A5E9C0022
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 09:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 747AE1F2199B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 08:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFA71D9341;
	Thu,  7 Nov 2024 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dURYm47l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD9B1993BA
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Nov 2024 08:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730968664; cv=none; b=OJ3J6T9Y0QhQeVp7QgCeUCyNYQ3Pvks6snPUXCFVEqwk4JM2AysWsoV0aRPSpLF79wATv3ldADGWSk8zmNSJwcheP0OBqGihVUDcjLIHxqZaGhQk7qzu2/9q9untOZSivhrVE+mvtQ+hISmvHkEB3iFNS7ELryLTUilQt9t6Cjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730968664; c=relaxed/simple;
	bh=5KKm7vNWJgWghFT5nNLhjDOshGpxtnvHC9TFhJK13ak=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TPZ4vrIQQ83+kZUW0YtYw0B0vTARRbhkID5dffe8pj6McpnTpedi77hICPXJEQ9D2lpFymb0zDzcqwR4GCP/1K42YuLJ+ZNVCi2beu53i4RZBb+hSTKRm+twAxxs0DlMsA0M9NcxQwn/7XcT2NS1Ry0V61Vti6ePvxM5iJIHKTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dURYm47l; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9ed0ec0e92so82290466b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 00:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730968660; x=1731573460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZao1C6pV4fJNRNyMk7syEnimVtRpaNTazE2wh1+Hz4=;
        b=dURYm47lbCyeC5NypEX5uV4OBnpz9uEk6rcszAWN4Ytbr7Ez74r5gkGWQ0Rduumxo2
         y8vh2y6RAsPFfe1IsdeVEcKjSceLEB00gvBDQ438RU1M/NN0Dvqyo3jaRPNB7xoXMNJE
         L5oWMBc/8QFFdMwrQwIxXaGXFcwNjQGMwrljFQY2ixUg22c2QSrlJGGfPiASF95qedDf
         TSATJjbi8tOE48vAM7Hrz9M1HzTqNxsMRJlzUrNzhbLtSYwwswkW06r794lEA2XkGhI2
         bbrkOJu44OBXyopfGJjAR+IuwWuni2d62fwn3ViyuiN4kbg0PRBwRFb9OwilODd8R4Qk
         uzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730968660; x=1731573460;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fZao1C6pV4fJNRNyMk7syEnimVtRpaNTazE2wh1+Hz4=;
        b=q6P4Vc6KA/sNDO1Tl8UyD+SbjpySeUKhI2lkx37yJ/0wAwKazqkQ7exWu9mV613uTJ
         x5GjwnZSWEaqcVR4XUfvLFpUIjS9Y1aMprC9/mut93tsrgOsKzHjSSwLCTCw/cOOPNQs
         85I+tjUHTGFWgGe2nXY3I4V+NyP82bU7/zQhtYIgVr0XSQ2iL4o8rRHxR3VsMMmsTnax
         IzjRKh/6YuifHdkl5jJhbCS5w0f1OS0RfMAtVKd9fncdhUPKSlNMDO+HXcyft7RZN3wp
         2Cs0stYIn3/MJ4UlHQ0yv7VqABrBV2R8vR2mBbGtYQ+OTXq/vPaNVhZTbLzBWtnWrNpJ
         bKsw==
X-Forwarded-Encrypted: i=1; AJvYcCXwWvcmCP4Ky7TTwMuKqlbtqhZCekIyMH/vxbjONDnIroLTr4vUn70pavO+TXtNFcLGw/+AtMJ7+wgVwzzD@vger.kernel.org
X-Gm-Message-State: AOJu0YyrisxWPj12kxtN/w1RFDxV5ioL2FEFKQbrF3jiR7jY248DUKsm
	nnQuAvBHENpLmu+2rbkUZaNn2AdrUdGOUi+BRWpZbDT0oTYs3dl29v8m9JlwohI=
X-Google-Smtp-Source: AGHT+IEhNtLHXpW2UW43FhKyRoSS3ZfYfyhsgWLjpZCVbTjlt3IsJUPg3RMTYn5vGgbY89sMKtA8FA==
X-Received: by 2002:a17:907:7290:b0:a9a:7f84:93e3 with SMTP id a640c23a62f3a-a9e654cda4amr2101061966b.14.1730968659934;
        Thu, 07 Nov 2024 00:37:39 -0800 (PST)
Received: from [172.16.23.252] ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a17651sm60652766b.38.2024.11.07.00.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 00:37:39 -0800 (PST)
Message-ID: <f681e30e-35b6-42de-88d4-8ae9effb49ed@linaro.org>
Date: Thu, 7 Nov 2024 09:37:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] usb: typec: ucsi: glink: be more precise on
 orientation-aware ports
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogeurs@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>
References: <20241106-ucsi-glue-fixes-v1-0-d0183d78c522@linaro.org>
 <20241106-ucsi-glue-fixes-v1-2-d0183d78c522@linaro.org>
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
In-Reply-To: <20241106-ucsi-glue-fixes-v1-2-d0183d78c522@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2024 16:45, Dmitry Baryshkov wrote:
> Instead of checking if any of the USB-C ports have orientation GPIO and
> thus is orientation-aware, check for the GPIO for the port being
> registered.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/usb/typec/ucsi/ucsi_glink.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 2e12758000a7d2d62f6e0b273cb29eafa631122c..90948cd6d2972402465a2adaba3e1ed055cf0cfa 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -172,12 +172,12 @@ static int pmic_glink_ucsi_async_control(struct ucsi *__ucsi, u64 command)
>   static void pmic_glink_ucsi_update_connector(struct ucsi_connector *con)
>   {
>   	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
> -	int i;
>   
> -	for (i = 0; i < PMIC_GLINK_MAX_PORTS; i++) {
> -		if (ucsi->port_orientation[i])
> -			con->typec_cap.orientation_aware = true;
> -	}
> +	if (con->num > PMIC_GLINK_MAX_PORTS ||
> +	    !ucsi->port_orientation[con->num - 1])
> +		return;
> +
> +	con->typec_cap.orientation_aware = true;
>   }
>   
>   static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

