Return-Path: <linux-arm-msm+bounces-105632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDZDBR7Q92nBmQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 00:45:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B414B7B53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 00:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACFFE3008215
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 22:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C052386572;
	Sun,  3 May 2026 22:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="CdR/4VHm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFE478F26;
	Sun,  3 May 2026 22:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777848345; cv=none; b=qgkDfwMF+MedoAeCfbT4kDoEhPyHC/Rh7ZtZ5vpTZCANl4QFdxlXlSJR4hhnZ7Q8x0GCpZn0nM1owTwqMx+fqraYX/0Mb0fUNicNsS1v5P1PuRJ8ovc5bpzfbrejc8ro0RFHfbGhIqPi4eJz7xoiFgbDhsQx04lJgD4PvnOsVkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777848345; c=relaxed/simple;
	bh=IaznTKLe5dad4+R/xa0emtp+Q3PttAzGi7wiaO/eheo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JlBV80yznrPYq1DfEfHpYbL2lu66iLDScnmDBT2wvjHjF18pV5k5twU/KwkD3GIFbuZBdw0DltMS+PeEbXTXcdBtEYGiDvCU25GxNge+/0DkRVyx1bN3OBgc5jZHSnT0kXPNRHRdDXtbVnuyR9QHp2G5BO+HzpLU3XErZlPnIxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=CdR/4VHm; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1777848337; x=1778107537;
	bh=GmRclv1lFdsQhVriTFHd1NfedZYeuyLxm4fz//FM1AY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CdR/4VHm7mRDYWqFZJkFRIVde4BrmSOvGTVG0lQ1x13/aza1kAttWjjk0HmQyfiDe
	 p7n2zeXUDBjVFLJbUzgGOxVAk0osb9VBZ2to8YzJKxrf9zJkTtWR0FeI+c4Xi7cQ4D
	 kDpWVZEMsBiWIP6eLNBK9Rkl5sJhbnop4cojvQz7S80/E4ZXHpFknZX8HPjaZT9cAV
	 C80GgIpA+et4EoIkUWi6E8s4z/GJqyL0Jq8FolYTpolJabAsHawfOyufIBiz30/1MQ
	 2ozloXnv1VTJrIovrQcJTJ5kx5VIvN+fBlTRko9Ue+lWuRlBXVk2r5zakDfkkWGB0U
	 u5XAF6vTD+13w==
Date: Sun, 03 May 2026 22:45:33 +0000
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: platform: introduce EC for Dell XPS 13 9345
Message-ID: <QaJhPBoKpGFHk8H8UHqo2y0ie-jbnPOGDWtq-b-wzoyk4lp0cPc94NsGqYb3SR0d96eCFucQzyNVfdOUBaTXN1mutr7WQ_1Xeteolba26fY=@vinarskis.com>
In-Reply-To: <4bef096a-9f0d-4609-a74c-088caf8fba1e@linaro.org>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com> <20260404-dell-xps-9345-ec-v2-1-c977c3caa81f@vinarskis.com> <e69ebf4a-126e-48c7-970b-1ba2a40a4492@linaro.org> <21_zFoUYN_HKM8GMSFC7b0uIgOQevyqpWbjtIX1vVP7YtK9tlMgqC3XRgwo35ANlvZ1veGNShZuQFHkKWcf3B_qhjhD90FS7kvR3qCpKzIY=@vinarskis.com> <4bef096a-9f0d-4609-a74c-088caf8fba1e@linaro.org>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 5c6607cb4cd340e7d67beab4be82fdcae36914b0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 65B414B7B53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105632-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3b:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vinarskis.com:email,vinarskis.com:dkim,vinarskis.com:mid,linaro.org:email]


On Monday, April 6th, 2026 at 10:15, Bryan O'Donoghue <bryan.odonoghue@lina=
ro.org> wrote:

> On 05/04/2026 21:50, Aleksandrs Vinarskis wrote:
> > On Sunday, April 5th, 2026 at 02:05, Bryan O'Donoghue <bryan.odonoghue@=
linaro.org> wrote:
> >
> >> On 04/04/2026 13:55, Aleksandrs Vinarskis wrote:
> >>> Add bindings for Embedded Controller (EC) in Dell XPS 13 9345 (platfo=
rm
> >>> codename 'tributo'). It may be partially or fully compatible with EC
> >>> found in Snapdragon-based Dell Latitude, Inspiron ('thena').
> >>>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.co=
m>
> >>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> >>> ---
> >>>    .../embedded-controller/dell,xps13-9345-ec.yaml    | 91 ++++++++++=
++++++++++++
> >>>    MAINTAINERS                                        |  5 ++
> >>>    2 files changed, 96 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/embedded-controller/de=
ll,xps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controll=
er/dell,xps13-9345-ec.yaml
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..e14dbf2f1a6af8cc75118=
90fbef08c6c717c0aa6
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps1=
3-9345-ec.yaml
> >>
> >> I believe the part name of this embedded controller is the "mec5200" s=
o
> >> instead of calling it dell,xps13-9345-ec suggest "dell,mec5200"
> >
> > Correct, its Microchip MEC5200. I remember reading some series discussi=
on
> > about not naming driver after IC its based on, but rather platform its
> > used for since driver depends on firmware which is platform specific...
> > cannot find that discussion now.

I managed to find the discussion from Krzysztof I was referring to [1].
My interpretation (please correct me if its wrong):
- Dell did not make MEC5200, so 'dell,mec5200-foo-bar' is not correct.
- Since same IC may (and is) used on other platform, compatible and filenam=
e
of the driver should be specific to the platform.

[1] https://lore.kernel.org/all/57515c0f-caa0-4651-96cf-dde75a13937f@kernel=
.org/

