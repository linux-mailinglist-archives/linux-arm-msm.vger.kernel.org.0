Return-Path: <linux-arm-msm+bounces-31920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9513697B19F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 16:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC739285DC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 14:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B7F17623F;
	Tue, 17 Sep 2024 14:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mQ07V7eM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC34535DC;
	Tue, 17 Sep 2024 14:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726584745; cv=none; b=QND6vC2KHog/6TsHblOtcD0JIJtO3ykc2+uJ+QF7dhzuhlC2fr4DnIGibRjIxqZ9zlNm5C1z/9hek8ahk1kZb6iECes/BA58FVmHkX9QuGePgkyP4wp0zXLAf2tKCfklsiw+Q05KsxnO3bMX/3/E6vptmUhBtSqucTLPW/IfqgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726584745; c=relaxed/simple;
	bh=8pY+ochhbrwnMFTvipOt3w6oyhb/giCRqHtw6AsChu0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8WUGp59IH3+tSDFfHMiBdvRga4R8/a/bBYO2VGjubT+Ia79RT2hoDCG6gaPlsFpAPZw3ZCgq6anqdiAQdQYzZv/Z+kmus27IddwOlM0BHzEhDQr7B0Pr2N6Jc2DA2p+4fts4K80Ch6wd9ITtc6Qe3mLF6UzxuCc2D36neVZIH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mQ07V7eM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H4nup4022480;
	Tue, 17 Sep 2024 14:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uoeJcBQMFmqPhQZTMkUWS61i
	HoEJCARe4P2fr3s12lw=; b=mQ07V7eMcv0zD1hXPhsi4ljJVNKJmG7FpgpYyrsx
	fU1gTpYmMADt0trRvi117XSd6TmrqdIBybK7VEwDzvn0mlK07oW07KbZYeG4rnUA
	YxBbgYTcPC+1FgH5N0e/Bx3yAim8oeevkwey3GVTF4yvLfAKFXM9pv+V9Pn602X1
	iQXYjRe1homrJtbGLg+d+f0s0QYNLeeXNQctdg2GRsH1ZfFQsXGW8pwR9xPEgiD4
	eJpsu7zEkUgiGCqiLc4omXzHTbobtE0Kugon9nDOdzgeWr8lcq1YteT3S6We5MzO
	74zYeV7A9TSeHfYcjKADlinmyeYle+Jqvytv9pjqByRqMA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gnq2jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 14:52:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48HEqBnL008974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 14:52:11 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Sep 2024 07:52:07 -0700
Date: Tue, 17 Sep 2024 20:22:03 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konradybcio@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        "Connor
 Abbott" <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>, Sean Paul
	<sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table
 update
Message-ID: <20240917145203.2nznqdkrsfanttex@hu-akhilpo-hyd.qualcomm.com>
References: <20240913195132.8282-1-robdclark@gmail.com>
 <e6991910-5058-4ef0-bfdf-6d33953535dd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e6991910-5058-4ef0-bfdf-6d33953535dd@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bQw_K9KxeX0BK0awkjyWmeW6Kc1ARqs2
X-Proofpoint-ORIG-GUID: bQw_K9KxeX0BK0awkjyWmeW6Kc1ARqs2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=869 malwarescore=0 suspectscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409170106

On Tue, Sep 17, 2024 at 03:47:09PM +0200, Konrad Dybcio wrote:
> On 13.09.2024 9:51 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
> > devices (x1-85, possibly others), it seems to pass that barrier while
> > there are still things in the event completion FIFO waiting to be
> > written back to memory.
> 
> Can we try to force-fault around here on other GPUs and perhaps
> limit this workaround?
> 
> Akhil, do we have any insight on this?

Nothing at the moment. I will check this further.

-Akhil.

> 
> Konrad

