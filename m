Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C50769D1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 18:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjGaQrI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 12:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjGaQrG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 12:47:06 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1A61728
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 09:47:05 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d16889b3e93so4977079276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 09:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690822024; x=1691426824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h7ZXjsSf6tAx3asGVuiQEd3Ci5WeA7f/UBUv+GtyjM4=;
        b=Oi1i6jM8nzX93JTx8OvFmNPBz2M9Gio9in1+4mGVdM6m5tOmiSLU4ou38JSDnA1Hps
         t90ZACmussYKUOhQyfuuJ+YP7A7T3MnjOO/ddJX6s/h2HQmSns4AitIW1HJgp0YvPHtz
         3NxI0u3ZDLAl3bTHm8uSIB56qpp02RMuh2INWYYexoINldBbCWnpM/BFCRANlcONABod
         Hq2l47f9857JKBTDDWLZR9o3N9ON1hV3Dqbo/u9/DBpiwlCiFH4swxqHgpAEBhyfFWmV
         kngYR7FEeKbDMgSdCJizFXgwGFoCL0sNGkAqVUNEoDUmBULn3jGXWIwEAjp6KD/nE3f7
         gzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690822024; x=1691426824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7ZXjsSf6tAx3asGVuiQEd3Ci5WeA7f/UBUv+GtyjM4=;
        b=Dc2jC9n7ahZasWXxcM6yqt7DF65MFRLTXjq+oMYVWqmvrQX1NdgdBIShnxPUD+kRXv
         /sx75L/cBvLMJh6SSvTX782KJYvIUjy5BGfak2XxO5t2JV5vHSHv7ATg5/O/l6pjCl+X
         ULLkMPLM8Hzatgma1RYEzI88vofCBKhewRVu3lgqEQNBPJVAwtfeYlH4prTAZ/cXYVjm
         XrEvR83CxBdcd8mgS9egqA9BkleVFus0aVuYcI3zVln/TF4H4o6ktHnZApz6Xqmua5Ig
         FZiqIpZrREe3Q7OX9ymuhpDtHkf7ozG2SZdtGBwxT6gR5bREjUvltvkw6L8OzL269Ngc
         Xddg==
X-Gm-Message-State: ABy/qLZyNQUdcCqo7NZ28oKgVkyokaFBlPjjWU5K6BI66Pxx/u1m9iQO
        QUjETdBEw2OgyacZue7QmGJqtw==
X-Google-Smtp-Source: APBJJlHVe2UaaJO5B3mXn0KZ2J3l9/YGEMBEIweiAfnQG0XXkjGfV3tG9f+7QAVSm9AamtiyGtuHzA==
X-Received: by 2002:a25:734c:0:b0:d00:bc21:a504 with SMTP id o73-20020a25734c000000b00d00bc21a504mr12166149ybc.40.1690822024631;
        Mon, 31 Jul 2023 09:47:04 -0700 (PDT)
Received: from fedora (072-189-067-006.res.spectrum.com. [72.189.67.6])
        by smtp.gmail.com with ESMTPSA id z13-20020a25ad8d000000b00d0c698ed6b6sm2509866ybi.41.2023.07.31.09.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 09:47:03 -0700 (PDT)
Date:   Mon, 31 Jul 2023 12:47:01 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Patrick Whewell <patrick.whewell@sightlineapplications.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sm8250: Fix gcc_sdcc2_apps_clk_src
Message-ID: <ZMflhQubbITCBKlF@fedora>
References: <20230728191423.13837-1-patrick.whewell@sightlineapplications.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/rOFXeJeJEPIpyxN"
Content-Disposition: inline
In-Reply-To: <20230728191423.13837-1-patrick.whewell@sightlineapplications.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--/rOFXeJeJEPIpyxN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 12:14:23PM -0700, Patrick Whewell wrote:
> Set .flags =3D CLK_OPS_PARENT_ENABLE to fix "gcc_sdcc2_apps_clk_src: rcg
> didn't update its configuration" error.
>=20
> Signed-off-by: Patrick Whewell <patrick.whewell@sightlineapplications.com>
> Fixes: 3e5770921a88 ("clk: qcom: gcc: Add global clock controller driver =
for SM8250")

The error appears resolved when tested on my Open-Q 865 SOM.

Tested-by: William Breathitt Gray <william.gray@linaro.org>

> ---
>  drivers/clk/qcom/gcc-sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
> index b6cf4bc88d4d..d3c75bb55946 100644
> --- a/drivers/clk/qcom/gcc-sm8250.c
> +++ b/drivers/clk/qcom/gcc-sm8250.c
> @@ -721,6 +721,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src =3D {
>  		.name =3D "gcc_sdcc2_apps_clk_src",
>  		.parent_data =3D gcc_parent_data_4,
>  		.num_parents =3D ARRAY_SIZE(gcc_parent_data_4),
> +		.flags =3D CLK_OPS_PARENT_ENABLE,
>  		.ops =3D &clk_rcg2_floor_ops,
>  	},
>  };
> --=20
> 2.25.1
>=20

--/rOFXeJeJEPIpyxN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZMflhQAKCRC1SFbKvhIj
K9WPAP0emuG0IfFbFUcbSGg1pjaD2RVmEmR/aMnY01eGm19zWAEAs+swj1y6j371
lccbKAQk14M5ORRzmO+997ZF5u5uNQQ=
=LLqT
-----END PGP SIGNATURE-----

--/rOFXeJeJEPIpyxN--
