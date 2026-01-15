Return-Path: <linux-arm-msm+bounces-89207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D3DD23EA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 11:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 015553016902
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558B7362153;
	Thu, 15 Jan 2026 10:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHFAZj1R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="izs4GciF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE74D362125
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472583; cv=none; b=NMkopNSP9rAvQnahOfVPwnStOVMO6teuyY6WMzUHrWCsB7JtOI4NPCdMjhxPqtZRnayocRzVc/O87hfB4X8cm0dnS1mSpQEKdyVqv3YwvFWauFkoklXLCCMERXgn8cI1sSBvn9mMW91zqbOl9UZd7LBq1QjSJ9hYfJFN3jA6e6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472583; c=relaxed/simple;
	bh=8VMorEnHu8Q7XDb8mxg5LfftL6ocg7WNkKa1N7oM66Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1pr9ZG0oxAwMwV87PkvXOZPEnzGYGozRMRyMP047Pzb/RTUYrYhvlTQT30dciCVZop5b7RgsfnCj0/nY28uNA+a7TRkoWe7nZU9XFWFo0rTNXl5tJk3yBhBBxevh8+++SswK+co7a+R82QAYRRiJuMBNuibnE+L16Vkl767X1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHFAZj1R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=izs4GciF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fw4r1991687
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aMDE0RiqWcLxZam712Njcckq5qTRAi31bZeS1GwmNuY=; b=UHFAZj1RxiMFPh71
	GGDAkcDFMy2J7blTmiwVbo+zUV1TyOlw4bLMMkDQr+PX8CRS3i9UngxtmlizHvJ0
	4bt7BmrYvFfWRzEKGIxdCOgiDiAITThundt5cZSBQSh3eCo1N1YJZNpE5Ol5DOh4
	nu8e5eeBgLH3R13l45vi2kbUeXBVQh/e/yYc3+gwvYB20o+0d7jkaDHGYMv/gn4b
	G9alWyGFG0WVjP3JEcmru4jpPjbo7Rhc/QfsKXBhsvjEAkYPGJpap/mOGzgsKV2Z
	JM9WzmDYKf+8hHgOLq5/4O3HqtGnFCYsMu8a0nQsTs8x0w60L7z2xpHZg6Af55CH
	c8Fnzw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbuj5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:23:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50298ec536bso1149661cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 02:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472580; x=1769077380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aMDE0RiqWcLxZam712Njcckq5qTRAi31bZeS1GwmNuY=;
        b=izs4GciFg0ZRPlQAgUSACuR1kDbghd1hIHFl8hwln/etjin6xn3kvP+9ZcoHj2aGxZ
         Dd6UgZSN4n4y4CODIhMzmFRACdxNB4OorSB4R99yNhK9TTRvqc3XFETEMWSAxr4Gp0LD
         65bfaAL6dXaaBHvcT0hzZj6NaAIAKhBlww3EadHP+w2LyF88n/k35mCGFAhFpUzixgES
         JMiY4DrpO48CN8T/oDf286V3T6WzRMYJu2ZC10Xf655P8h5PFBHto/hJCcmrAx1UWlQN
         DCgtl4Xepf5E9qc61zkiiTI7Tm0l6ys9h2G6RqjtyeJoF9n0eZcV87zTcjWCY1Qaca58
         SSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472580; x=1769077380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMDE0RiqWcLxZam712Njcckq5qTRAi31bZeS1GwmNuY=;
        b=nCrqLoHuZ17H9oHklX6GkyhCkOJbCZiCl8m7ss8cjvIo5VvUi/qFUTcYvLKuKxuoRJ
         I3Ci6/lmtbvAjmNTGJAne3oOwwYISQCCHN3z98iEt03Wsdg+O3DuDJbi48kk/VzNjFdy
         MaiQZiPbPU1pGEQwPZhuB008kA70195EzNezrPDGyqe1HeGe6p5pn4CvM1+XwncILe0m
         BOJVLP4itVTcibekkthWjroajb6NgRic5/+k6Y5HswZszMnyJfMfWtBtiXIuA1zPRs2/
         ldHRZk4poR24koDE0ZFmuvsRZiw1V7kcYb+uzo2xKvA1y1J6YH+Br5S6lfPxgXbTzYyd
         pajw==
X-Forwarded-Encrypted: i=1; AJvYcCXfK6RqZf0TFythx9qfFWHo/jtpYWdjrDApaT8kN4hTwfmi4KEKyfbFu+sN+CWb11iN4K2MF5vMV/EArpTI@vger.kernel.org
X-Gm-Message-State: AOJu0YyBxOpxm03UkgL3nI+UVjcjctHaay0LcZfIN5d7tRrNSUF7ESNh
	gTlS/nLF7bwz86DNUPaVtzXiZSemr6Oy3hMjOXNr2MK8f/dmK6l0JxByA3DVmzurWX9W1nHO23v
	Gu7SHCwpMqNUdBdTb89v17cI1jXwaobEFWOs2sTw9bqx1Wo05iwyBWCHCybdvl3bnZqEou51FyS
	bO
