Return-Path: <linux-arm-msm+bounces-20169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBD08CB57D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 23:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E749B2116F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 21:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E697958AA1;
	Tue, 21 May 2024 21:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWwxnWXR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FE3487B0;
	Tue, 21 May 2024 21:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716328028; cv=none; b=gA7c8QHOWR8GvHEqYdbr2TdmN9Py8QcA5tEmioQGe9fKOM371hOJteO0wd2ko5tfDpIbNYcfSeUxcE6kEKjmduOvnkjm9cFKZPdWCSEqFcQVApfrqfGPU5bkL2lOxcKk8YnTI6qaU2hhw0MIN2qD/ZA4oFwQq0K70vkuRhTv7XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716328028; c=relaxed/simple;
	bh=3ja++l8gegiuSd+IaT5ZeNri5Jl4TETtWWgt1Pg1pBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVi1yTZn9Aa+lpLM328BhmCfuA1u/2h7S/N6IPtmQrzt1aljUmBabi8tBFVKbxp2zOVmd9Zfqh4X1OPju+kb4WUUfQw5i1KtNzlk84uUVQOYDGhYU7rAEjiwGxhoBO8Ut23L1r9/3ERufKTBm4mDWeZEk8ZQzJ2Jwjz5VMJNgjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWwxnWXR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05963C2BD11;
	Tue, 21 May 2024 21:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716328028;
	bh=3ja++l8gegiuSd+IaT5ZeNri5Jl4TETtWWgt1Pg1pBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWwxnWXRqIOapVN68IqprVwN1owlDAa6N6/i2s81DmrI7zF0CbqRs3mJeDEC0uP9t
	 RUawJ62IJcw83KlU5jlnFI0txLkbrGUNma5ltJm7qjLr2EPMtuk7P2O+XZLSPlPUFH
	 rNIdY/MbsR9dzTtF+Ba3+RMejpUvSE81L/Bq2iUmVb4o7w51xGSx26CGySoAXrGx62
	 7YAFJ4ZNgTek3TJO/EIEq0ZevpEm/d7WK4jIxirobEabagXvqtUmrEYVkK2gscvuvN
	 bYyMKU48/bXhZio0qWHXeGM4Fxe5EY4z43i96kRi/uzEkM+Ck/t7j14NTWlr8irT4M
	 GuazqKnd6b7uA==
Date: Tue, 21 May 2024 22:47:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Elliot Berman <quic_eberman@quicinc.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Amrit Anand <quic_amrianan@quicinc.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	"Humphreys, Jonathan" <j-humphreys@ti.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Jon Hunter <jonathanh@nvidia.org>,
	Michal Simek <michal.simek@amd.com>,
	boot-architecture@lists.linaro.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RFC v3 2/9] dt-bindings: board: Introduce board-id
Message-ID: <20240521-reroute-drainer-af9c5b80afa3@spud>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <20240521-board-ids-v3-2-e6c71d05f4d2@quicinc.com>
 <20240521-bonfire-backboned-9ef33c10d447@spud>
 <20240521-unskilled-spindle-c4161092ae83@spud>
 <CAL_JsqJjvNfr_Vo7JNsBn6Fcv5r--ZqQTiforSLwrZ-z4_mURQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HYLZW+tE+PSJkClw"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJjvNfr_Vo7JNsBn6Fcv5r--ZqQTiforSLwrZ-z4_mURQ@mail.gmail.com>


--HYLZW+tE+PSJkClw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 04:32:16PM -0500, Rob Herring wrote:

> boot-architecture is not private[0]. It is where EBBR gets discussed
> amongst other things. This came up in a thread there[1].

I dunno man, in my book any mailing list that rejects non-member mails
is private. Or outright broken, take your pick :)

I don't care if a private list's subscribers miss part of the discussion,
but it's list owner probably should, whoever that may be.

> [0] https://lists.linaro.org/mailman3/lists/boot-architecture.lists.linaro.org/
> [1] https://lists.linaro.org/archives/list/boot-architecture@lists.linaro.org/thread/DZCZSOCRH5BN7YOXEL2OQKSDIY7DCW2M/

--HYLZW+tE+PSJkClw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZk0WVQAKCRB4tDGHoIJi
0pwFAQDFFUs7sBteTrPNKO67mthOWORfHlXs8gaDDSsN/GgjpAEAm2mi3SFSxt12
Gy0Yt4cta4KwcbUmXjcpHVs1u1+XEw0=
=IEN1
-----END PGP SIGNATURE-----

--HYLZW+tE+PSJkClw--

