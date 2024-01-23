Return-Path: <linux-arm-msm+bounces-7892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CE48388DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 09:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E26CB21CBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 08:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A525677C;
	Tue, 23 Jan 2024 08:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ddxWs+El"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CAC56766
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 08:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705998413; cv=none; b=nDPnxlHuJlaM/qHcR4kpKQISdeY71wAq/v1Q2LUPH4mS2qH7A+KydwGYiSdI/4ObY2E8VZxO8pTOnRcSa8+tSEbXmpYpY4Wlyb+qGrmxcsqvk27uUQ/OC+Q97XMDm6rEr/fAMMUKgfYYdciHUxVi+u2xz2DZpKK5MBQ+HHxyZ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705998413; c=relaxed/simple;
	bh=nJDuhTa9w+cd8v66G8y8I0kBd3IWX4sw861v77mKq50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSYpFmgjVaoY2ml8A2wazp0ezP7xska4w0BB8sC4r/KJ/TH/Qt6zi9LGM3UfRLllBC1tdOhedM5LUBl1cHpjcqminuqmbjxOuPi+GTRRNxOsjnXuhYHmmZs4rg/RSepNluJqHwswOLeDjSKZhukzjaarjk8zRXTG7e8WlWFtOIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ddxWs+El; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40ec048e0c1so398645e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 00:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705998409; x=1706603209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yQQZHZgkpjn3FHRXzoOufFNywlC/i3yKqCZ0P18kMRQ=;
        b=ddxWs+ElS7fve0QVt/a2+LA2QwKslak4jNuvyHqkwGUd7uyrK5Ea2YA5tAyhNzGzbk
         USee6QBbOv8Vx0jSOflGyIeyuMsxn6OOvvz67wEIZMn3GkcGc/+T1qdJ6vTz2TlPh6EU
         r/gkfN7dxsqrQicdBNiiIEll186eMPybwV+Tax1/RzQRmySrX2+Gnj7PaHXbw55Ebe8a
         SriyrwZL4GA4OrQT/G+xCkeZq2X95oue9RBiA6lzIl1+1s/ipQoebxWydIWhN/DczY8n
         PD0p0AEGT4jJvO+pYtnbgLAJMqL+OBKO4z68eZSR3BL6E/1UJvIqTaz7XX6l77z8Cdo+
         Al0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705998409; x=1706603209;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQQZHZgkpjn3FHRXzoOufFNywlC/i3yKqCZ0P18kMRQ=;
        b=BpCOSc+/SiGB3BFp9YKA9ARAD/D/W3BuzpDouoKmh5cTf9VkqQdKUl/oIdn7a6atgq
         8T4UWcccX+vIB6xJKYPXhkiyeefxfsn2jx3YjqtEgeENmdznwXAs63lvJabLtEeEhdeO
         wCcs0KSO+2bqQmwwdBbpa4BI+9qz7r4AhZ36zBhhHG/WY8W9MYLyWg6Da38o0BbuTVbw
         YQiUhPetpmzqi36t1nF4jnU8WQRrUIJe3X3vEmpk0iAyJzyISNALu/G17ySJIiw/hd2G
         eexVIVoy/NvFSX2d2g/LENEEsl4AWSk1UYEcUZw37WVw2kb9kNYmtwqNzh6Q2FGXz7Kx
         vYpw==
X-Gm-Message-State: AOJu0YwST4N1VlSP1GBP3TfujoSidGcbXWE5o+MxJDU512dXt8eYPnwR
	nlSDrPSDHamt9r7JjsPHw1YDlXTtA8Tt5U0D5xBBez2hhwbMjvsJH2TgNI7V6L8=
X-Google-Smtp-Source: AGHT+IGc4nNnFAgOPrXhe6EjkgVvYCoYnJ+W7x12dCkE/gCccqdufAxWm3SNKjZ8635Y4ZDXVyOYrg==
X-Received: by 2002:a05:600c:4ed1:b0:40e:bee7:41b4 with SMTP id g17-20020a05600c4ed100b0040ebee741b4mr206001wmq.55.1705998409269;
        Tue, 23 Jan 2024 00:26:49 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b0040e4914f28dsm45174001wmq.18.2024.01.23.00.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 00:26:48 -0800 (PST)
Message-ID: <e4fe77d6-2762-4fe1-a68b-e7d152d22efd@linaro.org>
Date: Tue, 23 Jan 2024 09:26:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to
 SA8775P
Content-Language: en-US
To: Ninad Naik <quic_ninanaik@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 quic_psodagud@quicinc.com, quic_kprasan@quicinc.com, quic_ymg@quicinc.com,
 kernel@quicinc.com
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2024 16:57, Ninad Naik wrote:
> New memory map layout changes (by Qualcomm firmware) have brought
> in updates to base addresses and/or size for different memory regions
> like cpcucp_fw, tz-stat, and also introduces new memory regions for
> resource manager firmware. This change brings in these corresponding
> memory map updates to the SA8775P SoC device tree.
> 
> Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 103 +++++++++++++++++++++++---
>  1 file changed, 94 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index a7eaca33d326..20b16fb5f537 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -356,13 +356,18 @@ uefi_log: uefi-log@908b0000 {
>  			no-map;
>  		};
>  
> +		ddr_training_checksum: ddr_training_checksum@908c0000 {

Underscores are not allowed. Please rewrite downstream patches to match
upstream code.

Also, useful is to run basic tests/tools on your patches, like W=1
builds, before posting.

Best regards,
Krzysztof


