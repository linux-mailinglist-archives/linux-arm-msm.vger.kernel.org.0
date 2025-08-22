Return-Path: <linux-arm-msm+bounces-70420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBD3B317A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 14:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFF31B04359
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0366A27B342;
	Fri, 22 Aug 2025 12:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="omft19qL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE9085626;
	Fri, 22 Aug 2025 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755865208; cv=none; b=nkstzO38VTbSe9ZITwl2kXGBOlMBoznA+gAYNL1Xrn70jf651u+oJNoP265AM5NFukRG2pdRJULUKKP3U3vgLy4omKED73QP7Sl/UwPTlK93r9qDiF5KS/yVFfHCNIECtEWeI3J7fEO2H5Mf5mSO0KodLqFxxVuZLTivlkERKvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755865208; c=relaxed/simple;
	bh=hJtmogWejzPBGIgT73xJbEcUNNHBkvTUj3pYFBp2Brc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bZnOg9BtaWk6oZZ/ps26GU22YwfkW+C4BvTi0bTqhcR+1tLRaNNSt95VF6eggRRN2J81wXFwaC/rUoXEGm2YTdnAG9XFn9tMu3caGqgWj7hLeQhH6zDbrnzCwDqoxd5OQQVDvbRkYROLM6lDA3A6biRYNtucTbZAQqSjpzOW6Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=omft19qL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UMNq011127;
	Fri, 22 Aug 2025 12:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I9uo9w8Jo2VoJBgJfO+lHZL5jfKDnF+vxGnFHHo9ZvM=; b=omft19qL7MLo6ZYl
	IP6EiivQ+OHa5SFZIFLmP2u8KDmnWkqGdG2jrm7pOGRrzHb3MqbJQkZCNCwjXklT
	a0x7J77Ip2shXhiVKWx9jMDH8d4PFe7cORg927QVZMyx6IE6fXDCJegGyAd4sLbu
	Lpo6v9unAGzI80/Al6iIdIlhmnb0kzYWoq09E0fYwlZxMmhLqr4lGfJhY0GogFhh
	Xnb6DjRX1YHs9dASrTrGRYjFJNEOmUVLz4zRmpJMHU50Lg5+EXkNYyRz+Rqj2dFl
	DxSLaKU46Lw/hhGKIHhFH8FDK/roYeX51+BHk+snX5ods4Z5D+Zn/MVvYv3NXpu4
	lNB7EA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8eyfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 12:20:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57MCK3MI027060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 12:20:05 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 22 Aug
 2025 05:20:02 -0700
Message-ID: <92bf3deb-5254-4196-835d-0ae0cfc7abf0@quicinc.com>
Date: Fri, 22 Aug 2025 20:19:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] Bluetooth: Fix SSR (SubSystem Restart) fail when BT_EN
 is pulled up by hw
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bt@quicinc.com>
References: <20250821121627.2727387-1-quic_shuaz@quicinc.com>
 <qirclgwbh556rgkqbejs6nbkbv737n57cgmzgh666ginspya7e@mzacv4crszph>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <qirclgwbh556rgkqbejs6nbkbv737n57cgmzgh666ginspya7e@mzacv4crszph>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX0/+zawiuxg9P
 Bs6TbnKMdSEkzbJQJvitX+ruOG6WWsiF5sW/bnUvSYW2tW72k+Q1tvMGe3N+T7Lcib908xzyWOY
 buUPgpky3GNuqfaw9jZr5aCCpnRSSATnJKMfmYpE6fZ6uYzaeFK7/sLITUwC1zm0VqQxiVX8rGb
 z+lgyrT5llykzCYldzVKTKWBn/BzypclFWlebkH8WSic6hXNSC17anpB//2k/sVtVm021blAN9+
 wKTS5LWw+A3xrsiPF6lyf5PmfbREh1JnD2K3hZG9krBJXaurLsPqyWte7K5qNP6qVG01yMS00Hj
 dGpYOQ9yGFNb0k3GgwjB3xwIBiUL6mEfrIlkI/KSrsojXMiF0ItbjyvYMySixtNbG19/q7r7goF
 8DLLBVr+YVKfWYcilsWRr6ipWZ3CZQ==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a86076 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=gcvUCFCFqjsdz4c4z_IA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eckYJ_AlJJ15FKk8zf-sYABwwquMr4tb
X-Proofpoint-ORIG-GUID: eckYJ_AlJJ15FKk8zf-sYABwwquMr4tb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

Hi, Dmitry

On 8/22/2025 7:44 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 21, 2025 at 08:16:26PM +0800, Shuai Zhang wrote:
>> When the host actively triggers SSR and collects coredump data,
>> the Bluetooth stack sends a reset command to the controller. However, due
>> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
>> the reset command times out.
> 
> [...]
> 
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>  drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
> 
> Missing changelog between versions.
> 

I will update>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 4e56782b0..9dc59b002 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1653,6 +1653,39 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>  		skb_queue_purge(&qca->rx_memdump_q);
>>  	}
>>  
>> +	/*
>> +	 * If the BT chip's bt_en pin is connected to a 3.3V power supply via
>> +	 * hardware and always stays high, driver cannot control the bt_en pin.
>> +	 * As a result, during SSR (SubSystem Restart), QCA_SSR_TRIGGERED and
>> +	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
>> +	 * command timeout.
>> +	 * Add an msleep delay to ensure controller completes the SSR process.
>> +	 *
>> +	 * Host will not download the firmware after SSR, controller to remain
>> +	 * in the IBS_WAKE state, and the host needs to synchronize with it
>> +	 *
>> +	 * Since the bluetooth chip has been reset, clear the memdump state.
>> +	 */
>> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
> 
> And it didn't improve...
Sorry, Due to my oversight, I mistakenly resent v6. 
I will apply the modifications and update to v8.


BR,
Shuai> 
> 


