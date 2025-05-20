Return-Path: <linux-arm-msm+bounces-58620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A03AABD0CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D7404A646F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E6725DB1D;
	Tue, 20 May 2025 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xEEKnTT9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947D5254AFB
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727206; cv=none; b=XAevxP/WD24YAqy/Y2O1bIwAm7TC4/I7piWYo+7IpMnq4QzgSnJ03PnYFL8d+TC1gs+qEosj2rKQ6DU0mqul9RhiUsJV/wySRg1yuPnwDqZHhfX4K8IDU4J1BYgPJRioZuyKacsrFqdv50DpMwc49DPVC9cNeWCZ/di4mCYKe1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727206; c=relaxed/simple;
	bh=TIHtYGUMOULnkpoKEoExk/NEZ2E5O1RkMvYZk27lASU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=q6yDobl0/gTRErf8fUkz/VtQMJt6NTiOfrBrODCXygGhjoBhGfPi0RxvZUQswOtJVgkfuCtzP0ck0vWyjW5+aANU9TfSgjiwzhxEQVRk1bkC7w37psm0WsgcJsBFwBICjliFhMNqTHTg+92JWhsL+FlNkpyZoGumzqZuvHLszyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xEEKnTT9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so3406703f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 00:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727203; x=1748332003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3sJla6lO+Zh4iWdiG/Eghdjzo+ZGfKU38pJQVr9CAw=;
        b=xEEKnTT9WOHr0pAvWO80kzI1LlpRTxIoDlwYIZcWizlHeH+QlHZu23xpY1ciV98sTC
         qpPjeFxll+s/zQbR5oe4VE2gbMahclKjM7U9QDDRWx2WyFt5Q4/DQn/NsfxftXEd4MyK
         k9jOJefm8/NuDUvv1aSOM/5oJwQV2EfQPC12aRxtHQuZau61qrwBH9C6qBQ9b2CXaNBC
         VOXHNkpf6Gr92IER6OX7bjby7LNLu1ZkyTJqhxRLh7uvSShNTxqfqcJTn4imitUoJdMJ
         poay75hxsyk0X6MkZjAypsi3ctjKhdyrhhfRS99v/PsR6soQSwPPSn0V/H/q6WU1iBio
         4Tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727203; x=1748332003;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E3sJla6lO+Zh4iWdiG/Eghdjzo+ZGfKU38pJQVr9CAw=;
        b=hAeIIFaoccPr7QMXFl3l3u/F+qaJ4PgPb6aEyVTbxe1LXv8XmtAQrPDtaDMhJQmHwK
         9oNb8uI2D0QKtCHEeZxmPo22Nq/B1BwghRLw76ak+VN7A8xmldanXSxzCgmpq2hr68ZR
         p6DkZh9BlQnt9KF8XBXtAR+/ZuPagTNLFdDhhVUCC/Vfua9n/sYA+j98eTPLBel/fi81
         yheqKbCF5Z+fXU3qDC1KwNTvmeIDS/lGspnrhj8uPeRFhwllYFAlw7KXc8iQiRmmHGEv
         W/ZMpzOZLNl99PVb/h0WiWNtdYW9M9Mv5v0sro/lk28ybVjCLFRxdjZE//qZiuhZaZqN
         c8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWmh3x/zApsrr5ao7nvM4gO0VpoajisKrKseB989qIfqquD6yKNP54x+w7jC+SExKMtW4SwHtfboJiSLn7G@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+8akp3ZRKP7eHsBqrI5WGJDPXg4Z6O2oRhvUH345yfE2PRVKx
	ggwdKMnoG/MJdBptgWvHydsfVq0MA7QDIEbC8HicncuNH1mxbuRSYvGsnAqUuXWiFMQ=
X-Gm-Gg: ASbGncvOV4EYOifNB12LSYlKHMJ43y81cxYPMoSPoeXo2hyFEgGDnbFIky9gwo9Vs8z
	D5C6pNqv7H7Io3JB17QvuYZprjof9wsfZdKe2VDhCn6cAtTzqvf4xrp2KigGob73RZcsJcSpuCG
	kbHQWP+VVLWqXefS5uijQG8e9gHJYjQk+mzBhLxQydUSFRK4cVkgM+ve0iR3jwd5byRJZmNr6f/
	o2uXFIzakkyTY35hq3jS1D4fgmf0Eudcbe5UM1I9lBMPtpw8YPEGOWxGZ7KF6eubRbBMD/uvaen
	qj2rztXLy5uUfJykBVRGa4r0VJtIVYn333IfvVPKgkx12D4f472xErNoyic6wC9P7PglIQyfFbX
	ySPW1tAZz7XY4ivtGvBAgzNyNXrrN
X-Google-Smtp-Source: AGHT+IGmsi2aTmODGfRQ6buDSs2zH8wP80gyFSvoSnkDQ2WGtWGW3UKDEipoFt4fsSwcfkNIPTXRtQ==
X-Received: by 2002:a05:6000:178c:b0:3a1:fe77:9e0b with SMTP id ffacd0b85a97d-3a35fe7962bmr11577222f8f.16.1747727202880;
        Tue, 20 May 2025 00:46:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d31fsm15146058f8f.6.2025.05.20.00.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:46:42 -0700 (PDT)
Message-ID: <497f1d40-4d8c-4085-b9ba-b06d8f5ef46d@linaro.org>
Date: Tue, 20 May 2025 09:46:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/3] media: qcom: camss: csid: Stop spamming logs with
 version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250520060310.7543-4-krzysztof.kozlowski@linaro.org>
 <20250520060310.7543-5-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250520060310.7543-5-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 08:03, Krzysztof Kozlowski wrote:
> Camss drivers spam kernel dmesg with 64 useless messages during boot:
> 
>    qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
>    qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
> 
> All of these messages are the same, so it makes no sense to print same
> information 32 times.
> 
> The driver does not use read version at all, so if it was needed for any
> real debugging purpose it would be provided via debugfs interface.
> However even then printing this is pointless, because version of
> hardware block is deducible from the compatible.  Fix the code to adhere
> to Linux kernel coding style: being silent on success.  For the same
> reasons this should not be even dbg message (see driver development
> debug guide: "In almost all cases the debug statements shouldn't be
> upstreamed").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


