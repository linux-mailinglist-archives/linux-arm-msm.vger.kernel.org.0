Return-Path: <linux-arm-msm+bounces-34329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0E099CA2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 14:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD29B1C22CE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 12:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8B01A4E8A;
	Mon, 14 Oct 2024 12:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RcpdjOZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2401219F401;
	Mon, 14 Oct 2024 12:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728909110; cv=none; b=NuihHPjHOd+Jufvpt/xL0dZ4bFt4kBnrc6F33GsBToS0PJRTKhvnW6n2BOMaX0OZf72hF1JbK2y0QbsFA8BzAhmHCSS1FNLUccJIPn1rrZbS+Y+j0q2fx5kpnauvebIvHoNuNLdYD0Rxii5c5cO+YOAphjfspBDH9VEB0vSb9r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728909110; c=relaxed/simple;
	bh=r05FTpPiFLp4Eqg+kJgufKymtFtEjZiy2BjFVmzwfXk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okNQMXafedyBkwawkUu+RzTChMmsdApzTXhNhmPL3ZXZZnhU/6ulnuthAAT7r02G4okIHa5loEu4OBTCuBF/L82hmVOYiSWjC8L93zs2s4OXyzFJgy4T3XhjyP1k/2TVdKoZokEA0yavXK4sTNMe2ASo66JCg4GdXlyWHDrHqNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RcpdjOZv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EAtbwC002959;
	Mon, 14 Oct 2024 12:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UscJRMZH2H6KkosByWavrn3L
	yRF5g4uyaoTc+Bl7iqI=; b=RcpdjOZvD+sLHCkQ8L5VXaQ6FDXlc/yjY3N27OuP
	JoaR9353PSNs/6LSVbLrexE2DXcYnpCt+nRGikAiqMFYjw7ZDlGMj/RTPqlLuJTy
	WWPEXSWZEuTbBzFmw1vkOaz2YJtubuUdf+6atCpY71h4ScNi9P4T2PSYxo/mIGxB
	LZTl5+z1MghccZgFyGTJgQU1/ee2yiW8h28xBdT+YXwlxa2ARiOOyNjCfyngtigV
	F1r1poMU2XubzALNr1FqEPT7YjP+eayIkQIAGaAx1PpwG2VoOQvPBU+qVxDlkL8Y
	4+QeBOaky7tdtJZA0hYwBvXjaX8uwXMkJIgf0EBh1PQIvg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427efnck8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 12:31:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ECVhrV005525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 12:31:43 GMT
Received: from hu-shashim-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 05:31:39 -0700
Date: Mon, 14 Oct 2024 18:01:35 +0530
From: Shiraz Hashim <quic_shashim@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <neil.armstrong@linaro.org>, Mukesh Ojha <quic_mojha@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/6] remoteproc: qcom: Enable map/unmap and SHM bridge
 support
Message-ID: <20241014123135.GB2147073@hu-shashim-hyd.qualcomm.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-7-quic_mojha@quicinc.com>
 <9eb910d4-e521-4c14-8e73-8fd3d5ff9573@linaro.org>
 <ZwP1t45ni/gk754B@hu-mojha-hyd.qualcomm.com>
 <ZwTPghV36CSIpkE4@hu-mojha-hyd.qualcomm.com>
 <dfe46653-5243-47c8-8de9-17a38d13da53@linaro.org>
 <20241011050518.GJ1421305@hu-shashim-hyd.qualcomm.com>
 <rbek5diyuwhquhbhk6pukzv474xug3pupcqqc2svrceyodvem5@obah2ahgmcox>
 <20241011070907.GK1421305@hu-shashim-hyd.qualcomm.com>
 <CAA8EJpr7KmTXv8WyxuhAprHoPku_YCt0fz74gd+44OeOT0uKqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJpr7KmTXv8WyxuhAprHoPku_YCt0fz74gd+44OeOT0uKqg@mail.gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7qo1rY2jnMZfk1RFxJeje44gbP1zs_Gk
X-Proofpoint-ORIG-GUID: 7qo1rY2jnMZfk1RFxJeje44gbP1zs_Gk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140090

