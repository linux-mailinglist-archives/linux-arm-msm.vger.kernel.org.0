Return-Path: <linux-arm-msm+bounces-45240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 012EAA13686
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 10:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A30416529A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 09:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74A826AF6;
	Thu, 16 Jan 2025 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WBABoPfq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54F81D88D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737019479; cv=none; b=qSYE3PO4tuJvbJn7QPv1NLW5vKZIfBVYj7qX97qWoCA4UtwV3PwzamHpp11spVTYvnOnQz81Fl6SfNsCKtwYQIzBLV2gO455KS9lqfXmNOYzImeM9cx5HMMBzxaClsjDHxcIQX8gYxfr+n/RLNBtqxoJD+xXM/5M43b6gdsKoLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737019479; c=relaxed/simple;
	bh=wz/6VArm0fm4IK+UCKlCzR1Uz0mgnf9Z2nHw/aBWy9c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZeF5tcwgd3iyaCfK8au7N0nyx/2Qn7e6z56HlToyKpNhbOxkX0ZfKyxGXHQrrptuFB6LkY+riAuxjnqQKM0rPb9duzvAYMABi7LCyjeZo1lTE1w91XK47v/SGc9YkofSKoYPSkW0ZnV7M5scwJHJvOhp/nanKcC/CMBfm719QMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WBABoPfq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436341f575fso5944915e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 01:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737019476; x=1737624276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lIaWSI2S+exW7AJdc9gF6v3PkwuGrMgeaYPmVrCZYI=;
        b=WBABoPfqO5GXPHk4+l212iVmfvolEeqlbvg+E2BIbuj++xJs4P9MzwkS4ZT0TPc0yl
         xiXhkcDHxk0k7+n88Df7LI4pZOGFZ0PC+W9q3c6yJw5pk7uYoBFryud5pwc1G3s44g+0
         zWlYhjKrgOqkJCS8gKL8TlCmaMmSvXPKZAAxmtrNYWD8yfEyMjKXzY7PURZpMsjDFd7O
         RnNyhSelOr3BgWcRoHBRZabvpUxMIswiSOLKUZva7EgCTAyBDROjIPv9AYPZPSNrebLF
         wp7wmwxcsBUcTcuAe0ROb4KGYYQ9knTqy0NMmyzY95OxtuEZyV3f08sMePhYHIY51XgE
         YGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737019476; x=1737624276;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3lIaWSI2S+exW7AJdc9gF6v3PkwuGrMgeaYPmVrCZYI=;
        b=qQrMyZwDX4U9xGIMguPFOz2Ny4upxbTb3EYfsEm2kA5od3ZsedqpMcWFtpTqt/nnrY
         VlI0joZpROySUvm1peM1kWZJPEndgdEwh8bHZA84MikMQYXMCi89Quv/H1Yc2oq5aAiq
         zTNVBjSmQzDTx5SxDwRE47h6mRD7EOPOrO2GXR27vVrIlJRoq+D6jNwOhwaPLRHjxU8M
         A4RAqDHzrs37SZGlxdfg1uSxMy3R5jvMo78FqXI/8t+x6L4zWBBYHH96acZQ1YlvPPsx
         SeM2HZRJkyolDcsY1HOuygRjvPlduC5Xz+qDqVA20IgS54wi+gTg2miP9Yxb+E0la3hL
         MUug==
X-Forwarded-Encrypted: i=1; AJvYcCVbS1bERRm7G729EiieJl4UX/InHTLFCXgfbFrObzK2RHef0ElGS0/DqbX1wLQbyPzOrIt1gGbmR5p81ebK@vger.kernel.org
X-Gm-Message-State: AOJu0YzCsl1Z4mzk8Q8Qq/cPziTHXwy6qidi0cXTOH115SNV856CP4Ys
	9Rjk+0/Sx8tJ5wu8OCWlfmU0+OpCbaXvs0qOnKICeFyEU9s52h5DhW4av+rLh6M=
