Return-Path: <linux-arm-msm+bounces-81394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 173F7C51D98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 12:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 90B3F34B85E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744BA30ACFA;
	Wed, 12 Nov 2025 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6Wru3IC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SyaoZ+2e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71EF19067C
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762945772; cv=none; b=h++H8CMoWmGzVINog3uKb6ueQzm4n4bJkZMveN48tE+w1SVq0N743nJGKlC185SJSsGNbRwxhszVwDyHuG1lWZg3pcvv4adrv4RRoYPKEmAdLWEF7VAXO7kZWh7MRDF2C6SW+H+tAufaikks3Z0bcnqEztY+m6wNs1QwZom9PLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762945772; c=relaxed/simple;
	bh=Mj2zf91iF7WbDodBXbDG6UDhaSLBeUjsQHQtU1uZoFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U95jfgKNTTxdTMVMqJSaXsFOm+vp+4u1CDJaskYwpW6BlrKx49PLdfY3Tu632pXSWrc20CvS48WJ1OyQdPTGpQKT55Ugbq0qjybCPeBuHL1gqE9VrHs1e0bNWD9ZhMk9oKtGZ8FGybiUPbocNqDj4NCWPRfIZwSrUzGx6/nwavQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6Wru3IC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SyaoZ+2e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACB9Ifm3060096
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ovev38cqgZN4f4L9JryT0Ym6h1bkGFYpNmPLJfdktmY=; b=k6Wru3ICAAUffY2J
	tQaaUEq3tyVHKX+p8haseTx2GM5rTWG9r95yMU56/5iuqDjLvIjA30TwCW2Fx5U1
	8VWLbFjp+Qgdf+qtN0SUSVLCNFVVxoSbnuIfDv1nqykycBrF/I8z5biLtbWVn8CP
	/IZFX+aCr72/FgxUUZ3fsfA2sDtfKocwK+nMaLvZvOZStP+4Y1W85WY0rvAL0Tz1
	O2ZMtZRWlsTFg8FrQz8SubZPW5BziXt8iJiqgNhO61mOOS/3eTEGIBGZaDjMhzlm
	SOZNmaZHPcjFNGE6JsOh+m7Wy2mmQevsUj15TSfr2q57Fu/jK1wt8S9P0QaQoPsQ
	qGAbNA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac988jusy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:09:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88088964786so2116646d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 03:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762945769; x=1763550569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ovev38cqgZN4f4L9JryT0Ym6h1bkGFYpNmPLJfdktmY=;
        b=SyaoZ+2e1i00gx5Xmg6azGZfLvzlxBRugrp0EN3SYfDBPzw1y4XJrfSnYWPsym+aTq
         6WfoRTeuoHDYSys0AHvuvduCOOb2acoV4eLFkGsnWx9MXhvqpWzpcXTWGhZrAPfr7wHy
         aJ2WcoCgnRF78M2gxdT6NYBdhXcxrrf3+RyWW2crX7LxBgdfD+cllu2mmt6tj8Yw+Ttj
         MuksYWen6Sxf0NNqs01SDDwxBFyNczTqnpA0fmEH2DU82h4UmGJToIhUF9opNNO6d2qJ
         Bhf9PcorVXRIld1qKm58lyYeyuRVAdP3FbLnNR74B36SEZ1Q7XbADITdbHG5wsuyODcb
         xQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762945769; x=1763550569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ovev38cqgZN4f4L9JryT0Ym6h1bkGFYpNmPLJfdktmY=;
        b=v339Lmxa4wXAjwUmMjFh+8aoUdwxn4xqam//zwroDVPW3GYDx8Ewil+KCzxMjhKpyx
         1mzlfQhg1Bno/igCNfwn3NqzrPGiG/UZTR0LLPsTpl+CFPwnqY+D2aGmpO/JTBKaMs5s
         uT3aQutJWE7uSVclSISj0XtuvKnBViPYt9VXVQMlX7TGMvRUibLGPVcaKRAbagmmncdK
         xutv4sqDduC9QqesekJos5WwWtX8BrIF3mHCRDonvnyjtEoQiunB6Xgw2VZr1yAcUzb0
         PuNJRXPNvALx1Y+yizkm1uu+98MVUtfwabgcPDBAqei2ve9/d7DVWRjAbrJ7RI3ljF0h
         TJ0Q==
X-Gm-Message-State: AOJu0Yx1kuZVfADCkOzkNYUum41s+pOjw1UDJeYlcnpFiuKXZb41lgx+
	fCzGaugJf/betrZJE3jXHpkJ2EqcV6gy4jlG0ELkZRttylUQvOEqp6aFgg7r+NycjMXSV3kXwib
	MbKmYXH8Q1RNJI1xgzQIkx5S3p1L4KgaFlXjYBLSTvStyfivq7uUE5+/kEUISSSggSYpa
