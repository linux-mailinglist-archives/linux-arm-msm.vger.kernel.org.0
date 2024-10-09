Return-Path: <linux-arm-msm+bounces-33616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 994CF995DF0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 04:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 555CB285113
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 02:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCB113635F;
	Wed,  9 Oct 2024 02:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="keQhcz4t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DEC20B0F;
	Wed,  9 Oct 2024 02:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728442507; cv=none; b=bhGSFDcYJK0YcJWwzNegBWdt9Sqwjmj+LiiVB9AaQeuPYhNKeg7h2XzFEqIKD9JjoA1fcqatmxG6VDR+j9Dge37wtcV1xCVEkc3XHf56PEiItpqp0/RFb7KfYrsRzUbzprCkIwiV5Rqp/gtGoXHjiO1nGkU1vSvNXpP/Qv3aP5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728442507; c=relaxed/simple;
	bh=oxm1Ff3vxNyn1mbJxKeZbnMvDmPaCTYcZp501d21ls8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9MeVUfuHZAJlAbw9tiRREFFwKVYWyixMRPrvs8L3i9b4dS1TLQKXvXFEPAakZ3qE/7Atjunfyaee0p5SkLmGHvs1Ipi/NRk5MzhDSxQvhvE8N0puO7KhyKkw+6R1m0ffFoIHa27ONgVnw6QC08wNr1+w7qMq1rsilIl9v0nu5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=keQhcz4t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498D2kbj010523;
	Wed, 9 Oct 2024 02:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vfgF9EMGlGzSd0FlTmezTu1P
	DT0ku04Q94Tou5aFIy4=; b=keQhcz4tVzSyxE5TJUxXWBCQPQY7IkV4j9hlypoe
	7LGPBZ/xPgXRmUFhy32sm5CJ68Q+Q3dRS25kkTgdaguBNVmBp5Ds137eCd9ndk7X
	OMGmmt+G1s3oMcpWHJGCP66HSquiwla/W1l6SummKoUaQbpW8ZahsmwKEljoGqwO
	ylSug5VPFa9VM0LAIef1aiGNwTLm662wFGNbkmCmAge1JMJO9PFIhM1JUo6rwFE1
	n2UDyVHrlTEeYhKKTWhRAtZFrCL/TyrMTB9B4YTaTq4a2Jn6pDVxx8Cvkj4R2mOh
	ydUv60+MD+iH12gV3sTyW+s5xiaZpheOzRU80cm2cy4tMA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424x7ru93e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 02:54:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4992sofX016702
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 02:54:50 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Oct 2024 19:54:49 -0700
Date: Tue, 8 Oct 2024 19:54:48 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Frank Li <Frank.li@nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Felipe
 Balbi" <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "Saravana
 Kannan" <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] usb: dwc3: qcom: Flatten dwc3 structure
Message-ID: <ZwXweChRh5bjc1nS@hu-bjorande-lv.qualcomm.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <ZrugxSqzhzxvVqV3@lizhi-Precision-Tower-5810>
 <ZwWRieC0D3Q13VW7@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZwWRieC0D3Q13VW7@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZM-Qi9yHp8KQBwteTcbygHTHuEph1dtt
X-Proofpoint-ORIG-GUID: ZM-Qi9yHp8KQBwteTcbygHTHuEph1dtt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=845 spamscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090017

On Tue, Oct 08, 2024 at 04:09:45PM -0400, Frank Li wrote:
> On Tue, Aug 13, 2024 at 02:07:01PM -0400, Frank Li wrote:
> > On Sun, Aug 11, 2024 at 08:11:57PM -0700, Bjorn Andersson wrote:
> > > The USB IP-block found in most Qualcomm platforms is modelled in the
> > > Linux kernel as 3 different independent device drivers, but as shown by
> > > the already existing layering violations in the Qualcomm glue driver
> > > they can not be operated independently.
> > >
> > > With the current implementation, the glue driver registers the core and
> > > has no way to know when this is done. As a result, e.g. the suspend
> > > callbacks needs to guard against NULL pointer dereferences when trying
> > > to peek into the struct dwc3 found in the drvdata of the child.
> > >
> > > Missing from the upstream Qualcomm USB support is handling of role
> > > switching, in which the glue needs to be notified upon DRD mode changes.
> > > Several attempts has been made through the years to register callbacks
> > > etc, but they always fall short when it comes to handling of the core's
> > > probe deferral on resources etc.
> > >
> > > Furhtermore, the DeviceTree binding is a direct representation of the
> > > Linux driver model, and doesn't necessarily describe "the USB IP-block".
> > >
> > > This series therefor attempts to flatten the driver split, and operate
> > > the glue and core out of the same platform_device instance. And in order
> > > to do this, the DeviceTree representation of the IP block is flattened.
> >
> 
> Bjorn Andersson:
> 	Any follow up on this thread?
> 

Thanks for reaching out, Frank. I did pick this up again a few days
back.

I'm struggling with Rob's request for not peeking into struct property
and/or utilizing overlays. Hoping to figure this out shortly, so I can
get v3 in shape.

Regards,
Bjorn

