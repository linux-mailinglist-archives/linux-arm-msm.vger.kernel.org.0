Return-Path: <linux-arm-msm+bounces-94171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJy3BEUmn2mPZAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 17:41:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A782119AD0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 17:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4BA43309B1AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CFC3E9582;
	Wed, 25 Feb 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mv1NfCF0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB833A1D1C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 16:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772037328; cv=pass; b=fYc7ZHA3jh6Iw2UtELUwgM2I+Cy5iaQ/C/arjZDlwfBTUuigRHxfrPgIlnni0g4jfPqXwgkdIGzARC/VtIwq/BghtcVTf8szEDM3xX6dVBSglJh8abfAukrRuwTdkpP099Hz7LePaHdtZQEEE1u1WQ0TIEr69V+amkCqzc6S14s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772037328; c=relaxed/simple;
	bh=5mn5Tfn04nZioLhmX5FA6JQCdLtNk5ymRmu4Pl6FZFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWwh5jJIVAKKa09sfwFkmm6wkCsKh2Quf1ItldR6mUN/9F8gFEJ4NlzpOEvF9DBHyjwiSO/OyKT7noFExgdM1SWuaZUdKOKVI8o9+WsCF77uYH6w/mEkoPRC48SZZcKioBv33y3m0oFlWUj2MWfw3L99Voq9CvEKFnxzNxkWvGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mv1NfCF0; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bdbd13ca01so2568969eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 08:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772037325; cv=none;
        d=google.com; s=arc-20240605;
        b=XfLHz+tO5l4bthikz/fPdEF2ll+5BwikhaZbbtVz3ch+ycOhZsdh0tqXAhsC7U9lud
         B9nAKfj2zZQRKRou8f5tYbXtepU0j65KOFR8CjNq6M0HgE4b4yjjgSq5XnEx8bAS1AyR
         DxJhjwANCvLak8BxlnI2uW55Z/6NetZPJ9iBJOvgazlOUiiYnDjqvVaWL1iXoHnKdoo3
         ninYmzl1k5AajIM2dmr/OdiEg1efKfOSHTMrzPIt1dzzWXsBexKDgLuDz3y6cK9SsjFQ
         PqO1j4uIuDghiqzdhBCLzdWb5zHO/+qQoMcPPz/WC2NRjnp28b8CUsFh1ad2C2w9w8N2
         5L7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RuMyK8k/Iub+seZtBM6TPXaM4YVrVm+PvcW0VWb+Be8=;
        fh=mtlyPZZLb26mn0duZxJjnpD+/mc14Okmr9V2DGAqsBU=;
        b=Bridu3Cn3s1ahYs8cxEZ/s2no5JfQbYdLFDTL43JnH1lrhxC3MGqc7BJoQZgrWFxxy
         19+kaBs4YQpjDJ6S1OWL+B72tc3Yg9TwFI/hHLoHKhgv/ctzrFFse6ptmNYIoETJNxgS
         l4WaFn83ixEjXUoOPNQRQauycl7zcw2ptE99021v/nwJ73F+IDZV+Rz022d8F3Hg/kXw
         7/zwMHvI+2reLBbvRQgvPEBTIp5ae7SQE4gSYn+WVXDBafTZfLO9Z7Zx3DcexJx6k1bZ
         EkNcq+LkI4OB/wOFGmr6h3fipcaV1/Ika90+5A7Or9RdC61YGyIDPeInmOjuzILBiTAJ
         M4TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772037325; x=1772642125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuMyK8k/Iub+seZtBM6TPXaM4YVrVm+PvcW0VWb+Be8=;
        b=mv1NfCF0Oszuw2rgMNTU6F2h/wsO5cT0xhXLkX3WaHHjMc0DL7Jv9teLYd3TEBelGN
         aBeZL3ySUxktv3cRSNnOrrpsyU9HvlKzJk+pQD5ih02PNCuiH2AuV4fC73aTGDSjb+P1
         e5nUrq0casCgvKWyEe0gxvYK3fYV4oR17zIfBgMVmt7P9Evr0RsAbE1fSqOZuODK5b7k
         feC4mZEmTdcR4U227r7Pl38z1EUMhtRjg9frJEZxe3uWKwQRV4pmOUOflxCsVwIT13HU
         F5Yu+8pInffnaP9GmFP5d17wTP0T9IdCQYroh162xbV33HcaAwJrH2OgSwhn5sqdUAgI
         531A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772037325; x=1772642125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RuMyK8k/Iub+seZtBM6TPXaM4YVrVm+PvcW0VWb+Be8=;
        b=wm8OvERPJNEtqLdwDT1NytumNkTFcOu18xvtvC3FKRNcW1xENyOQ6wC/QVvtN5Bb4C
         wKVMYDEJ5srAc0pDtWhYYpx7CzPvDIhFBEsEkjLT5wCglpvLgEtRqXRZIO+lCg4bEx6Y
         365TXb2SZAQpHXHnUipmOF0LYG2L+346zUQRpnKyCkFLbHue2EBz+9EQPkP7Nv4ySypF
         fn6g5Mm3yqd8Tq/Ut0tV+eYwAXC5gTpUOLyqtsNHcARvl7Jrn6dp2BUAM/MJ6Vou+Bso
         1t/rKOSgojpd+4wz1wlSzDQe0fED0kpZ5CbhTUzmc5nI24tJ5ZxAVkV074iD2pXHF4rf
         Twow==
