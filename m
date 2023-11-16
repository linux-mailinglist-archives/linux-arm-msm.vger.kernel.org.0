Return-Path: <linux-arm-msm+bounces-832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3557EE87C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 21:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 657EBB20A1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 20:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C786495FB;
	Thu, 16 Nov 2023 20:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OgVTdxBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 520BDD4A;
	Thu, 16 Nov 2023 12:50:09 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AGFwFI9012491;
	Thu, 16 Nov 2023 20:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yas7iHHEDuHCRMzzPg2KEmibRFAd4NpCF4nIuDlDRnI=;
 b=OgVTdxBWDAkCAnTprrKYfmEmNZdkbkRVHYBFw+iGA0C1LHerOcoJA6EMy7+wtoKUBs7K
 Kgod9Rr3tUAe3cSYOLolb2SnjWHZhqYdjNixclj1Ly1nutQXDx0OvZO9tAh2zAsT+nBK
 fG8RLkdRRSdKSMOlrDMPTQiyvVxQrLoDg5IzqLKJPq7FliHG/xn3UJqyFoIoKFc+xLqZ
 qA5FZdd3Gki1KN+qR/f7xVg4U8FkWudVTiwlqzCQ+hvXzFVLMFnSY0BLkHhCfp4Vc3st
 /Qd/Ln+KwOOZ/QX/7Yc1N3SUGrXwEtmG8KHOHafH055s+WeqC7Fj1cYGTMjPeNTRbsuk 3Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udeww9s3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 20:49:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AGKnuep005382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 20:49:56 GMT
Received: from [10.110.71.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 12:49:55 -0800
Message-ID: <14cc8193-25cb-668b-f778-beea95e7ccf7@quicinc.com>
Date: Thu, 16 Nov 2023 12:49:55 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: use the correct VREG_CTRL_1
 value for 4nm cphy
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Jonathan Marek <jonathan@marek.ca>, <freedreno@lists.freedesktop.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss
	<rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
        Konrad Dybcio
	<konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:DRM
 DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        open list
	<linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU"
	<linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>
References: <20231110000216.29979-1-jonathan@marek.ca>
 <01b9bc3f-2afb-bd33-1212-d1dc7999b2bc@quicinc.com>
In-Reply-To: <01b9bc3f-2afb-bd33-1212-d1dc7999b2bc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: M_p3D44TFCtBNFGUR99xPok0HlNGrhjO
X-Proofpoint-GUID: M_p3D44TFCtBNFGUR99xPok0HlNGrhjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_23,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 mlxlogscore=919 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160162



On 11/16/2023 12:36 PM, Abhinav Kumar wrote:
> 
> 
> On 11/9/2023 4:02 PM, Jonathan Marek wrote:
>> Use the same value as the downstream driver. This change is needed for 
>> CPHY
>> mode to work correctly.
>>
>> Fixes: 8b034e6771113 ("drm/msm/dsi: add support for DSI-PHY on SM8550")

One error here. We need 12 chars of SHA but you have 13 otherwise 
checkpatch cries

Fixes: 8b034e677111 ("drm/msm/dsi: add support for DSI-PHY on SM8550")

Will fix this up while applying.

>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>> v2: fixed the Fixes: line
>>
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 
> Good catch !
> 
> LGTM
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c 
>> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> index 3b1ed02f644d..89a6344bc865 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> @@ -918,7 +918,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy 
>> *phy,
>>       if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
>>           if (phy->cphy_mode) {
>>               vreg_ctrl_0 = 0x45;
>> -            vreg_ctrl_1 = 0x45;
>> +            vreg_ctrl_1 = 0x41;
>>               glbl_rescode_top_ctrl = 0x00;
>>               glbl_rescode_bot_ctrl = 0x00;
>>           } else {

