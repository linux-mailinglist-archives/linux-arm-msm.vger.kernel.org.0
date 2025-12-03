Return-Path: <linux-arm-msm+bounces-84141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C36A8C9DB3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 05:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3EADD349A19
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 04:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E101E26FA6E;
	Wed,  3 Dec 2025 04:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kJnBLIS+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0854626ED2B;
	Wed,  3 Dec 2025 04:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734700; cv=none; b=j03L5xyG6Qc53uSibJsC+Ka/3zXGp+K5nwVCnB+YuS2RJUwK1tsMwozz/T507xYSKFwoaUmAqAVfpndp85+Tj7DFVU7RB3Y2Xo6o7We4fUf1KBqzypiFLmCuOhsU8iUm2frzPK1hsr1QkC8+mDkMETYtUqABEsODzEbJ+xGvxIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734700; c=relaxed/simple;
	bh=uMtfSAUUV+ZcEWZIa5Fy61QEHpt5VVmEFZQXxarzhf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nx0lMX7i0Z9M+V12mzMRAH0VkIJFfaym9bDXuMytf2QEB3JHrdIB5UVoIlzeJUXpMA9Qy8gLWb/P9MNgGJLMMN8yfMSHfZsQTfw8yrsR5JNnz5uVmbDky69Wydlln2qS+RP4sZ+D2f4GEqZuMwBRXaDqzfeSzYZw3N8aivdfQuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kJnBLIS+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2NatEc032836;
	Wed, 3 Dec 2025 04:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hv48/EnBzO8Gx6035HWFAJ69RSH2Bc1teheiw9fp4qU=; b=kJnBLIS+sIU744nn
	cUSjiKxRrqgHkrsogGtWe1KCkjr64+/vvcGIjMXKngjFB9bx19IOaTl0zIPFIkY1
	PdWIYhjeh1ReUWgaKAYPyeFP6Xm8xkB8cjyOeBZg5Ypz7kL13sXcb+eWJa+He2ul
	0K4ZYfnb96NDcwW4WeGXc9AYPsfXMpbDjGXUig47ipYJWKHYoTehaH+plI93rwtT
	9Rx0GP4LmI4XtWl4Y0Kky3flnKBVNL5h0BX4mkxalLrNB7pcknutY5CUOLXbIWdr
	YYlknG3O4QCq08+A/Hv4UF2RabOiAlWkysxjPMCBSzHHTWKjCGDh4XAG2+sl1vte
	JVCikQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at8d9gvnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 04:04:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5B344sGR003057
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Dec 2025 04:04:54 GMT
Received: from [10.253.33.57] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Dec
 2025 20:04:51 -0800
Message-ID: <e0b97cf5-9812-4afb-8d76-96650997fb65@quicinc.com>
Date: Wed, 3 Dec 2025 12:04:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail
 when BT_EN is pulled up by hw
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        <marcel@holtmann.org>, <linux-bluetooth@vger.kernel.org>,
        <stable@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_chejiang@quicinc.com>
References: <20250916140259.400285-1-quic_shuaz@quicinc.com>
 <vipw44g3fmaf7yhv5xtaf74zbgbkwhjgyjtguwdxgkkk7pimy6@eauo3cuq3bgi>
 <c87533fc-768d-4b70-a1aa-2639e5329058@quicinc.com>
 <CABBYNZJ=C3fYy=SXQyv9x-49vGSjXd-06MsQJ2N3Ps0egMRCuQ@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <CABBYNZJ=C3fYy=SXQyv9x-49vGSjXd-06MsQJ2N3Ps0egMRCuQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAyOCBTYWx0ZWRfX1GYgzkzpxmqp
 0Kdp/XojogCyU04D9o7tTFJaB4ksK3JFASL17QkfZu7gMcVVjuSLG7rIBaO293yM3zKfXUklASw
 K/dQTprO735XdBnAZvAR+DdIH+sjYiPNh9+5rasePJtmeLy3Ebsu2y5KHREveb8f3Q3e7Sbp5dh
 q7J3LgVygrZEYaYB7hjHokXunTDC2gosbRj8XRb9IlyNdQNosIuknMOcpzJWYUtzkllrCODW+bN
 4KXwcqlwkelAgje7TQA7TEzF+9EhG3GwvFZ76zU6e92QUiYiWwkEIGGCA/t1hHci+vgtZMnErvU
 kh/qE88o72jL8dphLdfZYrnDXlQbygpoKN3uzNAflw1B4zrFznkVdytHfIfjVkEDL1FwAfEm2fU
 B7rpSHhI9lPO92ha7pfzo5oOzIbS0Q==
