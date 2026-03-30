Return-Path: <linux-arm-msm+bounces-100911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLAiDO7xymkkBQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 23:58:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B83361AAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 23:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57696304B019
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3453112C1;
	Mon, 30 Mar 2026 21:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFAXvZzt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95433A759C
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774907537; cv=pass; b=rOL9aixnxHsToLlZKHpr3mYz0moQheRrCOTCJNCUckiTPiAizgJxYDPVFzDTByZgkMhWr6LyNoZBSLnqe1inOc9sb4jp0DifBrX8N0tEgVsJ7KmR7SPtBgE72vtVj0Xx5yxe0tbgTroIUF231+cmRtqRAKdIraYQBwyDHA5LxQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774907537; c=relaxed/simple;
	bh=5skPz+dm2mJPiqcIC/IzeT131Uv9zufab/KpZFE9+b8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAIS5ncyd1f97m4zoWjpXDqvMcTzLHyzPcKQX0jbBkSNWku0+ZSXcxigZFOq0ZEoHCvLBfdgktueRPQ1+d8sYOHcy9IHCymCtCu5EEtdNmJPeFXezrMhzSd4zE9EMKg+mYFVAn6GoIar2jBr7uT83J0o8Hzm0m9M9/4UTchYkc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFAXvZzt; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2a8abac7dso3577078e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774907533; cv=none;
        d=google.com; s=arc-20240605;
        b=Q5VM+T6LoG5DQoAJIaCojZcSRxvMrHxzRUV7qmyMvnJ9i49PnTM95xmVOcmtjtahRJ
         teyWErQSsKq0ScD2ikgIcCos9sUtfJtTnvs+QIRvepUMO0gn5a7uJUiJD8OC3hpYbWHY
         c7gV148kcyGdNcxjKBJfVlk4AuBk+dGaXihKC2SSoyMGlhvNiPzsdLVpVZBShVq+WtVb
         5PnwxjbyG1dzWyAftV2gPFIxc/d4gkpE0/MkCr+nF/XE1tOoxlrATuXeP7Uk3LNff/Bn
         BGKy2txrFiIHbGugWN+Tc+tYpntOKKvNuw3/Ja4W8g1FkWBc5/NtBC7G6DGGNLajuM2z
         oKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SG2By7SJ8ahbrRksQlxh1xlnOX6AJjd7EKuFZuGmfS4=;
        fh=p71LKv/hjIfUzmVYBVVRNugvRsHSvSPMW0b6sZKMy/E=;
        b=lsJsWm3ay7fwlgj3wjBvxinCVLAwKnDxufPT5bqZzsdEuxEMahePqUE1yrCLrbyGSh
         UeetqiDgzuayIcVyYam15dddmcmZcBYi5icQDAd10hmmLBGvcZB7OINtplI2x10QlouS
         Ys6zWfH/0YGWDgl18QvL8Ky48/BKYlEsO+8+ib4F4az68z/SwrE9VEwFgI7jb6jaecUl
         QbOgjY94lzXNkzQBKc7d0LfC6b61bTzNcrn07gXKqDi1Dea5KWKF9079IG0tk3wJ+82C
         OBIr6D1Vta9tt9nbOml7qFYha85DTXeVfnp6RPSDOufZi4/M4gSQTRso/mxT2Miz3BjH
         10cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774907533; x=1775512333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SG2By7SJ8ahbrRksQlxh1xlnOX6AJjd7EKuFZuGmfS4=;
        b=GFAXvZzt9SUl7DheUeJFgL5OOpLHwxuma/KAx5OPZc+E60nJF2slbPnC/2PsU6B8u4
         OQT6nOClaY+f3WrqZ0gEipPG1cseEgygX3bY1VEdyTWN9C8OzCCZL/2whwHC70Dxn4Zv
         eKoOOqBx/kDcn7bN34c1G7Eirt4BhHw+Wg4usMVCvASmfLw4p3yhoeFAg9RGZLQjfiIK
         timtpSNe+39JC4/J8HYe6gSEWRo34eQijxitVE6dFf+xAwyzreHUHLP1Vao28eGip8tO
         hHX/62piJwBBd6LVPvNNH/cb8Z8NUYVG2Axv/2Y0okCz55HsNMD9m03ksRJ2zCm95fgK
         oRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907533; x=1775512333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SG2By7SJ8ahbrRksQlxh1xlnOX6AJjd7EKuFZuGmfS4=;
        b=cxMQljx0hdBDCkP3giyFIFdPvgJ1P1DmxioyDQMHWnetfKTm7OFue2UjePxmyHWPbR
         OXS4MZlyVxt777bs90uNSJsmIS2VvxVTh8lnDBe2Rk9Y56Z/ZceBczSo78OHl5l0O5Ml
         kRgbM4jeUtYZXdpM6fdLcXWdN0zO8wRadE3awHSY9Z9hE5ZhJpDI1JvuRe1WUv79MLl2
         1JXiS5eMp6mqMALKKA4EkZhl6/4+qxW4pe3Zf+BA+G53rrtpkY2hNEjRwl3RwtJhmbHN
         4rHpex5alQTX/UhkJhRb7mCYk5tmeyOTD8Of4HoJyovFM2yJAeFswTTNNH8KbS1CyhDW
         GjVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0spL9GLVDk4bxHHUBaTI+7X6k6cm9/TUcdunOkHspX6tEuyTUVCqzBOzNJXJ7LKHoszE2keo+K4Mo27Yx@vger.kernel.org
