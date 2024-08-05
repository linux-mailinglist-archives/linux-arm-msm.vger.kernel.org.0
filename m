Return-Path: <linux-arm-msm+bounces-27949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEB8948128
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 20:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FA2FB22821
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 18:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D47E17B419;
	Mon,  5 Aug 2024 17:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLuqP5jp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300EF17B410;
	Mon,  5 Aug 2024 17:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722880725; cv=none; b=uIhaICrQWnKdLZ1NxNBtM7f/lMGtcjWsOqjeW0NpvTzGjHZmTX0coyXK10d9BhH11aYRiAjGWcZWNOd+vxwVwgTKCrX1fECHTIsdolp79ErCTRliBq/w2ixvgYxJ8EqrTroFScZnSPAshBB+kR2QQYX+7/QMJ77AW8WX8iFHQZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722880725; c=relaxed/simple;
	bh=wNM5xS4jJV5PztpbZlRCZTDlDKXDNt8Werqs5lhFUu0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=vAxpxQgM7yL9aAdDf1IeC3xlcB5QCMCyfmXaHqo7oSEPu3EOovWxNTdzBCXz0I50jOW6ZNbpClUjBMJnx2L/2c40aTApkl4gkQuc2dUCJOMexCSfFO+EIRfQdHSkFsle/3Ng9tzWlZQaumGRWKQAKGcZGrr/Qa3/IUcWPJqXA68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLuqP5jp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5EBC32782;
	Mon,  5 Aug 2024 17:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722880724;
	bh=wNM5xS4jJV5PztpbZlRCZTDlDKXDNt8Werqs5lhFUu0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YLuqP5jpZelCN3Laz43uy9YuydC9DuVusXYO/bh2l1f8dLcU9TTwitBw8NNtPpsyI
	 yjSWCug7SREIxVeUnAZ7D7ch3wNZnSvJT5uFeAwtGegXdS56QyRkDVxmZq27cuuB52
	 rKibpC8QH05O1HrjloNdAWSsZDt9od6HpiV1ta7iCvKoci7uBGleFqmiwXvUe88rsK
	 +OnShhuSM6mkfwI1RUzuahvDkPihXX/hiyPwvvHUXw27KZmkB7FCPE8QW2Eemz+hfv
	 NNLHw7+heLrnaOqoewkxBKS+cQ9a4adXmoxRLEz3w+H8N8+qHMOZiwQNJx1kmRV1M1
	 bJeXwZLz9zgmA==
Message-ID: <de8f23c2558644d3698176b6dd9f7e91.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3cca4d67-e420-442d-bb38-4eb0649dcdf4@quicinc.com>
References: <20240801110040.505860-1-quic_amansing@quicinc.com> <ff92343652a998b97981e63ea5dc301f.sboyd@kernel.org> <3cca4d67-e420-442d-bb38-4eb0649dcdf4@quicinc.com>
Subject: Re: [PATCH] clk: qcom: ipq9574: Update the alpha PLL type for GPLLs
From: Stephen Boyd <sboyd@kernel.org>
Cc: quic_devipriy@quicinc.com
To: Amandeep Singh <quic_amansing@quicinc.com>, andersson@kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com
Date: Mon, 05 Aug 2024 10:58:42 -0700
User-Agent: alot/0.10

Quoting Amandeep Singh (2024-08-05 02:11:16)
> On 8/3/2024 6:35 AM, Stephen Boyd wrote:
> > Quoting Amandeep Singh (2024-08-01 04:00:40)
> >> From: devi priya <quic_devipriy@quicinc.com>
> >>
> >> Update PLL offsets to DEFAULT_EVO to configure MDIO to 800MHz.
> >=20
> > Is this fixing a problem? I can't figure out how urgent this patch is
> > from the one sentence commit text.
>=20
> The incorrect clock frequency leads to an incorrect MDIO clock. This,
> in turn, affects the MDIO hardware configurations as the divider is=20
> calculated from the MDIO clock frequency. If the clock frequency is
> not as expected, the MDIO register fails due to the generation of an=20
> incorrect MDIO frequency.
>=20
> This issue is critical as it results in incorrect MDIO configurations=20
> and ultimately leads to the MDIO function not working. This results in
> a complete feature failure affecting all Ethernet PHYs. Specifically,
> Ethernet will not work on IPQ9574 due to this issue.
>=20
> Currently, the clock frequency is set to CLK_ALPHA_PLL_TYPE_DEFAULT.=20
> However, this setting does not yield the expected clock frequency. To=20
> rectify this, we need to change this to CLK_ALPHA_PLL_TYPE_DEFAULT_EVO.
>=20
> This modification ensures that the clock frequency aligns with our=20
> expectations, thereby resolving the MDIO register failure and ensuring=20
> the proper functioning of the Ethernet on IPQ9574.

Wow! Please include these details in the commit text.

