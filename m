Return-Path: <linux-arm-msm+bounces-61482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75780ADB664
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 18:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E745D173201
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 16:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196AC2868B3;
	Mon, 16 Jun 2025 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AmW5RMKV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01392286884
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090424; cv=none; b=A5ZgepAg6gnwf0t4h9iQHagcKDSO/EiU3foUO5hLbY7+OBp5k3rY9e5Mc0/ogi+y65HMCy9qOURjNeABWwGRDycWfM0jhi1/PDhAfRKS2f5qmvl3jbUZSVMJ2YDgWHtZdUX2qO7gJVq8e65Tk5Gd6sFJecaeElxKy7MA+AVdCWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090424; c=relaxed/simple;
	bh=HpE/pDLZnJwXNmha50ska3/wWNk6nXBAIt8OfLs0uko=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lSauCaLu/6iq/H2FkrDDz3dznfUacFRea0T1m4SgX0jRuirQYvtVMOKjLA9a95ffAWPyAHIhq39d1H9lCccls2+T3Jfeg8lFbLWDLpWnWClCxAm+xvYNm+Ua6nH6+mqQdvNRCgoMw+RYI+L/O+ba9sWioKewJpdiF9l9HnsHhFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AmW5RMKV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4531e146a24so29347825e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 09:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750090419; x=1750695219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99SgOTZRzrg5GY1SDbLEkgEMAQ6XuzTJfRbX4aCiC8A=;
        b=AmW5RMKVzkl65Jk6/Nify15j+icAnXwQAZs22vP0r9vK802obVI8snVMdUiEvKMQsP
         Zd3CSnj7pO6Mw+BKmgGcKecJV0VsSmyguFaoGt9B6rsboV9opmKaGQ0ocg6cAFmlcl8U
         fJSJN84aW1bfj+ZbmR5FY/t1Ij95E+Ieu/x9qjfEUnzaWtndrm7Dv4rPvexMRPpOntyH
         EljX48UcU3EebrJmr/579SgFDPwUI2AMFzOhv1SNeuqMUy6klaclE5n2WYFdrg1pjjfr
         K/xcux3u5WBAAe0P1nNyQpx4Uk2Q7uJZn1qICWFBfOnIz0qsvYfSyKZL+8uy87+FqmWQ
         uTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090419; x=1750695219;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=99SgOTZRzrg5GY1SDbLEkgEMAQ6XuzTJfRbX4aCiC8A=;
        b=Mc8jqbvd5Xnbg3jmOj5EVBKgMfLdWAbrYP76jwByo2WpL37mUu8+vRVsDkNW0LIXPc
         7hbqt4ISdintdtAzST+6rEV731JPnu+k/mtGl0EszDTy/NXUErSGARKU/ZVIu0J4Xcke
         f6TMUnJVAOVw87YiTIg0XcoXwAz6E6nIhTGOVqi8g/ccmCE3/zffCjoU1jrv30OjT5m4
         Au6P2JNgMR9FdVTJaWR6dogAKWss3U0n3eG+mV3HN2bLQKXKWFMPFeaBZCLw53cGxTDS
         nbjDVetgm/RenIb+pOnxwZFEO7CClQioo+HiYH9EO686qg514DfvZpaLFfxpHF4qc32F
         7MEw==
X-Gm-Message-State: AOJu0YyHQC5cbvUwt/mTxjjN/BPudqye/5EDHmv5p6W7vQe5k2ZbvpEg
	fdJt/dmwbTjufDgYmNtXmN0Wk1BADv7m8rlcGrrk2J3jquYG4sh/cZ9dvSPT8Mu7cX0sWgWp4U7
	fv6SeT6I=
X-Gm-Gg: ASbGnctiuY3PG/lZfrhbcpOvocCuXuVXujI6AQcwAyB1J+OvBmMqWEO/qlx9pYLngnX
	uq/vtLyJFKPowB2OKQKGjYW6F95t95Qx6m/36QPAuZypJZkZy1NpNcHDSsTzJzyZyFM9v30kcHi
	uOzZ3PlO8FX1o9myaPixIaJWphZbCJNErjE/ULE8v/3H4Wwx4l4vd2qNicluDDYme/c3zrcD4SH
	RTSnpWWYUrBJO0S5xCm1/fwFLMRZaaQ7ejIkdg1MrqWtB/P5FrWigJYOhjsl0Hr/Dzp+eG4Hwyu
	DKV1+pmYxP1JrbV2iZw2H+06kfUwKIwnNSKMd86w2PQ4XzjHN8Rezj+0PQCQFW7hvM647KYvvan
	8s6edfAg9suX/v+15gI1DoNK1bTzj/zxzTtEh
X-Google-Smtp-Source: AGHT+IG4DpXuO0yRjlobR/oruI8mfncT7fekLlNeBTCV8c8EentzOqtU302pXbxayRLtEJaxzybOJA==
X-Received: by 2002:a05:6000:144e:b0:3a5:3b14:1ba3 with SMTP id ffacd0b85a97d-3a572e58cc9mr8196351f8f.49.1750090419360;
        Mon, 16 Jun 2025 09:13:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:6c7:97de:65a8:488a? ([2a01:e0a:3d9:2080:6c7:97de:65a8:488a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2324c6sm146860555e9.12.2025.06.16.09.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:13:39 -0700 (PDT)
Message-ID: <3beb5a02-8a2c-495b-b5a8-ae5e90ae6a63@linaro.org>
Date: Mon, 16 Jun 2025 18:13:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 26/28] interconnect: qcom: sm8650: convert to dynamic IDs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
 <20250616-rework-icc-v1-26-bc1326294d71@oss.qualcomm.com>
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
In-Reply-To: <20250616-rework-icc-v1-26-bc1326294d71@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/06/2025 02:28, Dmitry Baryshkov wrote:
> Stop using fixed and IDs and covert the platform to use dynamic IDs for
> the interconnect. This gives more flexibility and also allows us to drop
> the .num_links member, saving from possible errors related to it being
> not set or set incorrectly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/interconnect/qcom/sm8650.c | 676 +++++++++++++++++--------------------
>   drivers/interconnect/qcom/sm8650.h | 144 --------
>   2 files changed, 309 insertions(+), 511 deletions(-)
> 

Runtime tested by comparing the interconnect graph before and after, the
ids are now dynamic and the labels have the node name, apart that the graph
is the same on both runs!

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on QRD8650
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on HDK8650

Thanks,
Neil

