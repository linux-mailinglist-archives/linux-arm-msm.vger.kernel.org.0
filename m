Return-Path: <linux-arm-msm+bounces-101418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLkWERvszWkFjQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 06:10:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F496383601
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 06:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36186302712F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 04:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E8C35E92D;
	Thu,  2 Apr 2026 04:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1MrNjH+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WB0gSXGu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3758034DCE4
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 04:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775102944; cv=none; b=ZNM3+Jklk3Xso2kHNF12VLZKPUqL+kdfS7xD/iIiErHt4vQFtTIm7HqYPCB1UO0kJszJgzlBsUXmfSY99xX0RNhZ/Qg+VuKcxpqecH61m/pDnSwUm1rICU1BdjhTbAk//kc0g21/KL0uW1FfjHHoDOo/o5dtoEe10ao9X9HvNos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775102944; c=relaxed/simple;
	bh=+8E/LhhDwPbM7UOdwh+kSRT2qx2VMg4VagLyy9JkD7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+F5bmGd8cZgIEzF5HV81AdGnLArHeNvtBK3GMlJE/Upwjt3hu8IqZg/dfBodOoLIvJb+Rcwk4g8cUEPzdJEd27E8rpW5MpXfUTsq3ig4rTYhkbfKHjL1wotl1db+Dj5KY8UrxO0lKhxbGMO5gfsfiNbzf5TmhksPTtUCi95oU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1MrNjH+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WB0gSXGu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4Cc62798898
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 04:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Aofa1JW3AOYZFQk2Olb/0D9a
	q9CH2o6vk4E4accz114=; b=f1MrNjH+BObNeOh4VMVqLjiFr5OaGAdii9TkXFEd
	J/g+dAX+A4v9TrVFq5pSolVuP0O1qlVF4OasrvyeTwZ3KBE7tfLOWh9i415O3kcM
	oM89gldy8lpnezZx8cfDajxRIT10UcbYrvW1nCXETn6jVCAPEPawEvJ+OuCsKvBx
	BMJOHrauErXmc4f+D2BFqfej0zaHG6TFx9QXmRoLfQwazl8o551G35r5wtftl0HH
	ks7WoKTK3aviC7R5VcdzKV5tAS4CiMvaKVazqjaiLm1RQkDZzdwMTTibLCz3guLS
	H3BNDMa3EIU+/sddOMUPGbn9VpKW+2Wf7FMH9gg5qx2F6A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96hk2595-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 04:09:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdd327d970so280043eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 21:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775102941; x=1775707741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aofa1JW3AOYZFQk2Olb/0D9aq9CH2o6vk4E4accz114=;
        b=WB0gSXGuzfhrQyFpdnAJQLk3g6Gfjbv21KOAtuXZMK1YiGDuyukl8cuPBEipiUnF5S
         qmf3ggFFqY7f+PQhQujJQdtV5+oKmjhEL9Qbd3RJUJvEHBn5ExgmpSvjFgnMMAvoq4Ni
         E7gvG1uCz1GB159CGt5C5VNsar4cGuiSopGrXStrIuVPAjis0Fhdv4y6bQX4NlcBUzbr
         X7VGSCd0yHndKKiQAsPw4Lks0lk68CxzxRdNZjgpL3XeR6+8sTQFCawBx481xUfSx3HI
         Yc1Owjr/NxtJbVXAz3il06DxQUjdxY6NSKtfQi8M85NZKEkAQhx5ckAl60JToSPMQ45x
         b96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102941; x=1775707741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aofa1JW3AOYZFQk2Olb/0D9aq9CH2o6vk4E4accz114=;
        b=dHGA9TNHLeqKAhE9AGxboYog015kEu8QlQH5iyoNrSw1FHl6aO99TLSBDh9OXsPR9V
         FeqqN8SB89V6tNm4gMtiRpzMHi4zHsHsURkLCBNR4n+040hFQXA3iD7mSZNhc/OdHx0L
         JFww9etDKmXeH/s63+W82C77zG/ooOlLMGfaM4GUW+7o2moqw551nlJbV4kSw6HgzD70
         g87SRubQgK8dqKooXztWxwHzMy38qRbmK8crhUarHd1c+Pfisnolq4FY2nCeztK6H6XV
         R3qL1t/84hX0ZeY2fkYal6J7mjYf86rldy/LYegBVsx7nO/eEdaumITJnnIdILB1zVYe
         gUCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMobgLhcBjuDwo+s+sNjiQ1pQcyVOhviktr3Tdi1/+iqfxLHgM18yA9T1p82ORCNWn5nxKPZnsYXkFYoGX@vger.kernel.org
