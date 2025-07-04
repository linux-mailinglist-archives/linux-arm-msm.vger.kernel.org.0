Return-Path: <linux-arm-msm+bounces-63717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D246AF9668
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41D12587474
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 15:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFA430B9AF;
	Fri,  4 Jul 2025 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zjL//tdH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0532B30B986
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641742; cv=none; b=Auaqx0bCHoMIDHy30tDnLyEVI9TDR3oP5fHJzYXVIkpn85bCMZUjoIA3zUU5pqXh+YhHadL2lXFPjOEAe8lbkgUukXr+FejcGjbnr/B+joEXwEEvC+98kjd4WovelYU46qFC1+O50E9qtSBpH9R2U1sl9JJLKBfrQXnhfyujVW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641742; c=relaxed/simple;
	bh=ipnj/ShwN4qWMwlvjTyy3Pk2w7mwcXypC/ulNiTQd8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbbE1z7BAvBj+a1r1oac6riQ8YVzVkB4m4ZYkoCOJCK1mox/68DZMKoWofZRbLtRl8OS7pAzJYrkWJAevp58D/yOkozcHJGkKvXsiz+M59pEcZt+jp0TJj1xvsHNAdLKaAilffo+PiEbqzjIeOnTgAH6E1RYN5dGpKmpPTsjgFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zjL//tdH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ab112dea41so540747f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641739; x=1752246539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOyFHtQS4VvsDjcbQRHgwxAxnr6aZ/PpVMTdfF6upkw=;
        b=zjL//tdHwM1nPlxPr0X0VJABfizrP+XW4CC/IqymV0u1mUbOVB5ZFlu8a1B8CPPUhd
         NToLmjtZMm9wlwcWceHG+gS7pN+MJBX0ZeoOWZWnIazFqtgPbubtTKGZNA03ISF75un1
         1q/nVz8wY6oo9E9IXgYNCNKpqYGY1RB+jdH86BrTywAI/RPgyIU8INkTOkusfI2n/Bpr
         2kPxJTG4B1aCA0llDKXSxqSOohL+FOcT0fpXNdn+I6YV5MlM/WWamfzMSaf/ay124h0y
         3PZgB6WE3ADDSreqeAoh8gpXNvcwj/6hTPuXzQrSnM7HElJ38B5+FoPI9oCnNzcnpg2k
         7w0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641739; x=1752246539;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOyFHtQS4VvsDjcbQRHgwxAxnr6aZ/PpVMTdfF6upkw=;
        b=EVyyyuuF8o2raEPaN2x3jEtTmFYJUwRpOXkq6nNByAxLOHwxlEG2bo6cAxzlT4KEHH
         32YSH6IgYfdefVPW4x/8cnBFQPvtt9x1+7uc4X9eJEHX2qra6g4qELFSqHCT8yFkMm2q
         7Sn6bei6Vct0XprjFpsFNketvhXfcbhL6ecbmEJGd7SxM/RmpSJoUQXdCZLb37pftBG9
         Cce1tW/3l2Bd/tVl/BBFhdBfuNDYWVVKiM210FdTsPIKcwSNzii6t1pKuKW3qdXi7NL6
         cg1Z2O3qK4tsB7N9pUg5DGqcy7GWzPiYszj2eQclXY0EDmYSxo8yxCfMZ4XNh2Du9gEM
         VjdA==
X-Forwarded-Encrypted: i=1; AJvYcCUVAh46ipN2hooP2aKqulpkpW0mkopzviNNQnyve6P0e0TLVae1mu0eJH9l44u3DGpuzxZm8WSo9wLjRkBj@vger.kernel.org
X-Gm-Message-State: AOJu0YyJBLwV4zWCR6QRX3gLCH5ThuTaGKYq48bY5Ik05FqDTlCGDlYv
	fCax0c/FUPSISt2DaqhKEa5YgiuGOgl9QYjEcrcZs9pDw4n8I7OXyMbQGhOrdkj2JMs=
X-Gm-Gg: ASbGnct1dUn6JOHiBIXHd9QWpkv9teHrXkNhdlvldvBpjXlMOr87aAIwr4rK+z0I36F
	y33N/4GoZR6qPafbfSAEpELbxMzh4/t9ZF0UKKEnMMcXuvtMFhY6TU/01QnPIbxYSca3sv08f7y
	XQc111yJmwoTVVQ2fze7XUDwPEKU4vQV4VzVVfP74i5ebIbVZnXXCLVlEaIuVSNRrUKRAv1j8R/
	6YKmtQFZQ4PBwq6Dg6ePn4SxFvcfDz+I0SaGBNye7Sw1aydspKxDU7hMdHWNkUoD3s7JLrDQ+72
	L+MvMGrR5dpCcwx80qaiYIqq/ewQtupuvT5sxAwxVkoj71M8ZmSMQafzjr6Nu00UgfVx6OJOBbk
	VV5nN5C6Qo6l41/U0+/E1xiHIh+c=
X-Google-Smtp-Source: AGHT+IH9cnwUoqoWS5/qQDudbSz0QU2bdpH6UeAa65SEFEoIDoAtlPs1SdHDTe/5FJH8jfA2orMi5Q==
X-Received: by 2002:a5d:5e0a:0:b0:3a5:8cdd:c174 with SMTP id ffacd0b85a97d-3b4964f6f85mr2726920f8f.26.1751641739273;
        Fri, 04 Jul 2025 08:08:59 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b975efsm2667049f8f.46.2025.07.04.08.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:08:58 -0700 (PDT)
Message-ID: <0b526bee-dd8b-446b-9b79-00fcf811837e@linaro.org>
Date: Fri, 4 Jul 2025 16:08:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: videocc-sm8550: Allow building without
 SM8550/SM8560 GCC
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
 <20250701-x1e-videocc-v1-2-785d393be502@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250701-x1e-videocc-v1-2-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
>  From the build perspective, the videocc-sm8550 driver doesn't depend on
> having one of the GCC drivers enabled. It builds just fine without the GCC
> driver. In practice, it doesn't make much sense to have it enabled without
> the GCC driver, but currently this extra dependency is inconsistent with
> most of the other VIDEOCC entries in Kconfig. This can easily cause
> confusion when you see the VIDEOCC options for some of the SoCs but not for
> all of them.
> 
> Let's just drop the depends line to allow building the videocc driver
> independent of the GCC selection. Compile testing with randconfig will also
> benefit from keeping the dependencies minimal.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/clk/qcom/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 36d6e6e1e7f0162d53f02f39125f4593517e0dba..26752bd79f508612347ce79fd3693359d4dd656d 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1391,7 +1391,6 @@ config SM_VIDEOCC_8350
>   config SM_VIDEOCC_8550
>   	tristate "SM8550 Video Clock Controller"
>   	depends on ARM64 || COMPILE_TEST
> -	depends on SM_GCC_8550 || SM_GCC_8650
>   	select QCOM_GDSC
>   	help
>   	  Support for the video clock controller on Qualcomm Technologies, Inc.
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

