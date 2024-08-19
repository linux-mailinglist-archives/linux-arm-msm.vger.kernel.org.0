Return-Path: <linux-arm-msm+bounces-29013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE43395765F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 23:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06E211C232B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 21:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9B115A848;
	Mon, 19 Aug 2024 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X/uQ/KHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C6D158A08;
	Mon, 19 Aug 2024 21:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724102097; cv=none; b=Y9QNUvm/3N/GKOvnHGr+9ziieAivSfmDvssg/GYXiUYgtdP4z45T6kr0/hYkE1s38aUK7btBI8Bzlg5Vi2lvu0eiMDKmgb8bwpR3AVb1sjoVrg+DK3GvgGpMtz4tcst3igBLb5+FXz9HthIQOnHNQ11V9GSACb1FJBt2jJTE1dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724102097; c=relaxed/simple;
	bh=o0OT+2x0mpRbwy66yryxlbfihOSoB10aB6pvPfMJqLE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4s3o+xTI+/MYm1pt5kvpk/lqJVljCcfiFLIfTIXRUH+6D92VQUYdv3+v7itq99SY+cglYvCTPQ4zJo71HB/z3IqAi4BEvbwhVGPZNzswlBumkW03tZrMSbBD5YM5A5tHab+Jhh17rVPB2a2gcS1AZg5QR9e61caGsxGGR0ebiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X/uQ/KHT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JB5q0x002613;
	Mon, 19 Aug 2024 21:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OApQjo31msAzpKNSnn4f2ocM
	c6KgDLwvKGYwg3ZmuQw=; b=X/uQ/KHTYMk7LkDX0dOA7mz1TS6qcnzxFOdLpSwz
	euravFjnHsI+SSHtFws16d2EJ7Lg87Q9/uCvO7sN2nzf3cJVwYdVcn0lOkwBLr/V
	KufuPF/+s5RWGdlRkh4hUnDkvoLXKy0hJB6OGKkT8TGmR3kx7epKpu0DbBXnd5Od
	dY9O8Nz3k6KZCaBYd5lPTjYmcLZVFUlXty1bC3GN9wuM3YUbCEcLtPqAcWuh9HsP
	w+mcqhliRMs86q72AFSgRa9dC+QEwzF6hPwaqMfuxK1b4USEzbTmTq76PsB2Pefl
	zTWHyiMccIvFsHSGNCHslaTpdBpB/Z4ijq7X3mIVjE8iHA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 413qxg3885-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 21:14:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JLEhuA024876
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 21:14:43 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 14:14:42 -0700
Date: Mon, 19 Aug 2024 14:14:41 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
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
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
Message-ID: <ZsO1wbXSpaMk4ZMB@hu-bjorande-lv.qualcomm.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>
 <20240814005638.dy4k545n7cwkdzkv@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240814005638.dy4k545n7cwkdzkv@synopsys.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: U25fnzPaYzxCKCvz3JJY5sskhYp-ANME
X-Proofpoint-GUID: U25fnzPaYzxCKCvz3JJY5sskhYp-ANME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408190142

On Wed, Aug 14, 2024 at 12:56:44AM +0000, Thinh Nguyen wrote:
> On Sun, Aug 11, 2024, Bjorn Andersson wrote:
> > From: Bjorn Andersson <quic_bjorande@quicinc.com>
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
[..]
> > @@ -2076,10 +2077,11 @@ static int dwc3_get_num_ports(struct dwc3 *dwc)
> >  	return 0;
> >  }
> >  
> > -static int dwc3_probe(struct platform_device *pdev)
> > +struct dwc3 *dwc3_probe(struct platform_device *pdev, struct resource *res,
> > +			bool ignore_clocks_and_resets, void *glue)
> 
> Perhaps create a wrapper struct to hold the parameters above. I can see
> we may expand this in the future.
> 

Sounds good.

There are a few cases where e.g. the Qualcomm glue needs to react to
role switching in the core, so we already know that we want to add some
callbacks here.

> >  {
> >  	struct device		*dev = &pdev->dev;
> > -	struct resource		*res, dwc_res;
> > +	struct resource		dwc_res;
> >  	unsigned int		hw_mode;
> >  	void __iomem		*regs;
> >  	struct dwc3		*dwc;
> > @@ -2087,15 +2089,10 @@ static int dwc3_probe(struct platform_device *pdev)
> >  
> >  	dwc = devm_kzalloc(dev, sizeof(*dwc), GFP_KERNEL);
> >  	if (!dwc)
> > -		return -ENOMEM;
> > +		return ERR_PTR(-ENOMEM);
> >  
> >  	dwc->dev = dev;
> > -
> > -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	if (!res) {
> > -		dev_err(dev, "missing memory resource\n");
> > -		return -ENODEV;
> > -	}
> > +	dwc->glue = glue;
> >  
> >  	dwc->xhci_resources[0].start = res->start;
> >  	dwc->xhci_resources[0].end = dwc->xhci_resources[0].start +
> > @@ -2123,7 +2120,7 @@ static int dwc3_probe(struct platform_device *pdev)
> >  
> >  	regs = devm_ioremap_resource(dev, &dwc_res);
> >  	if (IS_ERR(regs))
> > -		return PTR_ERR(regs);
> > +		return ERR_CAST(regs);
> >  
> >  	dwc->regs	= regs;
> >  	dwc->regs_size	= resource_size(&dwc_res);
> > @@ -2132,15 +2129,17 @@ static int dwc3_probe(struct platform_device *pdev)
> >  
> >  	dwc3_get_software_properties(dwc);
> >  
> > -	dwc->reset = devm_reset_control_array_get_optional_shared(dev);
> > -	if (IS_ERR(dwc->reset)) {
> > -		ret = PTR_ERR(dwc->reset);
> > -		goto err_put_psy;
> > -	}
> > +	if (!ignore_clocks_and_resets) {
> 
> This seems to be specific change for your platform. Let's keep this
> change separated from this patch.
> 

The primary need here is that the glue code needs to be able to access
the hardware before the core's resume and after suspend. I'd expect
other glue implementations will have the same need.

But moving this change to a separate change allows us to reason about
that separately, so I like the suggestion.

Thanks,
Bjorn

> Thanks,
> Thinh
> 

