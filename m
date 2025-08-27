Return-Path: <linux-arm-msm+bounces-70997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 618EEB37F48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 11:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DCA11BA050C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 09:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A39A2989B7;
	Wed, 27 Aug 2025 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dQPiMU8Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3639A1C860B;
	Wed, 27 Aug 2025 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756288402; cv=none; b=LHpCjzr/Zjy5ryZ7+BUcHyJwjyiiEIjAcWQYcTExiP7zbIeLxqFTlm1u0VLXp0P024OC0NF3NU9yj4QiG+erUCHe3M5thR7M3pm/xJxLSOiretELZ/RS5w6FvTNhOQNGNd6iV+96u9rn8zL7p5uRN4K7VcRqzH9chkVqN2IpsVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756288402; c=relaxed/simple;
	bh=7sVcKF4AROiwpWD1l41btsSBL9LB3+nnO2RYSFWrg+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=vDEqSa6LvT+dWr358rd66oIn/P1Z55x0FJCiQsEKMiPqxRy10sayri3r5iWPaNzBXC3MMd1/nnLtfa6iSbeYdWxPxoVA1D2WmeKGzEn93AbCbCs6PR4JmsO37FRBR6rMwejyMJ9lly2LjMY+OgtI/a5SzV51eHjiJGHXLD0K1yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dQPiMU8Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kIZd018296;
	Wed, 27 Aug 2025 09:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZIbExHsciWioxWDa+f42vmJUtPJWpvRrEBtHlmYYKI=; b=dQPiMU8Z8nsM7op3
	/CGk7kgGVCwrXDBLOx2cz5M6eYkZyvMqmRPZJmHywnc+j62QE5LtrkX0QS/v9yb0
	upBrJF4hljZA8FdS5EdQpXLMUM2+KuOuqYTi40I72zFJa1f7JManQbk6fMkZqoBD
	RVzZ+ybUaVu8aWzdsXCC/0r1UmKH6ZiXHoVsIS4Rk5EncWe4kIxEIdCz1Whb7QMt
	SK/wIV/pnJmbgrQqyH0qOfK1x1QqAxToUs8ZdcKET45SWGIDVTn0cYvHeOJb5HvT
	E6s7CKyMGX5DqngXXhpc7/oEvz1M1LsqO6p/icqYxjP8MdEq+ndwgeAP+u++/b9G
	N+CUBQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfm7wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 09:53:16 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57R9rFnS016130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 09:53:15 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 27 Aug
 2025 02:53:13 -0700
Message-ID: <5a6a866e-3fbc-473d-bfcb-89c1e421ca32@quicinc.com>
Date: Wed, 27 Aug 2025 17:53:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail
 when BT_EN is pulled up by hw
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <marcel@holtmann.org>, <luiz.dentz@gmail.com>,
        <linux-bluetooth@vger.kernel.org>, <stable@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_chejiang@quicinc.com>
References: <20250825113858.4017780-1-quic_shuaz@quicinc.com>
 <lpndrvnjklmqglg22y7fnfeeyrp6odoedixosjc4n2jygeq4ve@ootpynfw5zvs>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <lpndrvnjklmqglg22y7fnfeeyrp6odoedixosjc4n2jygeq4ve@ootpynfw5zvs>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX+WXQmZxZtqWD
 EsuBiWQYuJ+H8C2STpew7/WllE0l7caUlFKr3SrSq2GVxhxsc0ctUMZUJvpsPkU9Q7NR7w2qEmL
 AmCdpVXMsFTiKr5jJGHtCO12am0FqOsCoTGaYM1qQ51pSyfwk2tLHJGiv7WWCwJk4OA5M6mdnod
 1FSHCPCkkmE8qeTqLAtcadTIKdSfxJs1khrB2H0p8AGzeb4hhZ1AerjRija15biENdQLgx1hWh8
 t88lyfOXMTtT2OtXVxoAFw28aAHIuzDCAPCG2GDQPERhi8rHX4XB1R+ch3ZbgJVrg195rd62kaB
 omsMEI7PsXFwrws+n9ByQ0tvUM+teEJm5lef+o4YloSN6UEZVKbSCtHxjEFSK8WAD+YCI206xd8
 7Y/Zk3H0
X-Proofpoint-GUID: 7K-H_sY4hQBXVBOLfvcX9Ji3y_MxNWwX
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68aed58c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=El_LN6rTkaQ4Hq6paT0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7K-H_sY4hQBXVBOLfvcX9Ji3y_MxNWwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Hi,Dmitry 

On 8/27/2025 9:57 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 07:38:58PM +0800, Shuai Zhang wrote:
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
>> the comment in `include/net/bluetooth/hci.h`.
>>
>> The HCI_QUIRK_NON_PERSISTENT_SETUP quirk is associated with BT_EN,
>> and its presence can be used to determine whether BT_EN is defined in DTS.
>>
>> After SSR, host will not download the firmware, causing
>> controller to remain in the IBS_WAKE state. Host needs
>> to synchronize with the controller to maintain proper operation.
>>
>> Multiple triggers of SSR only first generate coredump file,
>> due to memcoredump_flag no clear.
>>
>> add clear coredump flag when ssr completed.
>>
>> When the SSR duration exceeds 2 seconds, it triggers
>> host tx_idle_timeout, which sets host TX state to sleep. due to the
>> hardware pulling up bt_en, the firmware is not downloaded after the SSR.
>> As a result, the controller does not enter sleep mode. Consequently,
>> when the host sends a command afterward, it sends 0xFD to the controller,
>> but the controller does not respond, leading to a command timeout.
>>
>> So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sleep mode.
>>
>> ---
>> Changs since v8-v9:
>> -- Update base patch to latest patch.
>> -- add Cc stable@vger.kernel.org on signed-of.
>>
>> Changes since v6-7:
>> - Merge the changes into a single patch.
>> - Update commit.
>>
>> Changes since v1-5:
>> - Add an explanation for HCI_QUIRK_NON_PERSISTENT_SETUP.
>> - Add commments for msleep(50).
>> - Update format and commit.
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> Cc: stable@vger.kernel.org
>> ---
>>  drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
> 
>> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
> 
> Please. Stop. I've asked several times to make sure that your patch
> builds. It still doesn't. You are still using some older kernel version
> as your baseline. This patch won't build even on released 6.16 (which is
> already too old for development).`
> 
> So... Please find somebody next to you who can do that.

I finally understand. I have modified test_bit, 
and I sincerely thank you for your repeated friendly reminders.

> 
>> +		/*
>> +		 * When the SSR (SubSystem Restart) duration exceeds 2 seconds,
>> +		 * it triggers host tx_idle_delay, which sets host TX state
>> +		 * to sleep. Reset tx_idle_timer after SSR to prevent
>> +		 * host enter TX IBS_Sleep mode.
>> +		 */
>> +		mod_timer(&qca->tx_idle_timer, jiffies +
>> +				  msecs_to_jiffies(qca->tx_idle_delay));
>> +
>> +		/* Controller reset completion time is 50ms */
>> +		msleep(50);
>> +
>> +		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>> +		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>> +
>> +		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
>> +		qca->memdump_state = QCA_MEMDUMP_IDLE;
>> +	}
>> +
>>  	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>>  }
>>  
>> -- 
>> 2.34.1
>>
> 
BR,
Shuai


