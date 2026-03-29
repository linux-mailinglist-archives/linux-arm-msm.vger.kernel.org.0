Return-Path: <linux-arm-msm+bounces-100618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNtiJsdEyWmkwwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 17:27:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 95601352938
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 17:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93CA73002933
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 15:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4F636EAB4;
	Sun, 29 Mar 2026 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="F1MCxIHM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24426.protonmail.ch (mail-24426.protonmail.ch [109.224.244.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295137C905;
	Sun, 29 Mar 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774798018; cv=none; b=hDnmK9aUYxpvxqO2SzPd9GNDXxOzC30cwCdbbenG17hD1i7BK/qlzpNFbvLO88YHle0HXtXNGeHjqoVx8vQjIGWQNMRLjFb9mVB6NOcwr9g58WQBL1peB4u73Orr4MWWTXCMk0gxr52WJjjhskHi6fD/67WzRfmw1U8vmS5Qv7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774798018; c=relaxed/simple;
	bh=yVmxEmdTEYT5C40BpyaomeXbahx2s4Uv8fOFj7HhrqE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mCOmZ3q2OaWPhgCPv5q3a+v+ZpBTBiut9TRjmD9hVWh0BlcNqxELr8Vq2Ee4QLU4O/O0OyQ1BPmlGgJgNEtHhEgIikUA2ulTyUzHFFfzaRX/WuovHkqq7LFF0FBo5+c1Uw6w2K2G3vbY/DfLQ1JogIdnuqXNEpMZ1+7O1HwG7ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=F1MCxIHM; arc=none smtp.client-ip=109.224.244.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1774798014; x=1775057214;
	bh=W0csasnSx2yLDoldpvYV8aUIdRGYmyJd4mDLqJYTvJo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=F1MCxIHMdX3R7QKLkPfjSwZ2x72BI1DDziiMjduULH8SsntSTYTRO1oOPFxqHYv8g
	 E3BfXwQmF0YI8RdBRaoSwwg+2U5fHN36u+fQoJFCnodYSuQJFhAqJYZHULRC2p76AL
	 BHfR0vzvee/kSTxuDMV9Lj63Ye1pzSYjctMZHCpqVQcwZATF3Pz6CqNxoN10ojkIND
	 iSvNL/JM+DBJaeCgsx3DyX+CnGVKxV5bK5n/a4K2kkGLXNHWyCsX7ZbhIBFeYOn5Qd
	 5zQhjStsi/y3Cvc4j+OwGREI1VUN/uNS1GsxPCXUJjscNf9kEbB2P/Zu3lYcV9LQax
	 7rP2sK2KylEHg==
Date: Sun, 29 Mar 2026 15:26:48 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
Message-ID: <VRCUEe2qHZa0a8HzVvhoRtAZyXO8pBU_l96B6U1kL5EFVSJyQBfYeKDvqPit-qpPRtIjUbtl7TH0JegJ7LXvctAxgyo50K6rTC5hwNjuV5k=@protonmail.com>
In-Reply-To: <o2sbqzcix74u46g74sil2c3b6mgd6zsrmafesoqltfbbrzqhjh@uochk3so46yx>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com> <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com> <us3ps4bgf5ekk2iudcgs2wa4b5qd4mzokec4q55pmhb6kvt6ht@qm4mmzdai2t2> <O7THc5h8ZhgzNpklYKTGOnEZKlN4BtHZHjKZt2KErekNb3E-hizt2dw7xuJ8G6giEyivmvC0f6-eIfCT6fJkUA7_CVQwhAktCXfBqAVV_Zo=@protonmail.com> <o2sbqzcix74u46g74sil2c3b6mgd6zsrmafesoqltfbbrzqhjh@uochk3so46yx>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 60242aa9c11534cdafdd19119148144aa99eeed6
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
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100618-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian_ci@protonmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95601352938
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sunday, March 29th, 2026 at 12:12, Dmitry Baryshkov <dmitry.baryshkov@os=
s.qualcomm.com> wrote:

> On Sat, Mar 28, 2026 at 05:30:53PM +0000, cristian_ci wrote:
> > On Friday, March 27th, 2026 at 23:57, Dmitry Baryshkov <dmitry.baryshko=
v@oss.qualcomm.com> wrote:
> >
> > > On Fri, Mar 27, 2026 at 03:30:49PM +0100, Cristian Cozzolino via B4 R=
elay wrote:
> > > > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > >
> > > > Add the description for the display panel found on this phone.
> > > > And with this done we can also enable the GPU and set the zap shade=
r
> > > > firmware path.
> > > >
> > > > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > > ---
> > > >  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 73 ++++++++++=
++++++++++++
> > > >  1 file changed, 73 insertions(+)
> > > >
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > I wonder if I should, instead, edit the compatible property by adding a
> > second string (for the fallback), like this:
> >
> > compatible =3D "flipkart,rimob-panel-nt35532-cs", "novatek,nt35532";
> >
> > and, therefore, add "novatek,nt35532" string also to (patch 1/6)'s
> > bindings example. Let me know what you think.
>=20
> What would it mean? I think we usually don't include the IC into the
> compat list for the panel, but feel free to prove me wrong.

I've noticed use of that in this [1] patch series but I don't know why IC=
=20
string is used there (in the example) if the specific panel string (the=20
first one) is already defined in the panel driver.

[1] https://lore.kernel.org/linux-arm-msm/20251001135914.13754-2-caojunjie6=
50@gmail.com/

Best Regards,

Cristian.

> --
> With best wishes
> Dmitry
> 