X-Gm-Message-State: AOJu0YwOGrURvbz9t6PIjLzZjIQzng55aeEshyq4LNzUxGnu+H8FBUjA
	GJM7MESbo7/XJGaYRDkuS5CdVQciU8vSV3hLCMiP7b3VxFdko8M3vHXWuVBcpinPFvjXCidez8Q
	r0AYVXH+/5iJgp6oZ6H4NkykhelgQrjupf6HxtL4wvYtt3GYJ8dKU7An6UegZ8MRGZ7es
X-Gm-Gg: ATEYQzwObTSAR8Q+JKfDhCUo02eTmUEPvimsuUAkaO5cTKdfdZv9Q3A0zxwl2PUnppu
	X9t/mr1b8F3awkh5R0oxADwCB8p09ramWvIMoupkCI7osbUiOk6+J2b1IGENUYz/H8CQ0I6gR2L
	MJAs9S7PGAYHX3q0IPbALSfeiLCi/OtCkZ9wH+RMAvl3GTv5uf4NacMMZURzb7ut9ALQNL4Jp9c
	pyGPmB2gGvWwNk86T9TF6ZV9thbBR8hdxZ5rUjhwseVKDdagtr12GB3ZUz8IaD/aqIUAYmAQeU1
	y6ibJlIQKVUW3UwpAPQtS9ldHaS/3xKp070hDPkOQmxV2BBjwUhsKFLrj3P1KCFgaDC+e4kUmt5
	U8fALFo6Drmpawz0D9bEajH2tJh6wllD6x1BHCJjq8B+XjSaWq6UU+XEDmHEFZYX36jbY
X-Received: by 2002:a05:7300:dc05:b0:2c1:517d:5e97 with SMTP id 5a478bee46e88-2cad6baf65bmr330288eec.7.1775102940731;
        Wed, 01 Apr 2026 21:09:00 -0700 (PDT)
X-Received: by 2002:a05:7300:dc05:b0:2c1:517d:5e97 with SMTP id 5a478bee46e88-2cad6baf65bmr330270eec.7.1775102940176;
        Wed, 01 Apr 2026 21:09:00 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca792f3f54sm1386123eec.7.2026.04.01.21.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 21:08:59 -0700 (PDT)
Date: Wed, 1 Apr 2026 21:08:57 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] dt-bindings: clock: qcom,sm8550-tcsr: Add QREF
 regulator supplies for glymur
