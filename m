Return-Path: <linux-arm-msm+bounces-26877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20023939E8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 12:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C92AD2825C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 10:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA1B14D701;
	Tue, 23 Jul 2024 10:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SFyx/5xB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E1213B5B9;
	Tue, 23 Jul 2024 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721729136; cv=none; b=pepm5TF84w8FMjICrM9mAFzBz0+t3h51eGyatTzBsuXKa8qRBtpHZ+8a94qumRvVYh/13mGVQVfwwu35YogYe2KvLFTtEdhuD/7xs8qLQUqiz/RCWwHG8D6jcdoYf4WPEFqzbeEd406w+8DyTgREscLPnlTGeeA1steOo0joLkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721729136; c=relaxed/simple;
	bh=ynqgtYab2q6TuXt70ZssfYpgFW6Zkqc80xP1uO6H1Vo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZlboqHpsw2dE/YmeargPlgTwrKzlyH4qSiT2Tu2i/otrSRMWd4+8u+kIuzT6grdDr9lVp7mZ8dL1+/9UelPjuY8mH40YeK6QIdofCDETmxt5UmmtqE33Oa+GRwBk+VKSy7iOddgwgl3hRU+D8f5bgQ/Z/1k2Pil/OmJxSoyy8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SFyx/5xB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46NA4vEi016652;
	Tue, 23 Jul 2024 10:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=izDxB8a/43UJ3tm1l6jxwFFV
	nVicb396qZJq3vyx73o=; b=SFyx/5xByLA1pFAToZHxgqzUw2HJFR1hzneGai2o
	I2x5Eb4AiDkHSu9Lo9Js49SCpANCAHun6eZE9RABSfWYQx4E37qZILpssm+LKOZU
	Ruh8nT3fsvE1B4+OCcQCmt5kPnZw0ZkspJFRPtRhnTvOA5Ig7AvTTYM1dPXSh6Sj
	52GKJEng3OOErbYBCJX3krwKt4JIFzz3pEB9GHpGfJ7lzP/H/kZD1+S/BitwCP6P
	JgrlnRHMhYSWP6TKs87T5ojstrbxTTHCu1WVS2RskcyTKlmqDf4wexlbbHgjEPKz
	SmpZ/NjopyRDnIN0LSaxee2A6W10OMd4Rsa+fmViRbqhvA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g5m6xf2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 10:05:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46NA5DpK026231
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 10:05:13 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 23 Jul 2024 03:05:09 -0700
Date: Tue, 23 Jul 2024 15:35:05 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <quic_wcheng@quicinc.com>,
        <quic_kriskura@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: qcom,dwc3: Update ipq5332
 interrupt info
Message-ID: <Zp+AUTAOqc6N7wUr@hu-varada-blr.qualcomm.com>
References: <20240717094848.3536239-1-quic_varada@quicinc.com>
 <fe83d463-b52a-44bc-b122-ed4fa4c20bf7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fe83d463-b52a-44bc-b122-ed4fa4c20bf7@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iQA_C9avujBm0XpzrnjPj-34Rdlg3bNG
X-Proofpoint-ORIG-GUID: iQA_C9avujBm0XpzrnjPj-34Rdlg3bNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxlogscore=930 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230075

On Thu, Jul 18, 2024 at 08:23:28AM +0200, Krzysztof Kozlowski wrote:
> On 17/07/2024 11:48, Varadarajan Narayanan wrote:
> > IPQ5332 has only three interrupts. Update the constraints
> > to fix the following dt_binding_check errors.
> >
> > 	interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
> >
> > Fixes: 53c6d854be4e ("dt-bindings: usb: dwc3: Clean up hs_phy_irq in binding")
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> > v2: Fix patch version numbering. Incorrectly marked the first version as v0
> >     Add interrupts and interrupt-names for ipq5332 instead of clubbing it with
> >     qcom,x1e80100-dwc3
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > index 6c5f962bbcf9..5e5cc2175526 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > @@ -235,6 +235,13 @@ allOf:
> >              - const: core
> >              - const: sleep
> >              - const: mock_utmi
> > +        interrupts:
> > +          maxItems: 3
> > +        interrupt-names:
> > +          items:
> > +            - const: pwr_event
> > +            - const: dp_hs_phy_irq
> > +            - const: dm_hs_phy_irq
>
> Why are you duplicating interrupts for this variant? This is
> qcom,ipq6018-dwc3, not 5332. Read carefully how the file is currently
> organized - there is no entry which has clocks and interrupts at one
> place. You are bringing inconsistency, why?

Sorry, something got mixed up while rebasing.
Have posted v3, please take a look.

Thanks
Varada

> >    - if:
> >        properties:
> > @@ -442,7 +449,6 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > -              - qcom,ipq5332-dwc3
> >                - qcom,x1e80100-dwc3
>
> So now 5332 does not have any constraints.
>
> >      then:
> >        properties:

