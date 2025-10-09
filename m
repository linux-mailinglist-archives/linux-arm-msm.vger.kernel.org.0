Return-Path: <linux-arm-msm+bounces-76595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 217E7BC857F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C756F188CFD4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D15E2D77E0;
	Thu,  9 Oct 2025 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbTF4WvT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C359E2D6E7D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002870; cv=none; b=J3YIIxkahXpheo9uQj08Ac5Ody0Kwem62THoBPXprYGKIQaT3j8lIIcoPJ9a+DJcf2ePY6xmTBfLTa9g4PQ5nnU0Uy2NYi2PbFl32b0AxeDKez+0dIw7IN1YQgyGSqE0pd9feSKvX7VNQ5US9noFJPhg+gXuGSStBRbBThi8eYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002870; c=relaxed/simple;
	bh=hjO46nWg5it8CbNTZJjSu9lbQry+Y0tbqwAr4+hiepI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKm1Tw5liEVZ1a16W3C8/26vLiQTVB5mga4+9HrAqlTnpgQFStnPLbZbKuvdY/+CdhfOVPth2TD2aD8R8fG4ULMIPXJ91xqgPzTmjhMZkde8GIOzmPjJVNzIRA1TwtErzd6oiLW9Jo3i2FfuvE7jnCHlZ07BF+Atu4tyqGq37sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbTF4WvT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996ElXd020128
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 09:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGTlSSq+8eQOySdUbPi/aGR701kfDoEADHwTgeSc78g=; b=CbTF4WvToQvbh4fr
	pLV/hUHFHJzBIx3W/idPY/KAuGoosSiyrPRp5lDKYuEOl0t+q9NGJRUo4f7JEi2D
	szKjZo2iGIxmig12JUmRQm9pVbiQIoyxS+grEQvU4DgGNgPTLYltcT3Bj70xuTcW
	6Ntuxv2fOy9Y6cIo14nHbfratWmNB6XY73rMk84xl8P91YgHaWs5M0bS5uktJST5
	8kaBK2iIx5hOSfGjfCw8HgCO2K+A+ZWNqdm0BzX7sad9YCu2fmbC6ZKUrd3ArYpC
	Z0Z5GJW0pSCdUDXlxSlo/8C3uL5MakDixZkF5+RhmhnB6J5T/UD/dSC6iXt/e2hb
	96Am9Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nt8up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 09:41:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-267fa90a2fbso26837655ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002866; x=1760607666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aGTlSSq+8eQOySdUbPi/aGR701kfDoEADHwTgeSc78g=;
        b=LHAur9W45z6br8YRNQcKY11HAKqbXVnwjnWj39NBYmLJnHuNXg9GHnRtN9KQLr3YnT
         7vFqb4/TWmA6lEWjtClGLStNblBhPnQxVr7unJectM1I3R8a+NsjIQt813uXJX+iqb19
         lDrE2U/wWFp1PZlWR8C8oYJilP6MjY1jPGyLA1W5Mr+IMmw7uwheeV4odIP/ca+/Adm3
         xYdVWNI03/ewcbcgYV54qXV5+BeK8eomUlIN0fekB4wY1SeGjojSSD/MtnrAzqIQMCL+
         zRNj2Yw3ZtHeeIXKf3Vrv2Tb80zZ5xC0ikkGcSFPIqhoeZD+YY7kr/1tFb5euY4kEARJ
         VZJQ==
X-Gm-Message-State: AOJu0YwiCi6SYHGtVNA5N3rqa4XjQqW6zOSWT4fsu4HR2TJB7bpW5185
	9WZLfX+2D/XKyQ9QhVUVgjhDn5iXxO4DFQPYndmvhHcgYaXz00Sr8w+CdWRIqp11N51FjzVmypD
	PGDNj9Qg5pBNo/MKjJnlMw7Mysxz/p3XRsfEc1qvBfLBhpWNPhRPDRm9t4+aOssTDjDBm
X-Gm-Gg: ASbGncsYw1CHpO43p+mnX5cBGmvAxVFRFU0X3emQrQ3mjFO0PeDk5cjFNV01HjCv/ZL
	7biGPmFsK+sg8FY5h7iaVdLFsn7UihRtYplSQ47+oUXF0DKf1kVHI+kiP17TVWUmN5WEJmXykLk
	zF25atnEho2Rw4fmVyv+uZjmCDdiqMHDAZvWbX0VuchEXomNdyyPzRl8qqEy+SzS9rCyN4Vu3qZ
	C0XGdjkukRClTdEy1BeZBIhy6YskSHEGjO5zjTGchIJchZCD8xPH1YZ3PvLCzJG7Gi2iLKb8soG
	kjy/3QYPvWaRIsvxH2PDx3sYnuoBSBrrntNuVADktGNwnyHlb+6AUamdv+K6jrOSZygMGMlJyUr
	TcBBuBNIeTKBJznt5//7/ULewYH198jM=
