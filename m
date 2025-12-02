Return-Path: <linux-arm-msm+bounces-84055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CBCC9ACAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 10:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 13F404E2A98
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 09:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3FF309F1B;
	Tue,  2 Dec 2025 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GnxYRef0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD6E309DC4;
	Tue,  2 Dec 2025 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764666499; cv=none; b=UhibhgXg/lknK4hcdehRYIo71QZBDvkdEzH3pZVF4Mapmybo6NaNcSt7FU6x9wVFX2f3WIZsC9BkqP4fcjHaqk/+mGiyR8pgPCXP7/7Hog/KsaCtWN/ZzPE6v5nHH4A6Y7A3MzcEIJg2oMMyFbIU+PZcLQyN+/0AcXZ6mchsDEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764666499; c=relaxed/simple;
	bh=2ls4wCYGy4uazWXajdhv/xNFKC05rKtCx0he+QJGQS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MoW5SEKphQHm//HRSq9khGXDZ7AtPuOjfLAJjuEKdZxkm4Vpc7KWrKlVa8EerkTNrCd5q7BDt8bPo9TTC6hU3pqfL47U0e7hq2ArCyEOJt4uSWKqtuaTO1lbelgAur8bAwxuI8J5NovzgdzuUecwSSC24vOj8xYX9+720ADe7gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GnxYRef0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2672vk2821183;
	Tue, 2 Dec 2025 09:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UL8XiJ0OKD//ZpJy5+AS4tjSqrHNM1d1BOiJm2+auGY=; b=GnxYRef0PxNhWwbG
	B9UKWHqzkNj8K5Q1vlyaA+zPFSNYMv2icSogoda6xtyVQ0KdKvybZlWf0waNuD+i
	w9hCgmBjwR7Aogb/6c//SKNwl0Q6/t7ABI2s9sOIfTSzoIhVnTp9+DStfom9Q6lm
	+rHee1zgx/MrHg+HjE7Sjzvq3ZifO5G9wmruS7VvWIf0JmnY8wMYTZvWyDaKurLQ
	is53C+ZkyC2vUbbwN8Z7x3zeZOZjyAdY25BWwH1S8ysjV0vl3zJ72aZYhTohzyON
	06MI0ZWtV4xuv8vSXbqXopaSj6PRL2B8suwJvQPP54icnw7tmb8bEIJ+eaw8GY1B
	MkhLuw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4astjgghmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 09:08:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5B298DXK011034
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Dec 2025 09:08:13 GMT
Received: from [10.253.33.57] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Dec
 2025 01:08:10 -0800
Message-ID: <c87533fc-768d-4b70-a1aa-2639e5329058@quicinc.com>
Date: Tue, 2 Dec 2025 17:08:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail
 when BT_EN is pulled up by hw
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <marcel@holtmann.org>, <luiz.dentz@gmail.com>,
        <linux-bluetooth@vger.kernel.org>, <stable@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_chejiang@quicinc.com>
References: <20250916140259.400285-1-quic_shuaz@quicinc.com>
 <vipw44g3fmaf7yhv5xtaf74zbgbkwhjgyjtguwdxgkkk7pimy6@eauo3cuq3bgi>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <vipw44g3fmaf7yhv5xtaf74zbgbkwhjgyjtguwdxgkkk7pimy6@eauo3cuq3bgi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tZa3bruylkalXlBwIqqB8uBoMBfXC_TU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA3MiBTYWx0ZWRfX3eeuqVmk0Tq+
 RGP4MlQGoi8/t24pxrRoTjPgRcl9tkFPehKAd8+VPOBHxTXCzU586aYqip30FgPqM8QhAOa4c/c
 acMv0fivZUmqGcxqs9Uh357b9l3l5kHSYC7+5IH6TkuFeDDFiet5p3BzFCZ9mvHl3UOnot79en7
 TjcWMR3nFMQITRSeTVU8IhfmjnYhFlT/1/3bGCWR2TMNq5af8564k/YU2zZmY3g292dfW3vWDzh
 6LU2RInrBvTzZvjb9hb6ajJZNpm9ZgVc9ZcZYX6RxRv6FvE8NRQS89I8OqFUK5TfgXgKBlo7J9V
 Z2h2eoBHoFlPVPXeitLo4gXbKtdSAtllwynsIhJs6jMjtU/rI6kPiN7WC0oswwHP1i4WpVsozy+
 vFSS4w7P57c6LgzpeM7BGJnASUO16g==
X-Proofpoint-GUID: tZa3bruylkalXlBwIqqB8uBoMBfXC_TU
X-Authority-Analysis: v=2.4 cv=EbfFgfmC c=1 sm=1 tr=0 ts=692eac7e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=LaSrL2c6wsq51TUUjVQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020072

Hi Luiz

On 9/16/2025 11:01 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 16, 2025 at 10:02:59PM +0800, Shuai Zhang wrote:
>> On QCS9075 and QCA8275 platforms, the BT_EN pin is always pulled up by hw
>> and cannot be controlled by the host. As a result, in case of a firmware
>> crash, the host cannot trigger a cold reset. Instead, the BT controller
>> performs a warm restart on its own, without reloading the firmware.
>>
>> This leads to the controller remaining in IBS_WAKE state, while the host
>> expects it to be in sleep mode. The mismatch causes HCI reset commands
>> to time out. Additionally, the driver does not clear internal flags
>> QCA_SSR_TRIGGERED and QCA_IBS_DISABLED, which blocks the reset sequence.
>> If the SSR duration exceeds 2 seconds, the host may enter TX sleep mode
>> due to tx_idle_timeout, further preventing recovery. Also, memcoredump_flag
>> is not cleared, so only the first SSR generates a coredump.
>>
>> Tell driver that BT controller has undergone a proper restart sequence:
>>
>> - Clear QCA_SSR_TRIGGERED and QCA_IBS_DISABLED flags after SSR.
>> - Add a 50ms delay to allow the controller to complete its warm reset.
>> - Reset tx_idle_timer to prevent the host from entering TX sleep mode.
>> - Clear memcoredump_flag to allow multiple coredump captures.
>>
>> Apply these steps only when HCI_QUIRK_NON_PERSISTENT_SETUP is not set,
>> which indicates that BT_EN is defined in DTS and cannot be toggled.
>>
>> Refer to the comment in include/net/bluetooth/hci.h for details on
>> HCI_QUIRK_NON_PERSISTENT_SETUP.
>>
>> Changes in v12:
>> - Rewrote commit to clarify the actual issue and affected platforms.
>> - Used imperative language to describe the fix.
>> - Explained the role of HCI_QUIRK_NON_PERSISTENT_SETUP.
> 
> I'll leave having the changelog inside the commit message to the
> maintainer's discretion.
> 
> Otherwise:
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 

I noticed that this upstream patch has already been reviewed,
but it still seems not to have been accepted. Is there anything else I need to do?

> 
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>  drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
> 

Thanks,
Shuai

