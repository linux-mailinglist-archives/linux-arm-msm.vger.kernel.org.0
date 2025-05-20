Return-Path: <linux-arm-msm+bounces-58729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AE1ABDD9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D0E61883A88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 14:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D087A24A074;
	Tue, 20 May 2025 14:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msAu+UBZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC5D24679D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752276; cv=none; b=ZAhwb1uDSOUSAoJffCXspPh6jK8H52HIEbOo6dBf/2Rt81cT1p0a3qlaydL4wXD1G+y+gjfowgjjcbp29b6qEoMcDNaVk8hf2RCSVaq3NYn1iseHzs+pgPSIxn4sVs9+zwQIlV/giXPlReM/NHU9l+zbmbVcmgwctM6ovM4C2Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752276; c=relaxed/simple;
	bh=hDxj1l9EjzLGuEMefLk+RkWuYjxMkDyVcIfEClwKEfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGnfESz434ZaB/CQnjgwHjsUp8NrOQkWqdqTFlVKpf0DnwnxM8byBoAXyuw7io3S7qf5so8O/isQXVOalycd9JlTFTbQvbnIEppXJ0w2yWrfsCZV31ytZ4qy2AmWxHDPT4vbw1Itx7/qwL0XJrPN4XrMxZcoR0vQ4GS58CmbQGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msAu+UBZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDrVch016023
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QorgnidCWBJg7Vmt5XBSexmPldS7Zeq3ffAJyueefoc=; b=msAu+UBZOHaAkog/
	VksUxN9B5K126HeDMviRBjJRweSX4iK3cvMq0ZsPcSTgcgtRxybRLVxu2iIpV3pB
	RFJGbsiY8eITaVefuua8f1uKi5WHBFqHn85L4FJKlcaiB6Shmsw01D1pOIAMi5TU
	gGB+XhV/5uGlFZ2yG42mA77w6nBviCia5XMtI+fu2Mgwd5bIJud+XD+ppe/FXI+Q
	8P2f2GYMh/xpLQxMfx2mTisWyWeDkxldSLB0+06il8SxxTNH5Ga0QDJigoNXS/jO
	7LFIWzpfv2MQpYc1nZZXlpZejDJx5PElm6Gqw3zOudovs8malVzc9KTKSaFqUfcU
	AdoXLw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyr3bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:44:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c552802e9fso144069985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752273; x=1748357073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QorgnidCWBJg7Vmt5XBSexmPldS7Zeq3ffAJyueefoc=;
        b=vZx/K1Zolte9S6BPq/pfJE5wnPgT9+KP5UMZAkEQkIdHosLqi+oCK2Op6COryuXqiq
         qDgQNRl7cAUGCgJaG7GLlsqEZD+iAr1QGUuX+xN3RAGfA6+N/U6O0ZcuFXn5Oup7qcq0
         HOU6ALKGA2oqswYnNh24QvKnNNf9CT0xKGfnzqiSsJzaQOAMFKZ0vFFsud/FJPhLZSrM
         MTKMdTgIe/Dp8qO/VwxSksC9QvhjrK83L92Us2K13fVcrI30qOvb3NwGLyKuxbO9jrWf
         hVN1xZEQ82O4J1NrceYw215irBajbWS5q5EAoLZxTUfXfySsW0MdrFZ6d/jGOPaVI2QL
         S6zw==
X-Gm-Message-State: AOJu0YzmuUGG588CgF/crYgaRXzbZdUXx6ZU6+USLsypNAqBqVj6MZ2s
	/i5lAxsCtfDWW5qJc5WpmVga/vcPTcMkiGpMOSuKt0yKAQzDt/exme18SdahR3fBjiqrmjUG0Og
	qYHFCq8sQc6mZElO3bsL6AItYsGxHzwRjQoLumxtRxKe06Ep+XgkAQSSN23zVr+v19+I8
X-Gm-Gg: ASbGnctfTHICPuOf64wygXdx4yxHmHvtoULbyCa+mp37PHdn5OvT9f68t3eRxJpXvcd
	3jWZoO159zQ7lHGqB6UGf33i17bDuwm7xsfDDiJmk0TJa9iEp6rEZ+Q8+YHkkEmoEI+6Gs2qMTf
	DS8oK0N5dbnTdinE2xH12+4R3j7xLSuMPHX0AnSbHLm11VsWr6YuoxIiMYJyLwiCf4zR6YtETvE
	KIiOn7ZLLq0aXtEHUWSk/YVPIFhQ4kCVN3N+7NfHbUupnutwCBqJUQT9mKyR6IJtCAEahDwtsP4
	DS5QkFMwBHWxbCpkZvyyVpss8XKuOlC2jg04iDEFa/un16cw1wXnlnitNYjgJGfvUg==
