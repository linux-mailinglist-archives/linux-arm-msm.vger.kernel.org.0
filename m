Return-Path: <linux-arm-msm+bounces-30317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA97D966C41
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 00:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9246B284637
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 22:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8B11C2307;
	Fri, 30 Aug 2024 22:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYxrm/Nm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E731C1ADD;
	Fri, 30 Aug 2024 22:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725056661; cv=none; b=lgcYUr+PmFCE4Iajus0qJUHyDx3b4xd3Wuvuu0RiGruonI+DdowUyA+gnX+ttaVfQ8hpwpTLGIaHxfKeqwXGPbj87ys7LMGrIQF7y1Gw6aAaU+X6w5jax7Q7PqgNRaBCMAh1l9X1fFqRZeEWRtjH3rRBV/5QmDNIj2fiZB60A58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725056661; c=relaxed/simple;
	bh=tWP459tjU7LJnpj72if5jNzojTE3v+xzK/7UHnew5Po=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=OYHmDNIB4a9u+V06SexJWTg3RfpMXej1LmPj6YKtcTThPwYkyHKpyAGkDiEkQ4RjkYnMQVbg0PwabcU+MbcEW4caPuUQvjJSRspQveS0f2a9L37D2vak4gH+eEWsH+z0eysc60QY+jBgj6xlvplsioY+F9mHxX7Z94IWp+uRxQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYxrm/Nm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283C9C4CEC2;
	Fri, 30 Aug 2024 22:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725056661;
	bh=tWP459tjU7LJnpj72if5jNzojTE3v+xzK/7UHnew5Po=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oYxrm/NmgImPQzJHr75X/xK20n+JKF4sHrKYO+yw+OCg7F+YD0W5UiNHViN9id+H7
	 xUTxUrL8PfoisNFAjePH4JebEMf4VbdofvQB+OpV8q7/UC3qItx7JLtUhTi3bMhy0C
	 V2vgaL7d2xNmfZtvy7RsV44OCLm0t7/3FwpdZc8nd17dOvdjGdzBhl+LH+KrcV2sY4
	 rb0S9y1RSO8sQIxogl1pvBFmWMZtD+4rzcQrdfC5vUu4C5fubXSLxLUAXNIsTYT3K0
	 tCLFY3nCZGlHF/wsQOgl5ONFzUv5XQ3vPMv+AvjS3K5bUV+Hh4k2vIpNljOGldFbtT
	 z/l1MscwAjobw==
Message-ID: <04944b77ce6327ba5f4ec96348a9cda2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7736d0d0-634d-403d-b70f-f33b7402456c@quicinc.com>
References: <20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com> <20240827-qcom_ipq_cmnpll-v3-2-8e009cece8b2@quicinc.com> <d7b374670eb2f6d442f351106ab1221a.sboyd@kernel.org> <7f4d41a0-b1b9-4b63-8590-63f4fcf1a359@quicinc.com> <7736d0d0-634d-403d-b70f-f33b7402456c@quicinc.com>
Subject: Re: [PATCH v3 2/4] clk: qcom: Add CMN PLL clock controller driver for IPQ SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
To: Bjorn Andersson <andersson@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Jie Luo <quic_luoj@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>
Date: Fri, 30 Aug 2024 15:24:19 -0700
User-Agent: alot/0.10

Quoting Jie Luo (2024-08-30 09:14:28)
> Hi Stephen,
> Please find below a minor update to my earlier message on clk_ops usage.

Ok. Next time you can trim the reply to save me time.

> On 8/28/2024 1:44 PM, Jie Luo wrote:
> > On 8/28/2024 7:50 AM, Stephen Boyd wrote:
> >> Quoting Luo Jie (2024-08-27 05:46:00)
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 48000000:
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 val |=3D FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 break;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 50000000:
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 val |=3D FIELD_PREP(CMN_PLL_REFCLK_INDEX, 8);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 break;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 96000000:
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 val |=3D FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 val &=3D ~CMN_PLL_REFCLK_DIV;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 val |=3D FIELD_PREP(CMN_PLL_REFCLK_DIV, 2);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 break;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return -EINVAL;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>
> >> Why isn't this done with struct clk_ops::set_rate() or clk_ops::init()?
> >=20
> > OK, I will move this code into the clk_ops::init().
>=20
> This code is expected to be executed once for initializing the CMN PLL
> to enable output clocks, and requires the parent clock rate to be
> available. However the parent clock rate is not available in the
> clk_ops::init(). Hence clk_ops::set_rate() seems to be the right option
> for this. Please let us know if this approach is fine. Thanks.

Sure. It actually sounds like the PLL has a mux to select different
reference clks. Is that right? If so, it seems like there should be
multiple 'clocks' for the DT property and many parents possible. If
that's the case then it should be possible to have something like

	clocks =3D <0>, <&refclk>, <0>;

in the DT node and then have clk_set_rate() from the consumer actually
set the parent index in hardware. If that's all static then it can be
done with assigned-clock-parents or assigned-clock-rates.

