Return-Path: <linux-arm-msm+bounces-70321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD60B313E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E3801D0388E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059BC2F2918;
	Fri, 22 Aug 2025 09:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M9SsYYFh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E76A2F0C61
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855362; cv=none; b=MM1m9rHO/ykzW4seW0GjC78DcDl0lOMuPzq9v3RjTnMBRUbRPvz/7iVDtg4VlwpQtgQiPY7tO6/Qx8ZEt2mnft9fOV422m0yYWr/sE5p9xTIZwNWPhL/6yNNPetOxQRt2d3OalPQJbg8RwPp6wO7UPCCVVjvLp3/x4Gn2o8udPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855362; c=relaxed/simple;
	bh=MTlchUltgi318NL8GEvOv45DVuKXV+5fSlbX4wr8Va8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xu46nqZsmecQcRisx2n2KsXyswnUh5nwxCREKIWvueWy3M0Yw6eiSeBh8QNBG+DmCDfOwEH4oUFe1Q65CJCf5VytJRbiaw8Ymc1KhQqwW0GALZ1NjlpfuC22/RTzx9znrw5WVbTk5rBSGO3HxBSHlA8uADXq6tPH2cI52xFSGdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M9SsYYFh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b4e5c3d0fso3862005e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755855359; x=1756460159; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxLpTKOOWK60iUyTwkthGNDuDdK23AvQqmpjQR3hIsQ=;
        b=M9SsYYFhoiU6GBPExsU90Qmm074iO7z8uPKWdCQwyB0EjROSR55fqemQ3glhZhwRd2
         i9N7p28BYTVLxIEiDkCWDzOlTxYyYi3t8+ghEqLeaFoRPJ4YAk4TRYz7CL2C2o0lQake
         6cavriNqS3jeWbJiAhlVCsKULCO4xrzQ67acb8Li5vYRQjBr3e1Q+YtvilCF6rMP8R3k
         2afQOo/PH0X+zLA9uZJdJshwtzy9D4LykTDhH9fhW50GsjlvlwydLKp2/jkmulIXjdfV
         iLAPcnBMGyhrvmxlE4A65eiK6kUKM5ouinxnvqLld5HfMmxHN7uCIo+yF+hRGBq7UQq5
         rOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855359; x=1756460159;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZxLpTKOOWK60iUyTwkthGNDuDdK23AvQqmpjQR3hIsQ=;
        b=PAVMpwL/Wksy/Gjm/jzoY4NhzKTvBEUjADg27w7W8cZGekwWHCtQyG4iWliPWFteQS
         E59Gy4M1Jwk5odOIqSXIB0/g91LE34jfBgcYQ0/IrMfa8RO+asQ988tHh15SeMT/Lz8v
         DJmLCS5qYIRbZWycIunGRVZNO1QzWAR91sVZt5vacaS4zevhO29liNKF2ekUdc5KtSVw
         0+5Tbymhhox2hZD2bWe9qBgioQFQqhVSDcxfZF4PUK31rKL7BF5ol0r/WfLBdCMoDKSK
         2yQtVJJqJJJoPikEiy8hupModaRLy9LMwkWJdQUDMuH4F8Krt93ZmZnO2X/yobkKU6Cp
         1OOw==
X-Forwarded-Encrypted: i=1; AJvYcCWbxqmNL5mKUncSVBvGRO7U4Nq+vUm3LaJaUZAkpeKuGa5Oklx3/uR896so362ZA5ZyH3Bx949+VC67l6v8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz4mf56P/cliS+qOx0NFZJwvHJ5MM9U+Tjc1wBZirPr8tXhykK
	wsNxNjtRJHWhPGeh/tyUjIzqBaM5a2iynmhVdMZ0HzUuh04sMy05DLVtfIdJ1m/E9i0=
X-Gm-Gg: ASbGnct3Fl5oUcZaZYmzCO/645N62VorZcagvhZr2VTKZLQemw47GQRYiYcveDhnt5n
	pMk9wUCgdFNWUX8gnmflqSUXFH5Bpu4DwVI3UbT9hRQLISH7/mYbn+Q7G8HcyvGfm+h1uS0WEwQ
	qu3Z/8qI90rRLQR15F59MrRVHCEMTx5RPh1Tdbvn9MjqpccGpjtl2ywK6sOIt7NSZWFQZ6bxJUn
	zmeNSbYJtk6Zj5TtQ+6v0srWWhHk9BBB3//MFfEJbKOdwYiJRb5nQyC+QS6mY9g9mQPSVXIMN1i
	DQEErqP30nDP3kPVr1z+JgQqcvSMUiz/3PlLqK0ape7o3ZnM8WDhrykNkQy0SCJ6dWdheeghKyF
	FTz2tgh4XKSYLq8HrrnUWZALahe1/UL+/xFF5mkX1lEw1UPYgJ9UgSrYs0bcIE9VEIvHzyaRxIH
	M=
X-Google-Smtp-Source: AGHT+IFovM2SabCJH2b5MRiF8TjGggfusVSGcoBGMzu394048iNqTSwG6Bm7+5IKEuykg1H96jwtJA==
X-Received: by 2002:a05:600c:5491:b0:459:db80:c2d0 with SMTP id 5b1f17b1804b1-45b517954ddmr17227815e9.7.1755855359262;
        Fri, 22 Aug 2025 02:35:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3dd7:7361:c101:6a77? ([2a01:e0a:3d9:2080:3dd7:7361:c101:6a77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e42433sm28546625e9.23.2025.08.22.02.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 02:35:58 -0700 (PDT)
Message-ID: <cae41451-39ca-4538-a74c-39701d30073f@linaro.org>
Date: Fri, 22 Aug 2025 11:35:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 04/10] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 Add missing pinctrl for eDP HPD
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Abel Vesa <abel.vesa@linaro.org>, Xilin Wu <wuxilin123@gmail.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Srinivas Kandagatla <srini@kernel.org>, Sibi Sankar
 <quic_sibis@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20250822-x1e80100-add-edp-hpd-v2-0-6310176239a6@linaro.org>
 <20250822-x1e80100-add-edp-hpd-v2-4-6310176239a6@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250822-x1e80100-add-edp-hpd-v2-4-6310176239a6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/08/2025 11:28, Stephan Gerhold wrote:
> At the moment, we indirectly rely on the boot firmware to set up the
> pinctrl for the eDP HPD line coming from the internal display. If the boot
> firmware does not configure the display (e.g. because a different display
> is selected for output in the UEFI settings), then the display fails to
> come up and there are several errors in the kernel log:
> 
>   [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
>   [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
>   [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
>   ...
> 
> Fix this by adding the missing pinctrl for gpio119 (func1/edp0_hot and
> bias-disable according to the ACPI DSDT), which is defined as
> &edp0_hpd_default template in x1e80100.dtsi.
> 
> Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 4cf61c2a34e31233b1adc93332bcabef22de3f86..76d491f085db2eb6ba8c8358063882611446ae72 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -1010,6 +1010,9 @@ &mdss_dp1_out {
>   &mdss_dp3 {
>   	/delete-property/ #sound-dai-cells;
>   
> +	pinctrl-0 = <&edp0_hpd_default>;
> +	pinctrl-names = "default";
> +
>   	status = "okay";
>   
>   	aux-bus {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Lenovo Thinkpad T14s OLED

