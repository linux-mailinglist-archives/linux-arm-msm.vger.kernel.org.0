Return-Path: <linux-arm-msm+bounces-57341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6997AB0934
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 06:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E1184A6026
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 04:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE4E22DA0A;
	Fri,  9 May 2025 04:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OjPCllhL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462A345038;
	Fri,  9 May 2025 04:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746765161; cv=none; b=YfEV1p3BKp4XTjMWWmUUyRy7RSEGwrWgwxWMw1zlNq6tFHeHLtYJ5QClAJ7GRBhCChZQRW4BmedDmc5BHKhwnTQez4Wc5EJadEz2o9LU7bDj8cN2gS+Cxww91NAcsjZ2Rlr1tZfw6btXzrTP+oq6GDlkI+ZQPEkU54g9RaQmtWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746765161; c=relaxed/simple;
	bh=6SpZpOdCh91riLUSXIvedwmiClTz32ulFuq5+lvGe2g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=F7776exPD7BBTe06IVO/t/eEd806vXFfu4AMAgYgkirKG7H5wCo6CKQFf5tIhATDUDRsI3WvIiBQyBS/m26H48RQ6xzcNe3c580W1MhUkZOvG98RkqVlWT347guxND1UwNEutLjBIli2cPxRgsg3iJKQXKMOi3XV5MadnC8b/aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OjPCllhL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492BdeL031131;
	Fri, 9 May 2025 04:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ESj9WZRGA6xPfWeT7exPlrQggSBgPisGdOU+OlSeWE=; b=OjPCllhL4HIQBmIV
	b+7cjc2tDV98YDf9MO1z1XhyZdZPOHVnlukrZSvqhbbn9trlpKhRjfgCIWyXxMDJ
	EGM9XwLw3w5aei0v7dTukEMU0khdgphn/5KSjmFhO7Ktu4r0UMSmtZmxiTqGJB/5
	hFy+v5lsw7HAXfa97SFC6dxFIo2yq3Znrw/buBCFxJKLFF5YVOdeMFF0EXoDEaIo
	lZFNNFmIEs04+6ESVdFqhLzO6f3xKYoJ/10p4CzJz8nZXBS9XzM9D9/1nhof2P7e
	AbnP26bV1m6vf5zyPKJ6J4c4ItHKlf84p+/ctgU2HbR4rANKB/BrSoslYkbHHZx/
	5D7jfA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgkc1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 04:32:28 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5494WRR2032074
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 04:32:27 GMT
Received: from [10.216.10.140] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 21:32:21 -0700
Message-ID: <4b2c24e4-d515-481d-a00b-d50ae57304dd@quicinc.com>
Date: Fri, 9 May 2025 10:02:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] dt-bindings: serial: describe SA8255p
From: Praveen Talari <quic_ptalari@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
        <quic_mnaresh@quicinc.com>, <quic_shazhuss@quicinc.com>,
        Nikunj Kela
	<quic_nkela@quicinc.com>
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <20250506180232.1299-2-quic_ptalari@quicinc.com>
 <35659475-862a-4678-a2a5-173c2254ae60@kernel.org>
 <2f3e608b-5536-4c6d-b7ca-c8cf4c9d0b1b@quicinc.com>
Content-Language: en-US
In-Reply-To: <2f3e608b-5536-4c6d-b7ca-c8cf4c9d0b1b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681d855c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=towazdODhIRxSDStvoQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA0MSBTYWx0ZWRfX09bNplHkb4eF
 UB5gM+xVH/gyLxFgdCpfV/VGCZif4z3gDbI4MJw6ZU5a2tkYZCC3Bv3EcK1kzIK/nK9Z0RvQJYZ
 hWw1VgWk19vaZkCNYDMEoE8GwSZCfvNWgwwYbTrvBG/hPixO0Wn5NmOQExkhX6PZVQhzwWkCull
 8HTQg6nehmd2sBATh0tLPnE9GCGeaJ1Xz+z8PbH/91G+mRq6yiC/MEWZuUaWcvSnGJLHkJq3fOE
 3D6NzkMBxY1vo9DgGaDUHYz8T7X+jeQ00q7kwG0R9dgKjZ8gyOXINkWzt1UP1pKllsQXL3TYo2b
 Y3zO2uhyfNGFw1aCihKFGxejB4XF7SsuYiY645v8C0EHOWTNK+A3bNb2h2MHLWavDV544jUfjq0
 +SB7x4PDSPzCDii9iapvtzduTwaGtiZhAm4nnMR4qjFV1XUs16rGRNdyJvNylmHVQFPE17kG
X-Proofpoint-GUID: UwkzuPyf1nnIO53aVq5Bulbbr-Yu-viO
X-Proofpoint-ORIG-GUID: UwkzuPyf1nnIO53aVq5Bulbbr-Yu-viO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_01,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=926 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090041

Hi Krzysztof,

Thank for you review and valuable inputs.

On 5/8/2025 11:15 AM, Praveen Talari wrote:
> Hi Krzysztof
>
> Thank you for your patience. I consider your inputs as valuable learning.
>
> On 5/6/2025 11:53 PM, Krzysztof Kozlowski wrote:
>> On 06/05/2025 20:02, Praveen Talari wrote:
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,sa8255p-geni-uart
>>> +      - qcom,sa8255p-geni-debug-uart
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    minItems: 1
>> Nothing changed here, this should be dropped based on previous 
>> discussion.
>>
>> You sent this v5 on 8:02 PM of my time. *THEN* you responded to my
>> comment at v4 at 8:05 PM. That's the way to waste everyone's time.
>>
>> I do not understand why interrupt is optional for a new, complete device
>> description.

To put it simply, because we are using the RX GPIO line as wake up IRQ 
and not all SE related pins are mapped in the PDC,

there is no specific wake-up pin to define. Therefore, the wake-up IRQ 
should be considered optional.

Thanks,

Praveen

>
> On this platform, there is no use case of waking up UART, so we 
> consider the  wake up IRQ as optional.
>
> Thanks,
>
> Praveen
>
>>
>> Best regards,
>> Krzysztof

