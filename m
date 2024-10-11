Return-Path: <linux-arm-msm+bounces-34042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 952B1999D83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 09:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10121282445
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 07:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626351F4FA0;
	Fri, 11 Oct 2024 07:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CIXX2T/m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA75FDDA9;
	Fri, 11 Oct 2024 07:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728630692; cv=none; b=Fi/2hZLX+yRinGfoe9DcPdQwB1q++NHtasT8CzJT3Va2mkZDBVUPgz/Zgml+znwCcrQzwXrR6lHJqxtnQhlS41FS6wE5OKqQ67CVgrIM90o4LGsWLYyHDe+BeVROUSOAHJ20lPQbbFX8nAuJyjQi3cdw3eYlnZEC7r/bWS9zbM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728630692; c=relaxed/simple;
	bh=uk9f9jTWCRm0jq2QsUVbWIJww0NuULS4x3aOHcirLo0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQW8UJdBJGtqsMqkC8Dxf3tbHkldp3FyPwWkj8ABm/Ew9n6odJqs87ffY8j1zeVmetDnOG9zQT0sov4AeVvDwUE/3+g23kbTcOJONPZSHQlxM8atpPVXoUFF2P1Tqh9yKCdgGtiYsaLJW8vO7OvbbV6ZHISIHDTEAJb+InO8fZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CIXX2T/m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AKUhrr013561;
	Fri, 11 Oct 2024 07:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HcfeNZ5WgwrvWuf4kINkVI+A
	uPYz+MXFxlmbSQKaYFU=; b=CIXX2T/mr1I+uCQEyxCOXzpsyvUfJo+Q4wM8Zi2P
	sI2rivK5BBjTyYib3ECG9UQiy4IoO8nWKdUSF9A6YncN3vuxhDnqSe18qLh11X9+
	fudN4XdszmiIRvf++1jJMcVD7ECGdfyDzZWAVdYnYBEX43JdaPFL5mBlhNzzAPqp
	m/FfZEM2VFpl0RQUisQu6xlgte8ToNNtbhV7Vg+J+H7dgt94iW6fbxOJTqUJI1Td
	Ha8CgTYGmtLktsjvdSer3ciR31yDp4tMZkX6lKRoGIFLeBj4uAaBFrWkFKmfznMJ
	XnY9sVId2F0GK7+X4Rkd+x0rzvD0PKtq6EbHSPIrDbOIDw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426nc2ha5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 07:11:18 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B7BHgY025315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 07:11:17 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Oct 2024 00:11:12 -0700
Date: Fri, 11 Oct 2024 12:41:09 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Shiraz Hashim <quic_shashim@quicinc.com>, <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <ZwjPjeK3rbpS9K6B@hu-mojha-hyd.qualcomm.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-7-quic_mojha@quicinc.com>
 <9eb910d4-e521-4c14-8e73-8fd3d5ff9573@linaro.org>
 <ZwP1t45ni/gk754B@hu-mojha-hyd.qualcomm.com>
 <ZwTPghV36CSIpkE4@hu-mojha-hyd.qualcomm.com>
 <dfe46653-5243-47c8-8de9-17a38d13da53@linaro.org>
 <20241011050518.GJ1421305@hu-shashim-hyd.qualcomm.com>
 <rbek5diyuwhquhbhk6pukzv474xug3pupcqqc2svrceyodvem5@obah2ahgmcox>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <rbek5diyuwhquhbhk6pukzv474xug3pupcqqc2svrceyodvem5@obah2ahgmcox>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zNDRKWFplBkosuYEtmwa0G2zmKg5L9Y0
X-Proofpoint-GUID: zNDRKWFplBkosuYEtmwa0G2zmKg5L9Y0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110046

On Fri, Oct 11, 2024 at 09:23:05AM +0300, Dmitry Baryshkov wrote:
> On Fri, Oct 11, 2024 at 10:35:18AM GMT, Shiraz Hashim wrote:
> > On Thu, Oct 10, 2024 at 08:57:56AM +0200, neil.armstrong@linaro.org wrote:
> > > On 08/10/2024 08:21, Mukesh Ojha wrote:
> > > > On Mon, Oct 07, 2024 at 08:22:39PM +0530, Mukesh Ojha wrote:
> > > > > On Mon, Oct 07, 2024 at 10:05:08AM +0200, neil.armstrong@linaro.org wrote:
> > > > > > On 04/10/2024 23:23, Mukesh Ojha wrote:
> > > > > > > For Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
> > > > > > > translation for remote processors is managed by QHEE and if the same SoC
> > > > > > > run under KVM, remoteproc carveout and devmem region should be IOMMU
> > > > > > > mapped from Linux PAS driver before remoteproc is brought up and
> > > > > > > unmapped once it is tear down and apart from this, SHM bridge also need
> > > > > > > to set up to enable memory protection on both remoteproc meta data
> > > > > > > memory as well as for the carveout region.
> > > > > > > 
> > > > > > > Enable the support required to run Qualcomm remoteprocs on non-QHEE
> > > > > > > hypervisors.
> > > > > > > 
> > > > > > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > > > > > > ---
> > > > > > >    drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++++++++++++++++++++++++++-
> > > > > > >    1 file changed, 40 insertions(+), 1 deletion(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > > > index ac339145e072..13bd13f1b989 100644
> > > > > > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > 
> > <snip>
> > 
> > > > > > > +		struct of_phandle_args args;
> > > > > > > +
> > > > > > > +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus", "#iommu-cells", 0, &args);
> > > > > > > +		if (ret < 0)
> > > > > > > +			return ret;
> > > > > > > +
> > > > > > > +		rproc->has_iommu = true;
> > > > > > > +		adsp->sid = args.args[0];
> > > > > > > +		of_node_put(args.np);
> > > > > > > +		ret = adsp_devmem_init(adsp);
> > > > > > > +		if (ret)
> > > > > > > +			return ret;
> > > > > > 
> > > > > > Why don't you get this table from the firmware like presumably
> > > > > > QHEE does ?
> > > > > 
> > > > > Well, AFAIK, QHEE(EL2) has this information statically present
> > > > > and does not get it from anywhere., but will confirm this
> > > > > twice..
> > > > 
> > > > Double confirmed, device memory region required by remoteproc is
> > > > statically present with QHEE.
> > > 
> > > Right, in this case why those tables can't be embedded in the elf
> > > .resource_table like it's done with qcom_q6v5_adsp.c by calling
> > > rproc_elf_load_rsc_table() and let the remoteproc framework load the
> > > resource table and setup the devmem ssmu_map ?
> > 
> > Mainly for two reasons -
> > 
> > firmware images on platforms where we like to bring additional no-qhee
> > support do not have resource table.
> > 
> > QCOM PAS implementation for secure remoteproc supports single TZ call
> > of auth_and_rest that authenticates and brings remoteproc out of
> > reset. And we don't have provision to authenticate resource table
> > before it is used for devmem/iommu setup.
> 
> So normally TZ / QHEE have the platform-specific resource table? Isn't
> it tied to the firmware binary?

It is not TZ, but QHEE that statically keeps remoteproc resources with it.

-Mukesh

