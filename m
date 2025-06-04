Return-Path: <linux-arm-msm+bounces-60223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED69EACDDEA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 14:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ACC03A442D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 12:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B875322A1FA;
	Wed,  4 Jun 2025 12:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G8voyw2u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B1D28ECCD
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749040173; cv=none; b=CDqgvWNRwfM6rutCbRjZjnh64xXBCNv66AuwLjaaE52T/crDhmZF7UoEHacYm9l1uyThh0+QURH28EWpBPbz5TiJ7xBkSAeTnDEVi/uw5Sp+2yP0iXKaUkLIXZYngTIn+rnocnWVGMt3CFxuWz1dy54jSOyO0O78Z9KDZ627SMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749040173; c=relaxed/simple;
	bh=jJAJ2zNRS4Mcm3SBhX/rRP1UzssTd1Y00hBueZo4LTs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=J00PCdGkSJ+rm9kNQmvPSacec6oBfMOtfSHglfKOdgyZZbeiRTeLGK7Q6sy3mfgF2xZGUrHCwRFzbeJUibpw/MS4dgRdyuGMGY98bQke/jX17j1P77uf1LEqsx59k5L/uJJurKK8qIzZr5rLk8g/GlSNVCfseNDS1i+0/xBfNyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G8voyw2u; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451e24dfe1aso22417215e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 05:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749040170; x=1749644970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlUevRnkRKcLl384cvLF8laETHh3L8+aAG0Z3FSxUTk=;
        b=G8voyw2ucePadkaSRs17pdS+esFxGSwCoQ7WwvdU/jDbAEiYmy8A2j0L9us4J4TTt6
         kwl2BGgcisj7bQGx/ok+U7hkK6+pYDLpXHm0MTdR9IcO/c785JBamvelVyscVSgJRC8G
         +nWv5+TvTX/S4u390QcD8/RHgh79WKxWOgWhZpIinXA0Hwuup2RFFkndgbN2vAH90KcB
         +Ix7nglPjjixuXUyl/4NUo4CZXk5LT/kD8+4tk+h2ZUsb+BKRuQE8+obBboZR/T0p0M7
         5dnxxOMjb/J/G/BwL/6y/yzr4K+uqw2vy5YYvDxNFbrlCdZMvJ7yGur2PHld7JbyASsk
         ASjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749040170; x=1749644970;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rlUevRnkRKcLl384cvLF8laETHh3L8+aAG0Z3FSxUTk=;
        b=CfFT4N9rLhjO+kV2cWoNG5HY+1UCoOV3J2qadpV+Gz9WSaOoZT+NEJ6VvjtlI3D4hn
         HNW38HJ6X7UL6b+GebUMrQvEcdPymWek7lq/wDVmY2d7oPaSiWCEDSVLZ73uqBnZn3yp
         iHHCPF5zLjw3A8PxWONFHyYkv+uQ3131KX5ZtheAVQpOjmee3ppbGmlOcCpAoGYLXkDb
         vSEc9BIoSvBNl5NQPDFNVUuG+09oKjJpPzpWtwbAvk0ONOnAPxXr378OKp+SNgoVeqQU
         lW0VXXsAgH3ElOc2NEwexSjDL6J9HayhLJI+mn2XOD8WqNrlGCF2y+RsLmUF2BJPkSh6
         vaqw==
X-Forwarded-Encrypted: i=1; AJvYcCVpSvTrQQzeLQ9wgmKwvUioTMF4blIZ/1evnWcxMGi3leTEItALI3Ivo9S7mUWind50eAXiiheB8xjwksYd@vger.kernel.org
X-Gm-Message-State: AOJu0YzzLkVe+nkOHRVmTBFSl4yoGLHUJ1fzameHStMGnv8MKkQ9oo/P
	ARyeqJqlJjfmzL+2u4Ryf/fRCQ+4hn/k5ZCLedLCeZEODVKwDHrjKHDuMWslMkfAnQA=
X-Gm-Gg: ASbGncukDpuLhMRcjLUdWlRxHceNgfSWBnwCRgHm9CYjP3Icxtbqo+0VqzcVn2bwhpY
	vhgaJHu8ZsS0ZXRQ1ECzqAg8a2BhbGjjyVWgAe61L16jW0uJI1rOwZDctobHzX4fMecQaYF8XVR
	A1ntguMcHtMnmOCdPA1gGGzWAT0ryxjadpdDLg5vh2IWbbz3DVemrZpzk0FwJEguDLWc3h/dY5S
	By2dGSFx/qykSQAUXwRe6fLOQaf53F1GeGZOUfCQWZystbJJPRNOaVBIOFLCxYFFc/RTze8Jb2C
	SZklnmXJ0gTJafyzfwOMep2ndZ/fCFWvocF9DvnCYtjNjTGMnkqLuncDkfXFPxqg7jk9mlrS1wS
	8OAOiNs3N5z/7s1DPjaS+3ehqVQ==
X-Google-Smtp-Source: AGHT+IFAqt37X/nVv/2RwOdCdcs4UXjT/VL/HCTdp4l4p06zsedWg/2pZgay4ZmFeC40lhzrgmbAuw==
X-Received: by 2002:a05:6000:1a8d:b0:3a4:cbc6:9db0 with SMTP id ffacd0b85a97d-3a51dc49afcmr2088240f8f.51.1749040170100;
        Wed, 04 Jun 2025 05:29:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fef9:cf1c:18f:2ab8? ([2a01:e0a:3d9:2080:fef9:cf1c:18f:2ab8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb7e41sm194312145e9.26.2025.06.04.05.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 05:29:29 -0700 (PDT)
Message-ID: <6976052f-a3b8-48b8-97f5-4fea7538e976@linaro.org>
Date: Wed, 4 Jun 2025 14:29:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] mailmap: Add a new entry for Manivannan Sadhasivam
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 bhelgaas@google.com
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250604120833.32791-1-manivannan.sadhasivam@linaro.org>
 <20250604120833.32791-3-manivannan.sadhasivam@linaro.org>
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
In-Reply-To: <20250604120833.32791-3-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2025 14:08, Manivannan Sadhasivam wrote:
> Map my Linaro e-mail address is going to bounce soon. So remap it to my
> kernel.org alias.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   .mailmap | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.mailmap b/.mailmap
> index a885e2eefc69..1e87b388f41b 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -458,6 +458,7 @@ Maheshwar Ajja <quic_majja@quicinc.com> <majja@codeaurora.org>
>   Malathi Gottam <quic_mgottam@quicinc.com> <mgottam@codeaurora.org>
>   Manikanta Pubbisetty <quic_mpubbise@quicinc.com> <mpubbise@codeaurora.org>
>   Manivannan Sadhasivam <mani@kernel.org> <manivannanece23@gmail.com>
> +Manivannan Sadhasivam <mani@kernel.org> <manivannan.sadhasivam@linaro.org>
>   Manoj Basapathi <quic_manojbm@quicinc.com> <manojbm@codeaurora.org>
>   Marcin Nowakowski <marcin.nowakowski@mips.com> <marcin.nowakowski@imgtec.com>
>   Marc Zyngier <maz@kernel.org> <marc.zyngier@arm.com>

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

