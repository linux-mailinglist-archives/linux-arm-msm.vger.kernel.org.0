Return-Path: <linux-arm-msm+bounces-4314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4AD80E047
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 01:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C1E31C21414
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 00:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75A063E;
	Tue, 12 Dec 2023 00:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VtAPyQgA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0239C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 16:30:28 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BC0CeZo020265;
	Tue, 12 Dec 2023 00:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=CMqWST5bdNwWiRVUIdt7OyY4kPBzACniIhEwyeau/kU=; b=Vt
	APyQgAJkojxpEQmf6T/Ovt0EfGy7GNpKQ5FbCM4eo+HOSTDVJ2gEuF3EAmJiu6tu
	sMqYMri/HvzTCE8Kq2XfxZ/uP9ofT4cHuDFQbLDV9NipMn2Dj0I5kx75XMNi8/2i
	uXgpZIwZ+mAV3d5gPuL8OmpO5yiBTxGzOJShgR6aN0Iw3Nif8smz8jeZUoOUsfY0
	H1+CTi72AkPWFLiCPjIXDhj40SH8YvJ/U8iXRNhXqmxfgpb2G+GF50B5Lw2AXcMY
	bkrPiObfhBj3MDrJ3DAVJEw5r6q4wOtUpkBhhTFYylhMgfkcpOJ34rDNaJJAGnQJ
	CLmq+dcq3Vi7K62KsyNQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux1pdhp5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 00:30:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BC0UI68009634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 00:30:18 GMT
Received: from [10.110.62.164] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 16:30:17 -0800
Message-ID: <06daf3a5-f069-1209-8029-79c766e034e4@quicinc.com>
Date: Mon, 11 Dec 2023 16:30:16 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFT PATCH v2 0/4] drm/msm/dpu: enable writeback on the other
 platforms
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1rqx_Dl5Zzp--hncGxxug2ZAIxrOle8u
X-Proofpoint-ORIG-GUID: 1rqx_Dl5Zzp--hncGxxug2ZAIxrOle8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120002



On 12/2/2023 4:31 PM, Dmitry Baryshkov wrote:
> I was not able to test it on my own, this is a call for testing for the
> owners of these platforms. The git version of modetest now fully
> supports writeback.
> 
> Use libdrm >= 2.4.117, run modetest -ac to determine the writeback
> connector, cat /sys/kernel/debug/dri/0/state to determine
> spare CRTC and plane, then run something like:
> 
> modetest -M msm -a -s 36@85:1024x768 -o test.d -P 79@85:1024x768
> 
> where 36 is the Writeback connector id, 85 is CRTC and 79 is the plane.
> 
> Then press Enter and check the test.d file for the raw image dump.
> 
> Changes since v1:
> - Fixed the DPU_CLK_CTRL_WB2 definition
> 

I think this series needs to be re-based as WB_SDM845_MASK is no longer 
present in msm-next and 3/4 patches in this series use that.

> Dmitry Baryshkov (4):
>    drm/msm/dpu: enable writeback on SM8150
>    drm/msm/dpu: enable writeback on SC8108X
>    drm/msm/dpu: enable writeback on SM6125
>    drm/msm/dpu: enable writeback on SM6350
> 
>   .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 18 ++++++++++++++++++
>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 18 ++++++++++++++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 18 ++++++++++++++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
>   4 files changed, 72 insertions(+)
> 

