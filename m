Return-Path: <linux-arm-msm+bounces-64237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E7CAFE94A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45408562742
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5692DE200;
	Wed,  9 Jul 2025 12:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ngeRIbHE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDF82DBF75
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 12:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752065108; cv=none; b=K2n8ND9yxLRpL/HfPvQbrqXxlL0CbFAjCzl64sLyIpnkGnx61M2LbA7eN5PLXVZcpp3vwRHRQwJOEmcC5It+vZmCokuxDOvuZzDXD+F8ZUHvTgNFfgOMt/zN2dOQUTjoDqGTVmeb7lqthbbxs0eRydMo+Ff9aWApj21QupEMNzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752065108; c=relaxed/simple;
	bh=BMt68/dhPsRTBHfMd9scnQZqEqDqvJGhFz6nlk1DgYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nvzk1HiLPDDC8ORzgicsjOj6Ur4z1CKt8Nia+Rr6ygXeGPcDfz30PGfyKuOEbJkK1sW1uiltMJ9nIq9Gu1h80OuGBKSWWnJ9Id+1u8YXU6im7zPB62hAztmEIJQpFtQ/hhBfRK/H3rKhksTReUePG4Ze1czguAo/VPF//bnjhFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ngeRIbHE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569CABoT006230
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 12:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OheOR6I3qu/WItpCT/Bc1nnGAPjs1ote7RaPpYQv5uM=; b=ngeRIbHEMwNApo4I
	P0QLsUxHU0ALfMdLAo+rlFdwWo11FDACYH2wvK3UwH9ks7U8xRQJRSU5Bz1a/oF0
	VhgxoAW3TX0P7jojHBlit2OUmoDG/jDM9Qf6Yrklb3Kzs+tweEbg4oeCweMlOH6a
	kWRqXVyjVuQepgCQ/QUuZMpPrPm/4iwXqM08LpgC7jJvapjhoKFioIitZCAufiLF
	T5WCVZajxJdtbNDGvimRXJO5g4RfHCWjTtDtU7GecXmpI1CgGtuXy6j7OHINQ2KK
	TqD6UMAot0kJTegJqn7SU8DIksAiuzOcpQBvrzzldH1v1/D2PZTkL8ytzK6jnxbj
	qmEuqw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bcc5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 12:45:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b0e0c573531so3833730a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 05:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752065104; x=1752669904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OheOR6I3qu/WItpCT/Bc1nnGAPjs1ote7RaPpYQv5uM=;
        b=v1kxJtXXuL3WPbD+MTufYoog3aWkW2/qsPJe+txxLKWFI8CJ6+4haZXn9IrS4xC5KP
         fPLo13/m/xgb/9FDA8m0Fhyk2TeECWdAzqoiZwCfMm0QjfbWzO+EDQ7uCBpxKotHqUMr
         fRsWiHb/MPtIKeGIyCzXPZSrHfUpLXkkEkErclaoLaMiex7PfPWV2Tp31pbv4r+3jDAz
         F7unk8pl59Eyd4PJmyvw5vsZhho4EJZ+nlAVNR9QedhUjkhXSE4d2DVhfHwrAO54d0PS
         IKo9hrwUBZEwqAHeWx3TFXtd6Kwzl6PWqpjaC5ww1YJ8aingFQ7/jyZVaJaffFt/J7Pz
         tXzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnbPa2H4jvkH+QdZodZcwt6ueu3HeKqe7GLjle7qj4QSweXCSdPWkOIbrhQYlpZvgx+tvLHbjVYqlrtzYz@vger.kernel.org
X-Gm-Message-State: AOJu0YwkaCusfVALs5vy2vAlu+jcqe3V7x5N4ogN2Xu9ePOSbI5um/li
	Tz6ubKdVPYu75KKoWliB49oEIPdadx0QuGvekr5oXOdAp246mZ8koeFNHI/nYdycIAL3KHf5HFn
	vbAU1wkdRjpCH7EeHo3YvAIxwF/+82U6ALVFjP+kHynVMuMoh/bq2uJzFfDTFCRAv5Rmn
X-Gm-Gg: ASbGncvBurhlo9dlzfOjPkvKXGZ31uGi3YKc4hQtosm+SP4C2iOSBfXI0BShiSoPrAs
	5T3xnRN1573wsV6oYmpqgeRQc7A0PdUnHMahohHPm2yvLmrEaYVQEe2oSW8dOV8fgobMoSdrwEt
	SobwR0p9SX6GOsfqvgFIiAm+xtuqQCzwjFrLljOfQOsOl7hhFL/7YcOCZeP3cqqjdwxOf3ibrh9
	RIh/vWkyewSzCdBKumLzMN3p+IWLUMn6sB9w/l3KzurifF56n5TS6iAStwKRQdhmwgETZCUfihr
	C+YQbiDFiqeQ0/NtvHEbQdLdJIAikmIjq0g7ARd7AoW5sB2l6zf/
X-Received: by 2002:a05:6a20:244b:b0:218:5954:1293 with SMTP id adf61e73a8af0-22cd7e8e202mr4648512637.34.1752065103807;
        Wed, 09 Jul 2025 05:45:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5UtoAmFLb6WEXtJYsR5WFrd4objqmsX2gM1tvRWAxRXg4xOrY9rs2wqyWmMmyV8enoG7Wng==
