Return-Path: <linux-arm-msm+bounces-97373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAOKCrfSs2l5bQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:02:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADDE280221
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3F383055426
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34CF33D4E5;
	Fri, 13 Mar 2026 09:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgJPKrCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fwuMZTrV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43C434DCD2
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392564; cv=none; b=etRm/Src7Hl+w9ZMBhd4GXH2q9EoHhW9OPLXgHkHeMkWm9msM1QmE2g85oOQDhIBp+wgxyXD5nFkb0YVCoxR2R2pi4suQ7QHv4hPLMo8eEMwFzmofdih6bbAwu5Xa82fuYatiVl/EXtb5YRnG77b/D4scoQTOaTY6Pb6Ox0CooU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392564; c=relaxed/simple;
	bh=uwccE8UVIz1WEPjdu6fhZMBvTKVUMDpZdAYEGlLrbXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fez9nj3td6WMDyEUpc1M7CJJoHuQUTo9IRGIcuLDHPxQrN7+5yduhLGgXu/1vNC91SFRfi/tO2kOO/RSlTMG7yt2sy5Fvg34e8pVVytecE8jldRAfEcu+8rrEq1GAvNgCSCbxuI0NDNUNwLZxt18VGf2LhgUckn1xTYDToFfC6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgJPKrCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fwuMZTrV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5taLT4140706
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZIsX3ZmUvoJ+WJUVXUFNdaHX
	BzaS1DByqfbddo2c0q4=; b=JgJPKrCLQswkTxhCDAcna6Ja0mndU6vDz+q7kkEZ
	TYnRnCLwXn1I3D6Caj8IhVWr+M5d30JBJcwzUBWDeFumdT65uZt2HdJc4zRALGHU
	cKIbVavS3x9IW1T7JQrok3R4xbsC6NSYceIF1AnHdnykS31MXWfp0V7kSiYpVbl+
	6Qt7WP1ApcvKl94Z2HloR4cNzyf25lQeWghZzqru2bFVpuLFxFB85Qt8SleVDrY1
	/AJK/kM12mr+X94J4ACcSevy6uR152Hr3POMzo+OEgfMaavkt7wPPXvAXKDb/u4+
	nzvBYAUZAwlrQbF5BRGfNr7hq4VeO5/R8k62CoPqncnhTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn28w09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so1505703085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392561; x=1773997361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIsX3ZmUvoJ+WJUVXUFNdaHXBzaS1DByqfbddo2c0q4=;
        b=fwuMZTrVnlaHQ7pDY1tP0mtlOTp+MZcsW3wo9iK1S+Z7W1hV7oMeVVGeDhHLfwKQde
         lPIFrmDFFOY5GeM1KSFrmh5qBdHzn0RN3lne/SbTKwvAMERpxjzLmzyD7zsewzPNiR+s
         ZAcvZmKjnSOX1UESQKtQY1b7b0UzODzuoVJfsASgTgPCyWV2Oayop3o/L7b65Jq5BD6Y
         crbIBQisvLQkzTyRmj4+s6hfKcxY9QSN/UoBA+oJwQ0o7+hWi1hVnXUm+x9nloI46MgA
         bo9Qlluv/Tkcqse5n1I4FKkQdpCEUFlTJR1Hv0VsRhJGcV6zrAWC5PWuQlQtayjI5WdZ
         mLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392561; x=1773997361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIsX3ZmUvoJ+WJUVXUFNdaHXBzaS1DByqfbddo2c0q4=;
        b=hH43tOh1gjoVf3ra5zFAbyUa6QpG+cKwn0EqI4dOzLmw9J8uZDFBy2dPvRN5P06f1k
         YsoVXeN7LSl940XzD822ria5n0Omv52Bn4G51ZMJ7Wuk1vtGtVpJnGIiXzMdyXgT6vPC
         Nn1XyvnzYjBRP4DL01JvLcDeEJzA3uf3wO+XSftrCh4DYdWLTF1DTLmNiBU77J9eCBv9
         8+eDTi1dlXw4tTnU6cDqEz83CJ5NgN5/h0TdqU1ZDaGuNz6J2Xfvo6BDWzJYxQmxqnIN
         gsuYqVegFK0LJoxE+ahfQsfb6JDaap4A0pQwNv3kDhWXlxk/wV3lhnlba4y701A4Q+nQ
         gaCg==
X-Forwarded-Encrypted: i=1; AJvYcCXe56rraQs5OFN6OGu61pHWq/suWJnYNsl2MLJIXmcqAWlve/kDYjFMYQpzFZhNd8NkVTN1azhb3UxZts1I@vger.kernel.org
X-Gm-Message-State: AOJu0YxQG+8qLOtgKpiZgwTbJzxVBour4+MsKPJSovvQDhKepmM1ugNw
	UrYZzkQdcrdQK90PqASVFWpL6M7mHFW8I7cBEjT7lqGWY9/PndFtJce6cfPGqsJAOEvcimoNhtO
	4dqq17NVKR5WVp4VPeDAhOwxPoJBrrs/4t7yswFuBJEF+wFEYcpmxqYO2wS4pb/8YgPqO
