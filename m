Return-Path: <linux-arm-msm+bounces-97580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHtFMA45tGl3jAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:19:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C616B286DA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D109F3005161
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833EF3C3434;
	Fri, 13 Mar 2026 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ix64suS/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pk7K//sH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F183C5555
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418739; cv=none; b=kT2JHEBExDbrTZRqEq6NqR8J3eKZcXQcmEuUdtq59JW8tEdO8kGTXWbISJnLnFEWq4LdevDPLpPD6Z/DFA8gbTr6spBNRD2PaX8jC0FfYSh+nUUOKTBEmBiFEFAZkvelbdwO3tJvj/lbLTuZfRqL0hXBNeMWLIDC6t00H6+ecw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418739; c=relaxed/simple;
	bh=LFGN8b/UN+R3YGgYN2Kc7zmaiBg8kLu7zVUTimW8sZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQfdZ3jZ91puWMLZ5sto96PxRogdswMqt9rKP/zLs6JsBURqB9lV+9NnYvCIsxqMgbPwPlgWSwcwYEYtG56xp4nXKC90k/c4oVbaZxo9mBVRayG+W3x4wNck+NXdvVKNwxceEEIqNUc71FDPS5zNuPiqNTY++3rG1Gv3dEH9gjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ix64suS/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pk7K//sH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAmoXm2389979
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GQjuBix6iYhCQlMb6tgr+32J
	f059Qtt6VAlaGOemask=; b=ix64suS/x1LtCZ8ezz41H/xXF6ASxuDRqS7OKyBt
	XchRVF9Q/eQC7PGjKNTLA2C+/wUSWD17PLHSbx4irfnM5vUrSy/8/Vs0JE0P4Q45
	3406gCrtjfAJs6o9NLZmRtaJ0/VQ0CBAsVS978L9NcRnomNGzf+La55jc9PBjhrH
	HNPzeF3hvSA+WbccPlvfPDzJTx4OZmpDNe+ug2CYgExd4F5BuN0kqHbRL3QccsCt
	p+LKhIwC94/FxN0L1s389X1vYeX6PssCtmPEhUEhwEnw6XEDFANlXMwIdyai2N56
	BR9EWmd9Z/6LtnAjI9strimOQHcWCkT0r0KM8u7W/as2iA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5m934m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:18:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77bc8186so2144784985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773418736; x=1774023536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GQjuBix6iYhCQlMb6tgr+32Jf059Qtt6VAlaGOemask=;
        b=Pk7K//sHSKHiUHHn60LD/0sSC2r5BQXE0HLB+SFa5YwOmW51uH3pYfFWeJ+G1FE7fV
         3B1Tm0ypQZsaA+G89mN/bjHZU7qzVgwIhlfF9DmNGFtlyEk+5HP6ChfAyg+Pbtc2RtTu
         eraHrJ3w04T96+BKB+QaxB8C2ZnUNIvTA5NiftOMYyY3ppoQEh37HyOMEOVqpflb2d2i
         A1esBs1vtYUZ3hSvqkgKbAHidzZXoMfUBSRUGnzPnmi7/9xKBRY/WyiU30rQ7Wc+nEeK
         53Pnvp+twW91Y5a8LeEw8n/udGGyS3RKGfyITIb04GUNN3PkeYt9hslgFkQtkD4PfOWE
         nqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418736; x=1774023536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQjuBix6iYhCQlMb6tgr+32Jf059Qtt6VAlaGOemask=;
        b=pt/mQIYsB6nqg2xqCr2dwSKChuz7kwPX9b+JN5wnyK8K+eKU4MZL+BQYvTVaGn8bcu
         cbSwbBQEi+gjlumFlHefAPPdE7t/k3UD6Suf0hsPKzBRO0+UNh/pMA1gfvFLdCdCP1yR
         VYlGruW//NehKksooBJlYP38z2QCvrFA7dOS1kJJG+E5hJPVuJqAVQm7B2KIZnR6Pc6Q
         hnhzU1dyDXJhRUIAEzffgNAUCUlcc+cGGeYqqHIfFRVLIHIQlsgXmCHC7tt2c6DIaD8a
         c3vIaA1zZECBI5y4fSrMx45wk7LXHuXqxxq3qq5F3Ap+631qDoNMANcyZ4f7AXhhDlGh
         MRdw==
