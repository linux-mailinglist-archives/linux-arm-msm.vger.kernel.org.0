Return-Path: <linux-arm-msm+bounces-69665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF77B2B9D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 08:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6A287A6FDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 06:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C656526B74F;
	Tue, 19 Aug 2025 06:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G+U94iA4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AEB1A9B58;
	Tue, 19 Aug 2025 06:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755586233; cv=none; b=BE56AO6sWicjcioP30bfnNyc6UFJH6efYu+UnOA2pNlLslv8yKueNYmrQKCJEYH4ePAdUklSInCugxSQfmYOGUIsuyKGzGHZ8tlaZ48MovR3x84dAjFL3Y/3klr443LfYHAHk+PDNPq3uBNQQ8rFkplXtCPVrNANU9utIGQ4EpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755586233; c=relaxed/simple;
	bh=VaB6Hvb1/wUXajHjx1N8rlAwIFGnRUnTH7nrE4iwSc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Oe/Qfqi0b3AigNdc0lk0szNqIdDvbSLTroRvJ1MG1mmB5aFGU/39qpnnYkv6rKv7ji4hZfy67jgVqFHaI/+VFiIDItwKBR6yJ4iXjmXxGQk0vc50OWHcE9m7jvvppKtuiwUOuz6ZmTyXOYbC9Vrdk/1/28WmxDLpr0DmFAZnY1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G+U94iA4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2SNjf025494;
	Tue, 19 Aug 2025 06:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rd2+few/jkAwh6O4ZXoW9xkjlpLlXW5wfXXB7ahWBQ=; b=G+U94iA4l03pqwez
	pM+Qx0v9xt3bnG1rTdVO4JpOCFSxCejfA1M09kvuWAEf2U3Sddd8uuqA2SuP4UEp
	QOAjQV+deKpW/iTeHg/T0xaYmXyjvdpD66QOVZbCP1jFvuQoSBlFl78IRCb/F6jp
	80Ei98HHpw6EbfsU79bvAO/VizHfQT2GZEKkRFm0YYPpAg1YsE5ugFaCFp115SN/
	k9Q8i49GndOqhYobeGtJFogh2J22arVESbWs9zRl3FomaECyd7vF+Wn1SH5bbhPF
	qmDGL8y5K6lJ5OdBgQ5njzvhy2aenLe54ST++53MeiR1PE7Ue/2BOGTkz4VEa52l
	pZHm7w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cj7hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 06:50:26 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57J6oQGD021958
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 06:50:26 GMT
Received: from [10.218.32.171] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 18 Aug
 2025 23:50:19 -0700
Message-ID: <577d05d4-789b-4556-a2d2-d0ad15b2c213@quicinc.com>
Date: Tue, 19 Aug 2025 12:20:16 +0530
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
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_cchiluve@quicinc.com>, <quic_shazhuss@quicinc.com>,
        Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <bryan.odonoghue@linaro.org>, <neil.armstrong@linaro.org>,
        <srini@kernel.org>
References: <20250721174532.14022-1-quic_ptalari@quicinc.com>
 <20250721174532.14022-8-quic_ptalari@quicinc.com>
 <DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 01o_Fkt4A9eK43WIp_B6g1jS7tVs_bt0
X-Proofpoint-GUID: 01o_Fkt4A9eK43WIp_B6g1jS7tVs_bt0
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a41eb2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=YZi1yasrQyHiNV3y1Q4A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX0YLgzNkLpxao
 GapCCECYiVY9WcZHXopGQXP7G0zljA5K92f49pnW4Fatvblj3SUfyQBRsKSrvI9IN/VSbvDGRKS
 1tHjLrLkB7GXCEYEbPTJWwwV8h3z6avXUona4Asfu1Ai4HGSBxN3I9oDAMIM9gXZtzDQDs7BOmT
 p/C7JxVYXZfWzgIN3wmbbMU2/u21dkb1LLr8PUX6/mQM1nVTS5XLNLpf5HbB2RFNrA3adbLBjqI
 fNiPOps0CYqjT8YMbvd3qKWPXvmRx2GOWRisZCqDQRm9bqvKxIFrcYLEq8W5i3QX1rHbgJOoOne
 pQv7Fv0HUw24ZNLl6WguH3X4nRjRyqL7rlgyJLxiIQ1Tw2LBt7Kx2p2huj6a3/ANJAOzuf+W2Oq
 mLFZf74y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147

