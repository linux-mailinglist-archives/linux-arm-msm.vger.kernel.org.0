Return-Path: <linux-arm-msm+bounces-33476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8DA993EDC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 08:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F6071C21130
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 06:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB37B1C2427;
	Tue,  8 Oct 2024 06:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wlm/JxEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FCF190463;
	Tue,  8 Oct 2024 06:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728368562; cv=none; b=AyfkUsh03jn1Vl58OONpT0Xamd+kj4HREbbjxjZI8Pf1X119cK70k+qVFE5xnxSGB+t6LMo0uJMTFd6b7ugf9vJoGcI+TJ2AZALyjUePZxVz8li9GwqM2sOyi34cQnBnXUZlGk/r9MFcMp6cyjoKautAbb7TRjbFTY3+tz9mb/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728368562; c=relaxed/simple;
	bh=SVYof9aY9xTJDK3KwZvp+rugri1ytEmahNQ0cFbUZow=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mqw+3fIhZVT46iHqLLauEiPDg013VHKJMgnbgPL9S94nEFVg0VFCh554DbFaLzQmi+6DbCNrtdK2DKEZKOTb1MfI5UfhRF6ayC8LtYL4dLGsP+boPGt2wg2XCb37cbOH03z0OW5auvwxKKsURunbmT1EIGRawj45pJ4EbEzp0FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wlm/JxEY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497J0n4v005200;
	Tue, 8 Oct 2024 06:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sF52L5mXGtB6UiRr/3lh/Bsm
	cEnzkJAfB6CtnjlOadI=; b=Wlm/JxEY2g900/Wdw+EJe+RQ1JyStCA94jgP1CiC
	yOgKm0UvqCEYcdeqp4kFaykrDXmQTlaliqyrQpOIn/ZUDsD41yLwqG4WYdsA8mRw
	altYZETbfS+Tvrw18ZAHi99DMwqZvUtzY+OthBrIVJOnQiw/bGxUci88JLuomBSF
	RViND/Vb5g2qyzE3uFoAFF86avCF4w6zEYseme45tZ0Ovz9ZDVFCfkuv+mkEJur5
	P2IMjOVhCk8VbMpYBc7s8f8Btzy83IOIUt2EyfBLRxryvL3f+7UPjeyz5P9PGfeW
	MpY4MK6+kyddxEXCn3ZpGbee3qh+98PXLpxkx27O5Rn/qQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424ndy97ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 06:22:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4986M77r014437
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 06:22:07 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Oct 2024 23:22:03 -0700
Date: Tue, 8 Oct 2024 11:51:54 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <neil.armstrong@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad
 Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/6] remoteproc: qcom: Enable map/unmap and SHM bridge
 support
Message-ID: <ZwTPghV36CSIpkE4@hu-mojha-hyd.qualcomm.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-7-quic_mojha@quicinc.com>
 <9eb910d4-e521-4c14-8e73-8fd3d5ff9573@linaro.org>
 <ZwP1t45ni/gk754B@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZwP1t45ni/gk754B@hu-mojha-hyd.qualcomm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wHphFz5b20QGW6tqJl3-WYnEpXdCfPm7
X-Proofpoint-ORIG-GUID: wHphFz5b20QGW6tqJl3-WYnEpXdCfPm7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080040

On Mon, Oct 07, 2024 at 08:22:39PM +0530, Mukesh Ojha wrote:
> On Mon, Oct 07, 2024 at 10:05:08AM +0200, neil.armstrong@linaro.org wrote:
> > On 04/10/2024 23:23, Mukesh Ojha wrote:
> > > For Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
> > > translation for remote processors is managed by QHEE and if the same SoC
> > > run under KVM, remoteproc carveout and devmem region should be IOMMU
> > > mapped from Linux PAS driver before remoteproc is brought up and
> > > unmapped once it is tear down and apart from this, SHM bridge also need
> > > to set up to enable memory protection on both remoteproc meta data
> > > memory as well as for the carveout region.
> > > 
> > > Enable the support required to run Qualcomm remoteprocs on non-QHEE
> > > hypervisors.
> > > 
> > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > > ---
> > >   drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++++++++++++++++++++++++++-
> > >   1 file changed, 40 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > index ac339145e072..13bd13f1b989 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > @@ -122,6 +122,7 @@ struct qcom_adsp {
> > >   	struct qcom_devmem_table *devmem;
> > >   	struct qcom_tzmem_area *tzmem;
> > > +	unsigned long sid;
> > >   };
> > >   static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
> > > @@ -310,9 +311,21 @@ static int adsp_start(struct rproc *rproc)
> > >   	if (ret)
> > >   		return ret;
> > > +	ret = qcom_map_unmap_carveout(rproc, adsp->mem_phys, adsp->mem_size, true, true, adsp->sid);
> > > +	if (ret) {
> > > +		dev_err(adsp->dev, "iommu mapping failed, ret: %d\n", ret);
> > > +		goto disable_irqs;
> > > +	}
> > > +
> > > +	ret = qcom_map_devmem(rproc, adsp->devmem, true, adsp->sid);
> > > +	if (ret) {
> > > +		dev_err(adsp->dev, "devmem iommu mapping failed, ret: %d\n", ret);
> > > +		goto unmap_carveout;
> > > +	}
> > > +
> > >   	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
> > >   	if (ret < 0)
> > > -		goto disable_irqs;
> > > +		goto unmap_devmem;
> > >   	ret = clk_prepare_enable(adsp->xo);
> > >   	if (ret)
> > > @@ -400,6 +413,10 @@ static int adsp_start(struct rproc *rproc)
> > >   	clk_disable_unprepare(adsp->xo);
> > >   disable_proxy_pds:
> > >   	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
> > > +unmap_devmem:
> > > +	qcom_unmap_devmem(rproc, adsp->devmem, adsp->sid);
> > > +unmap_carveout:
> > > +	qcom_map_unmap_carveout(rproc, adsp->mem_phys, adsp->mem_size, false, true, adsp->sid);
> > >   disable_irqs:
> > >   	qcom_q6v5_unprepare(&adsp->q6v5);
> > > @@ -445,6 +462,9 @@ static int adsp_stop(struct rproc *rproc)
> > >   			dev_err(adsp->dev, "failed to shutdown dtb: %d\n", ret);
> > >   	}
> > > +	qcom_unmap_devmem(rproc, adsp->devmem, adsp->sid);
> > > +	qcom_map_unmap_carveout(rproc, adsp->mem_phys, adsp->mem_size, false, true, adsp->sid);
> > > +
> > >   	handover = qcom_q6v5_unprepare(&adsp->q6v5);
> > >   	if (handover)
> > >   		qcom_pas_handover(&adsp->q6v5);
> > > @@ -844,6 +864,25 @@ static int adsp_probe(struct platform_device *pdev)
> > >   	}
> > >   	platform_set_drvdata(pdev, adsp);
> > > +	if (of_property_present(pdev->dev.of_node, "iommus")) {
> > > +		struct of_phandle_args args;
> > > +
> > > +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus", "#iommu-cells", 0, &args);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +
> > > +		rproc->has_iommu = true;
> > > +		adsp->sid = args.args[0];
> > > +		of_node_put(args.np);
> > > +		ret = adsp_devmem_init(adsp);
> > > +		if (ret)
> > > +			return ret;
> > 
> > Why don't you get this table from the firmware like presumably QHEE does ?
> 
> Well, AFAIK, QHEE(EL2) has this information statically present and does
> not get it from anywhere., but will confirm this twice..

Double confirmed, device memory region required by remoteproc is
statically present with QHEE.

-Mukesh

> 
> -Mukesh
> 

