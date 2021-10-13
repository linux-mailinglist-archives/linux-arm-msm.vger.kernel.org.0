Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33C642CD5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbhJMWLP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:11:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:41202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230505AbhJMWLL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:11:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5E98610D0;
        Wed, 13 Oct 2021 22:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634162946;
        bh=fXSt8zwbgiMjEdpcffbwmBBVjBq4B3sSUZAeZJVWZf0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bt7CHmJ5vwagU4BDPtZ2LMoQ6WlycRK+rXR9p3cfbIMsMC+g/WyIv4Zy1p8uZrSMe
         4y9/P2tsd/LbPEY5zmH8K6HAptaQKUi7KYNzrJYrEYqObTNI1ZRE8+jgvoH+Xd+p5k
         jyI+BE47ycEpXWYLb74GzqzepUleiKLu/9ke3RY8eRqgDcPjLVzutWxSgUyzZtbq/Y
         D1dt2p0fIjyMD+d0O3JJ2cJVgLvtgLpeB7NrSK2fT+hyArS8NJxWPcQzipxOC8HnpK
         IwuwfcXsHHXHzWHjr8kkqfcSOhhwupFHxqmrTJ9fMoXgnNIw9rjGVwm+5bH1GWumui
         xJ4dnBcv3vYCA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211008102041.268253-1-angelogioacchino.delregno@collabora.com>
References: <20211008102041.268253-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/2] clk: qcom: mmcc-sdm660: Add necessary CXCs to venus_gdsc
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
Date:   Wed, 13 Oct 2021 15:09:05 -0700
Message-ID: <163416294547.936110.17487346014340369643@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-10-08 03:20:40)
> As also shown on downstream dts[1], for a correct operation of the
> Venus block, we have to retain MEM/PERIPH when halting the video_core,
> video_axi and video_subcore0 branches: add these CXCs to the main
> Venus GDSC.
>=20
> [1]: https://github.com/sonyxperiadev/kernel/blob/aosp/LA.UM.6.4.r1/arch/=
arm/boot/dts/qcom/sdm660-vidc.dtsi#L80
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next
