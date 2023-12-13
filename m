Return-Path: <linux-arm-msm+bounces-4496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D5F81084D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 03:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13D1F1C20A91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 02:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5EA186C;
	Wed, 13 Dec 2023 02:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Iw1rxKZz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76647A0;
	Tue, 12 Dec 2023 18:37:19 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BCNxLTA013353;
	Wed, 13 Dec 2023 02:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=GH7d3b3O5n+iS8TUgWJ4YhWeM/IfUOQCdp64CsAQ4PU=; b=Iw
	1rxKZz6PGDH+5HpuFHwYbnPDSUSbotdpkqhjNEWPAoftLQl0U+1MaYous2wXzBcf
	kbB/3xjtT8bO2WVAWUKKCIc51zchOz/C0EOrERt7wz1fcMilR5ZHeqwP5Yp29pC2
	HWuYDXwtOQ7/pzKcS35KiOC7onek+Ro6E4TTEH0OcD17Zq9HzGe4hhASPwBYRiZV
	TJcNhvsPETbiaoXXlZf+kOInLPND0kcuJyhCPcq/jZfKYubdZsY+FZbS8R/f72jU
	OEG3Q9igha4GXAwKYrsiYYuomRlUns8dpywltsx3gCUqC+YuHdiPcx8yzJfqHwRj
	S3uA92rb00ciFWR6xLdw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux65341fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 02:37:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BD2bBJk011457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 02:37:11 GMT
Received: from [10.110.0.246] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 18:37:09 -0800
Message-ID: <27423c14-bdcb-4053-a7c3-b2c9d6c4e771@quicinc.com>
Date: Tue, 12 Dec 2023 18:37:08 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Freedreno] [PATCH 0/2] drm/msm/dpu: INTF CRC configuration
 cleanups and fix
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, David Airlie <airlied@gmail.com>,
        <quic_abhinavk@quicinc.com>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        "Daniel
 Vetter" <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>
References: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
 <CAA8EJpof5LO7pyXaqgtbL=sL2a2Te2tzLF-NrTFT7n58pB3iww@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJpof5LO7pyXaqgtbL=sL2a2Te2tzLF-NrTFT7n58pB3iww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0jf2xS-RJCDQoDu-F6Vv1z690TgLCCND
X-Proofpoint-GUID: 0jf2xS-RJCDQoDu-F6Vv1z690TgLCCND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312130017



On 11/30/2023 11:39 PM, Dmitry Baryshkov wrote:
> On Fri, 1 Dec 2023 at 03:31, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> This series drops the frame_count and enable parameters (as they're always
>> set to the same value). It also sets input_sel=0x1 for INTF.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>> Jessica Zhang (2):
>>        drm/msm/dpu: Drop enable and frame_count parameters from dpu_hw_setup_misr()
>>        drm/msm/dpu: Set input_sel bit for INTF
> 
> Please change the order of the commits: fix (input_sel) comes first,
> then comes the improvement.
> Otherwise if one needs to backport this fix, they either need to pick
> up the irrelevant patch, or they have to rework the fix.

Acked.

Thanks,

Jessica Zhang

> 
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  6 +++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  3 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 18 +++++++-----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 11 +++++------
>>   8 files changed, 26 insertions(+), 30 deletions(-)
>> ---
>> base-commit: 4047f50eb64d980fcd581a19bbe6164dab25ebc7
>> change-id: 20231122-encoder-fixup-61c190b16085
>>
>> Best regards,
>> --
>> Jessica Zhang <quic_jesszhan@quicinc.com>
>>
> 
> 
> -- 
> With best wishes
> Dmitry

