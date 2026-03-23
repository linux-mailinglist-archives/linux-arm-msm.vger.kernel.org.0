Return-Path: <linux-arm-msm+bounces-99343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKvYMGtxwWkQTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:59:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7812F93E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA0C631454FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3414C3BD22F;
	Mon, 23 Mar 2026 16:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENPDGsh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S5nHpIeu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA5E3B9D9D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281827; cv=pass; b=e5AiW8yU+u5xt0e8NZInBtNvIL95GK7XSxm7NEELWCphwuhDar4yjifEt8br8CDPcUOpid0wHwi2l6ulO+J6R22WWuNEgoJ5IWIygACUSxr+JPv22wroJLViMGTCZfbYc+zqgUNz9js/MLQo/PfUD6Nf8XtN3PEibj7mAoF/lMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281827; c=relaxed/simple;
	bh=6IeZ8bg0RppZOGpii6z5tIjcxbE9K2oPFgD/N36lrPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZUvMPJdG+UGDMhdsWJBt4NgRlyUpVt+bYOYhZ5hZFey0dklkX343IMTNHBlG85jjUFOwToi+PDHk3s75o4QlqRfw73c61pEGMIab7GfaCjvAKdvEauZfbbC88z8zVfakjNw2R/yC2KNjyjYiQ9z5JurE4vycxEUHlppJY82s8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENPDGsh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S5nHpIeu; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGWof2337897
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUbYj7E6USUjs39a3+mImLkR+XQomQn/mwKeuuq4nEo=; b=ENPDGsh98jYcruUN
	B9CMsz9yRVTdwS60oVcVmGmU+ZgAS7ZwB3KyRLOIoinaX0DTys31BGD33rcQ/To7
	Vc2zk6elqkw7IrWW4vw51tgRsbs/YHjbIbl1xvz/LAgGltAZMTEDiPTjVAFKgn1E
	IGHXL5LJCVPTsztCcYs7lXOzCjzUXrLzW+75QP0JyxW/oOLsIDeDFseQCI7PeEMj
	ZTGU0qUE9vTWGz0D7Ct5QFlTrsUMdocnotuDYp2M2kTPGwN7ndO2uD/CmGwHvele
	ED2Qu0EWecgbz/SrzR680MQIEcaTEtha27AsAGZofNiKgjkoXRUvE/kH9oV1Gqg3
	LTmEOQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p79q10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:03:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c738bebd53fso14202542a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774281824; cv=none;
        d=google.com; s=arc-20240605;
        b=C/eY3zW473RqQOnGCKGqRR+UzJetCEHm43scyYljxSqHNKw1nvoiDg8ZhfG6CsGFbU
         PtXNGTgEheApSDQvxkZzlNGySFr5IXQzs3rddYDJX4FtQJB5rG2Fnqq0MO0gx4Np91sX
         9yNRop0bEX8H+mjOgSal3d/LbsWQmiWkL/0RZpEwD9Wa2vzLF9McnKf1dTrCUNsMB4aP
         zwb+zyMFlZNjVhW7ajxwZ2gP01PHaOiRE29f7NnpTKGarX5TQb9IZ1JkaLr4K/mgd1Yh
         HW+3E8BQ4ONbr+bksidGOcZ8D6pkgI0pWzks/xCCnzZEBuB/m0XbZshkFBwnYLdampeC
         HWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YUbYj7E6USUjs39a3+mImLkR+XQomQn/mwKeuuq4nEo=;
        fh=lgFWXXQWHLIPY7C+EF/pt3PgaDFoLXr5rlvw8f0KtpA=;
        b=fQXFjtIsTRK2CnLTkr7X6u3eOTET0y9XaNpYjUXNXV4Un0zR7dJ3gdLhG7WuTqJ7q7
         ycLXjOzyJh8Fleb9WhaIaq3QoKTMaYYBvxnkoBhbKkmHmFg262l1yAcLShMe1G9hNHp/
         FIwTaF2PLD1uOTsegYNvhhn5UaRc5pyxdivBb+lNeCZMRmThczqOBCefZW3Oqj34uYmt
         cOpL3M9JcH6ZkDiySYmLAF6kHYtKdnaESXzrmKEGDiSPZfKENFqpw0jSUxnGq2L/roS9
         KCxRntYmpH3f28tZvOUSnvetH6udeZGYKYJC+eQ0uEQz/NcHNK885t+E6PFBwK0WJG1l
         tRSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774281824; x=1774886624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUbYj7E6USUjs39a3+mImLkR+XQomQn/mwKeuuq4nEo=;
        b=S5nHpIeuKoHqhEfkzN/HHDnMFscZFCMA5BbSbPpAMLNXQAWE9ktlTdytognjLpIGRT
         9dMdPPVMUF/P5avjEUaB+URjj2KEF6DHzkx5D6WahYi7h+UuYv4cH0R0gdkEr7VHWZnY
         EOQGtbJgMnT1F+xmDYkzsPPfNs5Bs6wlx3wo9K7Qm6wndylWj0UjtgFcwsMuoVSHd7u3
         mNo01vB9DWvN2rzL9tdxWz8QqH7NYNIUBZwUfCnQqFYsiknTSqMGyfxKYVqBdhORNVbc
         g26f48Tl33TF3g3AT8oo/SRnqn2tdnmHqy7LKIh/AmxChTPEGJua3Pw8BeEP06V3fdPK
         1clA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281824; x=1774886624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YUbYj7E6USUjs39a3+mImLkR+XQomQn/mwKeuuq4nEo=;
        b=FOQk+N4wNWVexsMQPHp43iVPbA1hkE1WoJZeKcgD3EFJpuql9lYszLUKebae3G2zAS
         nzGPCQJ1QPSiEAniILu1Ak50jXVnsNGDwGGL88F27TnB1K+VrPoA55N75DkTtQ6PFMwA
         kc9lUU2dnsJk/tE0B/xyF7a4+FIXoaizNmmx3DD3JIeSgoF53Gh3RFv9YcimUHCIIlYZ
         UlM+Z6nJrvzMKoCxmlKKaavuiKkfuArszxHeBinEcO7w7pSw5sTQfX6t24EpamNDcmfi
         OUQ/n0qU6Bz8yQ6TzaaLspiwBZ0TO5Y+cHjv0SFHFy0suO+po7Kqv1l2YN19/8HGfgPY
         wRxA==
