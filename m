Return-Path: <linux-arm-msm+bounces-92817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B9yLcFjj2n6QgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 18:47:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64D138BB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 18:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAC4F3039C95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EAB256C6D;
	Fri, 13 Feb 2026 17:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXy4vkHb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdTrlQIQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6751A22FF22
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771004862; cv=none; b=nhYn4R1vFHO3XXOHpwx5EFl1+lSW/czK8+Ng+Fa+Us5yyIA1FUfDT7iyojxQX72u9Q/opUVJ3Dko8ZJijgxk3MYfaaWkYjV0z0ynvgy+rPk7zQZdlLho+KvMrfEhRzWMMfPw4JtvjcxrbWcg7647fTFPdjOo4yvMfI2aQao1nkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771004862; c=relaxed/simple;
	bh=iZJfpDTbNbmbw/u3k1CiJ0P573rZuchXLQ1woQlMlUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gg+iRxiT6vUf/ytLGxBFxtFPfpnGemH/qdVSbkgetLdIHX54Sw18ZuCIgG31wmPYZ5fjDOXMJ37Q5TYbtSKsr1oV8cHkSO+p4e4HzqIoZno3Z2lsI5v0OSg2WbogZT79U3XqHM+va+n0DzIhRJeoZlzLV9O/Tgx3BprSADEGvZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXy4vkHb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdTrlQIQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DFLq4N3893153
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xcyN0LOhlarLRnTNU59Z17Ws
	nFLX+UBuYZSBmOeD1gs=; b=PXy4vkHbxfrytM+G17jlpnsxr5rBvtluHmmSvBMg
	Aa/k8PMx/tDrtA/BDfz1MlePLDM0sxOMQfijY6CNla2LpiW6ux/pNSRIH5Ye4R2c
	Rj5fXPT3E8MzUaeD4urFRJwTtfYnIYgER0rsrRJd6X70Ax+v70T1twSFV7Kavrpz
	NufpxyRPPFU8Yde8dAC8wuvMV0ppA2ecT2sqHKe90yIr/FB3NQXqGBMm/AUsWCj6
	fpeuTTEHS6pQZyRX2PB0LmEqiJBQiBSEYA4xCwOc7tt/Pp5jVm30EMM6PuPWkTva
	nWoPb85a0caUKu3Fj3bx8V8pSrQ0lktIAI8Z9MhvrtFT2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca6h7rmsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:47:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb413d0002so358956285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771004860; x=1771609660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xcyN0LOhlarLRnTNU59Z17WsnFLX+UBuYZSBmOeD1gs=;
        b=JdTrlQIQQRf5XVK886d4BlWU3lEDPmC4b2f8EdlMATIaRlm054R/EyKBzwTvLqSjSC
         0IHrYo/sVaMhcGgXSzMJJZ/ecqjQU7oho/fn52Pl3F072zCfv6+yX+BBT/c9KwD7vpCp
         RtvFCxYpHcFTVWoF3Lv7ca4QE6YbjHVmcAngcAUd9uDTsOSAJTPnBPyxepz9stwj+z79
         rbYkbFUxjSopiyiC6QsRUU8Zl7P7QeRhPRgFFiLSjMrld4PRyuRE2JYNkCh7wEtvQNO3
         i4TAdfF14461jWljYZZ3sVUhVwOcOYthuIAH9GWLKzudweaq7xt1jsUTKfg78OpCcorl
         b76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771004860; x=1771609660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcyN0LOhlarLRnTNU59Z17WsnFLX+UBuYZSBmOeD1gs=;
        b=ORXr2t7k6D9YM0wAhvSg7SEXlwi6KU+GRn+prHpE2Gum7zNku57U2ju0jpZUfIda0v
         okT8c7eFnY0hX7EdeqWGpeKhuKtGQd40Ru8peC6Qqx4LqpM8ArCo5/53cLFnxYJxzO9G
         vuIVbI7LLCk+xL6AivCzJY+xycUA8oMUs0jrxcTE9EYAo6fqOq+dR3aUr+3ehMyUx8uq
         /MwKSwO6eEK7IpOOPRYGTplo8NVs1SH7nyi4mTbOoP6P7pp4okqEaiw9P2NpIf8qyMfc
         l7WYgSeeRCMFemIor8COcMPxHpZxrF7mufYLdQ8VdZLuZVWbj3GlUIlyZVW96RiSE5/A
         Iggg==
X-Forwarded-Encrypted: i=1; AJvYcCX/RAUC7naQFKW9Wk87Hl1Dgr5Xf0oZz5cVWPsz/VBni6fQbZsYxTb1yn67MRAReP3AqlQdijm0dxR+tTMO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx570GdsPhImDzdVtHAQUiuTE6lXO/dXKlAj30mUbjEwlC5jBGQ
	r2Jtfu9ECsLV8RZS8P9TLnEGHsl1XU1Js0SKaPEdN0rmLTZQNiQHJcP/bD7gLfMoyN50iAhytKt
	aOAktxYBuSh75eKTP2w40noCg18Y4nivJuk3+63u7ySwgaljKzwUB69KL2yS5n39qQoBG
