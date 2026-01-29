Return-Path: <linux-arm-msm+bounces-91156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJ2dDJ8+e2l+CwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:03:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B96FAF5A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA62D3029E48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 10:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4891F385510;
	Thu, 29 Jan 2026 10:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQyjb0Be";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpUsqDDW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D438637756C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684369; cv=none; b=VRWfuwJmHpghy/UMuN1yE6Tlf0tUBKN2Vnu1C2EbQmAtRedEhGZkENNT3diEepvOoKC3lylhJeVAUWfcWS1t/5z3b/PMY10KkAhD8JkQXeRKGV7Voxn9ieKbCMZ4kqL/m6rgiAnoxC5cZCsBYjw9bIE8luT4JsF609iNlw6BhQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684369; c=relaxed/simple;
	bh=4ZFEp9VmHn9X5nm2JYDp3tmIrZL6+S5eERUFEhD63PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pe9kbugoMrfClvEVc5dKJv88eDUNBHDAJbvDrjjaLCtBkbha3p1sBlQyVqwMhkVO9dVXVyGRFEsonEFYYhgQbSnicUBOYJ7zE1Gj5d2ghiAn5YLUhKti0/h3KVTgrENNQKvO8XajdaiGf1avVrWE88PFz+6XL99OhcxSZn2jBW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQyjb0Be; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpUsqDDW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T9hwTj2060281
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NoJe03w1ue4m/+oib/nWttjy
	gth9T6Vgc5MTYd8xNvQ=; b=EQyjb0BedpLhpSDTNqwmukLOfGNmCZvewmtRp0qG
	6E1sjiL2JZm/tFBsDX6QcXnsco3aIRG8CVqsXqwtZNzjmbYjEj+Pmc8rVMi7nex2
	VsuGHpp/mjRUG14fFN3JbrhFCm5WQBh27vM1AfIKwR839gEuKt0iMaRn7Um7G+yU
	YVQo6bdIFatSfXyjeKDxDoqxUil7KWTUan8jC+979XG07SPFPx94hKW2Pjck2/Mh
	7gxps1QD10RRHnk5lo2sUjXlKVxXSAzjs/Hv5vPDr8HpaLZXAzzVvXmgG1UCjDre
	uDyYNX5zELuEr6wsyTdtVXm2rrNG1iksmWYU0/voQRSPMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypgrk4bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:59:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a5bc8c43so223498785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 02:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769684366; x=1770289166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NoJe03w1ue4m/+oib/nWttjygth9T6Vgc5MTYd8xNvQ=;
        b=hpUsqDDWfh51Cmm9fQf2MeMbWPiDfC7l5iQ/WnE/i56v32f3NQAHer4O4CLhSbydce
         2k7PLCxfblGlLvtxsdUN9VlidadnLrgIK6UFAA8uhGvmNxOvQPmD8fG4wiLkXXelHPaN
         5ipRJIz3vkgLJuRpYNujCKgFH4+UP5tto91g7x5h1664m8fhKW4xjRd47khKtOnlTSJY
         FjSscc4uD2akCCAioFXjuFJtyLd1+sNqt4mzOk5Twhg7AdnaVQmewt4qQK1IjFiijuDP
         pbxwfO8LqvGmaF3fDhlcpYjCIbEMPCDrKBop2L2elDfSn8iHG5PcGQOkle42KedfvfvN
         tKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769684366; x=1770289166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoJe03w1ue4m/+oib/nWttjygth9T6Vgc5MTYd8xNvQ=;
        b=o2A4IHukeXbAhIntIvgeysF2bt3uA6cjLQQ3dAC8MPem1RbgRvEiu7DdcyL/H/nnxj
         074RSf9qewPUOOIby18sAmQlgdR/AtmPOYPUUkKf6iZsyGfC4Co4ZdIYoJr1ovjq9Jow
         waDcnEpxxTRW04wFWxsniRKU+yPf1EYZyvQxeARipLTFmjWTVuGJMW32djSwdA4r0kEF
         W5FhH8cFc0GxjLVfgEofDjyJEdsApyuy3+fHFFFe18iC0wkh5+uJKByp81rvkVZ9Rlfj
         JpWB5UU39Rn7NZYuizGHOwa449hVTIVpveviXNLMuPM+njLJbO0/95Vxv8D/jvzEIP9U
         Lzng==
