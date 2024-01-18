Return-Path: <linux-arm-msm+bounces-7577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CE8832246
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 00:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 312092824F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 23:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8361EB43;
	Thu, 18 Jan 2024 23:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hlgh7OZN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3291EB42
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 23:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705620672; cv=none; b=bWZmcQ4vV84Bg76Nu2Qu4wE06960tLyY6iOykw1p3uIVzKOrsWWzry2k5YDY5eVSdxC56mdP33WNLsa1Mz59IuN3kQ/4siVxoNyIW85oluwWWbFkC14HmDxyIGKl9oRCSIatk3IiaHYnvAVrzP9Ynf3wATtf3HbWbRCqZlQ6ohE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705620672; c=relaxed/simple;
	bh=IdpU2iFg7IVH1ufjSNd28yuQIldlBMrrkAL0tUwiR3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uq99u6fB8XtiGkS2oxuc744iddHqzAYMmjSd0Ui/g08bCtGCd83NRdazNUp1S39W066RVDyhq5ybpFdZTY5DSRJo3bCncUSlWyTIbn4xop/vVi+OLHKejYiBvMGdX3Oo66Lbfh3TYrJCONA3myAZzgC/TS/IJJa4vc883uVi98M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hlgh7OZN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3376d424a79so151724f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 15:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705620669; x=1706225469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6v0lpyy987F1ypK0yHFg7YzbqvtCeBq1Ni/3BxFVaP8=;
        b=Hlgh7OZN+oceDjCX71S1+jjzVWubCpdutpcdapYvU7naFeHNvB8in8IJ+ZP6PcF5GO
         vSwBK095CeX6m24vzIFg45Jcu+XydbVyCM1pXKttWBRtrL/BjjBd+ft37CBclgAemw4P
         rTcmU0hlwWQtVxeuZwY9XOJOzVQeEfqh4WcLSN7QY0KLkSPZO80kGLIbsFf8crcMq4xs
         zTkVa8O1OS0IKUyr0BHBMWSYwcQBflsxRmJ5F8oVD5D5hl09ER8DRzam1lL15Tvppj+J
         T1zEYKtHAG+xHFX3eAo5MuDrLspS5TfGhDrCJrtU08hbVi9rNglnvVImLr0ybP8ine5+
         iOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705620669; x=1706225469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6v0lpyy987F1ypK0yHFg7YzbqvtCeBq1Ni/3BxFVaP8=;
        b=BZeeJZuNgdN4nGye/LLoAR+fRL+NO9Vz1QsXBlC8ul85H3VhzBeH8f89PbCGwpB2iD
         K7xz3W8qG6VCkpnqKd8KspclcOaFYDAm0kwPwSnYcj2wHc44QWK3te7c7Hicd68BLfVn
         v+UncEYvSGEAT38Qb2WfQDOZMF0kH4wUEKfU47vyUe79oQjyVeutkGr1P7EbuVPSuHbo
         42pxjcw2FzH9h0tZY0dC43PbQI+vgrWghq66xSfJJcc4uKf60hF1zvzH0hKsX6eartfv
         7EKFoPI2d0inlzCmw3v3wwwoD7qs+mZVrPRaf76xGPYq24/kOiIteLT8HWyHzI12ssGA
         94Tg==
X-Gm-Message-State: AOJu0Ywll6PsYTy6H8Yq//y1xtspGzdTXKy6Z30vIGmaCQVbvAA3yC0w
	bvynV+Tj4yxCrGmWw0vP2dg2bbIM200XlaQW55MhLbFO+ZKP3/Qr5W//hNHy7Ng=
X-Google-Smtp-Source: AGHT+IHK8WMSnQ/xm+10s5i+APAOImX+NZ0MsBozts6V6weL9GokHwH2muJibNCsJCflNlRFjDFetQ==
X-Received: by 2002:adf:cd85:0:b0:337:9b5d:4c68 with SMTP id q5-20020adfcd85000000b003379b5d4c68mr1119632wrj.127.1705620669094;
        Thu, 18 Jan 2024 15:31:09 -0800 (PST)
Received: from [10.66.66.2] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id q12-20020adfab0c000000b00337d8c40ff7sm973011wrc.3.2024.01.18.15.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 15:31:08 -0800 (PST)
Message-ID: <ce77861a-b362-4ecc-8e92-7fb846c7e508@linaro.org>
Date: Fri, 19 Jan 2024 00:31:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Introduce additional tsens
 instances
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240118-sc8280xp-tsens2_3-v1-1-e86bce14f6bf@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240118-sc8280xp-tsens2_3-v1-1-e86bce14f6bf@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/19/24 00:00, Bjorn Andersson wrote:
> The SC8280XP contains two additional tsens instances, providing among
> other things thermal measurements for the GPU.
> 
> Add these and a GPU thermal-zone.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 37 ++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index febf28356ff8..68b5ac0339a0 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -4033,6 +4033,28 @@ tsens1: thermal-sensor@c265000 {
>   			#thermal-sensor-cells = <1>;
>   		};
>   
> +		tsens2: thermal-sensor@c251000 {
> +			compatible = "qcom,sc8280xp-tsens", "qcom,tsens-v2";
> +			reg = <0 0x0c251000 0 0x1ff>, /* TM */
> +			      <0 0x0c224000 0 0x8>; /* SROT */

I've previously called for removing these comments that we've been
copypasting around for years and years, and I'm gonna stand by that :P

[...]

>   
> +		gpu-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;

Hm, did tsens only gain support of non-polled reporting with 8450?

If not, we should definitely update all the relevant SoCs.

Konrad

