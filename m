Return-Path: <linux-arm-msm+bounces-19113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6FB8B9615
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2024 10:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC23C1F21846
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2024 08:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057761527AD;
	Thu,  2 May 2024 08:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kq0q4HNZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFE5225AF
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 May 2024 08:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714637026; cv=none; b=cjoJX0ryt+47tdkpO4doy84Su1bVXObkFeRKWts9nV6viAR6xd2DrHD9qh5/9ZxbbTWC62V9gotex4kS94ew8WvUmt9aSEnMypJJg34Mn2hDL+P/E3JP7W+nmp/lCnc8AqWOFcu5tZk2UGb+Yxlqoa5a2QP6pZ/EC+1nvQXyTeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714637026; c=relaxed/simple;
	bh=JuaNdhG1yybHKCDxCOnNbtaouCO/R7KqIkUAHSq+at8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Pg2NxN9R/4JNuuBJZ2qF2YvT25ZOAef/EDWYAeXeo3u43+nZia/VmlQcG19cqJBmd3jiKGr1xE7Su94AHzpBtCID9Cmrkfdba9zYhr9tnqlkYxtuCsQTyhvjHNpNiHLRpq/vuatpkW8Yz01OXQCk/nb9EW4fBc2kCiiU7Cv2HE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kq0q4HNZ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2dcc8d10d39so89090431fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 May 2024 01:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714637023; x=1715241823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Gwh/IaVsJdTO/wtoqCQNJq6R897Bz66ybMuoZB8azo=;
        b=kq0q4HNZQnQLGB68nzGU7S/J8Z92g5PhPk9SqLl2L8Uk+sH+aAS5RLVukS/K5RqzSY
         Km0/IYUsliKh5lDYmfTizsb8c2J3Ld606pOFhiMzHUc5/nLkgA+4ANWNMFnD4SuYOZYs
         m7Lr8Vw2vufecT5X32hoSNDobkKidaKozumfiEsrnCy2CCbRfM5d4ugxg7V+NQ70psiv
         RI/6H5QkE3CvO3BpnJ1ZvyyIWgB3I+EgkkmGT2nqqmCJeOWTGw9Cw3fBr4BBR44OwiH+
         tARe8TpXYo5++2ENHKxp2FqYXU7eQ6AuRDmTBhBsQr40kMKjkDq+VpbY2txV4JgPe2q6
         4gwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714637023; x=1715241823;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0Gwh/IaVsJdTO/wtoqCQNJq6R897Bz66ybMuoZB8azo=;
        b=EdIgguDg31jDnUnpaIsC2/WY9qEEh6iusKZJ3LN9/O0aGGXzYWV0+mhuFr/6/y0QsW
         PKN9VL3Z7HdeVvI1FcO5i+nJp5MMHSaUpxbvcbp+zzbY3RfnnWLug7nUFHuN8t8jMArU
         7hqNpK0hPPVH3+c6GVaUFn+jRXZsS0hzAIF/9oHqe7mV7CdJT0aDFpwKmzejrsejXc6I
         LIx4QcrzWm6JSP5zDsj3L0QTFxlENXya6Quo/JFVWex7PVIoKHZGQLK175YoQP00t9U8
         Cp9CTVY+Vo4aEbI3QG/J1CNaZE2X87g5ODls5uADZdAV60CPRrjWQ0A0acLg+PCfFBta
         XwPw==
X-Gm-Message-State: AOJu0YyOdHvM5NXZSfc8nqfncVUWWfSux3O5v4l4XUJRYnZw+w+1dstV
	ZbpdlaeYJst9UhW1XbIgyqegUY5bnK8An1XNdzlwHYZXK8jKEdMmigvCo0UnrF4=
X-Google-Smtp-Source: AGHT+IFKB2jYfl8fT7daTvXF76Voco2LUQCQynA10mjWN/2Fl/PgSJVaA7LhHuO7psiOU98YLDVNKg==
X-Received: by 2002:a2e:b0e8:0:b0:2e1:dc63:9f9 with SMTP id h8-20020a2eb0e8000000b002e1dc6309f9mr765564ljl.23.1714637023167;
        Thu, 02 May 2024 01:03:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:67e2:5e2:652b:4129? ([2a01:e0a:cad:2140:67e2:5e2:652b:4129])
        by smtp.gmail.com with ESMTPSA id f20-20020a05600c4e9400b0041b5500e438sm1042055wmq.23.2024.05.02.01.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 01:03:42 -0700 (PDT)
Message-ID: <a4441fba-4a2e-4107-8fe6-c0dbb985fbc8@linaro.org>
Date: Thu, 2 May 2024 10:03:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: sm8650: Fix GPU cx_mem size
To: Connor Abbott <cwabbott0@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jun Nie <jun.nie@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
 <20240426-a750-raytracing-v2-1-562ac9866d63@gmail.com>
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
In-Reply-To: <20240426-a750-raytracing-v2-1-562ac9866d63@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/04/2024 20:33, Connor Abbott wrote:
> This is doubled compared to previous GPUs. We can't access the new
> SW_FUSE_VALUE register without this.
> 
> Fixes: db33633b05c0 ("arm64: dts: qcom: sm8650: add GPU nodes")
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 658ad2b41c5a..78b8944eaab2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2607,7 +2607,7 @@ tcsr: clock-controller@1fc0000 {
>   		gpu: gpu@3d00000 {
>   			compatible = "qcom,adreno-43051401", "qcom,adreno";
>   			reg = <0x0 0x03d00000 0x0 0x40000>,
> -			      <0x0 0x03d9e000 0x0 0x1000>,
> +			      <0x0 0x03d9e000 0x0 0x2000>,
>   			      <0x0 0x03d61000 0x0 0x800>;
>   			reg-names = "kgsl_3d0_reg_memory",
>   				    "cx_mem",
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