X-Forwarded-Encrypted: i=1; AJvYcCXJ7KOO4eDxAEYWHxUfWzmwl7Pm/qHsQNYcP6YGjx/2ctNVnvqgEU2e2TmuRnA8z6O8XNO06wG1cXJquJmA@vger.kernel.org
X-Gm-Message-State: AOJu0YzIlKJkdhNwId4N6NID4Gu3c4du0IMYKleYg1Q3dE/mPDDAwvxG
	ExqaUh+MZTRZLjQWZWGb4v/X2j3AH2c9kedNRl97PX05ubm8jZ3KbT5Ys53OJ0UZcuQdC9GyVYR
	JJF9b08oIKSDh+Q0xGUG6ut+gcWLhfFg=
X-Gm-Gg: ATEYQzxs2R4HsT9pcMTPdUcSqyMOjtxZeeF9SMXYvGCBqnuQa3noMO8PQBsx2TPWfOM
	T+QXpSuDnL+rw5hw2L63fv13nYc1BE776JbwED/PYxOVkrpDDAl+V4bPQi23OVneTEgSWJahlg8
	bWo2HoAg5lRCbWuZxc5JdNf0Uh2DzVjtbRB49e6A1t6sT5bj+zjzp8u8rz/wrQEg0jPtqxfnhp/
	TmROFsRTzDNADOs4z/wzJiyzs9DAhwMzoFSIvg1n2viQdIPXIlEMgnljGaQ5zlo9ocvh/q4tgLK
	hygpA6AIDMk5ai3qxA==
X-Received: by 2002:a05:7300:730c:b0:2ba:8018:cc53 with SMTP id
 5a478bee46e88-2bdcc09cdcfmr451942eec.35.1772037325339; Wed, 25 Feb 2026
 08:35:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
 <20260223-panel-patches-v1-3-7756209477f9@gmail.com> <dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme>
In-Reply-To: <dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 25 Feb 2026 18:35:13 +0200
X-Gm-Features: AaiRm500k62S5PT-UtPwx_C8A375gU6HJuFS3MnM7OdDg835C8WPOS3XQzbLxvI
Message-ID: <CAHuF_ZrQPZSv=AhK5Cq8aNq1NVcdZhHC3v0ju4sW4whYYP+d+A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable
 MDSS and add panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94171-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,0.0.0.0:email,protonmail.com:email]
