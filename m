Return-Path: <linux-arm-msm+bounces-100587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JwUBMsPyyGm2sgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:37:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EBD351680
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A311E30125E6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 09:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9FC2E2DF2;
	Sun, 29 Mar 2026 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pHhOecos"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E802D5A01;
	Sun, 29 Mar 2026 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774777024; cv=none; b=IqBRgXN66JBmlWqWBq2eUYukffD67+5tWQJlz3cUPkyVIlHFuXv0TeT0Fj6R8qE/+tQ9phzh1cYxQ6vUQwsClPPVCvO/x4RFNMXS1w+9ETjEBAWN72Bse5zm6gPzKwgBFFSSccfaN69Os5NG7Hi/fXDFt1yK3YxOncX5R08b4cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774777024; c=relaxed/simple;
	bh=38BTjpQcax0ZCYP1lDp/Ft2uW0t+mkFokRZ+7qkz5dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HX+p2imIiyDKvsGxGp6iRyrG6R78Rk/d9/+bFMAluANp3lY7MMzI01TeqxQ3isioGBJBAU2YKHCnpKSUU+43u8vAoTvqWVzEIcfwGJMXgXaRf3R+Nl2tQkLJAU36afBqKeoQBnys8kKZB9H47Mz+RryqK3Igb9/frefp0GI1yi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pHhOecos; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C841CC116C6;
	Sun, 29 Mar 2026 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774777024;
	bh=38BTjpQcax0ZCYP1lDp/Ft2uW0t+mkFokRZ+7qkz5dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pHhOecosjfc3lVzDyF1HmyndhSnr6ABorhtITFMZinGi0JiiT0+SnHodMYnZz2XJC
	 qn4PKDSiYL5brBuGCdWCSAtH9JLmxAZoQHP0Nss4jueuA31DDVNYe7alkfaS1LYPvj
	 186fr+qJRtBUZXt5yyQ+IFuqsw917jOc5eblHhpoJDsSj+Q6erd3MpHQ058B7Z8OsI
	 mMlLiZydqQs//OOngsi3OA10H54WYBGCNKGVkG/6i36vFNBoUkT2DISrUqw6QurhdZ
	 fQeBpp3dVHXD9HAmbdL+UiluSlZ/iXYSu73BbtkaRXbU/zFnzEcMEJeoBvBqtm6nMG
	 oOBj16+EsvfeA==
Date: Sun, 29 Mar 2026 11:37:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: power: qcom-rpmpd: Split MSM8953 and
 SDM632
Message-ID: <20260329-romantic-daft-myna-df3dfa@quoll>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-1-6098dc997d66@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260327-sdm632-rpmpd-v1-1-6098dc997d66@mainlining.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100587-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19EBD351680
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:11:43PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Remove modem related bindings from MSM8953 rpmpd because MSM8953 MSS
> is using mss-supply as a regulator usually it is pm8953_s1.
> Split SDM632 bindings from MSM8953 because SDM632 is using mss-supply
> as a pm domain.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.yaml        |  1 +
>  include/dt-bindings/power/qcom-rpmpd.h               | 20 +++++++++++++-=
------
>  2 files changed, 14 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Do=
cumentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 8174ceeab572..659936d6a46e 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -48,6 +48,7 @@ properties:
>            - qcom,sc7280-rpmhpd
>            - qcom,sc8180x-rpmhpd
>            - qcom,sc8280xp-rpmhpd
> +          - qcom,sdm632-rpmpd
>            - qcom,sdm660-rpmpd
>            - qcom,sdm670-rpmhpd
>            - qcom,sdm845-rpmhpd
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings=
/power/qcom-rpmpd.h
> index 4371ac941f29..2d82434b993c 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -84,13 +84,11 @@
>  #define QM215_VDDMX_AO		MSM8917_VDDMX_AO
> =20
>  /* MSM8953 Power Domain Indexes */
> -#define MSM8953_VDDMD		0

ABI break / impact and due to two changes combined I don't really
understand why. Why MSS using mss-supply makes this ABI invalid/wrong?

> -#define MSM8953_VDDMD_AO	1
> -#define MSM8953_VDDCX		2
> -#define MSM8953_VDDCX_AO	3
> -#define MSM8953_VDDCX_VFL	4
> -#define MSM8953_VDDMX		5
> -#define MSM8953_VDDMX_AO	6
> +#define MSM8953_VDDCX		RPMPD_VDDCX
> +#define MSM8953_VDDCX_AO	RPMPD_VDDCX_AO
> +#define MSM8953_VDDCX_VFL	RPMPD_VDDCX_VFL
> +#define MSM8953_VDDMX		RPMPD_VDDMX
> +#define MSM8953_VDDMX_AO	RPMPD_VDDMX_AO

I don't see how this is related to new compatible and SDM632.

> =20
>  /* MSM8974 Power Domain Indexes */
>  #define MSM8974_VDDCX		0
> @@ -156,6 +154,14 @@
>  #define QCS404_LPIMX		5
>  #define QCS404_LPIMX_VFL	6

Best regards,
Krzysztof


