Return-Path: <linux-arm-msm+bounces-64849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64690B04564
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 18:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CF031894DA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 16:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322F7260566;
	Mon, 14 Jul 2025 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZNCyfc9s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1972E36F0;
	Mon, 14 Jul 2025 16:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752510112; cv=none; b=oH7X59znjKMsM0IEF0u1vh1jxtLOm5mFPHx3OG6a8x9P8JXR324GqvhozROm1X2xL+6TMZ3dNgGk4NKBTifrta5CCYKov3W51mEjzUAjVVVAEbWEk5u63Kv9l/mOW165Ek0j3p2u3PnTvKZ0g2OnEBHv3n0TP9FUuprU8zzeiAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752510112; c=relaxed/simple;
	bh=YcV3byt1U7frnFLmxCgCgYh1+h2W/do8oYP1fwRldHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E2l8VVulDxu3BBvuw7O+XOrjGRsO9oHSNl9CMuZ+oAXMDJ2RvZlR1Dg/flJX3ofmsZ/vvnuWMSMA7J7mm05KGxHD6MAjk5kxBGdsB0aN9K+QfhGA/4MUvsitASe0e2F0wElV7qiBzXYfnuG33jUUqQg3uNyR2Gb/gAV+9xvNzus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZNCyfc9s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA3DAF004347;
	Mon, 14 Jul 2025 16:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAj7hQQ8Nx+fzicQ6zVl4CM3vrP5r4QvIDVJMdtHIOU=; b=ZNCyfc9stRj8lyAy
	vUJKA42nIJYIDSJVIaRXiIRHJcrGj2+3bp5Et17cq/WdTYmLPdsp042/p+HRKUTj
	emNCXUKNDwEBIzpjr0wHNSMJfulV/C6P4sCqXDRGqjODzFHCKuNpER9YcLGeIXm7
	HRcDjJhCxMM/v2isly9w9ZIjhkIZaN9DnSSwR4phI+Y1f88Ogkc3EBcfSGShzqsg
	Nuy2/Ljt+mYQUaF2CygbDrQRuaMVFUK5m7C1RtBm+z4frM1NB9t1aSUIe/GttD23
	WX+jARXTojaSLMExWFsRVmDH2wIb3ydZHWBZNdSGm5yAhkrsbfllZPLw8Ly1vMg2
	olrZZA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxaw8f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 16:21:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56EGLiNT010025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 16:21:44 GMT
Received: from [10.216.21.210] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 14 Jul
 2025 09:21:38 -0700
Message-ID: <1c73b530-4f1a-4c45-91aa-b44efb8a8c1e@quicinc.com>
Date: Mon, 14 Jul 2025 21:51:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] serial: qcom-geni: Enable PM runtime for serial
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <psodagud@quicinc.com>, <djaggi@quicinc.com>,
        <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
        <quic_arandive@quicinc.com>, <quic_mnaresh@quicinc.com>,
        <quic_shazhuss@quicinc.com>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-8-quic_ptalari@quicinc.com>
 <d6cr4elhrbh27lmlcv5xzuel75uvsgi7klxjkevm7vg4jcbawe@5ojgetrxkag5>
 <f87807c9-5249-4d97-ab89-898b7d8d260d@quicinc.com>
 <tt2crsexdnhlotlo3z5uxyta6jrnnvom7aqwsjvopwueazbuih@2l4h6xjpwlar>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <tt2crsexdnhlotlo3z5uxyta6jrnnvom7aqwsjvopwueazbuih@2l4h6xjpwlar>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: whO25QWW1XtLX8Pa9ilH4_kqFqnB9VgI
X-Proofpoint-ORIG-GUID: whO25QWW1XtLX8Pa9ilH4_kqFqnB9VgI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEwMCBTYWx0ZWRfXx3vtgFj/kqSA
 rMMFipLSMaKBvpgU0UE4OOO8HDAKg+4JmSSx8HnRDCHiPHZoke73zbj0SQ3LOJ6DCSEfoCD2iFd
 BA0Ezho6IqKPCuzSG/Gg2igFFhTYSIa7KJavlHY07dlp6IhgGHHa/Xw5OEhtA6FjstBzrB0XVXN
 JvlFiwEc0cludmTU2Yuq6hiw3Nn0wgmtt66vAcAMFgqoRccYrZVA4Mx7sBe7Nk0syBH2DFncI0E
 0iC/FPMmpup18AMby1w5h+jLYavNk+pZ9w7/KniYJfTB3HIDZoiL5F+TsTLG+iO5/2EDVL/jxzK
 dAYalyf1gf3OJ5ubvQr4w5Sh7TbKQIuWmG26MN8f0NjiqPZCBSwcRrqfq/HtuQNCG0BDArDZ4EP
 kCcq7qrAhhDEuNdX9cTfc5ZZ3mlVxFBM9i2LQNvUjrVic0TqBo+0/HfaEBzZEcHlhwwIV6sq
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68752e99 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=_aAx1oFUeGpnLRK6imAA:9 a=QEXdDO2ut3YA:10
 a=-_B0kFfA75AA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140100

Hi Dmitry/Bjorn/Krzysztof,

Thank you for review.

