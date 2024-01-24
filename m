Return-Path: <linux-arm-msm+bounces-8172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FD883B5A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 00:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6F371F253AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 23:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E761136679;
	Wed, 24 Jan 2024 23:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JRh/uJvD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2571353E8
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 23:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706139394; cv=none; b=fiioij8zipuzu4mmOBk27KgE100cWsK3xKTCEGvXdJ49e7tfLauNgEEIcxlLyxWj09WV7OIQn0JJ7nErgkAUrCxq+WJF3AY7GjeggYj6vusj4RHRWiBXLgBRTZelRt5jMxByy4QX3OaVNHLTZ6MVduzp7iM+BnaMgCqhnCRHt6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706139394; c=relaxed/simple;
	bh=+tvGycd8fkh1gM7sNFqcMBJjG5Qf+7FDcOeuXUANgAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qxj5b3ZhftZtp9F5XZEwsc/t7cfhoidCL9S64eSjQt2mCZeuu/zdCepWMutUD+9p17Y1zfWrcon/saJG6gfgSL14d4vdGPSmEo18orUd5xWMb5K1rTI1/Xh90v7sXFrQrKDJhXAz0Nm5ZRiv4WHNkfR3DXqxvXLhJkVgglYld1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JRh/uJvD; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cd04078ebeso2031021fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 15:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706139391; x=1706744191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/vKlrOmknMa0N0UOD2DGqbxqnH0CSwsvClTmdidQIo4=;
        b=JRh/uJvDGC1WO3ui9dBHsdSKYvBITKgSz01cUj8PB/qdJ+tAezgKFkzk0ImvRi+G3x
         SUcRLeQjYFaJfPw26H7JhID5V+R75HRdvmd7sKf0PvjdQlpD77HvYMuepn0LFeu6sCXY
         lNue1BBI7eFaSK4+n97BUTxx3W4sWeIbxtPl+Pv/mlHrHaW+TLsj0So/O2X8Kfi0fQeX
         AH3af3XBq7G4eN+LGM8p/c8zmWqfGG+DVQVNWLC9Q0btkrS9Jj9HP17A2Dme6aom5b40
         ezYnRp/2WavI1Agni8WtlSLfkOckXStjKk0SJ3r6GIjUaVc+ZjFrJJtuLaT2RB0SivWp
         fTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706139391; x=1706744191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vKlrOmknMa0N0UOD2DGqbxqnH0CSwsvClTmdidQIo4=;
        b=oBH4ln96btdBw+mfX7cBy4Fy6tvsDGe1Z28Yz6GVvosyF2YceqLCXCH/KYMOA3PEnF
         W6EOLOnfSlk3or4ECjXffLG7FOyQwpqqCMdlWhXY64Ve6pXCwBW+AdwEgDcXMhx5uLtQ
         4Nm8FCgrrJ2dk1E98pi0Hs2Q3fS0gq8A6L8RRUXZCeK/mue68UDsCdBogOy+hbpFYY1+
         89Vodrq8WJA30quvYy4EoYhEWDUIBiMAwAxucSa4oCkF+O8hgLMRladMKnOik9j9ADXX
         DxiydKF2g7tfv1PFkCShJrGtaaT5NHnepe2Ebp2hUw7Gzg9wiM6m+N61guMRIXtPgVLJ
         n55Q==
X-Gm-Message-State: AOJu0YyG9FUFLXh23P+MIcht8ga+M/xvgq9raAkq4GgPErEPyT2R07oy
	pePkkQJbKaWFNxylKi/k4f+9pqwlOuqwaihSIyBsypQBgrqvXPidA3dWKYIDJ2U=
X-Google-Smtp-Source: AGHT+IHMxl3uJPZqublNZwqgF2mxbIXuF8HFJdMOVCo4DxsM+TsBQn3zKVJqZHDSr5rfY2UR6qF/xw==
X-Received: by 2002:a2e:5cc8:0:b0:2cd:fb91:4b1d with SMTP id q191-20020a2e5cc8000000b002cdfb914b1dmr198813ljb.21.1706139390692;
        Wed, 24 Jan 2024 15:36:30 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t6-20020a2e9546000000b002cf15a1d917sm104841ljh.105.2024.01.24.15.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 15:36:30 -0800 (PST)
Message-ID: <30e890e8-42dd-4b36-a133-95bb34c109d8@linaro.org>
Date: Thu, 25 Jan 2024 00:36:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8650-mtp: add PM8010
 regulators
Content-Language: en-US
To: David Collins <quic_collinsd@quicinc.com>, quic_fenglinw@quicinc.com,
 kernel@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20240123-sm8650_pm8010_support-v2-0-52f517b20a1d@quicinc.com>
 <20240123-sm8650_pm8010_support-v2-1-52f517b20a1d@quicinc.com>
 <892058db-8013-879d-6c6f-3fbbf4ed3c57@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <892058db-8013-879d-6c6f-3fbbf4ed3c57@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/24/24 20:15, David Collins wrote:
> On 1/23/24 00:49, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <quic_fenglinw@quicinc.com>
>>
>> Add PM8010 regulator device nodes for sm8650-mtp board.
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 118 ++++++++++++++++++++++++++++++++
>>   1 file changed, 118 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
>> index 9d916edb1c73..3791971efee6 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
>> @@ -428,6 +428,124 @@ vreg_l3i_1p2: ldo3 {
>>   						   RPMH_REGULATOR_MODE_HPM>;
>>   		};
>>   	};
>> +
>> +	regulators-6 {
>> +		compatible = "qcom,pm8010-rpmh-regulators";
>> +		qcom,pmic-id = "m";
>> +
>> +		vdd-l1-l2-supply = <&vreg_s1c_1p2>;
>> +		vdd-l3-l4-supply = <&vreg_bob2>;
>> +		vdd-l5-supply = <&vreg_s6c_1p8>;
>> +		vdd-l6-l7-supply = <&vreg_bob1>;
> 
> Please replace this line with:
> 
> vdd-l6-supply = <&vreg_bob1>;
> vdd-l7-supply = <&vreg_bob1>;
> 
>> +
>> +		vreg_l1m_1p1: ldo1 {
>> +			regulator-name = "vreg_l1m_1p1";
>> +			regulator-min-microvolt = <1104000>;
>> +			regulator-max-microvolt = <1104000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> 
> Optional:
> PM8010 L1 and L2 physically support LPM vs HPM configuration.
> Therefore, these lines could be added here to allow such configuration
> by software at runtime:
> 
> regulator-allow-set-load;
> regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> 			   RPMH_REGULATOR_MODE_HPM>;

David,

I was under the impression that *all* RPMh regulators support
modesetting. Would that be an incorrect assumption to make?

Konrad

