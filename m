Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 160EB9F758
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 02:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfH1AcY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 20:32:24 -0400
Received: from mail-pl1-f180.google.com ([209.85.214.180]:44291 "EHLO
        mail-pl1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfH1AcY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 20:32:24 -0400
Received: by mail-pl1-f180.google.com with SMTP id t14so334989plr.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2019 17:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=rRH/oTtD3I8IIyF+9ud7/7W7Zdl189HtmJUsrlGsRtc=;
        b=iTFhK8ta3SUOBZEzLh0hSBhpRav6zxEilbiZQBtkE3bi9j5CcgtM+UA1NEDLyZxlM/
         izAbHfrXvgyUHqIs2PkHmmv4qvC5s1mQ+n52vmb5YHSOhFmqgomb+HUMBbJhSL2cDZQ3
         OeLyPNDMIEdjfCCP5aV9f+kuUXuzaWppq04fQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=rRH/oTtD3I8IIyF+9ud7/7W7Zdl189HtmJUsrlGsRtc=;
        b=pqswVAWe1e5WN4ZCyVlKEcJczpcEJjlY7zhhqceSvqkcEGL4bavLOrCDRlsMAiIoLA
         oY9hnSbzp9ectWBKDW1hALbL+PmKpozQG+9Yj41c/kpfNCPZkWECh1P3Y/v2sO+Ta605
         MuA80JOfRCeJYtiAEXKRAn61SzyQuxxSmR5yC7TH+larnRAv/hIeyJdm4kUYEijJI9Gw
         7bTAUH0YLT5hbA+84WxVqZIYXYDHNklTcxYMVfiERJAvRtHPuY36A+USZx5/+CJREmcb
         WPFM14bi0IjeUSNhsMwDjbdBerBXl2X0O7C2AlWnBYtJOTNdr0i4vjFhdflmLm0VUUg3
         G3NQ==
X-Gm-Message-State: APjAAAUr/ohHTJj2pQMDcx0JuvtlcKQFMnVXjyaRvdQ96sL4UYAaxe5P
        eJGIhdSUXN2ep4E1sTU/QI5dlQ==
X-Google-Smtp-Source: APXvYqwTf7ms/JWpe3OBFYi+xb8boCkEOe4dk+DzF8IONxKvMPJqjevptKlFAAuwbZm4fRRbUdagsA==
X-Received: by 2002:a17:902:6f10:: with SMTP id w16mr1535055plk.143.1566952343304;
        Tue, 27 Aug 2019 17:32:23 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b14sm504174pfo.15.2019.08.27.17.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 17:32:22 -0700 (PDT)
Message-ID: <5d65cb96.1c69fb81.2e8ad.2450@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5b26d4410b50387fcacae939d97f9f75853e69ea.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org> <5b26d4410b50387fcacae939d97f9f75853e69ea.1566907161.git.amit.kucheria@linaro.org>
Cc:     devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/15] arm: dts: msm8974: thermal: Add thermal zones for each sensor
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        marc.w.gonzalez@free.fr, masneyb@onstation.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 27 Aug 2019 17:32:21 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-08-27 05:14:01)
> msm8974 has 11 sensors connected to a single TSENS IP. Define a thermal
> zone for each of those sensors to expose the temperature of each zone.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Tested-by: Brian Masney <masneyb@onstation.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

