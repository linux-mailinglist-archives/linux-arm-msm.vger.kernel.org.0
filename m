Return-Path: <linux-arm-msm+bounces-30548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FADA96A7F8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 22:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C97EA28512E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 20:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2F14174C;
	Tue,  3 Sep 2024 20:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANJ8Zw4I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2042A1DC746;
	Tue,  3 Sep 2024 20:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725393746; cv=none; b=Gl4w/6Gn1VIoZS6j/yz7r40/AIc7Jz/2Xp7JoZyx2hGxWF2CMjeg7Wz/dERbVgfpHxNus9StKw6RmKsMoZWITZfacBq90p9J3skSJaL4jvP+KDCYjDeyL0Z56H0E776RrzX45BQrodUr5eKQFQrC2D4iO4EvfCaa8qVUqHWyEZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725393746; c=relaxed/simple;
	bh=/BbWsnQvQojQuHvQGPzYTHEKobUCT3g2HuvksNY8isI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=p8LIvSpyQ7DxKtIzjO2qQZ0MNP+j88IsHktmszxIlFfFtZFqS34fm5SkjzIlRS5p/zZBKZ67PYg4OzgIrIY7G47IvKVYM7Gz9sq2AhVC4GiW/w3ax2eD43pPV4A1ly9cQL82i/ZpQtbQRrBQG2QiPiMNsPOhycLDGYDvGONKazw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANJ8Zw4I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D469C4CEC4;
	Tue,  3 Sep 2024 20:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725393745;
	bh=/BbWsnQvQojQuHvQGPzYTHEKobUCT3g2HuvksNY8isI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ANJ8Zw4IEXajgPFCvxDtB6mwuKeSOy32UjP7xeeAOxhSeuZeniEMq4hLZJBXO52kc
	 +KWgE4pr5DkdcNL0gBonnVnGQme6IR+1y8gH5wmGk6+U/0u7fWdRA0KwvSyN+TYyvx
	 Q7tRWJlAXR1YUpL/QG18O3w0J71/cGYfgSBDHRvEu9zlYHJa12g2+n/5HRHyAwCnV/
	 pDdrgeW8fsR7J2Bzuic1cEOTT8iB+RPSj3mNBbnVt1nwlzdfPbUQC30vjq4UvW70se
	 EgMVU0naFFt+PMSqnUZMG4fPoAaoJPOzfQUPZ01YypDmos0TjAZ0c3JrYggwK2D/r/
	 hySR3buOJqGlQ==
Message-ID: <59429303c8158b146b24d14f4869fcd5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240902070830.8535-1-johan+linaro@kernel.org>
References: <20240902070830.8535-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] clk: qcom: gcc-sc8280xp: don't use parking clk_ops for QUPs
From: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Date: Tue, 03 Sep 2024 13:02:23 -0700
User-Agent: alot/0.10

Quoting Johan Hovold (2024-09-02 00:08:30)
> A recent change started parking the RCG at an always on parent during
> registration, something which specifically breaks handover from an early
> serial console.
>=20
> Quoting Stephen Boyd who fixed this issue for SM8550 [1]:
>=20
>         The QUPs aren't shared in a way that requires parking the RCG at
>         an always on parent in case some other entity turns on the clk.
>         The hardware is capable of setting a new frequency itself with
>         the DFS mode, so parking is unnecessary. Furthermore, there
>         aren't any GDSCs for these devices, so there isn't a possibility
>         of the GDSC turning on the clks for housekeeping purposes.
>=20
>         This wasn't a problem to mark these clks shared until we started
>         parking shared RCGs at clk registration time in commit
>         01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration").
>         Parking at init is actually harmful to the UART when earlycon is
>         used. If the device is pumping out data while the frequency
>         changes you'll see garbage on the serial console until the
>         driver can probe and actually set a proper frequency.
>=20
> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
> Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
> Link: https://lore.kernel.org/all/20240819233628.2074654-2-swboyd@chromiu=
m.org/ [1]
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Applied to clk-fixes

