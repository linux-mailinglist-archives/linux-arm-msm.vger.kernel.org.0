Return-Path: <linux-arm-msm+bounces-72081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D6B43F58
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 780B03B5CFA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 14:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA67343201;
	Thu,  4 Sep 2025 14:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fOj+5XHY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16653431EC
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996562; cv=none; b=a4H7jV/9sTPzvHuejNjniQXZ6KUnvcs/uFnmBR0Rn7DsfcZJKvBQWcTLK7oF3dd9IfLRbFPoW7ocJ+Ho8JsuiuupLoXZj5CXwYVpn11mZVjIiZmIASicRdPZJPq4xEHArMiLHYSmReILMBhtjsgcxLZ5cJfaQzHWV13sK3SXk5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996562; c=relaxed/simple;
	bh=2Knd2P0iOB5JzjpHNmPDbX2uHeBqvBGbNPeYzdNyIF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aWOrRQZzK6BiVx2UuF2Pv2FWEd+tDPbKjZBHkr89JGEAqsq0PuTi9cLRKTPjfEh7aEuuTB4TzV76Z1uAt0asn31aomYy4fRrtg/+pflxTecFtW/+nWpvs8Owvb3E0kutvx4hzE0GB2P+Edz3gLQsS/K47F8F2Geyh2rLbRP8WYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fOj+5XHY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b7c01a708so4562355e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756996559; x=1757601359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LG0FGlXd3G2peuym8Yly6U3jFni4sREv4yKdwNH+S4w=;
        b=fOj+5XHY3DHADCSJM3xo15HikfYqzv5tp829rtQMwKDmGVsiFPj2JOcM+18oim3NGr
         hhze5bcjYAMYitvve3qTnRg4/wcsRe0/Aw76qwNVUqwPcrmBsXtXAFs/wxsCIa7AGuuW
         2s44MfsrfTVKMiuae15hxGmubCKcDEQKGTRrZTPwhmJ63UJLEXImqIqncL0AxiEY1UPF
         B9n/5gqpu88L75oR9rOUgM5mANs3VDG/GA6yC/UGC5B8Q4AJXna8qCfbvc0Idv6ldtYf
         YlDLm4cQN+58p/cC9W0JZOYpb8gDP9PtWN/tAGKmZpXEVTHbkplgQsRRyGaLtuHa8GyB
         kvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756996559; x=1757601359;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LG0FGlXd3G2peuym8Yly6U3jFni4sREv4yKdwNH+S4w=;
        b=Kfr7uDJ7x4NDE97hwJhdDeiwZsO5nnOdZPXtyuPnSLFestC/I+ieDdxWCUI9N0VeQ3
         iGcxBWU0OYhcAvzVgva+FiclqHpY76jImmZAUiPgmoaPog3zZbks/GhWF9R7sGPi0+9d
         zyqQyIIHW+mlqxgKF93mDOpfwYLcaNqZBXTgtKYqagJOb6Pr/gqOj5xJ5steJbYt/vB8
         mBhef+Lez9bABDif3p7I7Mwq6XUiAdO3uvhuZKUvpwFgn8mYHUDjAC0sWGYRKZNrZ9P7
         sU3fYtlVnO5TOx2w03kFFAfbahkoZlFk0HlT/V52fK6XY4X3fysq5HiA/SEBBZuFdIxX
         Ef6w==
X-Forwarded-Encrypted: i=1; AJvYcCXWvHflekNJT27PO/kvlpfIxyB1zcY9T39Aq6zkTrojwFJeDN6ypLg00Gelq5SZjM/vqlXGuFGMENYK1/wP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfn+AxFyz2n+d9xQm7AV6JdZ2aF0HVaKgSk0gPsSb4kIqlMPMT
	ElZ9pSKoObt3UAL+Z8O7jyJdSbgtSNPHPS/A0AFopLMICd7Zd+l6nBt0UflX+MZnrTyPn/dh6Fp
	LSDuqW28=
X-Gm-Gg: ASbGncvB56eBjjbapWQVQhgQz1MNshOYOIRU8VQcjtlqPJI29qFdOQgqy4blHujSgFj
	YAbbL28YogSe4m9uj3WqOsrmideZzsFhOPVHXwiVuhWNUtXHCtnK42Q+6m7gQNQUAB7PUaLyEfN
	fU6vixW28CndTsCYuBdSQkwU4fYEPapagHZrYCplrLEvAag+gWgPcIVLn5+fVTflqBjpixRTb1x
	uNiuWMFT/ugCZLSOqfFAyynUl25k24m1C/tf0z1Uiac3215Tt9y6qDU6ISDy3MT8JiVoqe1WUnw
	YaLi+1z7CGXh4LothB+cKYcHp1x4QnexamGGMh49y3KFHPNrfJYkULFGl7pYey89gJ+nGQmMqoC
	9sgzMftaeE/Q6AREw1ztyPIhsKdfwNJ26mhelfhOlzKEg4KEvP+QPGFM7v++Ep30/is9dxddKxX
	foQ7khHVI5ZcRduvQsMvf0CDgTwVS/vUe2aJ1f3PvL
X-Google-Smtp-Source: AGHT+IGyPierysmXnmRPi654yCW/A9/i3MYkNNKVapSa3C2rY0Gnc8sqzngSNP7cLDSR+ketpOcIWg==
X-Received: by 2002:a05:600c:35cd:b0:45b:8b3e:9f66 with SMTP id 5b1f17b1804b1-45cb674d60emr49772295e9.13.1756996559062;
        Thu, 04 Sep 2025 07:35:59 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd05d0c43sm19336345e9.2.2025.09.04.07.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:35:58 -0700 (PDT)
Message-ID: <7672bb66-b987-44c6-9b58-dee5de2298b4@linaro.org>
Date: Thu, 4 Sep 2025 15:35:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sc8280xp: Fix CCI3 interrupt
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-1-d38559692703@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250904-topic-cci_updates-v1-1-d38559692703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2025 15:31, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This was evidently wrong, as exemplified by the core failing to reset
> at probe (which would be completed by the IRQ firing).
> 
> Fix it.
> 
> Fixes: 7cfa2e758bf4 ("arm64: dts: qcom: sc8280xp: camss: Add CCI definitions")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 225233a37a4fd9f3d65735915c0338a993a322d1..18b5cb441f955f7a91204376e05536b203f3e28b 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -4292,7 +4292,7 @@ cci3: cci@ac4d000 {
>   			compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
>   			reg = <0 0x0ac4d000 0 0x1000>;
>   
> -			interrupts = <GIC_SPI 650 IRQ_TYPE_EDGE_RISING>;
> +			interrupts = <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>;
>   
>   			clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
>   				 <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

