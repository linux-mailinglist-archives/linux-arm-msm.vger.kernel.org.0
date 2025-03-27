Return-Path: <linux-arm-msm+bounces-52587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D85BFA72A6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 08:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A9E5188FF0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 07:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9E81C8627;
	Thu, 27 Mar 2025 07:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ql9RDdqb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4584C2C8;
	Thu, 27 Mar 2025 07:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743059553; cv=none; b=ES5ToIbOX1ealENG9RXklmdgvdz20Ddn6ru5F4PNkG0x2cc1G+0tmPTwfnIpCKbzxUHSIHKvCUFmCP2b6pe+G6M4v0lCBTRkXGCzvB5eZAFnsuKtS7UvBGYg0a51cejNk1XNJpkc8BVleJdsATAP+VJwnyRYFLcV76z9btU/eVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743059553; c=relaxed/simple;
	bh=MtNZYmslm4s9b3wy2xk86i+aukr4L60ftaFGQXqHruw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lpMvGTG6WwKEI/rWBED1wFNtde+5ioj5l/OB5dckqtyj1Xp2FgocYv3DaWYSDXoUIUox2ilAQTOlsfXB+vZLrBGuiMz+bftCWaMMi5rlgLMEpW2ZnS8svYXltgBmFILMft04TLtbtpWnHSLiSLZiyi92SftVgc78oxz3W7YvR9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ql9RDdqb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jHms005989;
	Thu, 27 Mar 2025 07:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lISXSmZA+01YLNL+u5HNNSrDAXoQZHFb4qgnczcQBdc=; b=Ql9RDdqb7FKuK3/b
	tvZ0pQh8Wn51w8n0mpfXxXR4RfyYjChkSakFdFGQ0V2UfFuOpbJEZ0JjzaA0VNqt
	iTh9CvxsewAEBkxxJsEP8nC6lsoo4GrY6YdMQdIG8D0ENFlD1idpXkQp54tfkcoV
	sH7mILvJTbOC+A7aJr62qQY7tjKAEVjev26T/iGu2SDAJGbQrHu5wcFcuEKrMFsI
	/348pe2wTZ0Rht/i33kA7yw7XG3OUGYiGeANdb9IkJwQQCPlU/7hRhYwazhj+8DC
	wp/PD4JLrxoDfhV1DmXVZ+GHxUcXr3nnNAF/IReLXKF8ppp5i+YHujI7uKBg1lLi
	83uDpA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf4c3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 07:12:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R7CQOm011424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 07:12:26 GMT
Received: from [10.216.20.56] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 00:12:22 -0700
Message-ID: <75ebb440-f5b7-4035-a6a2-ce1280246fb4@quicinc.com>
Date: Thu, 27 Mar 2025 12:42:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom-geni: Remove alias dependency from qcom
 serial driver
To: Bjorn Andersson <andersson@kernel.org>
CC: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <johan+linaro@kernel.org>, <dianders@chromium.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20250304071423.4033565-1-quic_vdadhani@quicinc.com>
 <tn6czifetdf2mg5gl3mhfpwcb6q7dkn5r4kgqln6evm4qdsjvi@ehpl3qj3axvw>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <tn6czifetdf2mg5gl3mhfpwcb6q7dkn5r4kgqln6evm4qdsjvi@ehpl3qj3axvw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iQIGAuaCZlLziICXa6KM2MphIt0i_Buc
X-Proofpoint-GUID: iQIGAuaCZlLziICXa6KM2MphIt0i_Buc
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e4fa5a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=fdVWx5XDXsnaa6-e9zgA:9
 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270046



