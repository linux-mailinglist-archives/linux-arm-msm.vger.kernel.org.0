Return-Path: <linux-arm-msm+bounces-37083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE5D9BD482
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 19:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AEA2283CC7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 18:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E271E7C14;
	Tue,  5 Nov 2024 18:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nx5SRhkF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518B913D52E;
	Tue,  5 Nov 2024 18:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730831208; cv=none; b=mz0jpZYvRpK5qhq+JlmSFt8d//YEFbhzlNZtFMyTDEjho4QAnMZ4cfdnnP/RpBOaRmJ9fUm1arqmQCNEyLjvdmQ1cQrGQVHt1qAhvDt04HrmHXLZkRC3qry1FLwpfoqwkme+kUgqDG7kh8+aeYhBr1zt4yUArhXvm5+O0H+8EuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730831208; c=relaxed/simple;
	bh=s/ok7RlS+mJErotsBPLDnqKuqlF7QgE2zIdrVnxWRRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SDdGzlWLhbxAhASJUAH2r6J0pGjkt+UiZfcuX2Ehq5Ok1ZsDd2Y3IMvF2p699Pt/893Tr+GVEY8C2GX5iKFCMpuVXi8MWeGn4/4GmzG9p1xZT0VWDa+h+mGNcBMl9G2O2ld8enk+PYaJEnLgFGxdlA0lZusoeB8ZhXT5b+7EJc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nx5SRhkF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5A8wTc003865;
	Tue, 5 Nov 2024 18:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xefulTTXNRavMjEchFOC6totxRXlXOU4zZbuthZpiA=; b=Nx5SRhkFqznu/ODy
	K3zO/7+/p67J3fP659JcvD8sOIScx3KhSXUevFIUhXy1Fm880ndARvy1/wLnvWeJ
	8EqA1ZVSd2eAZHD9p14H1cPfWqUedN1/Q+PstsNS7GEKgnq9xVjxUCnYaDKWVHG4
	2A7Gq5mwKOmTjCRudLHQiLODnqat6GIrhaZRMh3dNTVg1sWqh8Z0hfrDvS/oi36d
	XFDEK7WQLNoGER2YcsFkJAWqzR7FAqUlr7HYLH2yyTyOBQfRLPdjniaLccoqgqg0
	RjLfnY8F5ikkSU6tQYJJhrFRVKkgh6Ax3cqiUm/4sthMo76juxaIp/4prxXiefO4
	SExhjg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qhbu9e4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 18:26:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5IQfiM013834
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 18:26:41 GMT
Received: from [10.71.76.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 5 Nov 2024
 10:26:41 -0800
Message-ID: <730a6e17-04f5-41b5-a0d8-7220b8c59b58@quicinc.com>
Date: Tue, 5 Nov 2024 10:26:40 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qrtr/mhi: NULL-deref with in-kernel pd-mapper
To: Johan Hovold <johan@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Krishna chaitanya chundru
	<quic_krichai@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <ZyTtVdkCCES0lkl4@hovoldconsulting.com>
 <da2bc665-5010-4d92-b9ac-7c442859cd10@quicinc.com>
 <ZymoMlSCQQScpRIZ@hovoldconsulting.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <ZymoMlSCQQScpRIZ@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: I8u5i-N1nqLVPWuf85eRaaSfDqTqU5P6
X-Proofpoint-GUID: I8u5i-N1nqLVPWuf85eRaaSfDqTqU5P6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=874 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050142



On 11/4/2024 9:08 PM, Johan Hovold wrote:
> On Mon, Nov 04, 2024 at 04:26:15PM -0800, Chris Lew wrote:
>> On 11/1/2024 8:01 AM, Johan Hovold wrote:
> 
>>> [    8.825593] Unable to handle kernel NULL pointer dereference at virtual
>>> address 0000000000000034
>>> .
> 
>>> [    9.002030] CPU: 10 UID: 0 PID: 11 Comm: kworker/u48:0 Not tainted 6.12.0-rc5 #4
>>> [    9.029550] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
>>> [    9.029552] Workqueue: qrtr_ns_handler qrtr_ns_worker [qrtr]
>>> [    9.061350] pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>>> [    9.061353] pc : mhi_gen_tre+0x44/0x224 [mhi]
>>> [    9.106931] lr : mhi_gen_tre+0x40/0x224 [mhi]
>>> [    9.106934] sp : ffff8000800fb7d0
>>> [    9.106935] x29: ffff8000800fb7d0 x28: ffff6db7852bd000 x27: ffff800082490188
>>> [    9.120382] dwc3 a000000.usb: Adding to iommu group 5
>>> [    9.133750]
>>> [    9.133752] x26: 0000000000000000 x25: ffff6db783e65080 x24: ffff80008248ff88
>>> [    9.133754] x23: 0000000000000000 x22: ffff80008248ff80 x21: ffff8000800fb890
>>> [    9.133756] x20: 0000000000000000 x19: 0000000000000002 x18: 000000000005cf20
>>> [    9.133758] x17: 0000000000000028 x16: 0000000000000000
>>> [    9.172738]  x15: ffffa5834131fbd0
>>> [    9.172741] x14: ffffa5834137caf0 x13: 000000000000ce30 x12: ffff6db7808bc028
>>> [    9.172743] x11: ffffa58341993000 x10: 0000000000000000 x9 : 00000000cf3f2b90
>>> [    9.172745] x8 : 0000000094e5072b x7 : 00000000000404ce x6 : ffffa5834162cfb0
>>> [    9.172747] x5 : 000000000000008b x4 : ffffa583419cddf0 x3 : 0000000000000007
>>> [    9.172750] x2 : 0000000000000000
>>> [    9.192697]  x1 : 000000000000000a x0 : ffff6db7808bb700
>>> [    9.192700] Call trace:
>>> [    9.192701]  mhi_gen_tre+0x44/0x224 [mhi]
>>> [    9.192704]  mhi_queue+0x74/0x194 [mhi]
>>> [    9.192706]  mhi_queue_skb+0x5c/0x8c [mhi]
>>> [    9.210985]  qcom_mhi_qrtr_send+0x6c/0x160 [qrtr_mhi]
>>> [    9.210989]  qrtr_node_enqueue+0xd0/0x4a0 [qrtr]
>>> [    9.210992]  qrtr_bcast_enqueue+0x78/0xe8 [qrtr]
>>> [    9.225530]  qrtr_sendmsg+0x15c/0x33c [qrtr]
>>> [    9.225532]  sock_sendmsg+0xc0/0xec
>>> [    9.240436]  kernel_sendmsg+0x30/0x40
>>> [    9.240438]  service_announce_new+0xbc/0x1c4 [qrtr]
>>> [    9.240440]  qrtr_ns_worker+0x714/0x794 [qrtr]
>>> [    9.240441]  process_one_work+0x210/0x614
>>> [    9.254527]  worker_thread+0x23c/0x378
>>> [    9.254529]  kthread+0x124/0x128
>>> [    9.254531]  ret_from_fork+0x10/0x20
>>> [    9.254534] Code: aa0003f9 aa1b03e0 94001a4d f9401b14 (3940d280)
>>> [    9.267369] ---[ end trace 0000000000000000 ]---
>>> [    9.267371] Kernel panic - not syncing: Oops: Fatal exception in interrupt
>>
>> Thanks for reporting this.
> 
> Thanks for taking a look, Chris.
> 
>> I'm not sure the in-kernel pd-mapper should be affecting this path. I
>> think this is for WLAN since it is the mhi qrtr and I'm not aware of
>> WLAN needing to listen to the pd-mapper framework.
> 
> This function is called for both the WWAN and WLAN on this machine, and
> it seems like the modem is typically probed first and around the time
> when I saw the NULL-deref.
> 
> [    8.802728] mhi-pci-generic 0005:01:00.0: mhi_gen_tre - buf_info = ffff800080d75000, offsetof(buf_info->used) = 0x34
> ...
> [    9.980638] ath12k_pci 0004:01:00.0: mhi_gen_tre - buf_info = ffff800081d35000, offsetof(buf_info->used) = 0x34
>   
>> The offset seems to be mapped back to
>> linux/drivers/bus/mhi/host/main.c:1220, I had some extra debug configs
>> enabled so not sure the offset is still valid.
>>
>> 	WARN_ON(buf_info->used);
>> 	buf_info->pre_mapped = info->pre_mapped;
>>
>> This looks like the null pointer would happen if qrtr tried to send
>> before mhi_channel_prepare() is called.
> 
> I didn't look closely at the code, but I can confirm that the offset of
> buf_info->used is indeed 0x34, which could indicate that it's the
> 
> 	buf_info = buf_ring->wp;
> 
> pointer that was NULL.
> 
>> I think we have a patch that might fix this, let me dig it up and send
>> it out.
> 
> Would that patch still help?
> 
> 	https://lore.kernel.org/lkml/20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com/
>

Yea this is the exact patch I had in mind, didnt realize the patch was 
already sent a while back.

> I naively tried adding a sleep after registering the endpoint, but that
> is at least not sufficient to trigger the NULL-deref.
> 

Looking at the callstack, this is broadcasting a NEW_SERVER notification 
from qrtr_ns. I think you can force this by starting and stopping some 
qmi service with the added sleep. Do you have tqftpserv or diag-router 
in your environment? Those will open qmi services, so starting and 
stopping those will cause the new_server broadcast in qrtr_ns.

> Johan

