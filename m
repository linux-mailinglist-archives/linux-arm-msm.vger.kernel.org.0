Return-Path: <linux-arm-msm+bounces-51203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A7FA5E662
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 22:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A99173AA9FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 21:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096541EE00F;
	Wed, 12 Mar 2025 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PZSdpyhc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05831EF091
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 21:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741814314; cv=none; b=E3FUaBtu5D3Ods+mIFXGFa9PWn2QgN2YLX9cQb0H1G7GnoIPHA63cnsZaWOtyoIT+zAojV3psHFuisxnVA065ht9bQoZSiFXhsP20mUSK8AigGYptCYj/Q+eLU/KFDFrfQBhsOwqiR8CIwGYqGqoeT0rWANYH3wpQFWj97XYADY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741814314; c=relaxed/simple;
	bh=ZRK1QnXjKXmwtDsvZ8yDGFinnbLW9DNcB1m9v5f4NfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZyEkEqHD0e4btXev11G8witBZEVBGPAUnVX9rEs4zJiHnkruZn4eEwJOkz12BIb7wXBthXdPk8bwJ20jU8fJNULoi3QUIexzg1nzuP8ioc8MlowMb1MdUPxQ/uOaTJjDBX/T0u65JIZvUFcdsIvoIUYAk8RZmffPJDX8aYAN9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PZSdpyhc; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac29fd22163so47467266b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 14:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741814311; x=1742419111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAAaCcWnu1E/LRXYBdsReUtTWQq4VO+o7nDriwfTZMA=;
        b=PZSdpyhcx9baOD6p13Y8JPBzfj7ODwsrjfhtnNPCz2kEveMmpXe2m/0I8gENluL+hM
         TEz3P+uVjY8NLIM+P75nO9HkVyf7qX2ikx4yFVF5Z9GddSurC7rqLxboCwJuSOHEMelf
         nX0W/TuTR8iNDPAu0LibXAvq+1mHjtK+dL27kK6n7XT4LRghU2PYQqs7plZ0DSeljZ40
         jq6CwIFJJ9aheKfvtl/KS7JUifI5A1O7QVbMN9WotBGKy2fG+uDKpYs/J1eJYk46Ibm9
         hAwmnKK9RUG9WU8ZcmAoOxXTbLMCZl0jaV1V728MFtgyAMWmEsKPLAGWNbhtCz/JiApQ
         Y4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741814311; x=1742419111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAAaCcWnu1E/LRXYBdsReUtTWQq4VO+o7nDriwfTZMA=;
        b=t32yRmGq3LpRqudNHeDRGf73sOwovNNb4CeB4590zeoMNZYzLY29jKYrYvov4g+FHT
         uphYwfrhLyDOEZAHgyBu8iKylTDbE9oOeS/3QB5coDaQk6ib1NfNnwTReNO14ExLrxUP
         d/DFre0qcM0nngB1HShcKJOe5ARw8RgbXjukjASDINVO+zUaYTy7KxFKhprbg3ls8RP0
         ChL7OiJWQN6AzIgKQqVGNRPPuWf5hzS1GSDRmUxAP5TfRiqCzPJjlXCpnGxCLzGZvc/T
         ILQL8sjoAuhat6ZlkPdbEqfDywwwcQV5W1hH+GLHmr5V08hOolnulPWV6gtmdF5uqL5z
         /ytQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6i2DjeaYqnTK/1hB64zBec7p0739zr92qk6L0NbKTxaqNdTt2ltUgKHwc1UGsDMYVMwgRNveBn8LLtNWz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwjf4XlxtfM6C/6J7Wwzh0NEZHzzQ95G4SEg3k7BoppnzOvjmN
	n4RrQRAxkt5LmLIsqiBGqClO4tZCnuOc8sHo5ix1uR/R6eEyuDM26YBXnNW+n78=
