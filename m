Return-Path: <linux-arm-msm+bounces-94593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB6HJFXoomlG8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:06:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D87B31C31A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E20130C52D3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A896843D519;
	Sat, 28 Feb 2026 13:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="I/H8GKCI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244118.protonmail.ch (mail-244118.protonmail.ch [109.224.244.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B258543D4FC
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772283958; cv=none; b=Ufi69zVmj2+q9fQvj9PKFpIcOZncWP58osZ2qSqbz8hb3FnEjTnpg2KtWUnojdkbtoBbWA59qCuyehnNW8vhAPIYlkWuKZKea3//HDJk1DvfaiLVpzpWTqVkx6oAAQKywZ3IETjLokTXyZhjU16NeiPTCZZN3dAyZGUyw6SjSVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772283958; c=relaxed/simple;
	bh=WdHypN4wfT3NsSm0whBTavvlM81jhBrtzWRkailWbhI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GeELek/fIVeyrc4Ecrv1A8SqzQGUi2zNJEJTaEcpK60v2SS1apdskd7WmhPH8l+p1ZF5BZG62N0PNCDmkpmMQnCp7RBuDHX1fqs6jtoEC39Upz4adBxV0NaLm3kFS6wXx+a81wygOuCWryYAltFO/Yhl9J+XwaGi96Xt6l5gH6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=I/H8GKCI; arc=none smtp.client-ip=109.224.244.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1772283946; x=1772543146;
	bh=kNz7IuwtOBaqLn55GG5myrKDag5tFvNdn5VrQaGUXBc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=I/H8GKCIVre7XHfw1HxZAAMnDdv/JaaJ+ZDSegZDgYTlC3NqxwGHnizJYI2LXiPMx
	 0e+IvBywE20H2A51pwh6bJR+6H7m44I6FxU4YstmvCvpZynD2fpeyol63Hmipt/8TT
	 iYoBJJqWCo0v6VW3K4RCH0NLmSO1qCcFqJu6LD1r/90o7Y/BF57Oz6iK/ABPPdsxaf
	 +U3LkD7h5jS6pWYpDL0vYqBco0K67pmw2HAnqB+IE0/fi42Psphb5TeBfREWgYM+eR
	 E7gDZfJMYQyTYOXPDkyMij9EmV+eAg/VM14FNU0jpcylfOWmNTTBOgaX5He9MJ5Yv6
	 wIilHxbdvWg5Q==
Date: Sat, 28 Feb 2026 13:05:41 +0000
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add ov02c10 RGB sensor on CSIPHY4
Message-ID: <7177764d-fff7-465d-9ee4-f8e6f6455787@vinarskis.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 54b720a5066cd0f57cd2fc3306d793ce226eae9f
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94593-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email,0.0.0.36:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vinarskis.com:mid,vinarskis.com:dkim]
X-Rspamd-Queue-Id: D87B31C31A2
X-Rspamd-Action: no action


On 2/26/26 15:51, Bryan O'Donoghue wrote:
> Add in the RGB sensor on CSIPHY4.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Hi Bryan,

Thanks for re-spin of this series,