X-Gm-Message-State: AOJu0YylEhfZg0X4VbVzuR+/+QUg0N1UI2my8iUmtApJOT9NqiyO7ALY
	D6B4egu0OyQBzqBkWPSVfAYd+WZaqnxCi+oc3TgAxmftUH4GCHG00lixb8DvapQ0qoZISZ726F7
	ogucH3GmcyJtJ7AEK1hMqPr/oJi8j8K0=
X-Gm-Gg: ATEYQzz8jHacWLRV/NNTkC/qXhMJaj7c3h7Jo1hvDJmRaUeMCSrvvMEa/zNVQ9uEm8T
	qoK/Oy15+oe5R2gY5zDhKiP62VQXThRBESaEOzpy8k0WJU4qCZ2mLoo6FtyPYo0Pdv3wOIG3Rf0
	cxIxC72r2tAAMIahS0hxBKcNbBvaOi0/xumx7sBN8QacWT8X7BmuminXdZMp3edqd3bXc02b+0P
	Hz1wEyWwuoiRpSBYB/F2CdWEU8NuxVH4tnzqC4mIbKSEnVG0dDrNkYPLSiGvxZGlo7z2xVyG0Na
	NiNrLikMVtRJX0z7WxRsD7VE9qfQiNn/M+RCifrJSkiiYCO3NJxksNixIDHw7SNYZi2I
X-Received: by 2002:a05:6512:3b07:b0:5a2:a70a:a87 with SMTP id
 2adb3069b0e04-5a2ab5fe37amr4693752e87.4.1774907532840; Mon, 30 Mar 2026
 14:52:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-sm8550-ddr-bw-scaling-v3-0-75c19152e921@gmail.com>
 <20260219-sm8550-ddr-bw-scaling-v3-2-75c19152e921@gmail.com> <acqJWzQHi7ajuzml@baldur>
