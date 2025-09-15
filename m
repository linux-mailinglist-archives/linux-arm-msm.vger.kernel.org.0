Return-Path: <linux-arm-msm+bounces-73515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5CAB573A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EB6917E3BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 08:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C92E2F39D1;
	Mon, 15 Sep 2025 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACmnaZLe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E871F4625
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757926346; cv=none; b=grzmHFaBF4pL1G9XV3s6fZ3MsMGwir5Zpl6ViNsFHxqXE1/qsLe3HpxD/TIVET353Bu53+lxGMGuX1H8/DfDyv7exD5K6ziaNpXX2QWRFI3nSZOWS41HvVCAeS2oxSrnASymg+nBoBvyAp4Afy2Gqa1GupPLzk47fkwQiv+VmlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757926346; c=relaxed/simple;
	bh=JOtrS9+M4CQeumFyospkbCpibbdi2oOVAl3i+k7+ezs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iN17sBuUanJcmc5lqBWXQBmBnSFeyGGAsGvGga/WG2rQ4ABhh5islHjZ6IaR/M1WqcNFFM0BKSAM0Gj9PYxEuM1bvQXVdpNI5D8fXH7A4KA2Oa1Mp79jVq8ZpV0tMiQJCnGG/tS2+mYqDF9iAKXx+y07tqiDl7hd5BUmpDHzaBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACmnaZLe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8Fj2F006852
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 08:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZoOP1y6kv2Q1qrI74LMh14wnvJCBrS7R1fHqNXnvWAU=; b=ACmnaZLeO5cK9+7g
	bp8Dtv7rpwucslWmRvTKrPbKGWlSmK3QzLpjk+tp4pF75cEbSiw+ohESc5C3v5Tw
	TD8TJXSqyUybIpwjhY27xuLSWClTRUugnVAH1RXxU8fAYUNR+Uzm+Pe12pJ/fogo
	dz2UOHiyloYr7xKb5Ta171sEmO4/KixhpOaHJDyF8GRQsYxj6JUscIyvd66VU/uu
	PVu9nChcDkqoSlj2aDO4elbvIX4ZlHh2ZzUu/OrDej1HoX5TFlXKRf82ujp1Q4sg
	6tjY+FpY5x1d3bGaiCDGyhFjH4U2QWo9LTIWlpXqTveuLeUZS112HfKqOaOfW4MX
	Xqv3Yw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yjv47y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 08:52:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-329b750757aso3319827a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 01:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757926342; x=1758531142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoOP1y6kv2Q1qrI74LMh14wnvJCBrS7R1fHqNXnvWAU=;
        b=eO8v0Bo2Ywgfa/olXYdvSN3Ez8bNefJo3OyNEUX+I+C5h9+vgo3fkO4h7OdN096gB4
         Do9WV3kbt0XlXIexs4YtO56124TgZIRFD0IucvmSx162kNNKQ3n6rEUvJg3+F5aJPpBD
         9x2c3nihg7vjwA3hjVl/RCXrWlEZl0ol8rJLe5vEoAIXpHWqmsRxi6va3mgs/4W5RYzP
         RxDwl4BQ/Q/JTdy/7/SJQFcPDkBJ20SIsJNyCg6u/aeryBR1djMwwD5iV5iViYHL454X
         Y9sjDomBkox7NcYBeWUpls/ElofnJVaWGYB5hlKUpwTb7FhFeaC8HUW7kWlk4qYhh8eP
         GM2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYvGosjJNS7znd/jLk5lf+jDJ7H6Tx1uXZx7n4GslDdwrUtafwV64MSsZG648fbSRWo+CjY24ZhBilC48x@vger.kernel.org
X-Gm-Message-State: AOJu0YweBorL/v/Mzb058l5/o8y6L2konIt/AMDlvzW++w0s6WmQRzdl
	RLggoazDne8wDSIVhOYOJzAnBdAsLEKmc063rLXqxS7ZIXbXjQGn7pT1cy7zHjZG83/TU9kJxuD
	5YaKyUB8BQ7XOyiFRwj/30rxTH1rSzi1Pv+GlbU1as2Jid60mBNt6Cy/v3w3gO/CvgPlZ
