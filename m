Return-Path: <linux-arm-msm+bounces-73550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC6CB5773C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 900C244318C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B2A2FD1D9;
	Mon, 15 Sep 2025 10:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m6CINBJN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDA2FE590;
	Mon, 15 Sep 2025 10:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757933392; cv=none; b=GQI1hJkfob29skBpXOdpef7O9bOfvdGenXXa59/MVaWJo5az7q+NjpraGJ++REm8PbYfYeYQ3rmVefwMwdsbLINYaIy9pKOZg0wjsReTl7od+JU732onfTByOHzTHaslQ3TcOCysTaaBn0sAhhqUc2RMJAuxi/gApR9SAfNKjXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757933392; c=relaxed/simple;
	bh=R05ROGazlXJ42KmryzhFUXmAwUuWWtCbn9ju0VtLFBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AZHESYkdVB8YIt3bEr/bzUsQ3a0LO9Snc898sDP52eF9Dhz/0EpeR5rwdxYj2NwkMwsPeLvH+dnAxrKO9aIcXU5MsHR6DniwDYAqWaAlw36bwdfkaj4pqXyTl8VI/BGJ3tg+eFL4uQcoGlXsUxD24fQCJy2QyJHDsis/f51w0Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m6CINBJN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FlUB005788;
	Mon, 15 Sep 2025 10:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HHGInZc+ZRc624QBF+o24+dBaQgC5aqIAyZRer1zD8s=; b=m6CINBJNAiwUNixR
	Pr+/zPX2RQwh1GB263plfgspEfZO6Wq7dI/aLQktlPa6ZM9dwV9ENbNsni2zfJ+e
	nwSrp0TARcd9vYpXMxmkD6AogTkjbd/cCa0ozN9DqtghoLZ3DbSeKVXSdyzc99mL
	q1MK9LeE4MO167mwIhsHp1s2kkaCO5orWbhIzsDxIFNentZXJKIYIcaml2n21ni5
	sT4qlw4bBJ/+d/yEmE6bk+0fkYrhkTR4We0GjpDTlLJH/Zcf+I2EZInbSt9Q/CxU
	oKF6hvIHZV6WpclpwkzIfilsShJbNngbzEpUHHDe1k02JaXPGZE2m/8t/DgxLEs1
	U92n5g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snmekg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:49:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58FAnl8g010624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:49:47 GMT
