Return-Path: <linux-arm-msm+bounces-23136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA3E90DC30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 21:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C863F1C230CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 19:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6D115ECF9;
	Tue, 18 Jun 2024 19:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="una3UUGB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB19215E5C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 19:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718737611; cv=none; b=Qupy5r9slSgJ2sMVqRXwEYkfomPjSMWnC9EcmmXICTJjWAGKTM697mwnr+5kRuWdM/ot69Q+y0fKG0Js3NQQDpdGItWbjbN2sg7kfqYkUKLAZDv6Gc66lABPjWQ8lwg4u7Qz5tC+BFLLRmtZRs6U8Xl/QQzeZnHRKf08fgWavr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718737611; c=relaxed/simple;
	bh=I6gh+ZhnpjHmqUx7wmh/gP5SC5PJ76jO4e5mhALPP8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JAaTF1xCszh4tuaAQvO9E5BGOEjsImdMFdCu/Dy35/lQCtfiZeobqhXXtfJIxb1GNBkw9Uv0G3YGOpLFwDeqDy0TuE/+70ZG8Q0YmqjYa+vF5lKmsw1CoVy9HxFkdb5xrEzUbL6pkAwIR8wOdfNcO80hdHZGkLt/KvpvMByjv1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=una3UUGB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42121d27861so45753905e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 12:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718737608; x=1719342408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oxz2pZ47pxNTQppBLFBoMYJoJeu/eLVWfqVJPijciDg=;
        b=una3UUGBhDlHyHxaU61K+vu3dBVjvTR4XQIRpQ3do+pFyKPo4jZxtNO+veY0FP+Us2
         mBspvZq8pFiq5CSK1rCAGLrPwDo/MbxQyRsMb07Tu3LTlUgbcwq6IoCBrIJxwTqZEBWf
         IOHz0GV2qiYkC21LTMhW9kPUyb+YhSobnYyFo7ZXqoxE17pLD/V/dZ96/FEFLwMJT4pz
         NU0eWh0rbv/ySc5K5UnqNC/ieNfnhykDPTXPzvV0vL1mG7IYepzuVCO6cjJf6pq6zjyB
         MXN6JIruC3+6B1zPUAsTXOpBk4mlhB+C9gHhcPjzuYFC1qB+6DQduuLEI6i7SJ7YClfy
         kBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718737608; x=1719342408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oxz2pZ47pxNTQppBLFBoMYJoJeu/eLVWfqVJPijciDg=;
        b=r7p6CW7LtLzTgSSjfvQfxn8lMnz1nSt2tLiz21sOWV+FEhW9UbUPEoC9G9vdLrDVpY
         lD7Mu6Y7UUxEh2svj5ziVmkscev+2onyrv+xz7L+/xvSlkVDCYfc9p/UNxo1Uv66mUSI
         uTgeSvFhOD1WDBbrTjTNeo2n/qk8wHWnlyjdUJDogMURZyqvE9yCCX3hn1eqnnjjVeUT
         8mbRYsuSITMWYvfeZqb9YUSlzr8Nwq4EN11P0D45uUvyUBJJM6dBkpU6o4NSs2orhVfo
         s78cEWsE1wWhstI3tPLhUMyTrtUB3IP5/iAJf0d1WRnFual2a8+tqdNHuwpAl+Axfb+/
         +0Cw==
X-Gm-Message-State: AOJu0Yzpxhdbs7hahoP+VI++qQOknCOm2/0PeOM5R8cwuBRGVP6Gzua/
	lxKRy/SiZFTBUhDLz3WgD4BfZeOru14ocl3dOilsjacahv5en2IQP97nQD8rQMc=
X-Google-Smtp-Source: AGHT+IHFzaKHtn6W0HDhJQws89CbNYw8HlOIfF5xX5dlB73nO09Ykn1ZM8Isd95B0DrXJaETeAPsOg==
X-Received: by 2002:a05:600c:4f16:b0:418:c2af:ab83 with SMTP id 5b1f17b1804b1-4247529a9b6mr2845505e9.36.1718737607855;
        Tue, 18 Jun 2024 12:06:47 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:5d11:7fa7:8997:f811? ([2a00:f41:9028:9df3:5d11:7fa7:8997:f811])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36094fa7ea8sm6298482f8f.80.2024.06.18.12.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 12:06:47 -0700 (PDT)
Message-ID: <7eb1c459-90d2-4b49-a226-0ced8216cee6@linaro.org>
Date: Tue, 18 Jun 2024 21:06:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/4] arm64: dts: qcom: add base AIM300 dtsi
To: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dmitry.baryshkov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Fenglin Wu <quic_fenglinw@quicinc.com>
References: <20240618072202.2516025-1-quic_tengfan@quicinc.com>
 <20240618072202.2516025-4-quic_tengfan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618072202.2516025-4-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 09:22, Tengfei Fan wrote:
> AIM300 Series is a highly optimized family of modules designed to
> support AIoT applications. It integrates QCS8550 SoC, UFS and PMIC
> chip etc.
> Here is a diagram of AIM300 SoM:
>            +----------------------------------------+
>            |AIM300 SoM                              |
>            |                                        |
>            |                           +-----+      |
>            |                      |--->| UFS |      |
>            |                      |    +-----+      |
>            |                      |                 |
>            |                      |                 |
>       3.7v |  +-----------------+ |    +---------+  |
>    ---------->|       PMIC      |----->| QCS8550 |  |
>            |  +-----------------+      +---------+  |
>            |                      |                 |
>            |                      |                 |
>            |                      |    +-----+      |
>            |                      |--->| ... |      |
>            |                           +-----+      |
>            |                                        |
>            +----------------------------------------+
> 
> Co-developed-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---

[...]

> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l1g_1p2>;
> +	vccq-max-microamp = <1200000>;
> +	vdd-hba-supply = <&vreg_l3g_1p2>;

These regulators should generally have:

regulator-allow-set-load;
regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
                            RPMH_REGULATOR_MODE_HPM>;

although the current setup you have never lets them exit HPM

Konrad

