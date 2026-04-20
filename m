Return-Path: <linux-arm-msm+bounces-103806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NZtI/dc5ml6vQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:05:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4254308A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 918FF302FA0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C86347BA9;
	Mon, 20 Apr 2026 16:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvXVoNzk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3068334C39;
	Mon, 20 Apr 2026 16:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702576; cv=none; b=TRYe/p7sf6YF6FeiXSX1DzH2WwjzWMJ4LOlLof4RM97Slmo0u1omP0ihEOJD3ew3fHQNUzc1wyZmyX3y6J9iuMln+ergvZirEO3mw4TxxgZiIi5x04za16/wS8RAD3atc3f93lBeKS5J5PAy5Qz76x+9B+1oQfEIllfB/dQB7gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702576; c=relaxed/simple;
	bh=YQdW17/AA+lxKC8kcF6WCd+KieSYnqe1M+yeYbAJevQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNxbTITjXGQuPo1GqTo+EQD1W/+PV35K69sTyDoNJPWk56KjKWRvca1AMpBzeUHS+XKaQ69k1m/E0i41aO3V2S+vU2HTRuC5eATKkvZcJeppWJsEsNHWNtelzdm/L55ziatZ+5Ozh/W+w46PpzhXlAnGIY/9UoaNYaaM+iMIP28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvXVoNzk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4E6C19425;
	Mon, 20 Apr 2026 16:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776702576;
	bh=YQdW17/AA+lxKC8kcF6WCd+KieSYnqe1M+yeYbAJevQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FvXVoNzk69Ys7W/EUulIQI0838gefgkQ9GwC+3lPvOOSCaVoN94T+1EBB0fwM7i50
	 18LGyJW37bJl/QhOSwrqNWp3qHfNtn5NqbeiueuXuYoGF+FkzZlKrxLbl6CdroPKEj
	 sQ/HpdDkhD8kE6FAKt7gcBKtjlW+Q97sKY6+BUZBIJMcwUmVGuBEHluVlHDjl0Ts0Q
	 A26Cabm/xPwX6alUmvAyNMd5CTPa70AUA5TmgaFOAYXmcvZgNjwnpR/K9cVH/8iuD9
	 /FgD9x86LQgUWAxYleONY1p6sqvQEj6JHvy/L19NRIdCfKK51hNb0pzOjHThaE6u8a
	 m0m34d/o+tKzw==
Date: Mon, 20 Apr 2026 17:29:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] spi: qcom-qspi: Fix incomplete error handling in
 runtime PM
Message-ID: <c38284d9-f7a9-4a0f-a4c7-cafdb1a1f720@sirena.org.uk>
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-2-7de325a29010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YEPl/+bK0ZzKjQuR"
Content-Disposition: inline
In-Reply-To: <20260420-spi-nor-v3-2-7de325a29010@oss.qualcomm.com>
X-Cookie: Sales tax applies.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103806-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A4254308A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--YEPl/+bK0ZzKjQuR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2026 at 11:42:49AM +0530, Viken Dadhaniya wrote:
> The runtime PM functions had incomplete error handling that could leave the
> system in an inconsistent state. If any operation failed midway through
> suspend or resume, some resources would be left in the wrong state while
> others were already changed, leading to potential clock/power imbalances.

> +err_select_default_state:
> +	pinctrl_pm_select_default_state(dev);
> +err_enable_icc:
> +	icc_enable(ctrl->icc_path_cpu_to_qspi);
> +err_enable_clk:
> +	clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);

clk_bulk_prepare_enable() is marked __must_check.

--YEPl/+bK0ZzKjQuR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmVGoACgkQJNaLcl1U
h9Ba5gf+OY3mSJsyMuuK/3icHqIuZZc7jH+z0LwxA2Ylmkj87+5SXH0OjYYC7yKU
auSZV8+2y6dBPMt5ilAGf3KOrLo+Lshc8dz1aCXTgJv6KoTLrcGQIO430yLmC7to
B9NgPMmiwUjAxahjPC4LhvHWYFFMFAkBF+ieNWkhNTOgMuW7hpGPPK0McxkaMMqh
vavTM4IqAN1B/Pr/PhKah/YbEV4QiLj7sM8g6gfCiDOFj9qXHD42nanwNIkXKUY3
S5Lsa/5vdPa5gqI9xuA8pLAjs1amw7tZWc/hW72XsSGoV55RdM3ltHaNr7k6kZy+
HJ605If84trsQZjMGjxeRdkfo5E56Q==
=AKIL
-----END PGP SIGNATURE-----

--YEPl/+bK0ZzKjQuR--

