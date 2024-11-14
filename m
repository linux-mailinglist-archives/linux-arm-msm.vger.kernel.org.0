Return-Path: <linux-arm-msm+bounces-37883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C529C844B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 08:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B846A282D26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 07:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EB91F7077;
	Thu, 14 Nov 2024 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eFbxWeK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF0F1E9080;
	Thu, 14 Nov 2024 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731570534; cv=none; b=R/n6Rxuzi8ZZ/TjRMByBv2QxTRkYSJl4AIsZ/PU4GDl6KRB2pw5yH+IzwYSAyrfdOPHmK+Gd7k0S8GXXMYxZgaVD9NOJ4u6oPs7lvRdHYzHNbZhE4QT1Qdl/BVuvCmWOUz3C8nIgdarFLL5p1r18oRFFrLMC7WqxButWp0N5Wp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731570534; c=relaxed/simple;
	bh=4E6aC6oB1+4iQaw6tyR7GxnJWzRZncxwonrwiY4dn0Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTAHbfRRQIU5fip/fUJSGxVwu6sPh2QajNzbYeRCY9Wz3zStUyrIA08isIqwt15CjDNZ4KKTZ2rMgSyaF53PTdSGvhShqSXGXL8wz1G53GMGW1mP5+FGYj3mbzvdZsxZfILvWdEBTU3LKqIsXk5QdAnho3jszahoP0Q5fsiKL3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eFbxWeK8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE1KEpF008599;
	Thu, 14 Nov 2024 07:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7cHbwg17okigZyqvJWR0iibZ
	TFH7NMVRqRcMdUm+sHw=; b=eFbxWeK8zROsnO5X9Rhd9FeyRmTa/NGla3Imd7kY
	MR8jKmjmwbaY4jbr38ylMGtAkwojSDeJKkuXpUHF6HCE6v1ZZP3C4bQwW2PvOC1W
	av244K31iug5c/8EDhX7qWrNb0VcmIayCcniTC7wT35iakL61m1elLpUspxn2Oti
	w1DjQa0qohpRhag+gwhajAJ21dCbxbqAX1T6PHxsSZRKJJaCVztmphYiCIg6gyuO
	pYEI8Y7Y0CE5h7Dvb4G8mqotJtMQBAldomHbPeIh2Usz4iNIIkwThMxxibMQH4Pk
	XqmdWrOttAJPrZiCuWm6dgsLnEDt1nm189czePf0fQ08jg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w7ekhhu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 07:48:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE7mjHS014444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 07:48:46 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 23:48:39 -0800
Date: Thu, 14 Nov 2024 13:18:35 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Johan Hovold <johan@kernel.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <mantas@8devices.com>, <quic_rohiagar@quicinc.com>,
        <quic_kriskura@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <abel.vesa@linaro.org>, <quic_kbajaj@quicinc.com>,
        <quic_wcheng@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: Add USB controller and phy
 nodes for IPQ5424
Message-ID: <ZzWrU/6+KPOy5ugi@hu-varada-blr.qualcomm.com>
References: <20241113072316.2829050-1-quic_varada@quicinc.com>
 <20241113072316.2829050-7-quic_varada@quicinc.com>
 <ZzSYU61pmFTcPf5_@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZzSYU61pmFTcPf5_@hovoldconsulting.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0vm_7CVbi4RNzzvExcVw8E-CzDBhj-pf
X-Proofpoint-GUID: 0vm_7CVbi4RNzzvExcVw8E-CzDBhj-pf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=619 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140058

On Wed, Nov 13, 2024 at 01:15:15PM +0100, Johan Hovold wrote:
> On Wed, Nov 13, 2024 at 12:53:16PM +0530, Varadarajan Narayanan wrote:
>
> > --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > @@ -16,12 +16,71 @@ / {
> >  	aliases {
> >  		serial0 = &uart1;
> >  	};
> > +
> > +	regulator_fixed_3p3: s3300 {
>
> Fixed regulator nodes should have a "regulator-" prefix in their name.
>
> And please use a shorter label, look at the existing DTs for
> inspiration (e.g. "vreg_misc_3p3").

Ok.

> > +		compatible = "regulator-fixed";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +		regulator-name = "fixed_3p3";
> > +	};
>
> But is this really an accurate description of these regulators? Are
> they not part of some PMIC? Can they really not be turned off?

These supplies are coming from internal LDOs and are turned ON at
power up itself. Software (i.e. boot loaders or the kernel)
doesn't turn them ON. Checked with the board designers and they
too don't recommend turning these OFF as some other i/o lines
also depend on these voltages.

> Also please use the names from the schematics for these. I doubt they
> are named "fixed_3p3".

Ok.

> > +
> > +	regulator_fixed_1p8: s1800 {
> > +		compatible = "regulator-fixed";
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +		regulator-name = "fixed_1p8";
> > +	};
> > +
> > +	regulator_fixed_0p925: s0925 {
> > +		compatible = "regulator-fixed";
> > +		regulator-min-microvolt = <925000>;
> > +		regulator-max-microvolt = <925000>;
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +		regulator-name = "fixed_0p925";
> > +	};
> > +
>
> Stray newline.

Have addressed these and posted v3. Please review.

Thanks
Varada

