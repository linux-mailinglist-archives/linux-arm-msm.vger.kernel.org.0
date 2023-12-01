Return-Path: <linux-arm-msm+bounces-2918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 699E3801002
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B2461C2091A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB38A4C627;
	Fri,  1 Dec 2023 16:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lV31BgWc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E511383
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 08:23:13 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1FngsH022049;
	Fri, 1 Dec 2023 16:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=a9ghmj904+jRfOLTJiloFlcesG9ooEpgH1D2Hf1EgVw=;
 b=lV31BgWc/SGD26jI6tWNpOVrSNF1eEnDdBIKbk8GNkZNViIkn1QgCetdWKNpfEGMZ3A8
 h9gemlrrg+xtB4/MH02fq5UOkR9Y+InSW2GCo6qkwBOIWyqzh2inDiAc21gnGjoOxqkw
 npIdkriw1kOrpWkbmYi0LdW4lphUEKs484QDvWXq54ffYEmesS9xf3E7ZeCiK0vHweLz
 eo3bFWus642c757dZMoceopJ6B7rHU4MdS7P9eHy58vCvhksWilN/E0Us50oBQ9zAT6K
 gT2SeGNn1LYAIyfm/VfHSy8PP5qGspLntqM8L/eLCtx+PxK37RBDUAD1V+ko9sKlDVGR vg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqjf1r3ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 16:22:54 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1GMr1X021589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 16:22:53 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Dec 2023 08:22:53 -0800
Date: Fri, 1 Dec 2023 08:22:52 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <marijn.suijten@somainline.org>, <steev@kali.org>
Subject: Re: [PATCH v3 2/2] drm/msm/dpu: Add mutex lock in control vblank irq
Message-ID: <20231201162252.GG1766637@hu-bjorande-lv.qualcomm.com>
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <20231201014101.15802-3-quic_parellan@quicinc.com>
 <20231201034710.GB1766637@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqFya5H+4PPZ8A3CqqqRJXsJ3KKbbcfS=C13QTr1vAtSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJpqFya5H+4PPZ8A3CqqqRJXsJ3KKbbcfS=C13QTr1vAtSw@mail.gmail.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AkLYbWpWvDoKi_T4b_MFvzUMNUYftaH7
X-Proofpoint-GUID: AkLYbWpWvDoKi_T4b_MFvzUMNUYftaH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_14,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=773 mlxscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312010112

On Fri, Dec 01, 2023 at 10:34:50AM +0200, Dmitry Baryshkov wrote:
> On Fri, 1 Dec 2023 at 05:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> > On Thu, Nov 30, 2023 at 05:40:55PM -0800, Paloma Arellano wrote:
[..]
> > > @@ -2386,6 +2390,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
> > >       dpu_enc->enabled = false;
> > >       mutex_init(&dpu_enc->enc_lock);
> > >       mutex_init(&dpu_enc->rc_lock);
> > > +     mutex_init(&dpu_enc->vblank_ctl_lock);
> >
> > Is this somehow propagated to multiple different dpu_encoder_phys
> > instances, or why do you need to initialize it here and pass the pointer
> > through 2 different intermediate structures before assigning it to
> > phys_enc->vblank_ctl_lock below?
> 
> Yes, there can be two phys_enc instances for a single encoder, so this
> part is fine.
> 

Thanks for the clarification, Dmitry. Sounds like it make sense then.

But, if I read the code correctly the two instances will have separate
vblank_refcount copies, and the dpu_core_irq_*() interface does mutual
exclusion within. So why do we need shared mutual exclusion between the
two? (This is where a proper description of the problem in the commit
message would have been very helpful)

Regards,
Bjorn

