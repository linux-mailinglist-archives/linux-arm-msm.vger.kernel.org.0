Return-Path: <linux-arm-msm+bounces-100242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG7uATJVxmkkIwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:00:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DAA34219A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0DB230C873A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B755D3DCD81;
	Fri, 27 Mar 2026 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1mEQItO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9EA3DD518;
	Fri, 27 Mar 2026 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605235; cv=none; b=dJmggMB8Emw2l7gcTEzup+Xo1GayHsbfVqDRZNyey5Z/Sku6xti9xdKvv2KONySGb1P9YDEi+Tke3QqQuJBjkk4SkbW12csVxRPjtw/+Q9DEPzTVHLyVMm3nSiXr3d/RK4rhcssOKpPiebIanTuaLDlyiBwcPbYtsgmssBSpU5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605235; c=relaxed/simple;
	bh=Hsk9sFnJOovE1H7zKssxTC61jbL82cC9bQ/WEXMlvDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3LVZlr935RETq0iPE7c7QDuw0NpcoGBdnmlTrbnkcnLtlcuRRqHpSx7Jbtp8Clgz6+/Wz5dFcpPgz67+rI1fT5l9fr9bPHHtLswFza5f+fqHcRGzu6QsyBReswllZcaaA11ZQiPsk7btmiu1jY/OLJuhw8L8cMVRQi5mJihCgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1mEQItO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6voLr3715949;
	Fri, 27 Mar 2026 09:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DBUSYJThnIK0cPK8me5YqQew
	FnUIrtaCvOk5r3GYCKI=; b=k1mEQItObTntthPUATQhdOc/a4sIIMHRJfqN7Dn/
	N1tl6Dx6ADFhiyJig53dkpjxMVJd/yRQZb5zkrHriwQOWjra4uHfO2tcJDSDSX3n
	wuq01uF2myxqdDfHrEyDfRgsPwbV4c13ut0LbZK7rWebMym3x2ILGpWJzv2Qj2ai
	YgucDXrUFf/XZnZpbQ3jHz1UUk2WjM9R9gUlngUIucOmKA9e2dMLRIuCiNc7obE0
	0pIt6N8a1Z3ry3eAzp/2Ls1jhphxI8KGpyxlBSoUt1D9/2waoiQRm3LZIBmRbUKe
	LvO0hCMYBYv57G0TbJIGT9x9EVwC3AMsNO5wA+UQzvtdlA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6j7mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 09:53:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62R9rgW1012930;
	Fri, 27 Mar 2026 09:53:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4d1mdn176y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 09:53:42 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62R9rgs9012925;
	Fri, 27 Mar 2026 09:53:42 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 62R9rgp8012923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 09:53:42 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 7C927B07; Fri, 27 Mar 2026 15:23:41 +0530 (+0530)
Date: Fri, 27 Mar 2026 15:23:41 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
Message-ID: <20260327095341.5radsv6dsbwptnfs@hu-kotarake-hyd.qualcomm.com>
References: <20260323-b4-add_pwrkey_and_resin-v4-0-abef4e4dcc3d@oss.qualcomm.com>
 <20260323-b4-add_pwrkey_and_resin-v4-1-abef4e4dcc3d@oss.qualcomm.com>
 <20260323181820.GA888901-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323181820.GA888901-robh@kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c653aa cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vLlUsj_3LZE4TcycGe4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: gNpfv-sJHP62ubizb8xpPNCZr320LrpV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MiBTYWx0ZWRfX3gF5/OrQi4R1
 qr1eJclS5wftCcqj91f7+B2G4SErG7s/EQjaF7cBxYTidZayuOHoRsm+ZlCQHnAUPeG+wihyp8H
 87IAOGfIip7DCiznEP230Udpi3Iudx9O4ffR1b0ttW3USO7LfTkOrx+z6whWu/jrd1cLXRJrci/
 6lY+INC4MPY/Glgp1zrZZp3D1AnUdSsM9ps9kalzo56f0nGbyNHl8eHxptMUUy8RbV84AjgWGw9
 IeZulPGVOgSBCFXWfQYfGgeKYS9edACc1B75mI/i77G0BvS5OEdnKhc/8JaOlz8CipFIZkvanBZ
 BnicxBorO8SVfn7OJOUg6N+w0TWSaOZztZPtOhuchylr4oxOE9qS8x8UeTSUThPMYRKQdRHqfxk
 kSUxHbwCv8nbGncr7jNs7Bzus3KLrC/p1bFu4GC/fkQCWrC2IwxuhK6FoE+txG/m6DotEX/FSee
 VP1WdJbQpsRVLRp5UqQ==
