Return-Path: <linux-arm-msm+bounces-99661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDGaMg2PwmnDewQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:18:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 540C03092C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E4308304853C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FCA3F165F;
	Tue, 24 Mar 2026 13:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="FK2nnl1U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24424.protonmail.ch (mail-24424.protonmail.ch [109.224.244.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCA23DFC93;
	Tue, 24 Mar 2026 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357830; cv=none; b=a/gDVtZViVBBPlAAk48XbUDtq47UMPTxffRf5tKtu6rBLgntQtdxvG7WxIkL0jPe3LnpTT12AFPniBBHSnv811fJ8ij0JaKMDjXmoVN5UAPzLHtoN7S9nJOkt6ptC+7Sb23F8p7/97d44V2WfuvxyYYVq4dov522LiO7w73/PPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357830; c=relaxed/simple;
	bh=0pnB0U7InhkGL9lTdgeWgS0PDvdGdURPxYWKmTb9BiU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fqolWaW2Add/CvrNxui+PNlVkuoUtKBVPie2sZEfXGcO4lkJn66ow7ae9gCuwSVAzVK5/X3QKh0EPz2Dqy+J06fI08JH0mSrHIOkyO4J01jS1I9gnsCEBec1J/gqfm/n3sDi/EIM5yJPBtJoJo6nv22B1XFLxsd0RLbGLDyVTxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=FK2nnl1U; arc=none smtp.client-ip=109.224.244.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1774357819; x=1774617019;
	bh=d8w5CZ1DioJDLSSnZn0lUgk1zgmXdXiL/spUhVixnL4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FK2nnl1U1iJW2JFd3eYi+a/efk4dTWRpwXM3P/p7hU2is3URddT8zC4MxpNA0GBil
	 JRaU88xJgM0zqXDmzB5xduxQ82vuGkkD/BnuJ4G8WJOvpvjKI6bk/7obXbO4fjU9rc
	 AdtwnYHWSst5aiEXHqmBnGPy7LaTrHX6qjQxhMmt9uwOh4tJEZrjY7F5wd9g0MHjeH
	 7/yhVTRsx+fZjtdRCo6R5BKnf0S+pL3r7q+HVN+WLTg3Bf/pAQfNC/Hyot9OlGfy1o
	 nAVmdb9K0hjZBwpg2SWNOm8cwKoabMcY8fqjgo7htiOXLTZCfEz7LiY967QTcHdHCY
	 VDqJxuTpNUfzw==
Date: Tue, 24 Mar 2026 13:10:13 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: display: panel: Add Novatek NT35532 LCD DSI
Message-ID: <GF8zsK-szOM98Ck2jznCOZ4xjuJTl9g1b0uPc1N79Dzf7PNzOiVgewdqPFGjqF3YD7tOUa2tzdc7rG_e7iNH8yjHOJ9DobsihTxRLUk8EL4=@protonmail.com>
In-Reply-To: <sdcfwycey5ykhn2fghun7imx3tjtnwat3ny3mut5dwstl7wvw6@maqrzlycwdn5>
References: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com> <20260321-rimob-new-features-v3-1-d4b8ee867de7@protonmail.com> <sdcfwycey5ykhn2fghun7imx3tjtnwat3ny3mut5dwstl7wvw6@maqrzlycwdn5>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 70202603ff894e828bf88287248da08abdde0c30
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99661-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian_ci@protonmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,gitlab.freedesktop.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 540C03092C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Saturday, March 21st, 2026 at 17:46, Dmitry Baryshkov <dmitry.baryshkov@=
oss.qualcomm.com> wrote:

> On Sat, Mar 21, 2026 at 05:23:20PM +0100, Cristian Cozzolino via B4 Relay=
 wrote:
> > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> >
> > Document Novatek NT35532-based DSI display panel.
> >
> > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > ---
> >  .../bindings/display/panel/novatek,nt35532.yaml    | 77 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  5 ++
> >  2 files changed, 82 insertions(+)
>=20
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: novatek,nt35532
>=20
> This is not enough to identify the panel. This name identifies the
> controller inside the panel, however the exact settings (and the
> behaviour) would depend on the exact TFT "glass" used with this
> controller. Downstream usually doesn't care that much and frequently
> just uses the controller name or the the controller with some kind of
> "description" like ("wqhd-dsc-cmd").

