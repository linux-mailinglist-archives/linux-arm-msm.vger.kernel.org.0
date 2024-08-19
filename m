Return-Path: <linux-arm-msm+bounces-29014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3F8957665
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 23:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07BD3283B1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 21:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9101591F3;
	Mon, 19 Aug 2024 21:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fJzXbkF8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94780156875;
	Mon, 19 Aug 2024 21:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724102305; cv=none; b=daH7hmNPYOh4uuGS8ITsAnlLCOOqGoxJYKcEWCqebUJp+EsyClf3GB5taOJASGTfZztZE3eEXlORXkSnj42dHz3DKkbgo/MQ0Zv0ZvwO2MxMhoaSjT5mw65sm2WjqsZ2nE9Rie0oAM+hik54wng+JKeIsnyYXqBFYjFgEij9y8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724102305; c=relaxed/simple;
	bh=NKv3ZMAymczWxahWkkawV6Njp7ozBoz7s2Bkq+UfOFs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTOykXqsXn5O97kbMn/97IcMWQbDFV+AkP6NqHFDSdpDp+0wHyxfCrZppF5a/newxgnQ7oCsOvAa1T6HJ848oNYNcviQe4Ux8NCFgHboHt+M48WiN7VFbQXjhupFcF9rFiVwKiF01zN4pPKZYSGZq1RtqSCxiHgFJV0OlrPx7Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fJzXbkF8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JB1cBk009997;
	Mon, 19 Aug 2024 21:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6uL/6P6FVGOscv8n/r+Tqfp2
	w7fb3CYRdxbLi7UEZzY=; b=fJzXbkF87WMPhOI8SofyGYDbyqAr7oWp82BtMDnq
	49k8RTjGfJpCQNfovfuWMDCCgPTUNuODLHdFLzGIFpCGF/uQGw9DedagNJpDyCsD
	8x1ddgOcpXmR5bRpoJVyNsxtUyLTrJwj7GjOVweSiGHt6f8IdwsX6oGkpkesYwyY
	ux3guhFvb9zOcENnpeD33OA6OBH06OEORDMYHMBNEf/jLIXE5F2udX3e9oQDRU65
	L1xwc4Rsgu2KCKQKLXa0oIXTGvv6Inm7hIK6mdpxQ6M+AMj2M45yPIfmERQ2Q8OO
	j+WRNVnaW68SwB7+aHQ/oaLFXQll2lkJwW+0qUVuEtSdQw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412n585fbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 21:18:01 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JLI1oQ025138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 21:18:01 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 14:18:00 -0700
Date: Mon, 19 Aug 2024 14:17:59 -0700
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
Subject: Re: [PATCH v2 5/7] usb: dwc3: qcom: Don't reply on drvdata during
 probe
Message-ID: <ZsO2h4AanWf2QK9s@hu-bjorande-lv.qualcomm.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-5-91f370d61ad2@quicinc.com>
 <ZrujhBR01MCs3iYE@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZrujhBR01MCs3iYE@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OrXMOMssPu9opz_jDayDqmZSrhTWSV1R
X-Proofpoint-ORIG-GUID: OrXMOMssPu9opz_jDayDqmZSrhTWSV1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1011 spamscore=0
 mlxlogscore=878 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190142

On Tue, Aug 13, 2024 at 02:18:44PM -0400, Frank Li wrote:
> On Sun, Aug 11, 2024 at 08:12:02PM -0700, Bjorn Andersson wrote:
> > From: Bjorn Andersson <quic_bjorande@quicinc.com>
> >
> > With the upcoming transition to a model where DWC3 core and glue operate
> > on a single struct device the drvdata datatype will change to be owned
> > by the core.
> >
> > The drvdata is however used by the Qualcomm DWC3 glue to pass the qcom
> > glue context around before the core is allocated.
> >
> > Remove this problem, and clean up the code, by passing the dwc3_qcom
> > struct around during probe, instead of acquiring it from the drvdata.
> >
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> >  drivers/usb/dwc3/dwc3-qcom.c | 17 ++++++++---------
> >  1 file changed, 8 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > index 88fb6706a18d..33de03f2d782 100644
> > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > @@ -546,9 +546,10 @@ static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
> >  	return ret;
> >  }
> >
> > -static int dwc3_qcom_setup_port_irq(struct platform_device *pdev, int port_index, bool is_multiport)
> > +static int dwc3_qcom_setup_port_irq(struct dwc3_qcom *qcom,
> 
> If pass "qcom", do you need "pdev"? generaly, qcom should have pdev information.
> 

We're only carrying the struct device reference in the dwc3_qcom struct,
as we don't have a use for the platform_device reference beyond probe.

Regards,
Bjorn

