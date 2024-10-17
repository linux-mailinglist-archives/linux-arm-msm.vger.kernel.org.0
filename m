Return-Path: <linux-arm-msm+bounces-34800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B349A2BBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 20:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2C551F24A5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 18:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEBA1E0082;
	Thu, 17 Oct 2024 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQsMu+KV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AE81DFE2A;
	Thu, 17 Oct 2024 18:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729188623; cv=none; b=Bipa/q/IlLxy3Beg65MZpPsiV1jH1xT8mA0xEgd8CKy9E2NSnBNHtjHpmX5fLkSnMKE8kJ/aOjY2TPQXhsCs/KdIBgq7ytTF4rX9b1Iyntk0sZqvDYTTq2DlDn+PzRJmVpr7e6aj6Ky11djQhHHQlz1/krxblYAliudOgUo3QpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729188623; c=relaxed/simple;
	bh=iLqK3c/ijAq+sASVCtVxwl8SDiJsJ2cV1PTrcAEshD8=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=rxWS3uXHhhVoo9r3/R6Q83qVn9hO+2qy9eJKNVC0aQydTC6xvS0q6vvbQ4cfp0YewNh/5ljcvBmTc2WDgX8MnKy0WOEWquIs0+vjJxCglPccQwsrqrB0yPewmYAaeQwL5xqnAfgy+FSMb8PFBxyClnSshYdt/YVKBgva9HoAo14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQsMu+KV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0810C4CEC3;
	Thu, 17 Oct 2024 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729188622;
	bh=iLqK3c/ijAq+sASVCtVxwl8SDiJsJ2cV1PTrcAEshD8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qQsMu+KVXe5d7rUVJnyoSiv+Dvkn3CoGpAH/kCBSGjb2tHT702PgwbCvVa80LlkF3
	 /RUGWgnECZmNUoHhmU5bsWNMVW/tjyxYdwgzJ+a1gPRuLDboTXFQV2MdXO4WWOcRZ6
	 NlFST8OBk6SufociimAXG32PQv6T4aPDW/fr47bikUYiJ5UYJ4ovHM7jhbfp99yVCI
	 7UW9UpjmJ7ftdhlyc1CVeOhSj0SH7UqY3BhCOMMzJNcJ30CBtAcv6OOBZhMxv0+U8G
	 p/FUe9DIAXCgIGPClLqVS/DsKTESnSWlFSHjH1KHlescc3NfURqaF124TGRqu+ybXw
	 V2Dl6SMnabA+w==
Message-ID: <be8639d0add779bcac0314d3c433d01b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241017-sar2130p-clocks-v1-7-f75e740f0a8d@linaro.org>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org> <20241017-sar2130p-clocks-v1-7-f75e740f0a8d@linaro.org>
Subject: Re: [PATCH 07/14] clk: qcom: clk-branch: Add support for SREG branch ops
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kalpak Kawadkar <quic_kkawadka@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 17 Oct 2024 11:10:20 -0700
User-Agent: alot/0.10

Quoting Dmitry Baryshkov (2024-10-17 09:56:57)
> From: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
>=20
> Add support for SREG branch ops. This is for the clocks which require

What is SREG? Can you spell it out?

> additional register operations with the SREG register as a part of
> enable / disable operations.
>=20
> Signed-off-by: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[...]
> diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
> index 47bf59a671c3c8516a57c283fce548a6e5f16619..149d04bae25d1a54999e0f938=
c4fce175a7c3e42 100644
> --- a/drivers/clk/qcom/clk-branch.h
> +++ b/drivers/clk/qcom/clk-branch.h
> @@ -24,8 +24,11 @@
>  struct clk_branch {
>         u32     hwcg_reg;
>         u32     halt_reg;
> +       u32     sreg_enable_reg;
>         u8      hwcg_bit;
>         u8      halt_bit;
> +       u32     sreg_core_ack_bit;
> +       u32     sreg_periph_ack_bit;

Are these bits? Should be u8 then. Or are they a mask?

>         u8      halt_check;

Instead of adding these new members can you wrap the struct in another
struct? There are usually a lot of branches in the system and this
bloats those structures when the members are never used.

	struct clk_sreg_branch {
		u32 sreg_enable_reg;
		u32 sreg_core_ack_bit;
		u32 sreg_periph_ack_bit;
		struct clk_branch branch;
	};

But I'm not even sure that is needed vs. just putting a clk_regmap
inside because the clk_ops don't seem to use any of these other members?

