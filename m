Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFF7D1265C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 16:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfLSPaH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 10:30:07 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:35892 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfLSPaH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 10:30:07 -0500
Received: by mail-il1-f194.google.com with SMTP id b15so5201444iln.3;
        Thu, 19 Dec 2019 07:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1odjdZuRkJCZ+tii0NxcdzTt6Zd3fx6UdRqARilr0C4=;
        b=GTb44jJdapUVtcKJ2nWgrhWpKs6gj4LzyXd9lKnnuWteMm7x9GruJPXqs6xnHMsLTX
         O0PoSqhEUZm42jG/yAE3IAoDIphRzz3QT8m8zg2htpIRYpnBDc7rSAv9PWCN2Th4B60w
         +fa/QiqyAXd2sVs9vsfWsdGSgAEYpjCyJX42E/69gCRgLy+hBva6NygGZtMp2jJ25X57
         LGZ5LUlhWeQexuFQBhABVO71C99kh4fyr5WqpJUdjMHKs8tx7RACI1UzQ2y/yNQ6/NK0
         mOd2Vs4FRoucpBoR+wrOoGX4nm0NoylamLWZm1vimgW7Y446mkxMlwKkiHbO3gwazBW3
         CW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1odjdZuRkJCZ+tii0NxcdzTt6Zd3fx6UdRqARilr0C4=;
        b=dT9P9EQ4xkVI4vGpnm5oatJUXwe0bYePYeq7Md5DlCEx5s2a/GU43kpxDfVcP9u0Xi
         bd+hmJWQ6Kk2eHYCbZN9l9AO/P68YcABwyQfbEB3aQ/hdDrq9VAqYasq9Pf+XJqOhegA
         165QjAs9nrD0TdtTkwFdlrgEnjwiWXMDFMQJtHWFfHpqZLevxtL0CP0tqHOuSv0kl1kR
         zYPfPOwP14/tUpoV93f5Y3uOMzp+Ku3oEWQ53oz8PSQ+AvYF8ifA36vZn0mvhQLfUYtY
         9TXuM0VJReubkdjVGZbVDi/ez8bDHITR4x/YtNw+h6PjqfWWhv4EOnAUCvXQ1m9JvWnm
         JREw==
X-Gm-Message-State: APjAAAUnuGtqBl+gaJbiLq7HjdMbQJWZ4l8dUTl0w24J8nReyD+Xh5cc
        JPYf8qN4/SNJA5FDNJoTnMPvl2pnNltMuiUm42A=
X-Google-Smtp-Source: APXvYqxA5d2xROZncSn4unjjmxhK4C2G1m36xGUQszHoflORlv4AAcZFyTMsYtmhlRcb9q1heiHgtoESkFQEb0Q6+/A=
X-Received: by 2002:a92:2904:: with SMTP id l4mr7922510ilg.166.1576769407034;
 Thu, 19 Dec 2019 07:30:07 -0800 (PST)
MIME-Version: 1.0
References: <20191219150433.2785427-1-vkoul@kernel.org> <20191219150433.2785427-2-vkoul@kernel.org>
In-Reply-To: <20191219150433.2785427-2-vkoul@kernel.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 19 Dec 2019 08:29:55 -0700
Message-ID: <CAOCk7Npwkx0hJ6hom7yDbN_n-a=sybVi7A=unc4d3UPJysPr+Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] phy: qcom-qmp: Increase the phy init timeout
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, Can Guo <cang@codeaurora.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 19, 2019 at 8:04 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> If we do full reset of the phy, it seems to take a couple of ms to come
> up on my system so increase the timeout to 10ms.
>
> This was found by full reset addition by commit 870b1279c7a0
> ("scsi: ufs-qcom: Add reset control support for host controller") and
> fixes the regression to platforms by this commit.
>
> Suggested-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

Tested on the Lenovo Miix 630 laptop (a msm8998 based system).  This
addresses the regression.

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 091e20303a14..c2e800a3825a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -66,7 +66,7 @@
>  /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
>  #define CLAMP_EN                               BIT(0) /* enables i/o clamp_n */
>
> -#define PHY_INIT_COMPLETE_TIMEOUT              1000
> +#define PHY_INIT_COMPLETE_TIMEOUT              100000
>  #define POWER_DOWN_DELAY_US_MIN                        10
>  #define POWER_DOWN_DELAY_US_MAX                        11
>
> --
> 2.23.0
>
