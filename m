Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2CE4BAE10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Feb 2022 01:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbiBRAKs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 19:10:48 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:44144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiBRAKn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 19:10:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC2B58E5F;
        Thu, 17 Feb 2022 16:10:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D04ABB81C21;
        Fri, 18 Feb 2022 00:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89820C340E8;
        Fri, 18 Feb 2022 00:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645143009;
        bh=X4QUNjFZDS7eesS0XxNkSBjaD94+tYf036hGJWWmKnI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mMmb5SbPH6aJ8F9aYvOlzOn/CGUBCxGjoW4SvVlXZ/Z/1Ov56mIhSM3RdJxKzCD0L
         lsKLxWG/MBzaUTQo95DsR9oQVrv3UvcDDeB72dPBnUe8NPSteJwVp16dy3GxIUgL2Y
         s4Uf6qGoX9f0sPVeSkP06knmF9MFFmJhbp5xeVa5nM6gkNgQL9WGelWtt3Dwo0nazm
         HiocF2lzrFaP9CVLUZRgpe2jHaaxhkqh1OXTzPdYKodfKrgj7fi+w0HbMOM4N7kEOM
         dVSw2RYK0bfHf/8VtJSE6e0xGtmFbj1OYnrRCP11eYnZgHwcXiu3l4xtav+a5o3SXN
         tQbCm3/0TQV3A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220217113004.22757-2-michael.srba@seznam.cz>
References: <20220217113004.22757-1-michael.srba@seznam.cz> <20220217113004.22757-2-michael.srba@seznam.cz>
Subject: Re: [PATCH v6 2/5] clk: qcom: gcc-msm8998: add SSC-related clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, michael.srba@seznam.cz
Date:   Thu, 17 Feb 2022 16:10:06 -0800
User-Agent: alot/0.10
Message-Id: <20220218001009.89820C340E8@smtp.kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting michael.srba@seznam.cz (2022-02-17 03:30:01)
> From: Michael Srba <Michael.Srba@seznam.cz>
>=20
> This patch adds four clocks which need to be manipulated in order to
> initialize the AHB bus which exposes the SCC block in the global address
> space.
>=20
> If a device is known to be configured such that writing to these
> registers from Linux is not permitted, the 'protected-clocks'
> device tree property must be used to denote that fact.
>=20
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  CHANGES:
>  - v2: none
>  - v3: none
>  - v4: reword the commit message
>  - v5: none
>  - v6: none
> ---
>  drivers/clk/qcom/gcc-msm8998.c | 56 ++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm899=
8.c
> index 407e2c5caea4..2d14c3d672fc 100644
> --- a/drivers/clk/qcom/gcc-msm8998.c
> +++ b/drivers/clk/qcom/gcc-msm8998.c
> @@ -2833,6 +2833,58 @@ static struct clk_branch gcc_rx1_usb2_clkref_clk =
=3D {
>         },
>  };
> =20
> +static struct clk_branch gcc_im_sleep_clk =3D {
> +       .halt_reg =3D 0x4300C,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x4300C,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){

const struct clk_init_data
