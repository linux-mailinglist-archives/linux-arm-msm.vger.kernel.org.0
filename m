Return-Path: <linux-arm-msm+bounces-29017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AB59576AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 23:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A539B224FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 21:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8DD15AAB1;
	Mon, 19 Aug 2024 21:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DOqfR4Jf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C876159598;
	Mon, 19 Aug 2024 21:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724103419; cv=none; b=beaOOcUI/019Xbp4iD8LgGLbsxayv0SsnnlPaCml/SahFOpR9amG8ZpufRz0Tz7I+qXXK4Ud9JaofIh57LG7tfZHj0fSDpYCpsZu0WHknEHCvJrh/b4bzV2rNL8JkTfXgfUXAAK+5TttLuvM7oaIPpJfSCajkHMBbGGUsm4L/l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724103419; c=relaxed/simple;
	bh=o3C2mk8xz+wfs78LwkgVKwgo4YSn0zSpTf+AoozNowU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqUchdtN7MjTdcLzs5WhTxp7YTCYD0mbGlzL1xJweq2yC+BxcUIuQXZ6kBKM5K+BYNVKmr2wgr94Fjyak9jO2+Wyw/ODn2G1HaEFVH3nladHN6kYoD8tjMBSo/9OLUVuKK/+qTl383BjyIm62MKjAhGeA+JSOad0UEDLmExXsx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DOqfR4Jf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JAJU8h008364;
	Mon, 19 Aug 2024 21:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xJjsH97gvjuAsbViplGFH3rF
	VRxluYzxU/8PviI1uvc=; b=DOqfR4Jfoj0RYqCzVWywN62jdhqCwWKK3FBy/21d
	JD38XUKFzJVRofJqimBVQ6WoHDXGSajmpViHRRQzHHtCQFp7Ih33s34qARXbs9QT
	jlbXIG4bVtfTBEvJwQ+xgAyjQnt8yrUvLhj4PbRslZy1mC433iLSik2SNt+V8T+4
	ulzf3aUYJhZnhM45Ws27PzewQlS9wCE9GC6LvvVoW3efjWMzGOwDzyld9Wz3uMk1
	6V8SN8g8up/K0u823ng8+fV0zg2uQYgWXhu+NmYgcu9/UawExM8JQ38ZZrROx0zv
	0xYcwdWWuQeht7ZequF1KYYIipfa2pKsOrG022D2YksIQQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412k6gdkwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 21:36:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JLaRjr015402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 21:36:27 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 14:36:26 -0700
Date: Mon, 19 Aug 2024 14:36:25 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Saravana Kannan <saravanak@google.com>,
        "Felipe
 Balbi" <balbi@kernel.org>
Subject: Re: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
Message-ID: <ZsO62fLuftny3NfB@hu-bjorande-lv.qualcomm.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>
 <eb0d4f62-5dde-4a63-8515-23081ec9962c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eb0d4f62-5dde-4a63-8515-23081ec9962c@quicinc.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NcFDvQrKN-Hble8ikN2_pPWxU8edIhA1
X-Proofpoint-GUID: NcFDvQrKN-Hble8ikN2_pPWxU8edIhA1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190144

On Mon, Aug 19, 2024 at 11:18:15PM +0530, Krishna Kurapati wrote:
> 
> 
> On 8/12/2024 8:42 AM, Bjorn Andersson wrote:
> > From: Bjorn Andersson <quic_bjorande@quicinc.com>
> > 
> > The DWC3 IP block is handled by three distinct device drivers: XHCI,
> > DWC3 core and a platform specific (optional) DWC3 glue driver.
> > 
> > This has resulted in, at least in the case of the Qualcomm glue, the
> > presence of a number of layering violations, where the glue code either
> > can't handle, or has to work around, the fact that core might not probe
> > deterministically.
> > 
> > An example of this is that the suspend path should operate slightly
> > different depending on the device operating in host or peripheral mode,
> > and the only way to determine the operating state is to peek into the
> > core's drvdata.
> > 
> > The Qualcomm glue driver is expected to make updates in the qscratch
> > register region (the "glue" region) during role switch events, but with
> > the glue and core split using the driver model, there is no reasonable
> > way to introduce listeners for mode changes.
> > 
> > Split the dwc3 core platform_driver callbacks and their implementation
> > and export the implementation, to make it possible to deterministically
> > instantiate the dwc3 core as part of the dwc3 glue drivers and to
> > allow flattening of the DeviceTree representation.
> > 
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> ...
> 
> > -static int dwc3_probe(struct platform_device *pdev)
> > +struct dwc3 *dwc3_probe(struct platform_device *pdev, struct resource *res,
> > +			bool ignore_clocks_and_resets, void *glue)
> >   {
> >   	struct device		*dev = &pdev->dev;
> > -	struct resource		*res, dwc_res;
> > +	struct resource		dwc_res;
> >   	unsigned int		hw_mode;
> >   	void __iomem		*regs;
> >   	struct dwc3		*dwc;
> > @@ -2087,15 +2089,10 @@ static int dwc3_probe(struct platform_device *pdev)
> >   	dwc = devm_kzalloc(dev, sizeof(*dwc), GFP_KERNEL);
> >   	if (!dwc)
> > -		return -ENOMEM;
> > +		return ERR_PTR(-ENOMEM);
> >   	dwc->dev = dev;
> > -
> > -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	if (!res) {
> > -		dev_err(dev, "missing memory resource\n");
> > -		return -ENODEV;
> > -	}
> 
> ...
> 
> > +static int dwc3_plat_probe(struct platform_device *pdev)
> >   {
> > -	struct dwc3	*dwc = platform_get_drvdata(pdev);
> > +	struct resource *res;
> > +	struct dwc3 *dwc;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "missing memory resource\n");
> > +		return -ENODEV;
> > +	}
> > -	pm_runtime_get_sync(&pdev->dev);
> > +	dwc = dwc3_probe(pdev, res, false, NULL);
> > +	if (IS_ERR(dwc))
> > +		return PTR_ERR(dwc);
> > +
> > +	platform_set_drvdata(pdev, dwc);
> 
> This setting of platform drvdata is redundant I believe. We already do it in
> dwc3_probe.
> 

Good catch, you're certainly right.

Regards,
Bjorn

> > +
> > +	return 0;
> > +}
> > +

