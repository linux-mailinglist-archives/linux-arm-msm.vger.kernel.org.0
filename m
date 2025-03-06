Return-Path: <linux-arm-msm+bounces-50475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60212A54658
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 10:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6097188804F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C2220A5CA;
	Thu,  6 Mar 2025 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fqs/3qdk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891DF20101A
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741253431; cv=none; b=IhYV1IETxQt22MkSWS2mhYYDm/tgm0sYTl8EtNajao3cuPHiTwk24dbZuSbE+dTtm60N3HvftKWxcKvfgR9vBJ6UUhrVR/KBW//GP52mU9N4E8Euq72hjuCsjX8CtaTV9vM+5zxs75mmaWUcY2BgwcpNsA6pkPsH4Odz1obdtZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741253431; c=relaxed/simple;
	bh=zL6BTmVJ/wyDlBdEEGs0+CfmrEMOo5PpQZDbnR0Qa8Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XpGRvJH0CqfrFbTD6Xek+OpH/9iEr2dHKs5G5/B37cXMS3Bwk19RykKDja1tHtCAthdYFmpjKcW34FDXQzThZGc2+O/zVrjhhCm9p1UC1OjMpvfJGoAIBYJpojAHdvni++aqAwdV77QFSJn2qua/nxFb1eqNJbf6st9N5LZi/E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fqs/3qdk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43948021a45so3517535e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 01:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741253428; x=1741858228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ncB2tuQORatDJdRGujzDM4Ip4LmUwzu5C0be3bbhYo=;
        b=Fqs/3qdkYKuaDvGGQfL9r0hiqaXWPrAKV5YEDMwIAOz2u0dZGs6V/HkPaSVf3gu5t9
         JVm3/Ymo2jNWfG1JzLJgY9nRjHIPGQemhL03JL6tAJZWGMx4SS2e91KR9RdzoeK08gX2
         QxuMUSM0ZPGALF/g/AxBZIWIVFfYx4aOlmtlNFDW2cKglIRWwvxPQ3jhjr9SHzizzhpx
         XzbtEYtOBeRS92yVKh9LiNE3QPtGzAVk8+KKbHEqxeeJzLo6bm9S1IJh3uOBJUOG3aG1
         vkrQj2MgRGyzSWox8dYef72Ty4zwOI4eX77+gpliR0pTvHoWo+KfDafNoz1kaN2q0L8l
         1sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741253428; x=1741858228;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3ncB2tuQORatDJdRGujzDM4Ip4LmUwzu5C0be3bbhYo=;
        b=LbzjZVHhhqqVX6VtuCq6q/mky9O51dDbTuBtBddiDv9gCL/l1giFGmTT7yOJyQqg9I
         4aksfyHhCC7cTrdX3vOGN/DCjaW3ZgmRU5nOCXtX89AWab4TtyAVP1ve3nmx4wZmlchs
         6+0HL7V1EG/0BUR1xLOGipfwyKxIvvLiQwHVTN2dy0elgmyv7JIsPdKsd25StGvwen9n
         81gRkVpk/0lzL4dEKYFX+Gq1QYA2+WBb/4G2elR4uruS9M8TSyEyO9TDxdwI80l4L/wV
         iB1nIRQ2mWUiIfn2gQXiW/d3J2tWdjJGqJAcyDzfhotSEZVKzchJH4hJ4CxjkrX5Gi/Z
         niog==
X-Forwarded-Encrypted: i=1; AJvYcCXiWKC3tdrKX+gZJ6SHM4GZM4xP5tu7IysuSCbmIVZGYeqoXt9ntB/oxSASfSFLp9yhyWC0ZIuxIlKk0SWf@vger.kernel.org
X-Gm-Message-State: AOJu0YzAYXcUOM3qLOpPxfBGK5O+Wqn43iFjk6zZZaBCu7XTcXUXXbNp
	JVap1dAJyVZdD+IoGt9E7L7NRXZYm2ZCNjovq4lp/c5hv84aLtASNNs2ga3KB+k=
X-Gm-Gg: ASbGnctygTWnBLkq6gu345QmTjdkPCXfelQRSZ7dEdQZBeo35sB6TAcpBSuUVmjpP8l
	SLQpPJJY/EUwnik5wBmsXVABP2eGwdBK0SraFySS26IcQTjDJ8PHDbpoFkXqzlI6G/iRn0kCpUp
	f4EIR4ZvvSCTCbeiURmsTYrlRDZY6TV0T+BkzecIrnoamAZNM8kZVmtJkwJkHbbYHdjvKR3tXX2
	wy5yhyxKM9R8lUzsXXUbPS6NPy59rH/B+Db9yBwO54P6g72wLPt2kHLpISgrpGt7PKDGmlvvYYz
	Lvhc1t1XfUwAJSdZz3ifho1RC4j6xt4H5Mp20ZbJ8akSTk3H3svDlBu3
X-Google-Smtp-Source: AGHT+IEyknlGy0vVxl7IFJZZCVesAcPmZtefHHgNNLbDgMorbZ9ZZYO+JvFG/OeIm1Ql1Pr2uoj2Wg==
X-Received: by 2002:a05:600c:35c2:b0:439:8bc3:a698 with SMTP id 5b1f17b1804b1-43bd293f637mr53469645e9.6.1741253427697;
        Thu, 06 Mar 2025 01:30:27 -0800 (PST)
Received: from [192.168.1.101] ([37.167.199.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e2b8bsm1440616f8f.64.2025.03.06.01.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 01:30:27 -0800 (PST)
Message-ID: <3cb174c1-ef1f-4578-b5b0-b82366d02ebb@linaro.org>
Date: Thu, 6 Mar 2025 10:30:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] MAINTAINERS: use kernel.org alias
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250306-update-email-v1-0-9a231571e905@kernel.org>
 <20250306-update-email-v1-1-9a231571e905@kernel.org>
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
In-Reply-To: <20250306-update-email-v1-1-9a231571e905@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2025 23:44, Dmitry Baryshkov wrote:
> My Linaro email will stop working soon. Use @kernel.org email instead.
> 
> Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 29e1a423eee5bcf9df7938aaffe5bd3e2f6a2bbe..b3a67e278a839fa14d1329a249ecf4bbec00c26c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7459,7 +7459,7 @@ F:	include/uapi/drm/msm_drm.h
>   DRM DRIVER for Qualcomm display hardware
>   M:	Rob Clark <robdclark@gmail.com>
>   M:	Abhinav Kumar <quic_abhinavk@quicinc.com>
> -M:	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +M:	Dmitry Baryshkov <lumag@kernel.org>
>   R:	Sean Paul <sean@poorly.run>
>   R:	Marijn Suijten <marijn.suijten@somainline.org>
>   L:	linux-arm-msm@vger.kernel.org
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