X-Received: by 2002:a17:902:e849:b0:267:912b:2b36 with SMTP id d9443c01a7336-29027f257f8mr80329665ad.23.1760002865868;
        Thu, 09 Oct 2025 02:41:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6qD3Fez97NKxMLaWmN0Uk8mdrBcan/tESBp1DwEk4g/XwXSj//BKKzsIa66XuVcqn6lccJw==
X-Received: by 2002:a17:902:e849:b0:267:912b:2b36 with SMTP id d9443c01a7336-29027f257f8mr80329145ad.23.1760002865182;
        Thu, 09 Oct 2025 02:41:05 -0700 (PDT)
Received: from [10.133.33.54] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f0713bsm22764545ad.67.2025.10.09.02.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:41:04 -0700 (PDT)
Message-ID: <392c5d4b-80a9-46e8-af98-496ed8837044@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 17:40:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: Fix 4-speaker
 playback support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20251009072630.460387-1-le.qi@oss.qualcomm.com>
 <39ebaf4e-e91f-4568-8de6-9fc1f805a1e4@oss.qualcomm.com>
Content-Language: en-US
From: Le Qi <le.qi@oss.qualcomm.com>
In-Reply-To: <39ebaf4e-e91f-4568-8de6-9fc1f805a1e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kE2qsaqqUC4UJrHlQbbtufUYVGdg8qtc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX9ky2JFR2OeZY
 lHK9mm1zbAXSV0NtG6nYiRj27cQtzq1CeKiz8M2W4FTO/mD/PF/VtCCGDTF8INyBsfui/5CaLrc
 kyQtY4WsHAZI2ACo3gQ0EZZE1sOg7EaKB3ACDAy4Xiuu2VNi1bGxmIRIEHVilnXY6HOjb30QtP+
 U0qT7qKERH5jKoFTaTQJsT7fIaCgJcMDKHMfQdXeW0H7qKI7bUMsEEbm6hVO54WVke+fCDI4yLX
 Rez7X8NtxHzRdzJr1bo1iGAEhqthUYxky5jOPCgXhPLavx3NQUkoTlAa59Q0ASLJ8v7aImSImIA
 UKBCRNi5VYY63Rt/qjk4Mv48G5QfmbS8zMGKB902m+ezXw4wQi/zohUStpI05C5xGEZaZAoiBCI
 iiKnkvOPTv5iH3DOJpyd4kBl1IoM8A==
X-Proofpoint-GUID: kE2qsaqqUC4UJrHlQbbtufUYVGdg8qtc
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e78333 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=RyFr2WyApn2QNzaPLwEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/2025 5:26 PM, Konrad Dybcio wrote:
> On 10/9/25 9:26 AM, leqi wrote:
>> On the HAMOA-IOT-EVK board only 2 out of 4 speakers were functional.
>> Unlike the CRD, which shares a single GPIO reset line for WSA1/2,
>> this board provides a dedicated GPIO reset for each WSA, resulting
>> in 4 separate reset lines.
>>
>> Update the device tree accordingly so that all 4 speakers can
>> playback audio as expected.
>>
>> Signed-off-by: leqi <le.qi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 30 +++++++++++++++++-----
>>   1 file changed, 23 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> index df8d6e5c1f45..de9af19be6e8 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -743,7 +743,7 @@ retimer_ss1_con_sbu_out: endpoint {
>>   };
>>   
>>   &lpass_tlmm {
>> -	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
>> +	spkr0_sd_n_active: spkr0-sd-n-active-state {
>>   		pins = "gpio12";
>>   		function = "gpio";
>>   		drive-strength = <16>;
>> @@ -751,13 +751,29 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
>>   		output-low;
>>   	};
>>   
>> -	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
>> +	spkr1_sd_n_active: spkr1-sd-n-active-state {
>>   		pins = "gpio13";
>>   		function = "gpio";
>>   		drive-strength = <16>;
>>   		bias-disable;
>>   		output-low;
> 
> output- properties should be removed in favor of in-code gpiod_
> function calls, otherwise the reset gets asserted by the kernel as
> the OF node is being processed, unbeknownst to the then-not-yet-
> bound driver
> 
> [...]
> 
>> -	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
>> +	pinctrl-0 = <&wsa_swr_active>, <&spkr0_sd_n_active>, <&spkr1_sd_n_active>;
> 
> Similarly, because these pin configs relate to GPIOs connected to
> the speaker amps, and not the soundwire host, these entries should
> be split between each individual device
> 
> Konrad

Yes, will modify and test, thanks for pointing out.

-- 
Thx and BRs,
Le Qi

