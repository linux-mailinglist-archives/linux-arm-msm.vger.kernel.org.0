Return-Path: <linux-arm-msm+bounces-53585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD78A81454
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 20:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92DDA883E34
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 18:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D399723E25B;
	Tue,  8 Apr 2025 18:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DbyzvJnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F06224AE0;
	Tue,  8 Apr 2025 18:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744136015; cv=none; b=g0L5YZ7yM4XUUgTD6FSW4QakIdMIi8UKKUAM3zSfKRUG0uQx4qb/YYBII5mdK2HHMbZCsbDxEvURpPQXR0xGXtl0AA17B47leRYNlZUDvqC4z7EfOWSCdoKVTCdMh4+LzU3pRVq+qYz/kGqB+CB1wJojeE9Isd7Lwqen+iPyP8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744136015; c=relaxed/simple;
	bh=wdMng98/x4kl6XcJDgkqzLDlA8cJTi2eaOzpqoSa4b4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dBkVjAepMsnnCN6HAYpfKem38Om6BlvhtduTqf5VNlcMxnacAgE5na7KRY3Uc97EwPob+ma5SILRqGRcciRKimXS/IWmz7zMdSxWCEQtyZDdBymhLwcJKvSd05eV3DL1P1UzpTYDg2KsT9FJqqh3wAVCv7GCPoKywDlK8Hk96sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DbyzvJnU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538B31IJ015072;
	Tue, 8 Apr 2025 18:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0y6b8/5pR/Ib0BDUjpJtu40s1XQAZ2OxuSBQWOHL8RY=; b=DbyzvJnUPDvzHqYm
	09PoifKgkbJNCbAL2LEtGpOG7SA1xqVdiKx4+1NOEZO/GgbWRRLtIQ6a2dho1I+/
	V2LGJpdDSG9xhP2RY1Np1qz3tS/f2lqccDx3H9LTaqJHPlJSVIAO5gOv3Dbm4Bf3
	8FJuoOHSjo5LXl5wRcxlaF38f/WSuCJGnPcm9ZxuIDfycHHuLPXb+tIqkHJ8me9t
	5xFapYd6qLk0Ho2mve7Ow0l4aHp/B/FK5qr3LRp2QwGwRx+n0rYXOP1cVKSCyVKJ
	+x+WaPJBwHzrqEzkfpo6Ihako1UBzlb/Db7GpDpOL8FJ3h+gjGZX8xyoLBZxyVSr
	Wqi+XQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbuguxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 18:13:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538IDPrF006879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 18:13:25 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 11:13:24 -0700
Message-ID: <5e64069f-d93e-404f-a4f1-99f2ef101f5f@quicinc.com>
Date: Tue, 8 Apr 2025 11:13:15 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Fix error pointers in
 dpu_plane_virtual_atomic_check
To: Chenyuan Yang <chenyuan0y@gmail.com>, <robdclark@gmail.com>,
        <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <airlied@gmail.com>,
        <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250314011004.663804-1-chenyuan0y@gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250314011004.663804-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ry4NnG94CZzaGpJUKZUINO3P1cdbO0Qa
X-Proofpoint-ORIG-GUID: ry4NnG94CZzaGpJUKZUINO3P1cdbO0Qa
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f56746 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=fWY0QR86pWCIX_IcxasA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_07,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1011 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080125



On 3/13/2025 6:10 PM, Chenyuan Yang wrote:
> The function dpu_plane_virtual_atomic_check was dereferencing pointers
> returned by drm_atomic_get_plane_state without checking for errors. This
> could lead to undefined behavior if the function returns an error pointer.
> 
> This commit adds checks using IS_ERR to ensure that plane_state is
> valid before dereferencing them.
> 
> Similar to commit da29abe71e16
> ("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed").
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +++
>   1 file changed, 3 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

