Return-Path: <linux-arm-msm+bounces-64375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C4CB00236
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 14:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A06DE58773B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A382571B3;
	Thu, 10 Jul 2025 12:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+rbyoft"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4BF2192EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752151366; cv=none; b=F6djBthsRgG1Zw3etkLn4aItcfeps+Zf1yaVceXqAlcl+C9tCtCwCa6KrRz1n0qA7/F+aaj/zE3tcIJQWfu89XjOr4D5DZAL4/h3jwYwy2atJQtFLIw3ONd1GxBvIb7M71IhIcuGmDCW7iwks07qeSTWVv6GqfbZ4VG/nI0hvMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752151366; c=relaxed/simple;
	bh=qT4cK4YOQGdLFmydG7hnzG9lFsgGqmxqRlcMV+bX0Rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IwszkjhM6Ba2HFOFHh5g2Nnz4+90LBHX5AEKmZgMLdKP/4CtajwIxQcRO2Onzyr2SkL0LPwbLxSAarH5H4qaZpB2MVAaRF3hziCDUsY5f2D9yD9P4HaY1zwuS4O4AKhOSh/4X7MzDgrzZAYcJpgb2yxYis8fIrw/Z3EuFbg+9/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+rbyoft; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9HRob032001
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sB43RpIjGkA6EckqwdQJ9p61HuRAn0z776gx64noA2U=; b=N+rbyoftTnc2SPaR
	QDjX+r87LzwBUiosi4MylYAnarSml3HLn8ZtePyKEaoNfw3ao/+BzT051kkjloOZ
	0gZZnRg2BX0wbP8I8/ugpqNTa5ndjHTigteB8H0j8v5l5jGNMugTan9feheNnmwT
	tTs3+037C67pEgOkBa2eY2QjOq4/5uMcPIFV01wrIAYKLvr1A6QQUKheyDXPmr7t
	SMZN4gTN9wL1e5mtlwTv8rGcPuYg+HYUPEmJquirphRDgbqZLB+R6ojhBeOq/jBF
	wHne6k70uCOQKRSJ0Urp+YFiprhTvm4kGJ2NI6Mn+xj9itvO/9tKRwKxBNPUeokt
	2pomGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qyjkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:42:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d41d65f21eso21119085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 05:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752151363; x=1752756163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sB43RpIjGkA6EckqwdQJ9p61HuRAn0z776gx64noA2U=;
        b=Mm9AjW3gbTNt9Zo+5ZBHtmt9fBPXTf/Kviio0VphTg/Tvx7xMw9p5VCmCY5tpoRrt3
         LPGzF1fxtb/TUS41+fXRH8fFx9Cq7ng5q0Qrz52N9f3Jvr1fPXPV3Ik5XjmKDv8UPmdg
         DcDdip8aO9YhmolC6G1M57yue19OnXOtVrKQfICnLEaDfnD1BDMBJ6vRAVA4lyYPd6g5
         cxqiYhyxhuOFbCH43NgJ8xR8ysJvJyfLnuNIncwDnsCNQkxi/m9IN2GdDm6uwSi/DWGq
         jy7M8b0Q5ITN2Vro8b5CEQ1SjTaxHUPeMOGBu/jt2ZpbIPbs64nB5hJzK1qtkrHg1T4O
         2ryA==
X-Forwarded-Encrypted: i=1; AJvYcCW4ybkdWjVN4jA4AAUzeAB8dTxUhTpjAtr2HdbOtzw2DUUKExz+CZQbuCVVSR+jj0nV+XJ89OeJrgKVnQLi@vger.kernel.org
X-Gm-Message-State: AOJu0YxkrjLBJ1Ho/362zD1zdwOoHHfozGCKx8qPDoLI6igSfdmAhkCX
	x9cgBjZ55KBchfG+pzt29lDRIj5+6Wv/DppM9X3v6DtkghhtxaTaMmE3WtNqwskOxqmoF/Vmc/w
	DtM92/Z490v38rbIOYjRrtyigl7Ec98pjR0CQO0kkNArTo0VlLR9JjH3hBhWRmXIlCs+U
X-Gm-Gg: ASbGncvYbR+WHlRgqDeQhoRy+pShSFexsVCZlaw8W3CqAbbFWbKTVsP4/cEk/jpyqc3
	Td2XFYxqiwvsqTcoxkDcWzP7SmF/66aNbmLuS5gGLJnRqfkE18FBq4BdiYfi7pZHVANR4/iyFY0
	WqH2rlNHm3YGyylrv0XyOPmik2Tj2brSnvyolyAAQnMaQ6QECIaYWHsslc5Ru2qr5PqcY0QQpCW
	kqmORbh9ReLgVlvh/+QnGMNxssgiUMAqnL+f2UMJ1tifWGKgwXsCXcVSAIf9G257d+a/foKTZF6
	d9eeLgUqoXqPjioLE5QEaDoxAVc6JD+DOJEH7BO2NkeCBOh9zbznY/mM538sKNi6eK6Es6CFizE
	ayns=
X-Received: by 2002:a05:620a:440a:b0:7d3:c688:a590 with SMTP id af79cd13be357-7db7b9076c7mr278412385a.4.1752151362661;
        Thu, 10 Jul 2025 05:42:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHkJeaPNFCZjaAdo7Sm8mow/tgNt96H/j5OU5IvGRgQUanilgENAZ7NE6FMPFtmXhfFfL0IQ==
