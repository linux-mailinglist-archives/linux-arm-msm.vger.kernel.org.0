Return-Path: <linux-arm-msm+bounces-8438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FA183DAFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 14:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50BED1F239AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 13:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D95C1B946;
	Fri, 26 Jan 2024 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tdQmU/ek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996521B943
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706276126; cv=none; b=VECeQi/8CIoxYIWpEBO+RLG1stTj2mnM/3uPCCe/+sltgQn0xnC3u0tM5nw+bgfxRlRc2N51DDG9FBuQR+39NylU1audSVBiZ5z98u1VqjF3T7/SfPA8YZfwp/v2iltMLvdPKuwPcAtjLO1OhcK3XracGH0l/WCY3GA0zVh2OWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706276126; c=relaxed/simple;
	bh=zeR8yYoTsYv5Z7vooR68zM3B6n+B9/G8N/V1UYsLVWk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=FFxXKpC/BKB6lKG5W5Hf7H+AYQwO/tiHqb1pxR8FltYf0WYP2cE2VFSZXyl0tqVjW9tLk9Km1Q1+8XNY7N8yGFD/Wy5t099hzPTkOwcgVD10cRvT2CK+AcqPZwK5qbqo3g0eK3oQWfNEMQIWulpbBpK8rEl9xB+rVjBB2ClJChs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tdQmU/ek; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e80046264so10607465e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 05:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706276123; x=1706880923; darn=vger.kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9a5bBdyFVhJIwedix1U39wl9TOtCRTgVWMBfmVGZGQ=;
        b=tdQmU/ekLZ0y70rMwg6zGjLal8ytJfJhx8WCC9jSOZY/ANl/r1qqXQhdocPE774UgR
         sLKFWinTsJDRuYPxy2aIz1ieJwP5gTtKgdspmc9zOHWVYzh01bBi60303aM0H6eyCx4Q
         B1ITjh4i3mi7V+z1r1NhWzqoAIy4udp8x+UeWH85mQPrbkSj+ngjqPy+o6PY9ojcDn95
         ZLUyZpdBLXJLEVO2NcS7ehvfO9uiCXg7FlRXjVbxs1EA0B1JcfRKF+FJI727jbXa3zIm
         BQLoogoNDr4A6KjcBBdIn8a4wZepj4RrfNgtRrAEuslIbRZzycu45bTzPWo204j3Rt15
         Le9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706276123; x=1706880923;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9a5bBdyFVhJIwedix1U39wl9TOtCRTgVWMBfmVGZGQ=;
        b=WAgS7KNYA2Mq5XTwbD/NOQcDW2/eKrhVJoy6F0a2c9SUEgpkI+S/9G567dBlaEs2xG
         kPCrdncbD+UH/y8Fk5bHknUIsfauD4K8/6SdqsqqrHi10EnSqJr/uT43onQXE5xdhTWc
         LFuoKl/6BOXRR6ODQHwj3kbQUtODxfU2rjRyYwgMd19RgR6JM6YeqQXO7e7vs9LQBvE5
         T2r3v3J9AL30458rc1Y3z+NnB9cVpB7Oh+MA4uoSy8lHWAdupeuKgDLUpi9gxGyAvWbq
         WG+t4SBI9/EKUB+6f6A/aD110OAak75OCr5drXwJaxJYQ8G/vk2teGq3LQrqXKMa/y1V
         B2NQ==
X-Gm-Message-State: AOJu0YzBKSYUDHiMLBkD0Kk/+xY3oaMEV5sdt0CWjjFV5OLfELoBR3hA
	uvUewn2YxHhQxqkKzbriUwNkWRSEIPct7ZAGBgMDSODnAB7xJbF1kqjjTqXqTzo=
X-Google-Smtp-Source: AGHT+IGRHnqu89a3/XRm7EvLaRhopFG61nVUf1pw5Lt73M+Y/fLSzI+TrLXyYBqXjsjMEQbYXLHYow==
X-Received: by 2002:a05:600c:248:b0:40e:ab7f:3448 with SMTP id 8-20020a05600c024800b0040eab7f3448mr894814wmj.144.1706276122772;
        Fri, 26 Jan 2024 05:35:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b66c:951b:e9ef:af35? ([2a01:e0a:982:cbb0:b66c:951b:e9ef:af35])
        by smtp.gmail.com with ESMTPSA id fa6-20020a05600c518600b0040ee8765901sm147536wmb.43.2024.01.26.05.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 05:35:22 -0800 (PST)
Message-ID: <465420cc-c40e-45df-9cc0-80244fed7bf4@linaro.org>
Date: Fri, 26 Jan 2024 14:35:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Add Audio topology firmware for Qualcomm SM8650 MTP
 platform
Reply-To: neil.armstrong@linaro.org
To: linux-firmware@kernel.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
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
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The following changes since commit 0c40df810685c15141413cee5bea7233e1db43fb:

   Merge branch 'consistent-file-spacing' into 'main' (2024-01-24 16:42:17 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/neil.armstrong/linux-firmware.git sm8650-mtp-audio-fw

for you to fetch changes up to 85d372744a19cf78f7437c6027d7037baa0f0a52:

   qcom: Add Audio firmware for SM8650 MTP (2024-01-26 14:31:24 +0100)

----------------------------------------------------------------
Neil Armstrong (1):
       qcom: Add Audio firmware for SM8650 MTP

  WHENCE                          |   1 +
  qcom/sm8650/SM8650-MTP-tplg.bin | Bin 0 -> 24296 bytes
  2 files changed, 1 insertion(+)
  create mode 100644 qcom/sm8650/SM8650-MTP-tplg.bin

