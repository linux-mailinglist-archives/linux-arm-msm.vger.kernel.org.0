Return-Path: <linux-arm-msm+bounces-61880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AC3AE179F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 11:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68C141BC17ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 09:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A010B280A5A;
	Fri, 20 Jun 2025 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F8FJpL6n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EA72459E7;
	Fri, 20 Jun 2025 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412070; cv=none; b=NlJn1LjzVd9m8fwH9XkxlY5hSJHQXG88ydnZyZhNekNJvN4y3v6K4A3ReRBTbNQVKKS+AgWWmaWJ/zbIVHqnWVKWiK31205OGVOm1cQkXSDeA5Vj1lnWOBbwSKdh2pNwdpJhm7PLwzsCCVZtf3IlB94nToclIR1djZEuFKkPISc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412070; c=relaxed/simple;
	bh=VxZB0Aym2X52UT54JKtbfbkmfojZfffUJnlpJa5q2tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QU4pOATZdfKtBHP1KOavkcjJ8+Xg8N8SNOv2lKEM3FYOfD4Rxv1DaYPapCDTk9mwXdFzA2dF7M9l1+rdjFcnsbTWuq6Suc9shy/JPX57U3gxvSZNKabvC7wLbriYdaAPYdfzYwyCjWjjJxkJicwHIVQaEFgIfn8YJV0Vpauec3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F8FJpL6n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K24Srk005587;
	Fri, 20 Jun 2025 09:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U3IWtBPiQSO34q7LwoYxxHypyfbp5vg90NPA6GcHv9g=; b=F8FJpL6nnEViEdob
	jRbzmbRFzOgwo3eKoKihGmMry9+2IWnLBIQ0rDtbi9BE4OzNaxf2r0VFAmdkKgrP
	to4WfZSh+HlnP9ZnErgUvVlXlTD8UslJpnyUfUsQwziJLjpsyKIj0TBqPqUVGnbk
	6UiJ5vFnQ9Xtaq95kyz7c7CtphjzlkAslSFX7Z0dXbzEMVmK+k4ZfG8FD8pwi+Bq
	d4LxZsyoQ+/yH/Yhx0Tb482AuQ4pzgaHmgM4JkiJMs/lJp4m82klVHhQt22Bkcmu
	ObkZisqX7eEipDizm4GwjRk3CCmJhk+Fhg+p85G01qVUkySey/8dxjjmlR37QWDR
	0Ue8Ww==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c0rvp0f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 09:34:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55K9YMEr015751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 09:34:22 GMT
Received: from [10.216.41.11] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Jun
 2025 02:34:17 -0700
Message-ID: <ed381bb7-dfc8-4a27-b044-11deb7e75a81@quicinc.com>
Date: Fri, 20 Jun 2025 15:04:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] serial: qcom-geni: Enable PM runtime for serial
 driver
To: Bjorn Andersson <andersson@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <psodagud@quicinc.com>, <djaggi@quicinc.com>,
        <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
        <quic_arandive@quicinc.com>, <quic_mnaresh@quicinc.com>,
        <quic_shazhuss@quicinc.com>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-8-quic_ptalari@quicinc.com>
 <d6cr4elhrbh27lmlcv5xzuel75uvsgi7klxjkevm7vg4jcbawe@5ojgetrxkag5>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <d6cr4elhrbh27lmlcv5xzuel75uvsgi7klxjkevm7vg4jcbawe@5ojgetrxkag5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA2OSBTYWx0ZWRfXyHCscPKUiSyd
 Qv7gjkjNtbApRicsB1UayeErXG4dl1LozsNm+WmD6m9igxJlWcFu0LoWsGYifZ/CU/x3LV/uxHS
 wjK+kAZ7P3X5AyPOMHsqWUQOKrDoG3TWROStHjJiv1cd/9MfP0CW7rkQ636OUKRMaw0H8y6lNUJ
 iemGhbs7IVa7k6xZQWRD/vaJ2UH5kgC/BaKMVco2PmRyklbVqvcbHUAL39OKtadNQyli/w0u149
 YpOkQ7vng9CbRfnCF5LoJAh24Fc5lTA40eJ3lfb+ygxteRnjyVQiAHb1OtlQkbQ2KDjI/oBlFyA
 3083JqyRgxVRMrvZMAa0RJulhaFqydnEMP9t+BsZBiCvtCYk3M9Qeec4XBRcv8SffJkVjzVxz/F
 tOcfFt9ue043spqUVYhh2IMKdt2u41o664apewDdiLd/4rLNVXWJ+foTq2YvU+tMPV2bBf11
