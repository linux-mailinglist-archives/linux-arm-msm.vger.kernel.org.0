Return-Path: <linux-arm-msm+bounces-50661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9226AA57676
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 01:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 931CE3AFA7F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 00:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE7B6FBF;
	Sat,  8 Mar 2025 00:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKXLMBNB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F871137E;
	Sat,  8 Mar 2025 00:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741392096; cv=none; b=FNFKxx0S7HA7HmIGOafTEkmJd5aagRzGyzSNVblI0I22JgdjbTG9JrQC8oVhCti1X855A7BWwQERh1dAXDoHUYaLqNiEB5siEN6sA1WvVeWrJRcQeBYtl/0Xm4hoSs1EEANvrIQA2/1EKJomP2hm5iZBr9eAOt1nGJapT5E6Tyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741392096; c=relaxed/simple;
	bh=RxrYJHQ56oEI9BGDiBCfydVzW7XVfkyco8V5ApsDlQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdnUiBv0DY5XOYgyvqL0q8PkSiPpJr0tfnYZPe2Z6dM/qM1VnQmdm2vhB69hYt+8uqcbgg9AjXNPzoKnm6Cjus2tWXPtcQycIofLlZN4KnHzxCCPAkUhFt0oRVEC7huJOKmso4q7T2zvf4OzkBgIGpBfDbQCqqlniMG6vDn0xiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tKXLMBNB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46537C4CED1;
	Sat,  8 Mar 2025 00:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741392094;
	bh=RxrYJHQ56oEI9BGDiBCfydVzW7XVfkyco8V5ApsDlQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKXLMBNBEG4l/WGTfeUKVbn4j3rdE8gJ6Ilcva4PJSJcslzXv6M6WfGCNgacYUXkn
	 US65jmiBuIuulxzETgm01TOt7owT/UpNqIBEt5hGmKSmSfEqIe3oTs1ZPs+n0cEt/X
	 +Iu1yfibj7iPQmzG69qyA845987YQTBDw9GtIJ88kmaZW02/57lSJVWzcBoR2r7nAe
	 eeP3mRg8Ig5AajMqymimA2WHZycUViBklTfnUGeSXA3DXfbmilQX049h6Vr6eq5dGk
	 n94JiTWskjViv4kLtGofrhuYO8HJOoRlaeByRmvFEc5si0HWdN2//l9MRk6uKl5+JV
	 KZ401FLEJF/UA==
Received: by venus (Postfix, from userid 1000)
	id 3564A180B97; Sat, 08 Mar 2025 01:01:32 +0100 (CET)
Date: Sat, 8 Mar 2025 01:01:31 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC 1/2] arm64: dts: qcom: x1e78100-t14s: Add LCD variant with
 backlight support
Message-ID: <lolqokpczxdscvgj6xdfyxblmle3csgzje3fgo4itzspgmeriy@7zzx7hg2zfks>
References: <20250306090503.724390-1-abel.vesa@linaro.org>
 <20250306090503.724390-2-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y6zodhuo7ebbvgn4"
Content-Disposition: inline
In-Reply-To: <20250306090503.724390-2-abel.vesa@linaro.org>


--y6zodhuo7ebbvgn4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC 1/2] arm64: dts: qcom: x1e78100-t14s: Add LCD variant with
 backlight support
MIME-Version: 1.0

Hi,

On Thu, Mar 06, 2025 at 11:05:02AM +0200, Abel Vesa wrote:
> Due to the fact that Lenovo Thinkpad T14s Gen6 is available with both
> OLED and LCD, the backlight control differs HW-wise. For the LCD variant,
> the panel's backlight is controlled via one of the PWMs provided by the
> PMK8550 PMIC. For the OLED variant, the backlight is internal to the
> panel and therefore it is not described in devicetree.
>=20
> For this reason, create a generic dtsi for the T14s by renaming the
> existing dts. While at it, add a node name to panel and drop the enable
> gpio and pinctrl properties from the panel node. Then add the LCD variant
> dts file with the old name and describe all backlight related nodes.
>=20
> So the existing dts will now be used for LCD variant while for OLED new
> dts will be added.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> [...]
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&pmk8550_pwm 0 5000000>;

I've tried this patch series together with the fix series [0], but
without the duty cycle calculation change [1]. Instead I changed the
period from 5000000 to 4266667. With that everything works as
expected for me.

[0] https://lore.kernel.org/all/20250305-leds-qcom-lpg-fix-max-pwm-on-hi-re=
s-v4-0-bfe124a53a9f@linaro.org/
[1] https://lore.kernel.org/all/20250303-leds-qcom-lpg-compute-pwm-value-us=
ing-period-v1-1-833e729e3da2@linaro.org/

Greetings,

-- Sebastian

--y6zodhuo7ebbvgn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmfLiNAACgkQ2O7X88g7
+ppf3xAAlXHluicXnkOYso5FoMHezzKxZjWtgPdfvJrO1u9ofgYj2f/Ge6kgRMWP
1bp5iE3MgKeVdlyx20FZ4fCi+ETG379ozRXgUQULpe3QdW23k/tCzPTZvB0zWnl3
thkrUn6vJOFUEOIJR7d7J104eT04kvDXAUV+ift/Rvx46p2YrEwT57yktbylYpkt
2LyX4RM+aHCc7Dux3Am9FZcmRciHUnWsxFt9ZGIzLOU6PiYeo1OIK2j07vvWxNYP
ReRVZP3dy+HkXIp76BKpvf85Qp827KitUKrHLMTtq5vb/qpyDn00F9WuKgFpm8aw
qseJhwgyDnSFKri6ZXkJzeIDJbzB/bYlqkJSFNr/n1j6NJuqVWhm+5bMcn0yeGTI
sNFYKCeER0BrQeiOWXl8wSDR7CFE8WqYibiSkZ9Fuf1UVYF83+gHry9p7amX2u9o
ArhpXakQtpQCFZqWsWqHyz3KtZdt2EaEVK2qpWCfV7aqmmERHDSYyMqMIDxz/kXR
0QqJwLOniL/bxCwUjRyXMrQ0AZeDuAT208s7TCcLL1KWdir10MChg6jeRZ/qQ6zS
Cr8fsFZKzOUwEC8mH6xvZDyJc6rUrn0kSNA9JnsaRleidenAg4r5eVWe05kPRdo3
QyJuA9h2TPDK05AVHdq1qeA+4tf2BVy7CvAGoZVgIPZAdARbnHQ=
=tLqZ
-----END PGP SIGNATURE-----

--y6zodhuo7ebbvgn4--

