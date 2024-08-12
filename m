Return-Path: <linux-arm-msm+bounces-28348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BB194F97A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 00:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3623E1C21799
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 22:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55DF1953B9;
	Mon, 12 Aug 2024 22:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XwHr5U6H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE44414A4DF;
	Mon, 12 Aug 2024 22:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723501018; cv=none; b=j1XCDErj1VgZEuCWgrTUtvo4URvLqmGHRveEIedxu2f0NF2eM52FLHDABekZKyvRcbTFFbKWzdsJTqW4XR/CXRCXF3YRWMEhVM4l7THmCIbi5MkW7QsScSTrOA4UrJyvFZJS3Qicy/lZv+PjZ1g8iPpjWi6Wj4kx6rLhIxYD1Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723501018; c=relaxed/simple;
	bh=+ncDPARUwx6p23qdb8i7srs3SW1uDHyV+GGvWZdk5sE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmEpP856wzbIgiPkJZj8kOWmHoF67NmeXfd9tY9MhdjUxQn2ltKdlwR9VDTLDe6d0mXd7c/8SPXIa+viTlQSOn2DwCiu6hn0/jYWJqUCBZTTfsmqn87jAEet/IlDsGEVDRDmyOEdiJ7Kcyi5nqxRbTFm3SxrMPtG1fhFXZ6GwBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XwHr5U6H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDSZuM021499;
	Mon, 12 Aug 2024 22:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QNIE3yAdiYLgDXjZr4W4bENb
	pXioQ42veMrNJMx0qhg=; b=XwHr5U6HrZSGJSDxnWnzrCrrO1wxvDXQRTzfgqNi
	If/QRHr3z79y6k+bo4fvgsKZqWRewO5bO4ZA7jrDEoXwwvKcNx7eaX9T6UHSqdAE
	Dn4YX5+90XBuLdJpOPVX1fu7JXb8I5OM8e/LNbwxn6zBN45qsnOTssBygdFhb3uI
	hD3d/368FnJ8KCz5nOPNAP3QZvJDbhNqzeM2OXaG/qtQ964DZsj2ITXELL0Hh6/q
	7eLNGHLPrQF/tbPhwPmHxmDtjL6csUF+FGoAojXG5xBODXTp11EKFKT9AXeWCGhf
	5Lchgy24m12iaw41TdeOCdc0eCtcW5ok3D5ZUblP+PfHNQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1g7wks1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 22:16:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47CMGiCF021972
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 22:16:44 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 12 Aug 2024 15:16:43 -0700
Date: Mon, 12 Aug 2024 15:16:42 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Herring <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley
 Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@linaro.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 6/7] usb: dwc3: qcom: Transition to flattened model
Message-ID: <ZrqJyh4UPJ5xBhq2@hu-bjorande-lv.qualcomm.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-6-91f370d61ad2@quicinc.com>
 <20240812212139.GA1797954-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240812212139.GA1797954-robh@kernel.org>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XdqdRzcO9BWaJRLGOI6TBGoKgepnYOmU
X-Proofpoint-ORIG-GUID: XdqdRzcO9BWaJRLGOI6TBGoKgepnYOmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120164

On Mon, Aug 12, 2024 at 03:21:39PM -0600, Rob Herring wrote:
> On Sun, Aug 11, 2024 at 08:12:03PM -0700, Bjorn Andersson wrote:
> > From: Bjorn Andersson <quic_bjorande@quicinc.com>
> > 
> > The USB IP-block found in most Qualcomm platforms is modelled in the
> > Linux kernel as 3 different independent device drivers, but as shown by
> > the already existing layering violations in the Qualcomm glue driver
> > they can not be operated independently.
> > 
> > With the current implementation, the glue driver registers the core and
> > has no way to know when this is done. As a result, e.g. the suspend
> > callbacks needs to guard against NULL pointer dereferences when trying
> > to peek into the struct dwc3 found in the drvdata of the child.
> > Even with these checks, there are no way to fully protect ourselves from
> > the race conditions that occur if the DWC3 is unbound.
> > 
> > Missing from the upstream Qualcomm USB support is handling of role
> > switching, in which the glue needs to be notified upon DRD mode changes.
> > Several attempts has been made through the years to register callbacks
> > etc, but they always fall short when it comes to handling of the core's
> > probe deferral on resources etc.
> > 
> > Moving to a model where the DWC3 core is instantiated in a synchronous
> > fashion avoids above described race conditions.
> > 
> > It is however not feasible to do so without also flattening the
> > DeviceTree binding, as assumptions are made in the DWC3 core and
> > frameworks used that the device's associated of_node will the that of
> > the core. Furthermore, the DeviceTree binding is a direct
> > representation of the Linux driver model, and doesn't necessarily
> > describe "the USB IP-block".
> > 
> > The Qualcomm DWC3 glue driver is therefor transitioned to initialize and
> > operate the DWC3 within the one device context, in synchronous fashion.
> > 
> > To handle backwards compatibility, and to remove the two-device model,
> > of_nodes of the old compatible are converted to the new one, early
> > during probe.
> > 
> > This happens in the event that a DWC3 core child node is present, the
> > content of the reg and interrupt properties of this node are merged into
> > the shared properties, all remaining properties are copied and the core
> > node is dropped. Effectively transitioning the node from qcom,dwc3 to
> > qcom,snps-dwc3.
> 
> In the past we've done this old binding to new binding with an overlay 
> embedded in the kernel. The overlay would just be the .dts change you've 
> made (we should have a tool that takes 2 DTs and generates an overlay as 
> the diff). I suppose it's a few platforms here, but then it is just data 
> and easily deleted when no longer needed (I think the cases I'm 
> remembering did just that because they are gone now. It was TI display 
> and Renesas media stuff IIRC). 
> 

