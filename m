Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F8B319450
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbhBKUV4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 15:21:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:46006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230077AbhBKUVl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 15:21:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A158464DBA;
        Thu, 11 Feb 2021 20:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074860;
        bh=6xzLnToTVwSUA646Cov4IJSvskOrsjAVFgE9nmJa8a0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LaSQyfjNa8I4aA6AwbNGdtS/3YSvoYFJSKSXgMN+AaONhnguRuqtoa5EI9ibPGyIo
         NnKrzt3aPlunmLEyqj4a/sEvUdEpsgkgfbCTKI7joPfkPqbMTcB4ivdVZYLAzLTE3H
         9crhu94/jBij5BtEPxRuGB/wO/gj9pAleO4M3objOEyKI/p1wOXw56y7vyB95PU6Zu
         RvxfOPetG4qj0Y5R2oYSGn5yGvCsIW7MerGpn4iPLUYU79/IbHcUZc8r2Ng8lnFazz
         iu7kMnEAQDjXqNUUqHdSwshe7IRGS37ZL4dwXNDIGKMxJ2SjGR8Ab7xXtdJMjftmQR
         VZXOxnA2ZMsow==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210113183817.447866-8-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org> <20210113183817.447866-8-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 7/9] clk: qcom: gdsc: Implement NO_RET_PERIPH flag
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
Date:   Thu, 11 Feb 2021 12:20:59 -0800
Message-ID: <161307485928.1254594.5555629819123034872@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-13 10:38:15)
> In some rare occasions, we want to only set the RETAIN_MEM bit, but
> not the RETAIN_PERIPH one: this is seen on at least SDM630/636/660's
> GPU-GX GDSC, where unsetting and setting back the RETAIN_PERIPH bit
> will generate chaos and panics during GPU suspend time (mainly, the
> chaos is unaligned access).
>=20
> For this reason, introduce a new NO_RET_PERIPH flag to the GDSC
> driver to address this corner case.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
