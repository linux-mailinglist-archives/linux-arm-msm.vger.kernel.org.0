Return-Path: <linux-arm-msm+bounces-10289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 460EB84ED9D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 00:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E68B6281D12
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 23:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBA76A002;
	Thu,  8 Feb 2024 23:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hgZ0GNT+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDAF69970
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 23:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707434120; cv=none; b=kZJ1aBgfAl+/yARBdx16RYOxi+Jujb5k6QKqkouoCXcL5bZatXJeW01vbLbTzuCyAI0+xXCpT+h1wMam3lwu3nLk3dkPacAgsuHV1gUPLLa3RP3tp3mcGxEQxJFwXofJVs/xsS/HlGoknXmlKfYHPeXp7tmzCjZshSn2ht/F0U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707434120; c=relaxed/simple;
	bh=P1GYo+5oiyoZoSVQDzIWEi0v7FC4XEcNwMwPUVdPDLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T/byDW/aaCL8z00Bo6dyOvgWly7O89sUiukWV1G/ptsHr/zXj+bRCSKeiApNUNUrsjC5g4K3pZ4/GqIH1O6+L39odnb3TR8/GU9GxHO12ljmnCCKeRj7df1Ty/Znz9vl6220U3QnTUNNLo+8cswqK37/FKxBRObOigRLJ/1zdtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hgZ0GNT+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 418KFeVo031468;
	Thu, 8 Feb 2024 23:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ZZhWk+wZgNDiau32NBFz8xDbbuelQTbojXmG3eXWRTA=; b=hg
	Z0GNT+akkxmxwfL0LuwN96SgOczNdUfGsVxf0WyAVBFAiffJ20cEGM8Gv1aK5wkU
	5KBDay2LYnZQyzBDO5jaI1zWJbgAFzH+362kOSkgx4tq2gGRUVNsy9ki/WJHs1Bu
	1C0GeyPO47fZsWg5OYbQ0Pr8+5+DtWUExh7A8psp9y5vPr2CUpy9QBhA8kp9a19o
	aaLCG84gi+uzDHKcv5Rx4xAP2ygws/vu8JVZi/7NbPugKIYS9LOInqG/51WsugJ8
	8z+QoDz33CvEJVNo95ev1N97Hs+4dhdS6Xzkalm+/0Ae1BTLFky6+g50FGtpwdKX
	FA4tTfAKKe3ZUcOG/bMg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4frwujvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 23:15:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 418NF48I006559
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 23:15:04 GMT
Received: from [10.71.111.96] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 8 Feb
 2024 15:15:04 -0800
Message-ID: <c10d0960-c124-5f87-c540-024b97e615e0@quicinc.com>
Date: Thu, 8 Feb 2024 15:15:03 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 4/5] drm/msm/dpu: move writeback's atomic_check to
 dpu_writeback.c
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
 <20240208-fd_remove_phys_ops_atomic_mode_set-v4-4-caf5dcd125c0@linaro.org>
 <0c6a313b-c897-576d-ad74-8a5822622eab@quicinc.com>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <0c6a313b-c897-576d-ad74-8a5822622eab@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MyNjugvMFvBHoTgTM9KOnNYESZ9XHE2H
X-Proofpoint-GUID: MyNjugvMFvBHoTgTM9KOnNYESZ9XHE2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_11,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402080131


On 2/8/2024 10:49 AM, Abhinav Kumar wrote:
>
>
> On 2/8/2024 7:20 AM, Dmitry Baryshkov wrote:
>> dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
>> Move corresponding checks to drm_writeback_connector's implementation
>> and drop the dpu_encoder_phys_wb_atomic_check() function.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 54 
>> -------------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  9 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      | 61 
>> +++++++++++++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |  3 +-
>>   4 files changed, 68 insertions(+), 59 deletions(-)
>>
>
> <Snip>
>
>> +
>> +    crtc = conn_state->crtc;
>> +    if (!crtc)
>> +        return 0;
>> +
>
> This should fix the crash and rest of the change LGTM
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Paloma Arellano <quic_parellan@quicinc.com>
>
>
> Please give us a couple of days to re-test this and give our Tested-by 
> as we plan to rebase CDM over DP on top of this and post V2.

