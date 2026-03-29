Return-Path: <linux-arm-msm+bounces-100622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIaaHNxRyWnrxQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:22:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F4B352DF2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BD813045AA2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 16:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123851A6834;
	Sun, 29 Mar 2026 16:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="jR4HNOD/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072E42367D9;
	Sun, 29 Mar 2026 16:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774801180; cv=none; b=biu15vX365QNIEOhbskf/q+zI9QMTIPIUdvDkXndZ1xqCtVZEEsRljjXHG0yYyB1sfShVEXsIEJTlkmNbx/1phQkBB3thwMtQytuULQ7kvAZvHbdw4XZHfVtVgmogYoq3OWQBcQKdj+1XxjQxGqaEY0nAuXTZLen4rK/xCrVWWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774801180; c=relaxed/simple;
	bh=BFPfZ2WxzKTAGD6ZvuD9WSeiOWVQfiAH/8mL8/5MIoQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aOtswqELW6JCgPKTjqUGQjRQ5vqQJCBXUaGTVLaI1xLVdyu+bvn+5qyqCB2UZBnp+OSjjgWvoGx00fCs9nymV7WTsqBmmRGTn8mdo4qA55J9fWOf3fdtFtb/U1r8H+eKMlcIgWkhkcipCr+nhexvj/28/Be0D/D+M0MNsHmWlTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=jR4HNOD/; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1774801170; x=1775060370;
	bh=Kw9ncBi2g8DQlEJYun43Cmx0pvsMzUUHiini5FmiIoY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jR4HNOD/PRWujIZGBjEed6lMf0sNd3E44VYccLzQHnZ7POen1Iwi4T8vwxObK7LMV
	 a/8Plia578tlBFgGaLWEghYi9W7nJqJvCBdRU6InsTYF+vR8f4fWw/vTETdnT9HIAK
	 0kV4DnQkY2wjjBF8cR1RJ7qYFGkZzkB2tZi9dBCDjlUoDU9y9FwgiT3ivZPFKgBZnV
	 UfS6bn2dD9m8VE5EXDkYD0cgfwmL7JEQvKoQ5+VHoQOoqP+u/hAvlrTXHjUXmwieOf
	 TnCWkz4p7JcDRbTVtHSqpiyG/FAsteB3B+bIYWfYQk0nJvDWMViNSM0IW8OAtsFoqi
	 ezTCFcOVC3XJQ==
Date: Sun, 29 Mar 2026 16:19:24 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
Message-ID: <zXHQN4VYU88kI-ekIhzg4F064XjG_QxgfKKoMO2NW4OF3JPUq_wkLikIPwzqx2rLkf1N17mcTsKiuyBuXCsSu1qWfys6tcK7ik-g4aWOeMc=@protonmail.com>
In-Reply-To: <s6kyh5wyamcxyd7xsbu5wrrpndpdb5xhxapmxze2qgblng5eiq@hl36nzg2lldg>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com> <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com> <us3ps4bgf5ekk2iudcgs2wa4b5qd4mzokec4q55pmhb6kvt6ht@qm4mmzdai2t2> <O7THc5h8ZhgzNpklYKTGOnEZKlN4BtHZHjKZt2KErekNb3E-hizt2dw7xuJ8G6giEyivmvC0f6-eIfCT6fJkUA7_CVQwhAktCXfBqAVV_Zo=@protonmail.com> <o2sbqzcix74u46g74sil2c3b6mgd6zsrmafesoqltfbbrzqhjh@uochk3so46yx> <VRCUEe2qHZa0a8HzVvhoRtAZyXO8pBU_l96B6U1kL5EFVSJyQBfYeKDvqPit-qpPRtIjUbtl7TH0JegJ7LXvctAxgyo50K6rTC5hwNjuV5k=@protonmail.com> <s6kyh5wyamcxyd7xsbu5wrrpndpdb5xhxapmxze2qgblng5eiq@hl36nzg2lldg>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 7103ff29d7061ece36242b2be9670773b9f15ef5
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100622-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian_ci@protonmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,protonmail.com:dkim,protonmail.com:email,protonmail.com:mid]
X-Rspamd-Queue-Id: C2F4B352DF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sunday, March 29th, 2026 at 17:51, Dmitry Baryshkov <dmitry.baryshkov@os=
s.qualcomm.com> wrote:

> On Sun, Mar 29, 2026 at 03:26:48PM +0000, cristian_ci wrote:
> > On Sunday, March 29th, 2026 at 12:12, Dmitry Baryshkov <dmitry.baryshko=
v@oss.qualcomm.com> wrote:
> >
> > > On Sat, Mar 28, 2026 at 05:30:53PM +0000, cristian_ci wrote:
> > > > On Friday, March 27th, 2026 at 23:57, Dmitry Baryshkov <dmitry.bary=
shkov@oss.qualcomm.com> wrote:
> > > >
> > > > > On Fri, Mar 27, 2026 at 03:30:49PM +0100, Cristian Cozzolino via =
B4 Relay wrote:
> > > > > > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > > > >
> > > > > > Add the description for the display panel found on this phone.
> > > > > > And with this done we can also enable the GPU and set the zap s=
hader
> > > > > > firmware path.
> > > > > >
> > > > > > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > > > > ---
> > > > > >  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 73 ++++++=
++++++++++++++++
> > > > > >  1 file changed, 73 insertions(+)
> > > > > >
> > > > >
> > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > >
> > > > I wonder if I should, instead, edit the compatible property by addi=
ng a
> > > > second string (for the fallback), like this:
> > > >
> > > > compatible =3D "flipkart,rimob-panel-nt35532-cs", "novatek,nt35532"=
;
> > > >
> > > > and, therefore, add "novatek,nt35532" string also to (patch 1/6)'s
> > > > bindings example. Let me know what you think.
> > >
> > > What would it mean? I think we usually don't include the IC into the
> > > compat list for the panel, but feel free to prove me wrong.
> >
> > I've noticed use of that in this [1] patch series but I don't know why =
IC
> > string is used there (in the example) if the specific panel string (the
> > first one) is already defined in the panel driver.
> >
> > [1] https://lore.kernel.org/linux-arm-msm/20251001135914.13754-2-caojun=
jie650@gmail.com/
>=20
> That's why I wrote "usually". In the end we also have several
> (unfortunately) panel devices which use IC for compat string, etc.

Ok, thanks for the reply.

Best Regards,

Cristian.

> --
> With best wishes
> Dmitry
> 

