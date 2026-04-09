Return-Path: <linux-arm-msm+bounces-102391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHibHLQM12npKggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 04:19:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 738853C57C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 04:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E72F300FEFE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 02:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2532E367F33;
	Thu,  9 Apr 2026 02:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJ15wqP+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccPC9fnK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A773E366810
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 02:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775701165; cv=none; b=KOpTaI1ZxeyKBO708zQ6WYyb3Wn2vB74LJFLJylymBjch6xGMGC9V+AjwJywN2vMBygW5ef1T4xdwdPUlPJHTAh7OR3GlTZgjfBVktv2nP43ebjfhe5Fq1gLI7/bui2S3b1rPsJ8RIqPVQj6Wgz2czepCN48JS1pWfglB48/I+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775701165; c=relaxed/simple;
	bh=8VX9iq7PyS8lecH/XeGiZcOzA8ErpbLJWQfB2notWCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGl4PjQQr02QFm3eoH3xQ6YMaa6K8sCYsZgMna/PSpOoSqS/ekSYtZnl6pX5l+VqZNE6tJeIDxGN5F6IGKLuktE4jO6Bo3MHNSA6Gxj/iViZkGq1Ie7vEK+9v8GlM/afUJWnIrNDxkLLEA8RFEx8ThZ1nkaGxOliyT2y/EsLkFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJ15wqP+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccPC9fnK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638NbhsK1071849
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 02:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d9sCCw8oekUugQnNyjHlCrSr
	WbxrJ3dBnUZAbEDDODM=; b=AJ15wqP+KK2zKr2ezTG8zJXVHMohhb49FogLJOj4
	JK2ibProZ8qyK0m1NTZBPPbLo6JSIe2QXSxiujo71vBnA69go/vFYaTvwHn2CyoH
	448nWoo6r7/NvOUxcBxNAiHEsm0dPnnG/6/R6BStSD8STZ4gStSwH1FJgwPfn2cQ
	Z8wviuLd4GG9fq6qpPZpF/pGjg7olaz7gaEBxfPT45kzViQu/51I/idcH5Dv4UJe
	XLUAeMdU/jN6fh/YJLjvQDhQUDLXnN2T7GLkaHl0SiSCm41xFix873t4Y24+b+xA
	VL9DaysGjt2hWSu6Rh9xDHbzQR+u8nq5OE5eHQiAzbTXFw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtb39xgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:19:22 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-127133794b6so10726237c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 19:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775701162; x=1776305962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d9sCCw8oekUugQnNyjHlCrSrWbxrJ3dBnUZAbEDDODM=;
        b=ccPC9fnKicz/hwZiOJnZTNm06pHJKzOuKZDIJj2n/sZhE3cKJY8fNc5/hqILklELL3
         sH7rH9iLYyj1EwAa3uj7SWTdvxSgWZrlm/NyeXccA+fn1D6E4P9tuuWuj+sO4pd2aOYP
         sOdDzAfA4/UWXKWw2fOdVjjf4aUHC44thAOIriQD5dj9paAmdJBOfLkraJNpLVE+0909
         9BzDglUThPyXRwqmsYRBjfDWo/dUyuE4EC2Dmbot4WNrEVHtGt5xac1+331aGuGjgcdn
         MKfT5ystJh6s2nKvNSfsWiA9y8qf/txX3xLt4SAJrw2YIuuKBBintAjdxOPxYJtlNxAu
         voow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775701162; x=1776305962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9sCCw8oekUugQnNyjHlCrSrWbxrJ3dBnUZAbEDDODM=;
        b=SmZ58L78h+RkrNPbra+Ch8L3ZqADXzc6b8NLDCj2kniGSwRw2cq9uF3ZZv1BKpyZy8
         0q2Y1QRcIzpzI7jcJG94dtyhcym0igJfrf6fizpmVfoz6ODqe0hRpQwyLsmWg+PmREkT
         vERhlXLlqL7DTj/hPv8wjD99i5ApeF3zaNXoUMGlnp2e6uXtbHIgKYRRXOr582UV0L6T
         V7jiXzkMHPOGZek0U0Jd9bf/rLJtURxgWbb59YLjy0j3SYMc/6SiG/jOwDKA4om2hs5T
         HSOMgap5tYEK8TKctGlk0kzTK6YNuQ6+/nOjKwqUW2TqoGpTBv/hRahH7tRzDeKo/U2r
         HLkA==
