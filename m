Return-Path: <linux-arm-msm+bounces-34328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBF699CA1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 14:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 402941C221F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 12:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BC619D065;
	Mon, 14 Oct 2024 12:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZP5+rMN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57AD15665C;
	Mon, 14 Oct 2024 12:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728909022; cv=none; b=XSKsUHD0Cd9enXWVxghIbcQpIUrdRV8T9urDgTlu15Abbw+U+v48I8uxqK2i5+lUQDUuu8kP+3xWTAnVWQkGM4teusraYkEGeG/Vlwe4zHPCnzZY7oNHJ0wqeRvgKEAZBk5b/sWG3RppDthVWcU5FLQ/bVy2uQ2MxfuahNSBGyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728909022; c=relaxed/simple;
	bh=HsdR6pzvJTUp/7mHWPf23rC+R6CP3K7kYSkMipzLsvk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nR/N8xQhDYz90wseLRI1eeVA7z9Qbn6ShDhPZR7e3pkuwKAj61ZOQVgxclTEjU1h5xzlxsJT5zpis9wXGB3dNv0ISXwFr4xjl9B6qKyO/lH7jxOZt78X87ph6CHEyFjf2ZA1xX6J4NaFe3VdlGuPimbzPYHBemWfgiJvvr05nUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZP5+rMN9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E9nJm7020865;
	Mon, 14 Oct 2024 12:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RXhjsQ65Zq/owiEys2n6kxDU
	86vYQ7Q7zhWlre1o2tI=; b=ZP5+rMN9GEq14X20+CKF5LnU2QFnS5KZWqc8Sw4E
	ahktcd3omZnaSNV+5nHQ+ZaXkUIlm5Rj0vPZMy1WKvdwW4OjnVz+zm+3V+FKaJNm
	fkDCrjlxl7EpU11rWmzJR2w2bJafxXI0vgkhh9stuGDbF1Ef5eZqT+3p9+kc2rAn
	PcTNrXqunQdp/r1A9Ex9uUOQv9uHyMWRiL2vLGK2w22iJuDQUaaKP+kbzw8c52Du
	Y+9lirMUiFcGQOXl73Hp7uzQ6t4jrvFTz8iFGDiBU734MqLaHkmDz8GuXqdvIf43
	HwEFlr/JnJnD3/jCXPzrBx6KMMoAfhwIOXf2uG3c1iFSOA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427g45ceng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 12:30:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ECUD54024454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 12:30:13 GMT
Received: from hu-shashim-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 05:30:09 -0700
Date: Mon, 14 Oct 2024 17:59:59 +0530
From: Shiraz Hashim <quic_shashim@quicinc.com>
To: <neil.armstrong@linaro.org>
CC: Mukesh Ojha <quic_mojha@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/6] remoteproc: qcom: Enable map/unmap and SHM bridge
 support
Message-ID: <20241014122959.GA2147073@hu-shashim-hyd.qualcomm.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-7-quic_mojha@quicinc.com>
 <9eb910d4-e521-4c14-8e73-8fd3d5ff9573@linaro.org>
 <ZwP1t45ni/gk754B@hu-mojha-hyd.qualcomm.com>
 <ZwTPghV36CSIpkE4@hu-mojha-hyd.qualcomm.com>
 <dfe46653-5243-47c8-8de9-17a38d13da53@linaro.org>
 <20241011050518.GJ1421305@hu-shashim-hyd.qualcomm.com>
 <80113961-1222-4492-80d2-b29ec6db2b66@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <80113961-1222-4492-80d2-b29ec6db2b66@linaro.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 74GUA4wgpdZ_XzLZD7sLc27LxL2JyN0g
X-Proofpoint-ORIG-GUID: 74GUA4wgpdZ_XzLZD7sLc27LxL2JyN0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140090

On Fri, Oct 11, 2024 at 09:09:08AM +0200, neil.armstrong@linaro.org wrote:
> On 11/10/2024 07:05, Shiraz Hashim wrote:
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
> > > > > > >     drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++++++++++++++++++++++++++-
> > > > > > >     1 file changed, 40 insertions(+), 1 deletion(-)
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
> Why not authenticate a separate binary containing the resource table ?
> 
> Adding the resources to DT is a no go since it's clearly related to what
> the firmare will be using at runtime,

Sorry didn't understand how is it classified as runtime. Similar to
resources required to bring up a device, these correspond to resources
required to be handled before bringing up a remoteproc.

> so either it should go in a .resource_table section or can be moved
> in a signed .mbn that can be authenticated by TZ.

TZ doesn't have a separate authentication call as of now.

If DT is strictly a no go, would moving it to driver itself be an
acceptable option ? inline with what Dmitry suggesting.

regards
Shiraz