X-Forwarded-Encrypted: i=1; AJvYcCUpdcyfINnkYgOzk5+5grQEz05uE87Z5cRoY9NBSoViv5ZsEFF0E1b0L4P89RNSfXpOLu6ef2enVT2jRj8U@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3pos4iwRUz1ZaIsXwJqvhaZ+SysAxXYBljBm6+ZEecfxMA/YE
	pnakUwqohWsosqyNVZoU1bvq1wJ1TF98jTf7WcuGJJmcipELNeKFhuO6+TqzU/FsdfuD5hS/f2o
	B3z8MEIeJcXmOQNo6yce3ezx7OB3k5OxHFpCDjMfA0hEEmL24WtcvjMTXbZEdW1I4CluuEs2Ok/
	aC39Yv/M5bjYlyKz57LuirLU7ly74rPfGOqHT0gc3tgc4=
X-Gm-Gg: ATEYQzzwFOapRyiMvKucMJxYz/hs+mAOHh0/iKCcpTrrEJEn1LtpDVVyR+1OxXYY2eL
	YIdZD8Nyr6+08Yawmo20k2uEwzmKvsKZhKQBIRHmU/5FcZ/A42trcO96LguV5unsUFdo2ziTWEl
	gyX6suayRJfbq1pDtStRDzP3zmrM1ThkdpySt2HBarPJvfqZEbCWUJsLDbIhFZ2fW71gAfKepMd
	GE16CgLFGm/vRdkqO7jJxEU52fYsyh6TG+R6erdMxa1x94q+8DwCCJVJhVzuNZ24tkX
