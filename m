Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2D91A3B17
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 22:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgDIUG4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 16:06:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:37700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726819AbgDIUG4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 16:06:56 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D1D220730;
        Thu,  9 Apr 2020 20:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586462816;
        bh=nSw3fUKbe9A+uOfnXkK+h2BbfLi5hDRgEXe0czQ71ug=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=1Qpn+b1agEH8hbIik8e1kXczOfzvnMN7DD+aM1LL1vgnk/8w39IGwoth91wsEUfhc
         5GA3RvVynClZXrH/t+ZIgPuxUMzYONBaTfY+QoiDjavW8C5yHTwz8bijbNs9L+NMU3
         SbNPS9Z3j+ooo8OWmp7SPL7eXB8mEwyHxqJjIh3s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585338485-31820-2-git-send-email-tdas@codeaurora.org>
References: <1585338485-31820-1-git-send-email-tdas@codeaurora.org> <1585338485-31820-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/4] clk: qcom: gdsc: Add support to enable retention of GSDCR
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 09 Apr 2020 13:06:55 -0700
Message-ID: <158646281555.77611.13094729241703720869@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-03-27 12:48:02)
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index a250f59..cfe908f 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -28,6 +28,7 @@
>  /* CFG_GDSCR */
>  #define GDSC_POWER_UP_COMPLETE         BIT(16)
>  #define GDSC_POWER_DOWN_COMPLETE       BIT(15)
> +#define GDSC_RETAIN_FF_ENABLE          BIT(11)
>  #define CFG_GDSCR_OFFSET               0x4
>=20
>  /* Wait 2^n CXO cycles between all states. Here, n=3D2 (4 cycles). */
> @@ -202,6 +203,14 @@ static inline void gdsc_assert_reset_aon(struct gdsc=
 *sc)
>         regmap_update_bits(sc->regmap, sc->clamp_io_ctrl,
>                            GMEM_RESET_MASK, 0);
>  }
> +
> +static inline void gdsc_retain_ff_on(struct gdsc *sc)

Drop inline please.

> +{
> +       u32 mask =3D RETAIN_FF_ENABLE;

Is this supposed to be GDSC_RETAIN_FF_ENABLE?

> +
> +       regmap_update_bits(sc->regmap, sc->gdscr, mask, mask);
> +}
> +
>  static int gdsc_enable(struct generic_pm_domain *domain)
>  {
>         struct gdsc *sc =3D domain_to_gdsc(domain);
> @@ -254,6 +263,9 @@ static int gdsc_enable(struct generic_pm_domain *doma=
in)
>                 udelay(1);
>         }
>=20
> +       if (sc->flags & RETAIN_FF_ENABLE)
> +               gdsc_retain_ff_on(sc);
> +
>         return 0;
>  }
>=20
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 64cdc8c..8604d44 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -49,6 +49,7 @@ struct gdsc {
>  #define AON_RESET      BIT(4)
>  #define POLL_CFG_GDSCR BIT(5)
>  #define ALWAYS_ON      BIT(6)
> +#define RETAIN_FF_ENABLE       BIT(7)

This is a flag, not a register bit presumably.

>         struct reset_controller_dev     *rcdev;
>         unsigned int                    *resets;
>         unsigned int                    reset_count;
