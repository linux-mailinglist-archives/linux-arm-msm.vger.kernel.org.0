Return-Path: <linux-arm-msm+bounces-30667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6061D96B59F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 10:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6D83B20E86
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 08:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124D118A6CF;
	Wed,  4 Sep 2024 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eu8AJDHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B4918733B;
	Wed,  4 Sep 2024 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440103; cv=none; b=gncyzb7F+dbu8uAoxxQhDDYmvD1PBL5ExsIepzOuCmBZQTJYJekmTGSJDfdChcSdftWPWPD1CxGZqvUCoVqw0Gc+1UlfC14gAwcnh1z3VPTLt6Fu57N1P5kMtxpZgayFol8AYYBrWWN+R3yjtYmH4IpPIi8TkLU6OOWZ+gwDuCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440103; c=relaxed/simple;
	bh=u/8TadMuYKUFhKnQMeDmqC1qJ0hJ+/nvqfXJBcyj304=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CDFlDrw8lGz1lA59JMcph3vEUHnbIPqpksxfKGbbEB79GvsGm808P8ARgUN1bxligBOdGrTL/sQofM4nesO3XQ+L1XqEtuQZzn6isJTpJwZRYT/KU8MwsT6fkDx/USDmReGqjv9jtkVGwGcGFwDIl0SMICciJa4wQqTy/9xmC7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eu8AJDHQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725440102; x=1756976102;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=u/8TadMuYKUFhKnQMeDmqC1qJ0hJ+/nvqfXJBcyj304=;
  b=eu8AJDHQU0qhRzq0mY8TdTwTxmdyV66Z2CHJ7XLXeZ96ZtXcmD2mJld2
   ihsz6dXWNsGNwl8dIRk63whwc32yUA9/F7auXG77N0GK7eZyx1yEVFwwE
   GEqsYDwXREHGOPT1ejfFi2FpyaRiucyXqn5MWrbMfaSSho0RgQaxFlCgJ
   lplOEVQWcHzg5kx9rVDp2NSnN7SRPulHjhJDL2qxk9W+HP+INOoouYjt3
   S+eQ+BTYOLpT2BDtW9ff1v1Y5iDh0z77GI5fGmqKICV+KwScU9ZTUJpXq
   nieyBP/TgaKQW4xUh3TLnXqgajIJHhifgaep3jV15hNyv7NYalZnsE0hS
   A==;
X-CSE-ConnectionGUID: duepTFIFRWeymrsjqPB8Fg==
X-CSE-MsgGUID: JO2jJ9XkThS8KO+DjchFPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35244164"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="35244164"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 01:55:01 -0700
X-CSE-ConnectionGUID: aIVjLDyjT3aNnpyvSWBI2Q==
X-CSE-MsgGUID: ijdeOUFeRn65XMWUj9GN8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65444076"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.18])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 01:54:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marc
 Gonzalez <mgonzalez@freebox.fr>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 0/2] Basic support for TI TDP158
In-Reply-To: <87ikvcu54c.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr>
 <172536721812.2552069.2889737892670833119.b4-ty@kernel.org>
 <87ikvcu54c.fsf@intel.com>
Date: Wed, 04 Sep 2024 11:54:34 +0300
Message-ID: <87zfonsss5.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 03 Sep 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 03 Sep 2024, Robert Foss <rfoss@kernel.org> wrote:
>> On Mon, 12 Aug 2024 16:51:00 +0200, Marc Gonzalez wrote:
>>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>>>=20
>>> Like the TFP410, the TDP158 can be set up in 2 different ways:
>>> 1) hard-coding its configuration settings using pin-strapping resistors
>>> 2) placing it on an I2C bus, and defer set-up until run-time
>>>=20
>>> The mode is selected by pin 8 =3D I2C_EN
>>> I2C_EN =3D 1 =3D=3D> I2C Control Mode
>>> I2C_EN =3D 0 =3D=3D> Pin Strap Mode
>>>=20
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/2] dt-bindings: display: bridge: add TI TDP158
>>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/887665792b=
99
>> [2/2] drm/bridge: add support for TI TDP158
>>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a15710027a=
fb
>
> Fails build with:
>
> ../drivers/gpu/drm/bridge/ti-tdp158.c: In function =E2=80=98tdp158_enable=
=E2=80=99:
> ../drivers/gpu/drm/bridge/ti-tdp158.c:31:9: error: implicit declaration o=
f function =E2=80=98gpiod_set_value_cansleep=E2=80=99 [-Werror=3Dimplicit-f=
unction-declaration]
>    31 |         gpiod_set_value_cansleep(tdp158->enable, 1);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/bridge/ti-tdp158.c: In function =E2=80=98tdp158_probe=
=E2=80=99:
> ../drivers/gpu/drm/bridge/ti-tdp158.c:80:26: error: implicit declaration =
of function =E2=80=98devm_gpiod_get_optional=E2=80=99; did you mean =E2=80=
=98devm_regulator_get_optional=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
>    80 |         tdp158->enable =3D devm_gpiod_get_optional(dev, "enable",=
 GPIOD_OUT_LOW);
>       |                          ^~~~~~~~~~~~~~~~~~~~~~~
>       |                          devm_regulator_get_optional
> ../drivers/gpu/drm/bridge/ti-tdp158.c:80:65: error: =E2=80=98GPIOD_OUT_LO=
W=E2=80=99 undeclared (first use in this function)
>    80 |         tdp158->enable =3D devm_gpiod_get_optional(dev, "enable",=
 GPIOD_OUT_LOW);
>       |                                                                 ^=
~~~~~~~~~~~~
> ../drivers/gpu/drm/bridge/ti-tdp158.c:80:65: note: each undeclared identi=
fier is reported only once for each function it appears in

Fix at [1].

BR,
Jani.


[1] https://lore.kernel.org/r/20240904085206.3331553-1-jani.nikula@intel.com


--=20
Jani Nikula, Intel

