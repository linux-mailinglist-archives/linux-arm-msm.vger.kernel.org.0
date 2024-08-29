Return-Path: <linux-arm-msm+bounces-30033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 783FC96454D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDD221F27F25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8921B81A1;
	Thu, 29 Aug 2024 12:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMivKrAO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4931B78FD
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 12:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724935502; cv=none; b=nr/mbIZYGk0wNuQ48OCjKrhfmAvDoQqEX1uAEXAwS87T7w98sM2uD7QaMkY5UP8Bvnh3bi1hCmt0foPi9pYh+uVI6xNwhlUE1tth3T8nTvN4HwlbbqRnCW9nCoTz7sV7j4wbhgli2PcfSX3/RReQUoAlgYnHCix3XmjWOXLx6RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724935502; c=relaxed/simple;
	bh=lAyUNQC1BrAevFWLW+Tb7p0jCiYO2aEQ4jVPooiFGUg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aSlkDE1x6x8vRc2QfHn96p4+7hPBcuSJg1Ko/CbEX5T80OoFdVel6QkpH5owU5/lnp9xDK4V3Ltoc03whKrTL7xSHyBSqOozcpdRjC5rIBMmh9uBs1PKoiyadJOdtpdEBUjLLk+ks5DONnYJ/rwV6FSXSkfkhWg9VnRfIvyRFO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMivKrAO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4280c55e488so3722925e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 05:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724935499; x=1725540299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rtMH+akhal/GfxoqQX/Qf4qfRWmlPtHHgQWOGEYirko=;
        b=aMivKrAOmJ+Yi4ZsT/VQw0oB5O7Ki0qAl/QgwJwt+5NhQ+ZQJBhpYd5OWtbCeZloYk
         qBlKAfBs/te2GQ9hYOQGM10vDvK4SAQym944Y3zrW9AAMANJAQ1Hkx8pg7YsftupQ4Mv
         iDkrNbmVEJbn4Tq1y1hXpPztaCDNL3BQE3GB7qZo1MbTU5iaaj6eOzKKuj7xuj4ormbM
         qKWY+F4Vt9a5FTsM9Pj41Xi7yNMVjL7hzgb/SSisqCf4xliUINSpVsjGbnf05zTsaoFe
         Y0B2nQQrEce7x0/1YXFQRXsk9ewfHFe2xNRAt4WIj2H4yew/KlHRMNr+o9MIxbFdKPJX
         wW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724935499; x=1725540299;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rtMH+akhal/GfxoqQX/Qf4qfRWmlPtHHgQWOGEYirko=;
        b=a1Llf88GyEfmPvsZ7226HaSc7D1QdGRQVU4C4SJ0AvJBJ8+BMn8c/gy/7Keq41B8og
         2vYSgnwkOoQqXv2BKd3JKbyzM9iPqsepvhT/28LFAAFBLjw0+XjyjYvcPuepuUxUaZLO
         7aYWszy1zpDEh8Co1PDJqefFy061xdzPlMw7SlRyWU1gpK5VFki1iIbToZWS4QQ1QxgZ
         IbGkf2p8Yo5OF6zbbsowEU2GkiD62yeS6EH6CrcEZuyNR9SH5gnqMbj25X63DoGur27Y
         fbw8ET05ZtB2XoL4gZdDoh4hHCVGk1YA8MD8/f7VbaYzODSplZgNCgz0pHrFbv3gAI3a
         YbWQ==
X-Gm-Message-State: AOJu0Yz/BlbJj/IFwhiqZhAnXJ58f9M/6DdXCS1fTBphbC5uUhniO4uo
	0T4gH4RXEC+YvU46o/SFP28idzu3BsOMthgbayEoItiCQ7sWpUwKPe/uwetL9lE=
X-Google-Smtp-Source: AGHT+IGeT4rft5Lj8StTBwxhHo9OpatPKnGlCTd1R3Rr+6vjJhVC3oQekPWWI8usU/gQJDy6ExgAeA==
X-Received: by 2002:a05:600c:3d16:b0:42a:a749:e6 with SMTP id 5b1f17b1804b1-42bb74403eemr13081765e9.10.1724935498222;
        Thu, 29 Aug 2024 05:44:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915? ([2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efaf8b8sm1346845f8f.91.2024.08.29.05.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 05:44:57 -0700 (PDT)
Message-ID: <c3fdc127-21d1-4f5d-aedb-542e5ca34df8@linaro.org>
Date: Thu, 29 Aug 2024 14:44:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 13/17] arm64: dts: qcom: sm8550: change labels to
 lower-case
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240829-dts-qcom-label-v2-0-5deaada3e6b2@linaro.org>
 <20240829-dts-qcom-label-v2-13-5deaada3e6b2@linaro.org>
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
In-Reply-To: <20240829-dts-qcom-label-v2-13-5deaada3e6b2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/2024 14:34, Krzysztof Kozlowski wrote:
> DTS coding style expects labels to be lowercase.  No functional impact.
> Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 162 +++++++++++++++++------------------
>   1 file changed, 81 insertions(+), 81 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 9dc0ee3eb98f..0a506ce4f43b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

