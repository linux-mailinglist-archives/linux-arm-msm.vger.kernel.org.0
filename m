Return-Path: <linux-arm-msm+bounces-37946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9999CD685
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 06:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1BF4282FFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 05:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF56161328;
	Fri, 15 Nov 2024 05:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i7IHY/kF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8005B653;
	Fri, 15 Nov 2024 05:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731647790; cv=none; b=otO6mfaMuh7ZHq5nSagT/0e2Nfmiikre3CMc+Q50Kkf6caXJx4YcuNrmF7AD6RqL0VMFaxRBvvZoieRRGC1K7L/L/mDgrvkUyUpcGJ1ey2IzBxLukluEQnrM4HMVEeSqz5qmUidnmM1kiyWP8v2ICIyFhyQvo1lfG7CssRX5EH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731647790; c=relaxed/simple;
	bh=wQiuhp8v+61MNVzWRd7pTqrZUBvHrTvXuRDlj0GvuSA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pl/kLwrp2w1goQPE/g6JddUAh/bu7M2OV7CtIgcMKuCUSjvlcm1iBEvNaOymWyUEK7fA+R7JSBl98HkyZ4UHatNu7iCgaEaHG0XoiXb8EWrIYWNdLaRKLRlN9Ywj0i+NZ2lOPqTQ5f6LlJzq6ABTKYMTEgJJUKJ6NqO8RiSnNx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i7IHY/kF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEHIN0k000320;
	Fri, 15 Nov 2024 05:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XeOXBRvKYlKEFsGjau4VWSu7
	nM6D4GRhts+u2M09/vo=; b=i7IHY/kFkhkkRemfOjO+aZbBQJ50FOWGAee5eXFZ
	jCqPPOwKFp2sEUhFA6yMqFHH7kvNyBlPQ8m499mj6M17NpfBB2nP9+dCmEIYc6c5
	lQ9bxJBymaGXYypE0gSqtjXEYuAnShfcGentchhW6lrwJLZkAQyBtt2qGZ+o/TEP
	Km0d6pk48JvtWTMEXYsTtbOsma2F9OP9AoRrxt9YqVELwJF8s3rzHw6PRjUmto0s
	gSm0j4WDlpMievbuvbjAUgZSVFhnVMIQGdEZ+Tz1c+LOZx/S7FvMc4bB7ItIZX8/
	vI7aKRpOIrBtSTuqjZTrmhEcptltjKqGccbbsz8ONeRpyQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wjqaj5r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 05:16:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AF5GJsh026368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 05:16:19 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 14 Nov 2024 21:16:13 -0800
Date: Fri, 15 Nov 2024 10:46:10 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <mantas@8devices.com>,
        <quic_kbajaj@quicinc.com>, <quic_kriskura@quicinc.com>,
        <quic_rohiagar@quicinc.com>, <abel.vesa@linaro.org>,
        <quic_wcheng@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: Add USB controller and phy
 nodes for IPQ5424
Message-ID: <ZzbZGnKEovwoDPrP@hu-varada-blr.qualcomm.com>
References: <20241114074722.4085319-1-quic_varada@quicinc.com>
 <20241114074722.4085319-7-quic_varada@quicinc.com>
 <CAA8EJpr6xb=TPPgk7ERhKVp7OnYdPGCK6+1_2TBRLBt_eWM43A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJpr6xb=TPPgk7ERhKVp7OnYdPGCK6+1_2TBRLBt_eWM43A@mail.gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d_wIorl82C0yLf1h6fCzcXveyRezvnJK
X-Proofpoint-ORIG-GUID: d_wIorl82C0yLf1h6fCzcXveyRezvnJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 mlxlogscore=679 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150042

On Thu, Nov 14, 2024 at 03:28:36PM +0200, Dmitry Baryshkov wrote:
> On Thu, 14 Nov 2024 at 09:48, Varadarajan Narayanan
> <quic_varada@quicinc.com> wrote:
> >
> > The IPQ5424 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
> > can connect to either of USB2.0 or USB3.0 phy and operate in the
> > respective mode.
> >
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> > v3: Regulator node names, labels and 'regulator-name' changed per review suggestions
> >     Stray newline removed
> >
> > v2: Add dm/dp_hs_phy_irq to usb3@8a00000 node
> >     Add u1/u2-entry quirks to usb@8a00000 node
> > ---
> >  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts |  66 ++++++++
> >  arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 159 ++++++++++++++++++++
> >  2 files changed, 225 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > index d4d31026a026..859e15befb3f 100644
> > --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > @@ -16,12 +16,70 @@ / {
> >         aliases {
> >                 serial0 = &uart1;
> >         };
> > +
> > +       vreg_misc_3p3: regulator-3300000 {
>
> Technically these names are correct. However they don't match the
> approach that Qualcomm DT files have been using up to now.
> You can compare your data with the output of `git grep :.regulator-
> arch/arm64/boot/dts/qcom/`

Dmitry,

This name was suggested by Rob Herring [1]. Shall I rename them as follows

	regulator-usb-3p3
	regulator-usb-1p8
	regulator-usb-0p925

Thanks
Varada

1 - https://lore.kernel.org/linux-arm-msm/20241113181138.GA1011553-robh@kernel.org/

> > +               compatible = "regulator-fixed";
> > +               regulator-min-microvolt = <3300000>;
> > +               regulator-max-microvolt = <3300000>;
> > +               regulator-boot-on;
> > +               regulator-always-on;
> > +               regulator-name = "usb_hs_vdda_3p3";
> > +       };
> > +
> > +       vreg_misc_1p8: regulator-1800000 {
> > +               compatible = "regulator-fixed";
> > +               regulator-min-microvolt = <1800000>;
> > +               regulator-max-microvolt = <1800000>;
> > +               regulator-boot-on;
> > +               regulator-always-on;
> > +               regulator-name = "vdda_1p8_usb";
> > +       };
> > +
> > +       vreg_misc_0p925: regulator-0925000 {
> > +               compatible = "regulator-fixed";
> > +               regulator-min-microvolt = <925000>;
> > +               regulator-max-microvolt = <925000>;
> > +               regulator-boot-on;
> > +               regulator-always-on;
> > +               regulator-name = "vdd_core_usb";
> > +       };
> > +};

[. . .]

