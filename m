Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 979401265CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 16:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfLSPbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 10:31:33 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:37664 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbfLSPbd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 10:31:33 -0500
Received: by mail-il1-f193.google.com with SMTP id t8so5215618iln.4;
        Thu, 19 Dec 2019 07:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UY5FQV8FyAQW6rl4nbXg4NF/KWQqHmtwQKPSH3d9DOo=;
        b=tWgqgnpMimF23wrui/wvwnkZnRfmVScwK5ZZZMtM9bpVtjLOXbuv5wsC1CEiwnn2zg
         qHjW11ihJF2HD4K2ov8w/DIbYKqO+EeuK47bQpELIpScG9G1ImpzNdy+qzdM6TYy4kXs
         ALtHlwZxnBgzmq++ppDJhnO0jBM+k5WueYRg6L69VSKyV6UUKWNR3ViKRImo+UUaGdiM
         XRkbO7COojRg5jsNEXI6Cn9FL3JXtU9uudcMtjWsgyumfFlan53na1EsFgv99uyHu68U
         z6y5SOp6z4bWBGAv6KocWNxiI7tDKw4ToHtNxVHissfTWprniZFO0gpU1cuVnOYKHoR7
         Aw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UY5FQV8FyAQW6rl4nbXg4NF/KWQqHmtwQKPSH3d9DOo=;
        b=LXRU+zJL9w1y/oA7nascN3MXjnqyEjlqf1jmPXIdHYvb2mqdgLI6KMOg963YWauscX
         eiEeuSxGwxm0RuhQPK1aHRjh045UtRtPIQay2PPLasIzdrKW6dGoMCVSnVtSxJHQpnQt
         dBSP6T0+cVWlUpA9OXSmXUFqE5SchxDcl7d7sXp9Kd2XEUL6npaVSunHPAoZTUwMJVEe
         lRhT6XbuBd5nEzkGKf/n4LaJJGdZCoTdSQFV4TuWNp7fslKFMG8qDBaAS/k58u0iZyj0
         ezy+/3Gm+eF0eP44DqlsLqZJ7bQWvEvB6a+e3sxGb0Lc+5swOGIE+gsUZ+y4FNjvEcXw
         xEJw==
X-Gm-Message-State: APjAAAWar9H0KhzvDSK7/ZnFziVMjuGXxtoSRqlyT8WisnTB3eaeY2YI
        Wf7Fy6Kpsag+QOmkUA68OJiieYSKgczN+qynoiQ=
X-Google-Smtp-Source: APXvYqz8vCJE5RXYrYgZwGLv3eEzGm4+0T/TuIuLvvoiu6M3OFpVHcFCtS6LFSDIlCpjffJ2pyHL0Q02XRxPxElQoeE=
X-Received: by 2002:a92:2904:: with SMTP id l4mr7929611ilg.166.1576769492958;
 Thu, 19 Dec 2019 07:31:32 -0800 (PST)
MIME-Version: 1.0
References: <20191219150433.2785427-1-vkoul@kernel.org> <20191219150433.2785427-5-vkoul@kernel.org>
In-Reply-To: <20191219150433.2785427-5-vkoul@kernel.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 19 Dec 2019 08:31:21 -0700
Message-ID: <CAOCk7NqJ4pEqdLbbQ7OpGUi_iCC0BTEVVFeAMfD007URnyz-PQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] phy: qcom-qmp: remove duplicate powerdown write
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

On Thu, Dec 19, 2019 at 8:05 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> We already write to QPHY_POWER_DOWN_CONTROL in qcom_qmp_phy_com_init()
> before invoking qcom_qmp_phy_configure() so remove the duplicate write.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 80304b7cd895..309ef15e46b0 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -885,7 +885,6 @@ static const struct qmp_phy_init_tbl msm8998_usb3_pcs_tbl[] = {
>  };
>
>  static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
> -       QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
>         QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0xd9),
>         QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x11),
>         QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL, 0x00),
> --
> 2.23.0
>
