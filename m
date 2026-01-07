Return-Path: <linux-arm-msm+bounces-87765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C82F5CFBF34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 05:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47A9630022D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 04:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0795E23D7F5;
	Wed,  7 Jan 2026 04:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cn6yA1Fp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E516A33B
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 04:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760139; cv=none; b=qTlb0iNzGiJ0YnViWe1iBjOBM4CJc0s+4k5tLY20czwoDeljdG9cdWiov1VWhDDLS+SHEbxxMvYFtNtlEQD4TIM6bYsry3cVFaihlbfdJKuFW9l9fECSiVwyn5zAIor5+2hIt547QYP69rQT9I8eVX2sfqfcV+sj9MOkKLk7Br0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760139; c=relaxed/simple;
	bh=haiB8Tt+8pZM04gZvK2wNWt/dPyIDOm+drx3AQALCHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDTmtj2g93885m+c/ERsBWrMPTMNAEv3JLYykoNq8Z3Q/ajaFftIOuGUGcztDTY3nu5y010FL0VwxZp6rIN9GkculT18DM8EknP5PNJmvpJzJaaiGqsEwCIWSdxp+SEnG1DcDmQU6HNIX1tMaL/9lOzsLNHqk/ECAssEuvZPOG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cn6yA1Fp; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b6babd619so111210e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 20:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767760136; x=1768364936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvcoTCO8VwPdehmxlS2rnFhrCL/5WSs/bRyMtF/vO1w=;
        b=cn6yA1FpWam7e5OM4uK9jnnosDnNZJ8FZokv+Cyfp1+skVKgMpy+8j2XTj0A3h+OrW
         /X5pYeQcC4uIwCgN1kSVBkc2OTjLqsX73g3MYGe7OOH0Q8+iqlfJgSIl24vYmuOB8kVM
         VoyNxHC0pHAec2kZe1TMwS4XjRjyXGw25dIGqPJfpaSRzaaVrHPgCrRU+Qe9YGg/im9f
         CkmVgz1MkMh2L/H/fcMZQazdZrdGaB8U/0EWZTNl6Gkvm6dG4w0d565B1L3/GBQzmi5G
         DJEj+D3mPljwqJE/pR3NCJywS7/9AG+qE0N6NcVET75MscbHBGbJY+ir8JelrmC2LbVn
         YBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760136; x=1768364936;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jvcoTCO8VwPdehmxlS2rnFhrCL/5WSs/bRyMtF/vO1w=;
        b=QwSTk3t++cBHQFXBBVMMmd4aCFM0rO9qaN85qloB/cp7K1zWlXD6PMHb2MeKzx0ZOe
         usvWTwyTAaWeeD9zLLL6xh2dF8YvKPSQL6gu1TT3PGvQbY7KApQ4doGc2vIq6st3GbNB
         uR2qwEdnBiaE50YoKCFaxOOgODr4/Ja9wZ/dYkUoroRa2vzfKqdyKgRit+R9Xa8+awIW
         gj1vJi3/8szjJSdKGqZxsUXtf3kTDhGwaZBDe/oe3CfQ9WQ5/0Q1newfleaLutrHL6Z8
         1gsYFXOSDxOhTtCM0Lw0LuC97Xs1f0NwQ6d6XOPPUXgUmZUnFE6eL1MQ5X6Z72WIqSz+
         S4Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUVLISB/uTgJhEOPN4EwfjsU7KJEs2dp4vLxkC8yFJgsmodux+dk1jbdWOMcACCVWgkh48SdJn4Jqb9bXpY@vger.kernel.org
X-Gm-Message-State: AOJu0YwicrnAvrGBKXaLfV/O7BBJYU+1sqJbyii7MjgGC6moo5ADoQm+
	8dWFkzhtvFAZpkSUvN0/dOqXn9vqnsL1zO+udR49sUa5vvsFjQx1hUZAvd+02TS5hTA=
X-Gm-Gg: AY/fxX4XE7vnmQxxkZeR/qGtMNTO/KptTf56+0ryFvHNdWH6nki1xXFTb4DgL+qscTx
	BNzBinQSrAhV9ttwcTTgZjbrMKrafWd2LF1LjUNLkXWEwAIkk3glBPbTZnoUllKL4x0Fow48TvQ
	WX/rlCh9GoYstPuJI/6k+Oda57TfA8IjwK3YjYRpI2NXU7A327pUnVzmczvRbpSBT7Yb38ySIm8
	Y/TAXxfAC/FJ8/3p559JTmsLqN6qnv4DzXcfwVG6uBSW01cNssjF7709C4mcpGOYfd8rbF7OBDp
	/I/geQNO2imlhJSiUNu3WXqJSI7s1CukIm646HDsBj8qemCbbinjF2Zu0cP8nxFero0I31hlC7N
	ohfa3o8MmjqWfdhyyWWXAe27G/1N6WeNeV/voN1Yz4GGQUqGvQjFhrgzV+dPXZikya1fzWd1S9L
	vAH7OKZj82ACvzU1ifXssqGis00Fy2b8Spod74epzapobl12stvf4t6Fuy9gAiP8wAHg==
X-Google-Smtp-Source: AGHT+IF9hWgMq5ozizyKkYLFKj41duoqsihD4rtshBdk9J75mRrvbI9bzZFNP1DazvK48vDl2rVU5g==
X-Received: by 2002:a05:6512:3b25:b0:59b:7291:9cd8 with SMTP id 2adb3069b0e04-59b72919e55mr25847e87.7.1767760136292;
        Tue, 06 Jan 2026 20:28:56 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6f3caba8sm271002e87.8.2026.01.06.20.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 20:28:55 -0800 (PST)
Message-ID: <b0b629d5-33de-41c1-90d5-b64cc29e5511@linaro.org>
Date: Wed, 7 Jan 2026 06:28:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add camera MCLK pinctrl
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/26 11:39, Wenmeng Liu wrote:
> Define pinctrl definitions to enable camera master clocks on Talos.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 461a39968d928260828993ff3549aa15fd1870df..880fa10a2db993a82d31faf868195944128237c9 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1549,6 +1549,34 @@ tlmm: pinctrl@3100000 {
>   			#interrupt-cells = <2>;
>   			wakeup-parent = <&pdc>;
>   
> +			cam0_default: cam0-default-state {
> +				pins = "gpio28";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam1_default: cam1-default-state {
> +				pins = "gpio29";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam2_default: cam2-default-state {
> +				pins = "gpio30";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam3_default: cam3-default-state {
> +				pins = "gpio31";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			cci_default: cci0-default-state {
>   				cci_i2c0_default: cci-i2c0-default-pins {
>   					/* SDA, SCL */
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