On 7/1/2025 4:42 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 30, 2025 at 10:40:25AM +0530, Praveen Talari wrote:
>> Hi Bjorn,
>>
>> Thank you for review.
>>
>> On 6/17/2025 9:23 PM, Bjorn Andersson wrote:
>>> On Fri, Jun 06, 2025 at 10:51:13PM +0530, Praveen Talari wrote:
>>>> Add Power Management (PM) runtime support to Qualcomm GENI
>>>> serial driver.
>>>>
>>>
>>> Doesn't this have impact on the behavior outside of your
>>> project? Or is the transition from qcom_geni_serial_pm() to explicit
>>> RPM merely moving code around?
>>>
>>> Seems like this deserves to not be hidden in a middle of a patch series.
>>>
>>>> Introduce necessary callbacks and updates to ensure seamless
>>>> transitions between power states, enhancing overall power
>>>> efficiency.
>>>>
>>>
>>> This commit message fails to state why we need runtime PM support in the
>>> driver.
>>
>> Introduce PM runtime support to the Qualcomm GENI serial driver to enable
>> better power efficiency and modularity across diverse resource control
>> mechanisms, including Linux and firmware-managed systems.
>>
>> As part of this enhancement, the existing qcom_geni_serial_pm() logic to
>> use standard PM runtime APIs such as pm_runtime_resume_and_get() and
>> pm_runtime_put_sync(). Power state transitions are now handled through
>> the geni_serial_resources_on() and geni_serial_resources_off() functions.
>>
>> Is it fine?
>> Please guide me/correct me if needed
> 
> Please start by stating out the problem that you are trying to solve.
> There is no actual issue description in your patch.

I hope this commit describes the actual problem.

The GENI serial driver currently handles power resource management
through calls to the statically defined geni_serial_resources_on() and
geni_serial_resources_off() functions. This approach reduces modularity
and limits support for platforms with diverse power management 
mechanisms, including resource managed by firmware.

Improve modularity and enable better integration with platform-specific
power management, introduce support for runtime PM. Use
pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
qcom_geni_serial_pm() callback to control resource power state 
transitions based on UART power state changes.

Thanks,
Praveen Talari
> 
>>
>> Thanks,
>> Praveen Talari
>>>
>>> Also, start your commit message with a problem description, per
>>> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
>>>
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
>>>> ---
>>>> v5 -> v6
>>>> - added reviewed-by tag in commit
>>>> - added __maybe_unused to PM callback functions to avoid
>>>>     warnings of defined but not used
>>>> ---
>>>>    drivers/tty/serial/qcom_geni_serial.c | 33 +++++++++++++++++++++++----
>>>>    1 file changed, 29 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>>>> index b6fa7dc9b1fb..3691340ce7e8 100644
>>>> --- a/drivers/tty/serial/qcom_geni_serial.c
>>>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>>>> @@ -1686,10 +1686,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>>>>    		old_state = UART_PM_STATE_OFF;
>>>>    	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
>>>> -		geni_serial_resources_on(uport);
>>>> +		pm_runtime_resume_and_get(uport->dev);
>>>>    	else if (new_state == UART_PM_STATE_OFF &&
>>>>    		 old_state == UART_PM_STATE_ON)
>>>> -		geni_serial_resources_off(uport);
>>>> +		pm_runtime_put_sync(uport->dev);
>>>>    }
>>>> @@ -1827,9 +1827,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>>>    		return ret;
>>>>    	}
>>>> +	pm_runtime_enable(port->se.dev);
>>>
>>> Any reason not to use devm_pm_runtime_enable() and avoid the
>>> two pm_runtime_disable() below?
>>>
>>> Regards,
>>> Bjorn
>>>
>>>> +
>>>>    	ret = uart_add_one_port(drv, uport);
>>>>    	if (ret)
>>>> -		return ret;
>>>> +		goto error;
>>>>    	if (port->wakeup_irq > 0) {
>>>>    		device_init_wakeup(&pdev->dev, true);
>>>> @@ -1839,11 +1841,15 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>>>    			device_init_wakeup(&pdev->dev, false);
>>>>    			ida_free(&port_ida, uport->line);
>>>>    			uart_remove_one_port(drv, uport);
>>>> -			return ret;
>>>> +			goto error;
>>>>    		}
>>>>    	}
>>>>    	return 0;
>>>> +
>>>> +error:
>>>> +	pm_runtime_disable(port->se.dev);
>>>> +	return ret;
>>>>    }
>>>>    static void qcom_geni_serial_remove(struct platform_device *pdev)
>>>> @@ -1855,9 +1861,26 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
>>>>    	dev_pm_clear_wake_irq(&pdev->dev);
>>>>    	device_init_wakeup(&pdev->dev, false);
>>>>    	ida_free(&port_ida, uport->line);
>>>> +	pm_runtime_disable(port->se.dev);
>>>>    	uart_remove_one_port(drv, &port->uport);
>>>>    }
>>>> +static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
>>>> +{
>>>> +	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>>>> +	struct uart_port *uport = &port->uport;
>>>> +
>>>> +	return geni_serial_resources_off(uport);
>>>> +}
>>>> +
>>>> +static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
>>>> +{
>>>> +	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>>>> +	struct uart_port *uport = &port->uport;
>>>> +
>>>> +	return geni_serial_resources_on(uport);
>>>> +}
>>>> +
>>>>    static int qcom_geni_serial_suspend(struct device *dev)
>>>>    {
>>>>    	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>>>> @@ -1901,6 +1924,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
>>>>    };
>>>>    static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
>>>> +	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
>>>> +			   qcom_geni_serial_runtime_resume, NULL)
>>>>    	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
>>>>    };
>>>> -- 
>>>> 2.17.1
>>>>
> 

