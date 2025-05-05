Return-Path: <linux-arm-msm+bounces-56735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99690AA8B1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 04:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7E803B0989
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 02:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A74187332;
	Mon,  5 May 2025 02:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tz+Nte0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C92A8C0B;
	Mon,  5 May 2025 02:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746412248; cv=none; b=ldQdZ4gslzI+niIzYm3oPe6lGkgz3MgU+rtwnCoh/KxAQLLZZRvOwXkMmRoB6ZZDRqA+CncDY7kocmh0hSCBaUjVTDY5TgGpzEC1ySw5w5XLLOlaVXEhiuBsVkDrOpBP5WT0x6zjfMFKiLVIhYeS2eQB8sRIWFJsKPx3cCAWUTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746412248; c=relaxed/simple;
	bh=C8B57uqu/wQVB0RnWaFV6CXM92jLHXTZsPoqi3LSeeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=R8P0/LnaUN7FW5Wj5pDZmDCwuHykmSYLsf9wT7hgKc1kClgLrkeWL1SMBxnAm9DTJYmu/VFYqlV7EQUUtBWtM0fxVzDvnhq5+ZI12EnOSTbj6PS5awyTAXSJNHDxo5TyHw0V6et6WF3Kwmc8f3i/CB33fwA/EXM4gS5C/rDy/UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tz+Nte0g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NCGMZ017933;
	Mon, 5 May 2025 02:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nr344m6GvzvItLmCFYIihaGaoAf8ur+ME6vEubxLl7U=; b=Tz+Nte0gTHsrO4Ek
	TsXumT4OnEECCK5GaTxVcxnLb33tvFV7iFwyKVs9QYbBmnMZYE4WrvNTS5SUNdRB
	BsmvElJAmjA0Gp2RMj+2Tphr75WK635YawRK7dQiBohGCmqWaqPl/kdW3uaR0BOQ
	duSC4stLOYwLAVYy+HGr2w2nK+xoqvD1EVH0yDJBnzzSPcq9WeDpBTusHweTBslp
	HJnGin/znaTqsy/bWlDt4PvH+cskEzAKNcmFVPYT+jv//LUo622rwMM0uDH6TWFl
	cC3bsy4WcdgBVPEO+ie9jtmeBYLY1kqc0BlwWlsS2tuEF6Xknk1BLiUj0zJev7c8
	md3Fyg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg2t66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 02:30:41 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5452UeCU022979
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 May 2025 02:30:40 GMT
Received: from [10.216.4.22] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 4 May 2025
 19:30:34 -0700
Message-ID: <6f97510c-eb6c-4f3b-b219-aa8d895b060b@quicinc.com>
Date: Mon, 5 May 2025 08:00:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] dt-bindings: serial: describe SA8255p
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <psodagud@quicinc.com>, <djaggi@quicinc.com>,
        <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
        <quic_arandive@quicinc.com>, <quic_mnaresh@quicinc.com>,
        <quic_shazhuss@quicinc.com>, Nikunj Kela
	<quic_nkela@quicinc.com>
References: <20250502171417.28856-1-quic_ptalari@quicinc.com>
 <20250502171417.28856-2-quic_ptalari@quicinc.com>
 <20250504-hilarious-ultra-grebe-d67e7d@kuoka>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <20250504-hilarious-ultra-grebe-d67e7d@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DaLww4MffgoS0kUDKdeDQVmWzSk5LkH5
X-Proofpoint-ORIG-GUID: DaLww4MffgoS0kUDKdeDQVmWzSk5LkH5
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=681822d1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=DWH0VXsQTH7N4GD8PysA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAyMyBTYWx0ZWRfXxRnVZ2ioaPqC
 AZrm7ulqnjzK4HTR786eb+nC6PGorFhQlz1Il9ienZwHdyVKG/aORqc4T+NWvvd/vfEXbE8EezT
 Ta0CcmKr1Eko814L2InYhhJyO7G7olmJnCykEXQ8Y9EpPK2zogdaLEvDQUM01p8XN0cytqxwteF
 Ri/SOcMfCzlChjNMIrTTTRb1Uu8CVoLHOxDV8ocEZw6SCBgeiCXlVSlRnV+YZMvxdIPKTzHFJSX
 ZlFU0Vtw+8I5HKElScIu1s+frM+q1kBjx127ohfQoenh/WLp6pt5Fg0jHj/qR8+uBcjuxa8OEiL
 QwT+6Z3E3UBbp+tsY62TwjlrddCJUodUyrn4l6jZB4XxStZ0GlgkAK176X2o2jaLuHd39j4iHu8
 bBbHoZ3paSrwo75XSRprnHxFMZRPuKlYmRJbXyQTN+YRDbhQ7x+/bt6Ic/Lqak6OTOEPmvYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=986 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050023

Hi Krzysztof

On 5/4/2025 10:39 PM, Krzysztof Kozlowski wrote:
> On Fri, May 02, 2025 at 10:44:10PM GMT, Praveen Talari wrote:
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - power-domains
>> +  - power-domain-names
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    serial@990000 {
>> +        compatible = "qcom,sa8255p-geni-uart";
>> +        reg = <0x990000 0x4000>;
>> +        interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
> Why isn't here wakeup interrupt? Commit msg also does not help me to
> understand why number of interrupts varies.

Currently we are not using wake-irq because it is optional for our 
current implementation.

this irq configuration is same as sa87750.dtsi.


Thanks,

Praveen talari

>
> Best regards,
> Krzysztof
>

