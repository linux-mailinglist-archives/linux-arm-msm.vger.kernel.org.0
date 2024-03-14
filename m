Return-Path: <linux-arm-msm+bounces-14201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8927A87C698
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 00:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 273191F213CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 23:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE6F14AB0;
	Thu, 14 Mar 2024 23:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qUogpZee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E85714A9F
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 23:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710460179; cv=none; b=UhcgC5R8VeeTZQ07oLC4TpTKumlsyWRoQHpSBkMj7shgUQDB71Az5qVDvGGhbx32rJnUaudUn35OoVlyZP0HApPmgM803Lafd1uCshv2AtSXDCoP6La2x8/bTdsVCNKmSctLsSlshIOaTkZynuP5ODCCUjGUm7Tc9bxSp9Nh4S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710460179; c=relaxed/simple;
	bh=WENTUOp3D5qKgO+Me5EIUQATACagdW7x0MfwkgJNAYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5TIefuUwY1NBdHLsq/Tg+Cs1t2SRgY/H1n0PirnL83rNHSqmKgvkqh5FA/cltBKt9gWe/8V4lRYbzmFROdY2aYrDYoL+jn3kIZBcOB+KzA2BW+JJ+73WZV7lASThDPl7XC7wqINMpVrXYUMgpMmqTd5/tAfaMa+7T2XIS/LFQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qUogpZee; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513d247e3c4so962031e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 16:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710460175; x=1711064975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JDDmMzCYMjAaKsu18+oLY6uSXCtu/11fL+3ri7il4Nk=;
        b=qUogpZee0pG8hv6hV+Bln4Zh2yetfz3hlxa5RLlmmPgCc14B+F7GeCyOcLXkrO/EyA
         d+Nq+KzuHCs7u32i+ac+qaGwAn/ssn3are/wx87iljSGgRz7iY7Wtt4zRhmq7hkdYUjQ
         svN7sr9IHnawYCaJnbeNu2DNs4If+7jAUiYpCYfGgGxgsW+P2KjESIaHD23eDnTagTCF
         qKlwf5Qhs2D1hWP4aQ6ogNtc911+IAZ9d+jCK5QJhdB7uXJlDzUIiJgAzDUxoIPA6v89
         Yg8YGWU8LArQ8VhQljwbodDq/vNqoqBrTDgzxVh6WTe9i/3LdJm8Z09TD4dAxy5x5spC
         NnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710460175; x=1711064975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDDmMzCYMjAaKsu18+oLY6uSXCtu/11fL+3ri7il4Nk=;
        b=hDZmB8/PE0zp+mZa3ftkHNbxrh8NEnqShBC2jP5GPwvK8bt8pRuzZxe7jF5tCSqyci
         33Zot6kC4dmWOP2RjPs/uKnAwi0JOp5aQFwkt3AOxNlPt8MoZYVV1o/CcTOHe4ZqtSss
         PoLQPsaW3olcyfRbTYVZ/WK5yUVEX3PofOOV3mlyw/BwAcwviujZ/Oazr1WNNIV9XRVG
         BAbmgXOvL2Q72Hf7IvRQTKGMWtZRYLLugD630K8PDH3V2H9C4lSmznijWtuIq/D8nWa+
         GC1mMY5EVd6aPcPeGxTXqF0IMcKxVvqNeA4UC39ka4J1GEkzPzxXgvkjkUZFWDAr0x+n
         wFCg==
X-Forwarded-Encrypted: i=1; AJvYcCVmWa3d/CdMuunigJa9tM7m0dRvis4/Oq2EB95vi6KWjQeTbexVeTeDO2Llqzb8zaY6qX4M3GRtWEFmF0QjbCH271h+0YHDK/9CSq7r2Q==
X-Gm-Message-State: AOJu0Yw8MSR2JrTgMmnsllisxdafZmxHxxcGvEFKAnpixD8OFV2P1AIj
	gjpy6EkvAGoqs72+uw7M7KvgvIhaH1iJZrXcylmOybYsLcyP9AfuynwDxKdF80Q=
X-Google-Smtp-Source: AGHT+IFEcYIa4GpGeC93soGHGUNc0pmDIvNhbFoVaCBY2T7BXc4vsb3knxKvgcBO/BTy2mEbvdXVlg==
X-Received: by 2002:a19:5e4f:0:b0:513:d3ea:ec5f with SMTP id z15-20020a195e4f000000b00513d3eaec5fmr820021lfi.34.1710460175498;
        Thu, 14 Mar 2024 16:49:35 -0700 (PDT)
Received: from [172.30.204.13] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a17-20020a056512021100b00513cd2e23f0sm444666lfo.149.2024.03.14.16.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 16:49:35 -0700 (PDT)
Message-ID: <359dafcc-4774-4ff4-8df0-03e3641082e5@linaro.org>
Date: Fri, 15 Mar 2024 00:49:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm630-nile: add pinctrl for camera
 key
Content-Language: en-US
To: Sebastian Raase <linux@sraa.de>
Cc: marijn.suijten@somainline.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240314200037.549206-1-linux@sraa.de>
 <20240314232043.1441395-1-linux@sraa.de>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240314232043.1441395-1-linux@sraa.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/15/24 00:20, Sebastian Raase wrote:
> Add pinctrl configuration for gpio-keys. Without this,
> camera button half-presses are not detected.
> 
> Tested on discovery and pioneer.
> 
> Fixes: e781633b6067 ("arm64: dts: qcom: Add support for Sony Xperia XA2/Plus/Ultra (Nile platform)")
> Signed-off-by: Sebastian Raase <linux@sraa.de>
> ---
>   arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> index 87d0293c728d..823c21d5ee59 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> @@ -90,6 +90,8 @@ cam_vana_rear_vreg: cam-vana-rear-regulator {
>   
>   	gpio-keys {
>   		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys_default>;

It's fine to keep the "non-preferred" order, I'll probably send some
changes to nile and fix up the style while at it in the near future.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

P.S.
For your next submissions, please send the follow-up revisions in
new mail threads

