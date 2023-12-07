Return-Path: <linux-arm-msm+bounces-3602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03019807DA0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 02:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87E80281E71
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 01:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33ECC1100;
	Thu,  7 Dec 2023 01:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WnbZ89vX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6913C10D;
	Wed,  6 Dec 2023 17:09:57 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B70dVlg012927;
	Thu, 7 Dec 2023 01:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JPdO/uN/Su6nXISn/OuEsAh8vo5IilsEU6w+tY8QL5M=;
 b=WnbZ89vXDiowinQ6++xwv0+C8d/rA7dbZNpkvFVQcfLO/Ye9Nn3uiBu6JIfpOzWpVD3K
 g2vbMst3LLhq4xaKliI/UU2UGK/inu6ulsXuUzNCHYaouBO3QMVtsJoB09tM2J8+0541
 EsD3c0fvZx3zIpRuCzdBIyujE7+kFzu2enK7RIctnm8fknxDBKgs6hrsm6KLhyWBnPGv
 9I7INmrBGUAsWiz4XpIe7L/uggKgjczwc8rQnwunNvCTPfa6ZEkhLh0iy9t6fzuLHwul
 bjbkhyrVRKwr4DsmXdaxzH9ldq19kcQOWBuK9tOxneLwqnSwPLk0IImvEhZAUdLvEnrd pg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uu2p885a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Dec 2023 01:09:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B719lal004719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Dec 2023 01:09:47 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 17:09:44 -0800
Message-ID: <50201766-c033-37fd-2219-6a98ba919e0b@quicinc.com>
Date: Wed, 6 Dec 2023 17:09:43 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 15/16] drm/msm/dpu: add NV12 in the list of supported WB
 formats
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <quic_parellan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-16-quic_abhinavk@quicinc.com>
 <CAA8EJpp=kr0XTrzq0sjssDh3oJYLqYHZjpDxeyKDxV5jfTcaBA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpp=kr0XTrzq0sjssDh3oJYLqYHZjpDxeyKDxV5jfTcaBA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uQffHaRbOREM4oSkAxDH0_6azDJ2hC2o
X-Proofpoint-ORIG-GUID: uQffHaRbOREM4oSkAxDH0_6azDJ2hC2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_22,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312070007



On 8/30/2023 5:26 PM, Dmitry Baryshkov wrote:
> On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Since CDM block support has now been added for writeback blocks
>> add NV12 in the list of supported WB formats.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 713dfc079718..978330c6678e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -244,6 +244,7 @@ static const uint32_t wb2_formats[] = {
>>          DRM_FORMAT_BGRA4444,
>>          DRM_FORMAT_BGRX4444,
>>          DRM_FORMAT_XBGR4444,
>> +       DRM_FORMAT_NV12,
>>   };
> 
> No. This way the driver would announce availability of NV12 even on
> chipsets where NV12 is not supported for the writeback. Please define
> separate formats array.
> 
> BTW: does HW only support NV12 for the writeback? What about YV12 or e.g. NV21?
> 

Yes, as we discussed in the prev patch, I will split the wb2_formats 
array to RGB only and RGB+YUV to address this issue.

Regarding the full list of supported formats, here it is:

https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/clo/main/msm/sde/sde_hw_catalog_format.h?ref_type=heads#L107

But YUV420 shouldnt be here as its not supported.

I have to see if I can add some test cases in IGT to validate NV16 and 
DRM_FORMAT_YUYV. Hence I only exposed this one for now.

>>
>>   /*************************************************************
>> --
>> 2.40.1
>>
> 
> 

