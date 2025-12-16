Return-Path: <linux-arm-msm+bounces-85311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82ECC14B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 08:25:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A399A300FE29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 07:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E24D31ED71;
	Tue, 16 Dec 2025 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DuU7B8mX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1D731AF1E
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 07:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765869695; cv=none; b=rxWRnlZOm/zD9wvqDISO3rNp1f99/oo2xQ4pEtaa7RdF9yoj0TwpoCcv2usC+pNBhSIB8g3wq+3fkhq++AHRQcZad2Ta7wJSqhFKEop84VoY5HBqmqJJCd8vKNjTqPQZdW/9o6P17+/Tyfq+37eWC2jYodGo5+xjW4Cmmgm6jkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765869695; c=relaxed/simple;
	bh=G5CtVkCS+s6XV5UMl94LB7FGabE300CSqt8QE5xdzLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SywJGoNtuBUSD401I3Z7mspKR7Leay+LvOGZwZZLsn0rrnQWq8Fk1UR51RLCt5UGlkheotcsTGNbnEGoZTrocNSoX4yH03L5Y2J4eDbO3ARtoCQ+nnIaGurH4sgz5sur5SK6rYcGc+aTSpdUlhW7KDSr2vKIG2fgNNYNs1gQETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DuU7B8mX; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37a990ec4e5so3745091fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 23:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765869687; x=1766474487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2DcE5/95zKMGcm5PK6kvg2lmrYchM0TUglmEw2Vw9w=;
        b=DuU7B8mXhje00U2x/Hey97mT6ZarjTVvzpPOY8pTEmvlhYFEbpSMCLCdN+ag4R9D6j
         4VSYNYpyAVyh+AEwhHDpXBM+EVzo4/RUM3T/FqA9/8W7W4et6YFiTGDf1afMR3/det7K
         7ihGlfeXZtVt3vXOFCbNSyA2wX78r08ZyOnMIrWjuWFbxm+TB003SJojYTRVvQ82bEqw
         OaewxFbu8RFh7LDMATCbXntbV4QJa5cEdpPScsI0dYiIUmjf9O8+t8BBJykk633BxjG1
         haKmgjHnKdd6S1RxDm/E6Lzj2cinWY35cCcWzP1fpMiohKE2EHaMEwj6Rvu1664Mkgs6
         hkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765869687; x=1766474487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2DcE5/95zKMGcm5PK6kvg2lmrYchM0TUglmEw2Vw9w=;
        b=CBcIMrAtQ86rnGrZiJAa8qtXwvYhLeULibfbekJxb8dNaamChzIj9d4+SXHjZ5UDIU
         dwVnwvGGmrIyxVgugyXTmeAi8ieutJnBnaA3LjoX1v6TrXOBTHHlghBHRVYUemHzDr87
         UcTLvWvQAE5CigMC9bUG8eH6p94zvc6W0z27vrok818pnqPqC3lZ3fBOS579gZ3nmwo9
         xI/3G8PvO75I2utMVuLBRcjxFwaMwaTQOo6NCfnvyupRzmWH5pDlwx2vUoyuHBHwWqd7
         m0qMtZu0lnI81yo5MIFKqHeZ/GkTOZNlkRJuklRTQBivma8XLHRAEzP3Lpzm94EoW6/F
         FS7A==
X-Forwarded-Encrypted: i=1; AJvYcCXeLdayDfR/52AzQw/dN+H3y75QbGbYn2N4el6FREqjbjjveVNlMDNLutyOcqeubcyIzVnBvzF+KgXCU9Ko@vger.kernel.org
X-Gm-Message-State: AOJu0Ywry3zMhe9yyb20UApkIqzd+Er/5ZVyPOKKFtpI+yefQHyAcnQe
	X7ItStiB9+ynTbJpBOc955+EKtqBY2qRHU/a7YDwf+dCuLHrLKk97pdVbDj98qpZPJo=
X-Gm-Gg: AY/fxX7jpD7OKjrND3MNiPmailByYSg1pNV5/6oWuw0cg38xVCSCDwv0o+Vf7MCOWet
	cnrPre6Lded4IO03CXh4hiLQlUINc5KKgX6y2MTS8P+5stiX77OLfwW7O8wUqUTQs1J/Y3bZEX4
	zaGSklcGw3bIqB1aQFtApYJ2LTUMeK0M7i5J2BDSp+mvL4uRT3N6zGl0LWfrp82yktjT8PTmvHu
	hrMJtmOg8ZpRO5cuVhcMmIYNEfxijUyf7epjmVGlqjf4tzGzY0JVf8YMvMcajykga3h/CyHS1dc
	Jii8OR1Mf7clSZbhdNLEwGY5zh+wXZ5pmFKJlS0WGcvD0bTIJRfGVlD6gCDrZldZE16rPWK3tzS
	k4aRi35ovK5gymTmu+b50TXnLW18bqo+4AHJk7JZA5sG4LHGS7K7zWTZ+m/q78B3MVCfbsVFS8n
	NXTuFQmCze/DqJC/AGfHCwuzBHiq9nPyat9q1zq7H5Wb7xvaK+lHF4wahUUy4WoFdjxg==
X-Google-Smtp-Source: AGHT+IHNMgsgp9u2yPWPCiPcD2bTZmOe3omll5Q5NDvnxjcWG7cZCuUSmQe6KNVWP+5AylmWofEkEg==
X-Received: by 2002:a05:6512:3d1b:b0:597:d7d6:398d with SMTP id 2adb3069b0e04-598faa01850mr2816802e87.2.1765869687301;
        Mon, 15 Dec 2025 23:21:27 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da79110sm613437e87.101.2025.12.15.23.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 23:21:26 -0800 (PST)
Message-ID: <87815e05-737a-4051-b139-499f388cc144@linaro.org>
Date: Tue, 16 Dec 2025 09:21:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] arm64: dts: qcom: monaco: Add camera MCLK pinctrl
Content-Language: ru-RU
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
 bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-4-quic_nihalkum@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251216062223.2474216-4-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/25 08:22, Nihal Kumar Gupta wrote:
> Define pinctrl definitions to enable camera master clocks on Monaco.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/monaco.dtsi | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 4b2d8a449b00..ace09239d167 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -5182,6 +5182,27 @@ tlmm: pinctrl@f100000 {
>   			#interrupt-cells = <2>;
>   			wakeup-parent = <&pdc>;
>   
> +			cam0_default: cam0-default-state {
> +				pins = "gpio67";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam1_default: cam1-default-state {
> +				pins = "gpio68";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam2_default: cam2-default-state {
> +				pins = "gpio69";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			cci0_0_default: cci0-0-default-state {
>   				sda-pins {
>   					pins = "gpio57";

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