X-Authority-Analysis: v=2.4 cv=A7th/qWG c=1 sm=1 tr=0 ts=692fb6e6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=QcVRgBLmt2abGhXxf9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -ku9x_6BKeaH08SWXDwUE9kXy8_kfQRn
X-Proofpoint-GUID: -ku9x_6BKeaH08SWXDwUE9kXy8_kfQRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030028

Hi Luiz

On 12/2/2025 10:30 PM, Luiz Augusto von Dentz wrote:
> Hi Shuai,
> 
> On Tue, Dec 2, 2025 at 4:08 AM Shuai Zhang <quic_shuaz@quicinc.com> wrote:
>>
>> Hi Luiz
>>
>> On 9/16/2025 11:01 PM, Dmitry Baryshkov wrote:
>>> On Tue, Sep 16, 2025 at 10:02:59PM +0800, Shuai Zhang wrote:
>>>> On QCS9075 and QCA8275 platforms, the BT_EN pin is always pulled up by hw
>>>> and cannot be controlled by the host. As a result, in case of a firmware
>>>> crash, the host cannot trigger a cold reset. Instead, the BT controller
>>>> performs a warm restart on its own, without reloading the firmware.
>>>>
>>>> This leads to the controller remaining in IBS_WAKE state, while the host
>>>> expects it to be in sleep mode. The mismatch causes HCI reset commands
>>>> to time out. Additionally, the driver does not clear internal flags
>>>> QCA_SSR_TRIGGERED and QCA_IBS_DISABLED, which blocks the reset sequence.
>>>> If the SSR duration exceeds 2 seconds, the host may enter TX sleep mode
>>>> due to tx_idle_timeout, further preventing recovery. Also, memcoredump_flag
>>>> is not cleared, so only the first SSR generates a coredump.
>>>>
>>>> Tell driver that BT controller has undergone a proper restart sequence:
>>>>
>>>> - Clear QCA_SSR_TRIGGERED and QCA_IBS_DISABLED flags after SSR.
>>>> - Add a 50ms delay to allow the controller to complete its warm reset.
>>>> - Reset tx_idle_timer to prevent the host from entering TX sleep mode.
>>>> - Clear memcoredump_flag to allow multiple coredump captures.
>>>>
>>>> Apply these steps only when HCI_QUIRK_NON_PERSISTENT_SETUP is not set,
>>>> which indicates that BT_EN is defined in DTS and cannot be toggled.
>>>>
>>>> Refer to the comment in include/net/bluetooth/hci.h for details on
>>>> HCI_QUIRK_NON_PERSISTENT_SETUP.
>>>>
>>>> Changes in v12:
>>>> - Rewrote commit to clarify the actual issue and affected platforms.
>>>> - Used imperative language to describe the fix.
>>>> - Explained the role of HCI_QUIRK_NON_PERSISTENT_SETUP.
>>>
>>> I'll leave having the changelog inside the commit message to the
>>> maintainer's discretion.
>>>
>>> Otherwise:
>>>
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>
>>>
>>
>> I noticed that this upstream patch has already been reviewed,
>> but it still seems not to have been accepted. Is there anything else I need to do?
> 
> My bad, please resend it so CI can pick it up for testing.
> 

I have resubmitted a new patch, please help review it.

>>>
>>>>
>>>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>>>> ---
>>>>  drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
>>>>  1 file changed, 33 insertions(+)
>>>>
>>>
>>
>> Thanks,
>> Shuai
> 
> 

Thanks,
Shuai

> 


