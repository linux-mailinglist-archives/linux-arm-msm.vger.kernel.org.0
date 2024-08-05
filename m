Return-Path: <linux-arm-msm+bounces-27959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B271A94822E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 21:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BDC228428D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 19:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAF915B147;
	Mon,  5 Aug 2024 19:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KAlLBeUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31563364AB;
	Mon,  5 Aug 2024 19:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722885643; cv=none; b=jRNUqvcDBEMjMufByb1xTq9c3J4nyJrgLxPu+dQOILHCrP/3j3Zw7wzMc7DbBvTPR3dNDxMW1pcS8KB4cfLRwkTjYCQ6R2hVYXCOK7YP7toYp8JKsQGfd21IzZLUF3ajhUxPue7/EeZnvPPBI8KCLkYMseKatCDOuNRyi3hfg98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722885643; c=relaxed/simple;
	bh=5Q/dMM57O/WlL58xaDML5rvBRpiPgpdbZsYdACrdYog=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KMw72TX3NRXngbW272/G7itiKnlkPdZoRIEnx6MsAIxCmuSU72b36CG5hB/0/c+IfaB+cTjXGX5HNVcEfAXz9JQpBps95DAaqumuphkKTORzKRykRpdIdoicwAqrFydCxLoZzOdPSDprGXoylEkzqgeZ5WmA3IbF5RRipp76C0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KAlLBeUA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475IpCc3025811;
	Mon, 5 Aug 2024 19:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NPfzUYIoiBYiXXunPR/6nbDC6ImBsu+pGz+mf7RwU4c=; b=KAlLBeUAfksZSfqK
	hQfDTRbEsQ7PQmn9F03xAZWyJaE4Wl/aSFkMBpW/AG1UOOlHHMuerPKCHz5/XgqM
	F6zjqRrU7tsieNcpgNhKtlp4AUEv2+SGOxGiABAnyGcCESuVJr78cKr+3c24qsKe
	v+rX1rgSQ5tasU3H3Lpa5YnTDuhMXnz7cn+/nXEXuruavtgQOSyoTH9TR4WPs+rP
	4JmoySwHYXmvpyL70TLO3YANS/lxbqnRqOXjxVBSqTPf/hALh2wVXL8ZafXCTlV1
	wGXYUm440j26zJx6nQ0D+6MkglA77C73eRy0ytjW/tZZrvGrvJq8u79iRwleHu1t
	sZ+7Og==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40u4cpg1vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 19:19:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 475JJq8e020650
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Aug 2024 19:19:52 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 Aug 2024
 12:19:48 -0700
Message-ID: <800e03d2-01b0-4bde-816a-e45e1acdd039@quicinc.com>
Date: Mon, 5 Aug 2024 12:19:46 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/dpu1: don't choke on disabling the
 writeback connector
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Jeykumar
 Sankaran <jsanka@codeaurora.org>, <stable@vger.kernel.org>,
        Leonard Lausen
	<leonard@lausen.nl>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
 <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: L6qHaKwQj3kBFZex2Vm1J6ZRJHKR7svV
X-Proofpoint-GUID: L6qHaKwQj3kBFZex2Vm1J6ZRJHKR7svV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-05_08,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408050137



On 8/2/2024 12:47 PM, Dmitry Baryshkov wrote:
> During suspend/resume process all connectors are explicitly disabled and
> then reenabled. However resume fails because of the connector_status check:
> 
> [ 1185.831970] [dpu error]connector not connected 3
> 
> It doesn't make sense to check for the Writeback connected status (and
> other drivers don't perform such check), so drop the check.
> 
> Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
> Cc: stable@vger.kernel.org
> Reported-by: Leonard Lausen <leonard@lausen.nl>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 16f144cbc0c9..8ff496082902 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
>   	if (!conn_state || !conn_state->connector) {
>   		DPU_ERROR("invalid connector state\n");
>   		return -EINVAL;
> -	} else if (conn_state->connector->status != connector_status_connected) {
> -		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
> -		return -EINVAL;
>   	}

For this issue, do we hit the connector->force = DRM_FORCE_OFF path?

Because otherwise, writeback does not implement .detect() callback today 
so its always connected.

But if that was the case how come this error is only for writeback. Even 
DP has the same connected check in atomic_check()

Change seems fine with me because ideally this seems like a no-op to me 
because writeback connector is assumed to be always connected but the 
issue is missing some details here.

>   
>   	crtc = conn_state->crtc;
> 

