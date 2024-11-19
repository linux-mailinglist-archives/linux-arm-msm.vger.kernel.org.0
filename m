Return-Path: <linux-arm-msm+bounces-38322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D0F9D286E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 15:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6F97B23F43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 14:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F671CEE89;
	Tue, 19 Nov 2024 14:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZPDAM1sq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE881CDFC3
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732027363; cv=none; b=vCUhnJfcBDcMCXoq4GfA3A3yVeivpRT/VglIeCSjD5DOZKCzJmCA8TVT+5a10pwlDoDKTh/YplIrP796+H8WhrtTyWOT5TL0Qx9Z/hYWiMFH5JUD9kae4KWEN3VV7nzj3oXrxyjXfWTRN39iZDGnR3an2hOHe3pwo0G00NpRlpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732027363; c=relaxed/simple;
	bh=R1ajexPdvIphNIra9AbXXEdtkHIsL7C7g6E/2DMe70c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FLUA4yLT86kMiEW+TFr5XZpQHuND8xJwwo3AizjCMcqqHl+uN5Y26eYGeVJPHzP5RBVo6TxCTH34zbzBvkOyEKqLX9CskUbHc+0y9296oNta8a8Hi8jTiwuNkNp8+NwsmbocbHPXhIltmsLeQGe36gNVfOu4yq1yNtzPl359eww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZPDAM1sq; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539ea686fd7so806544e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 06:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732027360; x=1732632160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SurX9BN/DC6DwAYMxE7Q/YA36Hgd/kBmE7ViWjyPVZI=;
        b=ZPDAM1sqMNXQF9A57xk1j8DmXzgOKHe50RQA8z8svMZD1z/Fe74FTqsm/RDOoj8A3K
         IJF6pTgm2ORmMMpWNFuAIXIpVJUjqDr8SrZL39wkku5MBkKzy/RYTCdECcI5niPaQMuT
         oDAkCWSA2DP6hV4PeRCbj6qLdow/Lh9eeLM97CYaE4d5GZSr13SqpqTRAtRUolF+Cm3r
         Hh1C07KHsajzwbnpwtmOZkWKQ21IUj69WqlnaKEIkuuzJEkj60FDlEAmbc6SWBZF7vx8
         Koy/Thy8dKE5W9msT8N7pvcC/Jp0wLKaUYxBlMd7mkkno4uzDZU6ZdRc+5/elqZuw07k
         kBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732027360; x=1732632160;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SurX9BN/DC6DwAYMxE7Q/YA36Hgd/kBmE7ViWjyPVZI=;
        b=YW6BWezIrUxoLkox7pJIqK5nx3EW82+Su02emUveZ20UEM/OgsRjz6k2KaBGXTIP7z
         B44rhMt/AFQ3Gd7MlF8XuyiEzNQPYz+O2+pfNkFeanGkFLcwKPNA2zFNLyKstJLuL4ZU
         9NhoNp1A3yGD0TbRnUj9XqSZLDLuXWy8GYGwaWB5IJUg3bmbGNtlPTldxMFdu25kFLn5
         KpcKD2Q8HZtnrSrSzTBENTBiszrcoZGOlEQOMCOrPNF5BKXyqzYDx1sVTT/3b0rJQSSy
         u5P1vQcissSlO/L2IUGhKVzgxo0pBLcjfYvb55mDKSRqQ07ti8FVRLhrD/zUuSXnSfoU
         WyVA==
X-Forwarded-Encrypted: i=1; AJvYcCUC5jmuPavUKEbMlgghkmkD4+MyVbzrHwAKPWUUUW7xqrdX577DNymslUO/B43v6M4n8FO1UCli2NnO3qjU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa4+PW9l2zv6rP5spXty2WarjRZr46/gdzZhPzxG9ZE0mXAC8+
	O9TAfHCh/08kao1jNQHjPUTnLq6MJWicDZxvyp93EzaAT849k6BVhwi+mg2khvo=
X-Google-Smtp-Source: AGHT+IH6JYGkb1+ne7m5ZidGIkGxvPbPnmcyh3tZvzx/YGyvq8DGZAWthS85I5lGqDqBX/Teybn7UA==
X-Received: by 2002:a05:6512:3404:b0:535:4144:e682 with SMTP id 2adb3069b0e04-53dab3aedf3mr2250335e87.11.1732027359788;
        Tue, 19 Nov 2024 06:42:39 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd46735bsm310929e87.161.2024.11.19.06.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 06:42:38 -0800 (PST)
Message-ID: <c6f08190-0358-4dcf-8c6c-3ff440f6efbc@linaro.org>
Date: Tue, 19 Nov 2024 16:42:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: x1e80100: Add CCI definitions
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-5-54075d75f654@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-5-54075d75f654@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 11/19/24 15:10, Bryan O'Donoghue wrote:
> Add in 2 CCI busses. One bus has two CCI bus master pinouts:
> cci_i2c_scl0 = gpio101
> cci_i2c_sda0 = gpio102
> cci_i2c_scl1 = gpio103
> cci_i2c_sda1 = gpio104
> 
> A second bus has a single CCI bus master pinout:
> cci_i2c_scl2 = gpio105
> cci_i2c_sda2 = gpio106
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 162 +++++++++++++++++++++++++++++++++
>   1 file changed, 162 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 5119cf64b461eb517e9306869ad0ec1b2cae629e..c19754fdc7e0fa4f674ce19f813db77fe2615cf3 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -4648,6 +4648,88 @@ usb_1_ss1_dwc3_ss: endpoint {
>   			};
>   		};
>   
> +		cci0: cci@ac15000 {
> +			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
> +			reg = <0 0x0ac15000 0 0x1000>;
> +
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci";

cpas_ahb clock is a child of slow_ahb_src clock, please follow the
newly introduced scheme, and exclude slow_ahb_src clock from the list.

> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci0_default>;
> +			pinctrl-1 = <&cci0_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +

--
Best wishes,
Vladimir

