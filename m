Return-Path: <linux-arm-msm+bounces-73566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B1BB577E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87364188686F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 11:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AE8231A23;
	Mon, 15 Sep 2025 11:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kIeRABbB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1B918A6CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 11:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757935069; cv=none; b=lxRXRtTRZuOprFDryfFfqYVLDCb9nnK/tain0IkGiqJrTVdzdTsAb8Tm+VZAOvIO6cgMb+RmW5W07YtXl1WZ1/Kzymazr/MumZy9/3KN4BinLFxThWKQcAyoirlPsJeInOW3nAWUailExazV3kaslz3F7nRG15C/ss0JyXl/vag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757935069; c=relaxed/simple;
	bh=71bMiAl7CAgH/M4vipyNptFYI030I6e1Dq3/ig86WgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ff+PLjkul2tTcfw1YinV1X2wK0iAWlq+kHCQ4+ZVZxJ16JYFKMqQ+y9+JimlgHkmuMHf98im7O2P1Ewb5Wrp41GXvgDjcMZpY2BbOSB/qG9h/7faExJ+jfjdzW7crpOIlYwqeQQEdczcu6RVjAlS5RjhV02cNFOvPufrHzOyOos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kIeRABbB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8G6YR006528
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 11:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jy892EqGwPn3IN8rwKUVFD/H96a+kK6WMUJ8xv68o70=; b=kIeRABbBHtTm2W2/
	B55OSR6/TdbUQ5LkpOnO3C7DRet1R4FKplLjXp4j7D00jz4p9LEwy58dAASlG5tQ
	Go572+hJ3qfbj+NKAliXoZYncq6CJGJ/yR8mapcC5fjns8BYiM/JJZOPARhTXleT
	rfM5h4f6SM++c+nX53GZXEkldLKCAwvBf2UBLxO+K8BDguLaeRw7Ay5O8hA0l36+
	G3j/3KEwAYBK/fgO8kgR5u0oVxTR6oYIQfI6wkaYA4cYZgHJdRXUZd7naWN6Zty3
	ckAFhe23aIqUHC0y3lhVEan48kNjPZgHjBBJ2GWb75bfR3LV6OGdtW/xZjpwHPJb
	o8JoYA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chcmc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 11:17:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so3719994b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 04:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757935065; x=1758539865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jy892EqGwPn3IN8rwKUVFD/H96a+kK6WMUJ8xv68o70=;
        b=ZDipMvjH/W0cmtfxoVBHAYo9RJw5/wN5PxV3TM3Gs3kZ03HxAPsXvvXzw80cGJpOLS
         w76WQYJsuQV/mVxvnIOX0oGA8VTUbyDmsfzEXpOBPKtCLIiLYleDYQjtmSXDKKa/yEiM
         TBmzQxR6nHR/8vDezFJMdcOBscU5dPfDxYzTfL7H9xbjbuZ4HorYbJo1PzDXQ0SGGsvB
         UzQ3rzjnnibnR7dRO7sqJpngWiEa77wwOEXvodUWEuReKE1zefSMR4hYVo8A3oSQPzox
         aXL3krsJwVMi6TX2eNUaGFl7zgArEq11GsTu576AA3XPm/ss+zVnOP1JBt8DEeusgncf
         Dmwg==
X-Forwarded-Encrypted: i=1; AJvYcCXHOhIyWWJf0cX6xf/WvxPGzdXGwCDHyP7IY8ElKqd7LAwsDAs6BucXT/bwm0zeazlI8fP0M5C9AB1ZtNtg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeo8wm5WoGdr2a1a8829lzNGz3TtADsZRQ/ww/k1xAU5wReZYn
	EZ667wVM9KwXV5qd6TSc5ZcwI2nD17HYbeE4+zd2lkY9bJwOZsDOGpVCf3j+CP3uLmjuRjUenE2
	vtuN2ujA63DdVzDWSZBmw5wIyXhsDmrxhZ08PU/EBLzZlPINvg7yMfaigGCiciyncnsq3
X-Gm-Gg: ASbGnct31Z1kjDs/OJYkX5iiH6ftqLpUoS2Yd1sdqA5r/BOUePq6zBKsUrgVflc+BhR
	hhf0zWt7mYwLT7qI3bf7tzzuCs1i92FuoB6ENJ/7YyGjuJYS5WD6hnQbJfVIfk5y+zUzwPqVHYj
	fLVfSmV8364cScecpbM4is9AfHXS9wXfBvRj69lOMnFCInwrVU6ozHvG0VydaAw70qPhZVqgVBO
	4xtMRDOoygiFSOQYkknMfV7mUWYyK5sL6CHVPXDMIMvCGhbVmKt+TCjnglYGevuA6QIrd6rd2TO
	6YAVHPF8wZTzSu2IHY/tHraJbjVF7MMKJa4VJv7/HbVbl7f0QbwYrwql7TC+XQZYUEzAk/BACQ=
	=
