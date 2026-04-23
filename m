Return-Path: <linux-arm-msm+bounces-104322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KlsGlEN6mn4sgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:15:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A625D451D6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DEE230E6E79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134F13783B1;
	Thu, 23 Apr 2026 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebeN/1N7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C73EBF03
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946109; cv=none; b=LoV3qeazbHV6UbIWdOl4kgPLpVRYsV3KOU318eYOiCsDkkOQYQaKQG8MRt3hRnDg5HQfFiUFWnYOauQrNoU0BdTmcsZZL5DpydvqCh2mQ6Lmvfy/Nx7SNii2af8zYL45TuCxAhkSCbrE+kCupAwPHgD42ZLADgfgJ9FYoSRAgH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946109; c=relaxed/simple;
	bh=BfONIHy16Ipxg1IXnNR9yugmB457uA3kR5bfe4zDonc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7r8GC0sTGLQ0IJVYMRgHa+XW0n06uhYjtyh+1YNmalL83vVDyKD7r6I9FfAeJxUFVt2MNlFljXK/oRL1U1t2C2/pgHuTvHdH0bLlBDvXLCdT/h0k4yZGRAGAqD+tvBXCM5B/XWhHbGv0OCo5twiZVrZR0PLlxzjsNwIynpY0QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebeN/1N7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8833FC2BCC7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776946108;
	bh=BfONIHy16Ipxg1IXnNR9yugmB457uA3kR5bfe4zDonc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ebeN/1N7ceT4R8As5sBeYi2hTFPtWgc7sh1c5egzwCvdx6+V/Cl8sUDYrvMPLFpqA
	 EKZ/zmXslzcItu/SwnWE+9hQesQh6X/QsbBks1YJ9AWZuqhjCMrtRsdJT/vRmwXkd5
	 zMm4eiX1V9k+5Sb0VH4rMWIKWgUNiglivVaaQLlfrupyq7DoOoshmDluHMn0k4A0ob
	 0Kl8kgkbsP9rxgrfksuQpNBLLNofKEvgDocZ+W8eQCMUe12S+lPZ+wdodsWGSkZC73
	 IT7oA4aug+3lbkfq+sLoR94xP5IIsNXd1Mi6/4G+NHyYpHV2QVAqXWzF7o2HD5TyxN
	 wSiENfVIFsRkQ==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-676d8582a13so4217793a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:08:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8R/kjGkJcMFvaV1BavS8jX2/szTapxU8HE1Y8mjhz2164NxNHfEOB1N3whrL0wWZKw3ro4cUGMs6eFwuNB@vger.kernel.org
X-Gm-Message-State: AOJu0YxO5iC/ltEVpkMA7haUwTC4kJsF9PNfQxLqx6QSwjwW8ErJoNtA
	n6bM5Ndja0cKZzv+y0BgWlYbyLaNsFimJZb6yobflM2+6TjWAIOcHzPTC4OocE2V3WAdnXoB8oU
	1mSr71IyXtIzv0sFggWUD7jWKnf+rYQ==
X-Received: by 2002:a05:6402:234f:b0:676:9caa:f070 with SMTP id
 4fb4d7f45d1cf-6769caaf0ecmr5743709a12.14.1776946106998; Thu, 23 Apr 2026
 05:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com> <aen9U_3jMRagJwgp@QCOM-aGQu4IUr3Y>
In-Reply-To: <aen9U_3jMRagJwgp@QCOM-aGQu4IUr3Y>
From: Rob Herring <robh@kernel.org>
Date: Thu, 23 Apr 2026 07:08:15 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+2oJF4GG=PDsW1y6Cz7-+Qp2DUz1jXEXxD54PoO9zRRQ@mail.gmail.com>
X-Gm-Features: AQROBzDOEHYMcP_fobtmzNWkOna3yytzRuWeEAsjmBv9P_klDeF0bmBrntE6rjs
Message-ID: <CAL_Jsq+2oJF4GG=PDsW1y6Cz7-+Qp2DUz1jXEXxD54PoO9zRRQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: qcom: geni-se-qup: Add compatible for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Praveen Talari <quic_ptalari@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104322-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A625D451D6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 6:07=E2=80=AFAM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:
>
> On Mon, Apr 20, 2026 at 02:44:01PM +0800, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> >
> > Add compatibles for GENI Serial Engine QUP Wrapper Controller on Nord S=
oC
> > with fallback on SA8255P compatibles.
> >
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 20 +++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
> > index 352af3426d34..d73f9edcbbdb 100644
> > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-q=
up.yaml
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-q=
up.yaml
> > @@ -19,7 +19,12 @@ description:
> >
> >  properties:
> >    compatible:
> > -    const: qcom,sa8255p-geni-se-qup
> > +    oneOf:
> > +      - enum:
> > +          - qcom,sa8255p-geni-se-qup
> > +      - items:
> > +          - const: qcom,nord-auto-geni-se-qup
>
> AUTO variant of Nord is SA8797P, so it makes more sense to use
> 'qcom,sa8797p-geni-se-qup' which is more consistent to
> 'qcom,sa8255p-geni-se-qup'.  Will update in the next version.

I thought QCom moved to these codenames because the chips are the same
with different part#'s by market/application.

Rob

