Return-Path: <linux-arm-msm+bounces-85090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D08CB78EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 02:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74BB73010E5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 01:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12182857F0;
	Fri, 12 Dec 2025 01:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="GeXhcglI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35E227FB18;
	Fri, 12 Dec 2025 01:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765503678; cv=none; b=fbxyhviDS0svJWGyYlxqRlpsbp1h22eXqmd8OQr5AI/N88limWTclQ4Xk/yLy1tn5Lrr4EZ327fXQMcV7rCT02EYt/ONHHs4DQnQvhYgTVVPfNSiYMKsLjmqcjHhx+SPoAOb41ogaHP3mcfjfiqWvBT/AhAeSRnP0duQbxEZXRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765503678; c=relaxed/simple;
	bh=omWm0Lm1jtXCTL1Uq2LFKX4o32WRTfztHJp+NK0Vgz4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AtFv/jjAGXrQlR7LJdZVEfreLYZru2R2kiCeUK45ykUJtHCsbWOU3TPjTWKgdoTEV/Do43qnRYyV2Bm7EUAo7SxeODLuxXqWWvsz/44Sfm0o85AxkwD6nxTkJY4RCOe3LFtyDgrQXmJPxZS/+aLwRlSplXXByuAEm//NVNqUSik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=GeXhcglI; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail3; t=1765503660; x=1765762860;
	bh=Vf2kTsjxiZVFiDHQSbPBSfFwenyj9EXJT5HKgrVc4f4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GeXhcglIIg7aUcm1AA6E6ZGg8pQqD+YDSy9iQPRbFD3a0nZVHjlRXuMiU2dx5OqTA
	 9wczflQ5ajnJU0E2M6f/6YJF13+slsBs7G0FjZI3mMwzBAi+xKatF5RCsyED0yVRdA
	 ybNRwbZD4AJBJlIZh6IV8KeGqJ4LxfCoNzZzgVRTYl5SeoXo8gopehep0ZH3uZR10K
	 nFYx/4VGO1eGFu5AiFo21CxMBr6PT/i8fabPpQPM6r+Elf5a84x92/bROwkY/KgSj5
	 dmSrDOBpuDJ9+dcaWssqob5QX2QuBdHJv/dX8o+5JK179YjCCcvVdtZccO12lMIuZM
	 av7J/OgFtgZrQ==
Date: Fri, 12 Dec 2025 01:40:54 +0000
To: Richard Acayan <mailingradian@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Robert Mader <robert.mader@collabora.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add camera mclk pins
Message-ID: <fce2e252-64ed-436a-92f1-0cefe383c7b0@nxsw.ie>
In-Reply-To: <20251211014846.16602-5-mailingradian@gmail.com>
References: <20251211014846.16602-1-mailingradian@gmail.com> <20251211014846.16602-5-mailingradian@gmail.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 4e74b436191f5053f4bd93e069c8706c71fa0992
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/12/2025 01:48, Richard Acayan wrote:
> The camera subsystem is added for the SoC common devicetree, but the
> mclk pins should also be common across the SoC. Add the mclk pins for
> the cameras.
>=20
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.=
qualcomm.com
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/q=
com/sdm670.dtsi
> index c275089237e4..69e84cd8ed27 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -1190,6 +1190,27 @@ tlmm: pinctrl@3400000 {
>   =09=09=09gpio-ranges =3D <&tlmm 0 0 151>;
>   =09=09=09wakeup-parent =3D <&pdc>;
>=20
> +=09=09=09cam_mclk0_default: cam-mclk0-default-state {
> +=09=09=09=09pins =3D "gpio13";
> +=09=09=09=09function =3D "cam_mclk";
> +=09=09=09=09drive-strength =3D <2>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
> +=09=09=09cam_mclk1_default: cam-mclk1-default-state {
> +=09=09=09=09pins =3D "gpio14";
> +=09=09=09=09function =3D "cam_mclk";
> +=09=09=09=09drive-strength =3D <2>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
> +=09=09=09cam_mclk2_default: cam-mclk2-default-state {
> +=09=09=09=09pins =3D "gpio15";
> +=09=09=09=09function =3D "cam_mclk";
> +=09=09=09=09drive-strength =3D <2>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09cci0_default: cci0-default-state {
>   =09=09=09=09pins =3D "gpio17", "gpio18";
>   =09=09=09=09function =3D "cci_i2c";
> --
> 2.52.0
>=20
>=20

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---


