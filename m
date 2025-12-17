Return-Path: <linux-arm-msm+bounces-85478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B459CC7448
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79E41301ADDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF353343D82;
	Wed, 17 Dec 2025 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffRi2XaI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlORJSy5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5431F34320C
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765970064; cv=none; b=iinhC8AoTYdtTJbeQYB9lYSCguS/VrF2uEHRFNt6VpTalGx7cqgDutxP8Eue5KN7nDnPeW4cuTqmrChTsIJZ15LyNDHNu2hpk3zvgR+MeiQawf8HmuT0thRVXoFqPwxCgADNf15lY38JuduYdYrB9Kge7JA6zGWbm0pW5Uqu/zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765970064; c=relaxed/simple;
	bh=jJNrBqLbcXCuD9NuvkheDISIm9Smr08Oac6cB/MwqTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EXmhE1IR0ibgpLyMnQP0lNgNuwwUEjNXLhlRI9XqigVKnq/R8qLWZES5UEWWl+iNq8Yu+Y6TIHwAxKOCgNc9PWYeZ0w0Aoq7nOE5uzQy3AjM/rrSXSymliSdM2J1LCJZRcTXR5L5+EuU1fYHRvTEyojOKOOaz7ve97Ww3ymQyLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffRi2XaI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlORJSy5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHA3ZAw1281968
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4e2ZqtFWUBOAn+zCPWxVaMcfcpDXuDusgMo4taKM2d0=; b=ffRi2XaIRw8BBlt4
	kpTvKijZyFt/98jMhsetvourVTv3g1+TVe/QmJ6Ws1TN6rA5+ixb4vbDDmTRC7Bo
	2XNogXULDSsI7ys0rGKhaOClD8Tt+W68rnd8aAKDQbodxDVBbB4Z7orI5zrX7hZ4
	P/RgAoTfdE//tRoGA0qSVrgek+F/CiyrstYkcfWvZgsAYguDCI4AGul4I2UZocXe
	3w6/MtStSHGBoZat/IlfamlAbJev1LrA2WD8BaJCIGKe5aZ9ymWQYK2atC+LuuMY
	EiANncygTC6m+nNwCX1lelQBsrTUO97wQUifNdM+T+YtUsB5HK3uZrGcvJnyILip
	cAqPUw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe2a6ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:14:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1e17aa706so17431911cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 03:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765970059; x=1766574859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4e2ZqtFWUBOAn+zCPWxVaMcfcpDXuDusgMo4taKM2d0=;
        b=MlORJSy5cjdCUMA3Dwed21Ti2nSt8u/Tu2nvXjZ1eCycS1+A1QNbKBr4YSk9T9uxdA
         k8QL0Bl/1UIQ8rvOHYLwMsp9INaVYudJtbWJ8QHh3jaFxxtkxoldF5m/tit43pMCRM2D
         HurIxEBOROTt0B7FWt2OprauFFxuz/1DwLoqdbQ9k9j07HCNZk3bXdTDZFS1CgG/cRSk
         6NmB2TAOfcf2nS8b6ucZ57vTdDMskUXC36NnWPwq8fpdiOLhmcDkiBLLBjrk6V9gbvC5
         xW3ccz3aGAM2QxKBBcBLnP/gyqN0AXoDefeSjWDgJ3x48/gwfR+F5xju6vFKHcTvZ6Bv
         TeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765970059; x=1766574859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4e2ZqtFWUBOAn+zCPWxVaMcfcpDXuDusgMo4taKM2d0=;
        b=a8BpJPrwXLu8UMRJyEGMJ/Oxh5nyaST3pMBIFigmyhq2b753AcNcT2E0K0+Boi0xaY
         v8LH9NZuNGw5vJqSqD8OW+uTJgSSAAQGguisg8LqBHBsD5KFeVTpjhnE5gUsIez7Mp3K
         S4/tNzkiXOlb/rIDTYuN+cIFg5E7uVcHH6c6Uo0uMfSzBKOD1yWfHqf1cg/ox01KBUfw
         yZef28mywYWg9rg1lO97AEa98tkRfN9+DhdVlOYelnxBqNxWMXmYrM4Pa5urZcLPHdcA
         8jCXtWpTHjy6D73zBy7G6MCmUd6Q1KIHL13TFkpr0VILrDu0az1tI9X5giKZ5RG6J+Ci
         xRPg==