X-Forwarded-Encrypted: i=1; AJvYcCUPMTUmLCDms/xoCwu1BD7791ZFxQh4s5MEazab6255cw0Fncn0mjJ5uC3r/CwNY5Kh70g/TjF7k3DsZxrC@vger.kernel.org
X-Gm-Message-State: AOJu0YzlCqt4s/nSM3fKOiQwEdIDTgDUj6FmLDkc2C7yexdUR1UR1S18
	8ENZ05EHJQ4fW+hMfaKJPdbfZyrLlG/jeijjRzs/2TvYMNmAkQLDx8+akfthUbwWHBN04irLZuY
	eI+jXkjJri+IoBbv3RpvnajjSfjHa7AkifAFCf+UVo/N2eRZp/f+W296EW1i0KN5QtjIv
X-Gm-Gg: ATEYQzwa0DUH2NGX7LN9l/CXFCgi7BhjMrtXFZm/QnPyQ1Nd87FSOjQ7UPPQzOYvRdT
	rrDPqmvERrdtj1429W58b0GKbwvvaybN4Bxn3PA3e6n3XrGeBNzCemsTQifAlayFCYD+J/0d+KG
	9rnLJVql91ojWsfnMYs0PxP1o4Y6dqW3HKcn3QsujJ6e4Y8iL/SWqRopNrvr3g8LVPHnYugu0YB
	CDGpXFz3YGK1AiObSAjJ9mRUoVP3Dc1LdG9/4VX3yNIuirmrnlWdXJn6uVgT/FjpWgxT5+tTesQ
	OA5TLwMboewTjyzn2Pj2zOc3nZbnLfea4j+a5X1vPrkbPjenC0m66hwPocrFvUcva02SGu0cUQN
	Svdv6ghJrDcRbt+yptlHTkJn3SyJQ60fvLU4u5oW5/CjO3u3E9ejFTVz2N8fHHiT7bHZt+drMfC
	YbSf84t/+qXhvktu1vgXJa0wpsBkl7GSSnzP4=
X-Received: by 2002:a05:620a:4493:b0:8b1:ed55:e4f0 with SMTP id af79cd13be357-8cdb5b5b043mr496053485a.39.1773418736231;
        Fri, 13 Mar 2026 09:18:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:8b1:ed55:e4f0 with SMTP id af79cd13be357-8cdb5b5b043mr496047785a.39.1773418735704;
        Fri, 13 Mar 2026 09:18:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1563775a2sm1598057e87.89.2026.03.13.09.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:18:54 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:18:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: i2c: qcom-cci: Document Milos compatible
Message-ID: <jexys4ypbizesa3whuvtq36t6hpqm4httlbwtzkulz5pld4yul@lf3joaistvfb>
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-2-28e01128da9c@fairphone.com>
 <20260117-obedient-galago-from-eldorado-8e0ba4@quoll>
 <cb2430f2-8601-4c72-af6b-10f1ff16c188@oss.qualcomm.com>
 <DGDV2EMXHDS3.2377AQBNDDHAV@fairphone.com>
 <DH1LC0C4QD0Y.1XKV1PWFCBQRN@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH1LC0C4QD0Y.1XKV1PWFCBQRN@fairphone.com>
