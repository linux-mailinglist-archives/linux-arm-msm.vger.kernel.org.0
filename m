Return-Path: <linux-arm-msm+bounces-24168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79563917296
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 22:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 315ED2828B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 20:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB03117CA04;
	Tue, 25 Jun 2024 20:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l1UHno/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456134C6E;
	Tue, 25 Jun 2024 20:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719347964; cv=none; b=STYCi1LcV6jSPaAcRf9S8X0gtp5iH7USZm999zE+jkhL4ujZcKJBs6xJj7Pz7QVlAohRZU0/8U/Gpg/gDF/VgYoN93/r8mTGtcCPuYIDvPCBPCHPyuD+LqfFU0Spx3cooryehGO2RMcTSpwQbHj0MeFGu6mJ/lOnJmelLxT0DHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719347964; c=relaxed/simple;
	bh=3jocSJnFLbmyyO47DUiNcyWfDSkHyKKQbvSYdAZPykg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s9ysNOXksOxuFD/Diwq1eTVSrX3nkKQenzpuECv7KVzNCqYLhyTU2+cLRz2idFduEm7jkYrw4/6ASkMAZG5z8/+4KIZ7ymdRfk/U/AAjLreG7j9/YW1scXFir1azPWBg5jmf0Q6ouiai5mJ5SXYC4TuG1fszB9i++0ePMTCokjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l1UHno/i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PIOe90018112;
	Tue, 25 Jun 2024 20:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3GxWyz9rZduaL4zHi+nmPPNIoRc5WAVW6C8yaRenAlQ=; b=l1UHno/iE4bMYBCR
	yFQAjOANH/Mi17CqcEl4KpdDIYg02gR3qtbHLHdzpbAi29uBjF/wvJyrkczGS1Kg
	0uWhM2DOycqxF4NsjYla/JM66LWXeLpUbgMN451Tve25AiEsaGiPgiXF+TzeBYpK
	e81KthboS0OriBiIVgyjJodAok4vRZKDq1uxH3Iu4EOM69yR4BT2DdAA2OsbLrRG
	CWV3pVxMIM+2LSVgX5SpzqlSaB/ncJ7/yUk0aMjeN1ytrQ5++rgyiXzaBjrTcawZ
	VV38uHYoTy2l/my9v4FhQT0sNAvmVoN78os9HdE03il3Dt9uMw1KmQgkH9WR3/qv
	UU4DYw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnm6qgu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 20:39:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PKdC27019525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 20:39:12 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 13:39:11 -0700
Message-ID: <a26650a6-02d7-3626-ac19-a0fe359f631e@quicinc.com>
Date: Tue, 25 Jun 2024 13:39:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v3] drm/msm/dpu: Configure DP INTF/PHY selector
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Bjorn Andersson <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20240625-dp-phy-sel-v3-1-c77c7066c454@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240625-dp-phy-sel-v3-1-c77c7066c454@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5z1hDhsuBkNu_gNyMIF6q66Lf3XieUcV
X-Proofpoint-ORIG-GUID: 5z1hDhsuBkNu_gNyMIF6q66Lf3XieUcV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_15,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406250152



On 6/25/2024 1:24 PM, Dmitry Baryshkov wrote:
> From: Bjorn Andersson <andersson@kernel.org>
> 
> Some platforms provides a mechanism for configuring the mapping between
> (one or two) DisplayPort intfs and their PHYs.
> 
> In particular SC8180X requires this to be configured, since on this
> platform there are fewer controllers than PHYs.
> 
> The change implements the logic for optionally configuring which PHY
> each of the DP INTFs should be connected to and marks the SC8180X DPU to
> program 2 entries.
> 
> For now the request is simply to program the mapping 1:1, any support
> for alternative mappings is left until the use case arrise.
> 
> Note that e.g. msm-4.14 unconditionally maps INTF 0 to PHY 0 on all
> platforms, so perhaps this is needed in order to get DisplayPort working
> on some other platforms as well.
> 
> Signed-off-by: Bjorn Andersson <andersson@kernel.org>
> Co-developed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v3:
> - Expanded the commit message and in-code comment based on feedback from
>    Abhinav
> - Fixed field masks for the affected register (Abhinav)
> - Link to v2: https://lore.kernel.org/r/20240613-dp-phy-sel-v2-1-99af348c9bae@linaro.org
> 
> Changes in v2:
> - Removed entry from the catalog.
> - Reworked the interface of dpu_hw_dp_phy_intf_sel(). Pass two entries
>    for the PHYs instead of three entries.
> - It seems the register isn't present on sdm845, enabled the callback
>    only for DPU >= 5.x
> - Added a comment regarding the data being platform-specific.
> - Link to v1: https://lore.kernel.org/r/20230612221047.1886709-1-quic_bjorande@quicinc.com
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 39 +++++++++++++++++++++++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h | 18 ++++++++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h   |  7 ++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 12 ++++++++-
>   4 files changed, 70 insertions(+), 6 deletions(-)
> 

LGTM.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

