Return-Path: <linux-arm-msm+bounces-63720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DD0AF96EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A44503A8E9E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 15:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E33919C54B;
	Fri,  4 Jul 2025 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kdZcvAoS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84B419F115
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 15:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643400; cv=none; b=WMZx4ozIHIBVxPADKjoQm0EFp6A77oa8SvIWPumpkkDD8cDumRWSQ5mBzDxrcsuT6FhFsc5LhL4wloHK9SnDxW3+Q55syUMKjICalbBQNM3fy9ad/5C9FR+mufgaYQ9+8IIapbNj2NEAh94Ox/HhmTDSEAhuLd5agYK1Lm6eAqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643400; c=relaxed/simple;
	bh=6AfWGwf1ZO1nnsP9pbeq6kHrKdZ3X+JnWuL1iOaAIl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozLw0hkvV7uuMPUMz6F+8E2OhrWSz6XZbi+1vTr9fQ4zdDEwTktO0TzOPdO+jdYZiA9+Y+/4Vm0rpQ/b77OqZgmobbp4pe0uJMSw5BcRC2kNM64uJUggTkLehLLs53KcFvrmuduJoRSSv6yhQY/tDrHoDlsOwI4e7tyMVSFEY6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kdZcvAoS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453066fad06so7556055e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 08:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751643396; x=1752248196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kHBPVkZ3WjeAxBR0NM1nNct+JGgFP9fCRsYhnveiIng=;
        b=kdZcvAoS4+c0wNiaQxI0cdpQ3HtMGXDnvmVsnhzCyCHR24nhMZGJBhehmGb8H8IK5A
         x0zv8G7ETUYsQ1qCCUav1eUSGTQ2puRDofJfbZHkSNrpCCU+dnamWfkzebTVg/YbHcvM
         o63VFdkZq5DLNRVhmPI5aiamlrquYT+InP2jCGPdqFR+K6lzBtphZBxEui3jR3vqhqAo
         vZgabk8kdCna6s+A8wPdy4hX2vxjnuUkgs+THJGNcxF1qLDFzCMVpaMImGkjMduLc0jL
         y/TGWRVLjZnMe1PVBb+s60DHuTGyUBL/y4b7kNA9pyUMqfMXmFi77WjwSDoTMzpVQZGI
         Coig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643396; x=1752248196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kHBPVkZ3WjeAxBR0NM1nNct+JGgFP9fCRsYhnveiIng=;
        b=jT2JDsI7HQ5J57v3btQcHGzF0oeBnXdmNhwF5a3j/Rm7TYKEB2IJbPRTWxS8+zedI/
         bm5ZUhuykXGrdM6CRRFK4YUDpREmRKlypB5v4jUwf4CkVeUQStwiDkr3+SdDb75ffHMI
         ASI8q/qwq3VMOPnDFa24sISqLzQ7Rrum2QK+8Ez4Z13YA5oZguoAPjmBqeOCIcLi9ep0
         3YBnD6IdJPdiNRJbW53/8sYoMxbbdecbw+9Xrf125kAE0Uk3krBzixd/dEq08AfZntYm
         p3aRrOK4cgLRWarpMPyBzVZG+Td+y1U25WFcFwKEnA94fZvfEV/xvF+e1ra/fih+4dxs
         Oy+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPZVDqYeBCHcgCjWJxpVDeGafHpCUVciD50CxSrQgbOWXAqQTrN1p2WmodGRzu+z7heMDqFU0FfrHm0sL7@vger.kernel.org
X-Gm-Message-State: AOJu0YxA8rrpmtPYwZ7Igcw2grbRmDmrWFtFlFwWEzPAL+2faLMylTil
	ySriznWfIxr4bIBioyux+ZZLyV5uTNMeI3FGYg1MEEuD90CjxrTP86pLeqlgDycarLG0P31NO0x
	cMa3x71s=
X-Gm-Gg: ASbGnctSnZ5E14f051xFJy7uUQt7AJKZoSovTFyJ1p2MQq28P6XVp8p708JvDlz4kkv
	+Ay5JK5PSLhQSO7YGOMxVPHnpEbmnkyqur7SfQ+i4FVLDAjGjpZqqD4JtRO6TazG1gaEYGwPpLf
	TAAgap39NJJnxsqVrXAiDkE8i1SJtuxNuoONRUvHmkhsUi9VkD4TEemvqIEh7fAe9kGTCV+1u7h
	4UbpfrIzzA+V2Bj325RNUI2RJc7lKMv0MU43O39F3crGFIePC3sHmoYKlEkDcENQTfs8Awunzht
	Z+NI2b5mC0a2AfL6MVW94Qi1a26WHXNJOp791d7DKgiG0Fl2e75ChaXx2lqWbd2YsH7VdMjXKGu
	0pFyHJWbjVpZxGyNPfeuR317O8PFr
X-Google-Smtp-Source: AGHT+IFEx8OdICe2iWVaKFmaTDM9y5WPRJfONxEgUkTyX189wA7oj4eE7u9yAmgrJC3PDONXWLAXgA==
X-Received: by 2002:a05:600c:c0dc:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-454b32084damr28968955e9.16.1751643395749;
        Fri, 04 Jul 2025 08:36:35 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b162a3ccsm29397725e9.12.2025.07.04.08.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:36:35 -0700 (PDT)
Message-ID: <86a1f012-6640-48af-a6e4-0eda7d02b914@linaro.org>
Date: Fri, 4 Jul 2025 16:36:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] clk: qcom: gcc-x1e80100: Add missing video resets
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-5-785d393be502@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-5-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
> Add the missing video resets that are needed for the iris video codec.
> Adapted from gcc-sm8550.c (with adjusted addresses).
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/clk/qcom/gcc-x1e80100.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index 3e44757e25d3245e455918e9474c978c8dacaa5e..301fc9fc32d8e6e1ddf59c1d3350d84f6c06e4b6 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> @@ -6674,6 +6674,8 @@ static const struct qcom_reset_map gcc_x1e80100_resets[] = {
>   	[GCC_USB_1_PHY_BCR] = { 0x2a020 },
>   	[GCC_USB_2_PHY_BCR] = { 0xa3020 },
>   	[GCC_VIDEO_BCR] = { 0x32000 },
> +	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x32018, .bit = 2, .udelay = 1000 },
> +	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x32024, .bit = 2, .udelay = 1000 },
>   };
>   
>   static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

