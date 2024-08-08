Return-Path: <linux-arm-msm+bounces-28192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C647094C568
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 21:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82240284F9B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 19:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6962155A59;
	Thu,  8 Aug 2024 19:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZPVQA27"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827B384A2F;
	Thu,  8 Aug 2024 19:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723146183; cv=none; b=dTc5NeNkcSoVF+2TZXEeW13znAeECWdlgv0cdUB25brJA7nJlOXQgp5NTKRAF8PygxxVV74kiN+gPzQhn7fqhq13kzI44IMnZ7inJG8eJ0fTAFEtRlVKIrSsDP6NsXAD81yQ18Zl4zl1XWpp+p+sPuEFabJW50jDRgkDFO0zP/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723146183; c=relaxed/simple;
	bh=9kBylOwsE2XpqPwZpP7UXxRgnK2QCC3mH5zU/bOhA/8=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=rVIXVGAOs/eY3zNy1D4YOgmC91qnOxfoBfozE81gBUfxL3o/dVHXSx6rt9CjPMUvdlU3CQOHEwFptRwEiQSVfaXJ/CAuGyuEpI7YL0UJ/rlQgRYNrLuFq1fBKxKVGgWhfj+v3IrMg168ppNmDKTZoCL5UB38CO+c6xSE/CtHgLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZPVQA27; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84DDC32782;
	Thu,  8 Aug 2024 19:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723146183;
	bh=9kBylOwsE2XpqPwZpP7UXxRgnK2QCC3mH5zU/bOhA/8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pZPVQA27VDNEzHvMGARIHNp8+XE0tf7oYIqC4lgEYl0MZwQtOuvmA66RFi9+0+Z2m
	 Dxg9PyukCu/cWm1BjI+XUsS+70iRmwQKp8jMdBZbtBEEoIiIx8Ydsn169kRdag4D4R
	 eKo7Gvc4ao4zE2Q5jVlILriuqI2n7w+0lz9TB1QOi6SregXTrzkdBWj0NJxPIoybcP
	 ZQYbCUwc2/Ewzbadnj38bu3spDZTwRlUAktQ4oreQ96R+iSrU8vFjPxRaMsIKU4dlV
	 HJljFaJ8WPMkV3C/DxWBx2o4PaV7KFx2hx1QxsUxgIGczyS1pkZC60/+A2c5K2gOGp
	 bRQbRJmStJ8QA==
Message-ID: <a7607f45e26c79f13b846fd0d8284bcf.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240808-clk-rpmh-bcm-vote-fix-v1-1-109bd1d76189@quicinc.com>
References: <20240808-clk-rpmh-bcm-vote-fix-v1-1-109bd1d76189@quicinc.com>
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Fix overflow in BCM vote
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Mike Tipton <quic_mdtipton@quicinc.com>, stable@vger.kernel.org
To: Bjorn Andersson <andersson@kernel.org>, David Dai <daidavid1@codeaurora.org>, Imran Shaik <quic_imrashai@quicinc.com>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 08 Aug 2024 12:43:00 -0700
User-Agent: alot/0.10

Quoting Imran Shaik (2024-08-08 00:05:02)
> From: Mike Tipton <quic_mdtipton@quicinc.com>
>=20
> Valid frequencies may result in BCM votes that exceed the max HW value.
> Set vote ceiling to BCM_TCS_CMD_VOTE_MASK to ensure the votes aren't
> truncated, which can result in lower frequencies than desired.
>=20
> Fixes: 04053f4d23a4 ("clk: qcom: clk-rpmh: Add IPA clock support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index bb82abeed88f..233ccd365a37 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -263,6 +263,9 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, =
bool enable)
>                 cmd_state =3D 0;
>         }
> =20
> +       if (cmd_state > BCM_TCS_CMD_VOTE_MASK)
> +               cmd_state =3D BCM_TCS_CMD_VOTE_MASK;
> +

This is

	cmd_state =3D min(cmd_state, BCM_TCS_CMD_VOTE_MASK);