Ok but I just don't understand the following: I'd like to know (also=20
considering that I find it difficult to find someone, outside of this=20
ML, available to discuss this stuff, specifically) exactly why the=20
current bindings are not enough.
I mean: looking at schematics and datasheets of other similar devices=20
and based on observations about my device, I believe the generic bindings=
=20
approach for nt35532 works quite well for panels.
Novatek made the IC first and then whoever buys it can be a display=20
vendor. If we talk about downstream, differences between panels are describ=
ed=20
there (i.e. my panel makes use of four supplies, while other ones could use=
=20
a different configuration).

> What does it mean for the upstream:
> - Try identifying the actual panel used for the phones. Sometimes
>   googling for spare or replacement parts would reveal such a name.
>   Sometimes it can be seen as a marking on the cable or on the backside
>   of the panel (again, googling).

It seems that 'google' approach fails, in my case :( (I only know that=20
the vendor assigned Smartron the work to design the HW - but SW too -=20
of the device. Nevertheless, Smartron is neither OEM nor ODM, so the=20
company was relying, at the time, on a series of chinese manufacturers to p=
rovide=20
parts required for this device, including panel suppliers: in general,=20
the list of panel suppliers for Smartron includes BOE, Tianma and other kno=
wn=20
companies. So, this panel may be any of those, paired with NT35532, and wor=
k=20
anyway). Unfortunately, even if marking on the cable is known, that doesn't=
=20
identify the panel but the cable itself (which is available on the market,=
=20
though), instead, in this case.

> - If not found, come up with some artificial identifier that would
>   identify the controller+glass combo (e.g. "tianma,fhd-video" or
>   "lenovo,j606f-boe-nt36523w" (where lenovo,j6006f is a device name and
>   boe is a "supplier").

Assuming that resources available which I've as source of information=20
for this panel are limited (the ones also described in v1's review thread),=
=20
my vendor devicetree describes the panel in  'qcom,mdss_dsi_nt35532_1080p_c=
s_video'=20
node and makes use of:

qcom,mdss-dsi-panel-name =3D "nt35532 1080p cs video mode dsi panel";

property. Until now, close-to-mainline devicetree I was using the following=
=20
compatible for the panel:

compatible =3D "flipkart,rimob-nt35532-cs";

and I'm not sure about the exact meaning of 'cs' suffix. I cannot state 'CS=
'=20
as panel supplier and use that upstream without proof/evidence. What do=20
you suggest, in this regard?


Cristian
=20
> - Either use both strings for compat property:
>   compatible =3D "tianma,fhd-video", "novatek,nt36672a"
>   or just the first one.
>=20
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  backlight: true
> > +  reset-gpios: true
> > +
> > +  avdd-supply:
> > +    description: positive boost supply regulator
> > +
> > +  avee-supply:
> > +    description: negative boost supply regulator
> > +
> > +  vci-supply:
> > +    description: regulator that supplies the analog voltage
> > +
> > +  vddam-supply:
> > +    description: power supply for MIPI interface
> > +
> > +  vddi-supply:
> > +    description: regulator that supplies the I/O voltage
> > +
> > +  port: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reset-gpios
> > +  - vddi-supply
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dsi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        panel@0 {
> > +            compatible =3D "novatek,nt35532";
> > +            reg =3D <0>;
> > +
> > +            backlight =3D <&pmi8950_wled>;
> > +            reset-gpios =3D <&tlmm 61 GPIO_ACTIVE_LOW>;
> > +            avdd-supply =3D <&lab>;
> > +            avee-supply =3D <&ibb>;
> > +            vci-supply =3D <&pm8953_l17>;
> > +            vddi-supply =3D <&pm8953_l6>;
> > +
> > +            port {
> > +                panel_in: endpoint {
> > +                    remote-endpoint =3D <&dsi0_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a626dee5c106..8ed2866bbd6e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8171,6 +8171,11 @@ T:=09git https://gitlab.freedesktop.org/drm/misc=
/kernel.git
> >  F:=09Documentation/devicetree/bindings/display/panel/novatek,nt35510.y=
aml
> >  F:=09drivers/gpu/drm/panel/panel-novatek-nt35510.c
> >
> > +DRM DRIVER FOR NOVATEK NT35532 PANELS
> > +M:=09Cristian Cozzolino <cristian_ci@protonmail.com>
> > +S:=09Maintained
> > +F:=09Documentation/devicetree/bindings/display/panel/novatek,nt35532.y=
aml
> > +
> >  DRM DRIVER FOR NOVATEK NT35560 PANELS
> >  M:=09Linus Walleij <linusw@kernel.org>
> >  S:=09Maintained
> >
> > --
> > 2.53.0
> >
> >
>=20
> --
> With best wishes
> Dmitry
> 

