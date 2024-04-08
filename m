Return-Path: <linux-arm-msm+bounces-16818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DCD89C70A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 16:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E69CD285221
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 14:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF91129A75;
	Mon,  8 Apr 2024 14:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ulyj00fY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D2F127B67
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 14:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712586425; cv=none; b=pmR7aMRa1TYGsx3JglSZjwtQo09sdwl/dffjj1SvH7DpPX0dH/hQWyAiv1SW73vN6EFY1fs3UZLeXs4pZ+BW21QjRQK1ipTnPTqcn3el3PCRjFP9TphxqqIN63Yii/TPvk+pYq0dxzs51Qd8fjNvHcmJQbSye9sjyl+2XKmNpdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712586425; c=relaxed/simple;
	bh=0938tF4StQFvIWTG9bPkLp2MbQCbcJ2/Krhj02r7yT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gVqThrBlQmNiACZFS9WaWF9xux+jkRn9JoU/jobYTcNqLHAzUgegYQfh9XIdVPn9kpUQTuVTWKmS6Z0HcOe2UwBipf6bK6hLlCOZ1CZcEsQY9Lw3YNJEI0wjik7JvU7b5NqeJYyIc12sG6HHMl1xlhx5We61oW6GCJHjxYDURYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ulyj00fY; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d858501412so56822811fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 07:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712586421; x=1713191221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CWAslIQYTs63TSHbt7hms1FMD6CETwGUDcTfK9QElEo=;
        b=ulyj00fY1eu0ZktkUK10FzXPWRcYfuuSc0MLAePOokTZueP/mGXbU7qg7Ee0UnpO8O
         ud3/0nl7T4SJtSw+OfnUAFf/jDEPBYs1SyZqscgy4ZKhwnliHkOVzieF/kNIy18wE08+
         oUrkc1rnWOoygjqyUAiFZbd9PAbjDkGu+14b8tFBYlqemHg6VQDsBKBN15rX7zQHSqY6
         wxOkakoJUJw0cWYmzWw+QUf/6qwIOkZDoQJdrsvsFv61fJGtIHt68LkNOsmOEI730MrU
         Lxcp413Cr8nx0q2H/nf6rFPsRG3c5f3bulMK+zJlaUbGE7t//nUI185GRtZFUDueo4qu
         FNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712586421; x=1713191221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWAslIQYTs63TSHbt7hms1FMD6CETwGUDcTfK9QElEo=;
        b=F79A+eLb9APTMo57M390+kfMF7Asm6mxCd6S3K7C7wx8NdR7J7e1SSjtKhmWQOHEZk
         95wj7VTiOGpZsck1DhfyXCG7KQNYwBIcWBOCDlmZ/bkiuLFZ4ds2hnq1wNLrGuHV5Ygy
         CDfyObeCwDQZ2S0a1rkndWgeckkusX+jo8oTMegf6SG+wo92INWdENoLS9BokprXEx9H
         iIhNqfMHcyWi7zb3wBo6HUAmLceR8fsQFCJO4Y1wuSccjye4lq7OwhnCt+3taQoNifsh
         zTKT87/+26O/OM4iRGXXnB5KKFCHx1pPz2rfrxvI5OvkCjl+VCePnl0h42XOaYmukctb
         kFzw==
X-Gm-Message-State: AOJu0YxZs3AFOvfAiDFNaB4WKW6A1ygl/BAq6Vp46AUPJfQ1gU9jOt4r
	wRztVLka7oA7G3vKK5KLR20epR2g+6H/1o2HUD5iNXGMvSwuvUqXwCV9opfaRac=
X-Google-Smtp-Source: AGHT+IFc2yX/IP6+1XOFt+KHVDB0UCCeJ1o6Xnr903HurFmDv9cs43zL09wmpKrhusn6mnXC64CP/Q==
X-Received: by 2002:a2e:b811:0:b0:2d8:620b:9838 with SMTP id u17-20020a2eb811000000b002d8620b9838mr5092379ljo.46.1712586421229;
        Mon, 08 Apr 2024 07:27:01 -0700 (PDT)
Received: from [172.30.204.201] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id q5-20020a2ea685000000b002d85e57fa3dsm1162957lje.104.2024.04.08.07.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 07:27:00 -0700 (PDT)
Message-ID: <606c5121-48c8-4640-9e19-692af4281fa4@linaro.org>
Date: Mon, 8 Apr 2024 16:26:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: add
 USB-C orientation GPIOs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240408-hdk-orientation-gpios-v1-0-8064ba43e52a@linaro.org>
 <20240408-hdk-orientation-gpios-v1-3-8064ba43e52a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240408-hdk-orientation-gpios-v1-3-8064ba43e52a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/8/24 04:34, Dmitry Baryshkov wrote:
> Define the USB-C orientation GPIOs so that the USB-C ports orientation
> is known without having to resort to the altmode notifications.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 15ae94c1602d..2806aa8ec497 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -100,6 +100,8 @@ pmic-glink {
>   
>   		#address-cells = <1>;
>   		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 166 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 49 GPIO_ACTIVE_HIGH>;

These numbers do check out

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

