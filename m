Return-Path: <linux-arm-msm+bounces-23673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 774969130DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 01:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F7711F244D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 23:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FD416E88F;
	Fri, 21 Jun 2024 23:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mt9JfZm2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB71A8BFD;
	Fri, 21 Jun 2024 23:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719012733; cv=none; b=mw7sUfxi8Wqqe9pFKRw7+Pi4Ols20ihHAuMHD9ozhlIHGRc4Yg8tHbLvL15qVAaFma/UO6fxD2BK7+OB6yQM5SF/J7pZ4chH5Lm8oYeb57mcNrziStePGIQSPutBrlBjCk3Jn+DUbzYjG5wGTklEUPXhB00nUtkrsE/oCA/xUL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719012733; c=relaxed/simple;
	bh=ooVu2W+mUX1vDgOqQX2Aa/gb3KRckRkVC2Ra+5tsEK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UTnY+G61j+7NRTzD89ygswSWI+cedcEvx8hLhtQY57s6FMSHdZuthC4CiTDVbzgtvhACtgVcM7myxo3ssH968OmezD3F6NZZX3gwXWULnfuLjrWzeKtLGK4MA/0sqj+1R9vrvoYPh3jt+srqIgYfQlOwt8Q2VKcfSAQ4C3gVJqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mt9JfZm2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LF6O4L003415;
	Fri, 21 Jun 2024 23:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YT9lB03hb+BN7VK93Q5NAjlKC6SCVjFLDRiXDwk2tKE=; b=mt9JfZm2PfDLrXzF
	sNUAZuJ910VrpW+UuEl5C5WneUCg12PLFdYXKgwhUI5Wyp2LCWOOMQ3BsyAOvXIa
	x6etXcAWjdd5zK6hXhAeFac0ZDStGWJYJcJ9eD0rySDiP1Z7Tmsy4f/Rj79S1tsJ
	nwZ9LYTN4AGjOPEORVtJosHA5v0AyTjqsIK1xt+G+PnCVLGNknWPlQ9jb2LXH1eP
	AlR0SWKo5bFf10OPP4Cr41DIZZ42WaWsLiISDnBFAXcUjD3YOYoOaLHj/m25TpMT
	Cjrj1AxhMfXNTF6nmFzIqTcXGmHRfVKOZ82Q6QkgyotRhHyNUqDOFzjWxxN8BbgU
	z+G8EA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yw49et6mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 23:31:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LNVu62012299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 23:31:56 GMT
Received: from [10.110.82.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 16:31:51 -0700
Message-ID: <70942425-af39-4bbc-4ab4-8124e336b666@quicinc.com>
Date: Fri, 21 Jun 2024 16:31:48 -0700
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
 <cwo63ra2ogrdr3ywmiuxewzuxzsyozyqfcict7xs5kp6uwy2qp@7e6fgb7oyszc>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <cwo63ra2ogrdr3ywmiuxewzuxzsyozyqfcict7xs5kp6uwy2qp@7e6fgb7oyszc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4iej3wq8MMtUpWAcGM_z5FirZKu-Flg7
X-Proofpoint-GUID: 4iej3wq8MMtUpWAcGM_z5FirZKu-Flg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_12,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210171



On 5/19/2024 1:31 AM, Dmitry Baryshkov wrote:
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
> 
> Can we move this to msm_kms_init_aspace() instead of checking for
> kms->aspace?

Ack.
> 
>>   	drm_helper_move_panel_connectors_to_head(ddev);
>>   
>>   	drm_for_each_crtc(crtc, ddev) {
>> -- 
>> 2.44.0
>>
> 

