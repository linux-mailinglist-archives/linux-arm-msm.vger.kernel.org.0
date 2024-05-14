Return-Path: <linux-arm-msm+bounces-19827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE66A8C522E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 13:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3DC9282AF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 11:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA3212D76E;
	Tue, 14 May 2024 11:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S5v6QpNc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8509E53E30;
	Tue, 14 May 2024 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715685610; cv=none; b=pSlkvp7QqrCOcaVKV8UajrJz50/xqd+TD1BjKc0aZQdknt6wTQr6JtUI9JV7CozAH3HrFBnlsTSLzvtU6aujmmo2k7AZfFzSDR3RSd4dt0cApbRWx4MOoLMM+qwBiBxTiGcNKghGoMOuPCbSsd5BNYWyig078fpSEWKTxFJWy0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715685610; c=relaxed/simple;
	bh=XyFKyyciBLAngkmK68/fR6eZNy1P+tJIELRli0u+emk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=IxWFcPbWnuC5uWjdvKcW0iB8lbcV8E9umQKOQJsMGowEdW3fmaHXK8VNu6YetfIavO5G+6tEUjdKv3mALBQWS/piqXnIXQOgRQZkxb40wtDdHZNqICK7qpUi2vKEoKueN/gmX+G5qzHN50sLQMegOXbENLdUyj43cpPySvrxEsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S5v6QpNc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44E849JD024016;
	Tue, 14 May 2024 11:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=SVlVPEfTD6tQYDnw8/PDRROwMu37COEhPHGsPjiczE8=; b=S5
	v6QpNc5J/S87wlPpBEYsCUpGKhSBFJufkWmrUbqUTqIfQu3BBDgSAJkfg3LxnDAh
	kBm3a9/2SGaQrLzsgUbFZxYrDOdk1YA2wI6fg4+UAUqdM3sxxhyDS9j17sPJuQWM
	zzL7db2Z7QCDihHpHvu0LN6mXVqgCtpYfoMSYBsYDKvMD+TSs3uDdlEl1ahHDoof
	yPmOjVN8cwpjJFGAdHj41xUE87One225MOcBG3pyxCJTw2EqPhM+JumIV3lgwOL3
	fFXnf3R4PtMoLFJcbMcqGX26MsG/nsN4NCmCKP3VNogjsHdsBtHhVutw1TYlUoUY
	jnVugIsd++dCGZnpb1UA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y2125e2pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 11:20:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44EBK2Of004764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 11:20:02 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 May
 2024 04:19:41 -0700
Message-ID: <d113adc9-2192-44af-a5df-7bbaa6907ac8@quicinc.com>
Date: Tue, 14 May 2024 16:49:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 2/5] mailbox: Add support for QTI CPUCP mailbox
 controller
Content-Language: en-US
From: Sibi Sankar <quic_sibis@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <sudeep.holla@arm.com>,
        <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>
References: <20240422164035.1045501-1-quic_sibis@quicinc.com>
 <20240422164035.1045501-3-quic_sibis@quicinc.com>
 <d6052413-5706-446b-b508-2a5ed839acc4@linaro.org>
 <d5581614-71ad-5f7f-e948-bdbab3ef854e@quicinc.com>
In-Reply-To: <d5581614-71ad-5f7f-e948-bdbab3ef854e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NJYgaQtE3hCQlT887lNeQ0fuDrv6fH5j
X-Proofpoint-ORIG-GUID: NJYgaQtE3hCQlT887lNeQ0fuDrv6fH5j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140079



