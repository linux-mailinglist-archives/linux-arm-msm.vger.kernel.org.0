Return-Path: <linux-arm-msm+bounces-34011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E395D999BF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 07:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A9A7286158
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 05:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7883C1F1310;
	Fri, 11 Oct 2024 05:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cxau8N8a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21212581;
	Fri, 11 Oct 2024 05:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728623134; cv=none; b=V2Q3wyk0hADZv6fkKIQW8VdeZh1fDUVMH1Pwj7XRlyJ1HG39oQFIlgGlX2TChLPjA8id3Izy1ycVp+3eSF0qC33IPOIRY0zxM5Rwesh8K8fIw2En90ef5fozz1RGmPekoD5u2JpTx2beQYujQnSVrXyLA2+Tve2lQVaRD8Zg7Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728623134; c=relaxed/simple;
	bh=Z+lOO4HtqgHurovB4N3qX+ffyX+Js59pB/KSjEd4SMc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1oFVMhddlL1vx7zLdZ/5wFp6xK1O7SnuO/fg1MqfSJBBjhvQQygdLWcmyPSFNf6lGmt5MqngFTs71TYIs9tC1m86y/1bT1YEE8dws9+sOHomdTPyxAk91NT5ETu59Hyomz6/VvuHPIyK3IoXdKVWOKkMQchTC82Yj3grrZu5wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cxau8N8a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B1Hf8D005437;
	Fri, 11 Oct 2024 05:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DeRAgiKCa7UKV6icCaoPho23
	OOxbcTE0/jFXarh9Q4E=; b=cxau8N8aYDAbFrsL82bKVsl8NJwAcV+3LO78PYbu
	LzXNOTUdoV3FRw59VaY9r+WW0rrQSYV+MCqlmV4wEYTkki8o1OdiV3+Z7IUghgY0
	GH8Sx9t6yDxLoBL8GmlQ3a59AddoedfspYgqwPoyjjeLb3Fdq3aulWrewFYo2IzP
	fItSBZB04bfEaizqfYSzJ+7j9LPW7RwhomVY02nbP+efK5uZ5pXl3gjbyx7qTa7O
	DrhvHJbOuiIWYFhagG8A75dDfun6TOpPw3Wmzp9LUUXO4ZVJBNmFXYKAxzeX3IkM
	EW+fk3ppNtH12qKjGq1m2S6whbGmSiQpVhd85EDCcKCvzQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426t7srdmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 05:05:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B55QGL010827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 05:05:26 GMT
Received: from hu-shashim-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 22:05:22 -0700
Date: Fri, 11 Oct 2024 10:35:18 +0530
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
Message-ID: <20241011050518.GJ1421305@hu-shashim-hyd.qualcomm.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-7-quic_mojha@quicinc.com>
 <9eb910d4-e521-4c14-8e73-8fd3d5ff9573@linaro.org>
 <ZwP1t45ni/gk754B@hu-mojha-hyd.qualcomm.com>
 <ZwTPghV36CSIpkE4@hu-mojha-hyd.qualcomm.com>
 <dfe46653-5243-47c8-8de9-17a38d13da53@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dfe46653-5243-47c8-8de9-17a38d13da53@linaro.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CcvRwPar5ILwrw7DO8J-LVxz8aFxxHw9
X-Proofpoint-ORIG-GUID: CcvRwPar5ILwrw7DO8J-LVxz8aFxxHw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 clxscore=1011 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110030

On Thu, Oct 10, 2024 at 08:57:56AM +0200, neil.armstrong@linaro.org wrote:
> On 08/10/2024 08:21, Mukesh Ojha wrote:
> > On Mon, Oct 07, 2024 at 08:22:39PM +0530, Mukesh Ojha wrote:
> > > On Mon, Oct 07, 2024 at 10:05:08AM +0200, neil.armstrong@linaro.org wrote:
> > > > On 04/10/2024 23:23, Mukesh Ojha wrote:
> > > > > For Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
> > > > > translation for remote processors is managed by QHEE and if the same SoC
> > > > > run under KVM, remoteproc carveout and devmem region should be IOMMU
> > > > > mapped from Linux PAS driver before remoteproc is brought up and
> > > > > unmapped once it is tear down and apart from this, SHM bridge also need
> > > > > to set up to enable memory protection on both remoteproc meta data
> > > > > memory as well as for the carveout region.
> > > > > 
> > > > > Enable the support required to run Qualcomm remoteprocs on non-QHEE
> > > > > hypervisors.
> > > > > 
> > > > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > > > > ---
> > > > >    drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++++++++++++++++++++++++++-
> > > > >    1 file changed, 40 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > index ac339145e072..13bd13f1b989 100644
> > > > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c

<snip>

> > > > > +		struct of_phandle_args args;
> > > > > +
> > > > > +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus", "#iommu-cells", 0, &args);
> > > > > +		if (ret < 0)
> > > > > +			return ret;
> > > > > +
> > > > > +		rproc->has_iommu = true;
> > > > > +		adsp->sid = args.args[0];
> > > > > +		of_node_put(args.np);
> > > > > +		ret = adsp_devmem_init(adsp);
> > > > > +		if (ret)
> > > > > +			return ret;
> > > > 
> > > > Why don't you get this table from the firmware like presumably
> > > > QHEE does ?
> > > 
> > > Well, AFAIK, QHEE(EL2) has this information statically present
> > > and does not get it from anywhere., but will confirm this
> > > twice..
> > 
> > Double confirmed, device memory region required by remoteproc is
> > statically present with QHEE.
> 
> Right, in this case why those tables can't be embedded in the elf
> .resource_table like it's done with qcom_q6v5_adsp.c by calling
> rproc_elf_load_rsc_table() and let the remoteproc framework load the
> resource table and setup the devmem ssmu_map ?

Mainly for two reasons -

firmware images on platforms where we like to bring additional no-qhee
support do not have resource table.

QCOM PAS implementation for secure remoteproc supports single TZ call
of auth_and_rest that authenticates and brings remoteproc out of
reset. And we don't have provision to authenticate resource table
before it is used for devmem/iommu setup.

regards
Shiraz

