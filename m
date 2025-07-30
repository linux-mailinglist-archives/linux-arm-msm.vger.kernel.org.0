Return-Path: <linux-arm-msm+bounces-67169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1485DB162CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 16:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CE4E3B171F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0FF2D9ED5;
	Wed, 30 Jul 2025 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G38OmcXE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD891C5D57
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753885724; cv=none; b=CU6WnGLOYIZi+vAvamca1vw6/5BXK/wpFUJedhtWaMJS/KzMxFQLRCH4X+Q272BUQMZizDHPVKMlp25FpNRzueWTGJJqgA4ty2AWvU/usdDepK9e6XjeCvvbv1E78Lt0fxH9B0EuhoWaNQPKxvarGrfJblZocJ4KGdT04bZKueU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753885724; c=relaxed/simple;
	bh=STW90s3KQt7qz/SZuFNEPaZC4WtWeH2+//zEppDSySQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kXQE9nZwAc+jHJ//4ZqUhdgKxJvGqyMU4hPhpq65HnNINalyB+aOvLPoPIG7tZXE/EINnfPHEpSghbuuog4qGGPark43+fRa7Z+xkBI3tIP8pjV2PiFteTIY9IdQaqr8LFQ2OLfC74XTR7LGthgpxRzkTvg10V26VIUuieliB+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G38OmcXE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b7825e2775so4292979f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753885720; x=1754490520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYfKKkomyIJnTe7xVnvfHYaX8X0anbFk9RY4Fhlx8c8=;
        b=G38OmcXE8kN1awNd7uUHzT7pzMkYCd442ONg1KcWs8nGX8kG4GZev42dwoZEBUZ9+E
         Djt0cCT4rfpfJgFLPSdF570rFQlJRmSTMImxEUzys5i5NP3heD/zfXjj/sOwg2CzaPsl
         qdYuSyL484cHYl8hz3hHs3n52A9E7N1iIPLZaeq2AAZMEbIV6D4L4IdLd6N1bMCTOqwh
         Rkc99kssrngqfmIQnuExS4t5XpE6yKdVeYQxFBXSGHBZlI5GSECpYWipfhGRlZ5Y0ayp
         mGxgzCGAOJUrWkkrT0o4snzYHedARDsxdIGT5vjJHRnUAqML33YKY7R1JApgv8GBJbk+
         12mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753885720; x=1754490520;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VYfKKkomyIJnTe7xVnvfHYaX8X0anbFk9RY4Fhlx8c8=;
        b=rwkUhGI5Cx3fXN1/qWSuQ+UlyFwC1gvVjLwGeBi0Lca1BrcLsJVMce7oaeM7TDVmuH
         tDfVPGBOIh4Az9ip9vYxB8r2Uk6ZDYcqP0UHO1TZcbRwbozCysrqoMyklaQvzgcDnUXe
         KVKmvo/XvCrjhMSDv8Tbuo7mMif15IChzXJLm/fduYrje21kktaITz1o8wKdsbQxMmZg
         Z7gjG23KhuhgvC+mYHs9RI9CrOeFMuoG2lA7E6SXMfmtObaqb8Wy3iNpGc2H0cwZfuYs
         irscI4Q+Csr8/N7pUELD76n3MC7kjLLmUSb548IyBPX2CSWJlyLUXHpOVNQCbO2my1UB
         GPdg==
X-Gm-Message-State: AOJu0YzTla+67A3/MflewxJ4DGaV8asZzEb7+Q1jnNLvs6TuxQ9It/9H
	6oe9D7BHNKzjGjI6p4ChY5dTvwBCR5f/RGlFIzI5IuxV6lu1ZYq5rHN4C1O/tZw2bgY=
X-Gm-Gg: ASbGncs3ICUzSFTi/IYK7CLdpEo1/zejmeeYRBAlzctvdk7jESOXbYzcFUxWm6qa3Pj
	QntLNIM3uxxjfrlbxRkrkpP1POGLuzrP0yS3RAwI4pRDR93O3u72XOI05fegarrehZM3mpRjz5a
	RJYCEhERc5RxSDbsO4dSC8+mhH8WmuQu55ijYBHOEuGMdB8Ly3DTxLdEfJ2cVtqFzauXhDwI01C
	TIbdoDW5jDGuE98gpvAC6olUpto9oKYjEWAlxAdAv1yl/LMUTk4OjNFcEjySGQjiFlhCTsOvaFm
	sn7LNrMmjxlov3tr+RabqFFXGFukgnXz8ZEpHiaqwIP0VLsLTmnQZxS9NX6imS5WbnpUWwmRQKX
	xxdgnRU5E5KR90KAZSqLH/SLU75pHnevN6KL1otT/WdtLtJzbsk3jKAmqxiz4Na07C0hwPV/Gzd
	PUECaD7mRUdQ==