X-Gm-Gg: AY/fxX67bZzp2cgef2x6wzTkjR/6CCwCBpeGvqETGysfBKcEwgfBvE8VeCYXkzJCm1e
	Cp4FT3xZE57kRDtMxYbtjaEJNP+6qPNLE6gzbHaX9rHwxhA5CphKbohcJWLUnMSwfU0EPfE+vHx
	lIR2dx6opQ+Mug25SnQjdhP2rZJNKXZbJKHWNuW5wXw6oSas+xcrLedrS6QV9NA2fLzfUzxaEg9
	iUusMTVuHq3whqtQzrAKwJUNl5wyR/kmAvoFdT0dNXzgbb/9cAKFAVTfajvPjk6PVvAPn+Nl7J+
	0rH+IRny2RvD8UDq5rTl9RaGHi47pGs3S/jFuIwGyn9NaDJQkZppRzwIpCdVQ5+C2MFWcloloGq
	UEw3FkHBTAUFuR+2GBbdO6LWU0+PHBenAPlnoGWMN71XPDaz3ZjTwkwJ91K0pxls+GFM=
X-Received: by 2002:ac8:4503:0:b0:501:5260:51e9 with SMTP id d75a77b69052e-501526054b9mr24693011cf.7.1768472580152;
        Thu, 15 Jan 2026 02:23:00 -0800 (PST)
X-Received: by 2002:ac8:4503:0:b0:501:5260:51e9 with SMTP id d75a77b69052e-501526054b9mr24692891cf.7.1768472579764;
        Thu, 15 Jan 2026 02:22:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b844e46ee63sm2295795266b.15.2026.01.15.02.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 02:22:59 -0800 (PST)
Message-ID: <3cbdae12-af7f-47ee-89dd-6c00660fa6da@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 11:22:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] arm64: dts: qcom: kaanapali: Add TSENS and
 thermal zones
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-3-a6cc9e45de93@oss.qualcomm.com>
 <4c44mmkpsnj4cn2eh2xzraiw73xmhtx4qm3xiyhecm4vyou7os@skyj646r63d2>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4c44mmkpsnj4cn2eh2xzraiw73xmhtx4qm3xiyhecm4vyou7os@skyj646r63d2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6968c004 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lxnUxbm5oaaQhmREaRYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: RDV-YqKsfmaRsYLiaXSEeRTJebeIOu1P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3NCBTYWx0ZWRfXzSCPXSuRqpZ5
 2cUGwyAHs/YymlBJB90/LC097OOJXg33oxDE+uv1rb/+2W5n5ODJxqCXMii9c0D2KYhLvbtCurT
 swYUDZAeqqJxQ6RGqCJyrSFHbAukQO8gCU7IOgdkDXZFXbAZQm+8uBUVFguEgyyN53gMFLjyWbL
 crs9gTDTBuHHRo6Z7JO6yfOCPY8EO3ez8seUgB8SkSJHLYg9tZrmxRAOxkg0wmzXiQTKwP45Gjw
 +YfFb0oTtVK/lliJLy6Eu860BjngCEx+CE3/PSSUbqT8Cb4K352HXGlxZvA+qRODFuhriTpL2iL
 pBzurhi1xQA0iCnanIiwDL2YO6JhwBazVCBsENlYl8i06vtPFMAbshBj++rOvk7IB1ZlErqFOKH
 9ThXmUydPN5puCYt2f11/PXk96Oct5ufVmyCmzdWhQ566FU0yu1qAp6PxXm65RdFGhmfHMEON8w
 R1d8ge8397gxdGQJhUw==
X-Proofpoint-GUID: RDV-YqKsfmaRsYLiaXSEeRTJebeIOu1P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150074

On 1/15/26 8:09 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 14, 2026 at 10:49:05PM -0800, Jingyi Wang wrote:
>> From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>
>> The Kaanapali includes seven TSENS instances, with a total of 55 thermal
>> sensors distributed across various locations on the SoC.
>>
>> The TSENS max/reset threshold is configured to 130°C in the hardware.
>> Enable all TSENS instances, and define the thermal zones with a critical
>> trip at 125°C
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 745 ++++++++++++++++++++++++++++++++
>>  1 file changed, 745 insertions(+)
>>
>> @@ -4795,6 +4879,667 @@ pdp_tx: scp-sram-section@100 {
>>  		};
>>  	};
>>  
>> +	thermal-zones {
>> +		cpullc-0-0-thermal {
>> +			thermal-sensors = <&tsens0 0>;
>> +
>> +			trips {
>> +				cpullc-0-0-critical {
>> +					temperature = <125000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
> 
> I'd really suggest having several "hot" trip points at a temp less than
> 125°C. (And 125°C for critical looks way too critical for me).

LMH and the firmware make sure this never happens, the critical trip
point is a last resort safety mechanism

Konrad

