Return-Path: <linux-arm-msm+bounces-34797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 805CA9A2B9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 20:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3473128618F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 18:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848031DF246;
	Thu, 17 Oct 2024 18:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzx6aBQ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C01762D0;
	Thu, 17 Oct 2024 18:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729188203; cv=none; b=Ck+H6i8HV1bvo2de86k27pVlGqvqrt2DnuXmKLofneeFV4JErIL60xXROoRPLwhxPa/RII5xCFSMhvm2RBvKGRo7x6uArtrb0pTcQ7J9fHyC7zk0Uo8W9GtwsqUUXVQhFDH2IHNSHAMKJpM6gPZkBmmJIzFy3zAfz9AeUcAqiXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729188203; c=relaxed/simple;
	bh=9owNnoaEPwguo33qITS6ZXvMBbuIoEJY640hlgf0lL0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ukG5sfsOy+Crwosu9F/cJrZQaDCXU0oq8FqduTBsCzBomh+wbfIs2GQ6bW6Rd61g0XdNsrFFNyWChE0DH49NijteeI8pjOj2Z75iB5fG9EkcgNmL5L9S0O+/rPbDg1RAg/KdfgsDsCQlaOIA1ZRoPM8Gx5NhVf2lMln/5rQ7CYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzx6aBQ7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11945C4CEC3;
	Thu, 17 Oct 2024 18:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729188203;
	bh=9owNnoaEPwguo33qITS6ZXvMBbuIoEJY640hlgf0lL0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kzx6aBQ7k6BRWyRtT0F7NlU2fhAnSLymYVoVY4gKC9cgVORrdrRjwhpJYk89LJ6oa
	 w3RPncO1xyMhTrumiqq3Czj2VYG10Vwg/sXZ18k3spdEJFd6P5hOg04tE/dXywb5kY
	 QEg7CJtj1bdbVq+L12BhX6S1wzsEF0iHjfkiEu65DWLG6CvK8KZ4HuHFESAxbBLfQc
	 5QfxA22PU2P4zXNliOKztKBrNuGC3TVeUHmWOd5DXLyNZrOwbNktSelM1KZsojWalh
	 e7g/pg1a0YpJWYeyv44JTPdCNx3PZFy6HLodHAWjoImtiWOPqSc5zUEXJ4GmHVGq6e
	 +ybUTjxS4rMmg==
Message-ID: <d7989a770f0eb35a5ba346beb5e7548c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241017-sar2130p-clocks-v1-6-f75e740f0a8d@linaro.org>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org> <20241017-sar2130p-clocks-v1-6-f75e740f0a8d@linaro.org>
Subject: Re: [PATCH 06/14] clk: qcom: clk-branch: Add support for BRANCH_HALT_POLL flag
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kalpak Kawadkar <quic_kkawadka@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 17 Oct 2024 11:03:20 -0700
User-Agent: alot/0.10

Quoting Dmitry Baryshkov (2024-10-17 09:56:56)
> From: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
>=20
> On some platforms branch clock will be enabled before Linux.
> It is expectated from the clock provider is to poll on the clock

Unfortunately 'expectated' is not a word. The sentence is also
grammatically incorrect.

> to ensure it is indeed enabled and not HW gated, thus add
> the BRANCH_HALT_POLL flag.
[...]
> diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
> index 229480c5b075a0e70dc05b1cb15b88d29fd475ce..c4c7bd565cc9a3926e24bb12e=
d6355ec6ddd19fb 100644
> --- a/drivers/clk/qcom/clk-branch.c
> +++ b/drivers/clk/qcom/clk-branch.c
> @@ -76,6 +76,7 @@ static int clk_branch_wait(const struct clk_branch *br,=
 bool enabling,
>                 udelay(10);
>         } else if (br->halt_check =3D=3D BRANCH_HALT_ENABLE ||
>                    br->halt_check =3D=3D BRANCH_HALT ||
> +                  br->halt_check =3D=3D BRANCH_HALT_POLL ||

The name is confusing. The halt check is already "polling", i.e. this
isn't a different type of halt check. This is really something like
another branch flag that doesn't have to do with the halt checking and
only to do with skipping writing the enable bit. Maybe we should
introduce another clk_ops for these types of clks instead.

>                    (enabling && voted)) {
>                 int count =3D 200;
> =20
> @@ -97,6 +98,10 @@ static int clk_branch_toggle(struct clk_hw *hw, bool e=
n,
>         struct clk_branch *br =3D to_clk_branch(hw);
>         int ret;
> =20
> +       if (br->halt_check =3D=3D BRANCH_HALT_POLL) {

Remove braces

> +               return  clk_branch_wait(br, en, check_halt);

Remove extra space      ^

> +       }
> +