X-Gm-Gg: ATEYQzwmYZ3e7Mmyh5YsRncoXLWkLVTN8PeUkfqhoelT6SC0Ic5/SFPksgn+SUeyi/I
	+Gx443ox9WfdoODw9G8cmYmpQ2kD7sJlWB7xBNIEZEpeii5SpX4RhifrvnlKXTkZkbPGXYNqRnO
	3ZbrsUv9fzupC4Pzpli5lMd1/D9AuENTYWIocBbpW8JmlzcL/gKr1erTig2l1FnBi0FwjI9XZfJ
	Nf+z3puEIs74sJ28uZB3nFu55G09NQr6S9hePww4iBZGp3B6dV76Ls5C6TDSPvx91r+l5OtWxK1
	FUdjggobir3k7X+0SZRRY3KDNBiJCi/+PVTFBblZtgpzV98YYwK8nJtKx84eEfkc+sFUHIz45ua
	S98+7zww7E6PCHGtfeEnas3472PUJn+kL7g==
X-Received: by 2002:a05:620a:4694:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cdaa7a1804mr764060385a.10.1773392560580;
        Fri, 13 Mar 2026 02:02:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4694:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cdaa7a1804mr764057085a.10.1773392559987;
        Fri, 13 Mar 2026 02:02:39 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm191687295e9.0.2026.03.13.02.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:02:39 -0700 (PDT)
Date: Fri, 13 Mar 2026 11:02:37 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: spmi: qcom,x1e80100-spmi-pmic-arb:
 Document Eliza compatible
Message-ID: <w3idoxau45e5g3j3zqboduw2qiz2s7uvwko27y3z3ue5yxlzxm@av4ksryhjnxj>
References: <20260311-eliza-bindings-spmi-v2-1-12783c6759d9@oss.qualcomm.com>
 <9b8ea7a8-80bd-4aba-89c3-6dbe9d43c41d@oss.qualcomm.com>
 <20260313-happy-pristine-galago-2a5a3f@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-happy-pristine-galago-2a5a3f@quoll>
X-Proofpoint-ORIG-GUID: uZlJLVuJIEhOYY473mlTNeW8Ays3fJ_B
X-Proofpoint-GUID: uZlJLVuJIEhOYY473mlTNeW8Ays3fJ_B
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b3d2b1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=F0_lbFdFp-naUQYOxWEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OSBTYWx0ZWRfX+ba53oF0pOIx
 W6w0MUExpyvUjS/ToQVN09hE6nxhv2OoB+R8yyPcBav9HUCSQ0MixJuu5oT9Qr64Qp1lnbz5cZG
 qSd4itImA4zUXbRntd+Me28uTifH5P+2SzRfaOTvMAso91fZFB0WaNXUyfWotnAgVBTSrKtC3h6
 4nXCz7XkFv0oWr1bOIqpvZCq4y1EZW6ZhdIL7lJP4I8mpeOBiQliGMdHSm+OpZZ52vpDAGT7/DW
 cYXrmvt0pomt5gF2ifsdm7WU8D1Y0qya15N1VKMm4ans0nUFapGXlrg7Zw1jFNs5U3HuibO+XWx
 WsjDrFKrmHSLNtI8LNwdpxxKobEaQfWsSeUD/7Mh7FPw3VAd2zByvvJxr7v4fq+hwii8wyxcXoT
 hicSNYc5Lf1587OjNWK+nJQPWltrDv6r+qpkgrlG9OUtLKyd0Cxh5vGXfSWoz4G0b5c5beguTI2
 XdbaJG05cOVLwi/4nXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130069
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97373-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6ADDE280221
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-13 09:34:34, Krzysztof Kozlowski wrote:
> On Wed, Mar 11, 2026 at 02:43:27PM +0100, Konrad Dybcio wrote:
> > On 3/11/26 2:29 PM, Abel Vesa wrote:
> > > The SPMI multi-master Arbiter found on Eliza is version 7.2.0, yet
> > > driver-wise, still compatible with the one featured on Hamoa (X1E80100),
> > > which is 7.0.1.
> > > 
> > > So document the Eliza compatible and allow Hamoa one as fallback.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > > Changes in v2:
> > > - Instead of reworking the whole oneOf for compatibles,
> > >   add Eliza similar to sar2130p.
> > > - Link to v1: https://patch.msgid.link/20260311-eliza-bindings-spmi-v1-1-1a20eec1179e@oss.qualcomm.com
> > > ---
> > >  .../devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml          | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
> > > index 08369fdd2161..4152469b3880 100644
> > > --- a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
> > > +++ b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
> > > @@ -23,6 +23,9 @@ allOf:
> > >  properties:
> > >    compatible:
> > >      oneOf:
> > > +      - items:
> > > +          - const: qcom,eliza-spmi-pmic-arb
> > > +          - const: qcom,x1e80100-spmi-pmic-arb
> > >        - items:
> > >            - const: qcom,sar2130p-spmi-pmic-arb
> > >            - const: qcom,x1e80100-spmi-pmic-arb
> > 
> > I think Krzysztof's comment was meant to suggest you shouldn't add an
> > intermittent items: entry for a single const (lone-x1e compatible), instead
> > passing:
> 
> Yeah, you added unnecessary line "items". Your hunk was CHANGING a const
> into items+const, so I asked not to change that. If I meant the enum,
> then my comment would be under enum.

Oh, my bad then.

Will respin with v2 changes but the items dropped.

Thanks for reviewing.

