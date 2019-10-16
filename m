Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B352D87A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 06:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389684AbfJPE5d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 00:57:33 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37248 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389626AbfJPE5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 00:57:33 -0400
Received: by mail-pf1-f194.google.com with SMTP id y5so13915402pfo.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2019 21:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=FkcYsvQW9DCuO8FIIta+BX8R8j3WmMX3n+DnEou1u9g=;
        b=NoX42E5tQHVBX2OTb84UT4yoQagDGL6lXFej+SixelM0Ct41ZVJI1RMIC/j+1lUZNa
         lnxJvH2oF61wdUQigS9UL5pQrhOOINYGTmxZzVz9TYtn4wiFPvzBmWfkitgiOMtFwrd7
         z5NVofZHgl4NFe3uoZOyIcfHbz8IO2dAjIT6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=FkcYsvQW9DCuO8FIIta+BX8R8j3WmMX3n+DnEou1u9g=;
        b=d/4tnxwQV2EoDIMfo4yac+l3wbOM4FzO8NpnvT+w13/nF3LEgtyf3yFnhyrJs9g+t1
         I10sp49n3Dh/1uc/gPyA62nhtiAZ+d//ekQ/uijvhr1iuzSlBSlanGYZ49SIG3jNrzpg
         Iw3DlWFOs3zx/KUPxctBX2IZAhaXYTcL6jsmEnlfvfupUcBu7OOIXzDV4ZIDiP6LdL9/
         ujrz5y4CMtmhsGfEVYg3TdHzIeS9RdZL30FsTItwC02v3EhwJ1Shv+byLhiHxvIjmk50
         bRRsSPofxjMx2MiJX0B0LkW8j8a2aCorYnKd+17HsJ21Lk+bBRcJKRk2xMWzY/J98QZd
         k5xg==
X-Gm-Message-State: APjAAAUWWmpJyTaToe9hqIwlaQSFPKd+v5X8AuCWl91iPinCKDBML4d0
        6z9+EmKDqbTotUdKx2hMcd9Liw==
X-Google-Smtp-Source: APXvYqxpDxQimqJ2TytuIDDL1ryHC0bnU/A4itgozpPrv7HJksahoeyOtkc6JvrgH5YBZC/kupezMA==
X-Received: by 2002:a63:6a03:: with SMTP id f3mr1856640pgc.167.1571201852446;
        Tue, 15 Oct 2019 21:57:32 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k23sm25002741pgi.49.2019.10.15.21.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 21:57:31 -0700 (PDT)
Message-ID: <5da6a33b.1c69fb81.64cc.6834@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1b53ef537203e629328285b4597a09e4a586d688.1571181041.git.amit.kucheria@linaro.org>
References: <cover.1571181041.git.amit.kucheria@linaro.org> <1b53ef537203e629328285b4597a09e4a586d688.1571181041.git.amit.kucheria@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     linux-pm@vger.kernel.org
Subject: Re: [PATCH] of-thermal: Disable polling when interrupt property is found in DT
User-Agent: alot/0.8.1
Date:   Tue, 15 Oct 2019 21:57:30 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-10-15 16:13:16)
> Currently, in order to enable interrupt-only mode, one must set
> polling-delay-passive and polling-delay properties in the DT to 0,
> otherwise the thermal framework will continue to setup a periodic timers
> to monitor the thermal zones.
>=20
> Change the behaviour, so that on DT-based systems, we no longer have to
> set the properties to zero if we find an 'interrupt' property in the
> sensor.
>=20
> Following data shows the number of times
> thermal_zone_device_set_polling() is invoked with and without this
> patch. So the patch achieves the same behaviour as setting the delay
> properties to 0.
>=20
> Current behaviour (without setting delay properties to 0):
>   FUNC                              COUNT
>   thermal_zone_device_update          302
>   thermal_zone_device_set_pollin     7911

thermal_zone_device_set_polling?

>=20
> Current behaviour (with delay properties set to 0):
>   FUNC                              COUNT
>   thermal_zone_device_update            3
>   thermal_zone_device_set_pollin        6
>=20
> With this patch (without setting delay properties to 0):
>   FUNC                              COUNT
>   thermal_zone_device_update            3
>   thermal_zone_device_set_pollin        6
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