In-Reply-To: <acqJWzQHi7ajuzml@baldur>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 30 Mar 2026 16:52:00 -0500
X-Gm-Features: AQROBzBSprTm678Bpr5Zg3Zy6uWh15uCsDK4vtL0BXfr7GyuKBhCujxCY7eJ2iE
Message-ID: <CALHNRZ-tOk7m+JJLU3gm=bM-VMP1LCdcNQUUhHBPsbbQ-mW94g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8550: add cpu OPP table with
 DDR, LLCC & L3 bandwidths
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100911-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 41B83361AAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 9:33=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Thu, Feb 19, 2026 at 10:07:40PM -0600, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Add the OPP tables for each CPU clusters (cpu0-1-2, cpu3-4-5-6 & cpu7)
> > to permit scaling the Last Level Cache Controller (LLCC), DDR and L3 ca=
che
> > frequency by aggregating bandwidth requests of all CPU core with refere=
nc
> > to the current OPP they are configured in by the LMH/EPSS hardware.
> >
> > The effect is a proper caches & DDR frequency scaling when CPU cores
> > changes frequency.
> >
> > The OPP tables were built using the downstream memlat ddr, llcc & l3
> > tables for each cluster types with the actual EPSS cpufreq LUT tables
> > from running a QCS8550 device.
> >
> > Also add the OSC L3 Cache controller node.
> >
> > Also add the interconnect entry for each cpu, with 3 different paths:
> > - CPU to Last Level Cache Controller (LLCC)
> > - Last Level Cache Controller (LLCC) to DDR
> > - L3 Cache from CPU to DDR interface
> >
>
> "8 out of 11 hunks FAILED", it seems things moved since you wrote this.
> Can you please help me by rebasing this onto linux-next and resubmitting
> it?

This was a conflict from the EAS patch. I have sent a new revision
rebased on today's -next.

Aaron

