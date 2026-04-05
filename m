Return-Path: <linux-arm-msm+bounces-101902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMhRIifL0mnuawcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 22:50:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0EC39FCAC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 22:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 817FC3001CFE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 20:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0A8382F0A;
	Sun,  5 Apr 2026 20:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="GJQeghOB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A337A3328FC
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 20:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775422241; cv=none; b=PhPl4L7120YVVzGZtArBDyRDUl4ClTjgURzXcRDY4vbDbw8okWy+TV8m/u1t9AFg1vLuqnus/O7Y6z8m4QbLf3trNrd/xiD/FApUAucpyjaswmudd0ZxywuSqOezFKEjUQFqtkaEZLRSOJa4eJ++v29HU3JY7BoB18YV1u0kpDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775422241; c=relaxed/simple;
	bh=yWW1KiahdiwLNaDRgC2JDM+HB1aVzqYnA5lTecRFm24=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E1NdgZ8bgGRFxgZvUgJ2j84nTFp8MwHxon1dTS2oVvycZnkWo0dT4AIJe0TLqFAU4rnoaF/Cu1KA4B0U8EELeNvt8RXBsfz2ABSx9xtFHl364oyUH9T9gR5OQxXTBzTYdcrOaeGHnz6DISi1EIolagYcApvDKswpUyX8zT3dwVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=GJQeghOB; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1775422236; x=1775681436;
	bh=4Ek/EPssZe3unSnM8iR+18ST+mZuimkNI21OwBSt0qo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GJQeghOBtMLcFdZAVe5O+nhiZ+kf8Lh6X6133z1OJPd5OT1s6THvv5JZ6+pvBggzA
	 Fk1XoQ+NXQJJUvEwhbqAwWTONpOEmVMIfUqcZoYmHG8veaG5usOCzZtzG/MEk+Q6aQ
	 dQDDxwLJcyI67yMaewuW0XsbsCDk2cYAcG18Jx7sUpwIaoXed6CgINBIeang5tBAx8
	 7EgCHX0EfnJkBve+2T+zGyOudJMTjjvs7YRLnD+B9ZYBcDjU45CVpT0lEQNTVLCB6a
	 tr4JF2DtW+6CLM8fYDSG1PWRj0xiioqobK2Ip4FFXYhSlTXJZG82RnyUyhNKQnuQta
	 xdwW4HnrkehMA==
Date: Sun, 05 Apr 2026 20:50:33 +0000
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: platform: introduce EC for Dell XPS 13 9345
Message-ID: <21_zFoUYN_HKM8GMSFC7b0uIgOQevyqpWbjtIX1vVP7YtK9tlMgqC3XRgwo35ANlvZ1veGNShZuQFHkKWcf3B_qhjhD90FS7kvR3qCpKzIY=@vinarskis.com>
In-Reply-To: <e69ebf4a-126e-48c7-970b-1ba2a40a4492@linaro.org>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com> <20260404-dell-xps-9345-ec-v2-1-c977c3caa81f@vinarskis.com> <e69ebf4a-126e-48c7-970b-1ba2a40a4492@linaro.org>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: f9ffe8d03f539179f5c2003a662c36b0d58c4c3a
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
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101902-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8B0EC39FCAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sunday, April 5th, 2026 at 02:05, Bryan O'Donoghue <bryan.odonoghue@lina=
ro.org> wrote:

> On 04/04/2026 13:55, Aleksandrs Vinarskis wrote:
> > Add bindings for Embedded Controller (EC) in Dell XPS 13 9345 (platform
> > codename 'tributo'). It may be partially or fully compatible with EC
> > found in Snapdragon-based Dell Latitude, Inspiron ('thena').
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> > ---
> >   .../embedded-controller/dell,xps13-9345-ec.yaml    | 91 +++++++++++++=
+++++++++
> >   MAINTAINERS                                        |  5 ++
> >   2 files changed, 96 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/embedded-controller/dell=
,xps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller=
/dell,xps13-9345-ec.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e14dbf2f1a6af8cc7511890=
fbef08c6c717c0aa6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-=
9345-ec.yaml
>
> I believe the part name of this embedded controller is the "mec5200" so
> instead of calling it dell,xps13-9345-ec suggest "dell,mec5200"

Correct, its Microchip MEC5200. I remember reading some series discussion
about not naming driver after IC its based on, but rather platform its
used for since driver depends on firmware which is platform specific...
cannot find that discussion now.