X-Forwarded-Encrypted: i=1; AJvYcCUawUwfmvWy7K4cD2SuGM/K2Qfbjq+T1ttdkazy4Sz+MFVzc/KkmL0/5xRT9Duok7LS9sUTJcsvcpWjGaum@vger.kernel.org
X-Gm-Message-State: AOJu0YyGM6PZQPBEzOdyxGA4bNZN04S+2kpPu6DgF5lnWDUqnYKAP459
	IJozIkTrlbbf+T/8SJU2m9PqA4b0XRmoA4TpjqckrmLxSKlmx1kJsxT4i8YxdQck/FyA3/ByK4J
	biH3YiLd3NnbRWXdl0rILJeFCWtM7ENl3LUMSACAfTUkD73EOP0oNmMeAIZn28H5iylsZ
X-Gm-Gg: AY/fxX7/btqmYir/T8NZcbrXZXiDqjKSSlCCNZ1AtLI9BwXOgv8CDYhM/7fjeLKMI0l
	HZEgUa7lDI4uYUwXciPJG0svSop53T7Olm2mMsk3WmIsr4DTVKH//oqD0Xuiv1uzqNuMZtL3td7
	LbypRYyGl+HNHkX+4zqgs9FAZzSCwBJ9HHuwjB8DKaatI44pGv3XZJ69JyeMSAYC99VnobAu/Pw
	c05AYPbiYN5bZDarO8ZnYPKSrgH1lFf9tUtHA+L5QIQPikGVfgqIEbDEkd9JNOR3C1EJFwfaH5n
	5SaBMSj8YRecOxNDjIqqx2R5RJ+3zJJkek+4nOfz27OrLGMSGZ22hmlKHqhRVXFzx82ZjTlZSly
	SEMTXPEnkfRQBJ3CnuQUYKsScVmn8NRg6+L1mX7N7ktWeizyC9a5lvElGiXeLRXwI+w==
X-Received: by 2002:a05:622a:86:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4f1d0564b23mr187735291cf.4.1765970058718;
        Wed, 17 Dec 2025 03:14:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeeL3HZVOPvmf0IAL/4i2bYNx5YCSyo2xx9Dhjqf+zLDmXE2sc9O+agiSgDUlgq4sfjkUdtw==
X-Received: by 2002:a05:622a:86:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4f1d0564b23mr187735081cf.4.1765970058316;
        Wed, 17 Dec 2025 03:14:18 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29beb7sm1932015866b.11.2025.12.17.03.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:14:17 -0800 (PST)
Message-ID: <19bf8b37-4b40-4825-a8be-a94139389c69@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:14:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: monaco-evk: Add camera AVDD
 regulators
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-5-quic_nihalkum@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251216062223.2474216-5-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZoBp92YYG0M2VczdCALwwTui16fMlTnK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4OSBTYWx0ZWRfX7eoKBIwiK/1J
 I20mrCpFhZLA63YjS5jqtdc1Bt9mKYm1Z9nA8oL3XWu6mUHpBG0fv9+X41yR0Ba5ob/eK4EoKFx
 7oqOjhcemRkM115aTpkMxP/+6eEuPT5dlZQc7dWR2+45WpSZd/f7b9uTGmVgoJKjCh9H6fIiUIQ
 6KA3DtwC/utwYhmJ7X89agkj3MtqhV7xvL51CzoOC7aT1RhqqoJ+NJfKlHAmcFbD7eMx5F8RlIc
 pMLD7phSdN6NqB1ToYhxQ3bZmc2WRVP+sQzapObewZMV1yf+0YHyW1OQ8MGh8mFZKseB1mirzBM
 NYzrKoirQ2+i3mbVptkSryG8Bv5vOpUwnaIlpqzmusDT9+chWVR5JrXXZJlJ943aP8FdyxwAV/W
 We07ZYZFdwDlFzAt3Y2FZKOMfm9nkw==
X-Proofpoint-ORIG-GUID: ZoBp92YYG0M2VczdCALwwTui16fMlTnK
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=6942908b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=xHf7uapYn66AqgDo174A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170089

On 12/16/25 7:22 AM, Nihal Kumar Gupta wrote:
> Define three fixed regulators for camera AVDD rails, each gpio-controlled
> with corresponding pinctrl definitions.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

[...]

>  &tlmm {
> +	cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
> +		pins = "gpio73";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};

All other entries in this scope are sorted wrt the pin index..
Please take care of that and add my

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> +
> +	cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
> +		pins = "gpio74";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
> +		pins = "gpio75";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	ethernet0_default: ethernet0-default-state {
>  		ethernet0_mdc: ethernet0-mdc-pins {
>  			pins = "gpio5";

