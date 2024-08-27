Return-Path: <linux-arm-msm+bounces-29663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D456896169A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 20:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93B1D2848B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 18:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641011D2F5A;
	Tue, 27 Aug 2024 18:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEH7PFIv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FC91D1757;
	Tue, 27 Aug 2024 18:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724782568; cv=none; b=ts2rLfhXMSP2O9mljCplObJ4C/Nb34fBO7uDdV4wYFZ6sK9LifnIxwNFXK0S8lWidPQMCXxZ+9PQczK6LnXuXCLZ5i22zgLSuOHZSxPE1fulcboivLpDVHAxy8BaLFnZJ7K9fzEvmM8K5GLZ+MT8zwYtcmVVmTp99uDFvlscS/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724782568; c=relaxed/simple;
	bh=fpvBC8whWsAt8fYSueKeJdWimft2Awk2sIf75Zati24=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=OJZpykh9Q1GjflhZQdEGwcy8hZiZBP1V7rwOpxsLWm3X8KOB6ohMsXSSs1+KHxG0aN7ZrcORKjw4ZGXL7NROJHTbiw4WK218AEmuZfBL4mAsiiy5Cz0gn/R355eouZKmHgV9PXibnsXLsmXvez6BFtcLBhulXsfLiX6YVkWTj3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEH7PFIv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB368C567C2;
	Tue, 27 Aug 2024 18:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724782568;
	bh=fpvBC8whWsAt8fYSueKeJdWimft2Awk2sIf75Zati24=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dEH7PFIvhxQH891GGCYZgHuUTRfOJdC4X/e6m9BK99ikqagauhRwQHqSEgVrrR99c
	 yn6fyAYI7vOU1+OvWx12bsuvR+I+QTmoykp9jgRwcSyus+80wHJPini/08c35y65Dt
	 +qFHCoD4wpXXXijpV4QXmRf7jLkb1H8+lnNv9vnxkvjl25o9Ewh22eQ9BrK8wC9Ck0
	 qfNhwuS3zyP2s67557znNhr1ZfXB6F6oPHCC1JjR6ObBnK8irJOzMTVSFzAu7dyWFv
	 cvUtw+nxKNLypyK0FAFlUsL/KRAOcXxaNn1OX/u4wUM2j1iTIb+u1KP7PB6QFkqDMN
	 bag/kPKMe+fAA==
Message-ID: <65cfdea2ac3373af27b8f65bb962dc04.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2156bd2a8bde7f07491ab9ed9cf1ee15.sboyd@kernel.org>
References: <20240823-x1e80100-clk-fix-v1-1-0b1b4f5a96e8@linaro.org> <2156bd2a8bde7f07491ab9ed9cf1ee15.sboyd@kernel.org>
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Don't use parking clk_ops for QUPs
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>
Date: Tue, 27 Aug 2024 11:16:05 -0700
User-Agent: alot/0.10

Quoting Stephen Boyd (2024-08-27 11:02:48)
> Quoting Bryan O'Donoghue (2024-08-23 05:58:56)
> > Per Stephen Boyd's explanation in the link below, QUP RCG clocks do not
> > need to be parked when switching frequency. A side-effect in parking to=
 a
> > lower frequency can be a momentary invalid clock driven on an in-use se=
rial
> > peripheral.
> >=20
> > This can cause "junk" to spewed out of a UART as a low-impact example. =
On
> > the x1e80100-crd this serial port junk can be observed on linux-next.
> >=20
> > Apply a similar fix to the x1e80100 Global Clock controller to remediat=
e.
> >=20
> > Link: https://lore.kernel.org/all/20240819233628.2074654-3-swboyd@chrom=
ium.org/
> > Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driv=
er for X1E80100")
> > Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where app=
licable")
> > Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
>=20
> Applied to clk-fixes
>=20

Unapplied :( See this email[1] for more info. I'm thinking that this can
be applied to clk-next instead, by qcom maintainers.

[1] https://lore.kernel.org/all/CAE-0n52rYVs81jtnFHyfc+K4wECvyCKmnHu2w9JhPN=
qvMYEeOA@mail.gmail.com

