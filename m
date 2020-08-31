Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F3F257E60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 18:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbgHaQNe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 12:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728480AbgHaQNd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 12:13:33 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E31C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 09:13:32 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id c142so818794pfb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 09:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=DPsKPkRZdj0QfxutDV1QdnavKCp9hvJJWynG/wUt6L4=;
        b=Dck3VUnvDXqnl+Nbu7vCDnUP9XYeHBCghXuLlQcxy8L6VKJ9f13fJPy3T592c9qvJD
         QDWcCJnvBrW5Fp/QxAG/W2J8Ak1Z3Dbir7Onc/YdkNGKc/4FD0hYDDCRo5cVmbdTd3Fj
         7BYivocNJe4YyF+rRWbam4mR2KfCP1k/d+Xe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=DPsKPkRZdj0QfxutDV1QdnavKCp9hvJJWynG/wUt6L4=;
        b=QObAooucbmdO7e8Dr4/fWHCNBMBrUU0g/svMWMnDHTGeiMP70Q40Y6yWNvoyAnEhtm
         XJ/9evAAeqWgdyztqbDKCXujzTuaYqGUo5lmY18QWodIQ5UjjXFsITK8pzI8RwnNSVYa
         s/XKDwQo0vd5EnOhhTxG3KOz8OE4WlKkh6Zgpk0hlGVpIykhszsDtHPVqWuchvAY4yCh
         Js9lMmUznap1T9XiYymQ3A5pasSmtJOxGxWgSw9Zj5jRWg48q9ncWXCpR1YYrIEsaEpi
         1kCK6H6ogFQDZ8bOnD0tTdYaTOzs10cm3C75gxM/MMB1XiPnrEoTaVGEhjjlWgIZNAJv
         7MMg==
X-Gm-Message-State: AOAM5306Ljgmut41spDHP25suCS22kyKEYmobMs6elN42mbq5RdjJifu
        KKhoxsZyzOOSbhW6H3Qup9YeRg==
X-Google-Smtp-Source: ABdhPJxpQZ2iz06p/l4IF43RUcY6RWJdBwvpP7KRctE0a470oxhKhAU7DhQttXJRk6tj1ZWIvkAl5w==
X-Received: by 2002:a65:5307:: with SMTP id m7mr1737861pgq.346.1598890411403;
        Mon, 31 Aug 2020 09:13:31 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id e18sm7671505pgr.53.2020.08.31.09.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 09:13:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200828204052.2085508-1-robdclark@gmail.com>
References: <20200828204052.2085508-1-robdclark@gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7180-trogdor: add initial trogdor and lazor dt
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Atul Dhudase <adhudase@codeaurora.org>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Alexandru Stan <amstan@chromium.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org
Date:   Mon, 31 Aug 2020 09:13:29 -0700
Message-ID: <159889040938.334488.7958670523619274788@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2020-08-28 13:40:50)
> From: Rob Clark <robdclark@chromium.org>
>=20
> This is essentialy a squash of a bunch of history of trogdor and lazor
> dt updates from the chromium kernel tree.
>=20
> I don't claim any credit other than wanting to more easily boot upstream
> kernel on these devices.
>=20
> I've tried to add cc tags for all the original authors.
>=20
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Atul Dhudase <adhudase@codeaurora.org>
> Cc: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> Cc: Ajit Pandey <ajitp@codeaurora.org>
> Cc: Alexandru Stan <amstan@chromium.org>
> Cc: Sujit Kautkar <sujitka@chromium.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
