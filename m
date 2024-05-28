Return-Path: <linux-arm-msm+bounces-20776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C38D1E15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 16:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 478811C22C4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7559316F829;
	Tue, 28 May 2024 14:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GgmwOqsT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3A316F277;
	Tue, 28 May 2024 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716905490; cv=none; b=RYIIH7Ox+IPOqtmZiInOcwh6tbTOLA/gfn3T/s+Df73YaVYnefrxPKh/XcGUX9n9OiGJT6D6OdDqoBdgvgEGmLWMe9wnOkmyMoAmOPG4Eor8YqY6KfdWcz+X3kzPIezuFD5iG7U5OnktHxo4f5oR2ZMgxwqtVSQIFtBigpmnCf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716905490; c=relaxed/simple;
	bh=Wh4U9HaJpeOcnxWvaHFBS0Mk9WgABPGCjn/FVN+gqy8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mU8YD/kTm8DozVqt4rKkERPeEZLad6i4FfhtpjompJFyHB8tZZJWIgiPyChOQOIvQg73ZAHqShifxHfMjH4aHz4jZol5SNF/cK3NR4oUrv2ZAIvE8P7CDHa8wYz//IRmti9jXjHOvssCPGedWlBliMx/CncJnlj+tGhmYazuD6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GgmwOqsT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SBG8ub006307;
	Tue, 28 May 2024 14:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xt8AOuLuReTHWwWuia3CRpLS
	kbzClAGe5UmAniUT+PY=; b=GgmwOqsT++6fSlvaARvQKpNblyp+80muxPNq2WnJ
	4jhxJm0N8yVA7w2vXQXKE7mUXgLzsPjm3P7Pbi/W2WdbWTevFLK3D1Fc6zhtjOd3
	4BaWNQPQx64DTuWRgjehm8WmkV7f7Gm8gF8AWWabl7e2VsTunq9854HBL6t6OFHM
	0pqeHe8qxPJvwB5pZhvKy8Km63AVZjxLYaooK4g43fwNf/8ZWK0AUbgXzi35YMVp
	x4WAxHs6INZZbiBRGYC055eCqPA6uS6y4//u2y21tg31TWZPHaWz0SIh4V0zk2GS
	tl8ufHPPN6dqDqakgyTVccY4wC1s6mW383l6WIrL7yi5pA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0pp76h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:11:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SEBLmx009088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:11:21 GMT
Received: from hu-vvalluru-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 07:11:17 -0700
Date: Tue, 28 May 2024 19:41:13 +0530
From: Prahlad Valluru <quic_vvalluru@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nankam@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <quic_abhinavk@quicinc.com>,
        <konrad.dybcio@linaro.org>, <conor+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
Message-ID: <20240528141113.GA6631@hu-vvalluru-hyd.qualcomm.com>
References: <171405653305.2527744.3813895380659072690.robh@kernel.org>
 <20240426142442.7769-1-quic_vvalluru@quicinc.com>
 <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
 <171517823376.1753082.4070659246393696781.robh@kernel.org>
 <20240515150459.GA32547@hu-vvalluru-hyd.qualcomm.com>
 <CAA8EJpo=Q4_=JU83-9ooSqiSr=xUeHh2awDhzq9q3Xd56h83zw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJpo=Q4_=JU83-9ooSqiSr=xUeHh2awDhzq9q3Xd56h83zw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tHUTAAmDNPkyw3QWt4vZhox7tg88BLeY
X-Proofpoint-GUID: tHUTAAmDNPkyw3QWt4vZhox7tg88BLeY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_10,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280107

On Wed, May 15, 2024 at 05:28:24PM +0200, Dmitry Baryshkov wrote:
> On Wed, 15 May 2024 at 17:05, Prahlad Valluru <quic_vvalluru@quicinc.com> wrote:
> >
> > On Wed, May 08, 2024 at 09:31:24AM -0500, Rob Herring (Arm) wrote:
> > >
> > > On Mon, 06 May 2024 18:14:10 -0500, Bjorn Andersson wrote:
> > > > On Fri, Apr 26, 2024 at 07:54:42PM GMT, Prahlad Valluru wrote:
> > > > > From: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
> > > > >
> > > >
> > > > Please don't thread new versions off existing version. b4 helps you with
> > > > getting these things right, please check go/upstream for more details.
> > > >
> > > > > Enable lt9611uxc bridge for qcs6490 rb3 gen2 platform.
> > > > >
> > > >
> > > > Even if it's clear what this is, I would prefer if you described the
> > > > hardware a little bit in your commit message.
> > > > "Rb3Gen2 has a HDMI connector, connected to DSI via a LT on i2cX.... reset and
> > > > irq pins comes from x and y. Describe this."
> > > >
> > > > > Signed-off-by: Prahlad Valluru <quic_vvalluru@quicinc.com>
> > > > > ---
> > > > > v2: Addressed dtschema errors
> > > > >   - Fixed lt9611-irq
> > > > >   - vdd-supply error to be ignored, as it is connected to
> > > > >     input supply directly, on rb3gen2
> > >
> > > The choice is either fix the dts or fix the binding.
> >
> > vdd-supply is mandatory for lt9611. Only in case of rb3gen2, we are seeing this
> > error, since it is connected to supply directly. Will add dummy vreg to address this.
> 
> s/add dummy vreg/describe fixed hardware register/
True, will define a fixed regulator for vdd.
> 
> 
> -- 
> With best wishes
> Dmitry

