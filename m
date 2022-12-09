Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9A1647B45
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 02:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiLIBVe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 20:21:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbiLIBVc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 20:21:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC7DAC6D0;
        Thu,  8 Dec 2022 17:21:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E37562104;
        Fri,  9 Dec 2022 01:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0054CC433F0;
        Fri,  9 Dec 2022 01:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670548891;
        bh=DKPT7J8lJghQRKRYiRO+gf5Epi/In/TlKje1orYJKjc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=loTQzyXGSUo8cd+OLarD7scA3SHjyPanNqUITILrXI4xbrwrSuByWsrf/HnbPq0Cf
         PRLYB3vi1ps4pAFzGPfz1VG15LpT8FGZDkWPD1P070zn9hmwG8Ssl66UK52wdZWbIW
         MpW0eD/pAd5jG7VQiS6EmHkl/a4xbBPtJ8MiFmT0lp1XDf8sdZiNbd1U4Ny2rwWfEd
         Io7edpIz442aK0WV87acZ7kqfiHrHnDkeAV7EpbK6/QNvggDJpSuj5xjBzcvt1fdd7
         ytpbd79DdiEsmso2BbCKhZ5mTObohxc6FwA0gOnLK+HANv2WppJX1xi5tIOMuXGWK1
         7ISoov/AhSSaA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221208143945.50279-1-dmitry.baryshkov@linaro.org>
References: <20221208143945.50279-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] clk: qcom: clk-spmi-pmic-div: convert to use parent_data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 08 Dec 2022 17:21:28 -0800
User-Agent: alot/0.10
Message-Id: <20221209012131.0054CC433F0@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-12-08 06:39:45)
> diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-=
spmi-pmic-div.c
> index f2cf55cee2fd..aa015c51ab4f 100644
> --- a/drivers/clk/qcom/clk-spmi-pmic-div.c
> +++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
> @@ -175,6 +175,10 @@ static const struct clk_ops clk_spmi_pmic_div_ops =
=3D {
>         .round_rate =3D clk_spmi_pmic_div_round_rate,
>  };
> =20
> +static const struct clk_parent_data clk_spmi_pmic_parent_data =3D {
> +       .index =3D 0,
> +};

Why not put this on the stack? clk core should be deep copying.
