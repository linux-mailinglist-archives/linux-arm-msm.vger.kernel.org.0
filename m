Return-Path: <linux-arm-msm+bounces-108696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIFwJN+MDWoIzQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:28:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A18458BC0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C8E13047BFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D15A3CA4A9;
	Wed, 20 May 2026 10:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mjobRMVF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137273D7D7A;
	Wed, 20 May 2026 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272526; cv=none; b=S1eKJ3MFzwPxuuoiEhwxvoquAIYRTvCC567QYLLZpBRxH6DRApYdRL8E7oMkYMxchzyCu7Y/aLnCYNVlt5mr9nx/zc2YRDo707Hjpgts4AWtN5kdxjwLeE8iEI5/nNYkrZlB/+KzBFApT/v9qvgdGuJItRJnRmIZZDTHB/VpRqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272526; c=relaxed/simple;
	bh=sw0zCXDAtm9dTIH3UUHXuCi6iSS/VhVtc4yoLlK5/HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvkQSRJkUgAuhn+FNIZWMCywvKoVUi6pG5TBBuYZP2BV0XjsYdYTHSbJb1hqMRu6XAk0zjkE06/wp6s445sTBnezO+LTqBqk4Roei3avVNdmCoCKrjoe86/FKIKZq8/TqeqNRCuDqLGnclqApZN74EGIRX4jeCkMEKwsA4uosls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mjobRMVF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7ZSpr341432;
	Wed, 20 May 2026 10:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dK6fMAvOEgBu9zZPgmFRg++L
	vQnT9Vjed2gZEFG4UMY=; b=mjobRMVFUDM5OCIeYZEnO5G23KJZb/j6QAgBDsir
	DZnjQpZOqE5lDbxhzlcYZTFglk4sqtsh36vrKiqEP31FPApzjMHl5A56WkkCzX8S
	teggsDunA55BL/lp/urTEW9AqlQh5bjwx9KkSWGSZGeJKIAIn6BUvIj5hkNVBJPW
	HlL4pikkGgwRi/kvUB+2FJvx23kI7P0pLUmeMOkY3D70gOO184mnN36P2A9jyDtM
	VmgrZk6SfIwRwYG3SqP17KdAcfOYZbTpCxMz+EsbAx+O8RmorFfnX8ce0VlT2FFD
	ITuVoo6VhXhDMRfWw7jP+6jru8WTPSD9S3H63a64hxe/wg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3vc7w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 10:21:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64KAIWZT014901;
	Wed, 20 May 2026 10:21:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4e712fy4cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 10:21:42 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64KALghn018580;
	Wed, 20 May 2026 10:21:42 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64KALfSq018579
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 10:21:42 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 6C29EB38; Wed, 20 May 2026 15:51:41 +0530 (+0530)
Date: Wed, 20 May 2026 15:51:41 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 qcom,pm4125-vbus-reg
Message-ID: <20260520102141.22jzflg5fp726x4h@hu-kotarake-hyd.qualcomm.com>
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
 <20260520-add_pm4125-vbus-reg-v1-1-f6d15d7dbbe8@oss.qualcomm.com>
 <253db4e4-7b69-466f-b4b6-59a77609b9fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <253db4e4-7b69-466f-b4b6-59a77609b9fe@oss.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: XXMRPtgkANjVAPnfnRTjyUaiHAWoHDkz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5OSBTYWx0ZWRfX/dlW7IyYCFkq
 u5bA26SCydIBKW3c9nCk0t2ksdBZ7UlLhviT47YCDqW5YuVLHBFOp58FkHbOmWtp13qTf6TaCXq
 kID1/4aPGxNxaEzVLFk8VWJ7VdAdFhwe5/cBrqYE7WX/pMVhBHYnyva+8I2VkL408OYiSN2teQh
 AeIvxYA/T+lmClY4fo+DKUzOtKioJsU+PmptgmhgZjT8/4pZQE8jRezVsmHfbMjJqPPTYVekkHq
 KcjMuUOGJRb1bkhwUEXWMnGreHcMaw9PCuDRuSPNP5ANb0u3GdeCf3V8l2GGWqov8+4KH+n2oMu
 4E/a9qj3OluraurSlCrRlLUq2aZ1DTt/YmosWBw1CPM2+oL1gJCBnY5YQBgHW/KTf1EkrhIoUi4
 RYh6tTOZxjCs+h/jHSV3XBGDsKK6kvV42edkHnGj+mi3nQf2WvwsUQVNfX70kBNOp+U+NY18QYw
 7LGn39VDUVEIeelOZ3g==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0d8b3a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=K117WDCKKrbTuwPAyMAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: XXMRPtgkANjVAPnfnRTjyUaiHAWoHDkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-108696-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-kotarake-hyd.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,0.0.4.76:email,0.0.19.136:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9A18458BC0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 11:44:42AM +0200, Konrad Dybcio wrote:
> On 5/20/26 11:07 AM, Rakesh Kota wrote:
> > The pm4125 PMIC uses a different USB VBUS register layout than pm8150b.
> > It uses a 2-bit VBOOST voltage selector supporting output voltages of
> > 4.25 V, 4.5 V, 4.75 V and 5.0 V, instead of a current-limit selector.
> > 
> > Move qcom,pm4125-vbus-reg from the pm8150b fallback items list into the
> > standalone enum since the driver handles it with its own match-data and
> > register layout.
> > 
> > Make regulator-min/max-microamp conditional so they are only required
> > for current-limit variants (pm8150b, pm6150, pm7250b, pmi632). Add an
> > if/then condition for qcom,pm4125-vbus-reg requiring regulator-min/
> > max-microvolt instead, and update the pm4125 example accordingly.
> > 
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > ---
> >  .../regulator/qcom,usb-vbus-regulator.yaml         | 50 +++++++++++++++++++---
> >  1 file changed, 45 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> > index fcefc722ee2a495837fedba026669de97350c566..7c74573848bcdafbf6260f69cfcd7a9b58bc9f2d 100644
> > --- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> > +++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> > @@ -14,17 +14,21 @@ description: |
> >    regulator will be enabled in situations where the device is required to
> >    provide power to the connected peripheral.
> >  
> > -allOf:
> > -  - $ref: regulator.yaml#
> > +  The pm8150b variant uses an OTG current-limit selector, supporting limits
> > +  of 500 mA, 1000 mA, 1500 mA, 2000 mA, 2500 mA and 3000 mA.
> > +
> > +  The pm4125 variant uses a different register layout with a 2-bit VBOOST
> > +  voltage selector supporting output voltages of 4.25 V, 4.5 V, 4.75 V
> > +  and 5.0 V.
> >  
> >  properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> >            - qcom,pm8150b-vbus-reg
> > +          - qcom,pm4125-vbus-reg
> >        - items:
> >            - enum:
> > -              - qcom,pm4125-vbus-reg
> >                - qcom,pm6150-vbus-reg
> >                - qcom,pm7250b-vbus-reg
> >                - qcom,pmi632-vbus-reg
> 
> This change needs to be paired with an update to the existing DTS users,
> or validation will fail
> 
sure, I will include the DT changes in the same patch
series to keep things atomic and ensure dtbs_check compliance.

> [...]
> 
> > +     pmic {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        usb-vbus-regulator@5000 {
> > +            compatible = "qcom,pm4125-vbus-reg";
> > +            reg = <0x1100>;
> 
> This should fail make dt_binding_check, as the reg value doesn't match the
> unit address (after the @ sign)
>
Ok, I will fix the node name to usb-vbus-regulator@1100 in the next version.

regards
Rakesh
> Konrad