X-Gm-Gg: ASbGnctdruvmLCMhV7l+pvkdxvtHqA6uDQl3eEyLQmVDocqp4OJxkcisg2/7a6S6/tN
	jQ6rvpjNmyGgcH0cB0gp+s1a15Prd8xxh4fbP5iW9gJ0iVMg2oyZmhmSkjoD6k8jrMouRz0/y32
	RzrNpFfVk6ArWqOuEQ22M/RV3as2ACb095W0amhiaPO9zy8HelxTEybI2iKDaP0j6D5jCdsn+nJ
	pf8XXi4m+TA8vWOGVLwzpUMLc/4wn5kLC93Ot9OklCWSXFnWcP1AlEPMhJ3BpY1iz6ehg60OOFG
	gNF9LcWZrQJdUM28bQkQocxqfQWNCr4phsp+A59Q825v2lIivSVt6+jln5sjSbDiLAgkKavoK+V
	jinTxfqBjsBMLupO2Z9Le1FcwMhBrK80fGM8nzPbo7SRF+cZjr5psW1MY
X-Received: by 2002:a05:622a:1984:b0:4e8:85ae:5841 with SMTP id d75a77b69052e-4eddbcd3749mr21585441cf.5.1762945768869;
        Wed, 12 Nov 2025 03:09:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGp4fwdoVeHniIem4xUgD9xTKdDEyJu3Zp6STOir/2bd7BqXhus4M6RbhTjd4JU2skm1ng5PQ==
X-Received: by 2002:a05:622a:1984:b0:4e8:85ae:5841 with SMTP id d75a77b69052e-4eddbcd3749mr21585241cf.5.1762945768383;
        Wed, 12 Nov 2025 03:09:28 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713aa2sm15495075a12.1.2025.11.12.03.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 03:09:27 -0800 (PST)
Message-ID: <dc500814-3b1d-4cf9-8f73-6fd71ddac28f@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 12:09:26 +0100
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
 <55eb7543-7b88-42e2-bb11-7c54c4e59801@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <55eb7543-7b88-42e2-bb11-7c54c4e59801@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gpPHpSphYd0uy0LpcwiMqJO9qFZRoMkP
X-Authority-Analysis: v=2.4 cv=eO4eTXp1 c=1 sm=1 tr=0 ts=69146ae9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=M3Me-dPukj60BvPhPu8A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4OSBTYWx0ZWRfX0e/9/DmhPrg6
 BuHObv3/tMtP7FlEDt5caIXSu1+ldHMNTMKAuDb4lBBdarmjvYLwDgV14sZcUPDQvSZDX/EpSKj
 F0KdSE0ZfJEJvwQQEmHI8kFcx3IV8yDn4GUB+AC5+iFtNRD0o0PE9yzPU5QjaOZ4195XKDbSWUV
 bJtIrvkZkStBkQ+WXVVJHEJEimxLNRAZJsmw/YHXX4Sw5JgFSRz2tl0iqSTL7guX5zv1aWt+XIP
 YFZyrED6ks43TAYsVcHf1fG5EQn0MEzyD96b3iUSyV7kDdr6dkJXDUSqNrW26Th3/RTKuOdr0Ly
 DcTRFhAh/kX+Hs/qIC6hk8z0YnhPs9noia1JJkomgnfBWHo1Y6ksfuE04zHbrS8UGYzzjuley8k
 TB5sK1hu2Y/ezquV/g09zKuBM76cPQ==
X-Proofpoint-ORIG-GUID: gpPHpSphYd0uy0LpcwiMqJO9qFZRoMkP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120089

On 11/12/25 10:28 AM, Konrad Dybcio wrote:
> On 11/12/25 8:42 AM, Khalid Faisal Ansari wrote:
>> Enable ST33HTPM TPM over SPI11 on the Hamoa IoT EVK by adding the
>> required SPI and TPM nodes.
>>
>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> ---
>> Testing:
>> - TPM detected via tpm_tis_spi
>> - Verified functionality using tpm2-tools (e.g. tpm2_getrandom, tpm2_rsadecrypt)
>>
>> Depends on:
>> - <20251106102448.3585332-1-xueyao.an@oss.qualcomm.com>
>>   Link: https://lore.kernel.org/linux-arm-msm/20251106102448.3585332-1-xueyao.an@oss.qualcomm.com/
>> ---
>> Changes in v3:
>> - Squashed patches touching the same file into one.
> 
> Doesn't seem to be the case

The author was referring to a faulty previous revision, not my
suggestion of coupling this with the dependency

for this change:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

