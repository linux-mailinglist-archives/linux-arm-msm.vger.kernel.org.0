Return-Path: <linux-arm-msm+bounces-74568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 257BBB98F22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 10:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D985F3A59E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 08:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C582228A704;
	Wed, 24 Sep 2025 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3Ha+zzY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7F8284B4E;
	Wed, 24 Sep 2025 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758703324; cv=none; b=sZEnR6CtcLEO0bhClswIhPO6kZHL2ZaN4AX4NOCQZJu2ksLGfkAn5BJRn7TlHH76NEp5dNb1uvkpnEjp3sTUObgyi114nmnjNiFUkD//GVT7LpjdJNZEu18kcU00zL0Hzr8pWRwdj2tG3yoXvWzPIg2h2EAqCYx8NdZFEeLmmN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758703324; c=relaxed/simple;
	bh=auJYwJ+cyPyFLvcVPi26gr8jccoOsGsQ/OB2oIB5N+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNs26uOBF265keo2aNMz0SjBmSuss6Wd1/OWOLqjzLTOCMk/IQ9P9WbWWwf8ZMYeOqZL+Uisg/FiA63g7s2jHQj7l8Gafb9howDmEWJMSM8SLesPyrqGsHMz24xhQt5/sz8kxiz0vO2RZxI/keSQwU4zdYG0bo3ivkdfQoTtC14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3Ha+zzY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30213C4CEE7;
	Wed, 24 Sep 2025 08:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758703324;
	bh=auJYwJ+cyPyFLvcVPi26gr8jccoOsGsQ/OB2oIB5N+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o3Ha+zzYBOSQQQYu1+P54hFmQsHGKQ+/XfotMehklDSY7O4SJlxeIHrYcmqxNvJSI
	 acewltwPW/vxbDNHV2Ip1HDL8i/21OoOeild74xSGR64Os6jUI64ZvKlJctWafexfM
	 4dW6ztb4ygfN15HQdSztjNSgjBNnJiTZWR75zzFNRLEkDCYFnOs/m+v5OFono616nx
	 Is232iJ51PAm0WYL+cQy2nolYFcnWVmb8cxQj4tX4h22NXN1hH7ivkVjlgOS61F2KS
	 cZYiBmyBboMN0FJauy8tVlvD8K471jNLMBImHsnMUF/VptMdcFmrPky76F9MwbRd5z
	 A0zLL9m12FnvQ==
Date: Wed, 24 Sep 2025 10:42:01 +0200
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound: soc: qcom: use sa8775p/ subdir for QCS9100 /
 QCS9075
Message-ID: <aNOu2ZnBXeqNXdJ8@finisterre.sirena.org.uk>
References: <20250918-lemans-evk-topo-v1-1-9680600e62d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yVEte8S97JDuXU9I"
Content-Disposition: inline
In-Reply-To: <20250918-lemans-evk-topo-v1-1-9680600e62d4@oss.qualcomm.com>
X-Cookie: Filmed before a live audience.


--yVEte8S97JDuXU9I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 18, 2025 at 05:41:52AM +0300, Dmitry Baryshkov wrote:
> All firmware for the Lemans platform aka QCS9100 aka QCS9075 is for
> historical reasons located in the qcom/sa8775p/ subdir inside
> linux-firmware. The only exceptions to this rule are audio topology
> files. While it's not too late, change the subdir to point to the
> sa8775p/ subdir, so that all firmware for that platform is present at
> the same location.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--yVEte8S97JDuXU9I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjTrtkACgkQJNaLcl1U
h9BStgf/XpuYwx/3L8j1Z43CTYp48DfN5BQ0J1tRag7XO9ZF4DjZoCrm/OkCd5P1
Ni5PIrng35htiBf9x7ZA3pEJ/d9+WHLMAZBTAvyXSOzB/QQ7cs84/oJ4GgBkkH9y
jIQNKgNplOXPtGikem2sMJpE8MNKDkrZt8Eb/4Zm8QFhc3EtNHVLlBf7jWN1jYPp
tuc2tMr0a0zp9l+APi7bod2YkIqKtNXeEB0iamk1yjZ6TLdhE3ecBrF4s9UIEqEo
2paC3NS4E/JNiY9DU9Me7/6XJ9bUYG2sPNuTFaUBTHIFtzeqweIAdMSqubaUEY25
c32XZKR2DSKGqFlDl60aP0B1HHUjdA==
=MJVp
-----END PGP SIGNATURE-----

--yVEte8S97JDuXU9I--