X-Gm-Gg: AZuq6aI1yfgXq8KWaupop1TtD/Lfr9a25SAADMpaPTwqeFawEwyr5JFkFXHBSWaTmh4
	+38p9z0sS1agYzI/NevXvdD2FEOg82wExhpn9XysaGTCwNZX+amzXBevqu4zoXp0lsRG8GwZKtZ
	EUN4mgW1mb0uT/Evs+x1PJvkmGZz8vuvMy382a8Eo13Cs2dxFLg1TmXp4O4wdT23JLfO2chIWmL
	zdT8xSXoQgXImlrjUyXcou1N0dQAsEMg0Q/+0bUllr2LjDumrokQW1pLfgepgiEhEv3TZYAIenJ
	nRh8ylF4h/9jIW7NzjCSWuWnuK/DoCJEP7+2YRqm87bHEoPsoshWm2dL3oRE/e7yDD1hVo4Kp/8
	b1+VJk/kaW5gflTHxtITbkOGpCpPdDtvCrfFUGyAB4WqeR6oLBCNTE9xxoYaEtf9AVrlO/rVP6/
	rB/U4Dn/Fi1PHefH/BgAuJCU7eFLx2ek33qqY=
X-Received: by 2002:a05:620a:4690:b0:8cb:3143:64cc with SMTP id af79cd13be357-8cb4acb44e7mr115287185a.42.1771004859610;
        Fri, 13 Feb 2026 09:47:39 -0800 (PST)
X-Received: by 2002:a05:620a:4690:b0:8cb:3143:64cc with SMTP id af79cd13be357-8cb4acb44e7mr115284985a.42.1771004859119;
        Fri, 13 Feb 2026 09:47:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f562f8fsm1675143e87.5.2026.02.13.09.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:47:38 -0800 (PST)
Date: Fri, 13 Feb 2026 19:47:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 vdda-refgen supply for Glymur
Message-ID: <hcslao22elcihjw56ltu4yo54lotheqpikzsrq6tia33di4fs4@2ygrbwhcfx2a>
References: <20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com>
 <20260208-refgen-v1-1-87ca84fd78b3@oss.qualcomm.com>
 <20260209-magic-conscious-seahorse-b81c8b@quoll>
 <aY1Jx5J8x/OALk5M@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY1Jx5J8x/OALk5M@hu-qianyu-lv.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzNyBTYWx0ZWRfX3KMqYhVObwAt
 jAwRdEBBGtjrDuPr05JG6Tcwq93Hdq/zH9/1BeuWancqMuxUhHvYIUlkTK4dP7wiSXxcVTKng47
 k2381IUNQ2yBmamsiYW93a2BiymDcVUfCpzYbrwW0iWa1+5k61J3kInG+pT5YkoyevQJnh09zV+
 XuZI3WAFkYKT3ALKf0lxo4m9K8SDWZJcHZiXaH3CpQlNqtyusKucTrCqrECCuJb0aKzIMDvLyF0
 8tOv9mshT96WdCG7ISrf9cGSl3SzGQxfq0oWS7Y0tNnXFSxHfLEXStYhu8NQ5//dceCEPyErujn
 O+4sKm+CEe4v4X4s8OBa5A6z0HFQ1roWGOU3kCwcZ0AiicEME/GYd4D522QwHQT6COcRlXYf8ug
 W6yiKO4mLYEBL3S+xAGl7HijHKXi3rrbP1dktHKG1pl5zxhu3VlX+BtbROB/tfMJaYdnbY57qNo
 6jSnmCHr1fGdZHWdMHw==
X-Authority-Analysis: v=2.4 cv=IaKKmGqa c=1 sm=1 tr=0 ts=698f63bc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=4XAFBGz2Hh_vFV4knqAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: wvRd9NU6dUUha_SEJ3dCD1BUbgVPeE2D
X-Proofpoint-ORIG-GUID: wvRd9NU6dUUha_SEJ3dCD1BUbgVPeE2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92817-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F64D138BB0
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 07:32:23PM -0800, Qiang Yu wrote:
> On Mon, Feb 09, 2026 at 09:06:23AM +0100, Krzysztof Kozlowski wrote:
> > On Sun, Feb 08, 2026 at 08:49:39PM -0800, Qiang Yu wrote:
> > > The PCIe QMP PHYs on Glymur require stable reference voltage provided by
> > > refgen. The refgen itself requires two separate power supplies:
> > > vdda-refgen0p9 and vdda-refgen1p2.
> > > 
> > > Since there is no dedicated driver for REFGEN, add vdda-refgen0p9-supply
> > 
> > How does the driver matter for the bindings? If I add dedicated driver
> > for refgen, then I change the bindings?
> 
> Yeah, I know that dt-bindings should describe hardware, not software. But
> what I meant to say is that the refgen is different from qref which is
> controlled via TCSR registers and its LDOs are requested to vote in
> tcsrcc driver. The refgen doesn't required register setting and it doesn't
> have dedicated driver, so we vote its LDOs in phy driver. I will avoid
> this statement in next version.

I must admit, I could not find references to the refgen in any of Glymur
PCIe-related HPGs.

> 
> > 
> > There is qcom,sc8280xp-refgen-regulator so why there cannot be
> > qcom,x1e-refgen-regulator?
> 
> I think we can and it seems better because the refgen for pcie phy also
> supplies reference voltage to other modules like usb. But I checked the
> qcom-refgen-regulator.c, it contains some register settings and there is
> no LDOs voting. I'm not sure what does those register do, maybe Konrad
> can provide some backgroud.

Those regs provide voting for refgen, because on those platforms DSI
block doesn't have a hardware vote for refgen.

> But on Glymur, we only need to vote LDOs. So
> what if we use a fixed regulator in the device tree to represent refgen?
> We could set refgen0p9 and refgen1p2 as its input supplies, then the PCIe
> PHY would just need one refgen supply reference.
> 
> - Qiang Yu
> > 
> > 
> > > and vdda-refgen1p2-supply properties to the PCIe PHY dt-bindings. Use
> > > conditional schema to restrict these properties to only Glymur PCIe QMP
> > > PHYs.
> > 
> > Best regards,
> > Krzysztof
> > 

-- 
With best wishes
Dmitry

