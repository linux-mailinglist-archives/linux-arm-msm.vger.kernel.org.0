Return-Path: <linux-arm-msm+bounces-24238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2C4917ADD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 10:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 019DB2881D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 08:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5230915FA8F;
	Wed, 26 Jun 2024 08:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hfSaTGka"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB91115FA60;
	Wed, 26 Jun 2024 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719390283; cv=none; b=hjfmg/jXaeKiEsV8La2rIgl5HUU/+02E8VPek9kZKFtSD1mkwaLyGB2p5q8YKSEvHDEz1foShsnVJZSCmNv4PwNw7ZmAJ7hB5KUfaXB1InAXFIeCqS5j+n2FTnCGUEfz1GYV5EXKXZJC6JFNsAYP/iT26wqGMRoFIUuxIY0p2QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719390283; c=relaxed/simple;
	bh=XTfMFOjhrpXWnfLenLQuZUUyczASGHoAIUDYR7Zyu24=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLgCUeW1B0IaQKEPYZD6Q6sw9m/97V5QwXxR2EIKdWQ0jRHT8a6lc344sE/FZTd2QstpEPGI1HLbRUChX2Y2uelQcoek0IllwwE8xcDggxnCjv0C9pdhLJ5XWo2biSAmW8iXjA47UbLxGUvYnvl7eD6x250GVgCmu81eKUBOW6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hfSaTGka; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PHXAx0007822;
	Wed, 26 Jun 2024 08:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ntNa58qOLqwph9C6e84LSq9z
	sVILNoDqg4IK9f2f1yk=; b=hfSaTGkaWrUg/x7iB1Oi79/TCffwSuU0nPatrsYs
	HZDhCqc5Zb+uPamx4jqTuSco/ZwzYp9wkqMv/NhOE7Mk+RGIDAQRGaT24/Ihj5cJ
	lN/cMa+khxv7sP/bIuz/QlPY/a1cquXsD/FYTvmaMFzy05jbwRvr4nbVTUy5mAxE
	NrDgQ77kM5OMAG9rAJ1MeNXAWy2C0u850XW7+6+n6cu5UGdRjhZpZhKY1hnNLuvK
	wIf6x07vlhA4Gnj/FKM6PPlbk+vuS6zYgHoVG3pEa3xY3E2d/3ZRyMq3dqye7tTT
	pet6ltg+WxPSrPVqnhC+0w5KeZaKF1go3LxMNxgVa3fQZA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnjs0rmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 08:24:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45Q8OUOI027363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 08:24:30 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Jun 2024 01:24:25 -0700
Date: Wed, 26 Jun 2024 13:54:22 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>, David Airlie
	<airlied@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
Message-ID: <20240626082422.zcsari27yoskayuo@hu-akhilpo-hyd.qualcomm.com>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com>
 <5947559d-30dd-4da1-93cc-a15dc65cb77d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5947559d-30dd-4da1-93cc-a15dc65cb77d@linaro.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Nwfdb4rI7TxzPm4fruaVERsR57W1zsBh
X-Proofpoint-ORIG-GUID: Nwfdb4rI7TxzPm4fruaVERsR57W1zsBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_03,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260062

On Mon, Jun 24, 2024 at 03:53:48PM +0200, Konrad Dybcio wrote:
> 
> 
> On 6/23/24 13:06, Akhil P Oommen wrote:
> > Add support in drm/msm driver for the Adreno X185 gpu found in
> > Snapdragon X1 Elite chipset.
> > 
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> > 
> >   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
> >   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
> >   4 files changed, 36 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > index 0e3dfd4c2bc8..168a4bddfaf2 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
> >   	 */
> >   	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
> > +	if (adreno_is_x185(adreno_gpu)) {
> > +		chipid = 0x7050001;
> 
> What's wrong with using the logic below?

patchid is BITS(7, 0), not (15, 8) in the case of x185. Due to the
changes in the chipid scheme within the a7x family, this is a bit
confusing. I will try to improve here in another series.

> 
> >   	/* NOTE: A730 may also fall in this if-condition with a future GMU fw update. */
> > -	if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
> > +	} else if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
> >   		/* A7xx GPUs have obfuscated chip IDs. Use constant maj = 7 */
> >   		chipid = FIELD_PREP(GENMASK(31, 24), 0x7);
> > @@ -1329,9 +1331,18 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
> >   	if (!pri_count)
> >   		return -EINVAL;
> > -	sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
> > -	if (IS_ERR(sec))
> > -		return PTR_ERR(sec);
> > +	/*
> > +	 * Some targets have a separate gfx mxc rail. So try to read that first and then fall back
> > +	 * to regular mx rail if it is missing
> > +	 */
> > +	sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
> > +	if (PTR_ERR_OR_ZERO(sec) == -EPROBE_DEFER) {
> > +		return -EPROBE_DEFER;
> > +	} else if (IS_ERR(sec)) {
> > +		sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
> > +		if (IS_ERR(sec))
> > +			return PTR_ERR(sec);
> > +	}
> 
> I assume GMXC would always be used if present, although please use the
> approach Dmitry suggested

Correct.

-Akhil
> 
> 
> The rest looks good!
> 
> Konrad