Received: from [10.217.218.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 15 Sep
 2025 03:49:45 -0700
Message-ID: <cc4432ff-a8cc-4235-bd1e-29a22929aec5@quicinc.com>
Date: Mon, 15 Sep 2025 16:19:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        <Vivek.Pernamitta@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
 <20250912-uevent_vdev_next-20250911-v4-2-fa2f6ccd301b@quicinc.com>
 <65df50b9-0bdf-4a62-ae1f-d0bb550ff406@oss.qualcomm.com>
Content-Language: en-US
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
In-Reply-To: <65df50b9-0bdf-4a62-ae1f-d0bb550ff406@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c7ef4c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Su0R0xCKNgINluJRNn0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JYME87k6jZj6WBAujzlM01YCxHB1NYeb
X-Proofpoint-GUID: JYME87k6jZj6WBAujzlM01YCxHB1NYeb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX+giX9WlPjEa4
 eZiIOrwH+TMITzKe9I3ygzzHuefSF/j+mErC5kDan+1wuF2CAQi4tpa5zqvPRmjgq6xnRn70diz
 jUZShwGI3wwGIAzyF++/cP5S+/AgPmLuaebm8X/qBwhrif2GlujLebW73nVXsc6KsqOoEgskr3O
 GOX6H0CzZRt5AeaHKsOBhcNOHEO43H0J+9YbxLrhUB1KEzF+8W91MMH4LLZY/Ftiqu5eyj5DfKQ
 jxvsHFS4eLSaqZaREsAAA3ohIDRbNSPXG8QxHR2d2rJBi2YyZFMYKZXIrRR+hPfeG4hesKJS3tQ
 T6U26lFlWL9NcERi4RktUQ5OhWTJboWTtarCJKKwthUPwZBNnBQ+veZBYD3fkqPuxW0yJgN+tnY
 mbavvsia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040



On 9/15/2025 2:22 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 9/12/2025 6:18 PM, Vivek.Pernamitta@quicinc.com wrote:
>> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>
>> In SR-IOV enabled devices, reading the VF DEVICE/VENDOR ID register
>> returns `FFFFh`, as specified in section 3.4.1.1 of the PCIe SR-IOV spec.
>> To accurately determine device activity, read the PCIe VENDOR_ID of
>> the Physical Function (PF) insteadcommit text and subject needs to be 
>> modified to reflect new changes
> 
>> Health check monitoring for Virtual Functions (VFs) has been disabled,
>> since VFs are not physical functions and lack direct hardware control.
>> This change prevents unnecessary CPU cycles from being consumed by VF
>> health checks, which are both unintended and non-functional.
>>
>> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
>> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/pci_generic.c | 34 +++++++++++++++++++++++ 
>> +----------
>>   1 file changed, 24 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/ 
>> host/pci_generic.c
>> index 
>> 8a605cb3b8e1e54ef4e699700f3f2660ad5cb093..6fa16975e320212a50e0b68ddb34db5ce711589c 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -1082,7 +1082,7 @@ static bool mhi_pci_is_alive(struct 
>> mhi_controller *mhi_cntrl)
>>       struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>>       u16 vendor = 0;
>> -    if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
>> +    if (pci_read_config_word(pci_physfn(pdev), PCI_VENDOR_ID, &vendor))
> As you are invoking only for physical functions pci_physfn is not needed.
> 
> - Krishna Chaitanya
pci_physfn(pdev) was intentionally kept as this can be called for VF's
in error handle path. >>           return false;
>>       if (vendor == (u16) ~0 || vendor == 0)
>> @@ -1193,7 +1193,9 @@ static void mhi_pci_recovery_work(struct 
>> work_struct *work)
>>       dev_warn(&pdev->dev, "device recovery started\n");
>> -    timer_delete(&mhi_pdev->health_check_timer);
>> +    if (pdev->is_physfn)
>> +        timer_delete(&mhi_pdev->health_check_timer);
>> +
>>       pm_runtime_forbid(&pdev->dev);
>>       /* Clean up MHI state */
>> @@ -1220,7 +1222,10 @@ static void mhi_pci_recovery_work(struct 
>> work_struct *work)
>>       dev_dbg(&pdev->dev, "Recovery completed\n");
>>       set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
>> -    mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>> HEALTH_CHECK_PERIOD);
>> +
>> +    if (pdev->is_physfn)
>> +        mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>> HEALTH_CHECK_PERIOD);
>> +
>>       return;
>>   err_unprepare:
>> @@ -1307,7 +1312,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, 
>> const struct pci_device_id *id)
>>       else
>>           mhi_cntrl_config = info->config;
>> -    timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
>> +    /* Initialize health check monitor only for Physical functions */
>> +    if (pdev->is_physfn)
>> +        timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
>>       mhi_cntrl = &mhi_pdev->mhi_cntrl;
>> @@ -1371,7 +1378,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, 
>> const struct pci_device_id *id)
>>       set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
>>       /* start health check */
>> -    mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>> HEALTH_CHECK_PERIOD);
>> +    if (pdev->is_physfn)
>> +        mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>> HEALTH_CHECK_PERIOD);
>>       /* Allow runtime suspend only if both PME from D3Hot and M3 are 
>> supported */
>>       if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
>> @@ -1396,7 +1404,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>>       struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>>       struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>> -    timer_delete_sync(&mhi_pdev->health_check_timer);
>> +    if (pdev->is_physfn)
>> +        timer_delete_sync(&mhi_pdev->health_check_timer);
>>       cancel_work_sync(&mhi_pdev->recovery_work);
>>       if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>> @@ -1424,7 +1433,8 @@ static void mhi_pci_reset_prepare(struct pci_dev 
>> *pdev)
>>       dev_info(&pdev->dev, "reset\n");
>> -    timer_delete(&mhi_pdev->health_check_timer);
>> +    if (pdev->is_physfn)
>> +        timer_delete(&mhi_pdev->health_check_timer);
>>       /* Clean up MHI state */
>>       if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>> @@ -1469,7 +1479,8 @@ static void mhi_pci_reset_done(struct pci_dev 
>> *pdev)
>>       }
>>       set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
>> -    mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>> HEALTH_CHECK_PERIOD);
>> +    if (pdev->is_physfn)
>> +        mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>> HEALTH_CHECK_PERIOD);
>>   }
>>   static pci_ers_result_t mhi_pci_error_detected(struct pci_dev *pdev,
>> @@ -1534,7 +1545,9 @@ static int  __maybe_unused 
>> mhi_pci_runtime_suspend(struct device *dev)
>>       if (test_and_set_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
>>           return 0;
>> -    timer_delete(&mhi_pdev->health_check_timer);
>> +    if (pdev->is_physfn)
>> +        timer_delete(&mhi_pdev->health_check_timer);
>> +
>>       cancel_work_sync(&mhi_pdev->recovery_work);
>>       if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
>> @@ -1585,7 +1598,8 @@ static int __maybe_unused 
>> mhi_pci_runtime_resume(struct device *dev)
>>       }
>>       /* Resume health check */
>> -    mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>> HEALTH_CHECK_PERIOD);
>> +    if (pdev->is_physfn)
>> +        mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>> HEALTH_CHECK_PERIOD);
>>       /* It can be a remote wakeup (no mhi runtime_get), update access 
>> time */
>>       pm_runtime_mark_last_busy(dev);
>>


