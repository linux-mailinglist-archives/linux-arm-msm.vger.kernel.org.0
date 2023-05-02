Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE8B26F43C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 14:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233961AbjEBMYx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 08:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233833AbjEBMYw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 08:24:52 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE6C19BB
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 05:24:50 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-b9a879cd49cso5548602276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 05:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683030289; x=1685622289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rsis98AS5y9CGrS/8TAMA+kRXIi6squrLmsCHxkr5QU=;
        b=D7Jp0qxIyiWEYcrV8o4HDXvVeyDMa4nuVV9DA5iy1xvb98wyUKXYquMwEgXSjRqrmA
         ng11lM+5xgUlvm9BvMIrcTo/t0JDONWgNraJPwRCxtVL1NhFQYfDSN8r1tc6SGrfNVmw
         uURXUmj2pBsJvJrg8oWK8kqvyQ6nmvvOifuI6FupTwfpL0ib51RpQKKEhcK0Bk8IBH6x
         3ymy4omrZOfPasvL5vhnX04eLcC/KkAn7VcDUn/2i2m3Nut1mhyVCGOPceY8sDV49dWt
         /NnsAiZcp05m9unSUxG+uRmT0BshumSO3DFsPFhkS841ifTd5JRoeEySkm+e1ShYDvdK
         apgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683030289; x=1685622289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsis98AS5y9CGrS/8TAMA+kRXIi6squrLmsCHxkr5QU=;
        b=YRMDZcRt4kaluXl3jET2mUZdikvC4cJ1QrevMzIW0FL+DpYZQSFUTO0PcjIVaky/Ah
         TRtquLGqvbE1a9/i6etOlosoIZjVeJZapG3Qq+2cjM3hLJKtKJZJGO7nrkA1vtH8pukD
         tyNVnPunYl6IGZDIYg28N47essWRLNwOjInGYLXndBeW/qWVni/6QP+wDdKL9T94jcJZ
         PNeLnu7itsoDRVxrCQzF01SKPqTyrXxsYJ3DeOtRTu0BOVno6Fs8bTKP1LbSjL6bSk0z
         yFcCVWl5nJua7pTxJcXMXcM3kglAEX7uB/i3nysX37VfKUm9+6kWXgXfBNtkUXG7EBjA
         7JSw==
X-Gm-Message-State: AC+VfDxit8IvLH8JyKzSCHru9/VR6Y9VkfH1px4NRsn3KVxoZVuQkbs3
        2z39ZAFFAVzeyHko4ORjoudAgCEf83vEmN6dFEOP1Q==
X-Google-Smtp-Source: ACHHUZ7eeyre+CuDCWfIJhwjZRbjjp0xunX9LvJHgIBIh5xXRh9pY8dvlc0JPGXbq1IqVaRtaMl4ODqBV5bZwDJP9Q4=
X-Received: by 2002:a81:5b43:0:b0:55a:3486:6f5b with SMTP id
 p64-20020a815b43000000b0055a34866f5bmr7760150ywb.13.1683030289668; Tue, 02
 May 2023 05:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230502103810.12061-1-johan+linaro@kernel.org> <20230502103810.12061-3-johan+linaro@kernel.org>
In-Reply-To: <20230502103810.12061-3-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 2 May 2023 15:24:38 +0300
Message-ID: <CAA8EJpoxL7AFApp-mbbODAu6AKWM7GV2FGzq=O=WKEFZ72-SbQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: qcom-qmp-pcie-msm8996: fix init-count imbalance
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2 May 2023 at 13:39, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> The init counter is not decremented on initialisation errors, which
> prevents retrying initialisation.
>
> Add the missing decrement on initialisation errors so that the counter
> reflects the state of the device.
>
> Fixes: e78f3d15e115 ("phy: qcom-qmp: new qmp phy driver for qcom-chipsets")
> Cc: stable@vger.kernel.org      # 4.12
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
> index 09824be088c9..0c603bc06e09 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
> @@ -379,7 +379,7 @@ static int qmp_pcie_msm8996_com_init(struct qmp_phy *qphy)
>         ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>         if (ret) {
>                 dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
> -               goto err_unlock;
> +               goto err_decrement_count;
>         }
>
>         ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> @@ -409,7 +409,8 @@ static int qmp_pcie_msm8996_com_init(struct qmp_phy *qphy)
>         reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>  err_disable_regulators:
>         regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> -err_unlock:
> +err_decrement_count:
> +       qmp->init_count--;
>         mutex_unlock(&qmp->phy_mutex);
>
>         return ret;
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
