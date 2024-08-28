Return-Path: <linux-arm-msm+bounces-29766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 990CF9626DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 14:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51AA22824FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 12:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E57F175D38;
	Wed, 28 Aug 2024 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9VK2yGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342ED1741E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724847763; cv=none; b=P7Tp2QQS9hs0u9hK/FehnuUm5gcrdtOH27qrkDWFrvZ9ZhqBL6LdlLnUISA2kF/MTTBCEYmIAWy83Nk/bqq0BFQVY+zldYo0Kq2vkYiDl1LHZ4UjmarVT94p0+y1B5ocAWyjv6ikve1rBOMH7VRfFi5OGVG6/0cZ2U62krkgoKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724847763; c=relaxed/simple;
	bh=duMOYSVY+NxUsu7pc7EwV738PsRb7Fy5WPc1UTCdPaY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PrTVb8+volaX8OUB6zVWFqGOIFKKRpxxraOzb3tmd4cEeCGfs1BkuEsKua0VNzGnswAu0fwSF3PxEfmRP52lhNybMAjNAoFGR4irM5DpPDX0hXobfkXDAyWk+a7CKeZihUkKW/nenDJNDzQkFtWSJfHg54LEWvbESkfCLFKPkEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9VK2yGR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-429ec9f2155so58415385e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 05:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724847760; x=1725452560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=miW3iBbKvjDRoBEs8t1sI/RrThKchvEUyK5mflPhcp4=;
        b=J9VK2yGRfvDg38kgid1OFVvPCfIjCTP1Nbm952pzQIPuK2Cug+4Wzw26flktGe+wdm
         o/nsxc8E7wpw1KlmzfmziAuzArnDee3swFmXECF6Qpf/byYPhdvsYm2N4VWSGw6ldv6t
         A4AbWjGskQNWcZ+xPieZvZvsqVP6t4VxoO7S/bIaZBsUVxtZQ9phh21yvKcPcZtpvwx0
         Uep9ZS4vbBcvBemhePb4a37quLAxIPIQNfBx35HhHouFBt7+jwtK7x5FfIfn55v+Ov0o
         ZXe1MQm9o0Fiu6g7ftz437NPQNAf5h4MTotdgdDkVw+u6Srf2h0zpkO62P32gj3ouiZF
         jJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724847760; x=1725452560;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=miW3iBbKvjDRoBEs8t1sI/RrThKchvEUyK5mflPhcp4=;
        b=kGxPAJx8ladvOudSasen4dm4eenkJOAeoB3MdaObSE+mxkW+RoRuGlnP4jdcH17Ebc
         husUeYwF+F1SnplVPe4iWTY7ZSV1xPRHJfGE1zcqLtHeoNw+ZHkh+nN+5mpcYbNbdbfN
         cjCb9JV0auEOAxKdib5uW8mMfs4CN1QR5H9+H1laqWaXgNF7XjPSGO4oTw/b3J6ULVxb
         lNIJc38qPC1v53Yv3CSXQP8oCzXF9LQeRMP/kYcFuthy+Wls0OKeh0XPHjp6XZ/C0+xi
         INBSKhu2SAadLS0xFbk2AFqIEKfN7Y1EcV/cCzJsyBGeCkfG+TD035gGP1DKT9WruhO2
         keLw==
X-Forwarded-Encrypted: i=1; AJvYcCX4cXY50Lx+jpUeSKkRupV4Xfl1/KAv0itYnYxyA0LgHNYS66UeUcbbLNwidFOYBSZcDBwQ4gU9CvS5PM0c@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9tey4UldCRLKYuYfA0P/XMPvbcXZ9zB7DJRNs2cSvxjhP2KSF
	3w+3wUkhjeJ/Q04y+vYZxYMp7arqLxw+I+uFTfDr8nf1lIOWsx1JSn/016tPBFaIcpvUcacMba8
	q
X-Google-Smtp-Source: AGHT+IGdHs+4KGH6JPMAhg9I7m6/CQOMPuOGIEmgAYybMBpNiO2Y1p9zbD7hHnrC6SL2JPKMhVCXEg==
X-Received: by 2002:a05:600c:3b83:b0:426:5dd0:a1ee with SMTP id 5b1f17b1804b1-42acc8d5269mr114246655e9.2.1724847759170;
        Wed, 28 Aug 2024 05:22:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:765d:64ff:5f38:550? ([2a01:e0a:982:cbb0:765d:64ff:5f38:550])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63ae05bsm19636775e9.27.2024.08.28.05.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 05:22:38 -0700 (PDT)