X-Forwarded-Encrypted: i=1; AJvYcCX4SIoanY7vnuE2mCJ1G7+78b2XZ/1VFBffYIOFiEQmF3BYuycd7UUMBtU1h5ITTd5sg1xV79R2/KYsIs+G@vger.kernel.org
X-Gm-Message-State: AOJu0YzCzy30k/IpolVScpfkItT7kSauWgAd+YF80hKDgScfqF8AsY05
	H9TbFKiDezmDSrXoOyRKrUKtdgLbeM8d65fWaXpHh2/sc57UWSw56dSnOasIf4daHpW2m/6rim/
	oiXNXYPede2wfdJ9XDUnIvXDkpnKKCsPxbZj3hVruO1tDSwMa3BF5pt+3/IeeviBO4T6c
X-Gm-Gg: AeBDieuJyHHfyykDGx9vWBp/7yMv5vFfchkxm0QVKKvN4mFqaNQf5B6sWaZKT7n/2yG
	iS4MijnYeZcuTKWbAssGWuNljX2bDatGf3tinSO1Fna2JgHGfNzowFKFOsQG7J7jEiu5cWsKKEQ
	1y3pyIAJwu3FOH9yJ0DoIvEufoWqDucfYOClF23RoMG9LpxNGQrqFJV9a2jpYI4inxM5hUIE4TA
	Xy/yKOg0hQu1NDT1gXz2J8mFDkAKa/KzO3hH24+2wIWag5cgXb750GHyx+5O0/1Pw1CK2uoBvET
	iNg2PlGjD3+Z30WSUkROwdRq6L8i2gieUW8LkD++du0b6YGhqlSgPa7U9CsfSMqiNVQQrTdE5UG
	OyHJEiZRs7hRZzqlH3korkAg1qk+MSrVjXeFn/vIGaqMrlK+Z3aCIAhaYcwihr0YNfb5/
X-Received: by 2002:a05:7022:68aa:b0:124:9fd8:4ba9 with SMTP id a92af1059eb24-12bfb70bb28mr12174552c88.12.1775701161503;
        Wed, 08 Apr 2026 19:19:21 -0700 (PDT)
X-Received: by 2002:a05:7022:68aa:b0:124:9fd8:4ba9 with SMTP id a92af1059eb24-12bfb70bb28mr12174515c88.12.1775701160899;
        Wed, 08 Apr 2026 19:19:20 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c07a8703esm18238907c88.8.2026.04.08.19.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 19:19:20 -0700 (PDT)
Date: Wed, 8 Apr 2026 19:19:18 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 support for glymur Gen5 x8 bifurcation mode
Message-ID: <adcMpisuyQPjAQCH@hu-qianyu-lv.qualcomm.com>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-1-ce0fc07f0e52@oss.qualcomm.com>
 <20260407161311.GA2666255-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407161311.GA2666255-robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxOSBTYWx0ZWRfX/9eU4F+h8LQJ
 nQwkL813GiJapQD8TTQ8fveyRO8Uerae7djDeC9Rwctzi6oOn50D8aSr/DywLnr8TzwMKGgfiSh
 RK1hgA1wtFdq3PTd9bgLxNz+Xkt8mvpqRuE0vHw8/D0R/BXD1FEmMR/3th/GoGOo79s1XlCtRo+
 E+2vXcrnCnmLbR5yvSBDW+krNyvy/eZqTK8o4c8xavCaJqutEZunVh1IF1MpCMXNIx9wGv9xNR3
 tW8gLhxQMlxqJMJHHNeQxOBh5YL4B02pLaQsUwZi77HkmunDguXqRoel3Un2wPKsH9ZW4U5onvl
 clj5CI5y2rplMQ7NW4jRJAuYXZ9dZPVoXLrZnCYO+o2kuJycoertZzs+XOl8bt3kMueHY1Z6OhM
 j5QPy1W0vWv3mhJzNZGk/ED+oRiPHteqn0+mqY4iyjfEj9tvU/dKQJM81y1ugcOzCSsyTiAkx93
 gax1eXs1iarEg1okuRA==