X-Gm-Gg: ASbGncsigIJ5SaNPcPnM1R7Gzeyc58QaESjUCObtYNDF4BOqySUkWQb2ezzZMDUFKJu
	cw/DWlucQIlM6VHXl9mSloYI/8S7Lk8+A+KtiETI29lkuphoeric8b5WcBc/Os3IDvjpuYT/dGx
	u2U3ZfYFFYnESLn1x/gSZeNkhyO2/a7GlyjzcKyhAV0xRIVzvEUQhVIhSef3eDNpVaMjXuXNhZM
	TvPHqNiWaEcEnmDTxYEhiuk7ns5eMJKW0838Yb9PRnUwD4eBiGDIEoiBOUtznFr6qeMQ0yMv5K0
	00teXeLnBME6414AvGbGXI98KfCWJmrZLeltoeIuTzFooNAdP+ebg3vUwnSLWx9HMdV8ou92JA=
	=
X-Received: by 2002:a17:90b:39c5:b0:32e:6019:5d19 with SMTP id 98e67ed59e1d1-32e60195de3mr3234363a91.34.1757926342439;
        Mon, 15 Sep 2025 01:52:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHDHxY7PMZiwj9+qa9gWiHA+FHIEA6+jXuVLrMiGIMq3qikMHGq/3peLPb9JO2Yw5ntBoNvQ==
X-Received: by 2002:a17:90b:39c5:b0:32e:6019:5d19 with SMTP id 98e67ed59e1d1-32e60195de3mr3234341a91.34.1757926341964;
        Mon, 15 Sep 2025 01:52:21 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ac02de2bsm8708849a12.17.2025.09.15.01.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 01:52:21 -0700 (PDT)
Message-ID: <65df50b9-0bdf-4a62-ae1f-d0bb550ff406@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 14:22:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
To: Vivek.Pernamitta@quicinc.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
 <20250912-uevent_vdev_next-20250911-v4-2-fa2f6ccd301b@quicinc.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250912-uevent_vdev_next-20250911-v4-2-fa2f6ccd301b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HcoUTjE8 c=1 sm=1 tr=0 ts=68c7d3c7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=HFCjbP5WYD9W18CjRUkA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gswhy4ssj_8zLmYsVKjPLtgAmOQnwIrN
X-Proofpoint-GUID: gswhy4ssj_8zLmYsVKjPLtgAmOQnwIrN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxNyBTYWx0ZWRfX6rYxSQpxhUdF
 g+cFZwhzq4buRkhf0WfMWxR06GgtYeGfXjYgrwV9F9RgvAxiuSRLF+HhGgI+X2id5Qf7yAWqyXb
 7eeb9yIk0YiJA+NUMa4YJonuLtWTZ3upGSNa8xnoM0x2PLNhM7H50FbDI1wAbnFCGK3ZhNGl/4V
 4yD/DIMrPf2M29bo79UQdEmj4/7Z1tBvRQm6FL+iZX+iCJivxxFjEf2Tz1WZu5fBaq7PFjQwRRe
 lbbk1vx4jdAdENGu+o96NiBhuvY7DC2br7nEFM7vCV2W+ptrA+7/GVEckGXn/kWD+8cQsEbauYl
 OIB63lNKbk+gW9vmVhQ/oHFxD2QIy5OBEJoSQK/1kwgUz0tTeyy21EBcudfYSYoG8gCwToORKlW
 QtaYTQqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130017



On 9/12/2025 6:18 PM, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> In SR-IOV enabled devices, reading the VF DEVICE/VENDOR ID register
> returns `FFFFh`, as specified in section 3.4.1.1 of the PCIe SR-IOV spec.
> To accurately determine device activity, read the PCIe VENDOR_ID of
> the Physical Function (PF) insteadcommit text and subject needs to be modified to reflect new changes

