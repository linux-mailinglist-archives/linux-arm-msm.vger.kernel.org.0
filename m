Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59C337BF1AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 05:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441993AbjJJDtd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 23:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442073AbjJJDtb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 23:49:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68151A7;
        Mon,  9 Oct 2023 20:49:30 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA02DC433CD;
        Tue, 10 Oct 2023 03:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696909770;
        bh=gvsf82TaqhBK5rmgl3OLBB/pdV76Q1+cWepaBMm+mBg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kbjMlSYt4rAXxdMjVxWqoXjmhiOV9U3v4JT8UM5OzXd+Bsok4JGS6TswryNmF2N4J
         u5ZhZNnuO2ys0cmEOZIDymzUGvOosM/CjvHoXqsgJB//G7dorxamb+N128YPdv15Jx
         uVKbQTy+m0qHC3ny7bFaRhDpOuABMD2J41TNls6UzWlw82FBudyD9xSVsMyVALKQut
         zSklo/gCjNYd+VgD0/vuAxVvv0WKoKSj63oL5Oe/WfXRMiELD8goOE05+LZPzz1FaU
         Bn9VvJIMfpiRSR1F1h5y3xyCo9lyXTvq5eCR7SZu0y6Bgoyqyy2LYquYRWES6VrIUD
         7NvyAxapIjjug==
Message-ID: <3da62b36856cea690afd22d4c1500d2b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cghreaj25elndy3wfdqhetlpk3hswyu5hnvvzdhcoqbpj2kin7@lzfeshjoyxti>
References: <20230911151548.672485-1-u.kleine-koenig@pengutronix.de> <8ec473b5b80d5fad8d76df6d88d2c1d0.sboyd@kernel.org> <20230912065343.neorcr5mksodbaod@pengutronix.de> <cghreaj25elndy3wfdqhetlpk3hswyu5hnvvzdhcoqbpj2kin7@lzfeshjoyxti>
Subject: Re: [PATCH] clk: qcom: cbf-msm8996: Convert to platform remove callback returning void
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de
To:     Bjorn Andersson <andersson@kernel.org>
Date:   Mon, 09 Oct 2023 20:49:27 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2023-09-20 10:29:58)
> On Tue, Sep 12, 2023 at 08:53:43AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > Hello Stephen,
> >=20
> > On Mon, Sep 11, 2023 at 01:02:53PM -0700, Stephen Boyd wrote:
> > > Quoting Uwe Kleine-K=C3=B6nig (2023-09-11 08:15:48)
> > > > The .remove() callback for a platform driver returns an int which m=
akes
> > > > many driver authors wrongly assume it's possible to do error handli=
ng by
> > > > returning an error code. However the value returned is ignored (apa=
rt
> > > > from emitting a warning) and this typically results in resource lea=
ks.
> > > > To improve here there is a quest to make the remove callback return
> > > > void. In the first step of this quest all drivers are converted to
> > > > .remove_new() which already returns void. Eventually after all driv=
ers
> > > > are converted, .remove_new() is renamed to .remove().
> > > >=20
> > > > qcom_msm8996_cbf_icc_remove() returned zero unconditionally. After
> > > > changing this function to return void instead, the driver can be
> > > > converted trivially to use .remove_new().
> > > >=20
> > > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.d=
e>
> > > > ---
> > >=20
> > > Do you want to take this? Otherwise, I can apply it to fixes.
> >=20
> > if "you" =3D=3D "Uwe Kleine-K=C3=B6nig": Please take it via your tree. =
There is
> > still much to do before the next synchronous step, so there is no urge.
> > If the patch goes in during the next merge window that's fine, too.
> >=20
>=20
> @Stephen, should I just pick this in the Qcom tree for 6.7 then?
>=20

Yes please.
