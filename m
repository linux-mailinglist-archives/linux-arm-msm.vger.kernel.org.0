Return-Path: <linux-arm-msm+bounces-70148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD3AB2F6E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 446393A461A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 11:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202ED3054DA;
	Thu, 21 Aug 2025 11:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X5w0u1ig"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E25A1FBEA6;
	Thu, 21 Aug 2025 11:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755776099; cv=none; b=eHEu2KrnzYxcnh6sz5OsvI8fKPIUFHMtJfdOpTJAkj1JFCoB1wfS3ABvFZhNENKoW7HXld+ESvGxo0C25xzebQN422ciE9k5ZoGcpoJkeOoeydUSphvnalV5UhzbDlNXfhMf6+jKWZYtxb4xaET4gLgLGcc9NzdmbN35FV1tFxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755776099; c=relaxed/simple;
	bh=jQLNRcbgR9zSXDkWu4q1Wlbbm01V0AY92E7cT4ZtxxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HiHxlQtUtftwxwFyTee7FGn3h6L5IK63qWt8GclYUZawIpKpb0k05SWPbIBkC15rAqOec62W0PFmQuB8FXoTIwHjbKXxEiwLuK0BI/PQHdwoKOQRJJZQq+NE2PjKRiCQermTuSaV6ruYUuTJj+/q6GcFtY6dK8OoKBWOqEY1GX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X5w0u1ig; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bH6o013278;
	Thu, 21 Aug 2025 11:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+PxQrDuGrJ395xuRb3D5HRJ5qLqqUWWINqpZyZAOUNg=; b=X5w0u1igi1puJ7yz
	IkaoF56AV3Gu6IMMd5CEMqvdr1TaPXnjwhXyRgAQvaMLH+e/KSlrFUrc8w/TusiV
	5ctFBCJkYCagGrfT7cdfXU2/xFMh+GB1nbT0Fv2RylQrrTmwARltxhRyAq9njVNH
	dVnmPDXkkcKwvg/owmJSzgFMBPT17bRWK/TfhELdPJlOmTBhiq0RsJ4/rXLyURHb
	7M4jIVrEFQu9zaLJ62aI4zEcnEEy6bsRVkmbmezwahDd+GjPnHlqyqVh4AnJEK+U
	uTj2SOxPXqNQsbtZDRBp3xPM7UzLNiVWVq6RPPkShjENqiafsdzNTLNHsAESGBgL
	AkAt5A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dn5p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:34:46 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LBYjdX024279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:34:45 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 04:34:43 -0700
Message-ID: <8ba8b88e-df47-496a-be18-a9d0ce03d0c4@quicinc.com>
Date: Thu, 21 Aug 2025 19:34:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] Fix SSR(SubSystem Restart) fail when BT_EN is pulled
 up by hw
To: Paul Menzel <pmenzel@molgen.mpg.de>
CC: <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bt@quicinc.com>
References: <20250820120641.1622351-1-quic_shuaz@quicinc.com>
 <0c0a6b05-edc6-4e3e-8db5-c48f732d12f2@molgen.mpg.de>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <0c0a6b05-edc6-4e3e-8db5-c48f732d12f2@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXycEzDNpQzZeR
 xHAqAMXiSZ6wOqxJcBCwcPUPYODwB3ofVCiPNFggLtjVWCtkKHGkTeQFe/6+4WYEpRWuoJrg4tp
 rEbkA364vjottE3DM6NvCsQE0cWNkrtjY8kfYjIWfhknJd2FQVNUntdT42Ke724srjdEGdqZ6bN
 TnJ16zmtt+4UcCZCl98iB2LGbYfZJQVavUeQEmhemxKOpTTuW7Ju8HUtG3QXE2YBIbp3j9cFHf2
 wiFAGotbOVtRxXRMbAMt+FPI99m8+aw4yXg65/eNjjegzYY0XVVhWLBJDrj4RmyDCcWiQgpSujK
 kuxgx5wH+3Dbv4W9uC9g+pk0WaXhuzDIsgKNJpOhJYJW0BWrMkb0w0mRFPmMgaxQGCO+/wAS/F2
 vCzSlSdh/ewTW/dahoR+l6ydh9MsTA==
