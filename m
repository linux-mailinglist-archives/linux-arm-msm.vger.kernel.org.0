Return-Path: <linux-arm-msm+bounces-60251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE0CACE1F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 18:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C3123A89A7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 16:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A361A7045;
	Wed,  4 Jun 2025 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ouP5hwal"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458D64C7C;
	Wed,  4 Jun 2025 16:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749053467; cv=none; b=GihANo2hn2YaJEnbZy3cEYNGU+Bxw2ruduRtHQemww57bwth9IporzW9eUGTbRxwJIJNVVHFGx/0B2bay5yx8YFrjjoyvR1qKhysH1tEW0l1By4KPg7y4ruVPdtgjUs3jtyQtlCpH+cqopmZGi5U7DQjW75lZBBxGvnT6c0KIXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749053467; c=relaxed/simple;
	bh=/AQiXiMnCVw9MLZbzb+2ZX0KxPHmK4p4CYe4vWhs9aM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=Hf/HVL8EaXaTAKHpIcDurY2a7k18akAVjLh4aOtquc6KcjonX2KO6uNP8vcERrIdBJoJYAb1uF2piCkh5bausbJ5zCW9MV7dldz6eU5kgmBvlHaNauA38qIv2UBdUlRz4rHkRVNtLaMz21JJ1HEeOgpxXxXBA1yDrwN9rgiKVMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ouP5hwal; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5547vaL1013506;
	Wed, 4 Jun 2025 16:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FqqTBE/vlzD6SjR1Tr0okwBoLEJJCgNOcIrkG5NC+6Q=; b=ouP5hwalUwmShgQL
	aLCGOQ07SaO2eHJCnGvX9kBMKv9wzZAw//Lf3a3ibDALsO791dqBWoB0sR8Nnbfu
	vq6sJH4ke+vs4mX+zBdKfkpz0O2ZX/YfDbCvtmdXJ459idzcOiqaiGKyzjVBOZCN
	3PmI7pqBpMXCfxaPE1H+rubjOsyQaLSXtAEZc0GqCLk8jQPX0b6c3K8gOuAbU4oK
	w9nB+vAeMEXZqZFHsGhr9P8HEGw4fC2nkg6Qll5jiQIOqG23/VqSmOkdM5L59QcX
	z7Cf/PiphbaN7cPW0o0MFJ5ExFJ9+ZElZf4JEr/XosZQPn0d4gEbjaONDIJL8/yr
	rqBcYA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8npn5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 16:10:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 554GAwOD013879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jun 2025 16:10:58 GMT
Received: from [10.216.5.91] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Jun 2025
 09:10:52 -0700
Message-ID: <ad91876e-508c-4f98-9b7c-c2e4a05a8276@quicinc.com>
Date: Wed, 4 Jun 2025 21:40:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] serial: qcom-geni: move resource control logic to
 separate functions
From: Praveen Talari <quic_ptalari@quicinc.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_mnaresh@quicinc.com>, <quic_shazhuss@quicinc.com>
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <vTOsjvsB7oSpu2Oe8i1ufoz5C2Hy3EtfDnfBsLag2p-s63J0BLdqbLn44Hds17WR12JGfo7sd52k7uHaXlTTeQ==@protonmail.internalid>
 <20250506180232.1299-6-quic_ptalari@quicinc.com>
 <f912588b-fb54-4257-a4d8-db58e93b8378@linaro.org>
 <y41ikVJ5uSSaGZHmqsvTm9akz3EUUT7X6dTPrfSuIYqGmMdlEfPRWqPA630jmsEzwC-6JSgYRPobg4e933PgxA==@protonmail.internalid>
 <afe41159-00e4-45d1-857f-0a68f6fc6c8e@linaro.org>
 <6b7ca51a-241a-49fc-8aac-da5af96b5e10@linaro.org>
 <0daf396a-29af-458b-a7ba-3b711b22cde9@quicinc.com>
Content-Language: en-US
In-Reply-To: <0daf396a-29af-458b-a7ba-3b711b22cde9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iZLz6X9zFbRBvzRXn8o7vX33aAgdeuC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEyMyBTYWx0ZWRfX1gl2JQkaiwHK
 xTnhdxgnOlrG009kkd2kISNeAGYHA9FovgLLk69vHlliAi1iHY6jMiG8Q9vuYpP+jVN0YQtOgbH
 XGRRmSdJgA4/7JvoTm3IHk+lgFUwBmHOPXKKeJwfKLh8vGeaWyfDo7n1X110khkDrEs6g8oRXNW
 22fGbc4xSbcM3PqyAZcXMbCVhZ8i7ST28XSel40ZXm3AZ0T+CLfEsSVBcHw6H3IVrHVCuS+TtVf
 UujNcl+aplqrKmVaLxvs/PJKdiG1QQKSNoBRfFU6GnQzNLGa8Egil+D7ZPuOyt6vaUk+WZw4WyZ
 LeageuC5cTkzJqL7Lt8GiMt+opgxLDpH+TaeaytznCkBnwbAOA8E5dy7eSITdj4/fEZ82/EjKKZ
 PHv9TKryUDnyXy8hjjad4oq1a1ZsW7enHbh4N/KJ5T461FQBamfothPqX34yK0doP3yIU6Nj
X-Proofpoint-ORIG-GUID: iZLz6X9zFbRBvzRXn8o7vX33aAgdeuC5
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=68407013 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8
 a=AxOswNciry8E2xLaaYYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040123

Hi Bryan

On 6/4/2025 7:39 PM, Praveen Talari wrote:
> Hi Bryan
> 
> On 6/3/2025 8:16 PM, Bryan O'Donoghue wrote:
>> On 03/06/2025 15:29, Bryan O'Donoghue wrote:
>>> On 03/06/2025 15:28, Bryan O'Donoghue wrote:
>>>>> 2.17.1
>>>>>
>>>>>
>>>> Assuming you address my points.
>>>
>>> [sic]
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>
>> Oh please fix this in the next version
> can i fix this in separate patch since i haven't touch these two lines
Sorry bit confused.
Will fix this in the same patch.

Thanks,
Praveen Talari
> or
> fix within same patch?
> 
> Thanks,
> Praveen Talari
>>
>> checkpatch.pl --strict mypatch.patch
>>
>> CHECK: Alignment should match open parenthesis
>> #92: FILE: drivers/tty/serial/qcom_geni_serial.c:1675:
>> +    else if (new_state == UART_PM_STATE_OFF &&
>> +            old_state == UART_PM_STATE_ON)
>>
>> total: 0 errors, 0 warnings, 1 checks, 71 lines checked
>>
>> NOTE: For some of the reported defects, checkpatch may be able to
>>        mechanically convert to the typical style using --fix or 
>> --fix-inplace.
>>
>> 0005-serial-qcom-geni-move-resource-control-logic-to-sepa.patch has 
>> style problems, please review.
>>
>> ---
>> bod