On 3/4/2025 11:15 PM, Bjorn Andersson wrote:
> On Tue, Mar 04, 2025 at 12:44:23PM +0530, Viken Dadhaniya wrote:
>> Remove the dependency on aliases in the device tree configuration for the
>> qcom serial driver. Currently, the absence of an alias results in an
>> invalid line number, causing the driver probe to fail for geni serial.
>>
>> To prevent probe failures, implement logic to dynamically assign line
>> numbers if an alias is not present in the device tree for non-console
>> ports.
>>
> 
> Please read and follow https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
> Start with your problem description, then a description of your proposed
> solution.

Sure, Updated in v2.

> 
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 26 +++++++++++++++++++++++---
>>   1 file changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index a80ce7aaf309..2457f39dfc84 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -98,6 +98,8 @@
>>   
>>   #define DMA_RX_BUF_SIZE		2048
>>   
>> +static DEFINE_IDR(port_idr);
> 
> You're just looking for a index allocator, so DEFINE_IDA() is probably
> what you want to use.
> 
> 
> That said, theoretically I think we could get 24 GENI serial instances
> in a system. Making this a huge waste of memory and CPU cycles.
> 
> An empty idr takes 88 bytes, if you then allocate 1 entry it grows with
> at least one xa_array node which is 576 bytes.

Use IDA in v2.

> 
>> +
>>   struct qcom_geni_device_data {
>>   	bool console;
>>   	enum geni_se_xfer_mode mode;
>> @@ -253,10 +255,25 @@ static struct qcom_geni_serial_port *get_port_from_line(int line, bool console)
>>   	struct qcom_geni_serial_port *port;
>>   	int nr_ports = console ? GENI_UART_CONS_PORTS : GENI_UART_PORTS;
>>   
>> -	if (line < 0 || line >= nr_ports)
>> -		return ERR_PTR(-ENXIO);
>> +	if (console) {
>> +		if (line < 0 || line >= nr_ports)
>> +			return ERR_PTR(-ENXIO);
>> +
>> +		port = &qcom_geni_console_port;
>> +	} else {
>> +		int max_alias_num = of_alias_get_highest_id("serial");
>> +
>> +		if (line < 0 || line >= nr_ports)
>> +			line = idr_alloc(&port_idr, (void *)port, max_alias_num + 1, nr_ports,
>> +					 GFP_KERNEL);
>> +		else
>> +			line = idr_alloc(&port_idr, (void *)port, line, nr_ports, GFP_KERNEL);
>> +
>> +		if (line < 0)
>> +			return ERR_PTR(-ENXIO);
>>   
>> -	port = console ? &qcom_geni_console_port : &qcom_geni_uart_ports[line];
>> +		port = &qcom_geni_uart_ports[line];
> 
> Plus qcom_geni_uart_ports[] is GENI_UART_PORTS long. So you will
> actually only have a maximum of 3 ports.
> 

Yes, that's correct. We are also working on increasing the number of 
serial ports to support more ports on GENI hardware.

> 
> I like the change, but please replace port_idr with a u32 and use
> linux/bitmap.h to implement the port allocation scheme.

As per Greg's comment, used ida in v2.

> 
> Regards,
> Bjorn
> 
>> +	}
>>   	return port;
>>   }
>>   
>> @@ -1761,6 +1778,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   						port->wakeup_irq);
>>   		if (ret) {
>>   			device_init_wakeup(&pdev->dev, false);
>> +			idr_remove(&port_idr, uport->line);
>>   			uart_remove_one_port(drv, uport);
>>   			return ret;
>>   		}
>> @@ -1772,10 +1790,12 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   static void qcom_geni_serial_remove(struct platform_device *pdev)
>>   {
>>   	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
>> +	struct uart_port *uport = &port->uport;
>>   	struct uart_driver *drv = port->private_data.drv;
>>   
>>   	dev_pm_clear_wake_irq(&pdev->dev);
>>   	device_init_wakeup(&pdev->dev, false);
>> +	idr_remove(&port_idr, uport->line);
>>   	uart_remove_one_port(drv, &port->uport);
>>   }
>>   
>> -- 
>> 2.34.1
>>
>>