X-Proofpoint-GUID: 2L09BFxLflxg_Xk4-rRBDz7D8UHukaQ4
X-Authority-Analysis: v=2.4 cv=btJMBFai c=1 sm=1 tr=0 ts=68552b20 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=qX-yKedHe2mDKLH7AMEA:9 a=QEXdDO2ut3YA:10
 a=-_B0kFfA75AA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2L09BFxLflxg_Xk4-rRBDz7D8UHukaQ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200069

Hi Bjorn,

Thank you for review.

On 6/17/2025 9:23 PM, Bjorn Andersson wrote:
> On Fri, Jun 06, 2025 at 10:51:13PM +0530, Praveen Talari wrote:
>> Add Power Management (PM) runtime support to Qualcomm GENI
>> serial driver.
>>
> 
> Doesn't this have impact on the behavior outside of your
> project? Or is the transition from qcom_geni_serial_pm() to explicit
> RPM merely moving code around?
There is no impact on functionality and behavior with this change.

The transition is purely refactor.

Using PM runtime APIs such as
pm_runtime_resume_and_get() and pm_runtime_put_sync() to manage resource 
both locally and firmware.

> 
> Seems like this deserves to not be hidden in a middle of a patch series.
This depends on refactored patches.
> 
>> Introduce necessary callbacks and updates to ensure seamless
>> transitions between power states, enhancing overall power
>> efficiency.
>>
> 
> This commit message fails to state why we need runtime PM support in the
> driver.
Sure, will update commit text.
> 
> Also, start your commit message with a problem description, per
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
>> ---
>> v5 -> v6
>> - added reviewed-by tag in commit
>> - added __maybe_unused to PM callback functions to avoid
>>    warnings of defined but not used
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 33 +++++++++++++++++++++++----
>>   1 file changed, 29 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index b6fa7dc9b1fb..3691340ce7e8 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -1686,10 +1686,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>>   		old_state = UART_PM_STATE_OFF;
>>   
>>   	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
>> -		geni_serial_resources_on(uport);
>> +		pm_runtime_resume_and_get(uport->dev);
>>   	else if (new_state == UART_PM_STATE_OFF &&
>>   		 old_state == UART_PM_STATE_ON)
>> -		geni_serial_resources_off(uport);
>> +		pm_runtime_put_sync(uport->dev);
>>   
>>   }
>>   
>> @@ -1827,9 +1827,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   		return ret;
>>   	}
>>   
>> +	pm_runtime_enable(port->se.dev);
> 
> Any reason not to use devm_pm_runtime_enable() and avoid the
> two pm_runtime_disable() below?

I agree, will update in next patch-set.
> 
> Regards,
> Bjorn
> 
>> +
>>   	ret = uart_add_one_port(drv, uport);
>>   	if (ret)
>> -		return ret;
>> +		goto error;
>>   
>>   	if (port->wakeup_irq > 0) {
>>   		device_init_wakeup(&pdev->dev, true);
>> @@ -1839,11 +1841,15 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   			device_init_wakeup(&pdev->dev, false);
>>   			ida_free(&port_ida, uport->line);
>>   			uart_remove_one_port(drv, uport);
>> -			return ret;
>> +			goto error;
>>   		}
>>   	}
>>   
>>   	return 0;
>> +
>> +error:
>> +	pm_runtime_disable(port->se.dev);
>> +	return ret;
>>   }
>>   
>>   static void qcom_geni_serial_remove(struct platform_device *pdev)
>> @@ -1855,9 +1861,26 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
>>   	dev_pm_clear_wake_irq(&pdev->dev);
>>   	device_init_wakeup(&pdev->dev, false);
>>   	ida_free(&port_ida, uport->line);
>> +	pm_runtime_disable(port->se.dev);
>>   	uart_remove_one_port(drv, &port->uport);
>>   }
>>   
>> +static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
>> +{
>> +	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>> +	struct uart_port *uport = &port->uport;
>> +
>> +	return geni_serial_resources_off(uport);
>> +}
>> +
>> +static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
>> +{
>> +	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>> +	struct uart_port *uport = &port->uport;
>> +
>> +	return geni_serial_resources_on(uport);
>> +}
>> +
>>   static int qcom_geni_serial_suspend(struct device *dev)
>>   {
>>   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>> @@ -1901,6 +1924,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
>>   };
>>   
>>   static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
>> +			   qcom_geni_serial_runtime_resume, NULL)
>>   	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
>>   };
>>   
>> -- 
>> 2.17.1
>>

