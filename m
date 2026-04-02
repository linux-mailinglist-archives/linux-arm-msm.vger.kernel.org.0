Return-Path: <linux-arm-msm+bounces-101569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGVFDkWdzmnfowYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 18:45:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A3338C218
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 18:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF9813004277
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 16:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0695433FE2F;
	Thu,  2 Apr 2026 16:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ZjGc7gPJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786BF3A4F2C
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 16:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147786; cv=none; b=YGx4LLX3WsDxO5Wf+bQAXd2ULCAzMnlhquEZeBk33p5ydMfe2YFYJnvrHY5QVIU31WOkrihjqsP84QntlUTxXvelEAeCzScRDzw+TCLA7Llx4f5/mQCpFmgcys7WAGk9Kluont4oOSuCW1oNEoJ1PwWsA4AobRhCqZ9/PbFqwGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147786; c=relaxed/simple;
	bh=BJmXu2eeldUCVlQvz/WrlC7RkHJmYBwjj/3aQLS0gQc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LxXjCBpybe9JQzBwQazu16A253Ir81LMris/fVTsWXes80pVfNfjoU++eIFdiypUFVTvVHNTuu1GTySmMjU/7cP1jwAa+22rgSDYg43jAx1+5QWcYV2/u8ul74nApkTV8HcaOy1568x91lk5W60v5p1dTZd9v/NchAc58Hd+n8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ZjGc7gPJ; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775147777; x=1775406977;
	bh=7A5KjAmYV7XjxwFzAz+Gu1zpdCKkT5ACIwBJxXrfzmU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZjGc7gPJQwjhROunTaMcWSkai0CpMs053PXGNoKZLTeOykC5fYp/CPEQOcicDzK09
	 bcqIszQTneJiFQHdaVtJaJ00VpOSxTwV/hSewDU5d60ohbSsOA4RCWWvVSAP/litwm
	 C+obpeBdVrL8oPoS2hMabZrAG6gq5ky+J2ABuN0FN7jUiQdfXRpSVQA/TMeFfbm/d6
	 +E6sqITdoXkEcz3c4E+5vP+kgnCIBKHCTg7Es8czklUvX29OYfDLwpTVEwEVayYwh0
	 mVaqp6hk/h5pQlxW5n36MaZ1VcfvO2jyrSrsQqlOoXCX9YiOf/5y+H+kG0VlIH9xKu
	 ljCUJqgSXiM/g==
Date: Thu, 02 Apr 2026 16:36:10 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU nodes
Message-ID: <_oKtywl2hPElduEp5xQuU-pvfR8_24TNztuXf3Il3DaaddUmg04Z27u2uYnUtox8G44_zuniSoDZTSJMMW44-HNTXLFJkKCjslAeEe96u9Y=@pm.me>
In-Reply-To: <182d58c1-21fb-4cab-8ce7-26f07d63d246@kernel.org>
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me> <20260331-adreno-810-v1-6-725801dbb12b@pm.me> <20260402-military-arrogant-woodpecker-4ab9b5@quoll> <182d58c1-21fb-4cab-8ce7-26f07d63d246@kernel.org>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 64f2696b295c5bd3bf39079b8ba9b6a975e446ee
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101569-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,fairphone.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: A0A3338C218
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thursday, April 2nd, 2026 at 4:22 AM, Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:

> On 02/04/2026 10:19, Krzysztof Kozlowski wrote:
> > On Wed, Apr 01, 2026 at 02:17:44AM +0000, Alexander Koskovich wrote:
> >> Add GPU and GMU devicetree nodes for the Adreno 810 GPU found on
> >> Qualcomm SM7635 (Milos) based devices.
> >>
> >> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> >> ---
> >>  arch/arm64/boot/dts/qcom/milos.dtsi | 148 +++++++++++++++++++++++++++=
+++++++++
> >>  1 file changed, 148 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts=
/qcom/milos.dtsi
> >> index 621f05820826..a8feb0339804 100644
> >> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> >> @@ -7,6 +7,7 @@
> >>  #include <dt-bindings/clock/qcom,milos-dispcc.h>
> >>  #include <dt-bindings/clock/qcom,milos-gcc.h>
> >>  #include <dt-bindings/clock/qcom,milos-gpucc.h>
> >> +#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
> >
> > Why? My next from 27th Match does not have Milos in that binding. Was i=
t
> > added? It's worth mentioning in commit msg.
> >
>=20
> Now I checked in the cover letter - that patch was rejected. You cannot
> depend on rejected patch and still claim that this patchset is ready for
> merging. This patchset should be somehow marked that it depends on stuff
> which is wrong, usually I recommend marking it as RFC with explanation
> in cover letter WHY this is RFC (because it cannot be merged).

I don't see where the gxclkctl milos patch was rejected, there were some mi=
nor
comments that need to be addressed in a v2 though, is that what you mean by=
 it
being rejected?

Will just mark v2 of this series as RFC.

>=20
> Best regards,
> Krzysztof
>=20

Thanks,
Alex

