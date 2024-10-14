Return-Path: <linux-arm-msm+bounces-34365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 480F599D6CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 20:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C71EAB210D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 18:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903351C9EDB;
	Mon, 14 Oct 2024 18:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M6sILbTW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2431CACC1;
	Mon, 14 Oct 2024 18:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728931986; cv=none; b=q+rOXHMQPdAeE1Q1ILCyA4f9i5VImZY1z9hM42cFwjHG5HT8ra0i+Tvlv68wcKA4EIycns6JqULJIwuUhyhMZPb2QJFXZNJSPqjohT/IsFXq07ziZiLHVbQ9Np83A80IWyNsoALBCSJgLdOiJ41laFp4OuQlPtNYLmZCV84VpvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728931986; c=relaxed/simple;
	bh=R0WD3juJZzWXzIt/CVnXoMlePx6Ujc+0GTsPcOtjA+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NunBrRp1fA6GcvSD6mhNp319g9EbrvjIymd0wti3pP6+viDURPcTRnhAByNE3Vds6gV4UPJap2nidzSkQFykb1HsTcPK/LeBLT1GZI7d8YPllaznzX5GeTnrllCqp0C7+m3S4JNVrKUUcfNT+ko6iThM8nSu2NVdosocBbck8xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M6sILbTW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EAiBh6011283;
	Mon, 14 Oct 2024 18:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	USPQITIPllVhWG5IEj1TfL6AbGFHobQWh5g/bbReJf0=; b=M6sILbTWz7gxNF+r
	F74w5U0rhvWHumL4NS3enHeFvgdWiauXhLHMsJuSgQWZ3Sn8PiUn0i34gAxIIaUJ
	piw1FmtE1PaEAAEj8LDxdKQUTp2CV6SjVJeAoxI/I0AbZlo+2MS0A7Xjg4mMSQ5Z
	wbwQ8/jz8GU/pw9DsAiBQMnNCqwZLikD2xqvPMyXdAxRGLQGsfaieGmgDC2XDG51
	6r0lsdFTTb+BAuf5jCr6SPkolDfLSxJIBACFfU6fpFrG/y5Lx91vlYCEIfaYJSEK
	UStsNb1hjc4FqlqGKIB9ZDFDkhdtXihQzkYam+jIh6cKnAOoolM4Bu5VwQsUbLYq
	+vqOIw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427h6twdt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 18:52:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EIqsOU002490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 18:52:54 GMT
Received: from [10.110.109.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Oct
 2024 11:52:53 -0700
Message-ID: <a740622c-5d7f-48a0-9888-e01fa4ef4c2c@quicinc.com>
Date: Mon, 14 Oct 2024 11:52:53 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/msm: Avoid NULL dereference in
 msm_disp_state_print_regs()
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WK0znMCj3ftNmauzp8zBAfBgbi1U25NZ
X-Proofpoint-ORIG-GUID: WK0znMCj3ftNmauzp8zBAfBgbi1U25NZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140134



On 10/14/2024 9:36 AM, Douglas Anderson wrote:
> If the allocation in msm_disp_state_dump_regs() failed then
> `block->state` can be NULL. The msm_disp_state_print_regs() function
> _does_ have code to try to handle it with:
> 
>    if (*reg)
>      dump_addr = *reg;
> 
> ...but since "dump_addr" is initialized to NULL the above is actually
> a noop. The code then goes on to dereference `dump_addr`.
> 
> Make the function print "Registers not stored" when it sees a NULL to
> solve this. Since we're touching the code, fix
> msm_disp_state_print_regs() not to pointlessly take a double-pointer
> and properly mark the pointer as `const`.
> 
> Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 

LGTM, thanks for the fix

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

