Return-Path: <linux-arm-msm+bounces-23301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9793A90F884
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 23:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FCEBB21577
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E4C14277;
	Wed, 19 Jun 2024 21:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SsqVxU3K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13A86FA8
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 21:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718832682; cv=none; b=OVBfC37+lNVF9QVP0KPutcRYS/XtoYJW8TKwlnzKG7UbO8PsBGXyMPNyEzvIxUuk2FpTFPpY2JbYgZEqzyPeUQI/bmJE1gTwiRleBHkmUuzCyU48lh+AHfnQ7tI0m6kmwvjDS+5XN+JZdEaWZeboag7qbDqWJWaDaIuVlr0ewKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718832682; c=relaxed/simple;
	bh=EF1NhQl2PCg8NXop1Y4t0IaLKPDxwNwR80u7HBVA0UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cZBxan8vfDoMgxdRpeKtMO/dZ0pKa+9+Mawti4G0JN+opAi2QJy91ES0kRsTnGlSxlnS6rF3JU3U8v+fe36irSXzmkXXo2HCTEMsPix7kVb/hwWma15hdZwbm95Mx3CSkyjkIf/r9hUrgx6eYhZKGt622hWef2Rx7u1GKndGYgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SsqVxU3K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JA86Im001112;
	Wed, 19 Jun 2024 21:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y8Ulhlk8hrjHrkkt37o4DjOwpXluOG4fXdSUMJ2R30Q=; b=SsqVxU3Kxw5tx1So
	fyaulAoDRPt5URVJdAr3eWwHy/XWBEnXiDpe4h0dPww9uwkoBZE166Fo6VZK/tx6
	qvh0rQEof76M9GgVxSyzDccNnUVxqMgXeTM7QbWxJjfsSpDtmTfT9i3mSxF7QBEl
	dHHmLCXxHLsbF1KAB+7MEn5r6z5nalgVwI5PL7hnc1M+fR8BX4+p/DGtL6ceBzkI
	YPjUbjbd+D12Vm5qwSFk8H52nntbtWPm0bpkT7ArJw7zo78i+V1rBjIjv2eJFq/1
	BfkoZ2FcaMB/BB6ZSM8BqlLdBMr9W/PWkM74ifTc1E0L+/uVylYug6iubpvJGnEH
	NSg17g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja2at2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 21:31:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JLVH0t007079
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 21:31:17 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 14:31:16 -0700
Message-ID: <9514b672-a1fe-fa67-2552-913017422440@quicinc.com>
Date: Wed, 19 Jun 2024 14:31:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [bug report] drm/msm/dpu: introduce the dpu_encoder_phys_* for
 writeback
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>
References: <464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RhhX8W0KeimcDNkWZoe5iMh3FAC6q3n6
X-Proofpoint-ORIG-GUID: RhhX8W0KeimcDNkWZoe5iMh3FAC6q3n6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=802 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190164

Hi Dan

On 6/8/2024 7:20 AM, Dan Carpenter wrote:
> Hello Abhinav Kumar,
> 
> Commit d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_*
> for writeback") from Apr 26, 2022 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:546 dpu_encoder_phys_wb_disable()
> 	error: we previously assumed 'phys_enc->hw_ctl->ops.clear_pending_flush' could be null (see line 532)
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>      519 static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
>      520 {
>      521         struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
>      522         struct dpu_hw_ctl *hw_ctl = phys_enc->hw_ctl;
>      523
>      524         DPU_DEBUG("[wb:%d]\n", hw_wb->idx - WB_0);
>      525
>      526         if (phys_enc->enable_state == DPU_ENC_DISABLED) {
>      527                 DPU_ERROR("encoder is already disabled\n");
>      528                 return;
>      529         }
>      530
>      531         /* reset h/w before final flush */
>      532         if (phys_enc->hw_ctl->ops.clear_pending_flush)
>                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Probably this check can be deleted
> 
>      533                 phys_enc->hw_ctl->ops.clear_pending_flush(phys_enc->hw_ctl);
>      534
>      535         /*
>      536          * New CTL reset sequence from 5.0 MDP onwards.
>      537          * If has_3d_merge_reset is not set, legacy reset
>      538          * sequence is executed.
>      539          *
>      540          * Legacy reset sequence has not been implemented yet.
>      541          * Any target earlier than SM8150 will need it and when
>      542          * WB support is added to those targets will need to add
>      543          * the legacy teardown sequence as well.
>      544          */
>      545         if (hw_ctl->caps->features & BIT(DPU_CTL_ACTIVE_CFG))
> --> 546                 dpu_encoder_helper_phys_cleanup(phys_enc);
>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Because dpu_encoder_helper_phys_cleanup() calls it without checking at
> on the last line in the function.
> 
>      547
>      548         phys_enc->enable_state = DPU_ENC_DISABLED;
>      549 }
> 
> regards,
> dan carpenter

Thanks for the report. But I could not recreate this issue using the 
kchecker. But based on the report description, I have made the change 
https://patchwork.freedesktop.org/patch/599993/.

Hopefully that addresses this bug. Otherwise, please share me the steps 
to recreate this.

Thanks

Abhinav