X-Received: by 2002:a05:620a:440a:b0:7d3:c688:a590 with SMTP id af79cd13be357-7db7b9076c7mr278410885a.4.1752151362009;
        Thu, 10 Jul 2025 05:42:42 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c95282ccsm841609a12.28.2025.07.10.05.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:42:41 -0700 (PDT)
Message-ID: <68f18f09-913d-4ef9-bd13-ad32c1d5f8ca@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:42:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] bus: mhi: host: pci_generic: Remove MHI driver and
 ensure graceful device recovery
To: Vivek.Pernamitta@quicinc.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-3-4bd862b822e8@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-sriov_vdev_next-20250630-v2-3-4bd862b822e8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwOCBTYWx0ZWRfX7uu+6c8qBosF
 1+6kvEhSS9/f3uHK0KrmU75o9TFgyMm/qv5pGkbxfnQ9t00v8Q23mFS9iGo3XsGZfKNC4pbYZ/y
 LrBaNB3dXC+3XvOuvGBuwIvgjC4aD5kw+pSyvvY7O2kbgFNxAy9+6VQ6X0DH94nljp3e91asYCJ
 qJzJHatFCtBkPYYNXWWB7SFxDErgGiIeYTw4Cj6ZUyQvVJTwLXedsQxsmFwSNnhL1TGpYWuv/QE
 hzImRPvN4XAE2hPpQRBMVYY+r8m+BLpnwvbQR7a5DKMUEboVWl8q2+mDR0JA9ppX0iyzsTSKXDe
 SAHFJJfVuFc4JZdZf0LIt9wpB4hmnIZ+syO4whv0tChFgLvNVjLMScMKEr9sBwypZzAl79+u05W
 cCFAE3tuo4y2nrdFj4F+qFSkibcogiQMyQhq1GKX87Bif2DGJoDmpK21VAdMRufxMyQBLeKu
X-Proofpoint-GUID: mJOtfo2DTZvz9as02CnkSmfK9nF54rwW
X-Proofpoint-ORIG-GUID: mJOtfo2DTZvz9as02CnkSmfK9nF54rwW
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686fb544 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=gCw4ouaQbMy8evTE208A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100108

On 7/10/25 10:58 AM, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> When the MHI driver is removed from the host side, it is crucial to ensure
> graceful recovery of the device. To achieve this, the host driver will
> perform the following steps:
> 
> 1. Disable SRIOV for any SRIOV-enabled devices on the Physical Function.
> 2. Perform a SOC_RESET on Physical Function (PF).
> 
> Disabling SRIOV ensures that all virtual functions are properly shut down,
> preventing any potential issues during the reset process. Performing
> SOC_RESET on each physical function guarantees that the device is fully
> reset and ready for subsequent operations.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 4bafe93b56c54e2b091786e7fcd68a36c8247b8e..2d1381006293412fbc593316e5c7f0f59ac74da8 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -45,6 +45,8 @@
>   * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
>   *		   of inband wake support (such as sdx24)
>   * @no_m3: M3 not supported
> + * @reset_on_driver_unbind: Set true for devices support SOC reset and
> + *				 perform it when unbinding driver
>   */
>  struct mhi_pci_dev_info {
>  	const struct mhi_controller_config *config;
> @@ -58,6 +60,7 @@ struct mhi_pci_dev_info {
>  	unsigned int mru_default;
>  	bool sideband_wake;
>  	bool no_m3;
> +	bool reset_on_driver_unbind;
>  };
>  
>  #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> @@ -300,6 +303,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>  	.dma_data_width = 32,
>  	.sideband_wake = false,
>  	.no_m3 = true,
> +	.reset_on_driver_unbind = true,

It seems rather unlikely that out off all MHI devices, only QDU100
needs this quirk when working under SR-IOV

>  };
>  
>  static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
> @@ -970,6 +974,7 @@ struct mhi_pci_device {
>  	struct work_struct recovery_work;
>  	struct timer_list health_check_timer;
>  	unsigned long status;
> +	bool reset_on_driver_unbind;
>  };
>  
>  static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
> @@ -1270,6 +1275,11 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	mhi_cntrl->mru = info->mru_default;
>  	mhi_cntrl->name = info->name;
>  
> +	/* Assign reset functionalities only for PF */
> +	if (pdev->is_physfn)
> +		mhi_pdev->reset_on_driver_unbind = info->reset_on_driver_unbind;
> +
> +

Double \n

>  	if (info->edl_trigger)
>  		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
>  
> @@ -1336,7 +1346,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	return err;
>  }
>  
> -static void mhi_pci_remove(struct pci_dev *pdev)
> +static void mhi_pci_resource_deinit(struct pci_dev *pdev)
>  {
>  	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> @@ -1352,6 +1362,20 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  	/* balancing probe put_noidle */
>  	if (pci_pme_capable(pdev, PCI_D3hot))
>  		pm_runtime_get_noresume(&pdev->dev);
> +}
> +
> +static void mhi_pci_remove(struct pci_dev *pdev)
> +{
> +	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
> +	/* Disable SRIOV */
> +	pci_disable_sriov(pdev);
> +	mhi_pci_resource_deinit(pdev);
> +	if (mhi_pdev->reset_on_driver_unbind) {

Can we not simply check for pdev->is_physfn?

> +		dev_info(&pdev->dev, "perform SOC reset\n");

Is the logspam really necessary?

> +		mhi_soc_reset(mhi_cntrl);
> +	}

Konrad

