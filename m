Return-Path: <linux-arm-msm+bounces-81362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7C1C515FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 06EC14E22DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 09:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D8A26CE04;
	Wed, 12 Nov 2025 09:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOmRUw7K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z59uda3n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24E22D7DC2
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762939688; cv=none; b=CTHl8o+xgF5IfBRIPfxPm/TNUPAKABG2uxsEP2BcNeXRi4aY2sAUtm+bgaKXEmdWuYfe1jBxgOVTQgF2D6kLcjG8h73BzwbGZo5K9uXYmIZDpaNu7NPfjsqk1/q2oXurih1tGknGwhXo9rgGz75mIVU0DZpu35agb+cI3bsHkNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762939688; c=relaxed/simple;
	bh=kpajzfk3rDAEjSNP9zfr7jMwHp4VKhF/KzKQTb7TXKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWd5SgvIYTbtY4M3nil1eKbISpNRnEbItub8E+puWQcrBIZHSnNxSnpC4hwRjVwXzIhuTSNXOfp0CDHFxUAtXBU0LGuludUJghfHqvOizEVChjTXv3jzN6GZ3011DgFaDqPKyLlyfSASfDEj7dhr4yvb9VFUnF5k65iqcDrAY2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOmRUw7K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z59uda3n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC6SjkO350136
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQyIyIHzX6mvdwDeO6aUWHKb0Z58Y9WeZ+jXu9rEMRI=; b=SOmRUw7KG6qiNAQQ
	gDGji5E7TWZ0PrFhQwdF9QHP/DOV4FuQtJ9wOSbtvTTkPTKDeRxGg9LrehXaezdr
	JpwdCCyzNBDNxspenIr26zPiYzLoyJzXOfwSnYDo70ay3bUyczjQrPY/Q4kG8VxS
	zVbY9qxapd08nxn4ADc9ULlismg5GRxsYspnhMw9QG3ykfvL8wHKg+VWLflG5kni
	ejEL+rmCZdXRc3Nfxj4okfXRJ28M9d5Em0pmZ8IaJzVldVdT2oRFPHS8S3orVP3R
	miU6iUe5nO+zWkdOkEMNCe4FifC1VT8kdDWXDw570unF9+ydUi3hSl6QKPfj+Ew+
	7kfvVg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acn0nrh8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:28:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6a906c52so1567401cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 01:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762939685; x=1763544485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQyIyIHzX6mvdwDeO6aUWHKb0Z58Y9WeZ+jXu9rEMRI=;
        b=Z59uda3nOJ8CaTJ+2hGPt0cN5OiHXZYwLoM6zKoMcoOHFDeE8A7DwzK/CDPdRGA++g
         FC/Ad6peypvePZkPC5NJJeMR40trR2h2m25NNgvd12zVqse+c7k60fFIGqvLxs4CGjCv
         HLbMpjnU0IAzM2I6YtX1XWZcHMf3JL8fjmesLh6WJZ5MnfrW/T3uJkytzfaRhwrgiOqw
         Ah143SBIRbwI8vZstgOpXjZ6T0Lx6EcKGk8ApJ93O5rbZSkkkht78mpAYPGJWyAPPx1X
         CKOJgTuuWFfkwR7q/SMe2EoSLvyDd3AzK+miLIE9m8imOMstXaqWVz3+QjsUH8t6jIrg
         /3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939685; x=1763544485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQyIyIHzX6mvdwDeO6aUWHKb0Z58Y9WeZ+jXu9rEMRI=;
        b=T9AWHIFvtYGJBpqplcuReBMIU/inUVq9B4qKJU4WAos9TtFpO7ekaeaCR4C8uN6ZA9
         8z8YDtJuEjT/6wdXFQIFo1HLLFhcl/AiTxnoHFrFETcc+2b7MryTnMFJpIHyxVbzbQUD
         /r3flwCUJ+yzGJrhJzdnQsgbtvY+MRv+aDIb4ue4WTcwH1+VcTxSS4IlAmBQnCpNZusK
         xmsNXoJzSP0n5IJkLq+RXFCemjcK0FUsugWz6lr0m5NgfXZhKPdJtdY0d8RqBVtk3aRd
         80hImJwddkzmthQxt29DU9x9hkUC4KbSIaFmuX/eymMf0gk4np9FqBD1DyDfWSznYKXE
         sm7A==
X-Gm-Message-State: AOJu0YzGLTsC1cxjlmRRbfrEViQCYyjjmnssnbfnqWr2eM3Cx94QOJ+Z
	b+Bu/2HOgBkM3aKomaXWjo39jvnbBfbRp5xs1yB3+wye8XCT10zKykVpYFq4wL8V2ThMZ2cjCeo
	vC3twwmLu2er2kX+xuNF/2T/EWLqk0x5FBqlnSTyl8YS6cykkERJQfdHJxUOJlkw+DZEw
