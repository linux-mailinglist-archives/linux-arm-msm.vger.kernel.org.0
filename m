Return-Path: <linux-arm-msm+bounces-30418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DC9968B75
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 18:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E94F1C21E9C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 16:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1591A2639;
	Mon,  2 Sep 2024 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e8wK5sYs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B5519F121
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Sep 2024 16:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725292908; cv=none; b=SCW7M3SvDENstsPGLVAFrMFIXBasIpQgR//sGw62S2F0OvYpii86F/nz1HzkkhMjGj0rWHinnZlRPO6jewxwAqIiggrSf9fez67ToJLpVNpXJD++MPr1Ax14IO383B42DcDuIHzcYCSfzgKkh883aRQF9Np3KMT7vWIeCveupRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725292908; c=relaxed/simple;
	bh=q1Sk8iuFNM9LQs8bptLDUAHhOMaqgVIg77iI7T6Vu8A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=by9y1BZoJIcN6e5R4enXr6htLURUfmypVMQqfGKWEhxzdq+Hiqsceo8FqGVDroFV8rp/6285atCs9Zxodt3bW23crSwI5Op9SLtf0yg96OmPkkPOLKaDSnI+CP4cyKmZzYGWdEWBDW+ip9jO7OFJOFj0482v+racY2zQD2l3FwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e8wK5sYs; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42bb6d3e260so37820345e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 09:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725292905; x=1725897705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SF/Ff5WyVgapJBUAlK400SzZpWZqi3ZPw8P5uireNeY=;
        b=e8wK5sYsjM0AD8LzuG7K+7Xl/+zk638xdmWTZ1BTH4jI2VoTmhmjzRW4vmu0KveuED
         pTUiuldzjftnjn5xS/dllodJFBde9dDHHazU/T+gD8/iUn3EL/+RKDKwT+RDjN4cOuSY
         DabfxJih/6s2w2OlarvpL0Bp7F9f3/Q/CX9zRVuVB0IIzeXXCvCe9tlUB2rDgJv0cqwm
         Drm4JwFO2QWFJIeuGtPl42BxX+TIFt5G0S5B/WilEvfXOL5flVLn2c9ApoXeLaztFsZq
         ESIU41qcBrDzBkCFm8LQ9rGmWptL2MneSC/7CWww1gShlvQjurc4vJKFqUsQs0dBrwEx
         EejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725292905; x=1725897705;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SF/Ff5WyVgapJBUAlK400SzZpWZqi3ZPw8P5uireNeY=;
        b=ngsmm6f1fL0JvmAFcDXl5V1eYHGNMVXSKXdKBZaTNbVi4T1n+9K8OSfkZQEHsR9X+S
         cvgABDzXthO2V+0/FcUrs1qxV7LW2Ja8YVTtZzGjNqaVSCg9NTnDYF0S+O+0xvnoEmt5
         qXin/PwMUInMjYRci4UnoP/JZsMVZHr2kadPK8irX21Hhl3wUtZVt/tLM4DxnDM8Y5ES
         RURIkh6c10On6B2kzgbBCrD/ONTg7dL+1iE/qWMKMJIGkWYCfelhTCXajevUW5qmtvfs
         c1rLFUIIlC2L2v96aSNzH949HjK5C1pL0rR76Sre/8WhADDwgEQkuwd9WUOxDCai23GR
         Y04A==
X-Forwarded-Encrypted: i=1; AJvYcCUb0vsVOU35iGuz5lQ8tY9YAao/UizXIo+aVKYCjNJdO4/An7xWQ/ngzstSuCmSrF9vRrorg1OGZgdPZRWk@vger.kernel.org
X-Gm-Message-State: AOJu0YyotBKXUmeZ2ZW9ngqX001qb6C8PlB94Uam3fjY8q0gbdkJx6KA
	F3GaTWRRCQgP5o2+nU/Q/i3FUB2qQHDTBz/VePRDZHXPQstpca/H6rRv279d2HY=
