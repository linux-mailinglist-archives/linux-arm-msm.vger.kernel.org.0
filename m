Return-Path: <linux-arm-msm+bounces-62705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 959CAAEAAF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 01:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3980B7B445E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 23:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFD622A4E9;
	Thu, 26 Jun 2025 23:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifkrKlJ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6D8225A3B
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750982086; cv=none; b=kJO7/vFnfFvajejoUkklDGJd2olglDSUpZANHYdWUt9m5n0DGWh/D45IeYYS0XqJ9yYgfeso2sXXT8XSrL88S2rWciQU1Z8IxkH07yU9m3lXaT1OpXyM5LT/+6jEeQrClRDmf7hLM3B55lVSSwA7Dv5R7yBipzCtDhlwKicGFgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750982086; c=relaxed/simple;
	bh=GC3TC7GMidiRgphKPIXpKkHkR9sTB5CRS+p+N4xN+eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUOm2b3DDiQo/sLQOKuTvQbzonD5iVsfrx5mvd8u5t4Wo2jNrJBzU0BuVcyRMwsVxvA0yGpczsS/JlrA9+qzG2dKnJGI6LHDNjNI8pFI5xK9eTJhTnVUkGQ9eOtBIp1ivraHCtpQSvIcGMWTww5VFxm8M5yZLuVD+yxFAhIGC3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifkrKlJ7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJ6mAd000447
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fbs4KYNHfJ3NP9WQooBIb3Q8R1VU/MYQIjF+jTKXYVU=; b=ifkrKlJ74yLUM0WX
	G9aGxzH9Q2H2nceFb3l3kaJ1Dq9K6LtOqlLp10EOPUUvWC/KXfVIHLs+ouV29Bms
	sMB8PlAt79Km50zaZjCFf08mgZ9vK50uMZxlswPciPYMX5DCODQfkDN6Fvxo5cFv
	sZnmhud0F1cSwRwUZj1jOnucwCB/pC4BvknUudi3ZUrsx5QGZawpgUa5yWFCc7LZ
	DhMFP8EeynXP4WnwJCVVhNmXSqUpNydFkpHZQno7MvqQTOsGIxJ4XyJWHZ6sl6gz
	90QZ83zC3EY7HURzPJOd0g8F/TSAdW9wuYrZpjkjj9r8S2CY8onZ2C7ewRnGSgUm
	8tckAg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq53vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:54:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0a9d20c2eso26761385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 16:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750982082; x=1751586882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fbs4KYNHfJ3NP9WQooBIb3Q8R1VU/MYQIjF+jTKXYVU=;
        b=HUKCMWyQFlnEo6xKNVL5YYoQrIHhogTrHIS6mQQzCcgJA83sZWWEfUZkFIkzuyqoTY
         eQo/k8KDVn6WOh7RrC91DyZZwXRbOgyJ0h1C+BqCFy5dntAcAaUaC2zvl6om2TOyTcPz
         sPEaHt7Cvbxftxr3xXrW5x3+ZmEtuszbN/y2XsxETtVXhfIC0OAJPt4kW3toDupc/B3q
         1od/WN7onhh3buy27bPUaN76ShipMDFPe60YDsRH8Umeq64nDXhf83HjDgZJgoSFi3WN
         LUDfKpHg7qKflMaXm6IiuNJR6CQdJHFyAKeDdGsXah5AKAXPYMfJtBk86zGpOFO8nah7
         0tLg==
X-Forwarded-Encrypted: i=1; AJvYcCXRtpeWRHzF7+50AMOrQKU9pjQo5fkr+tf2C5xS9JzwFVqSeysBmEecJgj/H/vgN+Tu/7Hl/whQqp7+TJ+l@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+JrRED3l+ZGtW1e7opVp2gy/MhKV2Zz6oNLUguyCPb7b4lnB6
	FYYC5VqW1M77z2wEPl4mOK7wphmcssohZfgxkVjEfCWy6G5bTu9HIJibDnGkz/qdKXUibGPwkIq
	LpWjVmn11wH7GSA/deW1p9DDLe+HU0elzI7M0x6chtbtStCHHKfnIcgcdfhaPrZ24xpkn
