Return-Path: <linux-arm-msm+bounces-4851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C532813E4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 00:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1851B280D6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 23:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FDC6C6E7;
	Thu, 14 Dec 2023 23:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PJfJZvW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5796C6DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 23:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50be9e6427dso44471e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 15:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702596908; x=1703201708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cCjCAeBnLwqYq+PKXSQZ5D5FxgW5MIAlMxJR3IBerbU=;
        b=PJfJZvW+2NvbXinnTSXjYUyDTRqjO6mxjgRrYu3QNUuRORMDGc8YBu58hRi/ENuimx
         CnQFcNgUERt08cS4MCurdmvH6djM0ijAieZb4iA5/JuSKkSs6I/We8Hg3W/7Wu0FHfar
         s05ScHPQDzR2BamiRMTZsBcKJl5Zq4GFDkJ+hXDs2fDzseXsw2eUyhp5Zo5L+ZDpNwbZ
         /+5eUH3dWo9W7p1tlzEyadUy5Yyg6ljjeMtc/Jk7ugABknDQXIPMn+1/e7YYE+QfGlQx
         5yqwpfdv7VKKzGXEtJyjgXo6eM/hY/w1gGCaNUKe79c04KN+9ZF59U9FswCJ/yWQC6S8
         9eIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702596908; x=1703201708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCjCAeBnLwqYq+PKXSQZ5D5FxgW5MIAlMxJR3IBerbU=;
        b=fGPngrsYbIWnivZId9im9roTiz4tyz8wb6BKnzvlHGUSpyQ9CkZW+hj9IZcY3kyVYj
         yX6eveDCNV1YuYsMTa62fYU29peEEk+yP0kKz2Ax8LIeVuQtFR+b/A+kU31YY67cY2//
         5mjDKo48tbH8SeEvkfPLYjo6yyKIx8XG5xVYTYxCEgambqkaw2f+k1fnhrBUoo2yys+X
         1IJakh4xfjMyT+rQj2RsCFVWqG6cjn2O+itP8klKcOXL7nc+82cNDi9GL75exuFVdVYw
         xBHHLvBAafHBe51IJBtM2N5Wf7X+/PxWqwGGmnVwxyGAKEew4+2Fh+cg1BqKw9xdkBa8
         9nIA==
X-Gm-Message-State: AOJu0YwMm89IfpX7HKlQv1MXym6EEisxX0lZKxGH0dVjTfQGUAzXlPqm
	cGKYd/PbuC0hYSZD9s4iS3716Q==
X-Google-Smtp-Source: AGHT+IHk+V6E99wOnwH3LpIHxgY+FvlXwtTYIC2FOlq6dWQcB/783FD0Qdz7i/m4qDfKpGhUFp+ZuA==
X-Received: by 2002:ac2:457a:0:b0:50c:180:2169 with SMTP id k26-20020ac2457a000000b0050c01802169mr4724617lfm.70.1702596907901;
        Thu, 14 Dec 2023 15:35:07 -0800 (PST)
Received: from [172.30.205.72] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z15-20020a195e4f000000b0050be0049075sm2016600lfi.251.2023.12.14.15.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 15:35:07 -0800 (PST)
Message-ID: <77d93be8-0455-493e-9ffe-2cfe9b38d855@linaro.org>
Date: Fri, 15 Dec 2023 00:35:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e80100-crd: Enable more
 support
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sibi Sankar <quic_sibis@quicinc.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>
References: <20231215-x1e80100-dts-missing-nodes-v3-0-c4e8d186adf2@linaro.org>
 <20231215-x1e80100-dts-missing-nodes-v3-2-c4e8d186adf2@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231215-x1e80100-dts-missing-nodes-v3-2-c4e8d186adf2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/14/23 23:48, Abel Vesa wrote:
> Enable touchscreen, touchpad, keyboard, display, pcie and usb
> support.
> 
> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Co-developed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 221 ++++++++++++++++++++++++++++++
>   1 file changed, 221 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 7532d8eca2de..d44898453315 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -401,10 +401,144 @@ vreg_l3j_0p8: ldo3 {
>   	};
>   };
>   
> +&i2c0 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	touchpad@15 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x15>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tpad_default>;
property-n
property-names

patch-wide

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