Where and how do you apply this overlay?

If I can avoid doing the dynamic translation, I'd be happy to do so.

> 
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> >  drivers/usb/dwc3/dwc3-qcom.c | 310 +++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 251 insertions(+), 59 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
[..]
> > -static int dwc3_qcom_of_register_core(struct dwc3_qcom *qcom, struct platform_device *pdev)
> > +static struct property *dwc3_qcom_legacy_prop_concat(const char *name,
> > +						     const void *a, size_t a_len,
> > +						     const void *b, size_t b_len)
> >  {
> > -	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
> > -	struct device		*dev = &pdev->dev;
> > -	int			ret;
> > +	size_t len = a_len + b_len;
> >  
> > -	dwc3_np = of_get_compatible_child(np, "snps,dwc3");
> > -	if (!dwc3_np) {
> > -		dev_err(dev, "failed to find dwc3 core child\n");
> > -		return -ENODEV;
> > -	}
> > +	struct property *prop __free(kfree) = kzalloc(sizeof(*prop), GFP_KERNEL);
> > +	char *prop_name __free(kfree) = kstrdup(name, GFP_KERNEL);
> > +	void *value __free(kfree) = kzalloc(len, GFP_KERNEL);
> > +	if (!prop || !prop_name || !value)
> > +		return NULL;
> >  
> > -	ret = of_platform_populate(np, NULL, NULL, dev);
> > -	if (ret) {
> > -		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
> > -		goto node_put;
> > +	prop->name = no_free_ptr(prop_name);
> > +	prop->value = no_free_ptr(value);
> > +	prop->length = len;
> 
> We're trying to make struct property opaque or even internal to DT core. 
> Exposing it leaks pointers and then we can't ever free things. This is 
> not helping. The changeset API avoids mucking with struct property.
> 

I will review the changeset API!

> > +
> > +	memcpy(prop->value, a, a_len);
> > +	memcpy(prop->value + a_len, b, b_len);
> > +
> > +	return_ptr(prop);
> > +}
> > +
> > +/* Replace reg property with base address from dwc3 node and fixed length */
> > +static int dwc3_qcom_legacy_update_reg(struct device_node *qcom,
> > +				       struct device_node *dwc3)
> > +{
> > +	int addr_cells;
> > +	int size_cells;
> > +	u64 dwc3_addr;
> > +	int ret;
> > +
> > +	ret = of_property_read_reg(dwc3, 0, &dwc3_addr, NULL);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	addr_cells = of_n_addr_cells(qcom);
> > +	size_cells = of_n_addr_cells(qcom);
> > +
> > +	__be32 *reg __free(kfree) = kcalloc(addr_cells + size_cells, sizeof(__be32), GFP_KERNEL);
> > +	if (!reg)
> > +		return -ENOMEM;
> > +
> > +	reg[addr_cells - 1] = cpu_to_be32(dwc3_addr);
> 
> Assuming dwc3_addr fits in 32-bit or that the upper 32-bits matches?
> 

The core resides in the lower 32 bits on all existing targets, and I
expect any new targets that possibly changes that assumption would not
take the path through this translation (or would need to correct my
assumption).

> > +	reg[addr_cells + size_cells - 1] = cpu_to_be32(SDM845_QSCRATCH_BASE_OFFSET + SDM845_QSCRATCH_SIZE);
> > +
[..]
> > @@ -773,10 +937,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
> >  		goto reset_assert;
> >  	}
> >  
> > -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	ret = of_address_to_resource(np, 0, &res);
> 
> So we just leave the platform device resources stale? The right solution 
> is probably to make platform_get_resource() work on demand.

I did consider updating the resource, only in the case that we rewrite
the information, as it would be slightly cleaner not to leave that
dangling. But this was cleaner code wise.

> That's what 
> we did for IRQ resources years ago (since those had irqchip driver 
> dependencies).
> 

Right, for platform_get_irq(), but I presume for platform_get_resource()
we would end up with the union of the different resource-specific lookup
mechanisms?

Regards,
Bjorn

> Rob
> 

