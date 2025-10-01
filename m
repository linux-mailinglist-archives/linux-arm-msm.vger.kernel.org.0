Return-Path: <linux-arm-msm+bounces-75651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A10B5BAFB26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95CA01C1BE6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC1228371;
	Wed,  1 Oct 2025 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eHmDvwlh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3B919F40B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307952; cv=none; b=QaqCZ7MWdBa5wLY/eRX/5DyyVWY6Kk00m/QKdRQr6VDzj1hT854v7CVl6ArNZW7h71pJhhZKRzvsIakNYszLnWC48S3B/hmxHoJPR9n9Kmg8y3v5x2VvNRTMvatqhcczfID+6/7PkTCSX9jJUg2mMPhe0LwfF5zTZ2rHYE2CnfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307952; c=relaxed/simple;
	bh=34z8TKBxNNfyGXYlesOl8gVHHvcdvVpRaMlcgy9wB3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWS4S/qKSxVN9Bgza0mXmVFhm8VRS23Bde9SipP9hDf5cX0Su9k1Nn7bLsT4gycl/jQob7UDkJEzirKKC9zoGmBP5P/JqJlideVw5g1T8+z6cYGwL+vrBPllWpUWISrN9tmQU9k9hamWrzaTr5lz9mINJx2v+7zJXvr1Tdt7lp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eHmDvwlh; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3fc36b99e92so528813f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759307949; x=1759912749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCTgTfue23R4yaOrFb9ybWje80AchWn0YqIMIdLz6FE=;
        b=eHmDvwlhw2vzDQPZ+12heWy6ZXU8p9l60vfCBnxDw5mJO12AprOwF6zcMyniQD8wTk
         z2RxXM3r6Hqg64FC0CypxAPA4m4dJmKCLqaUGD142/qxk/Nj87CslTT5V432ckxG/y48
         MjM8VwLezHujPsilUszZbNJtjjvex1oh25KTPc3xCPdK2rNVXTwuQU41GIu1LcNIVlvw
         fLExXiY+8Bqa2FLYk7it2qNcTDGTsFp9zgkZxjaVO10ECb5VSsFs9cfSn9nKPhNHRscc
         p7caW2FmF7oPqI6iOMnhbDmiqL7USTyrewVoHKtDkUeXHgLz8H3o8QXaDh3K9yg9RCU6
         +rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307949; x=1759912749;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zCTgTfue23R4yaOrFb9ybWje80AchWn0YqIMIdLz6FE=;
        b=VPewU9DRQoLsuqHzWJYHQpfJ6SnJiKbEDfAeKPDRysR9aEmbEeqbFfR4X2g8jGsFtM
         ucLhgvDsS/XfYnVW5tbbAwZMahAMKOOO9ugRb4X1j8c0CFM//EuDlC3M20MYDkUbnLOP
         qZXGhg8Xlo9jV/jscrEWApbNwNOOHzuvULy9YL6/UQnjaCDLLW/CSL3rstT6GMV9LZYH
         7b6CUCbJ//xdgpd20L1ajsInPqbr3ZH6YP/LpaZy8Pm5pjr1y7K9VZ8J4n7UWzJd7blw
         bZD3fxoMmvljM8QeW2VHPXpw1VEwJyPX1IalyQF4okygM0kbWc+BzJYj8bbip8gRfWSE
         BGuw==
X-Forwarded-Encrypted: i=1; AJvYcCWXBDvs9+e5GnGWRKYeM/gOEtYUQ60hSR9HDIy8BbjC46PqlB07R6noj5gS0eO8eMow72O4eIvbWTAtjqzV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7f3QBGSnV9z4z7SXoop/CIKsFhtK+fhi6DchjzNOgrlxHxx8x
	dM6wt1/i1phDVCXdHk6K5l5rMGk1um700ALjoVxIXLxwRYfn1rZQgb+wjpMnan8N87A=
X-Gm-Gg: ASbGncsO67tJVLY+vucHYEHDnUrrhyPfuaQXSS3KRxmMojhCgNkxB0GbqT2hEzh+aTB
	87EPV2699U0YdsxRYmn57oaxoozHt3vGQ4zfTFurIePiTYdNxt8F0qqPyVAinflxaqEQfFalHI9
	gWTVlbyRq8Ndv/xUfRJuYR5J7IEkYUxat4vrqEn67Zvyi3p31ncb1E0Lk6oup1oKKuXq1MszJzt
	zN2V6YteQ+8PrNds+T5xTHBv1FsVsxPITU4rP8G8aBCV7YMIRnGwE9VAc6mOp0/Ir2IR6XH+SYD
	FqQMGsnjm+xqKFA5ShROgMC4il0oryASRiyeq+0751MbXFTtWNELtc8/WQXSWOBx7sFCJdXF+W0
	ZVYsD6Y1uPnsr/qPkkWlcCsEpfZCjf/AGyr+V+7cMx/vGKHwgzrALKur7ApQVw5JlEwGus584oO
	IsfI7udWxo1GpTikOBYTgt6Hs=
X-Google-Smtp-Source: AGHT+IGm/mLJsRK7kBe5ekjqKSsxSCM8B9iiIVyHDmsGInuaLbxLzmbW+1QwwhIPIWQgKg9zYJRPzg==
X-Received: by 2002:a05:6000:4013:b0:3fc:cbfc:fbee with SMTP id ffacd0b85a97d-4241111f7demr5393668f8f.19.1759307949119;
        Wed, 01 Oct 2025 01:39:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f45f:c590:9006:d394? ([2a01:e0a:3d9:2080:f45f:c590:9006:d394])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc6de90desm26516197f8f.47.2025.10.01.01.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:39:08 -0700 (PDT)
Message-ID: <b2538934-bda7-45e1-b368-8dc4d2c6f71b@linaro.org>
Date: Wed, 1 Oct 2025 10:39:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] Add support for QC08C format in iris driver
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/19/25 17:47, Dikshita Agarwal wrote:
> Add support for the QC08C color format in both the encoder and decoder
> paths of the iris driver. The changes include:
> 
> - Adding QC08C format handling in the driver for both encoding and
> decoding.
> - Updating format enumeration to properly return supported formats.
> - Ensuring the correct HFI format is set for firmware communication.
> -Making all related changes required for seamless integration of QC08C
> support.
> 
> The changes have been validated using v4l2-ctl, compliance, and GStreamer (GST) tests.
> Both GST and v4l2-ctl tests were performed using the NV12 format, as
> these clients do not support the QCOM-specific QC08C format, and all
> tests passed successfully.

Sorry but this means you didn't test the full decoding and encoding with GST and v4l2-ctl using QC08C ?
So how did you test ?

Thanks,
Neil

> 
> During v4l2-ctl testing, a regression was observed when using the NV12
> color format after adding QC08C support. A fix for this regression has
> also been posted [1].
> 
> [1]: https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
> Dikshita Agarwal (2):
>        media: iris: Add support for QC08C format for decoder
>        media: iris: Add support for QC08C format for encoder
> 
>   drivers/media/platform/qcom/iris/iris_buffer.c     | 17 ++++--
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     | 15 ++++--
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 21 +++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
>   drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
>   drivers/media/platform/qcom/iris/iris_venc.c       | 59 +++++++++++++++++----
>   9 files changed, 152 insertions(+), 33 deletions(-)
> ---
> base-commit: 40b7a19f321e65789612ebaca966472055dab48c
> change-id: 20250918-video-iris-ubwc-enable-87eac6f41fa4
> 
> Best regards,


