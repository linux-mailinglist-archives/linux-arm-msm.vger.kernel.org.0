Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8E6319440
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhBKUUE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 15:20:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:45640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231584AbhBKUTx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 15:19:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D6C964E45;
        Thu, 11 Feb 2021 20:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074753;
        bh=dWBiXA8rn93e+I1vVKs4Frw0ik9L2i7CjqvMqsLgHbw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=et0EKZHJ1xNYDk7fDY9ZXt78hc/6FO72YmdS1cBFnG9WaizAudGZGxp3TK00/m08q
         1rxveXmsFmhO3TZCMQ3U4giNt3v53vzwkCquHooEDbPIr2E6zXh1s9KKmW2VJ2nn4H
         rX0KdDTC5rox06m/yeVm6nvnKRf0aEOf2OHvM+SaXeuwVR8+vRlXKCJYbTJwqKgOT6
         /SztN/+sP3AHgyP5f5gqVSkmmSBtR/+JGu4Iqz4H1pXZwwyAd4ugbyVpZtH2YGiODn
         24205VBIMubB2X43CYLJo17tDD0Fua937zIEsAXM20Inr75X08PPQEtl/NjHqFvil6
         FQ20UMoii+AOQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210113183817.447866-5-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org> <20210113183817.447866-5-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 4/9] dt-bindings: clock: Add support for the SDM630 and SDM660 mmcc
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
Date:   Thu, 11 Feb 2021 12:19:12 -0800
Message-ID: <161307475214.1254594.16804095434374341440@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-13 10:38:12)
> Document the multimedia clock controller found on SDM630/660.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
