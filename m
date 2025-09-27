Return-Path: <linux-arm-msm+bounces-75370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDD1BA5BD8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 11:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAED94C5353
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 09:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4C32D6E48;
	Sat, 27 Sep 2025 09:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWet3fah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2E42D662F
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 09:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758963996; cv=none; b=N+J29LaxbgxdcfvfR5yPd144IYn68XkpKlJ3CRmqsCVYwsRNEKtfUZdlEI6X/Hznzp6tJIpzuy5KHRrNox7zTBnr9HX4z3SLnBApy+u0CBKjGhd8db1IuXdfR6paOk7WMtuQ07oelS2fLZZkS7peu80Z6HhADzXXduOSyBCX3Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758963996; c=relaxed/simple;
	bh=o8u/sHbCGiIFmGRl8TRX2/l0CbB7CJw8el7xK4OcSqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gb8/aW1cf8gYCDe1SJdndO+BI5g2B69GY3nodGM0d5y2Dwj8mcpzXqWnG2+g7AGEWGi/gKDqJfj6FRLZuFjt6VuHETgurDIbF+RflfSWZiF65UiMf/UiPRldGlkVi6BBINxPY28//qqmsm7in8DJ4ulF9R762zNlp/L5DCBirSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWet3fah; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e23a6617dso30427215e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 02:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758963993; x=1759568793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+MIeflv6TTn5FZ3EPIVQ8V67i4OTGQJGA3Tvmnh3P0=;
        b=TWet3fahbt0aB+Qhx2ZgXLLRK4zsCghReNB+mAqiUAnvAWj/z5xYyr3FDmboq38bk8
         kdfBf1r4X2VzXv5WlyWhIByAcz1wzmvY8LHUCMKk6KhnU2Q86YrwKeTl9clUtGGEDf9k
         /mL2qjJwhrxZFiRmIWw7NnH6DY3ig4GsHbnUXs3w7SrwdCg95zObfxlcYeE1fHfWnSvY
         tiZocVeXje0zGlvKWmUJLjutzlJL+7q6GVqCFZWWX0cKa3bI7uPnBkcFGeb1SRTNtpyA
         +39FEA6stOK2TQpW1liFd5tT7UEoHD/2dqfVKITh0q8WjaX2DCN8QsSe4OEZg4gT04G7
         CmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758963993; x=1759568793;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+MIeflv6TTn5FZ3EPIVQ8V67i4OTGQJGA3Tvmnh3P0=;
        b=w/RBbEIAeGsgAXMTriWY5XdsNZ9qEF2npc9VlI/UJTBArprc0lS8x3A3i6IHxlKXTL
         Fwd9th7kYyJwqkCpHx8+T77mSSTF5qqgfQD5tVcWpl3lcsUQSeGItEe2P6hjjw+XcJ3i
         9vAdgE0YvzEfmkRQNQUyTFobyFG/OYw4VL3vaFmuKzpIAD/5SC1gaXmfZvVkdKVzyEEH
         StjEW5Lmu92mmyGs2Nm5hfb7eIhmXnEBA1QtXePmajCVHYO6BiA85GMGJrygzYaIP0CW
         V0Dgqy8qlN8RgxRlJ2DgR7zJSeSLXwn3FntEF8B23jndfsetii3+25+2+5QHmy67sNWR
         dCUQ==
X-Forwarded-Encrypted: i=1; AJvYcCURIQHrIsti/Wn/n/qKbU4XRuCcM2HBGJ9tFnBDmSg78EP0LnOikzLDhJIAEGkcfsVw4IGMuC5KVCrsajBO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+RHHHGmE6h3JLQRn5+bnFmDZMZp+4CwYP32i0msKUN+V+8Qys
	JjcvnSrJFC4fHC2v3IB0uzByonU6j948EwP0E96lyDJJviwmIqQi7zEc2LNPcsWxlZw=
X-Gm-Gg: ASbGncsCxAPvsurTgEBp7Gmo1i3TnGbDieq0mjyy4mUgylUSIK39+2Xq/v1s5qJuFZZ
	lermqklkdE8RE1dK77vJZnTwvtDiAh24FhyHSWc5eD40bsx1jH8vbkpG9adgXvBOksYGY2ZpStc
	xNZCnL1Y0cSAqAvEjv7ijfyA7K4NwEipteo4MCoki3NwHsxJepXopGGLvWck+GzvhLOqWHzgwKf
	nEF6B+LDM9kKk2/KZTtJAc2g59CZjSiyLHNEYpElTBla4CJfcuPKguS1MLbi66clBLyBXI9MpuQ
	XK5vLnUh61/IsT1PlzD8dzf2uN1kT7zgEYqyebcVUWCklr52Y4SzEEu1iNk/KNAe+CFr7lWW9hZ
	RmJR+RG7mJ2HwynTNnN2M6UZV9Kof/Vgq9INLjPQMAH9OofgB48uiBmfWt9NmBxEZskzUSwZa9A
	q4JY9074L9VSb0bl8jlhTl
X-Google-Smtp-Source: AGHT+IH3Xb+fDCcZorZOPmoD6Ji6lERHaHPkT5e7+FZs5aHED5mCbT+IDMueF3ssiZJPiQN8+Bs34A==
X-Received: by 2002:a05:6000:40da:b0:3ec:4fe:860 with SMTP id ffacd0b85a97d-40e4cd57776mr8411353f8f.46.1758963993037;
        Sat, 27 Sep 2025 02:06:33 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc92491efsm10414294f8f.62.2025.09.27.02.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 02:06:32 -0700 (PDT)
Message-ID: <855380e5-2141-4ed9-86c3-53bc2a096efa@linaro.org>
Date: Sat, 27 Sep 2025 10:06:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1-dell-thena: Add missing pinctrl for
 eDP HPD
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Laurentiu Tudor <laurentiu.tudor1@dell.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250927032330.21091-1-val@packett.cool>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250927032330.21091-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/09/2025 04:23, Val Packett wrote:
> Match the change for the XPS 13 (a41d2314) as the board is identical
> between the XPS and the Latitude/Inspiron.

Same comment on the commit identification.

Also, are the boards identical ? I don't think that statement is true, 
say the "board DP here is identical" but there are GPIOs on the PCBs 
which read back different values to differentiate.

They are not identical PCBs.

> 
> This allows us not to rely on the boot firmware to set up the pinctrl
> for the eDP HPD line of the internal display.
> 
> Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> index ef83e87e1b7a..0aad80a1159c 100644
> --- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> @@ -1104,6 +1104,9 @@ &mdss_dp1_out {
>   &mdss_dp3 {
>   	/delete-property/ #sound-dai-cells;
>   
> +	pinctrl-0 = <&edp0_hpd_default>;
> +	pinctrl-names = "default";
> +
>   	status = "okay";
>   
>   	aux-bus {

Once fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

