Return-Path: <linux-arm-msm+bounces-33410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73915993017
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C49B2B24521
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6941D86D6;
	Mon,  7 Oct 2024 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jbMOo6xN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779AC1D86DF;
	Mon,  7 Oct 2024 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728312775; cv=none; b=J4wmYjn14bImZqvBcFaPoJ0SHFBzTA/IehSbk9NLIFIp9luZIqcmzzqQz6xVtIl0KkQuUU4DhW5zGtS5VJShYxlHIg0fRwyUayesENtztdVr4OmHyS768xw8g475yx+j2W0+HXWuAxdmLoQDvHN9Lmvis1NQwOnXqfSDEvV14uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728312775; c=relaxed/simple;
	bh=9hKpqziJxa4+VFx9y7LlHv123VXPkisB4w9bgqeMg3M=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHAg/qsSvla9/HxF/ANPeH6QjVsouMcTyJxDOnguOvs2QI5HJkmBNJkZ3tmmJXAuzFtvmCUi3qU0cmaDyM5DH/ir7/z1xIgyaCwuLZx3ySTNDfoIAEWrnBc8NNwpdoeu6eSQL9aB1ebdhZzCjxWc/sjhCCy8u3bW3UQbZErVw6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jbMOo6xN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497ESDev003776;
	Mon, 7 Oct 2024 14:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w3RCWRUtIw9sk36ygunIIsCE
	4n8HIqRfSejgHw5bmik=; b=jbMOo6xN5JyHlRNN2E9f41MD0bry9G6ZSR2LpM4C
	N0DHKBmxW4W6ac0Wy5M505mGHJE0JZwT0AVh6tXHNCILVWHFkf+QNUQLpv6bujec
	raETbPNiM/yEeLsVI+32FFfFAbWLeOn06J+z3OuFRpM1yU8HrtMF0dyKBBqUJq1C
	JkAtu2HiCmVonWOhdr1HLUaNWmHd6VpEdJ0H6HskgdxFvEGObpzyqYS8Bokmhgi4
	3ohoquymZc4y57gZR8ba3vrH8pornN6sOo3Hm5Ws3efdYVsdpyLtbd3m3K0wb1TR
	APfcgB1Uz+hflhO5k4rAwl2CtM2Xf4GF5HrEUbYgSSNorA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv6vg5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 14:52:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497EqlGB022016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 14:52:47 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Oct 2024 07:52:43 -0700
Date: Mon, 7 Oct 2024 20:22:39 +0530
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
Message-ID: <ZwP1t45ni/gk754B@hu-mojha-hyd.qualcomm.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-7-quic_mojha@quicinc.com>
 <9eb910d4-e521-4c14-8e73-8fd3d5ff9573@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9eb910d4-e521-4c14-8e73-8fd3d5ff9573@linaro.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kUnJDXfb6e4K6UzRSZRfCSUHeGXLGqoY
X-Proofpoint-GUID: kUnJDXfb6e4K6UzRSZRfCSUHeGXLGqoY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070105

On Mon, Oct 07, 2024 at 10:05:08AM +0200, neil.armstrong@linaro.org wrote:
> On 04/10/2024 23:23, Mukesh Ojha wrote:
> > For Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
> > translation for remote processors is managed by QHEE and if the same SoC
> > run under KVM, remoteproc carveout and devmem region should be IOMMU
> > mapped from Linux PAS driver before remoteproc is brought up and
> > unmapped once it is tear down and apart from this, SHM bridge also need
> > to set up to enable memory protection on both remoteproc meta data
> > memory as well as for the carveout region.
> > 
> > Enable the support required to run Qualcomm remoteprocs on non-QHEE
> > hypervisors.
> > 
> > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > ---
> >   drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++++++++++++++++++++++++++-
> >   1 file changed, 40 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index ac339145e072..13bd13f1b989 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -122,6 +122,7 @@ struct qcom_adsp {
> >   	struct qcom_devmem_table *devmem;
> >   	struct qcom_tzmem_area *tzmem;
> > +	unsigned long sid;
> >   };
> >   static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
> > @@ -310,9 +311,21 @@ static int adsp_start(struct rproc *rproc)
> >   	if (ret)
> >   		return ret;
> > +	ret = qcom_map_unmap_carveout(rproc, adsp->mem_phys, adsp->mem_size, true, true, adsp->sid);
> > +	if (ret) {
> > +		dev_err(adsp->dev, "iommu mapping failed, ret: %d\n", ret);
> > +		goto disable_irqs;
> > +	}
> > +
> > +	ret = qcom_map_devmem(rproc, adsp->devmem, true, adsp->sid);
> > +	if (ret) {
> > +		dev_err(adsp->dev, "devmem iommu mapping failed, ret: %d\n", ret);
> > +		goto unmap_carveout;
> > +	}
> > +
> >   	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
> >   	if (ret < 0)
> > -		goto disable_irqs;
> > +		goto unmap_devmem;
> >   	ret = clk_prepare_enable(adsp->xo);
> >   	if (ret)
> > @@ -400,6 +413,10 @@ static int adsp_start(struct rproc *rproc)
> >   	clk_disable_unprepare(adsp->xo);
> >   disable_proxy_pds:
> >   	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
> > +unmap_devmem:
> > +	qcom_unmap_devmem(rproc, adsp->devmem, adsp->sid);
> > +unmap_carveout:
> > +	qcom_map_unmap_carveout(rproc, adsp->mem_phys, adsp->mem_size, false, true, adsp->sid);
> >   disable_irqs:
> >   	qcom_q6v5_unprepare(&adsp->q6v5);
> > @@ -445,6 +462,9 @@ static int adsp_stop(struct rproc *rproc)
> >   			dev_err(adsp->dev, "failed to shutdown dtb: %d\n", ret);
> >   	}
> > +	qcom_unmap_devmem(rproc, adsp->devmem, adsp->sid);
> > +	qcom_map_unmap_carveout(rproc, adsp->mem_phys, adsp->mem_size, false, true, adsp->sid);
> > +
> >   	handover = qcom_q6v5_unprepare(&adsp->q6v5);
> >   	if (handover)
> >   		qcom_pas_handover(&adsp->q6v5);
> > @@ -844,6 +864,25 @@ static int adsp_probe(struct platform_device *pdev)
> >   	}
> >   	platform_set_drvdata(pdev, adsp);
> > +	if (of_property_present(pdev->dev.of_node, "iommus")) {
> > +		struct of_phandle_args args;
> > +
> > +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus", "#iommu-cells", 0, &args);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		rproc->has_iommu = true;
> > +		adsp->sid = args.args[0];
> > +		of_node_put(args.np);
> > +		ret = adsp_devmem_init(adsp);
> > +		if (ret)
> > +			return ret;
> 
> Why don't you get this table from the firmware like presumably QHEE does ?

Well, AFAIK, QHEE(EL2) has this information statically present and does
not get it from anywhere., but will confirm this twice..

-Mukesh

