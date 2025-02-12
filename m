Return-Path: <linux-arm-msm+bounces-47827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4481EA332A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E646C164C9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 22:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770F42036F4;
	Wed, 12 Feb 2025 22:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFQegtY6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCA9204086
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 22:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739399497; cv=none; b=M5cCjDoDeSTWrwtYnl8QMPLRJldLvgs/1fy9x8c6TkMFaa+rXL0l1DSwH6kZoSXFmwgJdQdL+m8CQlhFHgiydbR6CvBlpydrMmkhk4CBQcdvycitxxWYg2CRU941WfNMSTCaO3IdOdj52HDws76k3PrxCnf/NTl+kFk2S4fKPxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739399497; c=relaxed/simple;
	bh=mszfmsBiEXDwMQCXl6w3IWdUwN9jDt5VNdyv/sVVme0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MN+rBlWS+xzSzmpTKVJAZr28EL/h2hR6HXjDAi0KbYgQDwXI1yxbPyb0WPJiEnsim6hH6gDetYiCBgHQOuSTiQq59yiY3NMo1GnK4CtKzVv0thL6VxqGqYys2YPhzLm5WnDeCcyusCryQ5J7vq+UoQfHwiioKKHOuvYKVhyiDBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CFQegtY6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CL8kNC015726
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 22:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z10BowKlJuBRBMfLYLm6SSpaFYPkwZh03lVl2JlJJGU=; b=CFQegtY69nmFlfmE
	AbKBTaKbQZf+R3+TMcd0FhtpVwHaFHF5prvEuhOaG/4qzUAUHgcQUKEC9hKsFlOR
	XbDigIw84MCbqagzm9UUf7+8ghMmSUdZ48ntvupUQLOm4EFoEw5abw3S8l7B22N1
	OMJSJZlodGyEtcJ9AZWR3dBl7WvOrU5yjXNhI1Cu6aEmVNh3sbuJoCZHXhnj79aS
	AiVL7OJiye8zAOZ+aQ+Yee+1kjW80lacmyi7kQaGLPIY+77oxIpYIRf66DtW1K42
	fd61xGuBTRUtZIKCtQtKtvZoDfEz5yg4dRqFKLQbFu+6qVqd+gkInEAAmwjDlmNu
	XqFtKg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rgpgk61d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 22:31:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e44fc85ec9so609766d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 14:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739399494; x=1740004294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z10BowKlJuBRBMfLYLm6SSpaFYPkwZh03lVl2JlJJGU=;
        b=hI/LTJH5qfeJESD9AafyYMEcmSZv40SdnHYOZgPJpdr6wyU/wnr3QxiMD3ADI7FpyT
         g9NF2oRqBdgiqoiNSm3KBoRSlc12Zy/pREa1rr4gyjLvKBuzt1SaRJel6wQTXCBlHv8Z
         +huYFV9AS/wx0IA0+de0+/sKCyxC8md5SpY1JPWYKLR56+J9/PG6ud7RV+6ynFQkITqB
         SAbPv80Cihp2UBpLydhF5jpk3aG0uZKsq7NNDiL/PuKOaSIOuN5GL2pkGkkkOkQhU8gC
         PfrLayoryADd8VX9JDxoFZuII4xVA460ySYSrtUCUf+DfIpB/G53ojhXBqftt9XILBx9
         KqSQ==
X-Gm-Message-State: AOJu0YyFkubJAC57vaAv/MpZWzaEtHeQIKR3RZmhqLqBMOf25Du1oA+g
	2/4B/vrQDTuRwR1NBwAur6PJ7OdLGik9T2d6juo1gwowTf1+WoC38LmlFSO8hT2Ys6nlBLRZ6pd
	pnSfuM/wAm9OqWQJ+tsVFe4qBWVGKhHuYLlwu0VC7ltXYn2Kw9ZKGLL+ni1do2Vcg
X-Gm-Gg: ASbGncvb8lNj0BK9BB7Rn2ps6q2i5AMnQaUxMV8waUa8Pmm/Sm1uV6TXBOlYUhDfSbg
	UA3dOU0AFMPfNgtb0+TC1QeCHtIZk7SfIfRMBeusqvWR+Wo6qgxEvbBj/LbjBbrGwaIqkDIEzed
	QT/q29Fl8r0626adVwlHFQ9a2up79WPyNlNmZff2Y54smcwi39OltBvrtQCk86ABOZUJ+1XVQ2E
	MTVV+Zpg3vSI87GJxy2bMMp+lEMkvBNma3QU9yNBC6K3j+g2lbLsdUZjgScxhSy0EN/9TXLf2Od
	+pI84kAlYlcFXCRa4SrkMmNiFDztg6dFxzN4E7zqWpjMlDzNcKvNcW8RApE=
X-Received: by 2002:a05:622a:1103:b0:471:bb6f:5795 with SMTP id d75a77b69052e-471bb6f5ecbmr14647271cf.1.1739399493674;
        Wed, 12 Feb 2025 14:31:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXyYvi//prdBibNz4/zYphhtKumOo8H7oI1Q8ccMZf6ifskpReKqY5lbsKkMxrWPMtro9rrA==
X-Received: by 2002:a05:622a:1103:b0:471:bb6f:5795 with SMTP id d75a77b69052e-471bb6f5ecbmr14647071cf.1.1739399493241;
        Wed, 12 Feb 2025 14:31:33 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5339a583sm4943066b.135.2025.02.12.14.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 14:31:32 -0800 (PST)
Message-ID: <0d540105-1da7-459b-a812-dbc13097520e@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 23:31:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8917-xiaomi-riva: Add display
 backlight
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250212-pm8937-pwm-v1-0-a900a779b4ad@mainlining.org>
 <20250212-pm8937-pwm-v1-2-a900a779b4ad@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250212-pm8937-pwm-v1-2-a900a779b4ad@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sd8-3E9BZ07RVjK30Yh0ACm1evYflLy_
X-Proofpoint-GUID: sd8-3E9BZ07RVjK30Yh0ACm1evYflLy_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502120159

On 12.02.2025 11:21 PM, Barnabás Czémán wrote:
> Redmi 5A display uses pwm backlight, add support for it.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
> index f1d22535fedd94467ba3f0a88b2110ce5360e7e1..8808306c989f54116052667887f9bf36b63c4c64 100644
> --- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
> @@ -20,6 +20,14 @@ / {
>  	qcom,msm-id = <QCOM_ID_MSM8917 0>;
>  	qcom,board-id = <0x1000b 2>, <0x2000b 2>;
>  
> +	pwm_backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pm8937_pwm 0 100000>;
> +		brightness-levels = <0 255>;
> +		num-interpolated-steps = <255>;
> +		default-brightness-level = <128>;
> +	};
> +
>  	battery: battery {
>  		compatible = "simple-battery";
>  		charge-full-design-microamp-hours = <3000000>;
> @@ -131,6 +139,23 @@ bq25601@6b{
>  	};
>  };
>  
> +&pm8937_gpios {
> +	pwm_enable_default: pwm-enable-default-state {
> +		pins = "gpio8";
> +		function = "dtest2";

Are you sure?
> +		output-low;
> +		bias-disable;
> +		qcom,drive-strength = <2>;
> +	};
> +};
> +
> +&pm8937_pwm {
> +	pinctrl-0 = <&pwm_enable_default>;
> +	pinctrl-names = "default";

We normally put this under the backlight node, but I'm not sure which
one is more correct.. it may be that this one is, given we're
controlling the pin that the PWM signal is sent through

Konrad

