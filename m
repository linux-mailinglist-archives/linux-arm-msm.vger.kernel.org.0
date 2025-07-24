Return-Path: <linux-arm-msm+bounces-66442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF57FB10367
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 10:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3486E189A0D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 08:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE102749C9;
	Thu, 24 Jul 2025 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y09Qmn33"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4842749CD
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753345209; cv=none; b=S8vM49d738gZwKbs3id2s9KTMG/yB9op/Gp1PZx7haZsOoFi2QvkYp2tNxKjCMfmUpouojpwdRE+ItbBAPzyEAjFgk7q/sxFV6huRHDiGIm5QO8X55Gn1FrBug0EZ8A1dTo0DzkdzxC4zWYBCYLNjlSIgnBZsjrvDJ2wDIdJOsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753345209; c=relaxed/simple;
	bh=zdjUOV5VLfUOfX2jC9gvpXSoRGzu77A6WDjzl1O8nQ8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=i+Hh5o9woY5pEkVVNuUrURQHvaTIvV5Wzi2fdSA9tn4FRc2b9E8cccB6NRw7/wYqacNtb1y0PABF/IzO6yNv1S9hbKcFRdIXua20kVT2t9vSeqlBUANNPFSKGceWRjgFKM9cQXuu94vLc83OrVHMe1+O80CZ3WSWUyswebpkwGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y09Qmn33; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so334743f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753345206; x=1753950006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FdmlstLnkttVYH+Av5Wxpm50CkHTFn7Ud/HRCiiFb0=;
        b=y09Qmn33Yf/W6u1vtuFTxWrNLOj9RxDvPsuIYx+RA4ODSMombJc/9/NZFtMeDoddRg
         xuQYjlMJA3+v58PIsDv4JJEl2pdDClog7/eqxFVoj6JMoF28eAFHl+1GldT5b/EDkGYF
         HsvSfh+nk3aNgDTSTpxTezhj/d54zu8voEEEMO4sCErtKqYNiW+1tumGksfySb+rNyp3
         8K5PBr5hVA90F0vxCfflWOHsLrpo+I8kWv4u8U0sl38xG0ZaZdabf0Ilnpuv5pHWvGIF
         ICLJS87zM6zTybPtembdwLzGh/mHrWbg5i++04n+yBT155AR4n/KI+B2v3UtpIovZEIT
         x+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753345206; x=1753950006;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7FdmlstLnkttVYH+Av5Wxpm50CkHTFn7Ud/HRCiiFb0=;
        b=TmVSfSTuDr27dwWfXbCRMhQZ60DBkJ0n1TSCtllEe4RqUpslgSUmzymFp8ID38EsfX
         DpTNjZoFGwYyPdBENLNYypvoJHaBK0wXHf22CSpquCl7AFAvzFKaK1CkptDr4pKBezhq
         FJya/u2iIvBVvyscmwZ7X61SZcJhnZ1/u0oXenAnqRTki9WIJZHu/T81dLduitKGS8ss
         IrvfP8mjxizznoFVwpVrnACZNs8WI3Ud1ssgBfhJKFEGRuzfp87eCtfG/1zTB1UhkOa9
         JVl7GC5GRgERmeK8A+YIz/4LIrz32EBqC5dTJDb+0DzIGY9TjvYuKGRESKtKjuJ3Hm+0
         0zhA==
X-Forwarded-Encrypted: i=1; AJvYcCV1nL5X/SW/iqm+ea+8udhyslh1HdaNGvg25XXycwodk30+5X+DVwCFiYtDXwvruJpVpGrrnQeOqpn8VzTa@vger.kernel.org
X-Gm-Message-State: AOJu0YyNZK9fagiqGdhIlKlcHau56TsXQr+Ph+CquikqhK2JO8+6ATMh
	v5q6cmbchDhU2sQdAO3U1nmv15Bthbx4kwPPf6wsMFOKAPgh+93BiUIz9MTZrb1K1sI=
X-Gm-Gg: ASbGnctN6wQpL1xopIGqbiIs/HkGDtzpyGUpsr3ODBZB4djN6DPJUFaF07VwZq3ltyv
	xZP7YisF1fCHwN7o7ClVjbrVCRHOLnoptjiCjoPZDU9kgfgvIjHa1LcHfwkKgueQ4HCn9rexCG/
	GtHEdMBxEadR/2GKMXLfFNM/5H5J/STQJNqzFDivg+bb3I5T91fRIXQr4zn1BV7C1ZOaPl6B9rQ
	HuZUyOCVCgPjzB7pK4RfJtiiiE/QP/w8Tdh9EFsg1BTal8flYFH4wiyLy7rxl/y1qfDVHjcg8mZ
	It+6GJ5wDy+7TrTQCWaF7s1C8DzfRuMBo0/Q6ElkT3itr/PEYDPT0Y8P7FSun47/eBtnstVmYTh
	xW6i0vbri8trNGdOTEnG8+MD/P4vSD3Qs
X-Google-Smtp-Source: AGHT+IGHiElzTF/gXef/+TO8x62wPd+zvsVrwxUQ5wkCAUo0PV/PAIhvByy+nqqydTSRIhHh52MS9g==
X-Received: by 2002:a05:6000:40da:b0:3a4:ee3f:8e1e with SMTP id ffacd0b85a97d-3b768f026fdmr4924247f8f.39.1753345206330;
        Thu, 24 Jul 2025 01:20:06 -0700 (PDT)
Received: from [172.20.10.3] ([78.246.240.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc71437sm1382862f8f.29.2025.07.24.01.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 01:20:05 -0700 (PDT)
Message-ID: <f36b7706-5b92-4187-986a-8dd8378051cc@linaro.org>
Date: Thu, 24 Jul 2025 10:20:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 21/23] arm64: dts: qcom: sm8550: add sound prefix for wsa2
To: srinivas.kandagatla@oss.qualcomm.com, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250723222737.35561-22-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20250723222737.35561-22-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/07/2025 00:27, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> WSA and WSA2 are two instances of WSA codec macro, this can lead
> dupicate dapm widgets and mixers resulting in failing to probe


duplicate

> soundcard if both of these instances are part of the dai-link.
> 
> Correct way to address this is to add sound-name-prefix to WSA2
> instances to avoid such confilcting mixers and dapm widgets.

conflicting

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index d35d2b9b438d..5f748f6eb27a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2811,6 +2811,7 @@ lpass_wsa2macro: codec@6aa0000 {
>   			#clock-cells = <0>;
>   			clock-output-names = "wsa2-mclk";
>   			#sound-dai-cells = <1>;
> +			sound-name-prefix = "WSA2";
>   		};
>   
>   		swr3: soundwire@6ab0000 {


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

