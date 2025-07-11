Return-Path: <linux-arm-msm+bounces-64558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4A9B01B4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3F171887A35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DADF28BAB9;
	Fri, 11 Jul 2025 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C+4E0E/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499D327A44C;
	Fri, 11 Jul 2025 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752235183; cv=none; b=LlCj6swgl6PphXjd1S6heIGlraam3r1ou1stRp/ah2KeCdIQwriw5Nu2hLSDHIUs4r0X4i8XXZgicl+qPCQ21rAlSCzbjsGjcWk6S8i+XesLLMrXnJDqUJutAutkWdTRHkuQwnfXKoBWzRAOLg0qNuDyQZ1TTKVr6AQwj9axrbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752235183; c=relaxed/simple;
	bh=9rBNh8BAnL9rzQKir6p2bHGOXUtT1z6uw6oHmAaPA6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lfN2v9Cx/HPOzeChJspE3weAQZGp3WL/HbM83jeDmEoX4nqWY4FDr7FqJ/mrXYCX3ZOjrhTavfnbaw4KI/kpBRZRvioG4t0/AaZAIllSzGVB7KKDKQZtDCUGpQ2b/VdkPsD3O+DIZivimg+m9c/FGTEmgWNxytcz27D2f9ZfJIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C+4E0E/H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BBLUVN007975;
	Fri, 11 Jul 2025 11:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASgqBb7NEL+xeNzxSTT4vWaKUe1hJfnN9ZK0KKBcgjk=; b=C+4E0E/HGvpZAuhT
	S3IXR/P44bKHwg5fvJ5mhsndQ8KobIjwKwZ2t+xGCLuF3iEtp+PmaOLYTTI6X+eD
	RrcRRJ5uTtvET3mox48yv9qQQqzUEkpd4yAf07lgTWJc/tzlk0C1WaRz2kee8TiV
	0cTZgmiwLcFgOuoLhszSL9rdBJ8iTyDlUzgmBSIY+RB8XYKDGpRHaGiNfgDlHaG4
	+1e1rOnYU9AOKdvioJjyv0keCbFCQP37bF17ulXYFIcjU/3Sd8QRVZ5XT5s1MEwX
	r0bvW7gXcJGBWlj1TBEgR/YqELbNFlXIxO4LwOGQ9uugdZcRFD4xnp7RnjAPnmak
	a2BI8g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg8f63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 11:59:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56BBxcBr000427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 11:59:38 GMT
Received: from [10.253.73.135] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 11 Jul
 2025 04:59:37 -0700
Message-ID: <982da0fb-f855-4ed2-8776-c8aaa20c9ec8@quicinc.com>
Date: Fri, 11 Jul 2025 19:59:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] driver: bluetooth: hci_qca: fix ssr fail when BT_EN is
 pulled up by hw
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC: <linux-bluetooth@vger.kernel.org>, <quic_bt@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20250627061707.3631422-1-quic_shuaz@quicinc.com>
 <CABBYNZLZQkz2pamxqOODJ00+TX=c7urYtAmX7v0RJjp4T46w3w@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <CABBYNZLZQkz2pamxqOODJ00+TX=c7urYtAmX7v0RJjp4T46w3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=6870fcab cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=gSxGL9P0fQkBufHoH1sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aaT4G_YHItKYLx45sUdFidn7xKMW53e2
X-Proofpoint-GUID: aaT4G_YHItKYLx45sUdFidn7xKMW53e2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4NCBTYWx0ZWRfX9RddxfdJLnaH
 JEq0TIOhP3KuMtUNAEikFfTv6EUlhArcG4HPk7078aDXFnJEgkqfo/AO2g23zyRwD9ZX/fJ0Odu
 uXdEPGOMVetv1jQwqt+SPQFG4yyaX8kczmSDcu0XZHWiYjdia/OXv0besHWh4PTSOLkwx2gwnEI
 TOFlp7/3enAqgiZO2D9nt7sSDLguEu14YsSfKCFXV9mKMQrZg+muQ9lddpuapV5km+uqfoMwXgp
 Yu1fiop5BE2M53CPUhUn7iv0MAF6gfEnsoFl0BSGSG3Waii+PAvixZ+Kv4oIT6/EXeEgdrZwfiH
 ZUdmi7oSspFx7HCrexIMAefdHXcPEyGglzsRyytErGFxdLkvRYebnESbcS4e9WtGEywnPKlTgG9
 JvKeZ2RWPorGfSRWUIO4WIz8Q4CihxF2TrQKFLMkT7NgMTbXnN4f9DWJ2EEsjPry/fNGpu3V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110084

