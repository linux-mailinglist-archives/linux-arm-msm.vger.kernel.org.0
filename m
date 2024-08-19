Return-Path: <linux-arm-msm+bounces-29015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D1A957695
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 23:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B5761C22766
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 21:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CC215A86B;
	Mon, 19 Aug 2024 21:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eZcshrKS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B590EEA5;
	Mon, 19 Aug 2024 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724102947; cv=none; b=l7ywuqR1UaOwj0MZZ+LQAnOAl1bCMd740RuMJvGKdTodXVMMhD2f74IQt5AN5PVjgt1APEWO7hERabyLYUSORdsmxIg/MLlnTOceEUPgIpmaEUscIHJad9i07fdj1ogWnxaqKFPCmcY1cYEXOqyC+ksX5huR1qKDg8Ea/4/yPhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724102947; c=relaxed/simple;
	bh=emA2198+Po9hREBur1rawvdpu0famS95sPQEi4uEjIA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abl3iMep2oqO5ZS0Drbee1DFrA+oVNw/TWkIUKyi/XYDViK7IVz/d+125x4Sf9kRt76NQG2VWYvWLlDnlA63rQbvpLm0uQT+AWQv0aZsuwG2rzJjNzM8f7/kBRtt3EaSqYHscfV7COhgfUKv+nzuVEIfoMYKikghpOloEhA1lZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eZcshrKS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JBfvNC014401;
	Mon, 19 Aug 2024 21:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nzm/S/afbNwh1e/MB7AURkZS
	f6y9LurbockOcF2ulxc=; b=eZcshrKSaLvC0FDKv/L5938VbhdXj2lpcdKXlnnZ
	VswPuxakRg38UdBypF9+nKlzgP3E1I8GRHPnzikbF+BkCjm6+/K/mYzFdF4LSTti
	0KDdRRzaYnUzyKo5s3yemBuUUwFEF9RnWZBrmIXVDCEOQ30tBogzBu3Kykdl26Bk
	26xyfsx8gmPiOGtiNrrPFKkzkOglUjnHztouJXIW5CV00lptbXJYPOaMos38KeNE
	lQD/hbWXBWztcnDpJtD/M/7qprXXaJJUyhB8M9T4gA9QIzkbH7btyr0Ii+dblRDO
	CrTkfDPOSDc7yu17ZuBnr0oSZPmLttfjWYOe0SDcS7b7YA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412mmene09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 21:28:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JLSqj4009405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 21:28:52 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 14:28:51 -0700
Date: Mon, 19 Aug 2024 14:28:50 -0700
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
Subject: Re: [PATCH v2 6/7] usb: dwc3: qcom: Transition to flattened model
Message-ID: <ZsO5EnMgKj1GxlQA@hu-bjorande-lv.qualcomm.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-6-91f370d61ad2@quicinc.com>
 <ZrunFEOV5/aM4G4U@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZrunFEOV5/aM4G4U@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dQ7H97UDkCEOCygWyw0dotxFPc9Xu-0z
X-Proofpoint-ORIG-GUID: dQ7H97UDkCEOCygWyw0dotxFPc9Xu-0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190143

On Tue, Aug 13, 2024 at 02:33:56PM -0400, Frank Li wrote:
> On Sun, Aug 11, 2024 at 08:12:03PM -0700, Bjorn Andersson wrote:
> > From: Bjorn Andersson <quic_bjorande@quicinc.com>
> >  drivers/usb/dwc3/dwc3-qcom.c | 310 +++++++++++++++++++++++++++++++++++--------
[..]
> > @@ -302,25 +306,16 @@ static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
> >  /* Only usable in contexts where the role can not change. */
> >  static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
> >  {
> > -	struct dwc3 *dwc;
> > -
> > -	/*
> > -	 * FIXME: Fix this layering violation.
> > -	 */
> > -	dwc = platform_get_drvdata(qcom->dwc3);
> > -
> > -	/* Core driver may not have probed yet. */
> > -	if (!dwc)
> > -		return false;
> > +	struct dwc3 *dwc = qcom->dwc;
> >
> >  	return dwc->xhci;
> 
> dwc only use once.
> 
> 	return qcom->dwc->xhci?
> 

I like it, thanks for the suggestion.

> >  }
> >
[..]
> > +/* Convert dev's DeviceTree representation from qcom,dwc3 to qcom,snps-dwc3 binding */
> > +static int dwc3_qcom_convert_legacy_dt(struct device *dev)
> > +{
> > +	struct device_node *qcom = dev->of_node;
> > +	struct device_node *dwc3;
> > +	struct property *prop;
> > +	int ret = 0;
> > +
> > +	dwc3 = of_get_compatible_child(qcom, "snps,dwc3");
> > +	if (!dwc3)
> > +		return 0;
> > +
> > +	/* We have a child node, but no support for dynamic OF */
> > +	if (!IS_ENABLED(CONFIG_OF_DYNAMIC))
> > +		return -EINVAL;
> > +
> > +	for_each_property_of_node(dwc3, prop) {
> > +		if (!strcmp(prop->name, "compatible"))
> > +			;
> > +		else if (!strcmp(prop->name, "reg"))
> > +			ret = dwc3_qcom_legacy_update_reg(qcom, dwc3);
> > +		else if (!strcmp(prop->name, "interrupts"))
> > +			ret = dwc3_qcom_legacy_convert_interrupts(qcom, prop);
> > +		else
> > +			ret = dwc3_qcom_legacy_migrate_prop(qcom, prop);
> >  	}
> >
> > -node_put:
> > -	of_node_put(dwc3_np);
> > +	if (ret < 0)
> > +		goto err_node_put;
> > +
> > +	ret = dwc3_qcom_legacy_migrate_child(qcom, dwc3, "port");
> > +	if (ret)
> > +		goto err_node_put;
> > +
> > +	ret = dwc3_qcom_legacy_migrate_child(qcom, dwc3, "ports");
> > +	if (ret)
> > +		goto err_node_put;
> > +
> > +	of_detach_node(dwc3);
> > +	of_node_put(dwc3);
> >
> > +	return 0;
> > +
> > +err_node_put:
> > +	of_node_put(dwc3);
> >  	return ret;
> >  }
> 
> Look like you copy children dwc3's property into current glue node.
> Can you passdown dwc3's node into dwc3_probe(), let dwc3_probe to handle
> these, Or move it into dwc3-core. otherwise, if imx want to do the same
> thing, the the same code will be dupicated.
> 

I tried that, as it would have saved me from having to do the dynamic
rewrite.

But the dwc3 core and host are full of device_property_read*(),
phy_get(), platform_get_irq() etc which operates on the dwc->dev.

I think it can be done, but this felt like a cleaner outcome, in
particular once we transition the DeviceTree source.

As you say, there should be a fair amount of room for duplication here,
so perhaps we can move that to a "glue.c" and share it?

[..]
> > @@ -773,10 +937,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
> >  		goto reset_assert;
> >  	}
> >
> > -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	ret = of_address_to_resource(np, 0, &res);
> > +	if (ret < 0)
> > +		goto clk_disable;
> > +	res.end = res.start + SDM845_QSCRATCH_BASE_OFFSET;
> >
> > -	qcom->qscratch_base = devm_ioremap_resource(dev, res);
> > +	qcom->qscratch_base = devm_ioremap(dev, res.end, SDM845_QSCRATCH_SIZE);
> >  	if (IS_ERR(qcom->qscratch_base)) {
> > +		dev_err(dev, "failed to map qscratch region: %pe\n", qcom->qscratch_base);
> 
> dev_err_probe()?
> 

Sounds good.

Thank you,
Bjorn