X-Proofpoint-ORIG-GUID: tWPY2Yj6f_AOURVU90tPCN3BpUGapgU5
X-Proofpoint-GUID: tWPY2Yj6f_AOURVU90tPCN3BpUGapgU5
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a70456 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=gSxGL9P0fQkBufHoH1sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Dear,Paul

On 8/20/2025 9:32 PM, Paul Menzel wrote:
> Dear Shuai,
> 
> 
> Thank you for the improved version. The commit message summary/title still has the space missing before the ( and should be prefixed with `Bluetooth:` to pass the linters.
> 
> Am 20.08.25 um 14:06 schrieb Shuai Zhang:
>> When the host actively triggers SSR and collects coredump data,
>> the Bluetooth stack sends a reset command to the controller. However, due
>> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
>> the reset command times out.
>>
>> To address this, this patch clears the QCA_SSR_TRIGGERED and
>> QCA_IBS_DISABLED flags and adds a 50ms delay after SSR, but only when
>> HCI_QUIRK_NON_PERSISTENT_SETUP is not set. This ensures the controller
>> completes the SSR process when BT_EN is always high due to hardware.
>>
>> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
>> commit 740011cfe948 ("Bluetooth: Add new quirk for non-persistent setup
>> settings")
> 
> Missing dot/period at the end.
> 
> Also, the comment in `include/net/bluetooth/hci.h` is more helpful to me than the commit.
> 
>> The HCI_QUIRK_NON_PERSISTENT_SETUP quirk is associated with BT_EN,
>> and its presence can be used to determine whether BT_EN is defined in DTS.
>>
>> After SSR, host will not download the firmware, causing
>> controller to remain in the IBS_WAKE state. Host needs
>> to synchronize with the controller to maintain proper operation.
>>
>> Multiple triggers of SSR only first generate coredump file,
>> duo to memcoredump_flag no clear.
> 
> due to
> 
>> add clear coredump flag when ssr completed.
>>
>> When the SSR duration exceeds 2 seconds, it triggers
>> host tx_idle_timeout, which sets host TX state to sleep. due to the
>> hardware pulling up bt_en, the firmware is not downloaded after the SSR.
>> As a result, the controller does not enter sleep mode. Consequently,
>> when the host sends a command afterward, it sends 0xFD to the controller,
>> but the controller does not respond, leading to a command timeout.
>>
>> So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sloeep mode.
> 
> Sleep
> 
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>   drivers/bluetooth/hci_qca.c | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 4e56782b0..403d65952 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1653,6 +1653,37 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>           skb_queue_purge(&qca->rx_memdump_q);
>>       }
>>   +    /*
>> +     * If the BT chip's bt_en pin is connected to a 3.3V power supply via
>> +     * hardware and always stays high, driver cannot control the bt_en pin.
>> +     * As a result, during SSR(SubSystem Restart), QCA_SSR_TRIGGERED and
> 
> Missing space before (.
> 
>> +     * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
>> +     * command timeout.
>> +     * Add an msleep delay to ensure controller completes the SSR process.
>> +     *
>> +     * Host will not download the firmware after SSR, controller to remain
>> +     * in the IBS_WAKE state, and the host needs to synchronize with it
>> +     *
>> +     * Since the bluetooth chip has been reset, clear the memdump state.
>> +     */
>> +    if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>> +        /*
>> +         * When the SSR (Sub-System Restart) duration exceeds 2 seconds,
>> +         * it triggers host tx_idle_delay, which sets host TX state
>> +         * to sleep. Reset tx_idle_timer after SSR to prevent
>> +         * host enter TX IBS_Sloeep mode.
> 
> Sleep?
> 
>> +         */
>> +        mod_timer(&qca->tx_idle_timer, jiffies +
>> +                  msecs_to_jiffies(qca->tx_idle_delay));
>> +        msleep(50);
> 
> Add a comment, why 50 ms and not 20 ms or 100 ms?
> 
>> +
>> +        clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>> +        clear_bit(QCA_IBS_DISABLED, &qca->flags);
>> +
>> +        qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
>> +        qca->memdump_state = QCA_MEMDUMP_IDLE;
>> +    }
>> +
>>       clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>>   }
>>   
> 
> 
> Kind regards,
> 
> Paul
Thanks again for your thorough check. 
I’ll revise the content and share the updated version soon


BR，
Shuai