X-Gm-Gg: ASbGncs5BlQwuHZgsf9ogwoHW4mZr4uHpLFktshauLl7eQy1suk0HM/QG3RDwbeoqZC
	T8BMtRQFav+tWsazBISVhnCoshaBWRt6SqDCS2+HiHqpVEtXPGY7cYd+FkyODAP7QpNrWyY0sPW
	QU7vrKW+chh2txVXSi30oqKpnrBp/3a+NbE9bICaUqiB5N7SFf7vtlTWwr9vBTOfEy3+9aJis7g
	w8SWmXTP2Az5XPL+XxLa8VktnA+PXnHO8Vtl6ASgH9QFywi3GsYaLXVjTXdQwlmJehdxk4xn4/u
	sokO7hgqby8Hz7F17gHO22GaqeVxnphN2wW9SwX+CQAvmDJyazetZsOmzC/dxboy869OUJ8a5ZK
	qWDnGsjZ0VHs4d+SM0PfLDUBDb39Z/YQwdW1ULnm3VnXsecF59VQLX9C0
X-Received: by 2002:a05:622a:180e:b0:4ed:b9ee:3cdc with SMTP id d75a77b69052e-4eddbc3b54emr17962481cf.1.1762939684927;
        Wed, 12 Nov 2025 01:28:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR4/W3vDk4YLbccmyiv4XaXdLztuoz1oWe+zLmX65bWXg3EkzpMp4c51bebuFk9GFGSmrF3w==
X-Received: by 2002:a05:622a:180e:b0:4ed:b9ee:3cdc with SMTP id d75a77b69052e-4eddbc3b54emr17962291cf.1.1762939684402;
        Wed, 12 Nov 2025 01:28:04 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72dbe7c783sm1295611366b.50.2025.11.12.01.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:28:03 -0800 (PST)
Message-ID: <55eb7543-7b88-42e2-bb11-7c54c4e59801@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:28:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33) on
 SPI11
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251112-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v3-1-39b19eb55cc3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251112-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v3-1-39b19eb55cc3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7ENfEzrhoUWlwog6KgN_dorKrjnc0f9H
X-Proofpoint-ORIG-GUID: 7ENfEzrhoUWlwog6KgN_dorKrjnc0f9H
X-Authority-Analysis: v=2.4 cv=acRsXBot c=1 sm=1 tr=0 ts=69145325 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=7d4G-bKz9gYrzHuYZ2UA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA3NSBTYWx0ZWRfX5sZlEWE1EdBv
 fS2bpyL6wQMB2CogR1AaQ+9J9gpr5k3OvZuyLdaGFqBdApagWLCbxZ/VNCoOCyn2NPHMenQf2/r
 wh/c0DfIFB480NJgjhIEd7UtiirzCCZyW+ZMiPykc7Q8fGfeuSlrL3ZjP33VqllKxryBfN3iuAl
 zSra7TPC8XCUaNMPn/57h0Jg2M6XOB3frxY+hzI0mpWcmzVxTgYJUuSSYFEo/UBQXh6bUv0P/w5
 dalCCsdMT+5DesVekdKxMCs3tZ4jEW7hiZpfNCRdex3sBP+wFKO2e71hekm419tTc7bZu+lUDXx
 jrpklOaw7mnVd9Y8XdCSYEApFIo77aqoAbN+kpodaNpX5Waf1twhb3ggwlZUnPmcMt/5LhfRsHd
 NkVkyKZnoDDIfoR0ZrFUMuqJORbLig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120075

On 11/12/25 8:42 AM, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI11 on the Hamoa IoT EVK by adding the
> required SPI and TPM nodes.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---
> Testing:
> - TPM detected via tpm_tis_spi
> - Verified functionality using tpm2-tools (e.g. tpm2_getrandom, tpm2_rsadecrypt)
> 
> Depends on:
> - <20251106102448.3585332-1-xueyao.an@oss.qualcomm.com>
>   Link: https://lore.kernel.org/linux-arm-msm/20251106102448.3585332-1-xueyao.an@oss.qualcomm.com/
> ---
> Changes in v3:
> - Squashed patches touching the same file into one.

Doesn't seem to be the case

Konrad

> - Link to v2: https://lore.kernel.org/r/20251111-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v2-0-101a801974b6@oss.qualcomm.com
> 
> Changes in v2:
> - Use "tcg,tpm_tis-spi" compatible to satisfy dtbs_check (was vendor-only).
> - Add dependency change in cover letter.
> - Link to v1: https://lore.kernel.org/r/20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v1-1-8ba83b58fca7@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 36dd6599402b..aecaebebcef5 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -917,6 +917,16 @@ &smb2360_2_eusb2_repeater {
>  	vdd3-supply = <&vreg_l8b_3p0>;
>  };
>  
> +&spi11 {
> +	status = "okay";
> +
> +	tpm@0 {
> +		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
> +		reg = <0>;
> +		spi-max-frequency = <20000000>;
> +	};
> +};
> +
>  &swr0 {
>  	status = "okay";
>  
> 
> ---
> base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
> change-id: 20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-c8353d7fe82e
> 
> Best regards,

