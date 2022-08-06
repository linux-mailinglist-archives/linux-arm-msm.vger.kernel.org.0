Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2D8858B40E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Aug 2022 08:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241691AbiHFG1J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Aug 2022 02:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiHFG1H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Aug 2022 02:27:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A4F13F08
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Aug 2022 23:27:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4AE49B80159
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Aug 2022 06:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7359C43143
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Aug 2022 06:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659767218;
        bh=tdSQkdYyeQu2cNOaRFHtoh04jOL8Bg/ji7wzXxG7lgs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FnB+ligvchV64camigOScyWCWVuMZcJxS9TMhKpURDvxJuD15TqWNAxHVXTLu2xkL
         moKhYMmO55rw4LUyJzidVQJHannvd17EuYNPjPSwgawtkhHUQDMA4M2xEHU3onX6L6
         YEQTqZBfABNsGDwzFZ4/7FrlCUs9f3rMQ0nd4ZtaLOaBjxmBr1k86hKwgBxrie9p2d
         JOslacRJ5NusQN3YitDiqF9suoO4wLR9c+RE7C7DyoKKMs768wFP8FtTyseEX0WLbl
         i5SNLKf+zOBQnlHor1l4oVyR5mT+SzEJwiWKWveLAQReJ05ShSzuVkHJ9JLBZu9Fe9
         yuJVPSBJh4BCw==
Received: by mail-lj1-f169.google.com with SMTP id s9so5033619ljs.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Aug 2022 23:26:58 -0700 (PDT)
X-Gm-Message-State: ACgBeo0WJg3Zg8Xf/+B3xVeRxHcS31xDaxIcAdMJtpZa0x3Ep1UBY/Po
        Iga+DM2grZeyk0lhGYulW4gnDUGYUgExQLfbPs9rQQ==
X-Google-Smtp-Source: AA6agR4/G709MljrnqhPnqLX5KFXMgV7jfTvvwjjUkNoDxppcTzDaXDqqOrXi08SScKBPIQQz4Do0P5Hxjbk54WbPI8=
X-Received: by 2002:a2e:a916:0:b0:25e:2d78:f676 with SMTP id
 j22-20020a2ea916000000b0025e2d78f676mr2806226ljq.260.1659767216809; Fri, 05
 Aug 2022 23:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220805145729.2491611-1-daniel.lezcano@linaro.org> <20220805145729.2491611-12-daniel.lezcano@linaro.org>
In-Reply-To: <20220805145729.2491611-12-daniel.lezcano@linaro.org>
From:   Amit Kucheria <amitk@kernel.org>
Date:   Sat, 6 Aug 2022 11:56:45 +0530
X-Gmail-Original-Message-ID: <CAHLCerPoqGvuDy2LKsSEd681qwQd=doUN3m-6m6encuxEudu7g@mail.gmail.com>
Message-ID: <CAHLCerPoqGvuDy2LKsSEd681qwQd=doUN3m-6m6encuxEudu7g@mail.gmail.com>
Subject: Re: [PATCH v1 11/26] thermal/drivers/qcom: Use generic
 thermal_zone_get_trip() function
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 5, 2022 at 8:28 PM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> The thermal framework gives the possibility to register the trip
> points with the thermal zone. When that is done, no get_trip_* ops are
> needed and they can be removed.
>
> Convert ops content logic into generic trip points and register them with the
> thermal zone.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Amit Kucheria <amitk@kernel.org>

> ---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 39 +++++++++------------
>  1 file changed, 17 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> index be785ab37e53..127e8c90211c 100644
> --- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> +++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> @@ -263,17 +263,17 @@ static int qpnp_tm_update_critical_trip_temp(struct qpnp_tm_chip *chip,
>         return qpnp_tm_write(chip, QPNP_TM_REG_SHUTDOWN_CTRL1, reg);
>  }
>
> -static int qpnp_tm_set_trip_temp(struct thermal_zone_device *tz, int trip, int temp)
> +static int qpnp_tm_set_trip_temp(struct thermal_zone_device *tz, int trip_id, int temp)
>  {
>         struct qpnp_tm_chip *chip = tz->devdata;
> -       const struct thermal_trip *trip_points;
> +       struct thermal_trip trip;
>         int ret;
>
> -       trip_points = of_thermal_get_trip_points(chip->tz_dev);
> -       if (!trip_points)
> -               return -EINVAL;
> +       ret = thermal_zone_get_trip(chip->tz_dev, trip_id, &trip);
> +       if (ret)
> +               return ret;
>
> -       if (trip_points[trip].type != THERMAL_TRIP_CRITICAL)
> +       if (trip.type != THERMAL_TRIP_CRITICAL)
>                 return 0;
>
>         mutex_lock(&chip->lock);
> @@ -299,22 +299,17 @@ static irqreturn_t qpnp_tm_isr(int irq, void *data)
>
>  static int qpnp_tm_get_critical_trip_temp(struct qpnp_tm_chip *chip)
>  {
> -       int ntrips;
> -       const struct thermal_trip *trips;
> -       int i;
> -
> -       ntrips = of_thermal_get_ntrips(chip->tz_dev);
> -       if (ntrips <= 0)
> -               return THERMAL_TEMP_INVALID;
> -
> -       trips = of_thermal_get_trip_points(chip->tz_dev);
> -       if (!trips)
> -               return THERMAL_TEMP_INVALID;
> -
> -       for (i = 0; i < ntrips; i++) {
> -               if (of_thermal_is_trip_valid(chip->tz_dev, i) &&
> -                   trips[i].type == THERMAL_TRIP_CRITICAL)
> -                       return trips[i].temperature;
> +       struct thermal_trip trip;
> +       int i, ret;
> +
> +       for (i = 0; i < thermal_zone_get_num_trips(chip->tz_dev); i++) {
> +
> +               ret = thermal_zone_get_trip(chip->tz_dev, i, &trip);
> +               if (ret)
> +                       continue;
> +
> +               if (trip.type == THERMAL_TRIP_CRITICAL)
> +                       return trip.temperature;
>         }
>
>         return THERMAL_TEMP_INVALID;
> --
> 2.25.1
>