> ---
>   .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 77 +++++++++++++++=
+++++++
>   1 file changed, 77 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index f10dff1da7f8e..f3f4841ad2c83 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -7,6 +7,7 @@
>  =20
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  =20
>   #include "hamoa.dtsi"
> @@ -856,6 +857,66 @@ &gpu_zap_shader {
>   =09firmware-name =3D "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
>   };
>  =20
> +&camss {
> +=09status =3D "okay";
> +
> +=09ports {
> +=09=09/*
> +=09=09 * port0 =3D> csiphy0
> +=09=09 * port1 =3D> csiphy1
> +=09=09 * port2 =3D> csiphy2
> +=09=09 * port3 =3D> csiphy4
> +=09=09 */
> +=09=09port@3 {
> +=09=09=09camss_csiphy4_inep0: endpoint@0 {
> +=09=09=09=09clock-lanes =3D <7>;
> +=09=09=09=09data-lanes =3D <0 1>;
> +=09=09=09=09remote-endpoint =3D <&ov02c10_ep>;
> +=09=09=09};
> +=09=09};
> +=09};
> +};
> +
> +&cci1 {
> +=09status =3D "okay";
> +};
> +
> +&cci1_i2c1 {
> +=09camera@36 {
> +=09=09compatible =3D "ovti,ov02c10";
> +=09=09reg =3D <0x36>;
> +
> +=09=09reset-gpios =3D <&tlmm 237 GPIO_ACTIVE_LOW>;
> +=09=09pinctrl-names =3D "default";
> +=09=09pinctrl-0 =3D <&cam_rgb_default>;
> +
> +=09=09clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +=09=09assigned-clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +=09=09assigned-clock-rates =3D <19200000>;
> +
> +=09=09orientation =3D <0>; /* front facing */
> +
> +=09=09avdd-supply =3D <&vreg_l7m_2p8>;
> +=09=09dvdd-supply =3D <&vreg_l2m_1p2>;
> +=09=09dovdd-supply =3D <&vreg_l4m_1p8>;

It probably got lost around as its been a while since last re-spin: as
discussed in private and reported to 'issue' in Linaro's tree on gitlab,
these are wrong. l7m/l2m/l4m are regulators used by Lenovo t14s, confirmed
by device working and via AeoB dumps [1]. As per respective AeoB dump for
Slim7x [2], these should be l7b/l1m/l3m instead. This arrangement was also
confirmed working by community members (see discussion in gitlab issue [3])=
.

I have previously submitted a patch to Linaro tree to have this fixed [4],
feel free to squash it with your changes.

[1]=20
https://github.com/alexVinarskis/qcom-aeob-dumps/blob/master/lenovo-thinkpa=
d-t14s-g6/CAMF_RES_QRD.json#L117-L155
[2]=20
https://github.com/alexVinarskis/qcom-aeob-dumps/blob/master/lenovo-yoga-sl=
im7x/CAMF_RES_QRD.json#L116-L154
[3] https://gitlab.com/Linaro/arm64-laptops/linux/-/issues/9
[4] https://gitlab.com/Linaro/arm64-laptops/linux/-/work_items/26

> +
> +=09=09port {
> +=09=09=09ov02c10_ep: endpoint {
> +=09=09=09=09data-lanes =3D <1 2>;
> +=09=09=09=09link-frequencies =3D /bits/ 64 <400000000>;
> +=09=09=09=09remote-endpoint =3D <&camss_csiphy4_inep0>;
> +=09=09=09};
> +=09=09};
> +=09};
> +};
> +
> +&csiphy4 {
> +=09vdda-0p8-supply =3D <&vreg_l2c_0p8>;
> +=09vdda-1p2-supply =3D <&vreg_l1c_1p2>;
> +
> +=09status =3D "okay";
> +};
> +
>   &i2c0 {
>   =09clock-frequency =3D <400000>;
>  =20
> @@ -1403,6 +1464,22 @@ &tlmm {
>   =09=09=09       <44 4>, /* SPI (TPM) */
>   =09=09=09       <238 1>; /* UFS Reset */
>  =20
> +=09cam_rgb_default: cam-rgb-default-state {
> +=09=09mclk-pins {
> +=09=09=09pins =3D "gpio100";
> +=09=09=09function =3D "cam_aon";
> +=09=09=09drive-strength =3D <16>;
> +=09=09=09bias-disable;
> +=09=09};
> +
> +=09=09reset-n-pins {
> +=09=09=09pins =3D "gpio237";
> +=09=09=09function =3D "gpio";
> +=09=09=09drive-strength =3D <2>;
> +=09=09=09bias-disable;
> +=09=09};
> +=09};
> +

While at it, could you please add privacy LEDs gpios for the camera? In
the same Linaro gitlab issue [4] I have added fixup patches to enable LED
on t14s/slim7x/thena and confirmed them working. Feel free to add those
changes directly to your patch.

I could of course send them separately once this series lands, but given
that its a rather small change, and this initial camera support will be
used as ground-truth example by community to enable cameras on their
platforms, it would be nice to have privacy indicator included from the
very beginning. v4l side that would use this LED was merged a while ago.


Thanks,
Alex

>   =09edp_reg_en: edp-reg-en-state {
>   =09=09pins =3D "gpio70";
>   =09=09function =3D "gpio";
>


