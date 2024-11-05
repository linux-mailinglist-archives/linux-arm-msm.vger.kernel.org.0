Return-Path: <linux-arm-msm+bounces-37087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C969BD9F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 00:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 486781C2118E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 23:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3571C1D45E0;
	Tue,  5 Nov 2024 23:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HII0ydHk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2F0149C53;
	Tue,  5 Nov 2024 23:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730850736; cv=none; b=rFqx2EenYRaxsDhxpDxd6U+dg0v/dj85ElZKTDJEal6QdnNKbJ30KytwGvY+vvcuISrcI30ELVtHDYRu9v8FIjZcK36WjQ1mAlfljyaWU74IeUDFUedk5dRe1+mPgpC5qOtJ2mFNTIl3y/t0dsYLJ2bi1UGFbBynXsC+g1lGLCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730850736; c=relaxed/simple;
	bh=9wnJ/RDSeWoiJUdNP0Uow5AMHKmQWu2URfnoiruZous=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=XSQtCP6HT3nf3CE6QlRVCUbNN9PbYhgnysQe+4UgXWtIaCWVudb5cBl21Ilnp791B4ocZkF8dfrWd7dXk40Lbr8uRQ2GX2fID5LwkwwPWVevVIcd3S7prHmR60tb4RwmDimpd0eaXitTRkNhRJTtpPYHhpmGYxKeMOH173ClU4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HII0ydHk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D414C4CECF;
	Tue,  5 Nov 2024 23:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730850735;
	bh=9wnJ/RDSeWoiJUdNP0Uow5AMHKmQWu2URfnoiruZous=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HII0ydHkTOJjKyLQD+5PEHXMwKiTCmGDEzUyDIVmIcY8L3F47Els3NVgs9fKonfqM
	 N8IOZYmH3+fz+SpLRFljKaWy+/VpMf5dOu3ttqtSqWT+gTd9/tRhDtS+cHINKLMSZ0
	 CEKhy/RKXfw2tUzWN/Ldlu7gY3FB5rGdzmH6JNxfKr8OpM2y4JDpbrGGiychrTNgZp
	 hJWMitPckffcqu9U1ZXs0UOXhppfvtZnWaYcYPfPxFms5Gj9NbylHrr15Zp0FM7mW8
	 jNhrlkDdVW7L76/lqyyhm1GOMCwfYAnPEKNTgQDdh7KeedJsGIF+U5vxkI7ueEQt+U
	 sTdxfyagDBE3Q==
Message-ID: <b312fadeefe5b77b8189f11570e0e109.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241102223956.868257-1-andersson@kernel.org>
References: <20241102223956.868257-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock fixes for v6.12
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>, =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Johan Hovold <johan+linaro@kernel.org>, Qiang Yu <quic_qianyu@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Tue, 05 Nov 2024 15:52:13 -0800
User-Agent: alot/0.10

Quoting Bjorn Andersson (2024-11-02 15:39:54)
>=20
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>=20
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-fixes-for-6.12
>=20
> for you to fetch changes up to e7f37a7d16310d3c9474825de26a67f00983ebea:
>=20
>   clk: qcom: gcc-x1e80100: Fix USB MP SS1 PHY GDSC pwrsts flags (2024-10-=
22 15:35:15 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes

