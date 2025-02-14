Return-Path: <linux-arm-msm+bounces-48058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6820A362F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 17:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E2F916B222
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 16:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4622676CE;
	Fri, 14 Feb 2025 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jUkQXO2i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4F2753FD;
	Fri, 14 Feb 2025 16:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739550186; cv=none; b=AvZ3fENM9kNQuUX+h4w6pDHs3tbdxMoETWp35iegQ+bDHAgMR6v6Hl5dmD8bMLzvUzk1UQM3L6FB6Nhll+jTWLhGjlNWSrjg/QsKXarEE1eWZTSIdck+7kRrWk8aBAvlUczB0+O9L2hD4rcp9vxdtIBn5fHyNSI8EYdraMAJ0RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739550186; c=relaxed/simple;
	bh=YncaHrreIkQNL5ZfDYqGAT3nT32xPMMZx1Gg0Yy0sgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gfQ6E6h0MwNPlLRpSi/aHBiopzxcei/eb3PAYAXO+u7CfjjpbskHixA+HgExf/YeB4U4xdK2bs9eBfmGgRuMfqBlXMeGvhJ+OfPykXQ1mIw3/tiM6MPygDNyzFzJQLu2ap7FezyjzLPoyUNQ9Y64T39+YAyrnfIhlAKLvU0X3wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jUkQXO2i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E9JNNb032747;
	Fri, 14 Feb 2025 16:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Y1JutvbctGcBNKK/CKo1aMWn2/iRrZKHeTlnLO05GY=; b=jUkQXO2iKbuvKOfT
	J8WSseVjq/rIGblEi4xohQLh1qaF1lWVncN3bF4Rnc5lNZ485I2AU+sXhOBiZHKo
	5tVZOpeQmipWOSRQdmLMIAlKj/EO2raH9ePQF58gt3UffpvdOoVp9AB4obLaZQ/T
	OZh5ekPHCNiXAqKiNO495/WZ/2aa9jMa98suZxxsX9P4bC/WpkUlKNy+HMWvQHol
	U5+rjPwdWIUQHpmnMitFZXobG4cZbz5PbQlez34BZ2rFes0mOeDCc7ydLRq5wX6U
	/Qasyhl33wdM9T1WWrWqSZOyoqA705SHBGcwlBFo20LxzxgZ6Lc9gHvHLx7Yjmxb
	ufw5Ow==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44seq043x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 16:23:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51EGN1UY000343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 16:23:02 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 08:23:01 -0800
Message-ID: <6d0d1eb4-4f83-1f10-a7cb-123692b86fc6@quicinc.com>
Date: Fri, 14 Feb 2025 09:23:00 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [bug report] bus: mhi: host: Add a policy to enable image
 transfer via BHIe in PBL
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Matthew Leung
	<quic_mattleun@quicinc.com>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
References: <e3148ac4-7bb8-422d-ae0f-18a8eb15e269@stanley.mountain>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <e3148ac4-7bb8-422d-ae0f-18a8eb15e269@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4lcL3QpgIjnDtfi2xNuZ4KPWdPmsjgrX
X-Proofpoint-ORIG-GUID: 4lcL3QpgIjnDtfi2xNuZ4KPWdPmsjgrX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140116

