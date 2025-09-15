Return-Path: <linux-arm-msm+bounces-73558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE63B57785
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5CF8188B234
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 11:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8104D2FE59F;
	Mon, 15 Sep 2025 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RLL7CAKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA602DA776
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757934105; cv=none; b=VXiPFE7PhbmR7voNlTNWTh8X5l2ioerEWqfCDerL4NonnygLkLhqfTHRqv2kWPdn6hkRrzRC8TB4rOIaQfnRgG+yrFjOC0ohpTOvpPB24b7kdVRDoZ00ZOSdr792ebiBIQaxqzBj+6x/nw909fpOaTXz58WBBrOJ3Z0ZcGWQpN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757934105; c=relaxed/simple;
	bh=/Qc9d9aZzIeejKzsoFImNVQNyJaCsuJtl9kVd1OJcbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uMcxjsO/fFX0NCKnKkVZz3LnW3Mx6Kq2zRsCKq0GJCC41646BgpVCX7LxwOjM0y6osne6ck6SS28RYuva/LmeZmVGLrqz3aO5yrqvPdKneD0km+OHwr3Yji5oHMyzRlNMC8/A3ZG3DxRvgVgOc8cogYErKv8A3ha9jp8D8U7aLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RLL7CAKH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3e957ca53d1so1176916f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 04:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757934102; x=1758538902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NZDo3HJj+JKsYYxffoSm3zbBIPvQZvsDjUn20WFmAPw=;
        b=RLL7CAKHMBAaXQsRfYz7qejDG4+TbJZUUBEMM4GU3VTTewmOi0JAZr6od0AMGqvFzo
         aKTK7W3sPX2h62D298fAbgKqwHdN6ZtenCRxZKIcUBnm/MZxGjv35hZs6I2eOxH/Dhmp
         VvydyViRmn562Vn8zLyojP6J0IcX2njUXZ4EdwlSXp7E6Fc673sBe+Yl9QfOtF8nDIp9
         DKePDd8HGvSI36JxGbXwmlJGq2J4JPS+iXuByejXlcTi6xPTE9J8tNXFaGhCnybBo9U4
         A28ogoCn6vTzjyqLC63QzR6gy1OUzknMNbS4W+Oy+cQ4NCT66Kg0aJjSHjx58DCIpu+T
         QFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757934102; x=1758538902;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZDo3HJj+JKsYYxffoSm3zbBIPvQZvsDjUn20WFmAPw=;
        b=Y4QINj1N2EcGj77QOjcEqVPolhkhksAaU2rs7siuE4uW7A9aHdQwPnUjtAJLUIUjZS
         qE7UHJTSQMr1EfITdtZQRjXfLZMn88cTYKisfRz9ZJxACvlhAGornJe6U45/HR++5QG2
         gJ7er0wyy6SIMRedOJxKwtE1wDOqST8rXhbyU7oas3tq2xGJAPiSAnPhKjlXyMdW6Z3G
         lsr0dVlcXVLZsow9Ej07I5rdNWmdnlrWMbVyYXJffv+2Qc9/6MlrUI41V5+x1FPb1KpP
         mSIKuBScadHsWpJ9tH61dzhz3ng7Oi/FC7sVylkhtUDx29b4OTUNavluUDwmBNyzWO/u
         4wEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAQR9PBJjcdu0/Di7fSSTAWqSRNp00yiy3KbnsQS0/QW+13ROw9xETfNLhrftj4T0IMLC/ZZND1OHMwwan@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc/w9KsOTE6WS6rCc2DyCsQOfj440BWJf7y3XZREPo+JedDXHt
	42OIe8IId5PMslhzipi9XYJ1oW4RRFF7C+8wgInDZMfEhQBokf+a3TICvVGy5o3QdHc=
X-Gm-Gg: ASbGnct6W3Q6Rha0R+LYcH4YA+fhS9E/jg7MIb2y1X+M4qc7x/ZaLIpZjfKuCtmIM9C
	57a57SFoQxwchVIf4M2B13p3Zsr12ZdcQwCMWAFVaudNNDuGL+wADAlpXBGZ4t0nB1ByPMtVibn
	2th9oAwwBKI3VvJh2kvMy4G/JfjFMIGQJ942Rz/vtHguMf33Lhaqa/sBIX+kFmI8f/3tlDo6301
	Rnv2pZLfmiDFp/TCmDOWF7p7bwmJl+thgCTOE3VHFl7h+Z1Mn/SG+rIl038Y2zA7bIe2Xa44fi/
	WjRRxUF+UuXwRl1OWSysuc2Cf3DNcAujk4ElFdAgCt6f+oKnc29B5pu9wv3h2WhoA5MDqE4p66o
	1AgiNEIZctascTvjm5nc32qT+ucXKKM6h6KKCY0hywv51xPJXuhM/JBYBNu1r0RgK8tDY8VS8SV
	0HsFvp5TUcga18jOA2MZY=
X-Google-Smtp-Source: AGHT+IHEbWM22bIRf2y6UTpO/R5u8kTDR+0OddRsCBt1HZIW8yyIVi08dQKVxGLboPuRerqVIo9Bmg==
X-Received: by 2002:a05:6000:26cc:b0:3e0:34f4:3225 with SMTP id ffacd0b85a97d-3e765a09238mr13094569f8f.45.1757934102095;
        Mon, 15 Sep 2025 04:01:42 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e81dbf9acdsm10439024f8f.55.2025.09.15.04.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 04:01:40 -0700 (PDT)
Message-ID: <77cfc92b-5ec6-477d-a92a-123b17dd1c60@linaro.org>
Date: Mon, 15 Sep 2025 12:01:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom:
 x1e80100-dell-inspiron-14-plus-7441: Enable IRIS
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Anthony Ruhier <aruhier@mailbox.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
References: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
 <20250915-x1e-iris-dt-v2-7-1f928de08fd4@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250915-x1e-iris-dt-v2-7-1f928de08fd4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2025 11:06, Stephan Gerhold wrote:
> Enable IRIS to allow using the hardware-accelerated video codecs. The
> firmware is not upstream in linux-firmware yet, so users need to copy it
> from Windows to qcom/x1e80100/dell/inspiron-14-plus-7441/qcvss8380.mbn
> (just like GPU/ADSP/CDSP firmware).
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> index f728d298c72f4bf2ee151698e36108fdd7a8e5a5..cf2a7c2628881e44f093d73e6496462c22326d9a 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> @@ -37,6 +37,11 @@ touchscreen@10 {
>   	};
>   };
>   
> +&iris {
> +	firmware-name = "qcom/x1e80100/dell/inspiron-14-plus-7441/qcvss8380.mbn";
> +	status = "okay";
> +};
> +
>   &remoteproc_adsp {
>   	firmware-name = "qcom/x1e80100/dell/inspiron-14-plus-7441/qcadsp8380.mbn",
>   			"qcom/x1e80100/dell/inspiron-14-plus-7441/adsp_dtbs.elf";
> 
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