X-Forwarded-Encrypted: i=1; AJvYcCUo2zd/yhkhWeFVW2nHhJQ9Ew9XNOx0hOmtfkIgsKobYhy+6BiqRBtHAT0KfdHJbq8qNWHJe3h4rRjqMfRq@vger.kernel.org
X-Gm-Message-State: AOJu0YzYA2U4qw0ale3N8J12wVL1DjTa46XThoUdfuqVQ0qqL1fZMFKZ
	ctJ9DW6lE++Xz2mTbhRhbk/lSYiGD9Z59XuHk0Povyb6k3EidPSwXllVzCuBSFkIIUfwXdIVAcm
	k4T1c2lj3o8jOWtSYTElAISjTlqsAIXMHtC4H9WztwtU+XeIZauZ16kPY35VqK+v3V3Wb
X-Gm-Gg: AZuq6aIllpBPpgSSgqXbZRPXcLor0vhR2qIUZVMb4Eql6l/X+x4X12T4K3hfzBvS/6l
	bxUhmqsbwV4vRT1XCv8ir5RIq4eu2XyjzOAYEus0LFzNjiycB78+AGq5fGFHWuuJWzrUlu/kCxf
	oAhDtfgXFvcn9hGJkvyTDxJ4RRrGmdwSgRTSEFHcvnYAjZ+R0xX+iE/eW0ddjEbo+/T72oCBU7Z
	ZX/81OStsgqQNH2qjbSJc3odiwYb8G3sv1YehakChKiy2gyvY0hqeDXsmPy446rlBeDv8SHpdGB
	jTfUWGnCrMp7Ttp0HXmmjux4AgioCv7CNN3AU1/DCz8lUW1r6p8TOdp4GP6ggM4UKPiWo6HPrtF
	Vz1lQAoYklgCsbDhGGC+hQwip
X-Received: by 2002:a05:620a:4104:b0:8c5:391f:1db7 with SMTP id af79cd13be357-8c70b9082b1mr1017573585a.64.1769684365992;
        Thu, 29 Jan 2026 02:59:25 -0800 (PST)
X-Received: by 2002:a05:620a:4104:b0:8c5:391f:1db7 with SMTP id af79cd13be357-8c70b9082b1mr1017571385a.64.1769684365347;
        Thu, 29 Jan 2026 02:59:25 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm14498219f8f.33.2026.01.29.02.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:59:24 -0800 (PST)
Date: Thu, 29 Jan 2026 12:59:23 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Eliza Top
 Level Mode Multiplexer
Message-ID: <yhnnlbvcqgtaseoiarii4rfsmiem56hxsiuibf3kyux5ftebgy@dhkhij3qq7sk>
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
 <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
 <20260128-hot-camel-of-acumen-eef9f2@quoll>
 <5teqin7wl2n4spyqrt2glyeaxe5tm6zgk3tmzs2nhj4xedurrp@um3y6enwt7iz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5teqin7wl2n4spyqrt2glyeaxe5tm6zgk3tmzs2nhj4xedurrp@um3y6enwt7iz>