X-Google-Smtp-Source: AGHT+IF1FhUQ7IvRKPdMigexj7urXN7rPlu172HF+X6OH59nohe9A0m5J5raB29jCzlTZvWnIcmgDA==
X-Received: by 2002:a05:600c:1d27:b0:428:9ba:39f with SMTP id 5b1f17b1804b1-42bdc6333bdmr57198385e9.11.1725292904649;
        Mon, 02 Sep 2024 09:01:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7dba:3cd0:a1f4:e3fa? ([2a01:e0a:982:cbb0:7dba:3cd0:a1f4:e3fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba639d512sm175180525e9.18.2024.09.02.09.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 09:01:44 -0700 (PDT)
Message-ID: <925061d3-9894-4332-8c2a-e494ad22c66b@linaro.org>
Date: Mon, 2 Sep 2024 18:01:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-romulus: Set up USB
 Multiport controller
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>,
 20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org
References: <20240902-topic-sl7_updates-v1-0-3ee667e6652d@quicinc.com>
 <20240902-topic-sl7_updates-v1-2-3ee667e6652d@quicinc.com>
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
In-Reply-To: <20240902-topic-sl7_updates-v1-2-3ee667e6652d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2024 16:50, Konrad Dybcio wrote:
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
> 
> The USB MP controller is wired up to the USB-A port on the left side
> and to the Surface Connector on the right side. Configure it.
> 
> While at it, remove a stray double \n.
> 
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
> ---
>   .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 59 +++++++++++++++++++++-
>   1 file changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> index 5419d0b02785..ac2acf949b70 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> @@ -572,7 +572,17 @@ &i2c5 {
>   
>   	status = "okay";
>   
> -	/* Something @4f */
> +	ptn3222: redriver@4f {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x4f>;
> +
> +		reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
> +
> +		vdd3v3-supply = <&vreg_l13b>;
> +		vdd1v8-supply = <&vreg_l4b>;
> +
> +		#phy-cells = <0>;

It's unrelated to mutiport USB-A, should go in a separate change,
and also probably in a bigger change enabling usb-c features using
the retimer.

Neil

> +	};
>   };
>   
>   &i2c7 {
> @@ -583,7 +593,6 @@ &i2c7 {
>   	/* PS8830 USB retimer @8 */
>   };
>   
> -
>   &mdss {
>   	status = "okay";
>   };
> @@ -717,6 +726,15 @@ &smb2360_1_eusb2_repeater {
>   	vdd3-supply = <&vreg_l14b>;
>   };
>   
> +&smb2360_2 {
> +	status = "okay";
> +};
> +
> +&smb2360_2_eusb2_repeater {
> +	vdd18-supply = <&vreg_l3d>;
> +	vdd3-supply = <&vreg_l8b>;
> +};
> +
>   &tlmm {
>   	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
>   			       <238 1>; /* UFS Reset */
> @@ -856,3 +874,40 @@ &usb_1_ss1_dwc3_hs {
>   &usb_1_ss1_qmpphy_out {
>   	remote-endpoint = <&pmic_glink_ss1_ss_in>;
>   };
> +
> +/* MP0 goes to the Surface Connector, MP1 goes to the USB-A port */
> +&usb_mp {
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy0 {
> +	vdd-supply = <&vreg_l2e>;
> +	vdda12-supply = <&vreg_l2j>;
> +
> +	phys = <&smb2360_2_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy1 {
> +	vdd-supply = <&vreg_l2e>;
> +	vdda12-supply = <&vreg_l2j>;
> +
> +	phys = <&ptn3222>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy0 {
> +	vdda-phy-supply = <&vreg_l3e>;
> +	vdda-pll-supply = <&vreg_l3c>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy1 {
> +	vdda-phy-supply = <&vreg_l3e>;
> +	vdda-pll-supply = <&vreg_l3c>;
> +
> +	status = "okay";
> +};
> 


