Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C05931943C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbhBKUUB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 15:20:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:45596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229768AbhBKUTn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 15:19:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C86B64E15;
        Thu, 11 Feb 2021 20:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074742;
        bh=odwTMXYLAAcZl6y0iPcylNjyj+HCcCC3zmyKDr+pMYI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZBzT12WKREhVrV1Ds2iT6foR8z5I3cDW0//xtc/QfGkdrc0UrSaofZ9Muz4Xdr0pe
         i3Rl713hP09u4yhDYsNl2Pav54DDXPzksOL2PLSWPGiZKi7j9OBAPFlyY3/N2P961F
         ALpdCRpbFKM4vcEVwnpO1XFxEHFwINvpmonqej4eGGBcPsObJ+SeYHeeKFwFACGaWX
         +1SmBfCNxuF5xiZrOC5vn0JOHJonwSVogmsvjxcRs5AUuaOTiyuVVa/iKNBn90WxFJ
         Ox3k8hcwxZGzWKmfG6g25p3gj2x6Tdsbm2o7fZ5uoNMY5jAXkTrG0qYk2oW4botvrm
         FUsSL6WLwuYHA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210113183817.447866-4-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org> <20210113183817.447866-4-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 3/9] clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, agross@kernel.org
Date:   Thu, 11 Feb 2021 12:19:01 -0800
Message-ID: <161307474123.1254594.7918419384608576805@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-13 10:38:11)
> From: Martin Botka <martin.botka@somainline.org>
>=20
> Add a driver for the multimedia clock controller found on SDM660
> based devices. This should allow most multimedia device drivers
> to probe and control their clocks.
>=20
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> [angelogioacchino.delregno@somainline.org: Cleaned up SDM630 clock fixups]
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
