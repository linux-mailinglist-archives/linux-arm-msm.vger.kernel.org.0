Return-Path: <linux-arm-msm+bounces-117986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UFU5KA6dT2pKlAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:07:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA99731649
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:07:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VitzfpiE;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117986-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117986-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1254F302FAA8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8D5244661;
	Thu,  9 Jul 2026 13:03:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916C134CDD;
	Thu,  9 Jul 2026 13:03:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602206; cv=none; b=K06CmkKpib345IG5XPee0N+mV7NbgIgLjLfpOC/WE2HzGnML7X3neHzlMFWGUye1qfQsNt2h7nEuLc++uhuxm1zemPDRCiLqCf4K7SfyaAZpOouvtffnfYkbeeTq4D7rIePJm6S2wWgmp7nAAXox385R/Svbk/EkdN8rNxWN380=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602206; c=relaxed/simple;
	bh=4MzdFv6f9wS5Fn/Z+JeIqk7v6WwX+7kICYeGs5hy4SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msKaO9o6QLgGJqxy+DbQILa+F3dzyUdE14wvD59X5uDrAdw01MNvxUxoB54+KW9XFCkgRHGN8+dd9qbqwIWCKp/JdCkJGFFAy6KNsjaHBBy5RepkLtZq3ycojbal31/O27NdBjgMgRpTHABVwfFXrEF1ipAUTjEPHRu3V2ktV0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VitzfpiE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN7Zp1537221;
	Thu, 9 Jul 2026 13:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	viR7SRGwLt6ze51cBdmXoYA7a2IzlLJ0il3pJaQD7I4=; b=VitzfpiEOd1SIhDA
	Fvs85I7Xk1sXXvghfW2Ju9ZHxdy2srSMiGMkK+sURNG0kI4ol+TWRZCcq+kee+19
	yJ1b3fSl/SV2SW1k8XE0F+xF3uKCygebt/UouC+dkq9buEsqCtgAxU1bdiI/ZRlY
	Vfui9vwaPSKmkSITXQ8vp5LaiE+yYJ/WtcqGsjzu3nDec1s0EkJps/K4T4pblK/F
	/6sX9PvHtPS2YCs21WonsWJNoFDW98PGE3lIK98hlgiZ/IbRX4okgwOMM+42nC22
	kRqGN3t5RtlyDBWfj99Fgyx/1y8xAcdl97sItfYnYDbZX8MT8VYP43XVqniqvwfn
	3tRXMw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtt9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 13:03:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 669D3KBQ031747;
	Thu, 9 Jul 2026 13:03:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f6u8m1yh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 13:03:20 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 669D3K6D031740;
	Thu, 9 Jul 2026 13:03:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 669D3JPN031697
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 13:03:19 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id ECB21B06; Thu,  9 Jul 2026 18:33:18 +0530 (+0530)
Date: Thu, 9 Jul 2026 18:33:18 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
Message-ID: <20260709130318.scxg7h6oyqsreoib@hu-kotarake-hyd.qualcomm.com>
References: <20260323-b4-add_pwrkey_and_resin-v4-0-abef4e4dcc3d@oss.qualcomm.com>
 <20260323-b4-add_pwrkey_and_resin-v4-1-abef4e4dcc3d@oss.qualcomm.com>
 <20260323181820.GA888901-robh@kernel.org>
 <20260327095341.5radsv6dsbwptnfs@hu-kotarake-hyd.qualcomm.com>
 <9c7521fe-5008-4daa-945b-ce3f5c0f6dc0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c7521fe-5008-4daa-945b-ce3f5c0f6dc0@kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfX+AmuPv3A5DIf
 y8wv9amtrHs3zgGJGxGDynhZ4P9GImXdR9yiN6x8XRdJ/UYO41RYPQUTccf6UYZZ27g4e31n+88
 PZJ9/7SwWTS150g25x0SxCy8lvyzSJk=
X-Proofpoint-ORIG-GUID: SG6DFEn7F-Qia5iBm3lu7bntVOedNBPR
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f9c1b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=zIA9Wm4PP-oGnrJrhzEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: SG6DFEn7F-Qia5iBm3lu7bntVOedNBPR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfX24FaDRZIzJdE
 2rJ7E8/8eFImScwlOKImulqGk57sHI3cEY31ZPJU1Tvj/nYPEnoMO6telbodWT2jDAQieeBGzSB
 Jk5nq0ziLJ24eIC1s0cAP2H9ulvdV8CeXXfGl9IQTH8lZx8LFAJj4A4J9Y5eC0D7SHvaor8IXEr
 Ismk/M4/xx1i5F8k0xuShzHlRVGQex6tITwHEkAOv6+lq7oiLyj+I1o+SKjowdy6hYIPchAFd6V
 o2J4UrL9WvaRqaCFhifWiG2NedUjaTOT7gN2PGyyX9+9E4OBIiMAI69aqqKbbUHC4h0VozOqeie
 +wZIRAUMPWWnwYT0h3rqu9KDKhiJvljGIqQ0gTEz1q9l+AFrM7yHWeik7hmOI7L1bXSU7ZuOSFq
 VFHW3jn5jjGhXHlkWuixOcCmVAn4AQYOl2X8mwXxebOfZBoPVHjdGymTsIYvqeK8tvhS50Kp5bO
 fm/EkOtZY0klE6o8I3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117986-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:sre@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,hu-kotarake-hyd.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAA99731649

