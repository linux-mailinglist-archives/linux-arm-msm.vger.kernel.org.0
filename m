Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 636FD170BDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 23:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbgBZWtr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 17:49:47 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36441 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbgBZWtr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 17:49:47 -0500
Received: by mail-pg1-f194.google.com with SMTP id d9so385774pgu.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2020 14:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=zrxYK5T4ryzAQ2/Coj4xWlYlr/YB5hTtCncd5uUc0tg=;
        b=BoAb9F5e0xcUz/99univTBiDlbKMXwAMGASi71CgsY4GoUj7vPWfV8OCv9eQS5qo98
         roRqj/8sbWDJNq8uFWg6paTRdw/Qf93w3hbv7lQckpl9Fr8DBSwKdUWsRt5x8nVvz66h
         Kd6cFfvvC8u+EQh0vP0RB7rIXsQ473CE2lHok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=zrxYK5T4ryzAQ2/Coj4xWlYlr/YB5hTtCncd5uUc0tg=;
        b=No3FKDsZERw0vAfgfi8vS0g/psHySLfkFJC550JeNbhaZ9PBolMO7mCsH5gJYY5Wtj
         hw+RBn+c5tjdRe5VX3vyvZLXsusOxw3rG41vY5RHQKLwPI0rtqLjgAH6R5d3KVlPLiFS
         neneJfMSV3V6rI5gE1fLCuxUkDkcoTSd6cBNMcZ89s/Zowerl8tHuByeSUTcDDN0fDPZ
         aibbz0+4OH/4HIVJF2+QwgEt4gYU8qAG0uhzVSwg/HrSebyu09JDsLyFEIAPmdHJh3zt
         5rBaN6iZyCwxXa2pSmc0PSvKUXOLJpepWMKMVXqPYlANobYoJi1svs/oW6uUQOPF71CN
         KGIg==
X-Gm-Message-State: APjAAAUkE3CIsdBjh9Y7ndQfGrBWBghOAUEIEdvzY5owBhXfC2BI9Zwk
        C6PNtDbVOY7YG2i9FyOgkWeFSw==
X-Google-Smtp-Source: APXvYqzWSwy1V4i2RZk6mQsWpopxq8C4OV64juHHo4XtneUSiu09Qomzsc0m6YYSZOzAGYVT+e38XQ==
X-Received: by 2002:a63:8f5c:: with SMTP id r28mr1021763pgn.351.1582757384609;
        Wed, 26 Feb 2020 14:49:44 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k1sm2325744pgt.70.2020.02.26.14.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 14:49:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1582694833-9407-4-git-send-email-mkshah@codeaurora.org>
References: <1582694833-9407-1-git-send-email-mkshah@codeaurora.org> <1582694833-9407-4-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v7 3/3] soc: qcom: rpmh: Invoke rpmh_flush for dirty caches
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Wed, 26 Feb 2020 14:49:43 -0800
Message-ID: <158275738312.177367.16582562675135073777@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-02-25 21:27:13)
> Add changes to invoke rpmh flush when the data in cache is dirty.
>=20
> This is done only if OSI is not supported in PSCI. If OSI is supported
> rpmh_flush can get invoked when the last cpu going to power collapse

Please write rpmh_flush() so we know it's a function and not a variable.

> deepest low power mode.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index 83ba4e0..839af8d 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/psci.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> @@ -163,6 +164,9 @@ static struct cache_req *cache_rpm_request(struct rpm=
h_ctrlr *ctrlr,
>  unlock:
>         spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> =20
> +       if (ctrlr->dirty && !psci_has_osi_support())

Can we introduce a stub function for psci_has_osi_support() when
CONFIG_ARM_PSCI_FW=3Dn? This driver currently has:

  config QCOM_RPMH
        bool "Qualcomm RPM-Hardened (RPMH) Communication"
	depends on ARCH_QCOM && ARM64 || COMPILE_TEST


which implies that this will break build testing once built on something
that isn't arm64.


> +               return rpmh_flush(ctrlr) ? ERR_PTR(-EINVAL) : req;
> +
>         return req;
>  }
> =20
> @@ -391,6 +395,8 @@ int rpmh_write_batch(const struct device *dev, enum r=
pmh_state state,
> =20
>         if (state !=3D RPMH_ACTIVE_ONLY_STATE) {
>                 cache_batch(ctrlr, req);
> +               if (!psci_has_osi_support())
> +                       return rpmh_flush(ctrlr);

While the diff is small it is also sad that we turn around after adding
it to a list and immediately take it off the list and send it. Can't we
do this without having to do the list add/remove dance?

>                 return 0;
>         }
>
