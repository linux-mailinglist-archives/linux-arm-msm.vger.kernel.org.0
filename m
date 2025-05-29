Return-Path: <linux-arm-msm+bounces-59791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 161D3AC7A69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 10:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D79C14A65F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 08:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEC521B8E7;
	Thu, 29 May 2025 08:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N9eaB6mE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE04347B4;
	Thu, 29 May 2025 08:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748508739; cv=none; b=Rtaglv/Km+Pkh2XcPndDZNvEWQoXAfB1DJZ8EjaynGzRvyLJYa3pMQTGFiSabGVZNaGrB+Dc9bdFFA3GO99KyOCIk18U3+HB8zt/VirOn94nItJD4FkGndGiIpwaZYLXziHxmsedJsE/qax+3N1o9RHRBs6hKEV0YY5pPp/UZPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748508739; c=relaxed/simple;
	bh=i9D83x9qEDm+ynFghn98jR94nLejo4ozB0WivyuAUXY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p72KVxoXctUk1KXQ1F7G2PGyysBwHz28AiraWlT8b/qclct/6Slb5rMjKLL/OIaM1rrWpqgYo8FvcHftI4G7POytgoQMMSP1paREoFN/iMX7FYL5xvHkGBTLVoVtuWhM9sYPw+4a0pefsJIqb7++6Y+I/vKBwVzsZqm1i1xYx9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N9eaB6mE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T5f7R1022432;
	Thu, 29 May 2025 08:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ofeUWmQoaOVzOgQ0nTCDfhG4
	J/gseU9AWu6Gig3Ylyk=; b=N9eaB6mEYUAyh3m9B0VzTptihpuTqPYEhBAG3FRd
	C7hXGsyUDYADIwFRU4QbZAfxgJN1yjVudT4TCRG7NZ90ARf3m59kcO4k0oZQZAIv
	17rWOzcXjhE4OYTZUhKNYC+QgHoYrvmyp5NQWWJm5TdVpDRq8+09okyB+c5XNFWg
	9CJ6k2HR2MFEbHPEightktq0d2EedFYNyL4Md64qU/ns8uXluv2BxOHX55TTq9AN
	/jY33izB/eLjZlgJUns2LDqa3vS4zJzU5sDbm524mF6NEwRNjfChu16bXETrM1cZ
	KJbHdDg2RANAmSbYGVAsGnAtDwgEkgbEepYRzx/Xb+e7zg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x6xca26n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 08:52:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54T8qEgA011081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 08:52:14 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 May 2025 01:52:07 -0700
Date: Thu, 29 May 2025 14:21:57 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Rob Herring <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/4] dt-bindings: arm: qcom: Add bindings for QCS9075
 SOC based board
Message-ID: <aDggHy/2ZwQGmXCw@hu-wasimn-hyd.qualcomm.com>
References: <20250528122753.3623570-1-quic_wasimn@quicinc.com>
 <20250528122753.3623570-2-quic_wasimn@quicinc.com>
 <20250528222056.GA907125-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250528222056.GA907125-robh@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA4NSBTYWx0ZWRfX70iTSXN3iYb3
 Ltx9n580JMi2Q30zdqvmKt8XnlKfwLDQMDx131LPT602t+2i9TsJdggl468WHKaSazITTybD8HI
 C6yZ9Z2TAw6qlRXauz1kE+E+vFDf/2rbAr+4QqwRoqVWx7LlQQ28vWKMsS3PrLLlFI9WGuCPgH9
 i1XGtIiQCt6aZuJNqfnJno9G7ArhlYlHGTrEbbaL9OeJS/6rww2lnmzP9EZPXd9KXCYPDJOHKFS
 p3ICtkPb8OQ5GcPcTqtm7Z47Lx0xixAqBsNH6Dn4zJ/qSMeO7ZYFlJ90QnROrRXMq5qojnWoFo/
 U39VjIYceySXbmse4VVP2N55ce3v4pUp2yqVsC1798i/g9nBO8d97kYYzXsDg9hKq+SG765kY10
 ryQjIxzXiOGhXYuBhaCeVvYddUvYFjyNtxpl9yR4DayWuQYINIMOoc27IuvG2BHYBkDlI50N
X-Proofpoint-GUID: FgGjcSC60Ytfg8mfcp4CLNCWUCDdyVls
X-Proofpoint-ORIG-GUID: FgGjcSC60Ytfg8mfcp4CLNCWUCDdyVls
X-Authority-Analysis: v=2.4 cv=bupMBFai c=1 sm=1 tr=0 ts=6838203f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=mH5dv50Od_yO2UK9uncA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505290085

On Wed, May 28, 2025 at 05:20:56PM -0500, Rob Herring wrote:
> On Wed, May 28, 2025 at 05:57:48PM +0530, Wasim Nazir wrote:
> > QCS9075 is compatible Industrial-IOT grade variant of SA8775p SOC.
> > Unlike QCS9100, it doesn't have safety monitoring feature of
> > Safety-Island(SAIL) subsystem, which affects thermal management.
> > 
> > qcs9075-iq-9075-evk board is based on QCS9075 SOC.
> > 
> > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> 
> This is missing Krzysztof's ack.

Due to change in code I have removed the previous ack, as current patch
is changing DT heirarchy to what Krzysztof has acked[1].
I will re-add the tags in next series along with your's, because now
the DT structure is same as what you have acked to[2], although there is
change in board-name i.e rb8 to iq-9075-evk.

[1] https://lore.kernel.org/all/20250430-enlightened-enchanted-jellyfish-7049d0@kuoka/
[2] https://lore.kernel.org/all/173142574295.951085.7523517676553074543.robh@kernel.org/

> 
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > index 56f78f0f3803..3b2c60af12cd 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -58,6 +58,7 @@ description: |
> >          qcs8550
> >          qcm2290
> >          qcm6490
> > +        qcs9075
> >          qcs9100
> >          qdu1000
> >          qrb2210
> > @@ -961,6 +962,12 @@ properties:
> >                - qcom,sa8775p-ride-r3
> >            - const: qcom,sa8775p
> > 
> > +      - items:
> > +          - enum:
> > +              - qcom,qcs9075-iq-9075-evk
> > +          - const: qcom,qcs9075
> > +          - const: qcom,sa8775p
> > +
> >        - items:
> >            - enum:
> >                - qcom,qcs9100-ride
> > --
> > 2.49.0
> > 

Regards,
Wasim