X-Proofpoint-ORIG-GUID: -HG5X9XGq0dmnLGSzyev8cjho1wHsckY
X-Proofpoint-GUID: -HG5X9XGq0dmnLGSzyev8cjho1wHsckY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzMCBTYWx0ZWRfXzGOlHrOG5yed
 EMwgccj246/Op8RvJ0w4YiWpnDBNuVKOx9/imxLKTDMKq8bCwPfJzsOJDuCwTpMst+L3v+N0wA/
 jq+3RWcH9YT2Bse8RCgkhCTw7iFCr8T8ytggymy6aSXrs6QtC1roTC+GdWU1wPjmFKW3PFnLlmd
 TJWVJBJAfDmtAnD2mcgEiftY4YwJ73z7yiNZiO2O/yac/bkudc6MUVGD8oG2EdDbxT0EDl/r5Xc
 qDGliogAH3sM1MNuEWFTFMNFVozAk1Io5NcrPTmAVvOgLydAFue96R7okBKXhk3i2kN+1dj/XqK
 qGk8SDL0ulP/otSCIy2SIFY4RkENV9FXwDrSDEjJFcbTBZ/CjbPPJJXLlVjYWfpJBglN1Q2kGfw
 L/MARaNmgsrpR9urYm3PVPVq9vQK/RRhovUJCXFvwO2bH3Mb9TGpOGae6tOl3GFvj7C0GgJbwbN
 VuFUO6LYNEsk3JRtysg==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b438f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=6H0WHjuAAAAA:8
 a=9zw7OpybwPviLstg948A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130130
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97580-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fairphone.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C616B286DA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 11:43:07AM +0100, Luca Weiss wrote:
> On Fri Feb 13, 2026 at 2:16 PM CET, Luca Weiss wrote:
> > Hi all,
> >
> > On Tue Jan 20, 2026 at 2:18 PM CET, Konrad Dybcio wrote:
> >> On 1/17/26 12:54 PM, Krzysztof Kozlowski wrote:
> >>> On Fri, Jan 16, 2026 at 02:38:56PM +0100, Luca Weiss wrote:
> >>>> Add Milos compatible for the CAMSS CCI interfaces.
> >>>>
> >>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>>> ---
> >>>>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
> >>>>  1 file changed, 18 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> >>>> index a3fe1eea6aec..c57d81258fba 100644
> >>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> >>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> >>>> @@ -27,6 +27,7 @@ properties:
> >>>>        - items:
> >>>>            - enum:
> >>>>                - qcom,kaanapali-cci
> >>>> +              - qcom,milos-cci
> >>>>                - qcom,qcm2290-cci
> >>>>                - qcom,sa8775p-cci
> >>>>                - qcom,sc7280-cci
> >>>> @@ -263,6 +264,23 @@ allOf:
> >>>>              - const: cpas_ahb
> >>>>              - const: cci
> >>>>  
> >>>> +  - if:
> >>>> +      properties:
> >>>> +        compatible:
> >>>> +          contains:
> >>>> +            enum:
> >>>> +              - qcom,milos-cci
> >>>> +    then:
> >>>> +      properties:
> >>>> +        clocks:
> >>>> +          minItems: 3
> >>>> +          maxItems: 3
> >>>> +        clock-names:
> >>>> +          items:
> >>>> +            - const: soc_ahb
> >>>> +            - const: cpas_ahb
> >>>> +            - const: cci
> >>> 
> >>> Same comments as other discussion these days - I guess that soc_ahb
> >>> serves the same purpose as camnoc_axi, so this is just last entri in the
> >>> if:then: blocks.
> >>> 
> >>> I really find this binding terrible - around six names for AHB - so I do
> >>> not want another combination...
> >>
> >> I dug up the CCI doc, it talks about the CCI having a CC_CCI_CLK clock ("cci"
> >> here) and a CC_PBUS_CLK (AHB interface to the rest of the SoC).
> >>
> >> The CAMSS TOP doc (for Milos specifically, but I would assume there's a
> >> pattern) says that for access to CCI_0, I need to enable CAM_CC_CPAS_AHB_CLK
> >> and CAM_CC_CCI_0_CLK. CPAS is a wrapper inside CAMSS that contains most of
> >> the programmable IPs on there (notably not the CSIPHYs, at least not on this
> >> platform)
> >>
> >> It further mentions that GCC_SOC_AHB_CLK is required for *any* register
> >> access within CAMSS. Perhaps it sits right in front of the xNoC-to-CAMNoC
> >> interface.
> >>
> >> This only enforces my imagination of CAMSS being a fully contained "bus"
> >> (perhaps somewhat like AxNOC on 8996 represented with a simple-pm-bus)..
> >>
> >> +Dmitry, myself and a number of our colleagues were deliberating how to
> >> best represent the hardware going forward and I think we at some point waved
> >> the idea of putting every camera subdevice under a "camss: bus@ {}"-type node,
> >> which would hold the reference to the TITAN_TOP_GDSC. This seems fitting for
> >> housing the SOC_AHB clock as well and therefore concluding this discussion.
> >
> > How can we continue here? What change can I do to unblock this? I can't
> > tell whether soc_ahb == camnoc_axi for this platform so I need some help
> > here.
> 
> Any feedback on this?

I went on and checked. No Milos's soc_ahb != camnoc_axi. They serve
different purposes.

-- 
With best wishes
Dmitry