Hi Alexey.

Thank you for your patience,

On 8/12/2025 3:35 PM, Alexey Klimov wrote:
> (c/c Neil and Srini)
> 
> On Mon Jul 21, 2025 at 6:45 PM BST, Praveen Talari wrote:
>> The GENI serial driver currently handles power resource management
>> through calls to the statically defined geni_serial_resources_on() and
>> geni_serial_resources_off() functions. This approach reduces modularity
>> and limits support for platforms with diverse power management
>> mechanisms, including resource managed by firmware.
>>
>> Improve modularity and enable better integration with platform-specific
>> power management, introduce support for runtime PM. Use
>> pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
>> qcom_geni_serial_pm() callback to control resource power state
>> transitions based on UART power state changes.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> 
> 
> This breaks at least RB1 (QRB2210), maybe others.
> Currently broken on -master and on linux-next.
> 
> Upon login prompt random parts of kernel seems to be off/failed and
> debugging led to udev being stuck:
> 
> [   85.369834] INFO: task kworker/u16:0:12 blocked for more than 42 seconds.
> [   85.376699]       Not tainted 6.17.0-rc1-00004-g53e760d89498 #9
> [   85.382660] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [   85.390547] task:kworker/u16:0   state:D stack:0     pid:12    tgid:12    ppid:2      task_flags:0x4208060 flags:0x00000010
> [   85.401748] Workqueue: async async_run_entry_fn
> [   85.406349] Call trace:
> [   85.408828]  __switch_to+0xe8/0x1a0 (T)
> [   85.412724]  __schedule+0x290/0x7c0
> [   85.416275]  schedule+0x34/0x118
> [   85.419554]  rpm_resume+0x14c/0x66c
> [   85.423111]  rpm_resume+0x2a4/0x66c
> [   85.426647]  rpm_resume+0x2a4/0x66c
> [   85.430188]  rpm_resume+0x2a4/0x66c
> [   85.433722]  __pm_runtime_resume+0x50/0x9c
> [   85.437869]  __driver_probe_device+0x58/0x120
> [   85.442287]  driver_probe_device+0x3c/0x154
> [   85.446523]  __driver_attach_async_helper+0x4c/0xc0
> [   85.451446]  async_run_entry_fn+0x34/0xe0
> [   85.455504]  process_one_work+0x148/0x290
> [   85.459565]  worker_thread+0x2c4/0x3e0
> [   85.463368]  kthread+0x118/0x1c0
> [   85.466651]  ret_from_fork+0x10/0x20
> [   85.470337] INFO: task irq/92-4a8c000.:71 blocked for more than 42 seconds.
> [   85.477351]       Not tainted 6.17.0-rc1-00004-g53e760d89498 #9
> [   85.483323] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [   85.491195] task:irq/92-4a8c000. state:D stack:0     pid:71    tgid:71    ppid:2      task_flags:0x208040 flags:0x00000010
> [   85.502290] Call trace:
> [   85.504786]  __switch_to+0xe8/0x1a0 (T)
> [   85.508687]  __schedule+0x290/0x7c0
> [   85.512231]  schedule+0x34/0x118
> [   85.515504]  __synchronize_irq+0x60/0xa0
> [   85.519483]  disable_irq+0x3c/0x4c
> [   85.522929]  msm_pinmux_set_mux+0x3a8/0x44c
> [   85.527167]  pinmux_enable_setting+0x1c4/0x28c
> [   85.531665]  pinctrl_commit_state+0xa0/0x260
> [   85.535989]  pinctrl_pm_select_default_state+0x4c/0xa0
> [   85.541182]  geni_se_resources_on+0xd0/0x15c
> [   85.545522]  geni_serial_resource_state+0x8c/0xbc
> [   85.550282]  qcom_geni_serial_runtime_resume+0x24/0x3c
> [   85.555470]  pm_generic_runtime_resume+0x2c/0x44
> [   85.560139]  __rpm_callback+0x48/0x1e0
> [   85.563949]  rpm_callback+0x74/0x80
> [   85.567494]  rpm_resume+0x39c/0x66c
> [   85.571040]  __pm_runtime_resume+0x50/0x9c
> [   85.575193]  handle_threaded_wake_irq+0x30/0x80
> [   85.579771]  irq_thread_fn+0x2c/0xb0
> [   85.583443]  irq_thread+0x16c/0x278
> [   85.587003]  kthread+0x118/0x1c0
> [   85.590283]  ret_from_fork+0x10/0x20
> [   85.593943] INFO: task (udev-worker):228 blocked for more than 42 seconds.
> [   85.600873]       Not tainted 6.17.0-rc1-00004-g53e760d89498 #9
> [   85.606846] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [   85.614717] task:(udev-worker)   state:D stack:0     pid:228   tgid:228   ppid:222    task_flags:0x400140 flags:0x00000818
> [   85.625823] Call trace:
> [   85.628316]  __switch_to+0xe8/0x1a0 (T)
> [   85.632217]  __schedule+0x290/0x7c0
> [   85.635765]  schedule+0x34/0x118
> [   85.639044]  async_synchronize_cookie_domain.part.0+0x50/0xa4
> [   85.644854]  async_synchronize_full+0x78/0xa0
> [   85.649270]  do_init_module+0x190/0x23c
> [   85.653154]  load_module+0x1708/0x1ca0
> [   85.656952]  init_module_from_file+0x74/0xa0
> [   85.661273]  __arm64_sys_finit_module+0x130/0x2f8
> [   85.666023]  invoke_syscall+0x48/0x104
> [   85.669842]  el0_svc_common.constprop.0+0xc0/0xe0
> [   85.674604]  do_el0_svc+0x1c/0x28
> [   85.677973]  el0_svc+0x2c/0x84
> [   85.681078]  el0t_64_sync_handler+0xa0/0xe4
> [   85.685316]  el0t_64_sync+0x198/0x19c
> [   85.689032] INFO: task (udev-worker):229 blocked for more than 42 seconds.
> 
> 
> Usually wifi, all remoteprocs and anything that depends on lpass/pinctrl fail to probe.

