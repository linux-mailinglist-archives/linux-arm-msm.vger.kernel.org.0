Return-Path: <linux-arm-msm+bounces-7523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 872E1830EFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 23:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4E8AB22560
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 22:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CC125631;
	Wed, 17 Jan 2024 22:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NUYBAhrn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4147B22F06;
	Wed, 17 Jan 2024 22:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705528972; cv=none; b=SEQc/PpGbikuLWnU7SERTNeI3S6ZrEzLWWTMR1fyu56qwKCl3YEc2rKXphVdKQ9e7uEvP4H92z6uIBG2bCfg3ue37ms63CPqmg+8h1KrZ5ylwzIn7ZuFRcHFNCH+vQKF4peg5A0E6PH+k/J3IygT/P8+cCx55Nt247c/PrzbgMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705528972; c=relaxed/simple;
	bh=kgQKla3MoUXHzzzT31HuzZcE85m0zK9sjA/QXgkGt44=;
	h=Received:DKIM-Signature:Received:Received:Received:Date:From:To:
	 CC:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Originating-IP:X-ClientProxiedBy:
	 X-QCInternal:X-Proofpoint-Virus-Version:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details; b=hDEx9i+zPA71xJ12oM8W3xIq4gdESlGp2KL3JJ6BGuBNa5dGRfF/DBVVqnro2NL9FTnk5qWPg4Nme7eXOa0/1ioeXQg+NSad7T8WppeQthn35qj6NQWBIYzCSAoEfZ8vx3PK7He7MQIwpb3LKQ7+lGReHZ0m9tdkAOmIolv30D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NUYBAhrn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40HLXETo010240;
	Wed, 17 Jan 2024 22:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=eMRgKtzrvypX5SjMuARx6
	mbUyoO003lGGNqle6ArHFQ=; b=NUYBAhrn9gJbrTU9kxsg2eCjvhIWy325Xqaq4
	WJTekCdzsJZLQCuslVeC5XVEjGiA/HrpY7hVKItQPV1WQ29bWlyScmXmK2pMNFmz
	iLwanMrlL2UeZ2PuuAZiDEZIHd14BK5u/wAjLcN0hNdqWkdqIabnsao+gZWM+KwA
	YzdAqT8IGgwXGz0IUsnUVE8vrj0ZArjONycC2yTpnFmAIAnKFTiC8Fwx5HCPSpx+
	B+xBcQkhVLGUxvuxG16WSUpUeevs+lUagswmxR+P2kSgq3EHkHh148aW1+5mEu1I
	zj5zYhzZ7H5eWJc6IoSHfmiPt1ztddjvKb93ccuD/Rlbi5E9Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vpdfgsej2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 22:01:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40HM1t9k001475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 22:01:55 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 17 Jan 2024 14:01:55 -0800
Date: Wed, 17 Jan 2024 14:01:53 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        "Kishon Vijay
 Abraham I" <kishon@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: pmi632: define USB-C related
 blocks
Message-ID: <20240117220153.GA649327@hu-bjorande-lv.qualcomm.com>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-13-182d9aa0a5b3@linaro.org>
 <1d0d325d-d15e-4e86-b8e3-9f91b99e78bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1d0d325d-d15e-4e86-b8e3-9f91b99e78bf@linaro.org>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nmevfx26C7BXCEfOc6jAfSNQG8-LbM15
X-Proofpoint-ORIG-GUID: nmevfx26C7BXCEfOc6jAfSNQG8-LbM15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_12,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 mlxlogscore=621 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401170157

On Mon, Jan 15, 2024 at 11:00:53AM +0100, Konrad Dybcio wrote:
> On 13.01.2024 21:55, Dmitry Baryshkov wrote:
> > Define VBUS regulator and the Type-C handling block as present on the
> > Quacomm PMI632 PMIC.
> > 
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/pmi632.dtsi | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
> > index 4eb79e0ce40a..d6832f0b7b80 100644
> > --- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
> > @@ -45,6 +45,36 @@ pmic@2 {
> >  		#address-cells = <1>;
> >  		#size-cells = <0>;
> >  
> > +		pmi632_vbus: usb-vbus-regulator@1100 {
> > +			compatible = "qcom,pmi632-vbus-reg", "qcom,pm8150b-vbus-reg";
> > +			reg = <0x1100>;
> > +			status = "disabled";
> > +		};
> > +
> > +		pmi632_typec: typec@1500 {
> > +			compatible = "qcom,pmi632-typec";
> > +			reg = <0x1500>;
> > +			interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
> > +				     <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
> > +				     <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
> > +				     <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
> > +				     <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
> > +				     <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
> > +				     <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
> > +				     <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>;
> This differs from the downstream irq types:
> 
> <0x2 0x15 0x0 IRQ_TYPE_EDGE_BOTH>,
> <0x2 0x15 0x1 IRQ_TYPE_EDGE_BOTH>,
> <0x2 0x15 0x2 IRQ_TYPE_EDGE_RISING>,
> <0x2 0x15 0x3 IRQ_TYPE_EDGE_RISING>,
> <0x2 0x15 0x4 IRQ_TYPE_EDGE_BOTH>,
> <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>,
> <0x2 0x15 0x6 IRQ_TYPE_EDGE_RISING>,
> <0x2 0x15 0x7 IRQ_TYPE_EDGE_RISING>;
> 

Interrupt 1, 3, and 6 are level interrupts for which it's reasonable to
act on both edges. Interrupt 0, 2, 4, 5, and 7 are "pulse interrupts",
for which it seems reasonable to act on only one of the edges.

To me, Dmitry's proposed version makes more sense than downstream.

Regards,
Bjorn

> Is it intended?
> 
> Thanks a lot for working on this!
> 
> Konrad
> 

