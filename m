Return-Path: <linux-arm-msm+bounces-25927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE5192E2AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25BC5283FE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 08:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE05152178;
	Thu, 11 Jul 2024 08:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i3LtjVgC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD6012BF02;
	Thu, 11 Jul 2024 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720687646; cv=none; b=rnnI8+5TJ2zu69aIm+B9KjGejC0dkgauFNKsw7gwAeBqoGEDVJHuhoI63Pawj6Aq9wVjNJ5SEDg0TytwcNc7ib9Na8PViQM94wgkl8QLJ+RWuzGUGV6XS6W4Wb1w879XZ50HBqcBU6JITDjt/wV4ZK6YwcywROvnkDqWswrOZ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720687646; c=relaxed/simple;
	bh=d8GpfJ2Q1PfZDN0jCBnDHCEhlArsUTNAUFulOADfJEo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nb5GuF7lR71VSKnYAme74PNRjYisziLa2nTXkrkeig8cQjRkktxUVMRRUoYTcJ/lPzs12y05OQeXyLLyshMhgaqqWDpweKefmVdWFNa2VAbHfL0YnPmq+pSp5sOPSOPv4KKNKvPAjt8KGNGm3JLHkwOKqkK1WHERIN1TK5RVy7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i3LtjVgC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4mi5V007118;
	Thu, 11 Jul 2024 08:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pDWMgpKauJzTFZP1oKOt5i47
	Al4+cP5bsW3pHJR+wK8=; b=i3LtjVgCf9OyOGwwKU8jNbIXSB2S0O3P524TOQBf
	Vvd6K4UxZn3PEt6YHoqzVOmSbfNUgTWqmHPgh1EDZiuwubw+ug3Hh2yN9D+8sMYn
	9EU8apPhfyg1KY8NC+iD6UN76FFPKx6ckejqDP9Ji6Q6j0ADe1XKATxdPkYfFtPG
	j1ANFoF58WjBPgcjCk/N2wKFLUp2WLqc+rix8HWyFxnkKfIKlsQx2hFaQp6XJS0U
	pDQ2cWztWSNnfyVprk+3uUi+xSIViHGdzhhLsk93XVx5LVxAXghujQSRETe6fhK0
	qoUE7fBXCJ2Mv0mjMSARDJwxYWyOfPxmNuOk3gJnWPhmCA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4091jdp2p5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 08:47:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46B8lK1f018713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 08:47:20 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Jul 2024 01:47:15 -0700
Date: Thu, 11 Jul 2024 14:17:11 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <quic_wcheng@quicinc.com>,
        <johan+linaro@kernel.org>, <quic_kriskura@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v0 1/2] dt-bindings: usb: qcom,dwc3: Add minItems for
 interrupt info
Message-ID: <Zo+cDxiog/IXdt9S@hu-varada-blr.qualcomm.com>
References: <20240711065615.2720367-1-quic_varada@quicinc.com>
 <5fb21a62-9c9e-45ed-bf3f-c4d54f243886@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5fb21a62-9c9e-45ed-bf3f-c4d54f243886@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wl6Zn0K8xLOwam16kYEJ3VO2eRJP6dGX
X-Proofpoint-ORIG-GUID: wl6Zn0K8xLOwam16kYEJ3VO2eRJP6dGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_05,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=786
 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407110061

On Thu, Jul 11, 2024 at 09:47:23AM +0200, Krzysztof Kozlowski wrote:
> On 11/07/2024 08:56, Varadarajan Narayanan wrote:
> > IPQ5332 has only three interrupts. Update min items
> > accordingly for interrupt names to fix the following
> > dt_binding_check errors.
> >
> > 	interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
> >
> > Fixes: a5c7592366af ("dt-bindings: usb: qcom,dwc3: add SC8280XP binding")
>
> There is no ipq5332 at this commit, so I do not understand which bug are
> you fixing.

a5c7592366af introduced this interrupt and interrupt-names block. Later, 53c6d854be4e9 added ipq5332 to this section. Since a5c7592366af introduced the maxItems and I wanted to include minItems also (to accomodate ipq5332) I used a5c7592366af in the fixes tag. Will 53c6d854be4e9 be a more appropriate choice?

> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > index efde47a5b145..283bac1efba9 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > @@ -432,8 +432,11 @@ allOf:
> >      then:
> >        properties:
> >          interrupts:
> > +          minItems: 3
> >            maxItems: 4
> >          interrupt-names:
> > +          minItems: 3
> > +          maxItems: 4
>
> but x1e80100 has 4, right?

Yes. Will have a separate block for ipq5332. Went with min/max based
on one of the previous blocks that had min/max as two and three for
a group of SoCs.


Thanks
Varada

> >            items:
> >              - const: pwr_event
> >              - const: dp_hs_phy_irq
>
> Best regards,
> Krzysztof

