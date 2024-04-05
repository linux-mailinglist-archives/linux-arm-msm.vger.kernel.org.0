Return-Path: <linux-arm-msm+bounces-16587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2E089A472
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 20:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45A6A283C1B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 18:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF1653398;
	Fri,  5 Apr 2024 18:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nFS9tEu1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7B0172796
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 18:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712343451; cv=none; b=nILQ+NWKzO1/buJLBrhSZs8KrFi7c3nZRjPIXeVxfn4UwHM8HbQtO1/p9Fzuzai92nODUE94ljz32Ehcdcu0pqz+X3gjJG/xRSEJv6xkoDXAa+CdRpjaMaDUC0muMk5uKyZZQLr7rpDG7ZK7WHm7o+Da/A3ucNm2LnMloO70tP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712343451; c=relaxed/simple;
	bh=T1RqhSjs554X4M+G+jvRr4Fzq3CU7e7Z6d1HX7Ch+pA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HPKfDHLlzTOGSr41RcRxt9IspbPvhBAH+kBKdAYdbmURkKaWpmgbCvNqbWZhKpygw7fwl3vAut6l/lUBBT334ctIHJS/nqj6ERm0OoezNvMCDr2wPyHoeNJwPYV80GCfFQ120/H7e7abPHRpX0AWrgHoNGDclVfPyY7DqyqMPd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nFS9tEu1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 435IGFWA003651;
	Fri, 5 Apr 2024 18:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EPl9lAk4jK5sZiImCsNZdRSyV30Fl0e7HcokMtTQ8lI=; b=nF
	S9tEu1YZuNxY+1U0wBgEdT7VozC4jE4h3HYEHpy/ep1sRHqlaqnk25CKlKzqKoUy
	jgaMa43KslxWprl6GsGdw6aKQNJmwqHZdV63GePGGnGcvxqf7/304bkkd6kTMVi4
	0LLzbfQboiheOdukId4q5tlL2Ymzg5vcfT5FPHLwVUUKs9Ou9T5/YXmwfHdno4FJ
	PcdOwicAAj2rhUWeRDVhi8Ist2XyL/PyliwXq8dno9HwLZtgYWLeOmkREc29b5L1
	SVwcfXS49hiylxNWIQqHckKEsH85RYuBAFL/nv8J73C+1t8bhCQJ2LRgvcd8rk8j
	Lcba+Aa6/PGlAUmpep+w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xad7h1euj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 18:57:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435IvHha022365
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Apr 2024 18:57:17 GMT
Received: from [10.110.24.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 11:57:16 -0700
Message-ID: <4c187516-d685-8eb1-d5ae-43f68d76feed@quicinc.com>
Date: Fri, 5 Apr 2024 11:57:15 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/msm/dsi: remove the drm_bridge_attach fallback
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
 <20240309-fd-dsi-cleanup-bridges-v1-1-962ebdba82ed@linaro.org>
 <88b3722e-aa46-1ffe-9f0f-1939d43e0100@quicinc.com>
 <CAA8EJppbETLONx8pEdT1kT1Hp1i405m-4PfgumvvOa9N2mh6CA@mail.gmail.com>
 <363efce2-5540-b81a-31be-b5919635b586@quicinc.com>
 <CAA8EJpoPbK6rEKG9mh2pfo1tp8Rrn7oqXt50j0q2O5v50A8Zjg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoPbK6rEKG9mh2pfo1tp8Rrn7oqXt50j0q2O5v50A8Zjg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3sDpEs3Q1QJ7YYrwpme2ctXN6yRsHvWB
X-Proofpoint-ORIG-GUID: 3sDpEs3Q1QJ7YYrwpme2ctXN6yRsHvWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_21,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 mlxlogscore=834 clxscore=1015 mlxscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404050133



On 4/5/2024 11:19 AM, Dmitry Baryshkov wrote:
> On Fri, 5 Apr 2024 at 21:17, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 4/5/2024 11:16 AM, Dmitry Baryshkov wrote:
>>> On Fri, 5 Apr 2024 at 20:20, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 3/9/2024 7:09 AM, Dmitry Baryshkov wrote:
>>>>> All the bridges that are being used with the MSM DSI hosts have been
>>>>> converted to support DRM_BRIDGE_ATTACH_NO_CONNECTOR. Drop the fallback
>>>>> code and require DRM_BRIDGE_ATTACH_NO_CONNECTOR to be supported by the
>>>>> downstream bridges.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/dsi/dsi_manager.c | 36 +++++++++++------------------------
>>>>>     1 file changed, 11 insertions(+), 25 deletions(-)
>>>>>
>>>>
>>>> There are the bridges I checked by looking at the dts:
>>>>
>>>> 1) lontium,lt9611
>>>> 2) lontium,lt9611uxc
>>>> 3) adi,adv7533
>>>> 4) ti,sn65dsi86
>>>>
>>>> Are there any more?
>>>>
>>>> If not, this LGTM
>>>>
>>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>>   From your message it looks more like Tested-by rather than just Reviewed-by
>>>
>>
>> No, I only cross-checked the dts.
>>
>> So, its only Reviewed-by :)
>>
>> But I wanted to list down all the bridges
> 
> Then I'd also nominate the panel bridge to the list of bridges for
> cross-checking. It is created automatically when we request a bridge,
> but DT has only a panel.
> 

Yes, that one is fine too

58 static int panel_bridge_attach(struct drm_bridge *bridge,
59 			       enum drm_bridge_attach_flags flags)
60 {
61 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
62 	struct drm_connector *connector = &panel_bridge->connector;
63 	int ret;
64
65 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
66 		return 0;
67

