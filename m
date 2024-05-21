Return-Path: <linux-arm-msm+bounces-20162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 022FD8CB45F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 21:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 261711C226DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 19:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D02E148859;
	Tue, 21 May 2024 19:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MlqlcRnJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2160148301;
	Tue, 21 May 2024 19:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716320616; cv=none; b=Vr6TmG6OXD5sESUMMhuzwGn8yydIQAU6mvnAR+a8eNedYd3GdHrYFpwK8jAR4IGeK/5F+8TWzLXr0zm2Fped5aGC78pvebRrE998BkikeqgQKSkcBbheO9SnHpZfRkqIX1W3zRREa6i7trVY/NXjNnB9Cm6x+9COXodguniMd9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716320616; c=relaxed/simple;
	bh=3HxYsuE4vwht7mgql4QlXI/YmOzZn0ERD38uVvGnylQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESKb53X8nZgHLRzcoYpEIwVHqIcIEj2Jym9Uyw9wH4mImZouwaEcabU9ORIy8WXIMa0SOtB1s/M/pYMa9pMR1w6jbAE7nW5GMXVUYpTPsGyojLu4w4XcGXmeDL2AzOlslSePiEDGMvG3pLynYRBPSMteqPfwn5t07tUBlgWVsn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MlqlcRnJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LDx5tV012339;
	Tue, 21 May 2024 19:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=
	qcppdkim1; bh=cqoHDuBiUbHtYw/508huYL/EIPtHAho3rzh0DMUdW4k=; b=Ml
	qlcRnJBx3RY8asyCvl8tw2mf1bUkBJAPv2Ge8J0Tfjird/l4Yg4sofkYXUry9OW3
	K0XNrL5pXBxy6DjypnuINVJ6zx7UU9PNzXbzVDWZmr9VhgopDRHF/sMK/cYXQohg
	sxGe0nfO4hymr4KHjblmZSRKCIDNcx8zQo4+aSVQQZyGRAUD78j2uvd6NKf/ulBr
	nnKVpz1+wUnVPwMEb4ix4Vh7kiuVaU7qRhBK+MfVaUGkr/4vg/XgUPFyKrhkriHh
	Vvn/c+jgA1Eq+vFaXWPHqOlQCc5Xq10jGgDZxo2tHEHe+JAkvBKFXSto28jG5oQ7
	uWsJrWoJxgyCLC19UWtA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6psay0hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 19:43:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LJhOYN030881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 19:43:24 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 May 2024 12:43:23 -0700
Date: Tue, 21 May 2024 12:43:22 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: prabhav kumar <pvkumar5749404@gmail.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <julia.lawall@inria.fr>, <javier.carrasco@wolfvision.net>,
        <skhan@linuxfoundation.org>
Subject: Re: [PATCH next] drivers: soc: qcom: Auto cleanup using
 __free(device_node)
Message-ID: <Zkz5WtB0pBLqlc+3@hu-bjorande-lv.qualcomm.com>
References: <20240407072330.229076-1-pvkumar5749404@gmail.com>
 <Zkzz7PZUnU/xP/O2@hu-bjorande-lv.qualcomm.com>
 <CAH8oh8UY9FkHy=RyMU2AOZr+1x_KyH4m166kVmQd6peRNvFVTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH8oh8UY9FkHy=RyMU2AOZr+1x_KyH4m166kVmQd6peRNvFVTw@mail.gmail.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BI_p40hjresZpelIRK7LbPciGlFMhhMa
X-Proofpoint-ORIG-GUID: BI_p40hjresZpelIRK7LbPciGlFMhhMa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_12,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210148

On Wed, May 22, 2024 at 01:01:22AM +0530, prabhav kumar wrote:
> On Wed, May 22, 2024 at 12:50 AM Bjorn Andersson
> <quic_bjorande@quicinc.com> wrote:
> >
> > On Sun, Apr 07, 2024 at 12:53:30PM +0530, Prabhav Kumar Vaish wrote:
> > > Use automated cleanup to replace of_node_put() in qcom_smem_resolve_mem().
> > >
> >
> > I don't find this easier to read or maintain.
> Should I change it , explaining the change ??
> >
> > Also, your subject prefix does not match other changes to this driver.
> The patch is to add a __free function attribute to np pointer
> initialization ensuring
> the pointers are freed as soon as they go out of scope, thus removing
> the work to
> manually free them using of_node_put.

Yes, that is what the __free() attribute does, but I don't find it
easier to read and unless I'm missing something you're not fixing an
actual issue here?

Regards,
Bjorn

> >
> > Regards,
> > Bjorn
> >
> > > Signed-off-by: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
> > > ---
> > > drivers/soc/qcom/smem.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > > index 7191fa0c087f..ad1cf8dcc6ec 100644
> > > --- a/drivers/soc/qcom/smem.c
> > > +++ b/drivers/soc/qcom/smem.c
> > > @@ -1032,18 +1032,16 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
> > >                                struct smem_region *region)
> > >  {
> > >       struct device *dev = smem->dev;
> > > -     struct device_node *np;
> > >       struct resource r;
> > >       int ret;
> > > +     struct device_node *np __free(device_node) = of_parse_phandle(dev->of_node, name, 0);
> > >
> > > -     np = of_parse_phandle(dev->of_node, name, 0);
> > >       if (!np) {
> > >               dev_err(dev, "No %s specified\n", name);
> > >               return -EINVAL;
> > >       }
> > >
> > >       ret = of_address_to_resource(np, 0, &r);
> > > -     of_node_put(np);
> > >       if (ret)
> > >               return ret;
> > >
> > > --
> > > 2.34.1
> > >