On Fri, Oct 11, 2024 at 10:12:09AM +0300, Dmitry Baryshkov wrote:
> On Fri, 11 Oct 2024 at 10:09, Shiraz Hashim <quic_shashim@quicinc.com> wrote:
> >
> > On Fri, Oct 11, 2024 at 09:23:05AM +0300, Dmitry Baryshkov wrote:
> > > On Fri, Oct 11, 2024 at 10:35:18AM GMT, Shiraz Hashim wrote:
> > > > On Thu, Oct 10, 2024 at 08:57:56AM +0200, neil.armstrong@linaro.org wrote:
> > > > > On 08/10/2024 08:21, Mukesh Ojha wrote:
> > > > > > On Mon, Oct 07, 2024 at 08:22:39PM +0530, Mukesh Ojha wrote:
> > > > > > > On Mon, Oct 07, 2024 at 10:05:08AM +0200, neil.armstrong@linaro.org wrote:
> > > > > > > > On 04/10/2024 23:23, Mukesh Ojha wrote:
> > > > > > > > > For Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
> > > > > > > > > translation for remote processors is managed by QHEE and if the same SoC
> > > > > > > > > run under KVM, remoteproc carveout and devmem region should be IOMMU
> > > > > > > > > mapped from Linux PAS driver before remoteproc is brought up and
> > > > > > > > > unmapped once it is tear down and apart from this, SHM bridge also need
> > > > > > > > > to set up to enable memory protection on both remoteproc meta data
> > > > > > > > > memory as well as for the carveout region.
> > > > > > > > >
> > > > > > > > > Enable the support required to run Qualcomm remoteprocs on non-QHEE
> > > > > > > > > hypervisors.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > > > > > > > > ---
> > > > > > > > >    drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++++++++++++++++++++++++++-
> > > > > > > > >    1 file changed, 40 insertions(+), 1 deletion(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > > > > > index ac339145e072..13bd13f1b989 100644
> > > > > > > > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > > > > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > >
> > > > <snip>
> > > >
> > > > > > > > > +         struct of_phandle_args args;
> > > > > > > > > +
> > > > > > > > > +         ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus", "#iommu-cells", 0, &args);
> > > > > > > > > +         if (ret < 0)
> > > > > > > > > +                 return ret;
> > > > > > > > > +
> > > > > > > > > +         rproc->has_iommu = true;
> > > > > > > > > +         adsp->sid = args.args[0];
> > > > > > > > > +         of_node_put(args.np);
> > > > > > > > > +         ret = adsp_devmem_init(adsp);
> > > > > > > > > +         if (ret)
> > > > > > > > > +                 return ret;
> > > > > > > >
> > > > > > > > Why don't you get this table from the firmware like presumably
> > > > > > > > QHEE does ?
> > > > > > >
> > > > > > > Well, AFAIK, QHEE(EL2) has this information statically present
> > > > > > > and does not get it from anywhere., but will confirm this
> > > > > > > twice..
> > > > > >
> > > > > > Double confirmed, device memory region required by remoteproc is
> > > > > > statically present with QHEE.
> > > > >
> > > > > Right, in this case why those tables can't be embedded in the elf
> > > > > .resource_table like it's done with qcom_q6v5_adsp.c by calling
> > > > > rproc_elf_load_rsc_table() and let the remoteproc framework load the
> > > > > resource table and setup the devmem ssmu_map ?
> > > >
> > > > Mainly for two reasons -
> > > >
> > > > firmware images on platforms where we like to bring additional no-qhee
> > > > support do not have resource table.
> > > >
> > > > QCOM PAS implementation for secure remoteproc supports single TZ call
> > > > of auth_and_rest that authenticates and brings remoteproc out of
> > > > reset. And we don't have provision to authenticate resource table
> > > > before it is used for devmem/iommu setup.
> > >
> > > So normally TZ / QHEE have the platform-specific resource table? Isn't
> > > it tied to the firmware binary?
> >
> > Yes this table is with QHEE and not firmware binary. Now with no-qhee
> > case, this patch series is proposing to get it from device tree.
> 
> If it is platform-specific (rather than being device-specific), then
> it should go to the driver, not the DT.

Just to be clear, your reference to platform is SoC specific and
device is board ?

regards
Shiraz

