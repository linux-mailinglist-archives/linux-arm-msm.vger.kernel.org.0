Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B61FAAFD3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 02:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390354AbfIFAYW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 20:24:22 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45049 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390197AbfIFAYW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 20:24:22 -0400
Received: by mail-pf1-f193.google.com with SMTP id q21so3032666pfn.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 17:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:to:from:cc:subject:user-agent:date;
        bh=DSzjso2AJLvfSyD5dg7v4lN+c7meO/zdU3rQw+Q3m90=;
        b=FFRoIBeM1oaZ3ljxrttUV2y0pgDtCbQwWEaXr3yRCXP/CcLiHji3lE20vNWTFjk1+H
         Oz7hxvsjoE/Bgguk1rlLH6A14k1Djc1cuPzxGWT9+BaB2EFh4APaKWwpX0ecHF4fYhWE
         YpVdSd3ULGedOfTCEHL8fXenyisAVoEGqgAFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:to:from:cc:subject
         :user-agent:date;
        bh=DSzjso2AJLvfSyD5dg7v4lN+c7meO/zdU3rQw+Q3m90=;
        b=ILXyr3A+RHN0MblkjjrfOH/MgoQMhoS60GrWO/uY8pzlMWel5S9GRpaPqkAh677l3T
         8ZdPVLUOz3sfIQ5vZldhVwLcP7BcB614hdGNOo2WsSylDKHBdAu/bXJrOrW488hlTUYz
         SLVP19W1MWO99+pOdMx6O4wNnT/9fIke9Xp4N2Bs1vITzMgp4ymcqvT48QGj9zzZZvyw
         9eKlNRCCb3Jbsx0SaVZovDWUdJA48KyIc/TUBWnTyQZIxg+Tua9UDOBwX66faOhODhSC
         aPp6KeiZN+ndmptvcf26XkGBExw+C2CCZiY5yCK1uCFuGI6bGuhdpnH68pjr8d1NNs+0
         lWQw==
X-Gm-Message-State: APjAAAWcnM0gnvF+x3wO1WvLu+4auyXWKewlmvKGfhWTeQ5N4pStPKg/
        +mOIzCroyaxrF2OVOAq+ZjuWLg==
X-Google-Smtp-Source: APXvYqy7ej8CqOzurKLhZUiScAimCJ0smbuorKW3l54k4ecoUYK5iivoA/lqIebdNU2zg5yPO7C+ew==
X-Received: by 2002:a65:5382:: with SMTP id x2mr5669447pgq.422.1567729461915;
        Thu, 05 Sep 2019 17:24:21 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k14sm2937689pgi.20.2019.09.05.17.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 17:24:21 -0700 (PDT)
Message-ID: <5d71a735.1c69fb81.8f334.825a@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190829181203.2660-12-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org> <20190829181203.2660-12-ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, evgreen@chromium.org,
        linus.walleij@linaro.org, marc.zyngier@arm.com
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH RFC 11/14] drivers: pinctrl: sdm845: add PDC wakeup interrupt map for GPIOs
User-Agent: alot/0.8.1
Date:   Thu, 05 Sep 2019 17:24:20 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-08-29 11:12:00)
> diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom=
/pinctrl-sdm845.c
> index 39f498c09906..5f43dabcd8eb 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
> @@ -1282,6 +1282,84 @@ static const int sdm845_acpi_reserved_gpios[] =3D {
>         0, 1, 2, 3, 81, 82, 83, 84, -1
>  };
> =20
> +static const struct msm_gpio_wakeirq_map sdm845_pdc_map[] =3D {
> +       {1, 30},

Please add spaces around the braces. Maybe you can have 5 per row? Would
make it a little more compact and still easy to confirm.

> +       {3, 31},
> +       {5, 32},
> +       {10, 33},