Hi Luiz

On 2025/7/8 2:39, Luiz Augusto von Dentz wrote:
> Hi Shuai,
> 
> On Fri, Jun 27, 2025 at 2:17 AM Shuai Zhang <quic_shuaz@quicinc.com> wrote:
>>
>> Q1：
>> If the SoC always enables the bt_en pin via hardware and the driver
>> cannot control the bt_en pin of the SoC chip, then during SSR,
>> the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>> This leads to a reset command timeout failure.
>>
>> Fix1：
>> To address this, clear QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits
>> after the coredump collection is complete.
>> Also, add msleep delay to wait for controller to complete SSR.
> 
> Not sure why you are sending with Q and Fix tags, never seen this
> format being used for kernel patches before, each fix shall be sent
> separately.

I will submit it in two parts.

> 
>> Q2:
>> When the SSR (Sub-System Restart) duration exceeds 2 seconds, it triggers
>> host tx_idle_timeout, which sets host TX state to sleep. due to the
>> hardware pulling up bt_en, the firmware is not downloaded after the SSR.
>> As a result, the controller does not enter sleep mode. Consequently,
>> when the host sends a command afterward, it sends 0xFD to the controller,
>> but the controller does not respond, leading to a command timeout.
>>
>> Fix2:
>> Reset the tx_idle_timer after SSR (Sub-System Restart).
>>
>> Changes in v2:
>> - Modified the format.
>> - Add changes to fix tx_idle_timeout
>> - Link to v1: https://lore.kernel.org/all/20250609105553.3756688-1-quic_shuaz@quicinc.com/
> 
> The version history shouldn't be part of patch description, either add
> it as comments after the description or add a cover letter to capture
> the history.

I will add a cover.

> 
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>  drivers/bluetooth/hci_qca.c | 20 +++++++++++++++++++-
>>  1 file changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 4e56782b0..d415a3f31 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1653,6 +1653,24 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>                 skb_queue_purge(&qca->rx_memdump_q);
>>         }
>>
>> +       /* If the SoC always enables the bt_en pin via hardware and the driver
>> +        * cannot control the bt_en pin of the SoC chip, then during SSR,
>> +        * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>> +        * This leads to a reset command timeout failure.
>> +        *
>> +        * To address this, clear QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits
>> +        * after the coredump collection is complete.
>> +        * Also, add msleep delay to wait for controller to complete SSR.
>> +        */
>> +       if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>> +               clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>> +               clear_bit(QCA_IBS_DISABLED, &qca->flags);
>> +               mod_timer(&qca->tx_idle_timer, jiffies +
>> +                         msecs_to_jiffies(qca->tx_idle_delay));
>> +               qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
>> +               msleep(50);
> 
> This is probably racy since it doesn't seem you are able to validate
> SSR has been completed after 50 ms.

This position has already submitted the core dump data. Before sending the command, 
the controller should be allowed to stabilize.

From qca_regulator_init, it can be seen that the controller requires up to 50ms to stabilize
after powering on. Therefore, an additional 50ms delay is added at this position.

qca_regulator_init:

gpiod_set_value_cansleep(qcadev->bt_en, 0);
msleep(50);
gpiod_set_value_cansleep(qcadev->bt_en, 1);
msleep(50);

> 
>> +       }
>> +
>>         clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>>  }
>>
>> @@ -2478,7 +2496,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>                         return PTR_ERR(qcadev->susclk);
>>                 }
>>         }
>> -
>> +
>>         err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
>>         if (err) {
>>                 BT_ERR("serdev registration failed");
>> --
>> 2.34.1
>>
>>
> 
> 
thanks,
shuai