X-Gm-Gg: ASbGnctPGHHK0cVyQWsXQvRDEMuIpNh12GXcDt9dHZlka6hLJGRNivP6u5o5aDVnf9o
	rZ5TUYDwa6pZtfuhGsWoA8AQwCiimqy4F93cHwzkzZgKLbreZbrcyU2f9AgL1L3oT2N5v6WfL3t
	i0RVGqXfFXDjjsnfvr4A2xGpIoOP8VdO3wGbYfamz0Z03UDBpTWry41qDdb0sVRZ4SF5cDgHMwA
	7b5NknADUDrBepUaaLWwrQSp3IXK3BAcq0ZSpdBkzVns/aFUo1tCSnIuXcDeDtIlfKlenit2Toh
	OJw0g6ek6Pra2tfYHvdxwHzhFvMjSTRJVa+ONN18wwfoF9pAWMy1iz2G991FPUb7w3aUN5XnEP3
	dka8=
X-Received: by 2002:a05:620a:17a0:b0:7d0:986d:963 with SMTP id af79cd13be357-7d4439a5ef4mr80105385a.9.1750982082624;
        Thu, 26 Jun 2025 16:54:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZvQe0I94SfbVb+8u+GjBJSQrO+fR99SDvM1ofMBXxhAK7dEqWNc0BrbxupoF6oexwLClKFQ==
X-Received: by 2002:a05:620a:17a0:b0:7d0:986d:963 with SMTP id af79cd13be357-7d4439a5ef4mr80100785a.9.1750982080321;
        Thu, 26 Jun 2025 16:54:40 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659efbsm17829066b.46.2025.06.26.16.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 16:54:39 -0700 (PDT)
Message-ID: <95c46d39-5b4a-46dd-aa73-1b3b9bf81019@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 01:54:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] firmware; qcom: scm: enable QSEECOM on SC8280XP
 CRD
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-5-aacca9306cee@oss.qualcomm.com>
 <e5e3e8f1-4328-4929-825a-3d8e836cf072@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e5e3e8f1-4328-4929-825a-3d8e836cf072@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685dddc3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=qZF0ikmejsFuwZQdFt0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwNSBTYWx0ZWRfXxa5TNAoPIz0H
 8bTfxx9VldOQRrW+Bywc8cfCfwyoP+9ACTVsyfsP9w+RFBIOHNHXKEOol3L1j/kwOWd8vMa2UIt
 Pzj+7msdfMfk6tbgkgzi6TUpX6mAgbrDrpThWZ4KO3PRbPzo3tf7GbKVrg5lcMMMFD45ExRtOEV
 g9p8VgccgIejArCRimlRyMEtiNnOwd2rrllKWPEj8IbcT/kbP0HCuvXxC9rCWkty+T8Sub/L6m5
 yDGZdriLwL0NfTs9/t0OR+JBm5N9k8roF4ZnTu0tRLWklAPOO1ehLR0O19c5C84Au+pCZy9WcDz
 qIdQfG82Bw1em8QQaQNzabceO5nlAN/fw85GAJeozduSzhl1S5jAoiRC5B6WQodk/+OSVPPMV2A
 KNhEI+uQ2o/4gRzlbdT1w9TBannXqeGdDx9mcrs5PxcsDQPqIUSOKKn8DLjhml6QzHYbGstp
X-Proofpoint-ORIG-GUID: M-L5bfcS0kfcrWqHyLPQqVqMaMfhZbND
X-Proofpoint-GUID: M-L5bfcS0kfcrWqHyLPQqVqMaMfhZbND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260205

On 6/27/25 1:34 AM, Konrad Dybcio wrote:
> On 6/25/25 12:53 AM, Dmitry Baryshkov wrote:
>> As reported by Johan, this platform also doesn't currently support
>> updating of the UEFI variables. In preparation to reworking match list
>> for QSEECOM mark this platform as supporting QSEECOM with R/O UEFI
>> variables.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  drivers/firmware/qcom/qcom_scm.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index dbb77c3f69ddaa931e7faa73911207a83634bda1..27ef2497089e11b5a902d949de2e16b7443a2ca4 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -2005,6 +2005,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>>  	{ .compatible = "microsoft,romulus13", },
>>  	{ .compatible = "microsoft,romulus15", },
>>  	{ .compatible = "qcom,sc8180x-primus" },
>> +	{ .compatible = "qcom,sc8280xp-crd", .data = &qcom_qseecom_ro_uefi, },
> 
> R/W works for me (tm).. the META version may be (inconclusive) 2605

Looked at the wrong SoC META table.. the build date is 05/25/2023

Konrad