X-Gm-Gg: ASbGncvSPX3L2d7MgmjCwxMYBDr89w9zBY6pzEXBqw8yuoCEppspJ0vsO2qdGwCCT0S
	haIGdQGaznaglN1tsRNbKSeav/d9G4jul5YwnzwueIKt6XN/iyNNsJLzj6o1D+fzbRkM54LB1g+
	1q4jQPUBGfxjQmr4KDp9HCNETvk9CeJOW910//DN9wK1vioxfkJOqI8vAmATwOiHVjqzmpppSU6
	1fPcrPNVTR95mbmb1cXl66yOoEZvsoATJkwqoQtdeSgpQSgJNrTOnG0PR+YiAKhy74EMxYaWMcl
	Xmqist9b5aI6ykG1wWKol1FEOVLVqI8=
X-Google-Smtp-Source: AGHT+IFEgF8BZ/mYTGL6mOSmrxd/cLDyZc/Tv7cZxz3UDZhV9tkkfFiLKZQrO9BAMPcCteDuw4L/HA==
X-Received: by 2002:a05:600c:1987:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-436e2679e05mr308050335e9.4.1737019476004;
        Thu, 16 Jan 2025 01:24:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:69b:c51f:3072:d4f5? ([2a01:e0a:982:cbb0:69b:c51f:3072:d4f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c753c617sm52784235e9.37.2025.01.16.01.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 01:24:35 -0800 (PST)
Message-ID: <e61d05d3-eb9d-4b58-8a56-43263c58f513@linaro.org>
Date: Thu, 16 Jan 2025 10:24:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 8/8] ARM: dts: msm: Use Operation Points V2 for UFS on
 SM8650
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com, junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-scsi@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-9-quic_ziqichen@quicinc.com>
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
In-Reply-To: <20250116091150.1167739-9-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/01/2025 10:11, Ziqi Chen wrote:
> Use Operation Points V2 for UFS on SM8650 so that multi-level
> clock/gear scaling can be possible.


I've already sent a similar one at https://lore.kernel.org/all/20250115-topic-sm8x50-upstream-dt-icc-update-v1-10-eaa8b10e2af7@linaro.org/

Neil

> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 51 +++++++++++++++++++++++-----
>   1 file changed, 43 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 01ac3769ffa6..5466f1217f64 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2557,18 +2557,11 @@ ufs_mem_hc: ufs@1d84000 {
>   				      "tx_lane0_sync_clk",
>   				      "rx_lane0_sync_clk",
>   				      "rx_lane1_sync_clk";
> -			freq-table-hz = <100000000 403000000>,
> -					<0 0>,
> -					<0 0>,
> -					<100000000 403000000>,
> -					<100000000 403000000>,
> -					<0 0>,
> -					<0 0>,
> -					<0 0>;
>   
>   			resets = <&gcc GCC_UFS_PHY_BCR>;
>   			reset-names = "rst";
>   
> +			operating-points-v2 = <&ufs_opp_table>;
>   			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>   					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> @@ -2590,6 +2583,48 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   			#reset-cells = <1>;
>   
>   			status = "disabled";
> +
> +			ufs_opp_table: opp-table {
> +					   compatible = "operating-points-v2";
> +					   // LOW_SVS
> +					   opp-100000000 {
> +							   opp-hz = /bits/ 64 <100000000>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <100000000>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <0>;
> +							   required-opps = <&rpmhpd_opp_low_svs>;
> +					   };
> +
> +					   // SVS
> +					   opp-201500000 {
> +							   opp-hz = /bits/ 64 <201500000>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <201500000>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <0>;
> +							   required-opps = <&rpmhpd_opp_svs>;
> +					   };
> +
> +					   // NOM/TURBO
> +					   opp-403000000 {
> +							   opp-hz = /bits/ 64 <403000000>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <403000000>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <0>,
> +									   /bits/ 64 <0>;
> +							   required-opps = <&rpmhpd_opp_nom>;
> +					   };
> +			   };
>   		};
>   
>   		ice: crypto@1d88000 {


