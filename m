Return-Path: <linux-arm-msm+bounces-25733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B5492C36D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 20:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 670CA1F21F06
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 18:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270E1180046;
	Tue,  9 Jul 2024 18:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QNYF5UT2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DFC18002F;
	Tue,  9 Jul 2024 18:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720550627; cv=none; b=CMrBCN71uxrtUz2BrAX20SL7BF44yhUt3IygxkF4Nzaio/PMw+vJ4E8eC4cgYgl2on2RLEVk36u2buiOSE2MWDy6WYItF7ZR/sx2Xf47VFzgS5EKBLhn0nktA0NRdPZMZJnWKA26E+eidX12nko6cpZ+Z1SYZ7Fz5cx2JK5LhYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720550627; c=relaxed/simple;
	bh=sV0QNiu1ACdOwHExfhARey+8qdFXfJgWgtnl0Lf31yQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dWgKskOHQpdwnTo6w7nGBfgdRQiggVLDk186gaRqKz/IQlKOLJdpA3H/oLqY8tLOYNQrp5D9D8AhHkbwY4Fru1T9cy4NKFRdoPAU4ZGqmlswI/K+T+QuG72Zj27w/tP8Cvfutv8pRccRbTGPsUbHdIsUyK3bJvbimHmU+KkLjVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QNYF5UT2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469DuWEM001325;
	Tue, 9 Jul 2024 18:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qx6une2YhOK6cKGgEHtW+BpepZHrWXU+G+j+pEyAC4w=; b=QNYF5UT2yd5HreEx
	TeWF71+Kzpal0OUgp839p/TtebHNLNmV2aAKkHERfnhjzHkpLNqoz/gZO0VbFuQf
	8juG9jiKXmre5Eie87p6eretzHTTHwoYiwBpd7Id+vfSzBsBXTKKWhyR8B78Vh4l
	XuOHg72zTL/PeTpJgcQ5EiCn8EDd21ZAg2h3FS+zCENGN653zNyN8dctQRiy9Ikh
	rDNXHQj/gIkGBE5LV2RBvv5MVFVAOaypmsWGxkhTlzptYZnB5T8j4eLy2kyBtTPf
	hf+hFj43ikaPMZsUoAFavNQpRnlAgkaSghQHa5oYrYSWmhIuw4duMM4FEljQQ/nO
	7EBu8Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406we8y7h8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 18:42:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469IgN7B026072
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 18:42:23 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 11:42:22 -0700
Message-ID: <8376e3a1-0630-f489-8938-a1c77eaccdf8@quicinc.com>
Date: Tue, 9 Jul 2024 11:42:01 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm/dpu1: don't choke on disabling the writeback
 connector
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Chandan
 Uddaraju <chandanu@codeaurora.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Archit Taneja
	<architt@codeaurora.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Jeykumar
 Sankaran <jsanka@codeaurora.org>, <stable@vger.kernel.org>,
        Leonard Lausen
	<leonard@lausen.nl>
References: <20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org>
 <20240709-dpu-fix-wb-v1-1-448348bfd4cb@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240709-dpu-fix-wb-v1-1-448348bfd4cb@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2ntLbvO9KprV2q3qVEJ1cQebCIomZGgk
X-Proofpoint-GUID: 2ntLbvO9KprV2q3qVEJ1cQebCIomZGgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_08,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407090126



On 7/9/2024 6:48 AM, Dmitry Baryshkov wrote:
> In order to prevent any errors on connector being disabled, move the
> state->crtc check upfront. This should fix the issues during suspend
> when the writeback connector gets forcebly disabled.
> 
> Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
> Cc: stable@vger.kernel.org
> Reported-by: Leonard Lausen <leonard@lausen.nl>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 16f144cbc0c9..5c172bcf3419 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -39,6 +39,13 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
>   
>   	DPU_DEBUG("[atomic_check:%d]\n", connector->base.id);
>   
> +	crtc = conn_state->crtc;

We are checking for !conn_state a few lines below but we are 
dereferencing conn_state here.

This is bound to hit a smatch error and also does not look right.

If conn_state will always be valid, we should drop that check too rather 
than checking it later.

Coming to the issue itself, I tried checking the logs but it was not clear.

During force disable, were we hitting below check and hence the 
connector was not getting disabled?

else if (conn_state->connector->status != connector_status_connected) {
                 DPU_ERROR("connector not connected %d\n", 
conn_state->connector->status);
                 return -EINVAL;
         }


I did not see this error log there, so can you pls explain where we were 
bailing out? The check seems valid to me.

> +	if (!crtc)
> +		return 0;
> +
> +	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> +		return 0;
> +
>   	if (!conn_state || !conn_state->connector) {
>   		DPU_ERROR("invalid connector state\n");
>   		return -EINVAL;
> @@ -47,13 +54,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
>   		return -EINVAL;
>   	}
>   
> -	crtc = conn_state->crtc;
> -	if (!crtc)
> -		return 0;
> -
> -	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> -		return 0;
> -
>   	crtc_state = drm_atomic_get_crtc_state(state, crtc);
>   	if (IS_ERR(crtc_state))
>   		return PTR_ERR(crtc_state);
> 