>
> > @@ -0,0 +1,91 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/embedded-controller/dell,xps13-9345=
-ec.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Dell XPS 13 9345 Embedded Controller
> > +
> > +maintainers:
> > +  - Aleksandrs Vinarskis <alex@vinarskis.com>
> > +
> > +description:
> > +  The Dell XPS 13 9345 has an Embedded Controller (EC) which handles t=
hermal
> > +  and power management. It is communicating with SoC over multiple i2c=
 busses.
> > +  Among other things, it handles fan speed control, thermal shutdown, =
peripheral
> > +  power supply including trackpad, touch-row, display. For these funct=
ions, it
> > +  requires frequently updated thermal readings from onboard thermistor=
s.
> > +
> > +properties:
> > +  compatible:
> > +    const: dell,xps13-9345-ec
>
> Ditto the compat - name it after the IC not the laptop its a "mec5200"
> or "mec5200-ec" - I suspect the -ec postfix is a tautology the ec bit in
> "mec" probably captures.

I'm not sure I agree regarding the compatible, its supposed to be as exact =
as
possible. "dell,mec5200" will not allow us to differentiate between EC driv=
ers
of "tributo" and "thena" for example.

Suggestion:
- Schema filename to be generalized "dell,mec5200-ec.yaml"
- Driver filename to be generalized "dell-mec5200-ec.c"
- Config to be generalized "EC_DELL_MEC5200"
- Compatible to stay specific "dell,xps13-9345-ec", with fallback to
  "dell,mec5200-ec".

I would also keep "-ec" to stay consistent with naming convention of
existing drivers and bindings.

Let me know if this would work for you.

Alex

>
> > +
> > +  reg:
> > +    const: 0x3b
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  io-channels:
> > +    description:
> > +      ADC channels connected to the 7 onboard thermistors on PMK8550.
> > +      EC requires frequent thermal readings of these channels to perfo=
rm
> > +      automated fan speed control.
> > +    items:
> > +      - description: ADC channel for sys_therm0
> > +      - description: ADC channel for sys_therm1
> > +      - description: ADC channel for sys_therm2
> > +      - description: ADC channel for sys_therm3
> > +      - description: ADC channel for sys_therm4
> > +      - description: ADC channel for sys_therm5
> > +      - description: ADC channel for sys_therm6
> > +
> > +  io-channel-names:
> > +    items:
> > +      - const: sys_therm0
> > +      - const: sys_therm1
> > +      - const: sys_therm2
> > +      - const: sys_therm3
> > +      - const: sys_therm4
> > +      - const: sys_therm5
> > +      - const: sys_therm6
>
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - io-channels
> > +  - io-channel-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        embedded-controller@3b {
> > +            compatible =3D "dell,xps13-9345-ec";
> > +            reg =3D <0x3b>;
> > +            interrupts-extended =3D <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +            io-channels =3D <&pmk8550_vadc PM8350_ADC7_GPIO3_100K_PU(1=
)>,
> > +                          <&pmk8550_vadc PM8350_ADC7_GPIO4_100K_PU(1)>=
,
> > +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM1_100K_PU=
(1)>,
> > +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM2_100K_PU=
(1)>,
> > +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM3_100K_PU=
(1)>,
> > +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM4_100K_PU=
(1)>,
> > +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM5_100K_PU=
(1)>;
> > +            io-channel-names =3D "sys_therm0",
> > +                               "sys_therm1",
> > +                               "sys_therm2",
> > +                               "sys_therm3",
> > +                               "sys_therm4",
> > +                               "sys_therm5",
> > +                               "sys_therm6";
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 96e0781f2201b41b976dfa69efd44d62c4ff0058..a5d175559f4468dfe363b31=
9a1b08d3425f4d712 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7236,6 +7236,11 @@ S:=09Maintained
> >   F:=09Documentation/ABI/testing/sysfs-class-firmware-attributes
> >   F:=09drivers/platform/x86/dell/dell-wmi-sysman/
> >
> > +DELL XPS EMBEDDED CONTROLLER DRIVER
> > +M:=09Aleksandrs Vinarskis <alex@vinarskis.com>
> > +S:=09Maintained
> > +F:=09Documentation/devicetree/bindings/embedded-controller/dell,xps13-=
9345-ec.yaml
> > +
> >   DELTA AHE-50DC FAN CONTROL MODULE DRIVER
> >   M:=09Zev Weiss <zev@bewilderbeest.net>
> >   L:=09linux-hwmon@vger.kernel.org
> >
>
>

