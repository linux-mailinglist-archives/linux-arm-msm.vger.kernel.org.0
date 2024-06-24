Return-Path: <linux-arm-msm+bounces-23881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9269143FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 09:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 806AC1C214A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 07:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62B049627;
	Mon, 24 Jun 2024 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MTYUAtWI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C4647F6C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719215799; cv=none; b=ONcsH1VFEs3vPYztXPQpOZxm05Q62r7c8dOnOC8IE2h0up6QHgsuNqWSG8rUjwMRCbTKFv79YRBS/6mPYz1uRpvpQ6ZX6nEG7LH254BqVc8y+lmcnYSqEjuHkWoTUxz88Gzmjb9o78qYUyUOxMegK7efgJT312L9jStoY97d2OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719215799; c=relaxed/simple;
	bh=ZhGDo8cXsdmWgdlNHJfJ8MACqMu6lnyLvjl4GWo+aNo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=reddC55G49XRmdEg1kMwBY8rvYiiNkBUup+Y2+NayVfTJdFJUafnSztQQdqPt5zNyDhapAFYyxRQyZs8Lz6vqJy4IDNoMDwFbi+bcbViuWhJN96ImARlNAq2m6/jGkZjBkSevBqUjcSs4FjUm/j2EVKE2QNnltqLxZZ9OMwj/KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MTYUAtWI; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3627ef1fc07so2975567f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 00:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719215795; x=1719820595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkAZCoR1EAxHYyMUSyL77CxZBsg/gsiAFxg+O7Lf1wE=;
        b=MTYUAtWIZPkdidfXhufsPevB+toBMVMAJ8EmkzzUfZEDOwuAcuWj3+yItCi2V5RNIM
         8nlHspmnbkuomP0GwMWvQyCLPKHIdTxbdTX3IFxZ8vhRaEFuIsM4dTDm73U7PIMn1WJH
         1vv+gisIRdupyJ79Vl44L+fen6au4TpyjgowDgBgDDEbbK5v0QrvVTYJAG/eS2Wx+miK
         eLBF1Q/xWeR3Qw2JQ6M+A+fmIxb6Ley4gW6ydYOgXkfDgpTMXHcclkbbEkbJG3GgEUv2
         Wcd1lWdzrmWkA2958OPniUfQJ+oLlPqOFAJJ04eg2qdO1Jz12pxQHoF+aQULcGa9xk8P
         pexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719215795; x=1719820595;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bkAZCoR1EAxHYyMUSyL77CxZBsg/gsiAFxg+O7Lf1wE=;
        b=h0zqsEI0HfAJ5QanX9jUP6usABlU70qBn1hntVCOu7J7xFNlAX0mofP78Lkn3otpGl
         T1XWzH13gcBkmsCm5ByyC2e5TbAVQ+GPyU2G5AubWNUaXBZ5Srx/7DpmfSjeIEuJ9Q/D
         Q1DaSl1JfWXbwNdDJSaYjWXX3nN9Td3QdlFk2mPfED6D61Tp7EpC+hDy3C9RPHNuFduO
         Hu9HEmHaLRasE+ZIlQ+TINx3fRWEuRa9yo/IA2yLyBZSrMtWmpXngr0GtmLmLcoz8Qd6
         GWQhrC9dA+X5HgwznFLspxe4GdQ/+ee0q+hebjz5p9QU8sFNvyWPBRp2fSDjiXZgSGGn
         VBkA==
X-Gm-Message-State: AOJu0YxxDEZClsck5jBkerfqcklNlhqZVHwojiCzOiOUwqdEv1kTn48J
	vNPSrqdqn39FCpZLazp54vVARV6SOT+hOJxGzmuz5v4Yw0vHfLpDFAhkYEO59Ig=
X-Google-Smtp-Source: AGHT+IH5j/Ekjx/L85BTArhDYmuRCO9srSTxGbIrLpKT2Z6tyiKEDWQFgTXYpWagliPQeNJVMGiszg==
X-Received: by 2002:a05:6000:1f88:b0:366:ec79:661f with SMTP id ffacd0b85a97d-366ec79679amr2370670f8f.48.1719215794728;
        Mon, 24 Jun 2024 00:56:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74? ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0bea05sm163671825e9.18.2024.06.24.00.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 00:56:34 -0700 (PDT)
Message-ID: <754a6ad5-f093-4426-9d68-3556978e1d2a@linaro.org>
Date: Mon, 24 Jun 2024 09:56:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/5] clk: qcom: dispcc-sm8650: drop TCXO from table when
 using rcg2_shared_ops
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
 <20240621-topic-sm8650-upstream-fix-dispcc-v1-3-7b297dd9fcc1@linaro.org>
 <d508f8e5-8303-4f84-83d4-d63f6c612a02@linaro.org>
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
In-Reply-To: <d508f8e5-8303-4f84-83d4-d63f6c612a02@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/06/2024 13:01, Konrad Dybcio wrote:
> On 21.06.2024 4:01 PM, Neil Armstrong wrote:
>> Since those clocks are using rcg2_shared_ops to park on TCXO
>> instead of disable, no need to have TCXO in the frequency table.
>>
>> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> I don't think that's correct.. some hardware can still run with the
> core clock @ 19.2 / 38.4 MHz

I agree, but the same table on other dispcc drivers don't have this TCXO entries,
and the OPP table in DT neither...

I'll drop this, but at some point we should align ourselves.

Neil

> 
> Konrad


