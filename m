Return-Path: <linux-arm-msm+bounces-29659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76624961639
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 20:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00CEEB215A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 18:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D611CDFC4;
	Tue, 27 Aug 2024 18:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8TIGHNo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C920618E25;
	Tue, 27 Aug 2024 18:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781770; cv=none; b=BP1m40Y7VzRumwlZyVdzDgUpu0B+VQiNk73YQxl1CbcYLSZyRkZ0Iu2lb2KYXbSbqIXcFv7ME3PGQX4LrkkbdWzfcVKHIeiTQrNVZbc7Fs/YdKOo3ppgRBB4HOuGsQW/JTXjMxKIPnxSFiKiyvn+0/6Lj3PNnQWbRsa8o9OJSws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781770; c=relaxed/simple;
	bh=4/6qwlU9P4M74U511hEWpHFAfKj+lbHjux/s2PSXfy4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=JUwE5b0/zt9IxYIzH3rII0XWauV7K8hbv/iWaqcnlBiLoeFuNnZ87Wl0e6ANFlhQtgLnrcE2BqzuxfTiq9lyfYK2jq+Oo39GquZC9ZGICaaWHSPmPF5QdmIvF+VexmBIIxPayjVr90IDSJVNpM5QYKvpTYHPMPNbg1hQHL+nSIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8TIGHNo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DFCC4AF0E;
	Tue, 27 Aug 2024 18:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724781770;
	bh=4/6qwlU9P4M74U511hEWpHFAfKj+lbHjux/s2PSXfy4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K8TIGHNoTnQrg+kOFk76XOX+VVKdO96gL876MGF+2c+0yH5SttVqvnFUwBWvGpQ7D
	 cOwEt2pllVOOY/jrsw1YqFFdGa6vfflRn79ehhAeaABxbYA0X+QLSGXh1yj+P9JeiO
	 MDr24jSUuu87QzyAckljUKRy1PkQmFzohdQ6vDr7WXwXxV+lfBOw4Puhc6PysF+5lH
	 a05XHof5ILytP/GO2sbhmejaLCkv07PYSze9q6tNJ18PVxjG9uHqRH7YFXQlTtDSpb
	 wIwa4FJFLuVHRyGf/O0D217yo7Gzepo6NEhvAmCP5eFDN9tHHs0vAv0vAqXIJ7YLth
	 wnxHTHvIQF8kA==
Message-ID: <2156bd2a8bde7f07491ab9ed9cf1ee15.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240823-x1e80100-clk-fix-v1-1-0b1b4f5a96e8@linaro.org>
References: <20240823-x1e80100-clk-fix-v1-1-0b1b4f5a96e8@linaro.org>
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Don't use parking clk_ops for QUPs
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>
Date: Tue, 27 Aug 2024 11:02:48 -0700
User-Agent: alot/0.10

Quoting Bryan O'Donoghue (2024-08-23 05:58:56)
> Per Stephen Boyd's explanation in the link below, QUP RCG clocks do not
> need to be parked when switching frequency. A side-effect in parking to a
> lower frequency can be a momentary invalid clock driven on an in-use seri=
al
> peripheral.
>=20
> This can cause "junk" to spewed out of a UART as a low-impact example. On
> the x1e80100-crd this serial port junk can be observed on linux-next.
>=20
> Apply a similar fix to the x1e80100 Global Clock controller to remediate.
>=20
> Link: https://lore.kernel.org/all/20240819233628.2074654-3-swboyd@chromiu=
m.org/
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver=
 for X1E80100")
> Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where appli=
cable")
> Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Applied to clk-fixes

