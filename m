Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDC742CD60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbhJMWLU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:11:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:41236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230510AbhJMWLR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:11:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D608A610EA;
        Wed, 13 Oct 2021 22:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634162954;
        bh=n6v471SwywVh3EjtiHcgNwTDCGZhj9J2k6ik/jCjM3c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tkiy6C47MShHObW/5LyPd071vBRNoTAp/Vj0x9xI7iJ8AIscFKhZzwhv4atVk5UuV
         7KxHcB7GnAKgE1n9v0CM5IME3KQwpfTCK3IuUVBnxe9TnADfrlaVl4WWSm0vHGEqRZ
         Vyj3wGUajJIqMw/G0fn8sr7wp/gD4YKTiGxl8zulA94NrnUk+V1cT9N11RGsdlkBjV
         YkjcMuX5lh7IQeu+rBin5I6EfhNmDc5xINOa8dIPhaz6ER06LTvgHmCSwI5q+q1ao7
         2uHGqCuoLJjccIKFtOtukzv0oITiFKtz8o64aY+aT0u412Uv26jvaRp6myGx/iqdMF
         oXkGPVh9iqByg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211008102041.268253-2-angelogioacchino.delregno@collabora.com>
References: <20211008102041.268253-1-angelogioacchino.delregno@collabora.com> <20211008102041.268253-2-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-sdm660: Add hw_ctrl flag to venus_core0_gdsc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        bjorn.andersson@linaro.org
Date:   Wed, 13 Oct 2021 15:09:12 -0700
Message-ID: <163416295263.936110.15344824574936579037@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-10-08 03:20:41)
> As shown downstream[1], this GDSC supports HW trigger mode and
> we're supposed to enable it in order to ensure correct operation.
>=20
> [1]: https://github.com/sonyxperiadev/kernel/blob/aosp/LA.UM.6.4.r1/arch/=
arm/boot/dts/qcom/sdm630.dtsi#L2181
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next
