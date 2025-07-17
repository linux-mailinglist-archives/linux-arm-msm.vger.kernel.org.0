Return-Path: <linux-arm-msm+bounces-65428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5438AB0899D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 11:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A18394A0C88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 09:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5822E287504;
	Thu, 17 Jul 2025 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bJJ64sE7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945F51A23B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752745558; cv=none; b=NroXIawVoTPXqtjY2m7JCMDzVkhczrAPrRWG3l5k/J1KHGSqMY/hvpDZYBx+DUBVe66dXwRcZz/7KLOQFOnTMeze5JXs0hwUNnxeL1Y5x9lAwlqsBAZ4YzchLTVOnrlZbyPhvzhygNLPmBylm/2u6WXo4HmrEDYoIMX4lJtmqXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752745558; c=relaxed/simple;
	bh=icvA0K1RPNBcWvfLGCmVKRBjbcIiYHmiy0ARHjx5WsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuNgSccWTHtbsttSQnNF9cZXcFHXiyUx75q9hG3fp+5B+U76jsrmpjBKmBnnKVGMQJvmPTsZLtEwtnLRKF6+wc6ai0BY5tIjOLOAFuiIY6iRon6/bUIoVZRslN88UTXtPJMDgm5Sxk40Z8Li2RBNHxLXWgnBx9652aoNQUQIvI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bJJ64sE7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-455b00283a5so4589265e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 02:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752745554; x=1753350354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4UUb+eCCVRH9h09fVkojxVw36lrz4Ml2/6BK0w+a3Nk=;
        b=bJJ64sE7ElzZf0LGDF+KQU5J3rGT2qjQAZdFWW9zG8CoP4+aKDavgcMdVyKYlV56eR
         Zco96hfKijdjLHY4z65V0XgOZbN2/1NQ1hn9ajJchvY27cMY8Kr2gTRRUUc10dquiwWH
         EIy529hfKMPAeAy9L9i7GLmU2R7MSAqkMV0pmRm/SV43lL14jxoYBb4O2IMgHDciSya7
         +75L3aQS9nuyVIdF9rz/LHQ3+E631Lg4QloQfF0BHD+djy2Yrm4ATaP44c5jFb4rDMLY
         wYMxHDpCZCOpInAJVrzfMN5ru10QWz/H9mGaPUiyouvTiTgF3B8QHIDW161yH7mARoQZ
         XxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752745554; x=1753350354;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4UUb+eCCVRH9h09fVkojxVw36lrz4Ml2/6BK0w+a3Nk=;
        b=WnhawAEpjtbZLYRXcEebIf/BURue/XBnbmO/JjKbqcuflMCY63/spoxYQAiHC+6/Zy
         NomPOyuVSW4DIdkBeNskZ5aS1NnNng1L5GxQXo7XFUSswQIisRi/umVSXajHBU0bk5xO
         gVhVwk8BbJJbK3ZDL2clTuGNy7za4ZUzE8WnyIzQy5fd+OP0O5Ekt9SlNJLIHMxxi1XY
         233+lXVMrCNLCB4qUJAK+4hhJoBFP8RcDInAon0eOyt/lGIGLRhXZQzM33DVIPlw6/fr
         iHWVK4ICT/g6ushp/wkMA6gEFcPOvNKbi2gbIVp99UFIymiDnQDqRzmmyORMiIBz/ndF
         E4yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQd64/AEe7TxveXFy7QSSYkRwJiKHPf/77ELVPxFbwDCHMUs3JSvJzIncXuayrWT4I4h1QcyTJiznrov4m@vger.kernel.org
X-Gm-Message-State: AOJu0YzLGuVfhMyI+ctSrWDYAonCIZ98ZRgxahZgiMhUxZluWlgVctDY
	JDepivUeqM2B/5r2CMz8kdgTM12EwkeQVAZJkX6ThLlK+e4qwjVGXhrQyYuF+NpNgbo=
X-Gm-Gg: ASbGncvmxe99iPbRwZqcHfz7vRzf/5YCM1JgEGdI/k5/pmLKYLnwO9uafiQWZ+d6LbV
	eUorDRYRn3bp/BsfSqzviBOrE9Nlv5wCLfIEnO/8dUE5mc8G4nC2yTUaEA/74KvXBBAZUivWkMU
	oswKFMojeXcvZPOcIOiaCFYFdjX2m67xaJ2XegQrOuZ9EafWoGpM31RAqqBXBm+jVdP00O950dO
	g6seMmlTinbKjkBpPxWf5lq+lzZSeDzYGVtL5x9ekCWQoqSVIQxzuNxxTKbLoCe04u7AV95UKrk
	82IZ1rfzTe+fagw4zn9LSeYEJ1qQzULhtdFRA+UCXQeobLdaDMWv5j2ZIV7rbjInECoYPErFpWu
	/pRw2njjmVFUuJOWTQ/PKSTpxlFhKAfK5aUBGKsbSQkJHsk8StDF6L8o599tcgcg=
X-Google-Smtp-Source: AGHT+IHP2SvnCCzI3J6cTXMGXPD2s7F8PxV92aFEphVYbHWG+syxiVGQMy54GQ/w+kIwvVDzdKb1dw==
X-Received: by 2002:a05:6000:4a06:b0:3a4:dc32:6cbc with SMTP id ffacd0b85a97d-3b60dd53fe5mr5975700f8f.20.1752745553877;
        Thu, 17 Jul 2025 02:45:53 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1de0sm20112044f8f.24.2025.07.17.02.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 02:45:53 -0700 (PDT)
Message-ID: <00be65fd-2a25-4b6d-8fb8-7a40f8ca846c@linaro.org>
Date: Thu, 17 Jul 2025 10:45:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] arm64: dts: qcom: qrb2210-rb1: Enable Venus
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, mchehab@kernel.org, andersson@kernel.org,
 conor+dt@kernel.org, amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-8-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250715204749.2189875-8-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
> Enable Venus on the QRB2210 RB1 development board.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> index b2e0fc5501c1..8ccc217d2a80 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> @@ -711,3 +711,7 @@ &wifi {
>   &xo_board {
>   	clock-frequency = <38400000>;
>   };
> +
> +&venus {
> +	status = "okay";
> +};


goes here

&venus {
	status = "okay";
};

&wifi {
         vdd-0.8-cx-mx-supply = <&pm4125_l7>;
         vdd-1.8-xo-supply = <&pm4125_l13>;
         vdd-1.3-rfa-supply = <&pm4125_l10>;
         vdd-3.3-ch0-supply = <&pm4125_l22>;
         qcom,calibration-variant = "Thundercomm_RB1";
         firmware-name = "qcm2290";
         status = "okay";
};

&xo_board {
         clock-frequency = <38400000>;
};

---
bod

