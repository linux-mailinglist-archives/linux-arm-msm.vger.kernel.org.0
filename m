Return-Path: <linux-arm-msm+bounces-19432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC4B8BEE21
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 22:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E454EB253D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 20:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D1914B968;
	Tue,  7 May 2024 20:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRL1jzm6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE52187331;
	Tue,  7 May 2024 20:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715113722; cv=none; b=c5ozP3JB0y8UQ4fTf2XjJPo+fiuPMV6nWrYYyO440lZ/MVmsna9Y2a/tP8p+CP95gZRnjGeI3KcFED2QyYi7QGfl+SR+qPDI9LCWJli02c/HC35zKg75atnJjYTy8iP7QesFRgBADzZeIVA60U/5Ff8JBxnunCbR02bEDmXTttE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715113722; c=relaxed/simple;
	bh=O+b6rMU8nBnrcErDZTJYAs1xK22Mbc0hwJnw71xIx2w=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=P+mOCkR8weJAgOhuBfYSiJnbdZiYPy5fJuHjer1W+8bMj9SXhu4JlbDm45+DSbVzdY5BCOXiT0OIPZbYrYnom9IsA3ZcewwmuQJaI2gvpgO5oEzr2kUQwfswA1DNSaBVscRsFReAIgvl2lIiDX7V/2yJf+6G90jNcGPdL1P4cQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRL1jzm6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B24C2BBFC;
	Tue,  7 May 2024 20:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715113722;
	bh=O+b6rMU8nBnrcErDZTJYAs1xK22Mbc0hwJnw71xIx2w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XRL1jzm6UDXsbnhoXOg5hrJWNhQFT08J2n9CRAaOo/wcSZYfByN4zJ8Sc0/ibjGSB
	 oe2/Z+30Mj/qIoZi4xcK+99iCqOrCNpnRah1lM4Y5K/iaA7J53Ypm7vmUO0UiGUMqH
	 kzSdBSnxh+6NpZGHnKNjLfmyQOEM1GhEqj0EhyVqfce59lsnq+Xx/ijZfpNUOqONH0
	 AaHmHVTJehNRW/P8v/24p+v/i9ViSeGjYkYOEDBgF0/AgU3b37AYLsZlR2QozXBeZo
	 LTZikVVzANBIgoMAEzRPkq4JFzihEe0DOHrDiRKNj0Pm+75VC+YJtemYd/rQ1dFlcj
	 K1kdEWSAxAj7Q==
Message-ID: <7baef7a173dc4d1ecf8b0dafde565b1a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3a3c4279-a254-48d0-91ad-70b7f1e3eb77@linaro.org>
References: <20240427-topic-8450sdc2-v1-1-631cbb59e0e5@linaro.org> <2337ba58adb3fb127710bead9b8665a9.sboyd@kernel.org> <11bd7146-30cd-4b71-b2ca-d76875763731@linaro.org> <6ba2967c6c9d24e3f1c9b76496176010.sboyd@kernel.org> <3a3c4279-a254-48d0-91ad-70b7f1e3eb77@linaro.org>
Subject: Re: [PATCH] clk: qcom: gcc-sm8450: set OPS_PARENT_ENABLE on gcc_sdcc2_apps_clk_src
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Vinod Koul <vkoul@kernel.org>
Date: Tue, 07 May 2024 13:28:40 -0700
User-Agent: alot/0.10

Quoting Konrad Dybcio (2024-05-07 06:51:04)
>=20
> without PARENT_OPS_ENABLE:
>=20
> [    3.326891] sdhci_msm 8804000.mmc: Got CD GPIO
> [    3.336839] scsi host0: ufshcd
> [    3.337105] gcc_sdcc2_apps_clk_src is DISABLED @ set_rate
> [    3.346339] ------------[ cut here ]------------
> [    3.351093] gcc_sdcc2_apps_clk_src: rcg didn't update its configuratio=
n.
> [    3.351114] WARNING: CPU: 1 PID: 11 at drivers/clk/qcom/clk-rcg2.c:133=
 update_config+0xc8/0xd8
>=20
> [...]
>=20
> [    3.610523] gcc_sdcc2_apps_clk_src is ENABLED @ set_rate
>=20
>=20
> with PARENT_OPS_ENABLE:
>=20
> [    3.331419] sdhci_msm 8804000.mmc: Got CD GPIO
> [    3.336569] gcc_sdcc2_apps_clk_src is DISABLED @ set_rate
> [    3.344795] scsi host0: ufshcd
> [    3.355122] qcrypto 1dfa000.crypto: Adding to iommu group 5
> [    3.363567] remoteproc remoteproc0: 2400000.remoteproc is available
> [    3.364729] gcc_sdcc2_apps_clk_src is ENABLED @ set_rate
>=20
> after testing it both ways, I realized it wasn't supposed to make a
> difference in this regard, but I suppose I can paste both results anyway..
>=20

Can you share your patch that prints the message? What bit are you
checking in the hardware to determine if the RCG is enabled? Do you also
print the enable count in software?

