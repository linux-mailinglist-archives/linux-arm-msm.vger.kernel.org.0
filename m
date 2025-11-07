Return-Path: <linux-arm-msm+bounces-80739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C194C3F73D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 11:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BCB614F08ED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 10:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D5C307499;
	Fri,  7 Nov 2025 10:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wpanJxG3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69BE306B3C
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511403; cv=none; b=R1Rv2Te7Z/IhtO03iuJLs9psz+2OkVtQuCWWOV282c9gLwuP0zHXcquonzL10qYmDRQxJt/756CP44IGFSxufosJTdb1LE/vKryThS2AkT47qJ3sJuYapEQrvs/Wsa3ZNpN7tVPay3Vth0QmTE0fKScKrpdtG0XQXrZdbFYjw/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511403; c=relaxed/simple;
	bh=m5d721Yy3lW2doEUut7bEWlUQ9IUBg3A54OTCGOC4vA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i95BxoFqVL3DWzUbXdK0NqpzsWbcM/lwKB8QrHvMP1VE1WUwSG+T7ItffhoSG40JdOrTUEJVyCO7dnDFSCUtGvPn7LCUd1I5PluPEMAZieEZzNFzOzlh+ZUhWbGUAdhXPWbeKDa7o1CDTCz6v0nszJZ4gLPieSD7WgXhJ3ix8cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wpanJxG3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-429c4c65485so442799f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 02:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762511400; x=1763116200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzJdDr8jT3GemwsLQrjuBPmeNqyjPaYBy9t5ryQykAI=;
        b=wpanJxG3wFyBNXZ578PiJuh8mBEBPByYwtG90tdFDSarou9jehtLo8Ohm06Bv89Q/k
         O5ZnRh+/Fq618Cq/m9eh5xvE5eKj8gU/c/cKoHM5kAOPn07GToDBOt5cQ/3bUQseD0+F
         n5w08H9dHHJvEEokTWcZLyCUGCj37CTZkN4O0DQ+eIYJP953SJj3cLGvL7++BIcuCWog
         R0Pd37Ifjp5qiiOrEUco0FSQAOHbtAVMYZCKG4gzcHVJrJzg0mCUyeL9CHa8y78qges8
         Co07M7zoyf3BCYJIBPdNhAWjhvGAtcWPkOp6YxSP7ZAELvdwUK4MP/Z4DPcqrj1qhijD
         LJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511400; x=1763116200;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzJdDr8jT3GemwsLQrjuBPmeNqyjPaYBy9t5ryQykAI=;
        b=NZHDhH+bWenPZqfYMkDcX/4OgHXkWyb263lugsETYNy7RqqIjCZGhhNp5p6DL7i2xX
         ReiGuJ/HPVDw+altfnRlt9Y8yutgxfxa1blqZZIWKiAhy0+QHdZVgOw8lQQnszb3DiIX
         nLhVTexvx5I6uTFO6nwWRbFtplPfvjw5cOxMbSfXz6dmuLH1QMBIhMFnM8uPQs30f+ud
         A1b2boUrJLglzTwktFvhainT+iV46BsroND7gfKPjQsDrnQt5WIQ8imb5VrLd7Zy9j3g
         IhcaSWo0A8t8QpEf2XijjYiGLuoQeQYSX1wP61xm1KwtFwZ2zLabPWYqmVaI5CuBgMuD
         K1uA==
X-Forwarded-Encrypted: i=1; AJvYcCUlKwPPpgL/ZaKySwSyISwMd4UITnuM/p7WQvSdFxaDnfiCKCeT1XCKf2UoHSkAcmFQkCbs3Zrk+jfukSsl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6zJ4mV9/oH4hyXz642gSLQJM5XUkLNyG/W2mkL2Vfj6JzY29X
	T6uVBetMIpIKB7+4lhNr0kvVKaxyUa7I32sifN+UlRUqBDz51759Rf/YibsirFTclf8=
