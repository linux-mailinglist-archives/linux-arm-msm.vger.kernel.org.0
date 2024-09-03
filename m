Return-Path: <linux-arm-msm+bounces-30541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B696A2CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 17:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9AAC1C226F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 15:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE879190462;
	Tue,  3 Sep 2024 15:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGndWN9T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054E018B46F;
	Tue,  3 Sep 2024 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725377453; cv=none; b=CgVp2oTkEXET/p7aKePw37P695ufpSDnuiYY26LaEwOf1FF7Yf0iTVQAi6oHyUwHxNCOHcrIsWXyv8MMg23ca7knnvhq6ektYsC5tMeZWHHt8KBsyMav9GpbJdEiMBjfh/rEszr/EbzUCtYzP2i0AVts4dl7NRjQ4vXlDy0M8HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725377453; c=relaxed/simple;
	bh=quTbfbSANe4t1ypJkD07DT3rhHexlQR6l0nLd4Z6XAI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tZgzZ60v+sa4iE/1kf+pe4j6SbbDbgL2zpYOwtUkEnj1wuOB0HcRuerR9so/zP097ClkVywQCmVA9w1QOkTIpaoiQrmrf8ZnZhC6TW4eF1PcXHfAvrMFZ2dJw1XNmD8uogYuUowWTldFwJ4SJiCDbk7WZth4ZueW47YSzMNlzCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGndWN9T; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725377452; x=1756913452;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=quTbfbSANe4t1ypJkD07DT3rhHexlQR6l0nLd4Z6XAI=;
  b=EGndWN9T8xBnJUqYbQH/e3P5AAThDzYyhIM+gmaXx1VETjMFi/NzXsYA
   Nn2LSKe5TJ2Y83DYcQIC4rSsRrAPpF7FWJp+zIoKI1j5Y+viBSfbwzkLx
   Qzq9oN8dwZWTv81CshXD+EABkBjXzoapywUzJTCzZp7ApoOc07vE5fyKz
   9Vf7qLpA8H9k0NXS5ZTpTSz/7rmWi038W/Mjlf0PN7WGZf7qQ+JZtfRdP
   0GbyucxJjvhqgiXMoD2c6glzcpGcCjsjK/jWtwhjqv/lW0e3eYoI+ao8b
   ITVHLvzJj9W9KKOMVFBynxfnuY7B5HXJ5QaggJ3yjZrE1PqThZi6p2eRh
   w==;
X-CSE-ConnectionGUID: CcZzChViRXWshJcLJcqGcA==
X-CSE-MsgGUID: 39TWllKNRzaZSqdts8WxDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23499582"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23499582"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:30:51 -0700
X-CSE-ConnectionGUID: pb/Tlxs0SKiDGNNW7wjiuQ==
X-CSE-MsgGUID: 74l3oSr4Q4yytKDl2k7EHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65169306"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.148])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:30:43 -0700
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
In-Reply-To: <172536721812.2552069.2889737892670833119.b4-ty@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr>
 <172536721812.2552069.2889737892670833119.b4-ty@kernel.org>
Date: Tue, 03 Sep 2024 18:30:27 +0300
Message-ID: <87ikvcu54c.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 03 Sep 2024, Robert Foss <rfoss@kernel.org> wrote:
> On Mon, 12 Aug 2024 16:51:00 +0200, Marc Gonzalez wrote:
>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>>=20
>> Like the TFP410, the TDP158 can be set up in 2 different ways:
>> 1) hard-coding its configuration settings using pin-strapping resistors
>> 2) placing it on an I2C bus, and defer set-up until run-time
>>=20
>> The mode is selected by pin 8 =3D I2C_EN
>> I2C_EN =3D 1 =3D=3D> I2C Control Mode
>> I2C_EN =3D 0 =3D=3D> Pin Strap Mode
>>=20
>> [...]
>
> Applied, thanks!
>
> [1/2] dt-bindings: display: bridge: add TI TDP158
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/887665792b99
> [2/2] drm/bridge: add support for TI TDP158
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a15710027afb

Fails build with:

../drivers/gpu/drm/bridge/ti-tdp158.c: In function =E2=80=98tdp158_enable=
=E2=80=99:
../drivers/gpu/drm/bridge/ti-tdp158.c:31:9: error: implicit declaration of =
function =E2=80=98gpiod_set_value_cansleep=E2=80=99 [-Werror=3Dimplicit-fun=
ction-declaration]
   31 |         gpiod_set_value_cansleep(tdp158->enable, 1);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/bridge/ti-tdp158.c: In function =E2=80=98tdp158_probe=E2=
=80=99:
../drivers/gpu/drm/bridge/ti-tdp158.c:80:26: error: implicit declaration of=
 function =E2=80=98devm_gpiod_get_optional=E2=80=99; did you mean =E2=80=98=
devm_regulator_get_optional=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]
   80 |         tdp158->enable =3D devm_gpiod_get_optional(dev, "enable", G=
PIOD_OUT_LOW);
      |                          ^~~~~~~~~~~~~~~~~~~~~~~
      |                          devm_regulator_get_optional
../drivers/gpu/drm/bridge/ti-tdp158.c:80:65: error: =E2=80=98GPIOD_OUT_LOW=
=E2=80=99 undeclared (first use in this function)
   80 |         tdp158->enable =3D devm_gpiod_get_optional(dev, "enable", G=
PIOD_OUT_LOW);
      |                                                                 ^~~=
~~~~~~~~~~
../drivers/gpu/drm/bridge/ti-tdp158.c:80:65: note: each undeclared identifi=
er is reported only once for each function it appears in


BR,
Jani.

--=20
Jani Nikula, Intel

