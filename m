Return-Path: <linux-arm-msm+bounces-71065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B19EBB392D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 07:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B39541B26B7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 05:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E3A265298;
	Thu, 28 Aug 2025 05:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X4i9/Qd1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC516625;
	Thu, 28 Aug 2025 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756357999; cv=none; b=c0zF0YiC//4NQ8NbvA1G7PjjwegB5RI+CVWlOMxgGyBq01eF/WEmTOxZeGt7ZnQBDRCSUKQw+Pf4erLWy/y71qfWHr1TyXFdr9hv40YoK865Dpdsw+5y/wENNXUxQdzwo9tiYfPUkAMJoEkFrEpGPYPAe+bxBcu033Bz9MJA51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756357999; c=relaxed/simple;
	bh=RdH2Rux1sOiizM3vNvepmnn6PqPqGfisycYQFxLQlkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rrCHeLjyaT6ktE0GguvBpNdhJ3UqLE8IeoZDMeKNNfzLf7mDffQdxqgSrCeYk/HvALVMY+BI17A2xdVxXVmofsgFi8fvWyVIrGYWtfk7zerla3GCtPe2cVuosoVFzlMAiBkDO7gLQ14AypD+VEUsrCX+s/6q6RoUJiTAJ9D/AKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X4i9/Qd1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGawaU023126;
	Thu, 28 Aug 2025 05:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qvTagzu8vimTKgFWMFQ837YKk2zZ64eNnHxfuURlbo=; b=X4i9/Qd1i/mMhsQn
	R4BizDokdLQsMvboSGz/6s7kLONDca1t0AXxmVSZQxZ0yF6ZE6UDixdTmvFopMD4
	aDdSa3PdLo1pduejo2xlPLQh8zUBYIpeZJ8QqQxoQugnLvIF1duDoHG39dpQOWky
	PgSjfrSs9CgUF/rWbNdF7rWBhn5K1sZ0w822ft0fUDx5vOPLQ4R17E9cjqwfF7v+
	HjIjaoozag5w4WZzDG3yhNgfD6McY36U19+0KIXWPf4S1w89jBQZstNZYfdVMpz9
	/6cCA5hi1qcklEzyOjPdPNBE4DvJbsKQhM0l7gCd9dN8Ze1g7eercGiJcJjlZSAY
	CKG7aw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5prqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 05:13:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57S5DBnO011303
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 05:13:11 GMT
Received: from [10.216.30.145] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 27 Aug
 2025 22:13:04 -0700
Message-ID: <8ac9c98a-5184-4b5a-93d6-a30ba6f20696@quicinc.com>
Date: Thu, 28 Aug 2025 10:43:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] serial: qcom-geni: Enable PM runtime for serial
 driver
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <psodagud@quicinc.com>, <djaggi@quicinc.com>,
        <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
        <quic_arandive@quicinc.com>, <quic_cchiluve@quicinc.com>,
        <quic_shazhuss@quicinc.com>, Jiri Slaby
	<jirislaby@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <bryan.odonoghue@linaro.org>, <neil.armstrong@linaro.org>,
        <srini@kernel.org>
References: <20250721174532.14022-1-quic_ptalari@quicinc.com>
 <20250721174532.14022-8-quic_ptalari@quicinc.com>
 <DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org>
 <577d05d4-789b-4556-a2d2-d0ad15b2c213@quicinc.com>
 <dcad137d-8ac9-4a0b-9b64-de799536fd32@kernel.org>
 <DCC8WLEKNS8W.9GAJHQGYPZIY@linaro.org>
 <8689a8b4-75cb-4f01-ad6c-0a8367851257@kernel.org>
 <DCC9B5C7SSU2.GRI1UY0VUDHF@linaro.org>
 <890ede8a-c049-4332-8f62-5dce2fa0f77b@kernel.org>
 <5ae730f4-5337-49f8-8bec-8605a2495f37@quicinc.com>
 <DCCMFVC0DW1I.GXZVG2BQEFX7@linaro.org>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <DCCMFVC0DW1I.GXZVG2BQEFX7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/dxLkFrP7fII
 DgqFkFV0w6xXaiZb9Jz7nqxN7JdWdTkgr7dTcB/4AqHZ9QHVQmFIbTqrZokWcFZmrybPxD/rVpx
 P9I6HfwQupARS3HzzoHnMSOFAoM5Q5qmR0zZTEZ1n3e0893E3fI8abnunDNerR9d+frugpj/Ntk
 LhrHT/x7s0ueNs6d5aq5Wmbcdvst4kE0Yvjo9kjwUr4NBoS5rbr9xnVzWJABIW5MxfT1ULygqXT
 sNZBLMQMYSiF3FjF8o7uZTOQsuSNKSjobpMJiA+UbUDH6ONJZkQCcqRi2PiRPVDJ1no7WUhY/vJ
 5RiKP/KA2ZWAbqWPpdCXn5vbIiM7rofS0KhrMGZgK3uNbXrJkdUW8RZJ80yW5WQ3w55fdl48rkK
 TCIcvV35
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68afe568 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=eSKK9EDNxi6QHftERMcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: SPZXV7EyfVYtYqfo8aoomU8Vm0KEdJH7
X-Proofpoint-ORIG-GUID: SPZXV7EyfVYtYqfo8aoomU8Vm0KEdJH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

