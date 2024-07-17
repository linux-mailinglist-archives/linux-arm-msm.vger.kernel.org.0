Return-Path: <linux-arm-msm+bounces-26433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5570933A6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 11:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D628B22449
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 09:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745E217E8F0;
	Wed, 17 Jul 2024 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bDiN43W7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C475C433B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721210035; cv=none; b=YM5FUB0twgO7tbW1X5FuHododaPzt6vQVdqImPRGm51WKItqf2GkNMT7IVSMJI/qoyX97rJrdv35AmfO1b22NAQRv4e2/UiJ/PJSsBsY5zu4z1atKVpxa1GN9BVZ5wtnj1zAXgAFaSczDG6UPH2ulqhREpqpvxZIsDhIPQ9R4N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721210035; c=relaxed/simple;
	bh=hY2A8MnPxYgkestQzlEEcDPcT1koXYpQRvGwLzEfeY4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Gv3Lyo6l3qkVAbGIcMXbPC7uhYmyY6XWx4BcwJeXa6KRY4htA61WV5RrfMYszL4Qtp6fuEioh8T75XUYTMXeSGIvc8uo7L8hm+fxcxkSdHa5hdfzEj1in+Q42S83hiYET21Y67MbOdJMZZo+zxHeL72lAggtsunXdmFFr7J/HMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bDiN43W7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4266f344091so47873855e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 02:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721210032; x=1721814832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7hezuiAMuZqu+ZyE4Fc3khDx6DH8srSCJtvh9GvtbM=;
        b=bDiN43W75muhknAZXm4672m4k1sa/QIr11+/JMtsyoQvFS4EiOMydEfKhSWrTtR3Yk
         ZjSkoxBmIItFrvdI0KOZbszesQ2Ni7xJk4TbxQJ2QJVXXnfUk99M9C6LNR38Ja56aLeO
         QuhgR0iHop/1jq1kJLxSvZWTsRCWx4E+qeoiqT4HC9lMM55qf7uY9r2eyJgahdHb016U
         GeEpfH+HQsQfoQXyYDc/2nHkKzzSQ5JzXL2C8ftjMI/z3fz92bK/e1s/yWUN8A0S2GU3
         pZ1wkpAlyCnVC7pl1a4gVD/JPrxSBEgwZAkgdiGUajbxgACIgRjqeta6scWl0zHukzD8
         SgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721210032; x=1721814832;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D7hezuiAMuZqu+ZyE4Fc3khDx6DH8srSCJtvh9GvtbM=;
        b=aQ2gLRM5E5icSXcb/+0HWHLNCfu81inbymshUDQN+m9l0g//TYg1Rv6zN9QvCEG0fa
         yx2VPyxz5Z1SxzS4A57uWf6lPhc5AQI1fLX2pj44zrOE+OD3O3OWsmei29T013LSM97p
         I32wXJfbe/v3IvTD3wLSuXVkVi+B9AbxhHFycUWoNVfY1oA+upDiLVYlTca3yM9wn99c
         QVIg81kvXzNdYT/1kogHyifo1cY/b+09cdc2nCIuclKu2rzOuwRnpLhXgtWQn4Yc8e/t
         LoZkC6hZxvjKFyT6tSydz0kSB34IudyJQ219CMQI5TNA7C/GV79lOG3H9dGlIUuZR8QI
         W+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg+xKhQF3cVz3fGvDvT2pgAzdAHtB7yKRNeJKO2jTk9YkSigdLqT8fb2nEUUtTQIyJJhcSuLiHTOqzN7AnzNpM1xZpTGDrzYNe+fcoQQ==
X-Gm-Message-State: AOJu0YwJzKLqm7RraFYMf/E1R3XZbGVCZIiOp6wrTjUP6sNSXSpq79dh
	360hZgxntioVpiAKrmChYFeqXku58x/HnBPlfDn+uIdWWVdVe/seGQ9vd3Rt1b8=
