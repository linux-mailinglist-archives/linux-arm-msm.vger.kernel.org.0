Return-Path: <linux-arm-msm+bounces-26339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF3F932696
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 14:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BAB31C21611
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 12:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D25196438;
	Tue, 16 Jul 2024 12:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H5BEX/fR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06C94C7B
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 12:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721133147; cv=none; b=fLpGcU14cS31/CnA/aKPebWP3LD18urn/RnMADiqusrkG3whv/7V1leDwanCLbcBaKaUCxQxMr6YakgSg6E1M/uibFEI8KkiSn5AZ2aq5voVQjv+wFP/9Ew31xLbyLWbSnvlm2EU2SwubM4sg6ei64lRwHRz7FZMx2bjoGfqk9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721133147; c=relaxed/simple;
	bh=hUDYyHJJIXG1UZ87DaeXuhot9P93vZayakoHlriCZm0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZkcdIqvGTaJt6bfgAK+lXSuExihK1yDObvCd0jZGdkMkzUnLI1MvycXvTCp/eI0k8SR77sVStSFh2vB3YxWFoexWQvz/JTfueQNZU77U6NugRgrIvrnhea9yxiHSSJS07IUvCoBHbjKH/5i92NQ/UA1LiWuZd0mlu+qXPe9/HfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H5BEX/fR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-427ad8bd88eso15700105e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721133144; x=1721737944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijoF8pfxVw7rWYN3kMSfuNuBGq85YpSfjs2/lbBUBMQ=;
        b=H5BEX/fROo48vDBgO7yQiE3oTE8J9uaoE86J25dwQeO1hvDl0UXxRUuGMn5DElVj7r
         C2NQMwDW1ACPyTf9ZIr5adY8L+rmAHG7LcBI9nz50YluqUI8T01+CJiyDeBplHSQpjjj
         JazCogb4g35PsjsQ6iCkb1SPI3QiMYxf2Uinj5qY0gmtptgYIoqNQCsYtMvhuKv8SqjS
         N+OmygsbLX4P8jqsRHnypVQiPR1tnnj4rO+b7mPuA9KiuHCVBglRMTdG08fxep9Vj3iC
         lQ2iYGPhftVLO/ZttjSM5+st/s/ATESxorfbIUeydyxJPQCOHkJRN0N66MEdQw3C9xwN
         G0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721133144; x=1721737944;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ijoF8pfxVw7rWYN3kMSfuNuBGq85YpSfjs2/lbBUBMQ=;
        b=OOICjUcMcnlfB3cV49QnT1tueNoBEYuku8Cd0HqZg0Wi3lf2bIGa6q/7DW8lurzciW
         TeCVksCHwrme64Tfo41E9+FWH+klCET489xf+NNRTSq7ct5+y6s+0ya7hJ6oNct3nQzP
         /7FMAaZv+sgX2NRKU4jSowqppYnS4zXXbhKotdfAnq36O1+d8xlVzsfSt5HVxwG97Prb
         pGovfhblf4tNEgLmb7HWFBelb2MCk7rQ8uEtMujT9PCwp9KADU/MV8gZpL948/S6OSMa
         vLR3M1zcDvuDsc07ICFMw5CZMTYqCjKIYX2FqjDFvE13YZL/w/gBVZcsMk19/6voujOK
         Ivog==
X-Forwarded-Encrypted: i=1; AJvYcCVjZRKRqo1uGbf4WsLfFzuWxnR6Njn/FjHU4eOq/iuY0i5c2NjrnLlZnbYZqFGcRMzbUtiIuDjFygKy+vZOaVO4dUmRErBG6Kex6cZ82g==
X-Gm-Message-State: AOJu0Yy+oKyD4l3KuVGGck/QTgDhGkjRQdP856ZtUZw1Tm+BbDfsWuzz
	VZg93ZM0P4GuDUsrvM2pzECrfxaj7iWi0zr3VOEZhhj2p+B05yDn3TNP+qqAzMk=
X-Google-Smtp-Source: AGHT+IFYzylbsNDfa9ZLODfdFiosSmU2BynimU9uq96hO8BVREGN+TLYJkuHzXtG3aCaMSEd8Q4kUw==
X-Received: by 2002:a05:600c:3146:b0:426:5f75:1c2c with SMTP id 5b1f17b1804b1-427ba62bc59mr12316615e9.11.1721133143836;
        Tue, 16 Jul 2024 05:32:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f5ba:a94c:e43a:d197? ([2a01:e0a:982:cbb0:f5ba:a94c:e43a:d197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a0fa55afsm152369725e9.16.2024.07.16.05.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 05:32:23 -0700 (PDT)
Message-ID: <9ad10d92-d755-4fae-b206-6e8648be6d48@linaro.org>
Date: Tue, 16 Jul 2024 14:32:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
 <20240716-topic-sm8650-upstream-fix-dispcc-v3-2-5bfd56c899da@linaro.org>
 <dccttz5b44bl3lwmcaqz6wjx3n4sv3eq4yh6276vzwrtkcvqcw@qxhbo7bylnsg>
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
In-Reply-To: <dccttz5b44bl3lwmcaqz6wjx3n4sv3eq4yh6276vzwrtkcvqcw@qxhbo7bylnsg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/07/2024 13:20, Dmitry Baryshkov wrote:
> On Tue, Jul 16, 2024 at 11:05:22AM GMT, Neil Armstrong wrote:
>> Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
>> and byte1_div_clk_src, the clock rate should propagate to
>> the corresponding _clk_src.
>>
>> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/clk/qcom/dispcc-sm8650.c | 2 ++
>>   1 file changed, 2 insertions(+)
> 
> This doesn't seem correct, the byte1_div_clk_src is a divisor, so the
> rate should not be propagated. Other platforms don't set this flag.
> 

Why not ? the disp_cc_mdss_byte1_clk_src has CLK_SET_RATE_PARENT and a div_table,
and we only pass DISP_CC_MDSS_BYTE1_CLK to the dsi controller.

Neil

