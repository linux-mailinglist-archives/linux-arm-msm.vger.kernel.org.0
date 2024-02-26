Return-Path: <linux-arm-msm+bounces-12615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 970268683ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 23:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C4D11F22D15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 22:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DFC133416;
	Mon, 26 Feb 2024 22:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TtGwtBzn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74678132C09
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 22:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708987418; cv=none; b=idkQIVHUeFGUE4/TNLBTJ/0djFc0qP2faSXoDYoBcbT+cm9IHO55noirglIPydwxIqQBgv2pYHh62whsUiEK0rUPM/qJGh4+y33t85ytADkbMBDjZsrrEjRYNUq0AvUf82ppCj+bo4SsNxJ+3eaKO52iQ9AJJo5fErG6/ptYd1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708987418; c=relaxed/simple;
	bh=YGvnF3uX1nQyIBNb/hGeLoc0zs2SRDSIUCLoo6AYTas=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z/OXvtnHFj6j4t0rLeL5udTl5waHzW3DUPyT/zLEL0EyYfjX0Z8i8AYiWm1PoIlA+Uk4KIRyWnbZyHHX5aybOjV2Yoja0rEmCzQwX1HhJ0H+PIFWmgkVwgKYSIxMpOwrTf9LdRACRD9cBM0AgUsoLV7dbengUPOBe35smIc08JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TtGwtBzn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QLn6vv021378;
	Mon, 26 Feb 2024 22:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ZWbXPrxjhVDeIiibeDRIez4zT+ecRa5q9YmguADga+Q=; b=Tt
	GwtBznK4KwHEh8YgapzD+5OhxfAZxPR4FaHaakw9bmVnnf5DuQnOxuJVif2lWR7k
	68REh9Y0Is/YWK3uitKe37H35Z057QfroLAuTrqoM6e6kSy+0StTs4l+46tZbuMI
	fyr98ci8YVhRRpKj8e1pBRrnpg7D5TqPr4T/vCy2RHoh4IKgZlHELo41YYORVDAQ
	XGahMaVP1EtYKNEaS8awEkclcV5ytARRxi4YgweiavSPEQsAhxbppW5J2DBM3qcz
	NdsfcY8VzHNuS6Ii92qh10f1eUQvXjoQ+1zd8H4itkoIhuS6ZcakB7b312LA6mT8
	uhrVl15L1w49lYrQU1hw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxq28y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 22:43:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QMhRYx017405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 22:43:27 GMT
Received: from [10.110.56.192] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 14:43:25 -0800
Message-ID: <59d25296-e285-fdf9-5270-ad0f786768b1@quicinc.com>
Date: Mon, 26 Feb 2024 14:43:24 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dp: fix runtime_pm handling in
 dp_wait_hpd_asserted
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>, David Airlie
	<airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20240226223446.4194079-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240226223446.4194079-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: i-AfnFJ22IsWUHgiTLtIZJcYN5ZBej2q
X-Proofpoint-GUID: i-AfnFJ22IsWUHgiTLtIZJcYN5ZBej2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260176



On 2/26/2024 2:34 PM, Dmitry Baryshkov wrote:
> The function dp_wait_hpd_asserted() uses pm_runtime_get_sync() and
> doesn't care about the return value. Potentially this can lead to
> unclocked access if for some reason resuming of the DP controller fails.
> 
> Change the function to use pm_runtime_resume_and_get() and return an
> error if resume fails.
> 
> Fixes: e2969ee30252 ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_aux.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

