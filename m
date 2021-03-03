Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2717332C17E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389355AbhCCVhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238076AbhCCIPH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 03:15:07 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04CCC0617A9
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 00:14:25 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id t29so15709546pfg.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 00:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=P1dtltEjETKu3sTEniyo9zPnCTLC+x4yGC+jPDmiEdE=;
        b=DFjBbYW4i7nCNY+8nO3JLdXqK6DlITs2S/fUluYL7jQmvOks/+LOnBODIJkfkcbrr3
         WQ/a9PQ72NTSPxepkYLKTr7fwq61U1oCn9Gq9Dd/KfASm/mJc9Rmw2JQzDL234Q9TQP1
         tmUSLG/OQQXqYjZ58xZTB9603sXSqWsQy0rqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=P1dtltEjETKu3sTEniyo9zPnCTLC+x4yGC+jPDmiEdE=;
        b=GsLMBVvA7brmCLAhkhZty3zXUj8Wl6RJMjvD+9vKm7mmqZIAqSShvmdI16aaEip1tG
         XlmP7EN0YlZzM23g7uwxPSft8NhU9jipBv0HlKhTQcJbq51AYPg4CEjxFbjpvi410fCP
         eMrwiRwj6bsxBFYeGxEGqnmR5J898jRKqrq5nP4+hFfKEegzL8goUtiKdZwjhYkpc8ky
         hKqjFNA7nZE5IP1BEkPqXA24OWCcRLTprlNasB/wlTwRAoiQxG59BCD3X2un2/EcQm9/
         SRMGssk9joSyT8q0fjXc6AhHPlTgSDv3eOc5Rx4H51RDzYoUpITeMu9lpnXcZfLEdrR6
         5peQ==
X-Gm-Message-State: AOAM5326i17SaAp14c3uLUWEQpL5th7bPbZrjs+va9TelqMmUgkUljw8
        PlVWk81SuhJJHwob/Qs0FwvQVw==
X-Google-Smtp-Source: ABdhPJxNhzZMc6gB6O8kxv/u+g9OfQs7Cdr1qTVz0+CIRmAneXjymSzwnIP3u80l2INlse/RgyrUJg==
X-Received: by 2002:aa7:87d5:0:b029:1ed:b85b:1420 with SMTP id i21-20020aa787d50000b02901edb85b1420mr2004823pfo.17.1614759265611;
        Wed, 03 Mar 2021 00:14:25 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:2510:ab07:78a:7d78])
        by smtp.gmail.com with ESMTPSA id r31sm16414439pgm.11.2021.03.03.00.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 00:14:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210301133318.v2.3.Iddf6dc8102aa4fbc3847936226fc7bf2e2cd315c@changeid>
References: <20210301213437.4165775-1-dianders@chromium.org> <20210301133318.v2.3.Iddf6dc8102aa4fbc3847936226fc7bf2e2cd315c@changeid>
Subject: Re: [PATCH v2 03/13] arm64: dts: qcom: Prep sc7180-trogdor trackpad IRQ for new boards
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Wed, 03 Mar 2021 00:14:23 -0800
Message-ID: <161475926359.1478170.7064077548869689969@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-03-01 13:34:27)
> The trackpad interrupt got renamed and also moved to a new GPIO on
> newer boards.  Let's do the move in the "trogdor.dtsi" file and then
> undo it in the two old boards.
>=20
> NOTE: since none of the new boards have device trees yet, this change
> looks silly on its own but it will make sense after more boards are
> supported.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