X-Authority-Analysis: v=2.4 cv=eKIjSnp1 c=1 sm=1 tr=0 ts=69d70caa cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ltEoF5Qc1AA1ACRQjt8A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: c9PONDHak_e7RvWcX-TXqpSHkYxWYb8g
X-Proofpoint-ORIG-GUID: c9PONDHak_e7RvWcX-TXqpSHkYxWYb8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090019
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102391-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,hu-qianyu-lv.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 738853C57C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 11:13:11AM -0500, Rob Herring wrote:
> On Mon, Mar 23, 2026 at 12:15:28AM -0700, Qiang Yu wrote:
> > The Glymur SoC has pcie3a and pcie3b PHYs that can operate in two modes:
> > 
> > 1. Independent 4-lane mode: Each PHY operates as a separate PCIe Gen5
> >    4-lane interface, compatible with qcom,glymur-qmp-gen5x4-pcie-phy
> > 2. Bifurcation mode (8-lane): pcie3a phy acts as leader and pcie3b phy as
> >    follower to form a single 8-lane PCIe Gen5 interface
> > 
> > In bifurcation mode, the hardware design requires controlling additional
> > resources beyond the standard pcie3a PHY configuration:
> > 
> > - pcie3b's aux_clk (phy_b_aux)
> > - pcie3b's phy_gdsc power domain
> > - pcie3b's bcr/nocsr reset
> > 
> > Add qcom,glymur-qmp-gen5x8-pcie-phy compatible string to document this
> > 8-lane bifurcation configuration.
> > 
> > The phy_b_aux clock is used as the 6th clock instead of pipediv2,
> > requiring the clock-names enum to be extended to support both
> > [phy_b_aux, pipediv2] options at index 5. This follows the existing
> > pattern used for [rchng, refgen] clocks at index 3.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 45 ++++++++++++++++++----
> >  1 file changed, 37 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > index 3a35120a77ec0ceb814a1cdcacff32fef32b4f7b..25717bc9be98824e38f3c27c3299fbd1f2e7e299 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > @@ -18,6 +18,7 @@ properties:
> >      enum:
> >        - qcom,glymur-qmp-gen4x2-pcie-phy
> >        - qcom,glymur-qmp-gen5x4-pcie-phy
> > +      - qcom,glymur-qmp-gen5x8-pcie-phy
> >        - qcom,kaanapali-qmp-gen3x2-pcie-phy
> >        - qcom,qcs615-qmp-gen3x1-pcie-phy
> >        - qcom,qcs8300-qmp-gen4x2-pcie-phy
> > @@ -68,20 +69,23 @@ properties:
> >        - const: ref
> >        - enum: [rchng, refgen]
> >        - const: pipe
> > -      - const: pipediv2
> > +      - enum: [phy_b_aux, pipediv2]
> >  
> >    power-domains:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> 
> Once there is more than 1, you have to define the order and what each 
> one is for.
>

Okay, will add - description for each power-domains.

> >  
> >    resets:
> >      minItems: 1
> > -    maxItems: 2
> > +    maxItems: 4
> >  
> >    reset-names:
> >      minItems: 1
> >      items:
> >        - const: phy
> >        - const: phy_nocsr
> > +      - const: phy_b
> > +      - const: phy_b_nocsr
> >  
> >    vdda-phy-supply: true
> >  
> > @@ -183,6 +187,7 @@ allOf:
> >              enum:
> >                - qcom,glymur-qmp-gen4x2-pcie-phy
> >                - qcom,glymur-qmp-gen5x4-pcie-phy
> > +              - qcom,glymur-qmp-gen5x8-pcie-phy
> >                - qcom,qcs8300-qmp-gen4x2-pcie-phy
> >                - qcom,sa8775p-qmp-gen4x2-pcie-phy
> >                - qcom,sa8775p-qmp-gen4x4-pcie-phy
> > @@ -201,6 +206,17 @@ allOf:
> >          clock-names:
> >            minItems: 6
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,glymur-qmp-gen5x8-pcie-phy
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          minItems: 2
> 
> else:
>   maxItems: 1
>

Will add this.

- Qiang Yu
> > +
> >    - if:
> >        properties:
> >          compatible:
> > @@ -223,11 +239,24 @@ allOf:
> >          reset-names:
> >            minItems: 2
> >      else:
> > -      properties:
> > -        resets:
> > -          maxItems: 1
> > -        reset-names:
> > -          maxItems: 1
> > +      if:
> > +        properties:
> > +          compatible:
> > +            contains:
> > +              enum:
> > +                - qcom,glymur-qmp-gen5x8-pcie-phy
> > +      then:
> > +        properties:
> > +          resets:
> > +            minItems: 4
> > +          reset-names:
> > +            minItems: 4
> > +      else:
> > +        properties:
> > +          resets:
> > +            maxItems: 1
> > +          reset-names:
> > +            maxItems: 1
> >  
> >    - if:
> >        properties:
> > 
> > -- 
> > 2.34.1
> > 