X-Google-Smtp-Source: AGHT+IFkiongaw+716eYscwAn2hud6KDZWIRmXrEPYkuiIscgZfHi99ALGqutk4bxdBQdOBbpGHfUQ==
X-Received: by 2002:a5d:584c:0:b0:3b7:6828:5f78 with SMTP id ffacd0b85a97d-3b794fe4f79mr2697229f8f.4.1753885720284;
        Wed, 30 Jul 2025 07:28:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5cc9:639a:a021:88ef? ([2a01:e0a:3d9:2080:5cc9:639a:a021:88ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953755d1sm28427255e9.11.2025.07.30.07.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 07:28:39 -0700 (PDT)
Message-ID: <a88b22b6-4be5-4176-95b0-0a03530bfd76@linaro.org>
Date: Wed, 30 Jul 2025 16:28:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Add ACD levels for GPU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250729-topic-sm8650-upstream-gpu-acd-level-v1-1-258090038a41@linaro.org>
 <63da4872-2365-40eb-9b2e-d3393ddd9b68@oss.qualcomm.com>
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
In-Reply-To: <63da4872-2365-40eb-9b2e-d3393ddd9b68@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/07/2025 12:00, Konrad Dybcio wrote:
> On 7/29/25 4:40 PM, Neil Armstrong wrote:
>> Update GPU node to include acd level values.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 495ea9bfd008500dd2c9f46ceca94cf5f972beca..4cd933219ce008bd1c603c87778e210b6332e29c 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -4127,72 +4127,84 @@ zap-shader {
>>   
>>   			/* Speedbin needs more work on A740+, keep only lower freqs */
>>   			gpu_opp_table: opp-table {
>> -				compatible = "operating-points-v2";
>> +				compatible = "operating-points-v2-adreno",
>> +					     "operating-points-v2";
>>   
>>   				opp-231000000 {
>>   					opp-hz = /bits/ 64 <231000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>>   					opp-peak-kBps = <2136718>;
>> +					qcom,opp-acd-level = <0xc82f5ffd>;
>>   				};
>>   
>>   				opp-310000000 {
>>   					opp-hz = /bits/ 64 <310000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>>   					opp-peak-kBps = <2136718>;
>> +					qcom,opp-acd-level = <0xc82c5ffd>;
>>   				};
> 
> https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/graphics-devicetree/-/blob/gfx-devicetree-oss.lnx.1.0.r1-rel/gpu/pineapple-v2-gpu-pwrlevels.dtsi?ref_type=heads
> 
> doesn't set ACD for D1/D2
> 
>>   
>>   				opp-366000000 {
>>   					opp-hz = /bits/ 64 <366000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
>>   					opp-peak-kBps = <6074218>;
>> +					qcom,opp-acd-level = <0xc02e5ffd>;
> 
> And other values differ too
> 
> What release did you grab these from?

A much more recent non-public release with different gpu-pwrlevels for different SKU codes,
all sets ACDs for D1/D2, and the ACD values are:

#define ACD_LEVEL_TURBO_L1    0x882a5ffd
#define ACD_LEVEL_TURBO       0x882a5ffd
#define ACD_LEVEL_NOM_L1      0x882a5ffd
#define ACD_LEVEL_NOM         0x882a5ffd
#define ACD_LEVEL_SVS_L2      0x882a5ffd
#define ACD_LEVEL_SVS_L1      0x882a5ffd
#define ACD_LEVEL_SVS_L0      0x882a5ffd
#define ACD_LEVEL_SVS         0x882c5ffd
#define ACD_LEVEL_LOW_SVS_L1  0xc02a5ffd
#define ACD_LEVEL_LOW_SVS     0xc02d5ffd
#define ACD_LEVEL_LOW_SVS_D0  0xc02e5ffd
#define ACD_LEVEL_LOW_SVS_D1  0xc82c5ffd
#define ACD_LEVEL_LOW_SVS_D2  0xc82f5ffd

Neil

> 
> Konrad


