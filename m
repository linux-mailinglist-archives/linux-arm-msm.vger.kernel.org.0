Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5E151F7089
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 00:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgFKWrA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 18:47:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:33104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726254AbgFKWrA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 18:47:00 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7139B206D7;
        Thu, 11 Jun 2020 22:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591915619;
        bh=y7oaSm/JNOPNtYb74UFjDdhC6kjkYhvWO/e2LzL1J44=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TpDbc7FE6CrHoiBB2bYYJ9QQFAMPOoV3kRxP6n/lICap+9fQUPgMYZVaNpDKFMj3q
         FW1wgsvfCl+nJS+R7QC+YD393eLiV5Q3RrVxlGJt3CWjf6Hub1OtjVk5kp3JjycTTs
         RXz1iXbVH6Dd1RFs5i2AFdTZHHwQ1ZE0WuQlZ3Q4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1591885683-29514-2-git-send-email-sanm@codeaurora.org>
References: <1591885683-29514-1-git-send-email-sanm@codeaurora.org> <1591885683-29514-2-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: qcom: gcc: Add genpd active wakeup flag for sc7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Thu, 11 Jun 2020 15:46:58 -0700
Message-ID: <159191561875.242598.18326727418245335996@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-06-11 07:28:02)
> From: Taniya Das <tdas@codeaurora.org>
>=20
> The USB client requires the usb30_prim gdsc to be kept active for
> certain use cases, thus add the GENPD_FLAG_ACTIVE_WAKEUP flag.

Can you please describe more of what this is for? Once sentence doesn't
tell me much at all. I guess that sometimes we want to wakeup from USB
and so the usb gdsc should be marked as "maybe keep on for wakeups" with
the GENPD_FLAG_ACTIVE_WAKEUP flag if the USB controller is wakeup
enabled?

>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Add a Fixes: tag too? And I assume we need to do this for all USB gdscs
on various SoCs and maybe other GDSCs like PCIe. Any plans to fix those
GDSCs?

>  drivers/clk/qcom/gcc-sc7180.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> index ca4383e..2b3dd4e 100644
> --- a/drivers/clk/qcom/gcc-sc7180.c
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> @@ -2263,6 +2263,7 @@ static struct gdsc usb30_prim_gdsc =3D {
>         .gdscr =3D 0x0f004,
>         .pd =3D {
>                 .name =3D "usb30_prim_gdsc",
> +               .flags =3D GENPD_FLAG_ACTIVE_WAKEUP,
>         },
>         .pwrsts =3D PWRSTS_OFF_ON,
>  };