On Fri, Mar 27, 2026 at 11:32:57AM +0100, Krzysztof Kozlowski wrote:
> On 27/03/2026 10:53, Rakesh Kota wrote:
> > On Mon, Mar 23, 2026 at 01:18:20PM -0500, Rob Herring wrote:
> >> On Mon, Mar 23, 2026 at 04:15:15PM +0530, Rakesh Kota wrote:
> >>> PMM8654AU is a different PMIC from PMM8650AU, even though both share
> >>> the same PMIC subtype. Add PON compatible string for PMM8654AU PMIC
> >>> variant.
> >>>
> >>> The PMM8654AU PON block is compatible with the PMK8350 PON
> >>> implementation, but PMM8654AU also implements additional PON registers
> >>> beyond the baseline. Use the PMM8654AU naming to match the compatible
> >>> string already present in the upstream pinctrl-spmi-gpio driver, keeping
> >>> device tree and kernel driver naming consistent.
> >>>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> >>> ---
> >>> Changes in v4:
> >>>  - Remove the contain for PMK8350 and new if:then for PMM8654AU as
> >>>    suggested by Krzysztof Kozlowski
> >>>
> >>> Changes in v3:
> >>>  - Update the commit message.
> >>>
> >>> Changes in v2:
> >>>  - Introduces PMM8654AU compatible strings as suggested by Konrad Dybcio.
> >>> ---
> >>>  .../devicetree/bindings/power/reset/qcom,pon.yaml  | 32 +++++++++++++++++-----
> >>>  1 file changed, 25 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> >>> index 979a377cb4ffd577bfa51b9a3cd089acc202de0c..2a5d9182b8d5c1a286716ab175c7bb5e39b334e0 100644
> >>> --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> >>> +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> >>> @@ -17,12 +17,16 @@ description: |
> >>>  
> >>>  properties:
> >>>    compatible:
> >>> -    enum:
> >>> -      - qcom,pm8916-pon
> >>> -      - qcom,pm8941-pon
> >>> -      - qcom,pms405-pon
> >>> -      - qcom,pm8998-pon
> >>> -      - qcom,pmk8350-pon
> >>> +    oneOf:
> >>> +      - enum:
> >>> +          - qcom,pm8916-pon
> >>> +          - qcom,pm8941-pon
> >>> +          - qcom,pms405-pon
> >>> +          - qcom,pm8998-pon
> >>> +          - qcom,pmk8350-pon
> >>> +      - items:
> >>> +          - const: qcom,pmm8654au-pon
> >>> +          - const: qcom,pmk8350-pon
> >>>  
> >>>    reg:
> >>>      description: |
> >>> @@ -100,7 +104,6 @@ allOf:
> >>>    - if:
> >>>        properties:
> >>>          compatible:
> >>> -          contains:
> >>>              const: qcom,pmk8350-pon
> >>>      then:
> >>>        properties:
> >>> @@ -113,6 +116,21 @@ allOf:
> >>>              - const: hlos
> >>>              - const: pbs
> >>>  
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +            const: qcom,pmm8654au-pon
> >>> +    then:
> >>> +      properties:
> >>> +        reg:
> >>> +          minItems: 1
> >>> +          maxItems: 2
> >>> +        reg-names:
> >>> +          minItems: 1
> >>> +          items:
> >>> +            - const: hlos
> >>> +            - const: pbs
> >>
> >> I don't understand this. The existing if/then schema did the exact same 
> >> thing until you removed 'contains'. Now we just have the same schema 
> >> duplicated.
> >>
> >> What does need changing now that I've looked at it is dropping 'reg' 
> >> in this schema as it just repeats what the top-level schema has.
> >>
> > 
> > we have got suggestion to add a new if:then block for the new compatible from Krzysztof Kozlowski.
> > 
> 
> But I did not suggest to add the contents in new if:then: block. I
> certainly did not suggest to not check this patch before submitting, either.
> 
> We had long discussion where I asked you how many address spaces you
> have there?
> 
> Answer above.

Apologies for the late response ....!

Both PMK8350 and PMM8654AU have two address spaces (pon + pon_pbs).
While PMM8654AU updates some register definitions (offsets/bits
added/removed) in the pon + pon_pbs address spaces, we currently
have no use case that requires separate handling. For this reason,
PMM8654AU falls back to qcom,pmk8350-pon for now, and we can revisit
this when a concrete use case arises.

The minItems: 1 in the original pmk8350 if/then block was incorrect —
it just repeated the top-level default and did not enforce the GEN3
requirement of two address spaces.

I will fix in v5 as a separate preceding commit:
  - Set minItems: 2 for both reg: and reg-names: in the existing pmk8350 if/then block.
  - Drop the new pmm8654au if/then block — covered by the pmk8350 block.

Proposed change:
- if: 
   properties:
      compatible:
	  contains:
	    const: qcom,pmk8350-pon
				         
   then:
     properties:
        reg:
	  minItems: 2
	  maxItems: 2
	reg-names:
	  minItems: 2
	  maxItems: 2
> 
> And then answer why the patch says the device has one address space or
> two address spaces. You engaged me, Konrad and now Rob in reviewing this
> triviality. This is on the verge of wasting of our time.
> 
Apologies for the extra review cycles.

regards
Rakesh Kota

