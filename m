Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1A0159E08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 01:33:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgBLAdq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 19:33:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:38274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728070AbgBLAdq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 19:33:46 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDD1F2082F;
        Wed, 12 Feb 2020 00:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581467626;
        bh=jjeQHDoBXQjOLBKIhX09ch0SHN8PnG0nbXofAKl6AzU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=I26xL0kpqlxXj5LmwUqjG14aGBvnh4Qe3MGccFb1NkWMwFB1gZidOdBu91MTjqN/X
         FTCAqXhFzbL1I0sJkI76ZDieoLYAqxf0V9D1F31fNOnAywr5rYJ6QG+udhIAkmIX7D
         ZrBme8HAhH/0QFDWXM0oW+B9QC2A89oIDNtartlo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581423236-21341-1-git-send-email-tdas@codeaurora.org>
References: <1581423236-21341-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/2] clk: qcom: videocc: Update the clock flag for video_cc_vcodec0_core_clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Doug Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, robh@kernel.org
Date:   Tue, 11 Feb 2020 16:33:45 -0800
Message-ID: <158146762511.121156.15568536483085952043@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-02-11 04:13:55)
> The clock disable signal for video_cc_vcodec0_core_clk is tied to
> vcodec0_gdsc which is supported in the HW control mode. Thus turning off
> the clock would be taken care automatically when the GDSC turns OFF by
> hardware and clock driver does not require to poll on the CLK_OFF bit.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/videocc-sc7180.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc=
-sc7180.c
> index c363c3c..276e5ec 100644
> --- a/drivers/clk/qcom/videocc-sc7180.c
> +++ b/drivers/clk/qcom/videocc-sc7180.c
> @@ -97,7 +97,7 @@ static struct clk_branch video_cc_vcodec0_axi_clk =3D {
>=20
>  static struct clk_branch video_cc_vcodec0_core_clk =3D {
>         .halt_reg =3D 0x890,
> -       .halt_check =3D BRANCH_HALT,
> +       .halt_check =3D BRANCH_HALT_VOTED,

Ok. I looked closely and now I notice that some code is using
BRANCH_VOTED and other code is using BRANCH_HALT_VOTED. In the end, it's
the same value. I guess I should remove BRANCH_VOTED from the header
file and make it BIT(7) that's ored in there so that everyone
consistently uses BRANCH_HALT_VOTED.

>         .clkr =3D {
>                 .enable_reg =3D 0x890,