> Regards,
> Bjorn
>
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8550.dtsi | 367 +++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 367 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts=
/qcom/sm8550.dtsi
> > index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..de4d43f7b8d2416997db70c=
98b0fc36d25f3c2a6 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > @@ -17,6 +17,7 @@
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/interconnect/qcom,icc.h>
> >  #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
> > +#include <dt-bindings/interconnect/qcom,osm-l3.h>
> >  #include <dt-bindings/mailbox/qcom-ipcc.h>
> >  #include <dt-bindings/power/qcom-rpmpd.h>
> >  #include <dt-bindings/power/qcom,rpmhpd.h>
> > @@ -78,6 +79,13 @@ cpu0: cpu@0 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 0>;
> >                       capacity-dmips-mhz =3D <1024>;
> >                       dynamic-power-coefficient =3D <100>;
> > +                     operating-points-v2 =3D <&cpu0_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_0: l2-cache {
> >                               compatible =3D "cache";
> > @@ -104,6 +112,13 @@ cpu1: cpu@100 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 0>;
> >                       capacity-dmips-mhz =3D <1024>;
> >                       dynamic-power-coefficient =3D <100>;
> > +                     operating-points-v2 =3D <&cpu0_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_100: l2-cache {
> >                               compatible =3D "cache";
> > @@ -125,6 +140,13 @@ cpu2: cpu@200 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 0>;
> >                       capacity-dmips-mhz =3D <1024>;
> >                       dynamic-power-coefficient =3D <100>;
> > +                     operating-points-v2 =3D <&cpu0_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_200: l2-cache {
> >                               compatible =3D "cache";
> > @@ -146,6 +168,13 @@ cpu3: cpu@300 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 1>;
> >                       capacity-dmips-mhz =3D <1792>;
> >                       dynamic-power-coefficient =3D <270>;
> > +                     operating-points-v2 =3D <&cpu3_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_300: l2-cache {
> >                               compatible =3D "cache";
> > @@ -167,6 +196,13 @@ cpu4: cpu@400 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 1>;
> >                       capacity-dmips-mhz =3D <1792>;
> >                       dynamic-power-coefficient =3D <270>;
> > +                     operating-points-v2 =3D <&cpu3_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_400: l2-cache {
> >                               compatible =3D "cache";
> > @@ -188,6 +224,13 @@ cpu5: cpu@500 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 1>;
> >                       capacity-dmips-mhz =3D <1792>;
> >                       dynamic-power-coefficient =3D <270>;
> > +                     operating-points-v2 =3D <&cpu3_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_500: l2-cache {
> >                               compatible =3D "cache";
> > @@ -209,6 +252,13 @@ cpu6: cpu@600 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 1>;
> >                       capacity-dmips-mhz =3D <1792>;
> >                       dynamic-power-coefficient =3D <270>;
> > +                     operating-points-v2 =3D <&cpu3_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_600: l2-cache {
> >                               compatible =3D "cache";
> > @@ -230,6 +280,13 @@ cpu7: cpu@700 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 2>;
> >                       capacity-dmips-mhz =3D <1894>;
> >                       dynamic-power-coefficient =3D <588>;
> > +                     operating-points-v2 =3D <&cpu7_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_700: l2-cache {
> >                               compatible =3D "cache";
> > @@ -397,6 +454,306 @@ memory@a0000000 {
> >               reg =3D <0 0xa0000000 0 0>;
> >       };
> >
> > +     cpu0_opp_table: opp-table-cpu0 {
> > +             compatible =3D "operating-points-v2";
> > +             opp-shared;
> > +
> > +             opp-307200000 {
> > +                     opp-hz =3D /bits/ 64 <307200000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (30=
7200 * 32)>;
> > +             };
> > +
> > +             opp-441600000 {
> > +                     opp-hz =3D /bits/ 64 <441600000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (38=
4000 * 32)>;
> > +             };
> > +
> > +             opp-556800000 {
> > +                     opp-hz =3D /bits/ 64 <556800000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (49=
9200 * 32)>;
> > +             };
> > +
> > +             opp-672000000 {
> > +                     opp-hz =3D /bits/ 64 <672000000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (49=
9200 * 32)>;
> > +             };
> > +
> > +             opp-787200000 {
> > +                     opp-hz =3D /bits/ 64 <787200000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (72=
9600 * 32)>;
> > +             };
> > +
> > +             opp-902400000 {
> > +                     opp-hz =3D /bits/ 64 <902400000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (84=
4800 * 32)>;
> > +             };
> > +
> > +             opp-1017600000 {
> > +                     opp-hz =3D /bits/ 64 <1017600000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (94=
0800 * 32)>;
> > +             };
> > +
> > +             opp-1113600000 {
> > +                     opp-hz =3D /bits/ 64 <1113600000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (10=
56000 * 32)>;
> > +             };
> > +
> > +             opp-1228800000 {
> > +                     opp-hz =3D /bits/ 64 <1228800000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (11=
52000 * 32)>;
> > +             };
> > +
> > +             opp-1344000000 {
> > +                     opp-hz =3D /bits/ 64 <1344000000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (12=
67200 * 32)>;
> > +             };
> > +
> > +             opp-1459200000 {
> > +                     opp-hz =3D /bits/ 64 <1459200000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (12=
67200 * 32)>;
> > +             };
> > +
> > +             opp-1555200000 {
> > +                     opp-hz =3D /bits/ 64 <1555200000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (768000 * 4) (14=
78400 * 32)>;
> > +             };
> > +
> > +             opp-1670400000 {
> > +                     opp-hz =3D /bits/ 64 <1670400000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (768000 * 4) (14=
78400 * 32)>;
> > +             };
> > +
> > +             opp-1785600000 {
> > +                     opp-hz =3D /bits/ 64 <1785600000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (768000 * 4) (14=
78400 * 32)>;
> > +             };
> > +
> > +             opp-1900800000 {
> > +                     opp-hz =3D /bits/ 64 <1900800000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (768000 * 4) (16=
89600 * 32)>;
> > +             };
> > +
> > +             opp-2016000000 {
> > +                     opp-hz =3D /bits/ 64 <2016000000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1555000 * 4) (1=
804800 * 32)>;
> > +             };
> > +     };
> > +
> > +     cpu3_opp_table: opp-table-cpu3 {
> > +             compatible =3D "operating-points-v2";
> > +             opp-shared;
> > +
> > +             opp-499200000 {
> > +                     opp-hz =3D /bits/ 64 <499200000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (30=
7200 * 32)>;
> > +             };
> > +
> > +             opp-614400000 {
> > +                     opp-hz =3D /bits/ 64 <614400000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (49=
9200 * 32)>;
> > +             };
> > +
> > +             opp-729600000 {
> > +                     opp-hz =3D /bits/ 64 <729600000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (49=
9200 * 32)>;
> > +             };
> > +
> > +             opp-844800000 {
> > +                     opp-hz =3D /bits/ 64 <844800000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (49=
9200 * 32)>;
> > +             };
> > +
> > +             opp-940800000 {
> > +                     opp-hz =3D /bits/ 64 <940800000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (768000 * 4) (72=
9600 * 32)>;
> > +             };
> > +
> > +             opp-1056000000 {
> > +                     opp-hz =3D /bits/ 64 <1056000000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (768000 * 4) (72=
9600 * 32)>;
> > +             };
> > +
> > +             opp-1171200000 {
> > +                     opp-hz =3D /bits/ 64 <1171200000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (1555000 * 4) (9=
40800 * 32)>;
> > +             };
> > +
> > +             opp-1286400000 {
> > +                     opp-hz =3D /bits/ 64 <1286400000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (1555000 * 4) (9=
40800 * 32)>;
> > +             };
> > +
> > +             opp-1401600000 {
> > +                     opp-hz =3D /bits/ 64 <1401600000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
056000 * 32)>;
> > +             };
> > +
> > +             opp-1536000000 {
> > +                     opp-hz =3D /bits/ 64 <1536000000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
056000 * 32)>;
> > +             };
> > +
> > +             opp-1651200000 {
> > +                     opp-hz =3D /bits/ 64 <1651200000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
267200 * 32)>;
> > +             };
> > +
> > +             opp-1785600000 {
> > +                     opp-hz =3D /bits/ 64 <1785600000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
267200 * 32)>;
> > +             };
> > +
> > +             opp-1920000000 {
> > +                     opp-hz =3D /bits/ 64 <1920000000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
267200 * 32)>;
> > +             };
> > +
> > +             opp-2054400000 {
> > +                     opp-hz =3D /bits/ 64 <2054400000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2188800000 {
> > +                     opp-hz =3D /bits/ 64 <2188800000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2323200000 {
> > +                     opp-hz =3D /bits/ 64 <2323200000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2457600000 {
> > +                     opp-hz =3D /bits/ 64 <2457600000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2592000000 {
> > +                     opp-hz =3D /bits/ 64 <2592000000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2707200000 {
> > +                     opp-hz =3D /bits/ 64 <2707200000>;
> > +                     opp-peak-kBps =3D <(933000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2803200000 {
> > +                     opp-hz =3D /bits/ 64 <2803200000>;
> > +                     opp-peak-kBps =3D <(933000 * 16) (3686000 * 4) (1=
689600 * 32)>;
> > +             };
> > +     };
> > +
> > +     cpu7_opp_table: opp-table-cpu7 {
> > +             compatible =3D "operating-points-v2";
> > +             opp-shared;
> > +
> > +             opp-595200000 {
> > +                     opp-hz =3D /bits/ 64 <595200000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (30=
7200 * 32)>;
> > +             };
> > +
> > +             opp-729600000 {
> > +                     opp-hz =3D /bits/ 64 <729600000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (49=
9200 * 32)>;
> > +             };
> > +
> > +             opp-864000000 {
> > +                     opp-hz =3D /bits/ 64 <864000000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (49=
9200 * 32)>;
> > +             };
> > +
> > +             opp-998400000 {
> > +                     opp-hz =3D /bits/ 64 <998400000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (768000 * 4) (72=
9600 * 32)>;
> > +             };
> > +
> > +             opp-1132800000 {
> > +                     opp-hz =3D /bits/ 64 <1132800000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (768000 * 4) (72=
9600 * 32)>;
> > +             };
> > +
> > +             opp-1248000000 {
> > +                     opp-hz =3D /bits/ 64 <1248000000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (1555000 * 4) (9=
40800 * 32)>;
> > +             };
> > +
> > +             opp-1363200000 {
> > +                     opp-hz =3D /bits/ 64 <1363200000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (1555000 * 4) (9=
40800 * 32)>;
> > +             };
> > +
> > +             opp-1478400000 {
> > +                     opp-hz =3D /bits/ 64 <1478400000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
056000 * 32)>;
> > +             };
> > +
> > +             opp-1593600000 {
> > +                     opp-hz =3D /bits/ 64 <1593600000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
056000 * 32)>;
> > +             };
> > +
> > +             opp-1708800000 {
> > +                     opp-hz =3D /bits/ 64 <1708800000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
267200 * 32)>;
> > +             };
> > +
> > +             opp-1843200000 {
> > +                     opp-hz =3D /bits/ 64 <1843200000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
267200 * 32)>;
> > +             };
> > +
> > +             opp-1977600000 {
> > +                     opp-hz =3D /bits/ 64 <1977600000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
267200 * 32)>;
> > +             };
> > +
> > +             opp-2092800000 {
> > +                     opp-hz =3D /bits/ 64 <2092800000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2227200000 {
> > +                     opp-hz =3D /bits/ 64 <2227200000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2342400000 {
> > +                     opp-hz =3D /bits/ 64 <2342400000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2476800000 {
> > +                     opp-hz =3D /bits/ 64 <2476800000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2592000000 {
> > +                     opp-hz =3D /bits/ 64 <2592000000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2726400000 {
> > +                     opp-hz =3D /bits/ 64 <2726400000>;
> > +                     opp-peak-kBps =3D <(933000 * 16) (3686000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2841600000 {
> > +                     opp-hz =3D /bits/ 64 <2841600000>;
> > +                     opp-peak-kBps =3D <(933000 * 16) (3686000 * 4) (1=
689600 * 32)>;
> > +             };
> > +
> > +             opp-2956800000 {
> > +                     opp-hz =3D /bits/ 64 <2956800000>;
> > +                     opp-peak-kBps =3D <(933000 * 16) (3686000 * 4) (1=
689600 * 32)>;
> > +             };
> > +
> > +             opp-3187200000 {
> > +                     opp-hz =3D /bits/ 64 <3187200000>;
> > +                     opp-peak-kBps =3D <(933000 * 16) (3686000 * 4) (1=
689600 * 32)>;
> > +             };
> > +     };
> > +
> >       pmu-a510 {
> >               compatible =3D "arm,cortex-a510-pmu";
> >               interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster=
0>;
> > @@ -5437,6 +5794,16 @@ rpmhpd_opp_turbo_l1: opp-416 {
> >                       };
> >               };
> >
> > +             epss_l3: interconnect@17d90000 {
> > +                     compatible =3D "qcom,sm8550-epss-l3", "qcom,epss-=
l3";
> > +                     reg =3D <0 0x17d90000 0 0x1000>;
> > +
> > +                     clocks =3D <&bi_tcxo_div2>, <&gcc GCC_GPLL0>;
> > +                     clock-names =3D "xo", "alternate";
> > +
> > +                     #interconnect-cells =3D <1>;
> > +             };
> > +
> >               cpufreq_hw: cpufreq@17d91000 {
> >                       compatible =3D "qcom,sm8550-cpufreq-epss", "qcom,=
cpufreq-epss";
> >                       reg =3D <0 0x17d91000 0 0x1000>,
> >
> > --
> > 2.52.0
> >
> >