X-Google-Smtp-Source: AGHT+IFUURvypNWarKRExQlrgfZYzn/ENpo49k/JM+c2BsbFK2CiL1BnS8McI1klEBbHhnY+OBdDAQ==
X-Received: by 2002:adf:ef87:0:b0:367:9988:849e with SMTP id ffacd0b85a97d-3683165caeamr771753f8f.39.1721210031913;
        Wed, 17 Jul 2024 02:53:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d? ([2a01:e0a:982:cbb0:c5b9:9b90:b1c4:1a1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e81edasm163840315e9.15.2024.07.17.02.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 02:53:51 -0700 (PDT)
Message-ID: <43d6523e-d6b7-4fda-92bb-a52fcad2fdba@linaro.org>
Date: Wed, 17 Jul 2024 11:53:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
 <20240716-topic-sm8650-upstream-fix-dispcc-v3-2-5bfd56c899da@linaro.org>
 <dccttz5b44bl3lwmcaqz6wjx3n4sv3eq4yh6276vzwrtkcvqcw@qxhbo7bylnsg>
 <9ad10d92-d755-4fae-b206-6e8648be6d48@linaro.org>
 <CAA8EJpr9L+AKDhuHfQa=Nco7fvG9vLH3a+gxVhENrhz12b3n=Q@mail.gmail.com>
 <278354ec-532b-48de-8ee1-5477ddb4a285@linaro.org>
 <kxrhhb3vdojbnqfbwks2qmob55fwm3onleood73qfk6esl7g2c@q66kw5am4emc>
 <94e48e19-781e-4de3-a4e6-da8e923a1294@linaro.org>
 <CAA8EJpomVKiVrRxSEJmjvNXLGGKVvcr2wGWtE129eUoUfgYC4g@mail.gmail.com>
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
In-Reply-To: <CAA8EJpomVKiVrRxSEJmjvNXLGGKVvcr2wGWtE129eUoUfgYC4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2024 11:49, Dmitry Baryshkov wrote:
> On Wed, 17 Jul 2024 at 12:47, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 16.07.2024 6:46 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 16, 2024 at 03:46:24PM GMT, neil.armstrong@linaro.org wrote:
>>>> On 16/07/2024 15:44, Dmitry Baryshkov wrote:
>>>>> On Tue, 16 Jul 2024 at 15:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>>>
>>>>>> On 16/07/2024 13:20, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Jul 16, 2024 at 11:05:22AM GMT, Neil Armstrong wrote:
>>>>>>>> Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
>>>>>>>> and byte1_div_clk_src, the clock rate should propagate to
>>>>>>>> the corresponding _clk_src.
>>>>>>>>
>>>>>>>> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>> ---
>>>>>>>>     drivers/clk/qcom/dispcc-sm8650.c | 2 ++
>>>>>>>>     1 file changed, 2 insertions(+)
>>>>>>>
>>>>>>> This doesn't seem correct, the byte1_div_clk_src is a divisor, so the
>>>>>>> rate should not be propagated. Other platforms don't set this flag.
>>>>>>>
>>>>>>
>>>>>> Why not ? the disp_cc_mdss_byte1_clk_src has CLK_SET_RATE_PARENT and a div_table,
>>>>>> and we only pass DISP_CC_MDSS_BYTE1_CLK to the dsi controller.
>>>>>
>>>>> Yes, the driver sets byte_clk with the proper rate, then it sets
>>>>> byte_intf_clk, which results in a proper divisor.
>>>>> If we have CLK_SET_RATE_PARENT for byte1_div_clk_src, then setting
>>>>> byte_intf_clk rate will also result in a rate change for the byte_clk
>>>>> rate.
>>>>>
>>>>> Note, all other platforms don't set that flag for this reason (I think
>>>>> I had to remove it during sm8450 development for this reason).
>>>>>
>>>>
>>>> Ack, I think this deserves a comment explaining this, I'll add it.
>>>
>>> But where to place it? This applies to _all_ dispcc controllers.
>>
>> Commit message
> 
> It is already committed.
> 

The thing we keep adding new clock drivers based on previous ones that uses
specific ops and flags with no documented reasons except in commit messages,
but it's often buried into multiple cleanup changes.

So at some point we should add simple comments before each special clock
explaining what we're doing here, a good example is the clk_regmap_phy_mux_ops,
where I had to dig into commit logs and understand why we handle it differently
from downstream.

Neil