HI Alexey,

On 8/27/2025 1:24 AM, Alexey Klimov wrote:
> On Tue Aug 26, 2025 at 11:29 AM BST, Praveen Talari wrote:
>> Hi Alexey/Krzysztof,
>>
>>
>> On 8/26/2025 3:36 PM, Krzysztof Kozlowski wrote:
>>> On 26/08/2025 11:37, Alexey Klimov wrote:
>>>> On Tue Aug 26, 2025 at 10:21 AM BST, Krzysztof Kozlowski wrote:
>>>>> On 26/08/2025 11:18, Alexey Klimov wrote:
>>>>>>>> May i know what is testcase which you are running on target?
>>>>>>>
>>>>>>> Boot the board?
>>>>>>>
>>>>>>>> what is target?
>>>>>>>
>>>>>>> It is written in original report. Did you even read it?
>>>>>>>
>>>>>>>> Which usecase is this issue occurring in?
>>>>>>>
>>>>>>> Boot?
>>>>>>
>>>>>> FWIW, what said above by Krzysztof is correct, there is no usecase, just booting the board.
>>>>>>
>>>>> 12 days and nothing improved, right? if this was not dropped now,
>>>>> Alexey, can you send a revert? Author clearly approches stability with a
>>>>> very relaxed way and is just happy that patch was thrown over the wall
>>>>> and job is done.
>>>>>
>>>>>
>>>>> If you do not want to send revert, let me know, I will do it.
>>>>
>>>> I am okay with sending revert, just trying to see if there is any interest
>>>> in fixing this.
>>>
>>> Any interest should have happened after 1 day of reporting linux-next
>>> breakage. It has been like what? 12 days?
>>>
>>> That's typical throw the patch over the wall. Revert.
>>
>> Really sorry for the delay.
>>
>> I forgot to mention earlier that I’ve been actively investigating this
>> issue across different platform SoCs. I was able to reproduce the
>> problem on the SC7280.
>>
>> Here’s a summary of the observed behavior:
>>
>> The issue appears to originate from the qcom_geni_serial driver during
>> device runtime resume. It results in a blocked IRQ thread, which in turn
>> causes system instability.
>>
>> The call trace suggests a deadlock scenario where the IRQ
>> thread—responsible for handling wake-up events—becomes unresponsive
>> while interacting with the pinctrl subsystem.
>>
>> Specifically, the msm_pinmux_set_mux function attempts to invoke
>> disable_irq, which is problematic when called from an IRQ thread context.
>> Since the IRQ itself is a wake-up source, this leads to contention or a
>> self-deadlock situation.
>>
>> I have verified below diff and about to post it
> 
> Was the original patch, that introduced the regression, also created by AI tools?
> Just trying to understand how we ended up with untested commit in -master.
> 
> Did you test the change below on real hardware?

Yes, i have tested on SA7280 SOC.

Thanks,
Praveen Talari
> 
> 
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c
>> b/drivers/tty/serial/qcom_geni_serial.c
>> index c9c52c52a98d..cb3b4febd8c2 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -1848,16 +1848,36 @@ static int __maybe_unused
>> qcom_geni_serial_runtime_suspend(struct device *dev)
>>    {
>>           struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>>           struct uart_port *uport = &port->uport;
>> +       int ret;
>> +
>> +       ret = geni_serial_resources_off(uport);
>> +       if(ret) {
>> +               if (device_may_wakeup(dev))
>> +                       disable_irq_wake(port->wakeup_irq);
>> +       }
>>
>> -       return geni_serial_resources_off(uport);
>> +       if (device_may_wakeup(dev))
>> +               enable_irq_wake(port->wakeup_irq);
>> +
>> +       return ret;
>>    }
>>
>>    static int __maybe_unused qcom_geni_serial_runtime_resume(struct
>> device *dev)
>>    {
>>           struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>>           struct uart_port *uport = &port->uport;
>> +       int ret;
>> +
>> +       if (device_may_wakeup(dev))
>> +               disable_irq_wake(port->wakeup_irq);
>>
>> -       return geni_serial_resources_on(uport);
>> +       ret = geni_serial_resources_on(uport);
>> +       if(ret) {
>> +               if (device_may_wakeup(dev))
>> +                       enable_irq_wake(port->wakeup_irq);
>> +       }
>> +
>> +       return ret;
>>    }
> 
> Best regards,
> Alexey
> 

