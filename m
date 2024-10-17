Return-Path: <linux-arm-msm+bounces-34792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3DE9A2B23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 19:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43BCF1C21678
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDE11DFE16;
	Thu, 17 Oct 2024 17:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="glSQ5Ir0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D421DF990;
	Thu, 17 Oct 2024 17:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729186803; cv=none; b=fAgc9GTsfY1+A6uo3L/AngUoxdWlNw1OdvL0ktYy4v6zQPJbJlizwdK3NJHoNU25KJuo/4Y1X1ZDMVwpTpdJkpM7ti+pk92BrKiqA/cKI2ZIloi4UBXIy+5HQ3825Ipky2Tkyo3YNCGnuSCP0aa65EVf7tVZqYX926qQby7d1Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729186803; c=relaxed/simple;
	bh=eGmzCTTfolXYxIXlEZqURsG7yQDabkHprLnAi5gYhRI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=VfKE9Xj+lJBeKj5kXwTwAwKUbm3bxGeZtVkeC/7CtdCICoUBfbbf2VCikSaRpvHMye9QChvb83cVmd/5gWXiHQxfYQss5DoklJcQ0iWBv+DV3IuxqkE6ekX91zDzR34XctJvSSEnlA5RMajBBkIgtssN/gkJeOibGr4Uh3sZx9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=glSQ5Ir0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A434AC4CEC3;
	Thu, 17 Oct 2024 17:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729186802;
	bh=eGmzCTTfolXYxIXlEZqURsG7yQDabkHprLnAi5gYhRI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=glSQ5Ir0IXJdd/DeUA5hVUP66u5XhWUN6wV15v/3chTzXH2EC52CLjSCxotkXSVLs
	 iOCN+0WeaOEu70juaaAyZs780Zw+p4mm+hbncREiNoJGmecpmMTtErM2KHdAFP109D
	 RoS23lVxMok6ihFN0zQ+EevZNq8UHuTvAayD/4k8ehQ8rVh1CDAH7gtaFooBfOZ7YT
	 goshtYZyc4FLIKmT4p2zLif7czqgGLeMaYNPh7oWd/JJ/dFEuP5OWaRPylkxyaRrZx
	 uNBkx5IlfjsQq5WDwD3FmyLJ8DEqo2Faq3wWa2ZKrmO7JtKt+2lUPTR28rzbM52ZCC
	 5xRMQNYHXHmrg==
Message-ID: <6bb3565e576062c781e29e414483daec.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <daa8998b-a008-42cf-a941-00218683cce2@quicinc.com>
References: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com> <20241015-qcom_ipq_cmnpll-v4-2-27817fbe3505@quicinc.com> <77ad972276c165acc3d0e9d72df1a021.sboyd@kernel.org> <daa8998b-a008-42cf-a941-00218683cce2@quicinc.com>
Subject: Re: [PATCH v4 2/4] clk: qcom: Add CMN PLL clock controller driver for IPQ SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
To: Bjorn Andersson <andersson@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Jie Luo <quic_luoj@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>
Date: Thu, 17 Oct 2024 10:40:00 -0700
User-Agent: alot/0.10

Quoting Jie Luo (2024-10-17 08:35:43)
> On 10/17/2024 5:37 AM, Stephen Boyd wrote:
> > Quoting Luo Jie (2024-10-15 07:16:52)
> >> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> >> index 30eb8236c9d8..3def659fc5cb 100644
> >> --- a/drivers/clk/qcom/Kconfig
> >> +++ b/drivers/clk/qcom/Kconfig
> >> @@ -190,6 +190,16 @@ config IPQ_APSS_6018
> >>            Say Y if you want to support CPU frequency scaling on
> >>            ipq based devices.
> >>  =20
> >> +config IPQ_CMN_PLL
> >> +       tristate "IPQ CMN PLL Clock Controller"
> >> +       depends on IPQ_GCC_9574
> >=20
> > What is the build dependency?
>=20
> Will remove this dependency. There is no build dependency on=20
> IPQ_GCC_9574, but only a functional dependency on the SoC's GCC block
> since the CMNPLL consumes AHB/SYS clocks from the GCC.

Ok. It can probably be a select or imply statement then.

>=20
> >=20
> >> +       help
> >> +         Support for CMN PLL clock controller on IPQ platform. The
> >> +         CMN PLL feeds the reference clocks to the Ethernet devices
> >> +         based on IPQ SoC.
> >> +         Say Y or M if you want to support CMN PLL clock on the IPQ
> >> +         based devices.
> >> +
> >>   config IPQ_GCC_4019
> >>          tristate "IPQ4019 Global Clock Controller"
> >>          help
> >> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn=
-pll.c
> >> new file mode 100644
> >> index 000000000000..f5ebc7d93ed8
> >> --- /dev/null
> >> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
[...]
> >> +       }
> >> +
> >> +       ret =3D regmap_update_bits(cmn_pll->regmap, CMN_PLL_REFCLK_CON=
FIG,
> >> +                                CMN_PLL_REFCLK_INDEX,
> >> +                                FIELD_PREP(CMN_PLL_REFCLK_INDEX, val)=
);
> >=20
> > The determine_rate() function shouldn't modify the hardware. This should
> > be done in the set_rate() callback. Likely you'll need to use
> > assigned-clock-rates to do that.
>=20
> OK. I will move the hardware configuration code into clk_ops::set_rate().
> We are using the DT property assigned-clock-rates-u64 to configure the
> clock rate of CMN PLL to 12 GHZ since 64 bits are required.
>=20

Sounds good. Thanks.