X-Received: by 2002:a05:6a00:2ea9:b0:772:2db8:a9d8 with SMTP id d2e1a72fcca58-776121899f4mr13912769b3a.22.1757935065246;
        Mon, 15 Sep 2025 04:17:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBDerphtIvUBoK7TbFRsNL7Q6dHmzixeS2pxza9n0RK1QxgKET68malvP+DivSB/KuJublGg==
X-Received: by 2002:a05:6a00:2ea9:b0:772:2db8:a9d8 with SMTP id d2e1a72fcca58-776121899f4mr13912728b3a.22.1757935064742;
        Mon, 15 Sep 2025 04:17:44 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a4a24esm12796236b3a.40.2025.09.15.04.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 04:17:44 -0700 (PDT)
Message-ID: <0e18613c-f78f-42df-8c10-8fb1c7b5ff8d@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 16:47:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
To: Vivek Pernamitta <quic_vpernami@quicinc.com>, Vivek.Pernamitta@quicinc.com,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
 <20250912-uevent_vdev_next-20250911-v4-2-fa2f6ccd301b@quicinc.com>
 <65df50b9-0bdf-4a62-ae1f-d0bb550ff406@oss.qualcomm.com>
 <cc4432ff-a8cc-4235-bd1e-29a22929aec5@quicinc.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <cc4432ff-a8cc-4235-bd1e-29a22929aec5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c7f5da cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=_fyStHpBFfKUDAfVGVMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ulKRHOJmAxzmaz622ugsLwxbBpcE8_Ff
X-Proofpoint-GUID: ulKRHOJmAxzmaz622ugsLwxbBpcE8_Ff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfXy2ajAOqstN4J
 VNU0WtUkNzYTp/0Vf9UT+HSF+DiLXsNcvBhJtQR3BZ4akhlitxJA9l45AkUEV2qN3byJpJGYpi+
 uoypI56kow0xmJRwgUqRNpP/498k8VqkIj+1X5brefAKIEWUfBsX3hpC06/i9dlVvKaYfLwxd9z
 eT5ISdp9hIf6Uf3OybY/IBg2bQvJBcoGCzlbp0mdEBZ3lMDNDRLsQQ/gPBxMTS4j6jbhP7Q+BWT
 2jUcvPevaCzWQhmUJ9iLNF9ZHb3/oMI3KQi6kOBB8zp/HRSP7U0ePjsobI6P0iHcOFpHNcCDxuY
 H6AMZHzAi/+6wA6noFuKRdta5BPO2gQwKFXX/Txqak4Pp1OPpYt5tcu6pMuWtAL0pJ8cnuKOcFe
 pQG2uSdd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036



On 9/15/2025 4:19 PM, Vivek Pernamitta wrote:
> 
> 
> On 9/15/2025 2:22 PM, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 9/12/2025 6:18 PM, Vivek.Pernamitta@quicinc.com wrote:
>>> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>>
>>> In SR-IOV enabled devices, reading the VF DEVICE/VENDOR ID register
>>> returns `FFFFh`, as specified in section 3.4.1.1 of the PCIe SR-IOV 
>>> spec.
>>> To accurately determine device activity, read the PCIe VENDOR_ID of
>>> the Physical Function (PF) insteadcommit text and subject needs to be 
>>> modified to reflect new changes
>>
>>> Health check monitoring for Virtual Functions (VFs) has been disabled,
>>> since VFs are not physical functions and lack direct hardware control.
>>> This change prevents unnecessary CPU cycles from being consumed by VF
>>> health checks, which are both unintended and non-functional.
>>>
>>> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>> Reviewed-by: Krishna Chaitanya Chundru 
>>> <krishna.chundru@oss.qualcomm.com>
>>> ---
>>>   drivers/bus/mhi/host/pci_generic.c | 34 +++++++++++++++++++++++ 
>>> +----------
>>>   1 file changed, 24 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/ 
>>> host/pci_generic.c
>>> index 
>>> 8a605cb3b8e1e54ef4e699700f3f2660ad5cb093..6fa16975e320212a50e0b68ddb34db5ce711589c 100644
>>> --- a/drivers/bus/mhi/host/pci_generic.c
>>> +++ b/drivers/bus/mhi/host/pci_generic.c
>>> @@ -1082,7 +1082,7 @@ static bool mhi_pci_is_alive(struct 
>>> mhi_controller *mhi_cntrl)
>>>       struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>>>       u16 vendor = 0;
>>> -    if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
>>> +    if (pci_read_config_word(pci_physfn(pdev), PCI_VENDOR_ID, &vendor))
>> As you are invoking only for physical functions pci_physfn is not needed.
>>
>> - Krishna Chaitanya
> pci_physfn(pdev) was intentionally kept as this can be called for VF's
> in error handle path. >>           return false;
can you include that in the commit text.