> >
> >>
> >>> @@ -0,0 +1,91 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/embedded-controller/dell,xps13-93=
45-ec.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Dell XPS 13 9345 Embedded Controller
> >>> +
> >>> +maintainers:
> >>> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
> >>> +
> >>> +description:
> >>> +  The Dell XPS 13 9345 has an Embedded Controller (EC) which handles=
 thermal
> >>> +  and power management. It is communicating with SoC over multiple i=
2c busses.
> >>> +  Among other things, it handles fan speed control, thermal shutdown=
, peripheral
> >>> +  power supply including trackpad, touch-row, display. For these fun=
ctions, it
> >>> +  requires frequently updated thermal readings from onboard thermist=
ors.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: dell,xps13-9345-ec
> >>
> >> Ditto the compat - name it after the IC not the laptop its a "mec5200"
> >> or "mec5200-ec" - I suspect the -ec postfix is a tautology the ec bit =
in
> >> "mec" probably captures.
> >
> > I'm not sure I agree regarding the compatible, its supposed to be as ex=
act as
> > possible. "dell,mec5200" will not allow us to differentiate between EC =
drivers
> > of "tributo" and "thena" for example.
> >
> > Suggestion:
> > - Schema filename to be generalized "dell,mec5200-ec.yaml"
> > - Driver filename to be generalized "dell-mec5200-ec.c"
> > - Config to be generalized "EC_DELL_MEC5200"
> > - Compatible to stay specific "dell,xps13-9345-ec", with fallback to
> >    "dell,mec5200-ec".
> >
> > I would also keep "-ec" to stay consistent with naming convention of
> > existing drivers and bindings.
> >
> > Let me know if this would work for you.
> >
> > Alex
>=20
> To me including the laptop model in the IC name, when our best
> information is that this same chip is used on both Thena variants isn't
> very logical.
>=20
> The thing is the IC not the platform it resides on.
>=20
> But if you think the firmware is specific to each platform - something
> like dell-mec5200-ec, dell,mec5200-xps13-9345-ec makes sense to me.

Krzysztof could you please advise whats the best way to go about these
compatibles (and driver name, if you have thoughts there)?

Thanks,
Alex

>=20
> >
> >>
> >>> +
> >>> +  reg:
> >>> +    const: 0x3b
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +  io-channels:
> >>> +    description:
> >>> +      ADC channels connected to the 7 onboard thermistors on PMK8550=
.
> >>> +      EC requires frequent thermal readings of these channels to per=
form
> >>> +      automated fan speed control.
> >>> +    items:
> >>> +      - description: ADC channel for sys_therm0
> >>> +      - description: ADC channel for sys_therm1
> >>> +      - description: ADC channel for sys_therm2
> >>> +      - description: ADC channel for sys_therm3
> >>> +      - description: ADC channel for sys_therm4
> >>> +      - description: ADC channel for sys_therm5
> >>> +      - description: ADC channel for sys_therm6
> >>> +
> >>> +  io-channel-names:
> >>> +    items:
> >>> +      - const: sys_therm0
> >>> +      - const: sys_therm1
> >>> +      - const: sys_therm2
> >>> +      - const: sys_therm3
> >>> +      - const: sys_therm4
> >>> +      - const: sys_therm5
> >>> +      - const: sys_therm6
> >>
> >>
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - interrupts
> >>> +  - io-channels
> >>> +  - io-channel-names
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/interrupt-controller/irq.h>
> >>> +    #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
> >>> +    i2c {
> >>> +        #address-cells =3D <1>;
> >>> +        #size-cells =3D <0>;
> >>> +
> >>> +        embedded-controller@3b {
> >>> +            compatible =3D "dell,xps13-9345-ec";
> >>> +            reg =3D <0x3b>;
> >>> +            interrupts-extended =3D <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
> >>> +
> >>> +            io-channels =3D <&pmk8550_vadc PM8350_ADC7_GPIO3_100K_PU=
(1)>,
> >>> +                          <&pmk8550_vadc PM8350_ADC7_GPIO4_100K_PU(1=
)>,
> >>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM1_100K_=
PU(1)>,
> >>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM2_100K_=
PU(1)>,
> >>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM3_100K_=
PU(1)>,
> >>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM4_100K_=
PU(1)>,
> >>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM5_100K_=
PU(1)>;
> >>> +            io-channel-names =3D "sys_therm0",
> >>> +                               "sys_therm1",
> >>> +                               "sys_therm2",
> >>> +                               "sys_therm3",
> >>> +                               "sys_therm4",
> >>> +                               "sys_therm5",
> >>> +                               "sys_therm6";
> >>> +        };
> >>> +    };
> >>> +...
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 96e0781f2201b41b976dfa69efd44d62c4ff0058..a5d175559f4468dfe363b=
319a1b08d3425f4d712 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -7236,6 +7236,11 @@ S:=09Maintained
> >>>    F:=09Documentation/ABI/testing/sysfs-class-firmware-attributes
> >>>    F:=09drivers/platform/x86/dell/dell-wmi-sysman/
> >>>
> >>> +DELL XPS EMBEDDED CONTROLLER DRIVER
> >>> +M:=09Aleksandrs Vinarskis <alex@vinarskis.com>
> >>> +S:=09Maintained
> >>> +F:=09Documentation/devicetree/bindings/embedded-controller/dell,xps1=
3-9345-ec.yaml
> >>> +
> >>>    DELTA AHE-50DC FAN CONTROL MODULE DRIVER
> >>>    M:=09Zev Weiss <zev@bewilderbeest.net>
> >>>    L:=09linux-hwmon@vger.kernel.org
> >>>
> >>
> >>
>=20
> 

