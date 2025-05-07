Return-Path: <linux-arm-msm+bounces-57062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFC6AAD63D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A9913B5B58
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A50210F65;
	Wed,  7 May 2025 06:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UwoD3P+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF082139579;
	Wed,  7 May 2025 06:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599921; cv=none; b=G1vRAKyzYoRLPvt6eKKIoxkcj874B3bOwVRyMUsv9JnnyuUNPg6DhJteQvx5cFEDw0pdCNoQKGbXjqOHtyZMvr9MHVdAWNOyZD41mVsQ9NZGUxa/aaPowIXeSg2QcDiGs0W0SRtlYjbA1TjewKgh6OvjZ24pBIfA6hDXqkdhZFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599921; c=relaxed/simple;
	bh=zoPVNfQfngSR07iIP+gMGPRpdmcR+TKOkCqpe3dtipE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QDJX1TqK1pTX5ckti/3NOgVAVYlo4KXqD+wcyz2W9VOMl/LGR0+AuBtpC9KaL+i9wdI5VTlSYmPrTD5laREOkl0GrmSOXeVd0UOkFJFsbd5nmtAl+IwsJQATBxFIZc4tb4n5fbJ2cHCxWIHH1kmOUzcBEU8FVjeh+a3R+TcIP5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UwoD3P+7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471HmAb017086;
	Wed, 7 May 2025 06:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dYgH+XlFKDus3frugKdFHUJb0KxUeDoyMriUEOT3RUo=; b=UwoD3P+7OVQH/63H
	29Bx8LKdbrsaCjW6cOwF15eNoy8O+TekI6gWRZvgMx/1LyZD2XFWbsmbxqDJcJ9X
	u48jDiNzmn/DzFy2qL3jHwKW6NZ6S9wfopXl+/sit/OozLiaKADnxwe843i0z45g
	kLHjHi1dvnLR4iLIQedMrYgdxnQy9kC8KkO8vZwCfgSV0UJnxf/lE9/grTb/UnGI
	8bT/VkIEaH2aeO4VH9TTs83IIl59Ao6UY0FvWBtkQU3DZjRSkUtLwrwo1bvsvbM0
	l7C8UTzFUM1VcR6alqXkFsYhz9IFamKHMQHxxyRtK5aSdV4R+p/LbXwL4RoRZmvo
	h1eHXQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u44r3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:38:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5476cZIE017059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 06:38:35 GMT
Received: from [10.216.63.157] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 23:38:31 -0700
Message-ID: <b7e630de-07f9-4b21-9055-e9b387627564@quicinc.com>
Date: Wed, 7 May 2025 12:08:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] clk: qcom: Add support for Camera Clock Controller on
 QCS8300
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dmitry Baryshkov
	<lumag@kernel.org>
References: <20250327-qcs8300-mm-patches-v6-1-b3fbde2820a6@quicinc.com>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <20250327-qcs8300-mm-patches-v6-1-b3fbde2820a6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=681affec cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=k8wuuItXO5eEtyapRm4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zCIemlL0gdt5rO_L-xoqI0QSGiRmL84D
X-Proofpoint-ORIG-GUID: zCIemlL0gdt5rO_L-xoqI0QSGiRmL84D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA2MCBTYWx0ZWRfXyHPKY1U6nePd
 96lypzFwuVwtJbLkUwHq3syxzrgfGiEJmDsbOtRbxSmF5UPLhcMAlvO1WDJHBV+u+w56zc5o9+f
 2+IkYa/u9OhwHxULEyABeRjJ9hfhkqQ3JTonayq/tNCB5GnHDicEb529dp1N4E2bR3rF5PlMgat
 FqE0y6a9jMfg3bIAH5ZPzcSS4ERxi7oKJjr1sYbZZ+KvP/8wi4bwSHUgSKO9rp4+6lxWEpTQ0D9
 tawU7uKRMqV6pwbmLrGvQM/UkxHBAyTJeNAB8ksdTXk4DqZdz2C4deuZ4dq5OFBWwQ6KOm3uu8S
 4ud3vi1kIpZUWAwHS7USyj0Ndp9850+AYOoYLoqLj2lWrcU5svnLj5qnninR7aaThGtWmLmE2G1
 FiEtfJwgi75bHFMRszIOKaqP5pbLEA5FWlZ+ynQLrpLkMzDPbEcgO1pTdtJ/wYhLqn6XGrUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070060



On 3/27/2025 3:32 PM, Imran Shaik wrote:
> The QCS8300 Camera clock controller is a derivative of SA8775P, but has
> few additional clocks and offset differences. Hence, add support for
> QCS8300 Camera clock controller by extending the SA8775P CamCC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
> This patch series add support for GPUCC, CAMCC and VIDEOCC on Qualcomm
> QCS8300 platform.
> 
> Changes in v6:
> - Use device_is_compatible() as per Stephen's review comment.
> - Link to v5: https://lore.kernel.org/r/20250321-qcs8300-mm-patches-v5-1-9d751d7e49ef@quicinc.com
> 
> Changes in v5:
> - Subset of this patch series is alreday applied, but CamCC driver patch
> is not picked yet. Hence resend the CamCC driver patch.
> - Link to v4: https://lore.kernel.org/all/20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com/
> 
> Changes in v4:
> - Updated the commit text as per the comment from Bjorn.
> - Fixed the CamCC QDSS clock offset.
> - Link to v3: https://lore.kernel.org/all/20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com/
> 
> Changes in v3:
> - Added new GPUCC and CAMCC binding headers for QCS8300 as per the review comments
> - Updated the new bindings header files for GPUCC and CAMCC drivers.
> - Added the R-By tags received in v2.
> - Link to v2: https://lore.kernel.org/r/20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com
> 
> Changes in v2:
> - Updated commit text details in bindings patches as per the review comments.
> - Sorted the compatible order and updated comment in VideoCC driver patch as per the review comments.
> - Added the R-By tags received in V1.
> - Link to v1: https://lore.kernel.org/r/20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com
> ---
>  drivers/clk/qcom/camcc-sa8775p.c | 103 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 98 insertions(+), 5 deletions(-)
> 

Hi Bjorn,

Could you please help pick this CamCC driver patch? The DT and bindings patches are picked already from this series, expect for this one.

Please let me know if anything is required from my end.

Thanks,
Imran

