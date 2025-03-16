Return-Path: <linux-arm-msm+bounces-51551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D80FEA6380E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 00:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D75103AC379
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Mar 2025 23:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A2A19DF64;
	Sun, 16 Mar 2025 23:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVoBsy+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3842E3377;
	Sun, 16 Mar 2025 23:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742167990; cv=none; b=Lpox/u2UH6Jegw8SqpjL59wceNyk3Mi4prJlLBQX96K80YOpTZHBLZaffN5C5CSTD6ukxeKHDnMPW3zf2U/f5O80hPRIyl3ksx8D5IEBio+bfn9BiDaaAJewVqEnXy3Ae7TzWzceVBtqU4XXQnuSjN0veDkub3LVI4IZrqvXCEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742167990; c=relaxed/simple;
	bh=+RdAGIaxHX7bwnKUyQ7kSq95LIsGjgBwkYUkV8TqxtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1AmROergPDPXoOpGADVVrC1NlqHbGI7AF1xvY9XlkBHqz0BXBzZ0kcpfAOLvhSjM5GlygD1oKX796IH2Er5KesHgAYjGGeHDyCuZImNt0QQd1KqXDlGrTYFaqx4fu8MG/ZCFX6D8Mm4QyfC2X57Q5s4GGZFPBgv7TQnPiCc9+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVoBsy+7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25196C4CEDD;
	Sun, 16 Mar 2025 23:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742167989;
	bh=+RdAGIaxHX7bwnKUyQ7kSq95LIsGjgBwkYUkV8TqxtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVoBsy+7Ua1debpkl9iA93PjU1R9HkrMchwKTmjGXDe0jvFVpKOqmNbkaCVfvZYO2
	 w3r1IaSC7uEbP/qre5VTLW4YZqXMSYQtOg/+jp0A45Vk77kC3j/kAJDTW+lqwExlmH
	 RXxfaG8bkAWCg8AbLsjvTPCAq5aogK1aGst30LMfce2+DuCgW/M7IMY9t+XmasGzGJ
	 qwrVx/kN4B/tpGbYioTDyJKVNg32coSMGQ+CVkUm6eBnzCyv/wej+fblQVHhf/EYGU
	 qZ2VXIcAM8wNxNdTIJd11lNBqjvayzuNPCuWF8Qgskodxycu0VSEbvh5FVDTj/jMXb
	 FiZqAQLUBKqGw==
Date: Sun, 16 Mar 2025 23:33:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, lgirdwood@gmail.com,
	krzysztof.kozlowski@linaro.org, perex@perex.cz, tiwai@suse.com,
	jdelvare@suse.com, linux@roeck-us.net, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: wsa883x: Implement temperature reading and
 hwmon
Message-ID: <3e08b501-f8d0-4e68-874e-b578e7c82c47@sirena.org.uk>
References: <20250107114506.554589-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OCok//t2D0bPMFMD"
Content-Disposition: inline
In-Reply-To: <20250107114506.554589-1-alexey.klimov@linaro.org>
X-Cookie: See other side for additional listings.


--OCok//t2D0bPMFMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 07, 2025 at 11:45:06AM +0000, Alexey Klimov wrote:
> Read temperature of the amplifier and expose it via hwmon interface, which
> will be later used during calibration of speaker protection algorithms.
> The method is the same as for wsa884x and therefore this is based on
> Krzysztof Kozlowski's approach implemented in commit 6b99dc62d940 ("ASoC:
> codecs: wsa884x: Implement temperature reading and hwmon").

This doesn't apply against current code, please check and resend.

--OCok//t2D0bPMFMD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfXX6sACgkQJNaLcl1U
h9DXuwf+Iumuo+aTKbUGLqCm7PPrjLue6R9kM7Y16mhT16/D1xxHeGTAJo9dZEkZ
ZDYwv9lpZI0xGVDlk26AI2rTCqHhNkUCsGNoKH5x/1tcFBvZ0h9NAGdIdhxaGc86
d5Wv6kCl6TxBW6VgWRnn+D5GkFgTb7tQOYjFs6pxip1RK1Yzxu0tYcSaybZ0Prk2
rrTVDF6KZNusPMV1KRvi+74U+ci8++5Q83Sy45N318onuNx8LNWEsujKbGnFjVE1
6pqHOitUXMmaAAflW2tMXmgu4obTSZBT7PJSbJnlecEIzQdQHjcC4WMQWfHyEA62
M69y/I6WmmLgGzb3wO1Ccw8rRprQAA==
=MxSd
-----END PGP SIGNATURE-----

--OCok//t2D0bPMFMD--