May i know what is testcase which you are running on target?
what is target?
Which usecase is this issue occurring in?

Thanks,
Praveen Talari
> 
> Reverting these:
> 86fa39dd6fb7 serial: qcom-geni: Enable Serial on SA8255p Qualcomm platforms
> 1afa70632c39 serial: qcom-geni: Enable PM runtime for serial driver
> 
> resolves the regression. Couldn't say if we should go with reverting since 86fa39dd6fb7
> adds support of serial on SA8255p and for clean revert both have to be reverted.
> 
> Any thoughts?
> 
> Best regards,
> Alexey
> 
> 
> 
> 
> 
>> ---
>> v6 -> v7
>>  From Bjorn:
>> - used devm_pm_runtime_enable() instead of pm_runtime_enable()
>> - updated commit text.
>>
>> v5 -> v6
>> - added reviewed-by tag in commit
>> - added __maybe_unused to PM callback functions to avoid
>>    warnings of defined but not used
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++++++++++++--
>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> index 81f385d900d0..aa08de659e34 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -1713,10 +1713,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
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
>> @@ -1878,6 +1878,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	devm_pm_runtime_enable(port->se.dev);
>> +
>>   	ret = uart_add_one_port(drv, uport);
>>   	if (ret)
>>   		return ret;
>> @@ -1909,6 +1911,22 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
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
>> @@ -1952,6 +1970,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
>>   };
>>   
>>   static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
>> +			   qcom_geni_serial_runtime_resume, NULL)
>>   	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
>>   };
>>   
> 

