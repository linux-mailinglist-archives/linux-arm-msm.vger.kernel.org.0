Return-Path: <linux-arm-msm+bounces-74350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB8DB8DDCC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 18:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC80E1898CA8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 16:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865D31FF7B3;
	Sun, 21 Sep 2025 16:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3pK0p0q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594B71F37DA;
	Sun, 21 Sep 2025 16:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758470405; cv=none; b=A111TEIYH2zxBml2L86zwW2UE3hBByzDBJ/QNjnhpGAd8BEEsjG0Y6UWXa3/poz853o1aLqfJqCvZchIIj8S64fFffg23LDKem+Gz/paKoiQ7FMLF5u+nZ/y6/6Uy5NdN7sms49aIoGdunniHf20yz3tUW01tlfYX7YAyZdx9lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758470405; c=relaxed/simple;
	bh=cm6J+UUm0Yhk5gWtzjh9epyLXB2qW6PN/nEAcS+Q3eo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=LbxNljaZz44WFxQhiUi3S/t4rSKgckyOT235qTheJkfU3WLdwmgu/oLbGx9djr5IbcpxRN0nkjd0rTRQ8OSeufB7CMmd9+aiYjnG/H6lpjNBUujh6FQgaaYbW7d0DGJ8Po3aVYdutTxM+8Iz0QkQ/MGbxl/DEyDKzGIb+d+3Gws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3pK0p0q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85221C4CEE7;
	Sun, 21 Sep 2025 16:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758470403;
	bh=cm6J+UUm0Yhk5gWtzjh9epyLXB2qW6PN/nEAcS+Q3eo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K3pK0p0qVU3h0AxJ4/wvHpEO+P/uqi3mIvu1GLcvOj88VReiPu3Z58Vbto8aNql4c
	 Zy9xggoNLA/bi2x0KftoQxI4pI6wtnScf3db7c6OTXEZBQjjeXWvS+cw/tb2aHzQJa
	 YcZMFDYeFDsGCIf3q5wgQMXndu2xDkA6I0EJ/8BHIJ0vioLYjX/M9f69zO305AAxyl
	 i+Caud7at4YXkNwO2CEtZFzb7pBo2EOz5D+2wZCwnFRK46uuK+7l/kL3PYOeTlYO0x
	 RiUHgaxr67xkqxf+0FMpBpYI1vzqpz5LkzCXcmW01aL24/6P6eDTR0mxPSy4qlgOI6
	 B2v6u6lRknFBg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250921022925.599022-1-andersson@kernel.org>
References: <20250921022925.599022-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.18
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Taniya Das <taniya.das@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Nickolay Goppen <setotau@yandex.ru>, Sricharan Ramabadhran <quic_srichara@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Brian Masney <bmasney@redhat.com>, Dan Carpenter <dan.carpenter@linaro.org>, Daniil Titov <daniilt971@gmail.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, Johan Hovold <johan+linaro@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, Marko =?utf-8?q?M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Sun, 21 Sep 2025 09:00:01 -0700
Message-ID: <175847040126.4354.10132480274472842830@lazor>
User-Agent: alot/0.11

Quoting Bjorn Andersson (2025-09-20 19:29:23)
>=20
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>=20
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.18
>=20
> for you to fetch changes up to 4ca6a89f38718d6cd84304e6a26e7ddc90e03356:
>=20
>   clk: qcom: gcc-sc8280xp: drop obsolete PCIe GDSC comment (2025-09-11 21=
:09:29 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