X-Rspamd-Queue-Id: A782119AD0B
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 at 04:46, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Feb 23, 2026 at 04:24:04PM +0200, Yedaya Katsman wrote:
> > Enable the MDSS nodes and add supplies and bindings for the Samsung
> > S6E8FCO panel.
> >
> > The ldo and iovcc pins boot up with a current of 16 mA, but they work
> > fine with 2mA, so I used that.
> >
> > Co-developed-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> > ---
> >  .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 94 ++++++++++++++=
++++++++
> >  1 file changed, 94 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b=
/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> > index 994fb0412fcbdf5466f87a325c48b697a37b514b..10fd01143a644004b807fc4=
55d2235f8e6a9737a 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> > @@ -82,6 +82,32 @@ key-volume-up {
> >               };
> >       };
> >
> > +     panel_ldo_supply: panel-ldo-supply {
>
> regulator-foo-bar-baz
Will change
>
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "panel_ldo_supply";
>
> Is it an actual name (e.g. from schematics)?
In the downstream dts it's called "panel_ldo-gpio-supply". [0]

[0] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/d3766fc8cda2d96=
de2850faa9ce58e5a37ea9f9c/arch/arm64/boot/dts/qcom/trinket-sde-display.dtsi=
#L28
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +             regulator-boot-on;
> > +
> > +             enable-active-high;
> > +             gpio =3D <&tlmm 26 GPIO_ACTIVE_HIGH>;
> > +             pinctrl-0 =3D <&panel_ldo_en>;
> > +             pinctrl-names =3D "default";
> > +     };
> > +
> > +     panel_iovcc_supply: panel-iovcc-supply {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "panel_iovcc_supply";
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +             regulator-boot-on;
> > +
> > +             enable-active-high;
> > +             gpio =3D <&tlmm 124 GPIO_ACTIVE_HIGH>;
> > +             pinctrl-0 =3D <&panel_iovcc_en>;
> > +             pinctrl-names =3D "default";
> > +     };
> > +
> >       thermal-zones {
> >               rf-pa0-thermal {
> >                       thermal-sensors =3D <&pm6125_adc_tm 0>;
> > @@ -128,6 +154,46 @@ &hsusb_phy1 {
> >       status =3D "okay";
> >  };
> >
> > +&mdss {
> > +     status =3D "okay";
> > +};
> > +
> > +&mdss_dsi0 {
> > +     vdda-supply =3D <&vreg_l18a>;
> > +
> > +     pinctrl-0 =3D <&mdss_default>;
> > +     pinctrl-1 =3D <&mdss_sleep>;
> > +     pinctrl-names =3D "default", "sleep";
> > +
> > +     status =3D "okay";
> > +
> > +     panel@0 {
> > +             compatible =3D "samsung,s6e8fco";
> > +             reg =3D <0>;
> > +
> > +             vddio-supply =3D <&vreg_l9a>;
> > +             ldo-supply =3D <&panel_ldo_supply>;
> > +             iovcc-supply =3D <&panel_iovcc_supply>;
> > +             reset-gpios =3D <&tlmm 90 GPIO_ACTIVE_LOW>;
> > +
> > +             port {
> > +                     panel_in: endpoint {
> > +                             remote-endpoint =3D <&mdss_dsi0_out>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&mdss_dsi0_out {
> > +     data-lanes =3D <0 1 2 3>;
> > +     remote-endpoint =3D <&panel_in>;
> > +};
> > +
> > +
> > +&mdss_dsi0_phy {
> > +     status =3D "okay";
>
> Missing vdds-supply.
Will add
> > +};
> > +
> >  &pm6125_adc {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&camera_flash_therm &emmc_ufs_therm>;
> > @@ -387,6 +453,34 @@ &sdhc_2 {
> >
> >  &tlmm {
> >       gpio-reserved-ranges =3D <22 2>, <28 6>;
> > +
> > +     panel_ldo_en: panel-ldo-default-state {
> > +             pins =3D "gpio26";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-pull-up;
> > +     };
> > +
> > +     mdss_default: mdss-default-state {
> > +             pins =3D "gpio90";
> > +             function =3D "gpio";
> > +             drive-strength =3D <8>;
> > +             bias-disable;
> > +     };
> > +
> > +     mdss_sleep: mdss-sleep-state {
> > +             pins =3D "gpio90";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-pull-down;
> > +     };
> > +
> > +     panel_iovcc_en: panel-iovcc-default-state {
> > +             pins =3D "gpio124";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-pull-up;
> > +     };
> >  };
> >
> >  &ufs_mem_hc {
> >
> > --
> > 2.53.0
> >
>
> --
> With best wishes
> Dmitry