X-Received: by 2002:a05:6a21:6da6:b0:39b:a48e:6a77 with SMTP id adf61e73a8af0-39bceb68288mr10023597637.37.1774281823521;
        Mon, 23 Mar 2026 09:03:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da6:b0:39b:a48e:6a77 with SMTP id
 adf61e73a8af0-39bceb68288mr10023550637.37.1774281822778; Mon, 23 Mar 2026
 09:03:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-2-loic.poulain@oss.qualcomm.com> <94b415bf-9a76-4d31-add4-6283e8b43b72@kernel.org>
In-Reply-To: <94b415bf-9a76-4d31-add4-6283e8b43b72@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:03:30 +0100
X-Gm-Features: AaiRm50U5VFBZif45c0aETtJ851A03Y61IDlm_uO5C4c7JQdpnRMGomgP7_ijXI
Message-ID: <CAFEp6-3xmL4q9eSLpUZjdP5z1yCr_AJxSLmzqF70S05DK7Or1Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
        mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c16460 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dDmFx4qguRSL7zYZr80A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: quZ8KBSjekuiY31FKU-TA8jGeJMjLC0D
X-Proofpoint-GUID: quZ8KBSjekuiY31FKU-TA8jGeJMjLC0D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyMiBTYWx0ZWRfX7eYjI2Oxd4PE
 OUTDQkgKBpvW3SgCgUL7FFzwUrCCBSVfmetiQ1bfRftBJpFpFykZQ3/LX1uv2ZOBXJdrXne/0S8
 PEomL+ELvNHDo9COj97Sn6c/6xWRwa4H7LFuwZylo7PvwYTu9MccWCwB550/ZmFlPhnek+GwsXP
 gNAoHE9vRCRedqJt6zmSFJRi+AFORiIeu66Z3KGc9Ie56k9bmVzF063lAmCw1kAie+MnAlz+hT9
 OOOSa/CrmxLUn024SWRxuFmumwpF628FKeXkqKL4PYha3jqumd6DIwDz+2jb7gEHbSebeIZfMLw
 UNyDYGP0TnVRifA3IOZYF2mxbMFhor8jPQFlmckNnseOFcRWVbfu7dddJPqzO8KZur3e3e1PRo4
 G4KaNoo3ildasW6mmoCGDOlKNOYORk+fLmTthLgN+TFs+GG0WqVg6pV3Ql6+2j/x9Np5Ykvinp+
 WB+Mjua049orpLzdKoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230122
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99343-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DA7812F93E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Mon, Mar 23, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/03/2026 13:58, Loic Poulain wrote:
> > Add Devicetree binding documentation for the Qualcomm Camera Subsystem
> > Offline Processing Engine (OPE) found on platforms such as Agatti.
> > The OPE is a memory-to-memory image processing block which operates
> > on frames read from and written back to system memory.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> I don't see explanation in cover letter why this is RFC, so I assume
> this is not ready, thus not a full review but just few nits to spare you
> resubmits later when this becomes reviewable.
>
> > ---
> >  .../bindings/media/qcom,camss-ope.yaml        | 86 +++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/qcom,camss-=
ope.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/qcom,camss-ope.yam=
l b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
> > new file mode 100644
> > index 000000000000..509b4e89a88a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
>
> Filename must match compatible.

Some bindings (for example clock/qcom,mmcc.yaml) do not strictly
follow this rule and instead use a more generic filename that groups
multiple device-specific compatibles. I mention this because my
intention with a generic filename was to allow the binding to cover
additional compatibles in the future.

As I understand it, in the current state I should either:
- rename the file so that it matches the specific compatible, e.g.
qcom,qcm2290-camss-ope.yaml, or
- keep the generic filename (qcom,camss-ope.yaml) and add a top-level
const: qcom,camss-ope compatible to justify the generic naming.

Any preferred/valid direction?

>
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
>
> ...
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - interconnects
> > +  - interconnect-names
> > +  - iommus
> > +  - power-domains
> > +  - power-domain-names
> > +
> > +additionalProperties: true
>
> There are no bindings like that. You cannot have here true.

ok.

>
> Also, lack of example is a no-go.

Ouch, yes. Would it make sense to have dt_binding_check catch this
kind of issue?

>
> BTW, also remember about proper versioning of your patchset. b4 would do
> that for you, but since you did not use it, you must handle it.

ack.