Message-ID: <1684855f-5901-459a-beb7-2569003b30ac@linaro.org>
Date: Wed, 28 Aug 2024 14:22:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc-sm8550: Don't use shared clk_ops
 for QUPs
To: Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 patches@lists.linux.dev, linux-clk@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>, Amit Pundir <amit.pundir@linaro.org>
References: <20240827231237.1014813-1-swboyd@chromium.org>
 <20240827231237.1014813-3-swboyd@chromium.org>
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
In-Reply-To: <20240827231237.1014813-3-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/08/2024 01:12, Stephen Boyd wrote:
> The QUPs aren't shared in a way that requires parking the RCG at an
> always on parent in case some other entity turns on the clk. The
> hardware is capable of setting a new frequency itself with the DFS mode,
> so parking is unnecessary. Furthermore, there aren't any GDSCs for these
> devices, so there isn't a possibility of the GDSC turning on the clks
> for housekeeping purposes.
> 
> This wasn't a problem to mark these clks shared until we started parking
> shared RCGs at clk registration time in commit 01a0a6cc8cfd ("clk: qcom:
> Park shared RCGs upon registration"). Parking at init is actually
> harmful to the UART when earlycon is used. If the device is pumping out
> data while the frequency changes you'll see garbage on the serial
> console until the driver can probe and actually set a proper frequency.
> 
> Revert the QUP part of commit 929c75d57566 ("clk: qcom: gcc-sm8550: Mark
> RCGs shared where applicable") so that the QUPs don't get parked during
> clk registration and break UART operations.
> 
> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
> Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com
> Tested-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/clk/qcom/gcc-sm8550.c | 52 +++++++++++++++++------------------
>   1 file changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
> index 7944ddb4b47d..0244a05866b8 100644
> --- a/drivers/clk/qcom/gcc-sm8550.c
> +++ b/drivers/clk/qcom/gcc-sm8550.c
> @@ -536,7 +536,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s0_clk_src = {
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_ops,
>   	},
>   };
>   
> @@ -551,7 +551,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s1_clk_src = {
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_ops,
>   	},
>   };
>   
> @@ -566,7 +566,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s2_clk_src = {
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_ops,
>   	},
>   };
>   
> @@ -581,7 +581,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s3_clk_src = {
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_ops,
>   	},
>   };
>   
> @@ -596,7 +596,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s4_clk_src = {
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_ops,
>   	},
>   };
>   
> @@ -611,7 +611,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s5_clk_src = {
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_ops,
>   	},
>   };
>   
> @@ -626,7 +626,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s6_clk_src = {
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_ops,
>   	},
>   };
>   
> @@ -641,7 +641,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s7_clk_src = {
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_ops,
>   	},
>   };
>   
> @@ -656,7 +656,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s8_clk_src = {
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_ops,
>   	},
>   };
>   
> @@ -671,7 +671,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s9_clk_src = {
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_ops,
>   	},
>   };
>   
> @@ -700,7 +700,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
> @@ -717,7 +717,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
> @@ -750,7 +750,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
> @@ -767,7 +767,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
> @@ -784,7 +784,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
> @@ -801,7 +801,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
> @@ -818,7 +818,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
> @@ -835,7 +835,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
> @@ -852,7 +852,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s0_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap2_s0_clk_src = {
> @@ -869,7 +869,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s1_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap2_s1_clk_src = {
> @@ -886,7 +886,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s2_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap2_s2_clk_src = {
> @@ -903,7 +903,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s3_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap2_s3_clk_src = {
> @@ -920,7 +920,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s4_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap2_s4_clk_src = {
> @@ -937,7 +937,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s5_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap2_s5_clk_src = {
> @@ -975,7 +975,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s6_clk_src_init = {
>   	.parent_data = gcc_parent_data_8,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_8),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap2_s6_clk_src = {
> @@ -992,7 +992,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s7_clk_src_init = {
>   	.parent_data = gcc_parent_data_0,
>   	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>   	.flags = CLK_SET_RATE_PARENT,
> -	.ops = &clk_rcg2_shared_ops,
> +	.ops = &clk_rcg2_ops,
>   };
>   
>   static struct clk_rcg2 gcc_qupv3_wrap2_s7_clk_src = {

I think you missed gcc_qupv3_wrap2_s7_clk_src


