Return-Path: <linux-arm-msm+bounces-23674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0F59130E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 01:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9691C21AE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 23:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502EF16E88F;
	Fri, 21 Jun 2024 23:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OMS2VTO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6578BFD;
	Fri, 21 Jun 2024 23:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719012949; cv=none; b=t8KZK7NULEBtHRmEGdTsIG7MDPrbCap2CXvraox9dgjSbdQhL/zZxDrGsorJ9buIFRqDRvq0A18J0KkPlvKIITwdgLt6a3xzFxtHKD86Yr9Z/qEcqI1I3E5vW5DHN/xMOAgHp3hwOvxm4Mo1tByOAzxuCeBAlBGu4nziZSZdli0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719012949; c=relaxed/simple;
	bh=wI/MmpInpGN8jFEaSr2Ua9ZzRqEP7bqpQczxkI9kcCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eWKhfA1BCOQSlQeNsKXpXvS6MgbEVqAHROn0x4FKb/DtGxZnpePEbC7qbVcBwtudIvVDJvrb8KGvuLegSBNbHMXpvycHdAgjxLGjcOQD5X4TXbMMpP1Z032OBR6AN199KBboQmTohT5/Zx2gE0mf1zw/HA6Cn5hLVEIBpr+yznI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OMS2VTO3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LFdtQV024594;
	Fri, 21 Jun 2024 23:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cCqINgIEA9bIRiKGAutcHDJ0oko6p8h3rIp1QCCI9Zs=; b=OMS2VTO321BEwqIq
	I5rvE8F5Z6rv/q6xFroIpxRRI4cZTY9Gpuea0j1pOXybHd6yc8DjVkF0lviNtvMY
	q2cgYPXxD9kYqXEMr5mwDCP1HtfmKrWjDA3voE0H8NGcplKuSPQ86bkSmnWv95ZP
	YjM3goR6CFpG+r+/NkwFI2p3Nz8DzpNUgYfz7aQDxGNH1+bXsmiap/lu/eKm41S4
	jx24rojRgbZN1jLNXp/sDKippfq9V2Uxqmn7eszkIWCEJSLc+IDF1IXiDmT0PdvC
	ZkEXm1R822oeVW5bI9cFsTAb69/gMTPum1T4q+fgfnn63biwKymUWVvPf2+pP7uK
	Ny3a9w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywcb28uks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 23:35:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LNZHkW022470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 23:35:17 GMT
Received: from [10.110.82.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 16:35:12 -0700
Message-ID: <355e5bee-a31b-6879-06ea-cf04ba2e179f@quicinc.com>
Date: Fri, 21 Jun 2024 16:35:10 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 1/4] drm/msm: register a fault handler for display mmu
 faults
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dianders@chromium.org>,
        <quic_jesszhan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
 <20240517233801.4071868-2-quic_abhinavk@quicinc.com>
 <uywsmpko7ttzqxtlw6i4n5y7zvny5xgdoxc66azbts7cx6vi5d@myrilzxtu7le>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <uywsmpko7ttzqxtlw6i4n5y7zvny5xgdoxc66azbts7cx6vi5d@myrilzxtu7le>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B2U0h7vV6Y0lWSu5nEqM_2cilzuyTH_Q
X-Proofpoint-ORIG-GUID: B2U0h7vV6Y0lWSu5nEqM_2cilzuyTH_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_12,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210172



On 5/19/2024 1:38 AM, Dmitry Baryshkov wrote:
> On Fri, May 17, 2024 at 04:37:56PM -0700, Abhinav Kumar wrote:
>> In preparation to register a iommu fault handler for display
>> related modules, register a fault handler for the backing
>> mmu object of msm_kms.
>>
>> Currently, the fault handler only captures the display snapshot
>> but we can expand this later if more information needs to be
>> added to debug display mmu faults.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_kms.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
>> index af6a6fcb1173..62c8e6163e81 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.c
>> +++ b/drivers/gpu/drm/msm/msm_kms.c
>> @@ -200,6 +200,28 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>>   	return aspace;
>>   }
>>   
>> +static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void *data)
>> +{
>> +	struct msm_kms *kms = arg;
>> +	struct msm_disp_state *state;
>> +	int ret;
>> +
>> +	ret = mutex_lock_interruptible(&kms->dump_mutex);
>> +	if (ret)
>> +		return ret;
>> +
>> +	state = msm_disp_snapshot_state_sync(kms);
>> +
>> +	mutex_unlock(&kms->dump_mutex);
>> +
>> +	if (IS_ERR(state)) {
>> +		DRM_DEV_ERROR(kms->dev->dev, "failed to capture snapshot\n");
>> +		return PTR_ERR(state);
>> +	}
>> +
>> +	return 0;
> 
> Hmm, after reading the rest of the code, this means that we won't get
> the error on the console. Could you please change this to -ENOSYS?
> 

I am perhaps missing something here. Are you referring to this 
documentation?

  * Specifically, -ENOSYS is returned if a fault handler isn't installed
  * (though fault handlers can also return -ENOSYS, in case they want to
  * elicit the default behavior of the IOMMU drivers).
  */
int report_iommu_fault(struct iommu_domain *domain, struct device *dev,
                        unsigned long iova, int flags)

Doesnt this mean ENOSYS is when fault handler is not installed?

Because the console print will come if we return 0?

         if (!report_iommu_fault(ctx->domain, ctx->dev, iova, 0)) {
                 dev_err_ratelimited(ctx->dev,
                                     "Unhandled context fault: fsr=0x%x, "
                                     "iova=0x%016llx, fsynr=0x%x, cb=%d\n",
                                     fsr, iova, fsynr, ctx->asid);
         }

>> +}
>> +
>>   void msm_drm_kms_uninit(struct device *dev)
>>   {
>>   	struct platform_device *pdev = to_platform_device(dev);
>> @@ -261,6 +283,9 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>>   		goto err_msm_uninit;
>>   	}
>>   
>> +	if (kms->aspace)
>> +		msm_mmu_set_fault_handler(kms->aspace->mmu, kms, msm_kms_fault_handler);
>> +
>>   	drm_helper_move_panel_connectors_to_head(ddev);
>>   
>>   	drm_for_each_crtc(crtc, ddev) {
>> -- 
>> 2.44.0
>>
> 

