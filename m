Return-Path: <linux-arm-msm+bounces-29305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CD395BECA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 21:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD7A11C22D65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 19:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578BA3F9F9;
	Thu, 22 Aug 2024 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PEpJVh+L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A980AAD55;
	Thu, 22 Aug 2024 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724354678; cv=none; b=C4GR90vjVjQiYGZdFYgljd2DRH3WLwt//bWs2WzVHeGmdTcJT2a+OXyM1EH7OW/y7Etrz5unosxCflEmCOaxUSpdMy2xK2SIk2vem7i8xyrD08jwqopDtivSo6fvQMMpUgYtRDk08Ujtldxvz45VSNBzcpFoof917aHluxUAh0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724354678; c=relaxed/simple;
	bh=CMOB+O9xYjrYPfwsiJrPxt5KD1sMYaK3IxMxqgSyUww=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fr/1dd36UTXOWdfDzMlSgZcDMtXAwRsnWIcMaZH3fVwy7ctjsa5sjvWF8kH8/RHdCAeOlB52cvKRQAsSQQvcMAngZWSpOHkHjWWpb5PqKTbnCztg2LSTzfd3pRfOTMwkJJlcWn/YkmazcCOJmgazicfRiz2k+qEkFqcUjRijbNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PEpJVh+L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M9hMnr030621;
	Thu, 22 Aug 2024 19:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=12SSZQZUIyFp5vaQeuaZT4AA
	+kfpcMBYt84o9QCHHoc=; b=PEpJVh+L+4ts/gXSOgVPwbzAL1jBvx1izNtGtirT
	hok5FmsgXLInLjQ/c6WRNAe6h/+a+kNEAjOoHhQONulLg0sMF0LKhiV3KIDFKe/B
	35F8c8m5NteBZLTy/a7yp4VkLU2/SkEEJ8vGvz5nmwD9hDjXTakMdYKOrF3WSa/r
	Dev8NWj/KZK7nEdd/NPu0P6TY09pPyERFrzrPxYl5kOrwc8sntUi0CWXtIdejwV0
	rcD0CGLs7XTgmkZftldBRBKxIt2liwGrAvBpFnmO716gHLdsQftSKe1n9MC3YwSS
	CcxsisSzLON2Qan7XJ+7fJKNBYZuj/52lO2Tds64LKRuog==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pdmh3ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 19:23:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MJNtVW031096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 19:23:55 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 22 Aug 2024 12:23:50 -0700
Date: Fri, 23 Aug 2024 00:53:47 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Antonino Maniscalco <antomani103@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
Message-ID: <20240822192347.ffezairwoqqolssl@hu-akhilpo-hyd.qualcomm.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-4-7bda26c34037@gmail.com>
 <20240819200837.etzn7oaoamnceigr@hu-akhilpo-hyd.qualcomm.com>
 <14591112-4455-49b4-8b1a-3feffc4d343f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <14591112-4455-49b4-8b1a-3feffc4d343f@gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WHBhUGAaLUxB20-KScTvmRCNhIOeUX06
X-Proofpoint-ORIG-GUID: WHBhUGAaLUxB20-KScTvmRCNhIOeUX06
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_12,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=705 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408220146

On Wed, Aug 21, 2024 at 04:34:15PM +0200, Antonino Maniscalco wrote:
> On 8/19/24 10:08 PM, Akhil P Oommen wrote:
> > On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wrote:
> > > This patch implements preemption feature for A6xx targets, this allows
> > > the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> > > hardware as such supports multiple levels of preemption granularities,
> > > ranging from coarse grained(ringbuffer level) to a more fine grained
> > > such as draw-call level or a bin boundary level preemption. This patch
> > > enables the basic preemption level, with more fine grained preemption
> > > support to follow.
> > > 
> > > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > > ---
> > 
> > No postamble packets which resets perfcounters? It is necessary. Also, I
> > think we should disable preemption during profiling like we disable slumber.
> > 
> > -Akhil.
> > 
> 
> You mention that we disable slumber during profiling however I wasn't able
> to find code doing that. Can you please clarify which code you are referring
> to or a mechanism through which the kernel can know when we are profiling?
> 

Please check msm_file_private_set_sysprof().

-Akhil

> Best regards,
> -- 
> Antonino Maniscalco <antomani103@gmail.com>
> 