X-Gm-Gg: ASbGncuYBwHPmSi7HFWAODGI3NAgFtzTflX4fdgVrnegIVUoaM/65qTK6TNUWdnCMFh
	+5KnN52AnTkISDMjIdh//l8OrbLO949ZMCGAsJEpDajd8/JHN7eALS3NgqLEJitsuMwm/7EGwuS
	fbvjuEzDzVMfEbiKbabRgyK/x3dgucn3FjEhp5It/nBusUkUDOJ7DRf71K4jLfIb2iP/r/kWbrT
	3swz1CXNWQ8B8sdq2/kAuZ6NHBlbr00fqyGiCIV3JdtcDwGaOZsT/TIzxxU6SG1q88Irht5XiwD
	Uzn99VDwYcCzjCKAymqdmADBzuvEpEGhAatbRVzn56KfiB1/PLE5+CVtkROFxZ6d4bNrLEXTsy2
	sjwkUEECaSD1md8JlywSW911bGX3OvkBjKb0wz8M44iGLuHo3W8tdh0AMfKQg2cGkXIV4YiN0D2
	Z50giO33HnMDQxj1k4prAMRzI/z2bQQyo=
X-Google-Smtp-Source: AGHT+IGhFP/qkL3DgglwZ5MvHJdcpcSeJ8ki8DIky3RR3GH88+4MNn/psSZ2uCJxfybLvhHcJQ+E+A==
X-Received: by 2002:a17:907:cf46:b0:ac2:a42a:999b with SMTP id a640c23a62f3a-ac2a42a9e35mr1789666366b.52.1741814310999;
        Wed, 12 Mar 2025 14:18:30 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac25ab328b6sm939324866b.124.2025.03.12.14.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 14:18:30 -0700 (PDT)
Message-ID: <0b1a0db4-35b7-4098-8539-cd73cb396635@linaro.org>
Date: Wed, 12 Mar 2025 21:18:29 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650: Add description of MCLK
 pins
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
 <20250312001132.1832655-4-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250312001132.1832655-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2025 00:11, Vladimir Zapolskiy wrote:
> Add fixed MCLK pin descriptions for all pins with such supported
> function.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 144 +++++++++++++++++++++++++++
>   1 file changed, 144 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index bf5e238a93c3..526ef2ae8ac8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5792,6 +5792,150 @@ tlmm: pinctrl@f100000 {
>   
>   			wakeup-parent = <&pdc>;
>   
> +			cam0_default: cam0-default-state {
> +				mclk-pins {
> +					pins = "gpio100";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam0_sleep: cam0-sleep-state {
> +				mclk-pins {
> +					pins = "gpio100";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cam1_default: cam1-default-state {
> +				mclk-pins {
> +					pins = "gpio101";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam1_sleep: cam1-sleep-state {
> +				mclk-pins {
> +					pins = "gpio101";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cam2_default: cam2-default-state {
> +				mclk-pins {
> +					pins = "gpio102";
> +					function = "cam_aon_mclk2";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam2_sleep: cam2-sleep-state {
> +				mclk-pins {
> +					pins = "gpio102";
> +					function = "cam_aon_mclk2";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cam3_default: cam3-default-state {
> +				mclk-pins {
> +					pins = "gpio103";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam3_sleep: cam3-sleep-state {
> +				mclk-pins {
> +					pins = "gpio103";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cam4_default: cam4-default-state {
> +				mclk-pins {
> +					pins = "gpio104";
> +					function = "cam_aon_mclk4";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam4_sleep: cam4-sleep-state {
> +				mclk-pins {
> +					pins = "gpio104";
> +					function = "cam_aon_mclk4";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cam5_default: cam5-default-state {
> +				mclk-pins {
> +					pins = "gpio105";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam5_sleep: cam5-sleep-state {
> +				mclk-pins {
> +					pins = "gpio105";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cam6_default: cam6-default-state {
> +				mclk-pins {
> +					pins = "gpio108";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam6_sleep: cam6-sleep-state {
> +				mclk-pins {
> +					pins = "gpio108";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cam7_default: cam7-default-state {
> +				mclk-pins {
> +					pins = "gpio106";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam7_sleep: cam7-sleep-state {
> +				mclk-pins {
> +					pins = "gpio106";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
>   			cci0_0_default: cci0-0-default-state {
>   				sda-pins {
>   					pins = "gpio113";

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