X-Proofpoint-ORIG-GUID: gNpfv-sJHP62ubizb8xpPNCZr320LrpV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100242-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-kotarake-hyd.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B9DAA34219A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 01:18:20PM -0500, Rob Herring wrote:
> On Mon, Mar 23, 2026 at 04:15:15PM +0530, Rakesh Kota wrote:
> > PMM8654AU is a different PMIC from PMM8650AU, even though both share
> > the same PMIC subtype. Add PON compatible string for PMM8654AU PMIC
> > variant.
> > 
> > The PMM8654AU PON block is compatible with the PMK8350 PON
> > implementation, but PMM8654AU also implements additional PON registers
> > beyond the baseline. Use the PMM8654AU naming to match the compatible
> > string already present in the upstream pinctrl-spmi-gpio driver, keeping
> > device tree and kernel driver naming consistent.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > ---
> > Changes in v4:
> >  - Remove the contain for PMK8350 and new if:then for PMM8654AU as
> >    suggested by Krzysztof Kozlowski
> > 
> > Changes in v3:
> >  - Update the commit message.
> > 
> > Changes in v2:
> >  - Introduces PMM8654AU compatible strings as suggested by Konrad Dybcio.
> > ---
> >  .../devicetree/bindings/power/reset/qcom,pon.yaml  | 32 +++++++++++++++++-----
> >  1 file changed, 25 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> > index 979a377cb4ffd577bfa51b9a3cd089acc202de0c..2a5d9182b8d5c1a286716ab175c7bb5e39b334e0 100644
> > --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> > +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> > @@ -17,12 +17,16 @@ description: |
> >  
> >  properties:
> >    compatible:
> > -    enum:
> > -      - qcom,pm8916-pon
> > -      - qcom,pm8941-pon
> > -      - qcom,pms405-pon
> > -      - qcom,pm8998-pon
> > -      - qcom,pmk8350-pon
> > +    oneOf:
> > +      - enum:
> > +          - qcom,pm8916-pon
> > +          - qcom,pm8941-pon
> > +          - qcom,pms405-pon
> > +          - qcom,pm8998-pon
> > +          - qcom,pmk8350-pon
> > +      - items:
> > +          - const: qcom,pmm8654au-pon
> > +          - const: qcom,pmk8350-pon
> >  
> >    reg:
> >      description: |
> > @@ -100,7 +104,6 @@ allOf:
> >    - if:
> >        properties:
> >          compatible:
> > -          contains:
> >              const: qcom,pmk8350-pon
> >      then:
> >        properties:
> > @@ -113,6 +116,21 @@ allOf:
> >              - const: hlos
> >              - const: pbs
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +            const: qcom,pmm8654au-pon
> > +    then:
> > +      properties:
> > +        reg:
> > +          minItems: 1
> > +          maxItems: 2
> > +        reg-names:
> > +          minItems: 1
> > +          items:
> > +            - const: hlos
> > +            - const: pbs
> 
> I don't understand this. The existing if/then schema did the exact same 
> thing until you removed 'contains'. Now we just have the same schema 
> duplicated.
>
> What does need changing now that I've looked at it is dropping 'reg' 
> in this schema as it just repeats what the top-level schema has.
>

we have got suggestion to add a new if:then block for the new compatible from Krzysztof Kozlowski.

Best regards,
Rakesh kota
> Rob