On 4/23/24 22:40, Sibi Sankar wrote:
> 
> 
> On 4/23/24 04:47, Konrad Dybcio wrote:
>>
>>
>> On 4/22/24 18:40, Sibi Sankar wrote:
>>> Add support for CPUSS Control Processor (CPUCP) mailbox controller,
>>> this driver enables communication between AP and CPUCP by acting as
>>> a doorbell between them.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +
>>> +static int qcom_cpucp_mbox_send_data(struct mbox_chan *chan, void 
>>> *data)
>>> +{
>>> +    struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct 
>>> qcom_cpucp_mbox, mbox);
>>> +    unsigned long chan_id = channel_number(chan);
>>> +    u32 *val = data;
>>> +
>>> +    writel(*val, cpucp->tx_base + APSS_CPUCP_TX_MBOX_CMD(chan_id) + 
>>> APSS_CPUCP_MBOX_CMD_OFF);
>>
> 
> Hey Konrad,
> 
> Thanks for taking time to review the series.
> 
>> Just checking in, is *this access only* supposed to be 32b instead of 
>> 64 like others?
> 
> yeah, the readl and writely in the driver were used intentionally.
> 
>>
>> [...]
>>
>>> +
>>> +    writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
>>> +    writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
>>> +    writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
>>
>> If these writes are here to prevent a possible interrupt storm type 
>> tragedy,
>> you need to read back these registers to ensure the writes have left 
>> the CPU
>> complex and reached the observer at the other end of the bus (not to be
>> confused with barriers which only ensure that such accesses are ordered
>> *when still possibly within the CPU complex*).
> 
> I couldn't find anything alluding to ^^. This sequence was just
> meant to reset the mailbox. Looks like we do need to preserve the
> ordering so relaxed read/writes aren't an option.
> 
> -Sibi
> 
>>
>> Moreover, if the order of them arriving (en/clear/mask) doesn't 
>> matter, you
>> can add _relaxed for a possible nanosecond-order perf gain
>>
>>> +
>>> +    irq = platform_get_irq(pdev, 0);
>>> +    if (irq < 0)
>>> +        return irq;
>>> +
>>> +    ret = devm_request_irq(dev, irq, qcom_cpucp_mbox_irq_fn,
>>> +                   IRQF_TRIGGER_HIGH, "apss_cpucp_mbox", cpucp);
>>> +    if (ret < 0)
>>> +        return dev_err_probe(dev, ret, "Failed to register irq: 
>>> %d\n", irq);
>>> +
>>> +    writeq(APSS_CPUCP_RX_MBOX_CMD_MASK, cpucp->rx_base + 
>>> APSS_CPUCP_RX_MBOX_MAP);
>>
>> Similarly here, unless read back, we may potentially miss some 
>> interrupts if
>> e.g. a channel is opened and that write "is decided" (by the silicon) 
>> to leave
>> the internal buffer first
> 
> At this point in time we don't expect any interrupts. They are expected
> only after channel activation. Also there were no recommendations for
> reading it back here as well.
> 
> -Sibi
> 
>>
>>
>>> +
>>> +    mbox = &cpucp->mbox;
>>> +    mbox->dev = dev;
>>> +    mbox->num_chans = APSS_CPUCP_IPC_CHAN_SUPPORTED;
>>> +    mbox->chans = cpucp->chans;
>>> +    mbox->ops = &qcom_cpucp_mbox_chan_ops;
>>> +    mbox->txdone_irq = false;
>>> +    mbox->txdone_poll = false;
>>
>> "false" == 0 is the default value (as you're using k*z*alloc)
>>
>>
>>> +
>>> +    ret = devm_mbox_controller_register(dev, mbox);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "Failed to create mailbox\n");
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct of_device_id qcom_cpucp_mbox_of_match[] = {
>>> +    { .compatible = "qcom,x1e80100-cpucp-mbox" },
>>> +    {}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, qcom_cpucp_mbox_of_match);
>>> +
>>> +static struct platform_driver qcom_cpucp_mbox_driver = {
>>> +    .probe = qcom_cpucp_mbox_probe,
>>> +    .driver = {
>>> +        .name = "qcom_cpucp_mbox",
>>> +        .of_match_table = qcom_cpucp_mbox_of_match,
>>> +    },
>>> +};
>>> +module_platform_driver(qcom_cpucp_mbox_driver);
>>
>> That's turbo late. Go core_initcall.

Christian/Sudeep,

Looks like making the cpucp mbox as part of the core initcall and having
the vendor protocol as a module_scmi_driver causes a race as follows:

scmi_core: SCMI protocol bus registered
scmi_core: Requesting SCMI device (clocks) for protocol 14
scmi_core: Registered new scmi driver scmi-clocks
scmi_core: Requesting SCMI device (qcom_scmi_vendor_protocol) for 
protocol 80
scmi_core: Registered new scmi driver qcom-scmi-driver
scmi_core: Requesting SCMI device (perf) for protocol 13
scmi_core: Registered new scmi driver scmi-perf-domain
scmi_core: Requesting SCMI device (genpd) for protocol 11
scmi_core: Registered new scmi driver scmi-power-domain
scmi_core: Requesting SCMI device (reset) for protocol 16
scmi_core: Registered new scmi driver scmi-reset
scmi_core: Requesting SCMI device (hwmon) for protocol 15
scmi_core: Registered new scmi driver scmi-hwmon
scmi_core: Requesting SCMI device (cpufreq) for protocol 13
scmi_core: Registered new scmi driver scmi-cpufreq
scmi_module: Registered SCMI Protocol 0x10
scmi_module: Registered SCMI Protocol 0x14
scmi_module: Registered SCMI Protocol 0x13
scmi_module: Registered SCMI Protocol 0x11
scmi_module: Registered SCMI Protocol 0x16
scmi_module: Registered SCMI Protocol 0x15
scmi_module: Registered SCMI Protocol 0x17
scmi_module: Registered SCMI Protocol 0x12
scmi_module: Registered SCMI Protocol 0x18
scmi_module: Registered SCMI Protocol 0x19
scmi_core: (scmi) Created SCMI device 'scmi_dev.1' for protocol 0x10 
(__scmi_transport_device_tx_10)
scmi_core: (scmi) Created SCMI device 'scmi_dev.2' for protocol 0x10 
(__scmi_transport_device_rx_10)
arm-scmi firmware:scmi: SCMI Notifications - Core Enabled.
scmi_module: Found SCMI Protocol 0x10
arm-scmi firmware:scmi: SCMI Protocol v2.0 'Qualcomm:' Firmware version 
0x20000
scmi_module: Found SCMI Protocol 0x13
scmi_core: (scmi) Created SCMI device 'scmi_dev.3' for protocol 0x13 
(cpufreq)
scmi-perf-domain scmi_dev.4: Initialized 3 performance domains
scmi_core: (scmi) Created SCMI device 'scmi_dev.4' for protocol 0x13 (perf)
scmi_module: SCMI Protocol 0x80 not found!
scmi_core: (scmi) Created SCMI device 'scmi_dev.5' for protocol 0x80 
(qcom_scmi_vendor_protocol)
scmi_module: Registered SCMI Protocol 0x80

By the time the vendor protocol get's registered it's already reported
as not found.

-Sibi

>>
>> Konrad
> 

