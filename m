Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAA767879C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 22:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243583AbjHXU6p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 16:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243634AbjHXU6R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 16:58:17 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFFF19BF
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 13:58:15 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d77c5414433so280910276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692910695; x=1693515495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6SC9PrQbNiMYcNG0IokF3Oc/20YLCYRWG7NXvHzRdgs=;
        b=ZlQoQ0BjePNgc6ILIOalIuRlNp+7cJzgMB3+P9lKEA1rzkZQLK/b4+w4dHpXKvUkoi
         uV2wy+225oxECbKcnIbbvTegxDiJNs6DhfiMlE6xzaPCILTtvi7A+MjsGwV/8tg5FND1
         NtUmu3H+aGKwaMJnLh0ZyI9+p3JgX8kG1QNCfZA1CDk0MrNompso9S2N3lYKs22ycNwn
         rFzjaEg6UxAbpG2qYQukSdwMZZo0Z5ew7g/8TD+k1jvNasfh2PPUmX3it3GGDj1k9ZTd
         XddfjnLXh7qnvC05tVrI5y9x35YW2GcvzfLWQCyXunw05fd2YWFJujPdvZ7bkHclfp+s
         NzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692910695; x=1693515495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6SC9PrQbNiMYcNG0IokF3Oc/20YLCYRWG7NXvHzRdgs=;
        b=XegHoctLj6fiXiVLOIrkepLHuQ7dq96eREcDUdg1Vmeoa+JCu9XwYwlPZJjzuIPui6
         JQ/6enQk5ROt+Ph0VQUrD4GgqkEe55EQfadWdv+1vpv/OCVPQiAVn7eznkkzPn8JjIA6
         zev4FWfFaO9I3JVmQmHfEZIjNlXlAbmHYPjmQEfaKyQgOVD1OrK5bVOjEufOcPi4mOx+
         ydAtqNF/xOiGxot+ZNmY7WpnUjiBxdpUdEJzWK1FAzddIKdOxBIxjhVWzzcp69O8+I7Y
         ZKYc8SgpFRCkZd4mzx22uSaTbNY7704d9QYRmdMLfqdokr6X+VN3J+GT1TgvsRqgyVFt
         Ulkw==
X-Gm-Message-State: AOJu0YxaAnO2zX1IffBmfGTzhNC0aZ4EqiqDSC0nKMwhP387chlntsXA
        fOaYggfSkTzp+b39ua+/22Fdqnl+OS+QgvP+cgTA8w==
X-Google-Smtp-Source: AGHT+IEcKfE0x5VK/frMlxUrqmOPqsTO740MkftKBxAGMP5PXuXXJRpSYhg0Izfj2F6SJXCCyXTbpRUEZTUkpGZ30XY=
X-Received: by 2002:a25:dfcf:0:b0:d78:133e:9ab4 with SMTP id
 w198-20020a25dfcf000000b00d78133e9ab4mr2194039ybg.58.1692910694878; Thu, 24
 Aug 2023 13:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230823171208.18382-1-athierry@redhat.com> <20230823171208.18382-2-athierry@redhat.com>
In-Reply-To: <20230823171208.18382-2-athierry@redhat.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 24 Aug 2023 23:58:03 +0300
Message-ID: <CAA8EJpp0YTREszG_VdEQouvn+_qYLFX8ZmUbC1xya9Snmcji0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] phy: qcom-qmp-usb: initialize PCS_USB registers
To:     Adrien Thierry <athierry@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 23 Aug 2023 at 20:12, Adrien Thierry <athierry@redhat.com> wrote:
>
> Currently, PCS_USB registers that have their initialization data in a
> pcs_usb_tbl table are never initialized. Fix that.
>
> Fixes: fc64623637da ("phy: qcom-qmp-combo,usb: add support for separate PCS_USB region")
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> index 466f0a56c82e..ccbe64f7897e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> @@ -2233,6 +2233,7 @@ static int qmp_usb_power_on(struct phy *phy)
>         void __iomem *tx = qmp->tx;
>         void __iomem *rx = qmp->rx;
>         void __iomem *pcs = qmp->pcs;
> +       void __iomem *pcs_usb = qmp->pcs_usb ?: qmp->pcs;
>         void __iomem *status;
>         unsigned int val;
>         int ret;
> @@ -2255,6 +2256,7 @@ static int qmp_usb_power_on(struct phy *phy)
>         }
>
>         qmp_usb_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
> +       qmp_usb_configure(pcs_usb, cfg->pcs_usb_tbl, cfg->pcs_usb_tbl_num);

I think we don't need to fallback to pcs here: if there is a separate
pcs_usb_tbl, we need a separate pcs_usb region. Just pass qmp->pcs_usb
here.

>
>         if (cfg->has_pwrdn_delay)
>                 usleep_range(10, 20);
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