> Health check monitoring for Virtual Functions (VFs) has been disabled,
> since VFs are not physical functions and lack direct hardware control.
> This change prevents unnecessary CPU cycles from being consumed by VF
> health checks, which are both unintended and non-functional.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/host/pci_generic.c | 34 ++++++++++++++++++++++++----------
>   1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 8a605cb3b8e1e54ef4e699700f3f2660ad5cb093..6fa16975e320212a50e0b68ddb34db5ce711589c 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1082,7 +1082,7 @@ static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
>   	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>   	u16 vendor = 0;
>   
> -	if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
> +	if (pci_read_config_word(pci_physfn(pdev), PCI_VENDOR_ID, &vendor))
As you are invoking only for physical functions pci_physfn is not needed.

- Krishna Chaitanya
>   		return false;
>   
>   	if (vendor == (u16) ~0 || vendor == 0)
> @@ -1193,7 +1193,9 @@ static void mhi_pci_recovery_work(struct work_struct *work)
>   
>   	dev_warn(&pdev->dev, "device recovery started\n");
>   
> -	timer_delete(&mhi_pdev->health_check_timer);
> +	if (pdev->is_physfn)
> +		timer_delete(&mhi_pdev->health_check_timer);
> +
>   	pm_runtime_forbid(&pdev->dev);
>   
>   	/* Clean up MHI state */
> @@ -1220,7 +1222,10 @@ static void mhi_pci_recovery_work(struct work_struct *work)
>   	dev_dbg(&pdev->dev, "Recovery completed\n");
>   
>   	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> -	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
> +
> +	if (pdev->is_physfn)
> +		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
> +
>   	return;
>   
>   err_unprepare:
> @@ -1307,7 +1312,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	else
>   		mhi_cntrl_config = info->config;
>   
> -	timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
> +	/* Initialize health check monitor only for Physical functions */
> +	if (pdev->is_physfn)
> +		timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
>   
>   	mhi_cntrl = &mhi_pdev->mhi_cntrl;
>   
> @@ -1371,7 +1378,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
>   
>   	/* start health check */
> -	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
> +	if (pdev->is_physfn)
> +		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>   
>   	/* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
>   	if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
> @@ -1396,7 +1404,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>   	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>   	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>   
> -	timer_delete_sync(&mhi_pdev->health_check_timer);
> +	if (pdev->is_physfn)
> +		timer_delete_sync(&mhi_pdev->health_check_timer);
>   	cancel_work_sync(&mhi_pdev->recovery_work);
>   
>   	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> @@ -1424,7 +1433,8 @@ static void mhi_pci_reset_prepare(struct pci_dev *pdev)
>   
>   	dev_info(&pdev->dev, "reset\n");
>   
> -	timer_delete(&mhi_pdev->health_check_timer);
> +	if (pdev->is_physfn)
> +		timer_delete(&mhi_pdev->health_check_timer);
>   
>   	/* Clean up MHI state */
>   	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> @@ -1469,7 +1479,8 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
>   	}
>   
>   	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> -	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
> +	if (pdev->is_physfn)
> +		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>   }
>   
>   static pci_ers_result_t mhi_pci_error_detected(struct pci_dev *pdev,
> @@ -1534,7 +1545,9 @@ static int  __maybe_unused mhi_pci_runtime_suspend(struct device *dev)
>   	if (test_and_set_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
>   		return 0;
>   
> -	timer_delete(&mhi_pdev->health_check_timer);
> +	if (pdev->is_physfn)
> +		timer_delete(&mhi_pdev->health_check_timer);
> +
>   	cancel_work_sync(&mhi_pdev->recovery_work);
>   
>   	if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
> @@ -1585,7 +1598,8 @@ static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
>   	}
>   
>   	/* Resume health check */
> -	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
> +	if (pdev->is_physfn)
> +		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>   
>   	/* It can be a remote wakeup (no mhi runtime_get), update access time */
>   	pm_runtime_mark_last_busy(dev);
> 

