Return-Path: <linux-arm-msm+bounces-18307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E4E8AE7ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 15:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA07FB2531F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 13:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242F1135A48;
	Tue, 23 Apr 2024 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gt5fwD7M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB3A135419
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 13:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713878450; cv=none; b=IlC4jalWkhUohvuYojnt7zCs0hhBQMAnDKU6KxrpkPRR6VxcGXr6ARvP4uWir2cIRcNDFPRcb55ct04UVF9hlQhoZDi+KxDH7z5FHSuGgqnQJefQ3lko4ipX9/6T4Ewcuv1n54QSYRT5803ElmLC2G5bERX3GAJDcItrar/M1E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713878450; c=relaxed/simple;
	bh=PyHVWu/QKobiB7YcY+QCE35Yaf73xdFPKB4nRj1oqY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6FCYqurqaVTEItn4JuBHdrPxpmjc0+GXdtDadU9xDsjcwCErow2cyp+ePEz3bWrqhS1Fi2rAUTXL1CxVYZ7R6zSxOczf4/01ylc7xg/qROFs19WHMzNHvGxfZwpejF1Qq23RA4R0MxB/PMmhZNkQu7vrwF3MhWZ7BFLDL5V3aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gt5fwD7M; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51bab51e963so757210e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713878446; x=1714483246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DED8QC5Anhet7tIP2I7t7ZJzQkPh1lym+QGOcE4oVis=;
        b=gt5fwD7Mlq1+zrSVgUkng27451HLB37gSj24JpXjE50zj80BhlZYM+Xk+SaZVFH2/u
         nSRAfGjNFUYo+I0AlrbC3ie88Rk49JCPUC4qMoSa8WkPGVEnOIjR5R6A+fVNX4RLeQEh
         g+rTAKxJac1cUCxfUXRMfTkHOyP7jq9DUjlsd+2sHNRogjjhVnfWfVVuYoVQW9hgyED4
         oeBBU6io+ITYilF0kuzl7GW1AebTQHqAFYM/1SB3Qj4qXe/bhy8285pCvKwJBnjEi7l0
         cCeo0j2FI4n4DgXf7ijZpDiWcLbHHjHKexX7GHgGalcQ70SFlLjn510JJqzPSUtFMKWt
         G8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713878446; x=1714483246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DED8QC5Anhet7tIP2I7t7ZJzQkPh1lym+QGOcE4oVis=;
        b=RC6bqZuvyanA9kIrJ+mqwo70UT5So4KFCe05X/hTQYd9jfQ1WTfveSNuUUdqdqK8Uc
         oosc53DewVHiRatfl/0HZoD6yNCW1Bm7CcH3df7+cOQDwftvZw8SQon6AFL2ZjXDfj6o
         qOdgxgE6bJUXY3SN9Fz7tK7TX7M1lHSPeYWlZxtlJfro/UUyIa+ytYwu/8uindhbM6Km
         gxV1uOdss/gu+zoKIvAfzbBPWQZCxCCKuYWpx2T/uy8QS4SJGzO1VPXZJV51wd+UOwQj
         TatNn8QHl8GLLamYspiKAoiWHw7MOrPu+5tJVWGIiuuGfkf8/WdI7IOU4mj3AytVcVPY
         RtWw==
X-Gm-Message-State: AOJu0YxbAqoGxY1dhHDRRdZK/ha+VJ2jQPjwd28X2wDMOyqbrg/M3kuu
	4O1Ims/PXoNT4scQBz+GJ1X3s9SjnvuReTW0QsvAW3P7s0xkIwXAas+iYkfPtwWBcFLFEoXF2Gs
	R
X-Google-Smtp-Source: AGHT+IG6cO+5w21y5KWS+7cigDuEMe7L7tENMjk6qzTUeOwWkVVsMZ63pHbVyU4/AorYlwfX5JUOfg==
X-Received: by 2002:a05:6512:48c9:b0:519:7585:9f66 with SMTP id er9-20020a05651248c900b0051975859f66mr8028391lfb.50.1713878446012;
        Tue, 23 Apr 2024 06:20:46 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u12-20020a05651206cc00b00516c5954d61sm2012461lff.246.2024.04.23.06.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 06:20:45 -0700 (PDT)
Message-ID: <db13541d-839c-4af8-97ca-b471e37188b2@linaro.org>
Date: Tue, 23 Apr 2024 15:20:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add initial support for rb5gen2
 board
To: Wasim Nazir <quic_wasimn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240313071238.3290-1-quic_wasimn@quicinc.com>
 <20240313071238.3290-4-quic_wasimn@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240313071238.3290-4-quic_wasimn@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:12, Wasim Nazir wrote:
> RB5gen2 is based on QCS8550-Rb5gen2 SOM for IOT solutions.
> This initial version describes VPH_PWR, UART & USB3.1(HS).
> 
> On-board PMICs:
> - PMR735D
> - PM8010
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> 

Where's the "---"? :thinking:

[...]

> +&apps_rsc {
> +	regulators-0 {

This does not scale. Use &label references instead

> +		vdd-bob1-supply = <&vph_pwr>;
> +		vdd-bob2-supply = <&vph_pwr>;
> +	};
> +
> +	regulators-2 {
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +	};
> +
> +	regulators-3 {
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +	};
> +
> +	regulators-4 {
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s7-supply = <&vph_pwr>;
> +	};
> +
> +	regulators-5 {
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +	};
> +};
> +
> +&pm8550b_eusb2_repeater {
> +	vdd18-supply = <&vreg_l15b_1p8>;
> +	vdd3-supply = <&vreg_l5b_3p1>;
> +};

Would that not be SoM-common too?

Konrad

