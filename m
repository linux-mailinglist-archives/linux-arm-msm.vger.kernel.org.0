Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15192787F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2019 11:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfG2JDx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jul 2019 05:03:53 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:42818 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726432AbfG2JDx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jul 2019 05:03:53 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 41B36C71D7; Mon, 29 Jul 2019 09:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1564391031; bh=xgLWFrel2vRAhATJeiJzecL1LosFBCc/BEorby3QZeU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=LcAO1pzQe2fKhwEGzegkdxoL5fOSi0VURHBDFIJ0Wa/WTp/GNLiYhn8Ddk2bYbk0j
         MM7b/svR3BL10q9HgEFGwqY/iDFgpseuiCD5CrspTaJ25NCHFHjVHk680Ft3ncfE73
         yPhg8TAXwJCmfvWWUO9H7atWDQvSlpjHniWBMAv4=
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.2
Received: from g550jk.localnet (80-110-121-20.cgn.dynamic.surfer.at [80.110.121.20])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 0D874C6824;
        Mon, 29 Jul 2019 09:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1564391028; bh=xgLWFrel2vRAhATJeiJzecL1LosFBCc/BEorby3QZeU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=cESTXR5Qtp4Ioj0k8yWHeiG/zxwbjbsy9A+W3gf9k0NGuP7kDKe7I1yIHYWD/34Hj
         4/43SsNJakRvP9OY/846854dgc3FbbbM2Rs1Spv+7Dv5QWxu4xsA8XPpA63yo4wFPm
         pioSgDYF3ba5e4yLao+NFSp0ruFEHWUtgMPXblF8=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-kernel@vger.kernel.org
Cc:     Amit Kucheria <amit.kucheria@linaro.org>,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        edubezval@gmail.com, andy.gross@linaro.org,
        Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, masneyb@onstation.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 12/15] arm64: dts: msm8974: thermal: Add interrupt support
Date:   Mon, 29 Jul 2019 11:03:46 +0200
Message-ID: <2812534.bLfc0ztHNv@g550jk>
In-Reply-To: <ec8205566eb9c015ad51fbb88f0da7ca60b414fd.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org> <ec8205566eb9c015ad51fbb88f0da7ca60b414fd.1564091601.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart47414754.PgozLFlKrf"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--nextPart47414754.PgozLFlKrf
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Freitag, 26. Juli 2019 00:18:47 CEST Amit Kucheria wrote:
> Register upper-lower interrupt for the tsens controller.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
> Cc: masneyb@onstation.org
> 
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 36 +++++++++++++++--------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
> 

Hi, the title of this patch should be "arm" and not "arm64".

Luca

--nextPart47414754.PgozLFlKrf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE66ocILd+OiPORlvAOY2pEqPLBhkFAl0+tnIACgkQOY2pEqPL
Bhkyjg/8C4wIk+65w28F4Xcc3cdIuUZypP6UVkCguRZF6zUkrBdjETjJDUhXz0+a
Oyb44HxdAgQ7E/UqfEozAvpB8z3H5sBFrP6dykqMu3CQtOzPfB1ILhbn7+V+VToF
bmmuVcxEOnTCgoJb730JL06PvmUUMs/7W9gwAUjCVdp2DymS0OQJ3awSIxugE2GA
itAxee+KyTq7ttQRK2n3efOlaCqAf3jll7jl7xDBwodJa0uJi2tUhD4b9ZhFpA37
DCDsAY3wh/KJkf3uN3coZFTT3K635HZ0hP/7Kx9RK6TTXuCVJPyOXqRdw66rO74d
8sHy/yrqgByCVZex9lMuTcPyQZq3usZnAEakCMM/MPGuVclhSQhtVF8Xt0Utw5+b
FZlhg2gBflZHv2WLxNMdS/NyF28GN86e4uMJ7jusYxzVu+XBWeY8HGkqrxBdUFYn
khInFKGamOPVSXQYrmNZX8LW/ZciyNyB6ZOrFOO0aiE5cVsYZEWcmiWqD58XXNzc
RYupWAtn+ajc0U6mD51PAy2EvX2PFnyK4yxjXbeGT+0fZwQGWUQLFytF7ZBz9QPe
dZ6jedXlUOfVP1pduqgMJ5Vl6zjz7gN1ZIJOpAqqKT2Ttgy/4fRGcRwaswPSAlhn
0bxCZzt8QDr+gR9a5eMjr70Q5OGObzj8gPaxWFCjKpPcqHzRXAs=
=Cmln
-----END PGP SIGNATURE-----

--nextPart47414754.PgozLFlKrf--



