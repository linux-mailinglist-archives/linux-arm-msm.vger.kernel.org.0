Return-Path: <linux-arm-msm+bounces-27447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 992279422E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 00:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BDF62833C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 22:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED23191F72;
	Tue, 30 Jul 2024 22:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FSvbd6uh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBBD18B484;
	Tue, 30 Jul 2024 22:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722378432; cv=none; b=V3hAggtFuK5JZ4Em4urtTT93HAVvR72xnxB19X9R+b2o2NLi7wz5JnJDQu17FrpzXhWQ6fTJrB1Knc7nbELgoDre7cvsY+I2SCXwZnULWq3xb0e7GaNN/JmOWg5MBmyMIBS3MhFzheOYB681rxuoEgjjhcZJWvS+1I7522U8YJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722378432; c=relaxed/simple;
	bh=jVZcLZSauFhmsmW+deyZBsbzOmRMg4xmhNjZ0PZhwRY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBrxq34p59q2L+R/8h2tB0OwRPJUyRKSvSYmm0725IU/81uf/9eLKyewfSRjNtAqiMqPFeMRBVlo/tHCBaKtiTkuzWQ7bnJLxaOXmF/6/+oGbPYYYkmIsezN9az01ZULpwHSaI5rxcgfkuFGFASZ/LTaI7kXMut+Dr3ut+Y92Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FSvbd6uh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UGQnps029490;
	Tue, 30 Jul 2024 22:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KZ07eW1MjWQldYXNbI+WkX6P
	ZeZCOQDsp629TXOfbpk=; b=FSvbd6uhUcdi7JSPckjriqZaKv/R9ODk1Fehui9I
	WU1QNLk7zRpqSKyX1J8VdRQzZ1y+QJKtNDSzWktTs8/aqBHcIvzuALTpsEO1HGih
	6celm9orTmaoFtWIxxv8/HQon7tqx8R/3/zue13VT02VY/HBO/DxIqp6xBRVCo4p
	UWklZZHQbBJUfDy3LDinkAa7fX/L6CXowPOvFelQT80rdRWOx7OqHBq9+l65HyJM
	9k1ylk+VlzwaSqPjT/MbRh4s9Po5+3bq+3ZX7MUzfR9r5kewYnDPaH7BLkwhR6+u
	6NVFvHwIhwBDL8NRs9keiu7xbFui5QyHfzky7dt7tHbPeg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw442bsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 22:26:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46UMQvcs005954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 22:26:57 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 15:26:56 -0700
Date: Tue, 30 Jul 2024 15:26:55 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Abel Vesa
	<abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <swboyd@chromium.org>, <dianders@chromium.org>, <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/msm/dp: enable widebus on all relevant chipsets
Message-ID: <Zqlor3Ug70d65rLT@hu-bjorande-lv.qualcomm.com>
References: <20240730195012.2595980-1-quic_abhinavk@quicinc.com>
 <CAA8EJpp0pQ9j6qQbQajUj=qHdYWeiB2nedT0oQhxsGjs3t53CA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJpp0pQ9j6qQbQajUj=qHdYWeiB2nedT0oQhxsGjs3t53CA@mail.gmail.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rYfh4UGK0Cd5v76EZQFxqmNeVV0CRrQr
X-Proofpoint-ORIG-GUID: rYfh4UGK0Cd5v76EZQFxqmNeVV0CRrQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_18,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 clxscore=1011
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300155

On Tue, Jul 30, 2024 at 11:58:19PM +0300, Dmitry Baryshkov wrote:
> Hi Abhinav,
> 
> On Tue, 30 Jul 2024 at 22:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> > Hardware document indicates that widebus is recommended on DP on all
> > MDSS chipsets starting version 5.x.x and above.
> >
> > Follow the guideline and mark widebus support on all relevant
> > chipsets for DP.
> >
> > Fixes: 766f705204a0 ("drm/msm/dp: Remove now unused connector_type from desc")
> > Fixes: 1b2d98bdd7b7 ("drm/msm/dp: Add DisplayPort controller for SM8650")
> 
> The issues are present in the following commits. Please consider using
> them instead:
> 
> Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> Fixes: 1b2d98bdd7b7 ("drm/msm/dp: Add DisplayPort controller for SM8650")
> 

But are we really fixing any bugs/issues here? While the docs do
recommend widebus, we're effectively enabling more harware/features.

Unless there's a strong reason (which I'm not confident that the commit
message entails), I think we should drop the fixes-tags and just bring
this to 6.12...

Regards,
Bjorn

> 
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> -- 
> With best wishes
> Dmitry