Message-ID: <ac3r2ViH1k59B6S8@hu-qianyu-lv.qualcomm.com>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
 <20260331-qref_vote-v1-1-3fd7fbf87864@oss.qualcomm.com>
 <6d0c1154-b249-4c44-acb4-52d43d626fa6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d0c1154-b249-4c44-acb4-52d43d626fa6@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzMyBTYWx0ZWRfX3j7Z9PhQHnZc
 fYhVrKjDBmbqhX9epmLTLtCQ+t/3m7Hm8ACnPfAHH31COQLwnBG6T02QzMxnxnSJI11ZbMesT8E
 safrqt1vJTSCx3UdCERY2Ll7VvIiQynEjYSWU8PaaSMQRd79G5hOIyiCBC0N4JWi4I+G9eFoqcD
 Tc/zIfPJPzKva6JpI6MaCgGhiLhklgvgUy4Mb+sotKoRSZ1ooiRr0W6FkdQZ78chlgAg2WikEOv
 K4OVNJHkcSMsWaYRV3u6fEsJ1nqBDNiX3/yUBDlNOr3fY5JG7Xuz/c0pzZCAWTlt9oq6sDMGMpb
 tT1FyfRdQ/Tb5MZnmg2N7U2kafsvRTB6lIl0rZ37lIk7I1jpuzrz5/OPDWUGzKs8jK12DSqCiYN
 zxhNbntcPBsURg1diKIN4s0QiK8oSy5Cf9ToTX/IM7C4kKr+McOVb7LDgBuptU5tZj73EHeTT+Z
 17qgrT1BR6OuDn497qg==
X-Proofpoint-GUID: zZwaSt3jop2Wfpzk-1CXKny1_3Wu6tAO
X-Proofpoint-ORIG-GUID: zZwaSt3jop2Wfpzk-1CXKny1_3Wu6tAO
X-Authority-Analysis: v=2.4 cv=e9ULiKp/ c=1 sm=1 tr=0 ts=69cdebde cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=V3kEKwUAXSpzXU6G4ikA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020033
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101418-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F496383601
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 09:18:12AM +0200, Krzysztof Kozlowski wrote:
> On 01/04/2026 08:35, Qiang Yu wrote:
> > The glymur TCSR PCIe clkref clocks require regulator supplies for the
> > QREF block and its refgen reference voltage generator. Add the optional
> > supply properties restricted to qcom,glymur-tcsr via an allOf/if/then
> > conditional schema.
> > 
> > Switch from additionalProperties to unevaluatedProperties so that
> > properties defined inside the if/then block are correctly recognised as
> > evaluated and not rejected by the schema validator.
> 
> Sorry, but no. There is a reason for that why additionalProperties fail
> and writing-bindings explain that.
>

Okay, will change this part.

> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 26 +++++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > index ae9aef0e54e8b8b85bc70e6096d524447091f39e..88db650e69ef2388a5bfb6783a57c1d48c0e780f 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > @@ -49,11 +49,35 @@ properties:
> >    '#reset-cells':
> >      const: 1
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: qcom,glymur-tcsr
> > +    then:
> > +      properties:
> > +        vdda-refgen-0p9-supply: true
> > +        vdda-refgen-1p2-supply: true
> > +        vdda-qrefrx0-0p9-supply: true
> > +        vdda-qrefrx1-0p9-supply: true
> > +        vdda-qrefrx2-0p9-supply: true
> > +        vdda-qrefrx4-0p9-supply: true
> > +        vdda-qrefrx5-0p9-supply: true
> > +        vdda-qreftx0-0p9-supply: true
> > +        vdda-qreftx0-1p2-supply: true
> > +        vdda-qreftx1-0p9-supply: true
> > +        vdda-qrefrpt0-0p9-supply: true
> > +        vdda-qrefrpt1-0p9-supply: true
> > +        vdda-qrefrpt2-0p9-supply: true
> > +        vdda-qrefrpt3-0p9-supply: true
> > +        vdda-qrefrpt4-0p9-supply: true
> 
> I really doubt that TCSR, which is a small, tiny tiny block the in SoC
> have this ~15 pin supplies.
> 
> Anyway, if it has, then device is quite different and should live in its
> own schema.

TX/RPT/RX are common QREF components across platforms; what changes by SoC
is the number of instances and the routing topology.

For example, a single PCIe path on Glymur and Kaanapali:

- Glymur: CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
- Kaanapali: CXO -> TX0 -> RPT0 -> RPT1 -> RX0 -> PCIe0_PHY

The DT supplies added in this series (vdda-qreftx*, vdda-qrefrpt*
vdda-qrefrx*) supply to these TX/RPT/RX components and can be resused by
other plarforms.

- Qiang Yu