On 2/12/2025 5:37 AM, Dan Carpenter wrote:
> Hello Matthew Leung,
> 
> Commit f88f1d0998ea ("bus: mhi: host: Add a policy to enable image
> transfer via BHIe in PBL") from Jan 17, 2025 (linux-next), leads to
> the following Smatch static checker warning:
> 
> 	drivers/bus/mhi/host/boot.c:611 mhi_fw_load_handler()
> 	error: uninitialized symbol 'fw_load_type'.
> 
> drivers/bus/mhi/host/boot.c
>      491 void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>      492 {
>      493         const struct firmware *firmware = NULL;
>      494         struct device *dev = &mhi_cntrl->mhi_dev->dev;
>      495         enum mhi_fw_load_type fw_load_type;
>      496         enum mhi_pm_state new_state;
>      497         const char *fw_name;
>      498         const u8 *fw_data;
>      499         size_t size, fw_sz;
>      500         int ret;
>      501
>      502         if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>      503                 dev_err(dev, "Device MHI is not in valid state\n");
>      504                 return;
>      505         }
>      506
>      507         /* save hardware info from BHI */
>      508         ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_SERIALNU,
>      509                            &mhi_cntrl->serial_number);
>      510         if (ret)
>      511                 dev_err(dev, "Could not capture serial number via BHI\n");
>      512
>      513         /* wait for ready on pass through or any other execution environment */
>      514         if (!MHI_FW_LOAD_CAPABLE(mhi_cntrl->ee))
>      515                 goto fw_load_ready_state;
> 
> Assume we hit this goto.
> 
>      516
>      517         fw_name = (mhi_cntrl->ee == MHI_EE_EDL) ?
>      518                 mhi_cntrl->edl_image : mhi_cntrl->fw_image;
>      519
>      520         /* check if the driver has already provided the firmware data */
>      521         if (!fw_name && mhi_cntrl->fbc_download &&
>      522             mhi_cntrl->fw_data && mhi_cntrl->fw_sz) {
>      523                 if (!mhi_cntrl->sbl_size) {
>      524                         dev_err(dev, "fw_data provided but no sbl_size\n");
>      525                         goto error_fw_load;
>      526                 }
>      527
>      528                 size = mhi_cntrl->sbl_size;
>      529                 fw_data = mhi_cntrl->fw_data;
>      530                 fw_sz = mhi_cntrl->fw_sz;
>      531                 goto skip_req_fw;
>      532         }
>      533
>      534         if (!fw_name || (mhi_cntrl->fbc_download && (!mhi_cntrl->sbl_size ||
>      535                                                      !mhi_cntrl->seg_len))) {
>      536                 dev_err(dev,
>      537                         "No firmware image defined or !sbl_size || !seg_len\n");
>      538                 goto error_fw_load;
>      539         }
>      540
>      541         ret = request_firmware(&firmware, fw_name, dev);
>      542         if (ret) {
>      543                 dev_err(dev, "Error loading firmware: %d\n", ret);
>      544                 goto error_fw_load;
>      545         }
>      546
>      547         size = (mhi_cntrl->fbc_download) ? mhi_cntrl->sbl_size : firmware->size;
>      548
>      549         /* SBL size provided is maximum size, not necessarily the image size */
>      550         if (size > firmware->size)
>      551                 size = firmware->size;
>      552
>      553         fw_data = firmware->data;
>      554         fw_sz = firmware->size;
>      555
>      556 skip_req_fw:
>      557         fw_load_type = mhi_fw_load_type_get(mhi_cntrl);
>      558         if (fw_load_type == MHI_FW_LOAD_BHIE)
>      559                 ret = mhi_load_image_bhie(mhi_cntrl, fw_data, size);
>      560         else
>      561                 ret = mhi_load_image_bhi(mhi_cntrl, fw_data, size);
>      562
>      563         /* Error or in EDL mode, we're done */
>      564         if (ret) {
>      565                 dev_err(dev, "MHI did not load image over BHI%s, ret: %d\n",
>      566                         fw_load_type == MHI_FW_LOAD_BHIE ? "e" : "",
>      567                         ret);
>      568                 release_firmware(firmware);
>      569                 goto error_fw_load;
>      570         }
>      571
>      572         /* Wait for ready since EDL image was loaded */
>      573         if (fw_name && fw_name == mhi_cntrl->edl_image) {
>      574                 release_firmware(firmware);
>      575                 goto fw_load_ready_state;
>      576         }
>      577
>      578         write_lock_irq(&mhi_cntrl->pm_lock);
>      579         mhi_cntrl->dev_state = MHI_STATE_RESET;
>      580         write_unlock_irq(&mhi_cntrl->pm_lock);
>      581
>      582         /*
>      583          * If we're doing fbc, populate vector tables while
>      584          * device transitioning into MHI READY state
>      585          */
>      586         if (fw_load_type == MHI_FW_LOAD_FBC) {
>      587                 ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
>      588                 if (ret) {
>      589                         release_firmware(firmware);
>      590                         goto error_fw_load;
>      591                 }
>      592
>      593                 /* Load the firmware into BHIE vec table */
>      594                 mhi_firmware_copy_bhie(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
>      595         }
>      596
>      597         release_firmware(firmware);
>      598
>      599 fw_load_ready_state:
>      600         /* Transitioning into MHI RESET->READY state */
>      601         ret = mhi_ready_state_transition(mhi_cntrl);
>      602         if (ret) {
>      603                 dev_err(dev, "MHI did not enter READY state\n");
>      604                 goto error_ready_state;
> 
> And then this goto as well.
> 
>      605         }
>      606
>      607         dev_info(dev, "Wait for device to enter SBL or Mission mode\n");
>      608         return;
>      609
>      610 error_ready_state:
> --> 611         if (fw_load_type == MHI_FW_LOAD_FBC) {
>                      ^^^^^^^^^^^^
> Uninitialized.
> 
>      612                 mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>      613                 mhi_cntrl->fbc_image = NULL;
>      614         }
>      615
>      616 error_fw_load:
>      617         write_lock_irq(&mhi_cntrl->pm_lock);
>      618         new_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_FW_DL_ERR);
>      619         write_unlock_irq(&mhi_cntrl->pm_lock);
>      620         if (new_state == MHI_PM_FW_DL_ERR)
>      621                 wake_up_all(&mhi_cntrl->state_event);
>      622 }
> 
> regards,
> dan carpenter
> 

Thank you for the excellent bug report. I have posted a possible fix at 
https://lore.kernel.org/all/20250214162109.3555300-1-quic_jhugo@quicinc.com/

-Jeff