- Krishna Chaitanya.
>>>       if (vendor == (u16) ~0 || vendor == 0)
>>> @@ -1193,7 +1193,9 @@ static void mhi_pci_recovery_work(struct 
>>> work_struct *work)
>>>       dev_warn(&pdev->dev, "device recovery started\n");
>>> -    timer_delete(&mhi_pdev->health_check_timer);
>>> +    if (pdev->is_physfn)
>>> +        timer_delete(&mhi_pdev->health_check_timer);
>>> +
>>>       pm_runtime_forbid(&pdev->dev);
>>>       /* Clean up MHI state */
>>> @@ -1220,7 +1222,10 @@ static void mhi_pci_recovery_work(struct 
>>> work_struct *work)
>>>       dev_dbg(&pdev->dev, "Recovery completed\n");
>>>       set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
>>> -    mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>>> HEALTH_CHECK_PERIOD);
>>> +
>>> +    if (pdev->is_physfn)
>>> +        mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>>> HEALTH_CHECK_PERIOD);
>>> +
>>>       return;
>>>   err_unprepare:
>>> @@ -1307,7 +1312,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, 
>>> const struct pci_device_id *id)
>>>       else
>>>           mhi_cntrl_config = info->config;
>>> -    timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
>>> +    /* Initialize health check monitor only for Physical functions */
>>> +    if (pdev->is_physfn)
>>> +        timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
>>>       mhi_cntrl = &mhi_pdev->mhi_cntrl;
>>> @@ -1371,7 +1378,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, 
>>> const struct pci_device_id *id)
>>>       set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
>>>       /* start health check */
>>> -    mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>>> HEALTH_CHECK_PERIOD);
>>> +    if (pdev->is_physfn)
>>> +        mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>>> HEALTH_CHECK_PERIOD);
>>>       /* Allow runtime suspend only if both PME from D3Hot and M3 are 
>>> supported */
>>>       if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
>>> @@ -1396,7 +1404,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>>>       struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>>>       struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>>> -    timer_delete_sync(&mhi_pdev->health_check_timer);
>>> +    if (pdev->is_physfn)
>>> +        timer_delete_sync(&mhi_pdev->health_check_timer);
>>>       cancel_work_sync(&mhi_pdev->recovery_work);
>>>       if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>>> @@ -1424,7 +1433,8 @@ static void mhi_pci_reset_prepare(struct 
>>> pci_dev *pdev)
>>>       dev_info(&pdev->dev, "reset\n");
>>> -    timer_delete(&mhi_pdev->health_check_timer);
>>> +    if (pdev->is_physfn)
>>> +        timer_delete(&mhi_pdev->health_check_timer);
>>>       /* Clean up MHI state */
>>>       if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>>> @@ -1469,7 +1479,8 @@ static void mhi_pci_reset_done(struct pci_dev 
>>> *pdev)
>>>       }
>>>       set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
>>> -    mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>>> HEALTH_CHECK_PERIOD);
>>> +    if (pdev->is_physfn)
>>> +        mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>>> HEALTH_CHECK_PERIOD);
>>>   }
>>>   static pci_ers_result_t mhi_pci_error_detected(struct pci_dev *pdev,
>>> @@ -1534,7 +1545,9 @@ static int  __maybe_unused 
>>> mhi_pci_runtime_suspend(struct device *dev)
>>>       if (test_and_set_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
>>>           return 0;
>>> -    timer_delete(&mhi_pdev->health_check_timer);
>>> +    if (pdev->is_physfn)
>>> +        timer_delete(&mhi_pdev->health_check_timer);
>>> +
>>>       cancel_work_sync(&mhi_pdev->recovery_work);
>>>       if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
>>> @@ -1585,7 +1598,8 @@ static int __maybe_unused 
>>> mhi_pci_runtime_resume(struct device *dev)
>>>       }
>>>       /* Resume health check */
>>> -    mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>>> HEALTH_CHECK_PERIOD);
>>> +    if (pdev->is_physfn)
>>> +        mod_timer(&mhi_pdev->health_check_timer, jiffies + 
>>> HEALTH_CHECK_PERIOD);
>>>       /* It can be a remote wakeup (no mhi runtime_get), update 
>>> access time */
>>>       pm_runtime_mark_last_busy(dev);
>>>
> 

