Return-Path: <linux-arm-msm+bounces-63033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 176F6AED3B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 07:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 267D01890C58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 05:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D311BD01F;
	Mon, 30 Jun 2025 05:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q+DX3LUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0271A2381;
	Mon, 30 Jun 2025 05:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751260239; cv=none; b=Pcpzj8XvXCMSaQbOH80C162e4i0BCPC/YWfaeLs9gO+o1oeU0Z6otcy2JIf/r0wIgq755K9kiaKiR323jWvPogyPjfZqNgvpcsuOoJE0gBUW88UmoxHbCTUUukpNkcPewoshy7rjD6YNmGYsAbgYduvj48KqsNtc7sFVfW+OUhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751260239; c=relaxed/simple;
	bh=03LVU3iRDlp/h8aF9oh0N61vheEeVZHmrnRq56uMW4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TEdSAXEvuzbt7O4MZqkOfwKNEPzw5mUE2V9MiwEHw2/qtHI3qTLOZGn1vLbRO8gNPRFKdwbjWYxxY6LyVPcNTIcRiwvofotV84wwSvvC5jD752roRj8ingo0ETStILZAlRSSAAnBNM+EKZiHtohYwnldfm8UBFipPx10ZJNuv6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q+DX3LUq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TI14Nb015787;
	Mon, 30 Jun 2025 05:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e9W9FZaX37j7VDoPKwabQJxIJyn/jc+/pk01y7hNdLM=; b=Q+DX3LUqsaAoPLts
	PaUPTbg2y/Gr63H5prFUvlPVzSc8hxGG7WFi2chkw5W6IlO6H8boV2q8ENeDwqNC
	VO/dmlbowrYERAdBQaiHX4bj9qKhL05cTJtGEcbSeQGjC07S2gDBUH5nVyPu+ZFG
	xq/xI44Gqy32j8afGetG+Yoh6cS9YVkhuSxtVnoQRpWeraJwPMSAMfl/5JV3XCY6
	PVtRGdDsCl5CFEZca+RsIHRcOY3B874M+JgCFIfo1SR+PPOm3Ol78+X1ahR2/fX9
	TlO3fB61zvxHgVRdqd+NQ3TNJbuVAjnL+pr2XPe+Ri4CGTkBR2pS85qwQc30eYsT
	e36HEQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95huc4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 05:10:34 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55U5AXYS004650
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 05:10:33 GMT
Received: from [10.218.32.171] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 29 Jun
 2025 22:10:28 -0700
Message-ID: <f87807c9-5249-4d97-ab89-898b7d8d260d@quicinc.com>
Date: Mon, 30 Jun 2025 10:40:25 +0530
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA0MSBTYWx0ZWRfXxxIA8rsy7otH
 kzKgj/CPCwTuP3lQh1Z1tAb4CrKWtmkQe/8O+HqbdC8GjCaROwL3wry1Qe/TXYVx/8hlrhm2U0V
 4rpuo+AaHrqMH8GfiDZup9cEQ+J2EialY/mC66jEnmZVVoH//L8iYYSGzFaPDU+LSR6e1U171u3
 kYkIYjP9AcSS9u36/TMTc+K0knfH5IwCnuKNZCQJstJ7/fO75FEtb3gwRuc6LIbQCmhZCK5fhJQ
 /FyUVoaIv/1Fqkyra2HNs4OQFbxYWBb7JvGJZ63/IPB40HC90jkpImBVpSVOnRABVZZtPOgmQv5
 ZmhLs71uq2NKq4S2Pwy2NeieL16R4P8lTxsQfZJAxjx66K3ImvWovQF2j7F4djJnC6vKM9CvLb1
 VqOQ6qWuAXv+Qh4IRuWdEhj8E65vOdEaWzxD0tSPZqxHIlDLQhZKHzMBSKpd0sAtoKhwpmuR
X-Proofpoint-ORIG-GUID: GyBbvbLe020N8BPk8eLxPLBojEvqZL4W
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68621c4a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=qX-yKedHe2mDKLH7AMEA:9 a=QEXdDO2ut3YA:10
 a=-_B0kFfA75AA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GyBbvbLe020N8BPk8eLxPLBojEvqZL4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300041

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
> 
> Seems like this deserves to not be hidden in a middle of a patch series.
> 
>> Introduce necessary callbacks and updates to ensure seamless
>> transitions between power states, enhancing overall power
>> efficiency.
>>
> 
> This commit message fails to state why we need runtime PM support in the
> driver.

Introduce PM runtime support to the Qualcomm GENI serial driver to enable
better power efficiency and modularity across diverse resource control
mechanisms, including Linux and firmware-managed systems.

As part of this enhancement, the existing qcom_geni_serial_pm() logic to
use standard PM runtime APIs such as pm_runtime_resume_and_get() and
pm_runtime_put_sync(). Power state transitions are now handled through
the geni_serial_resources_on() and geni_serial_resources_off() functions.

Is it fine?
Please guide me/correct me if needed

Thanks,
Praveen Talari
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