X-Received: by 2002:a05:620a:1b97:b0:7cd:2992:9f43 with SMTP id af79cd13be357-7cd460ae593mr1054835985a.0.1747752272666;
        Tue, 20 May 2025 07:44:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFvcWl585nw0J4PUITOMZ8zCHstBQtqWLtVIW4D6lddZf2iSNRacWBKpVGy4oqfbMBzjINjA==
X-Received: by 2002:a05:620a:1b97:b0:7cd:2992:9f43 with SMTP id af79cd13be357-7cd460ae593mr1054833685a.0.1747752272248;
        Tue, 20 May 2025 07:44:32 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d501f0dsm7352610a12.21.2025.05.20.07.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:44:31 -0700 (PDT)
Message-ID: <8bf46af8-d36c-4cd5-b92e-9b7005d621d6@oss.qualcomm.com>
Date: Tue, 20 May 2025 16:44:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
 <20250429-ddr_stats_-v1-2-4fc818aab7bb@oss.qualcomm.com>
 <c876ae55-a84a-436e-8c11-c0df236c1ea5@oss.qualcomm.com>
 <a14f58ed-fbc7-4074-ada7-3b9e50eb3047@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a14f58ed-fbc7-4074-ada7-3b9e50eb3047@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExOSBTYWx0ZWRfX6/GjxhWj6Jar
 MWMnnAi3dOVyT31IB0rB7yMBhT4g92238x2i5jJk2hd2EGvZ96Qykr/r/TyE5PN0YquAqoFr+L3
 NwNhk1cAR7ML17ph1c/sMytvFi3BAldYEGgOXHe3vseaCTe0RiN5EUEYt2+BJUL+KYZKXCzWPtW
 pnmbVdb0k5NkmJmQRaM0wJXQPfGwfS+B5W1MWp3y1l7NFmwZqxWq6x1QfdqfyTUXUhM7mNNDuH/
 QkcF9lWeuBD1sbIo94RhCq8/9MEd0qNGMUrW3oi4zZRaQVYI9ED7PPWyS6CU6vxaUqmYYjoog31
 kEQnAhWk9trF8+arInI8kSzN10UljAuGE5abXG+IpUxbNEiO9sI1l7x6BbDfruU+/v2H6TuYTFT
 J6tw/gOHbmLH4OH/TwMMbBOiMN6lFgUpxZaW6pz3sUiF7U1TgnrOirgOBuJKpygTcE3dG3jV
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682c9551 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=zmVLOkNBcqytz3L41WAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7hTelVGRfNEvdzMX3opYBKosSUFGgL1j
X-Proofpoint-ORIG-GUID: 7hTelVGRfNEvdzMX3opYBKosSUFGgL1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200119

On 5/20/25 11:55 AM, Maulik Shah (mkshah) wrote:
>  
> 
> On 4/29/2025 4:09 PM, Konrad Dybcio wrote:
>> On 4/29/25 5:52 AM, Maulik Shah wrote:
>>> +	if (qcom_stats_qmp) {
>>> +		/*
>>> +		 * Recent SoCs (SM8450 onwards) do not have duration field
>>> +		 * populated from boot up onwards for both DDR LPM Stats
>>> +		 * and DDR Frequency Stats.
>>> +		 *
>>> +		 * Send QMP message to Always on processor which will
>>> +		 * populate duration field into MSG RAM area.
>>> +		 *
>>> +		 * Sent everytime to read latest data.
>>> +		 */
>>> +		ret = qmp_send(qcom_stats_qmp, "{class: ddr, action: freqsync}");
>>> +		if (ret)
>>> +			seq_printf(s, "Error updating duration field %d\n", ret);
>>
>> let's just return some error, instead of printing "error" successfully
> 
> Should i drop the print and also error, From details given in commit message of [1] 
> which made the qcom_subsystem_sleep_stats_show() function return 0
> in order to run command like below to collect the stats without interspersed errors
> grep ^ /sys/kernel/debug/qcom_stats/*
> 
> The same may break if return error from ddr stats too.

You're trying to print potentially garbage data if this fails

Konrad

