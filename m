Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2F679B4C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 02:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344539AbjIKVO3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244313AbjIKUDA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 16:03:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4382ECA;
        Mon, 11 Sep 2023 13:02:56 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BF6C433C8;
        Mon, 11 Sep 2023 20:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694462575;
        bh=jH16CmyhpxzVrUqxcSYdhIT8N0H3czRJNlZ/KK78ShE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sXuUmqDGwXvk1y5MfLugBJ534n0qLPH7QM512PqtNUncruB8rY7n7J36aqcS4Eq/4
         v9BzmRcQPr8JdEGn+Rrv6gV6l0YFTlX5LdECpc4nJHDAUxLqCGLgdXpYDfmT0L2TQP
         mVyjA+v478FVdKDdV9KxCXVUqbaIV72vTcbnbxKRkmqCMMhkvQ2JuITgG+a5PWtufs
         Yv05oLNGyCSqMMFcHIF0pI/ugc4B8KEQTnNfV7mDtXqn8xdkK3YmQG6nZGQUA+Gb4X
         8Btb/NqLhrbR7lLcuyyDpKLYYpuM0CgLnxXj2oROm7v+OleMBSu8dx6K9AaaF8CCDv
         +Py4o4ELgtv6g==
Message-ID: <8ec473b5b80d5fad8d76df6d88d2c1d0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230911151548.672485-1-u.kleine-koenig@pengutronix.de>
References: <20230911151548.672485-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] clk: qcom: cbf-msm8996: Convert to platform remove callback returning void
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel@pengutronix.de
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Mon, 11 Sep 2023 13:02:53 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-09-11 08:15:48)
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
>=20
> qcom_msm8996_cbf_icc_remove() returned zero unconditionally. After
> changing this function to return void instead, the driver can be
> converted trivially to use .remove_new().
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Do you want to take this? Otherwise, I can apply it to fixes.

>  drivers/clk/qcom/clk-cbf-8996.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8=
996.c
> index 53f205a3f183..fe24b4abeab4 100644
> --- a/drivers/clk/qcom/clk-cbf-8996.c
> +++ b/drivers/clk/qcom/clk-cbf-8996.c
> @@ -250,13 +250,11 @@ static int qcom_msm8996_cbf_icc_register(struct pla=
tform_device *pdev, struct cl
>         return 0;
>  }
> =20
> -static int qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
> +static void qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
>  {
>         struct icc_provider *provider =3D platform_get_drvdata(pdev);
> =20
>         icc_clk_unregister(provider);
> -
> -       return 0;
>  }
>  #define qcom_msm8996_cbf_icc_sync_state icc_sync_state
>  #else
> @@ -266,7 +264,7 @@ static int qcom_msm8996_cbf_icc_register(struct platf=
orm_device *pdev,  struct c
> =20
>         return 0;
>  }
> -#define qcom_msm8996_cbf_icc_remove(pdev) (0)
> +#define qcom_msm8996_cbf_icc_remove(pdev) { }

It would be better if this was a static inline function.

>  #define qcom_msm8996_cbf_icc_sync_state NULL
>  #endif
>