X-Gm-Gg: ASbGncsI3ButDdFlKPTSdP8vpssUZ26nh79Hp9dDaOYnjdTzLXwYzDy65Fhjnl23Esd
	qI/WJRovByzdVizo+NAmTYbmsHCsLogZKAHETK4iCmNeLTtx/Xu+etdOf5bcaW56PTDV/U/E8ql
	qMkcAyXXRyPD91oJfu6Bs6Ys0qqcDC/Wu2n2vAJtl2Rwt3CQE4P8RfVPUtjMi50SGJVv7ViHmcK
	aTt7vU01NmqfwXsmkrxsKVx1sE/tjHQRJPNf6EpX6GG57PO++xAQYJvzHY3rUHg49C/Jm5yEP7/
	Faip2AJRnAhKtWeK6VF5kXNwZmEeWuemlji/pYSMuhjfLvGLqraHVuT8kmVAGDOb/+T+tynbG+v
	XNyTlanUdZctFbc+V/QgK6U7IglLFQLvtGSFcEN3S/gAKtkGlPIxKB8y3jf1gN47Mbf9qy7GNwS
	Cpjn6ZujLgkzDfScp8Pk3TJAflG/6s0cnITw==
X-Google-Smtp-Source: AGHT+IE69e5l5cOozP9JY3Ziazpg/eov5deqOjoVSoYmOv/JqlCyW2ba+BjI9566+vMU8zMOQoHwdQ==
X-Received: by 2002:a05:6000:26c6:b0:429:8c31:84c9 with SMTP id ffacd0b85a97d-42aefb496bamr2186903f8f.61.1762511399906;
        Fri, 07 Nov 2025 02:29:59 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679214asm4687520f8f.38.2025.11.07.02.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:29:59 -0800 (PST)
Message-ID: <54fd0f0c-fd76-4230-9cae-cae6037b5b08@linaro.org>
Date: Fri, 7 Nov 2025 11:29:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC] arm64: dts: qcom: x1e80100: Fix USB combo PHYs SS1
 and SS2 ref clocks
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251103-dts-qcom-x1e80100-fix-combo-ref-clks-v1-1-f395ec3cb7e8@linaro.org>
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
In-Reply-To: <20251103-dts-qcom-x1e80100-fix-combo-ref-clks-v1-1-f395ec3cb7e8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/25 17:51, Abel Vesa wrote:
> It seems the USB combo SS1 and SS2 ref clocks have another gate, unlike
> the SS0. These gates are part of the TCSR clock controller.
> 
> At least on Dell XPS 13 (9345), if the ref clock provided by the TCSR
> clock controller for SS1 PHY is disabled on the clk_disable_unused late
> initcall, the PHY fails to initialize. It doesn't happen on the SS0 PHY
> and the SS2 is not used on this device.
> 
> This doesn't seem to be a problem on CRD though. It might be that the
> RPMh has a vote for it from some other consumer and does not actually
> disable it when ther kernel drops its vote.
> 
> Either way, these TCSR provided clocks seem to be the correct ones for
> the SS1 and SS2, so use them instead.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> I dropped the clk_ignore_unused on my XPS13 a while ago, but only
> realized now that usb_1_ss1_qmpphy (the left hand Type-C port)
> doesn't initialize successfully.
> 
> Traced it to the TCSR_USB_4_2_CLKREF_EN and then checked the Glymur DT
> patchset. It seems it already does this for the SS1 and SS2 PHYs:
> https://lore.kernel.org/all/20250925-v3_glymur_introduction-v1-23-24b601bbecc0@oss.qualcomm.com/
> 
> I think replacing the bi_tcxo is the better option, since the bi_tcxo
> is already the parent of every clock provided by the TCSR, including
> these for the SS1 and SS2 combo PHYs.
> ---
>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index a17900eacb20396a9792efcfcd6ce6dd877435d1..9c9e567731556ff532fa64c7595e2570b0597da3 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -2937,7 +2937,7 @@ usb_1_ss1_qmpphy: phy@fda000 {
>   			reg = <0 0x00fda000 0 0x4000>;
>   
>   			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
> -				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&tcsr TCSR_USB4_1_CLKREF_EN>,
>   				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
>   				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
>   			clock-names = "aux",
> @@ -3008,7 +3008,7 @@ usb_1_ss2_qmpphy: phy@fdf000 {
>   			reg = <0 0x00fdf000 0 0x4000>;
>   
>   			clocks = <&gcc GCC_USB3_TERT_PHY_AUX_CLK>,
> -				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&tcsr TCSR_USB4_2_CLKREF_EN>,
>   				 <&gcc GCC_USB3_TERT_PHY_COM_AUX_CLK>,
>   				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>;
>   			clock-names = "aux",
> 
> ---
> base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
> change-id: 20251103-dts-qcom-x1e80100-fix-combo-ref-clks-bcbffeb4269d
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

