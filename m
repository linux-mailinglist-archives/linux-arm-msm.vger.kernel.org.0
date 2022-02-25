Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87FA14C4B3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 17:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243321AbiBYQrl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 11:47:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236186AbiBYQrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 11:47:22 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED29A2510CA
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 08:46:36 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id y24so10427711lfg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 08:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h+/c/SRTSFW4bUr7uZwCZvPDV13JvSZpjRW/Ah6HmPo=;
        b=N4LP5Oh9x++Pocr8eHXKA2242EquvbDfLIw5chVlFT67q3k/SHnTT8xSaf51V0TpWM
         gbAzCWRp9vhBWkZ+eBJH7Bi92oFuDR7P0A4KuRoAHY5MdTlylTX7oSWabG6DM1/Zvusu
         0KboIZS+04K1i4d8b/9DqYFPzt+FBktUNpbCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h+/c/SRTSFW4bUr7uZwCZvPDV13JvSZpjRW/Ah6HmPo=;
        b=2odmcSc3UR/llOTg3Rjuzld3rO3sBMW/Rxp1x6bqIcF9U412pJdLkZb8ClncTpgfJS
         a/J/t78MSYtaj6+hdu5m2wb+jwPVK6ig5idEpq1coFxcRZeVcwc1nIHFKPHjHt5cX/By
         eXvtrmLMWheQr2NHzI4c2rlzNNEx+dlBjacwZSAGwndlGz9+1y8t4XfKc7Rl08LpeRAd
         Pw7qg5zKzDkC81bHrbBnThbgCH2ehsOzKZOF1oXiLBR7BKfJTiqOph+otILqWlkUPZCH
         O3MuYz/yztgayF/bo1/VCAdVcOpCh5TDOg+o2BIuA1mbrq8lVR60pSTGabY/BubdFgLS
         VYkA==
X-Gm-Message-State: AOAM533leaa7i6UmHzCn/S5b5kp5ihaIo/kJt9AIw4Nz1RJYIJPZv2pq
        +CEogHtcUgBFX6UVPpKo9s3sz43uILeY6dRn9zwPRg==
X-Google-Smtp-Source: ABdhPJzZSaGfd/xFfmtsAFmny7WwR+Mh9Q+xBU6CnvOdzp20DNpqm62ynakHcmApJg4ZguxiE764J/Vueg5/qFsdL3w=
X-Received: by 2002:ac2:4474:0:b0:43a:7681:8fac with SMTP id
 y20-20020ac24474000000b0043a76818facmr5538482lfl.316.1645807595152; Fri, 25
 Feb 2022 08:46:35 -0800 (PST)
MIME-Version: 1.0
References: <20220120200153.1214-1-benl@squareup.com> <422bd780-354d-d4ac-7b7a-8060325fc13e@linaro.org>
In-Reply-To: <422bd780-354d-d4ac-7b7a-8060325fc13e@linaro.org>
From:   Benjamin Li <benl@squareup.com>
Date:   Fri, 25 Feb 2022 08:46:23 -0800
Message-ID: <CACOsgWZ7KFSqC21sSq7hGYk_g2RoKTPPfoYQwcWmwCNSx5c-YQ@mail.gmail.com>
Subject: Re: [PATCH v3] drivers: thermal: tsens: respect thermal_device_mode
 in threshold irq reporting
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zac Crosby <zac@squareup.com>, Andy Gross <agross@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 25, 2022 at 6:02 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> > Some drivers that support thermal zone disabling implement a set_mode
> > operation and simply disable the sensor or the relevant IRQ(s), so they
> > actually don't log anything when zones are disabled. These drivers are
> > imx_thermal.c, intel_quark_dts_thermal.c, and int3400_thermal.c.
> >
> > For tsens.c, implementing a change_mode would require migrating the dri=
ver
> > from devm_thermal_zone_of_sensor_register to thermal_zone_device_regist=
er
> > (or updating thermal_of.c to add a change_mode operation in thermal_zon=
e_
> > of_device_ops).
> >
> > stm_thermal.c seems to use this patch's model of not disabling IRQs whe=
n
> > the zone is disabled (they still perform the thermal_zone_device_update
> > upon IRQ, but return -EAGAIN from their get_temp).
>
> What is the concern by changing the core code to have a correct handling
> of the disabled / enabled state in this driver ? (and by this way give
> the opportunity to other drivers to fix their code)'

It seems fine, is that the preference? Updating thermal_of.c to add a
change_mode
operation in thermal_zone_of_device_ops?

Ben

>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