X-Received: by 2002:a05:6a20:244b:b0:218:5954:1293 with SMTP id adf61e73a8af0-22cd7e8e202mr4648454637.34.1752065103356;
        Wed, 09 Jul 2025 05:45:03 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42ce64esm13333540b3a.153.2025.07.09.05.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 05:45:02 -0700 (PDT)
Message-ID: <ec9dc92d-c38d-4905-96da-e34baf6bac7b@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 18:15:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] bus: mhi: host: pci_generic: Remove MHI driver and
 ensure graceful device recovery
To: Vivek.Pernamitta@quicinc.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
 <20250703-sriov_vdev_next-20250630-v1-4-87071d1047e3@quicinc.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-4-87071d1047e3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDExNCBTYWx0ZWRfX4I7io+GHv+jp
 apoNBTdajeyuBYPkuyi5+Awgm8FQvmwL0F335G1OqEMG5Xm9JEs1q+VtAWCJKj4XuWZbYQ3Uttk
 WFDYys0rODOVDIos7zy0ABqUNgjKPmmADHN4uoQ8we53E1DpF98PZni5hI8rIfwldd2d3xOdDLh
 EOKAeQDy823SnhwEefrZqMMZRtdzQ7Rkx8xcO6FgrYSfraIOwgPjrwOmhrKnnvrlbXzBt87SwHl
 qXD2XYSwwa29LjNfbLifTpMDvQMLXs2Zns5IyNkbWZeUwzaC0TFcrI/4769fYZxfOsQ2bdukBtO
 hRhG2kEJ1GyyYcDRPtqVLf9g1krjT7N3yAykGpK76b3ejJVTXJTvHTOGxwVzOJwhCrZccswLoVu
 8Sa6iiDmiCFuSsWJk/zurd+b+gqtbs25a4YLI5hnbD0G9LJemE/P90+FZ+p7JCa1B2GxmYwY
X-Proofpoint-ORIG-GUID: C3vTALVI6OBFEZxnvN7M3HWzas9sfeOP
X-Proofpoint-GUID: C3vTALVI6OBFEZxnvN7M3HWzas9sfeOP
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686e6451 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=-hW8E1-Tuph7HjTkc5sA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090114



On 7/3/2025 8:39 PM, Vivek.Pernamitta@quicinc.com wrote:
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
>   drivers/bus/mhi/host/pci_generic.c | 33 +++++++++++++++++++++++++++++++--
>   1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 938f37d306a18b9a47f302df85697f837c225f0d..ff9263d5dc4b54956c6ca4403e7b0b2429d0700e 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -45,6 +45,8 @@
>    * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
>    *		   of inband wake support (such as sdx24)
>    * @no_m3: M3 not supported
> + * @bool reset_on_driver_unbind: Set true for devices support SOC reset and
> + *				 perform it when unbinding driver
>    */
>   struct mhi_pci_dev_info {
>   	const struct mhi_controller_config *config;
> @@ -58,6 +60,7 @@ struct mhi_pci_dev_info {
>   	unsigned int mru_default;
>   	bool sideband_wake;
>   	bool no_m3;
> +	bool reset_on_driver_unbind;
>   };
>   
>   #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> @@ -300,6 +303,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>   	.dma_data_width = 32,
>   	.sideband_wake = false,
>   	.no_m3 = true,
> +	.reset_on_driver_unbind = true,
>   };
>   
>   static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
> @@ -970,6 +974,7 @@ struct mhi_pci_device {
>   	struct work_struct recovery_work;
>   	struct timer_list health_check_timer;
>   	unsigned long status;
> +	bool reset_on_driver_unbind;
>   };
>   
>   static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
> @@ -1270,6 +1275,11 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	mhi_cntrl->mru = info->mru_default;
>   	mhi_cntrl->name = info->name;
>   
> +	/* Assign reset functionalities only for PF */
> +	if (pdev->is_physfn)
> +		mhi_pdev->reset_on_driver_unbind = info->reset_on_driver_unbind;
> +
> +
>   	if (info->edl_trigger)
>   		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
>   
> @@ -1336,7 +1346,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	return err;
>   }
>   
> -static void mhi_pci_remove(struct pci_dev *pdev)
> +static void mhi_pci_resource_deinit(struct pci_dev *pdev)
>   {
>   	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>   	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> @@ -1352,13 +1362,32 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>   	/* balancing probe put_noidle */
>   	if (pci_pme_capable(pdev, PCI_D3hot))
>   		pm_runtime_get_noresume(&pdev->dev);
> +}
>   
> +static void mhi_pci_remove(struct pci_dev *pdev)
> +{
> +	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
> +	/* Disable SRIOV */
> +	pci_disable_sriov(pdev);
> +	mhi_pci_resource_deinit(pdev);
> +	if (mhi_pdev->reset_on_driver_unbind) {
> +		dev_info(&pdev->dev, "perform SOC reset\n");
> +		mhi_soc_reset(mhi_cntrl);
> +	}
> +
> +	/* Perform FLR if supported*/
Misleading comment.
>   	mhi_unregister_controller(mhi_cntrl);
>   }
>   
>   static void mhi_pci_shutdown(struct pci_dev *pdev)
>   {
> -	mhi_pci_remove(pdev);
why can't we use this same as mhi_pci_remove.

- Krishna Chaitanya.
> +	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
> +	mhi_pci_resource_deinit(pdev);
> +	mhi_unregister_controller(mhi_cntrl);
>   	pci_set_power_state(pdev, PCI_D3hot);
>   }
>   
> 