X-Authority-Analysis: v=2.4 cv=d7T4CBjE c=1 sm=1 tr=0 ts=697b3d8f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=ORP-x1qtNI2ya4drUPcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: qxm0-J4QeeY-VxTDmVLGeRDHYp0caxE3
X-Proofpoint-ORIG-GUID: qxm0-J4QeeY-VxTDmVLGeRDHYp0caxE3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3MyBTYWx0ZWRfX3kLdiXzZTbAL
 PvgCP4EBYSjytOYKDWrInnUBNXw8A8JMtpTlJiZp6qNEhBYdCNuxgJLrTVjlyKEZ8KfxldTtu9y
 air/8SqvwVikEicmynTnD0Zz6lbKQuA8F/tBImbwV7oB4E1F2+TTHnKZRTioJc/Qrt3g7NFQoMl
 PU7vd+v5em5kUmqGT93AKrxF5arcVQyDdx7yYEzHSbt1dJQPqUT3ezAxhZLqSewxkVEJTkC2Ckp
 0dozMI3XhvlsUrtFATX+AUAiXNOtAnuubacD4I1ODtGSg/WSgLASqM6aqdfHg3WYnVoUdCDXFMa
 bvTWplRfBaHKaG/2ZZ3v58BfIjBnbkkVgfMUKzGOmaW7L1Iw12gYlJ0Wmcz9uuwTwUVVxPG7uwi
 AIRsX0NdjIuLP+mF8cQoN4yeunoSAQTHK8/6j/WdNzI4G9YYb6UTU+bux7Jzjmo/Vfkdez1JAV+
 qd7pSO2RLN0g4nVul7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,devicetree.org:server fail,qualcomm.com:server fail,oss.qualcomm.com:server fail];
	TAGGED_FROM(0.00)[bounces-91156-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B96FAF5A5
X-Rspamd-Action: no action

On 26-01-29 12:54:49, Abel Vesa wrote:
> On 26-01-28 12:38:32, Krzysztof Kozlowski wrote:
> > On Tue, Jan 27, 2026 at 05:47:36PM +0200, Abel Vesa wrote:
> > > Document the Top Level Mode Multiplexer on the Eliza Platform.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > >  .../bindings/pinctrl/qcom,eliza-tlmm.yaml          | 138 +++++++++++++++++++++
> > >  1 file changed, 138 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
> > > new file mode 100644
> > > index 000000000000..d8b6591caf57
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
> > > @@ -0,0 +1,138 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pinctrl/qcom,eliza-tlmm.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Technologies, Inc. Eliza TLMM block
> > > +
> > > +maintainers:
> > > +  - Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > +
> > > +description:
> > > +  Top Level Mode Multiplexer pin controller in Qualcomm Eliza SoC.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,eliza-tlmm
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  gpio-reserved-ranges:
> > > +    minItems: 1
> > > +    maxItems: 84
> > 
> > 93
> > 
> > > +
> > > +  gpio-line-names:
> > > +    maxItems: 185
> > 
> > 186, your first GPIO is 0 and last is 185.
> 
> Wait, are all of these wrong then?
> 
> $ grep -r "gpio-line-names" Documentation/devicetree/bindings/pinctrl/qcom,sm8[3-7]50* -A 3 |grep maxItems:
> Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml-    maxItems: 203
> Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml-    maxItems: 210
> Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml-    maxItems: 210
> Documentation/devicetree/bindings/pinctrl/qcom,sm8650-tlmm.yaml-    maxItems: 210
> Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml-    maxItems: 215
> $ grep -r "UFS_RESET\"" drivers/pinctrl/qcom/pinctrl-sm8[3-7]50.c
> drivers/pinctrl/qcom/pinctrl-sm8350.c:  PINCTRL_PIN(203, "UFS_RESET"),
> drivers/pinctrl/qcom/pinctrl-sm8450.c:  PINCTRL_PIN(210, "UFS_RESET"),
> drivers/pinctrl/qcom/pinctrl-sm8550.c:  PINCTRL_PIN(210, "UFS_RESET"),
> drivers/pinctrl/qcom/pinctrl-sm8650.c:  PINCTRL_PIN(210, "UFS_RESET"),
> drivers/pinctrl/qcom/pinctrl-sm8750.c:  PINCTRL_PIN(215, "UFS_RESET"),

185 is actually correct, because ufs_reset doesn't count.

