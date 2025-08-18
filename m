Return-Path: <linux-arm-msm+bounces-69563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D02B2A23C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 021531890AF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C3226F2AF;
	Mon, 18 Aug 2025 12:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n18g+dpo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD233218D7;
	Mon, 18 Aug 2025 12:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521288; cv=none; b=gix3NoYo060eLL2WkoUn/AjXW6+wiO9Ohwef9TxKkNXLpyXBpanIfLIFI7mV9HumN6Orn4Qd7YLCzt4y2byAz5GXi3uU4oMJO+ygUTxUFbXigGwmwyI+2XgWc2W/sfCbaqeZrchgjqK7UPPEm9tWWmCJT0beKNROdntQGze1N4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521288; c=relaxed/simple;
	bh=RfJbadEG1WXqCbA+L6puR7/SdieeHuzNWBQVsVWP4Us=;
	h=Content-Type:Date:Message-Id:To:Subject:Cc:From:References:
	 In-Reply-To; b=YdV901cukZvcKgiv948icCFt2MnwQu3VZSJfRY3QaFH7mcsY4lX4+/mbbfgT3sRaqM8S7WsTN6Vm68itGPzWDeIjoujZPSNAdGP3LD8M+MDrRiErlYzo+8C8pX3VMX4U7sOs+1XyZhYx9gOaYRHBOxYi+3IBInqCqxoXtUF4xkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n18g+dpo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6107C113D0;
	Mon, 18 Aug 2025 12:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755521288;
	bh=RfJbadEG1WXqCbA+L6puR7/SdieeHuzNWBQVsVWP4Us=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=n18g+dpoNlQYiFSwWCCD/5j0vkRu2KWMp7n30uC9KZm2gl1yoABRwoZu4SWAo1Pnc
	 lEOQfrO1cf1h8/JCrZDhODe5if+suJh1egobeJQOCo5F42HylkYGAElk0clbJoJSQt
	 JQzWsQP6m54kk6GTaZU0YQW1NzQJacSGW+ZG4rKdlUttOixB335EGnZnyqP/JBsOyJ
	 a4SFHZV2vJ8NbR4xJiHSMuYrOCOJ/FWa1EgUZmtjXGSuZPH5z4OaBL9a4Fs2QhpKTP
	 Svn6rnvF+/gqVNVcWoE1i/n+G3w/B52a5MD20eEFlZ4pdZwbZBM/Ymz5f8VkHPvqKD
	 sPi//gt4b4ftg==
Content-Type: multipart/signed;
 boundary=c7999e395d5ad658028f60c4d5da8e05c74a2c659f013cb8ab28620f2f20;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 18 Aug 2025 14:47:55 +0200
Message-Id: <DC5KCSEUZQUJ.3KPENNUQBUFM8@kernel.org>
To: "Stephan Gerhold" <stephan.gerhold@linaro.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>
Subject: Re: [PATCH 0/2] driver core: platform: / drm/msm: dp: Delay
 applying clock defaults
Cc: "Rob Clark" <robin.clark@oss.qualcomm.com>, "Abhinav Kumar"
 <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jessica.zhang@oss.qualcomm.com>, "Sean Paul" <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Abel Vesa"
 <abel.vesa@linaro.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Nishanth Menon" <nm@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
In-Reply-To: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

--c7999e395d5ad658028f60c4d5da8e05c74a2c659f013cb8ab28620f2f20
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Aug 14, 2025 at 11:18 AM CEST, Stephan Gerhold wrote:
> Michael had a somewhat related problem in the PVR driver recently [1],
> where of_clk_set_defaults() needs to be called a second time from the PVR
> driver (after the GPU has been powered on) to make the assigned-clock-rat=
es
> work correctly.

I've come back to this and just noticed that the
assigned-clock-rates do actually work. What doesn't work is the
caching of the clock rate. That bug was then masked by calling
of_clk_set_defaults() again in the driver.

Here is what the driver is doing:
 (1) driver gets handle to the clock with clk_get().
 (2) driver enables clock with clk_enable()
 (3) driver does a clk_get_rate() which returns 0, although there is
     already a hardware default in my case. That got me curious
     again..

Now on the k3 platforms the clocking is handled by a firmware and it
appears that the firmware is reporting a clock rate of 0 unless the
clock is actually enabled. After the clock is enabled it will report
the correct rate. (FWIW, I can modify the hardware/firmware default
rate with the assigned-clock-rates DT property).

I've hacked the clock driver to register all clocks with
CLK_GET_RATE_NO_CACHE and then everything is working as expected.

I'm no expert for the clocking framework, but it seems that
clk_get() will ask the HW for the clk rate and caches it early on.

-michael

--c7999e395d5ad658028f60c4d5da8e05c74a2c659f013cb8ab28620f2f20
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaKMg/RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iUoAF+J3OaVC3IxUeIFloGDoJ8dv5T/iTrFSoA
+swW8sUuXrerXJYNsOz5CEpkMw5MWCHhAYD/qVKeufcrPpXb/T8mC9Q7mY7menjZ
YTiG9V2kBLg2wK8UiF2WoE+54Vcry3zejqc=
=y5fA
-----END PGP SIGNATURE-----

--c7999e395d5ad658028f60c4d5da8e05c74a2c659f013cb8ab28620f2f20--

