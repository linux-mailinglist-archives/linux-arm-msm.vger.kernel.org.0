Return-Path: <linux-arm-msm+bounces-10226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 127B084E6B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 18:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C25F9294833
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 17:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176801272A9;
	Thu,  8 Feb 2024 17:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CwnOlqt8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63967823BD
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 17:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707413152; cv=none; b=HbOxgtEGe/b4Q469OoNqGVQU6C3+b0UAiu5rhxNicaxLSE8DqFaoiR0aSyW5/FWYNRfMx78xatyr8eP7MNAP601y3d9DoAVfmcLFCosgcmuP3f+0jGljM1VufJ/yjyy90zBkLBVgyurjmm9lbhZG2TR3Vc5KS8lHZbrUMPIK04o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707413152; c=relaxed/simple;
	bh=dXCKMyCDsM2A8/Jh0kXGITwYbhWjdfBzLa6iptu6tPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PAzbPeI/L4QCSJSO+G2VEQOeG/63VZWjNPi9JRYsLXfrNOrtRMJfj0P2NFPtW95hXKhyBIYZC2M7OqY8QoyA6NgYuwOq7WrehJ+sgKmKWVQQlNGUa3uS0tO4uoxpi+w5Y5T0/e9uLlQkJkujSqBE1OUPxTAxd9+4jJ8/rOA1V8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CwnOlqt8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 418GNJKE024958;
	Thu, 8 Feb 2024 17:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=YuLiQT5SeV5AmnQh+KaZwXI86kCpG1mlWTn1Bu96vcU=; b=Cw
	nOlqt8Ep6Rsd8hnvTOybQ6eYB7+2OArv6b1EHddE8MIkqgyhUQdQQwMIbS9uErUi
	hLcsV6Sl/x5uyFO1B4uMwvbZVgj5tLcv0PqoqPXyXzUXEVWt6i1XGTHegr6AzOOU
	NsMoUgE372CrK4LHuSrRr/eKWMbBhkgXroeYWJNWSOcQ1MMVHPKtZdlUm8UdMf6x
	jdBzrcu5qkMVr7EMEyfskRDWA8JeKNZcmhn82BIMTjEGrbDO7Rr8BOjEE5aNyTDW
	/AGaZ9tqx/HVz55di6pnOyD9ipcr8uRxmv1iJTnm11Faz9MRiB5vQjQBQo5339cg
	E19sbl0KF1TB525tsQnA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4h0ujkx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 17:25:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 418HPWFD008665
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 17:25:32 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 8 Feb
 2024 09:25:31 -0800
Message-ID: <c155fe3c-7b3c-048d-aaf3-ec16e4d6b775@quicinc.com>
Date: Thu, 8 Feb 2024 09:25:31 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240208-fd_document_dsc_pclk_rate-v4-1-56fe59d0a2e0@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240208-fd_document_dsc_pclk_rate-v4-1-56fe59d0a2e0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IheMLyyGhRidtueSP8wonjInbcTPWn_g
X-Proofpoint-GUID: IheMLyyGhRidtueSP8wonjInbcTPWn_g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_07,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 mlxscore=0 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=839 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402080092



On 2/8/2024 7:23 AM, Dmitry Baryshkov wrote:
> Provide actual documentation for the pclk and hdisplay calculations in
> the case of DSC compression being used.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes since v3:
> - refresh rate -> transfer time (Abhinav)
> 
> Changes since v2:
> - Followed suggestion by Abhinav and Marijn to improve documentatry
>    comments.
> 
> Changes since v1:
> - Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
> - Added a pointer from dsi_timing_setup() docs to
>    dsi_adjust_pclk_for_compression() (Marijn)
> - Fixed two typo (Marijn)
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 33 +++++++++++++++++++++++++++++++--
>   1 file changed, 31 insertions(+), 2 deletions(-)
> 


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

