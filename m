Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6A6CC4B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 23:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730598AbfJDVRA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 17:17:00 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40251 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfJDVRA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 17:17:00 -0400
Received: by mail-lj1-f194.google.com with SMTP id 7so7863308ljw.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2019 14:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mitmi3lOMqSpYTCDDP4OehKdhas886p4UDP9S7yQMAs=;
        b=lK2gFZ1qa+irwSUDd4m5G0GGGVDwSqXGEGwE9XSPDVK9mkW5D5pX8lir0ilN0Wl9Ww
         tTa7IohtNwD7QWPSsI/kieHPMvZNDLQLySmZ5WTBTPlHo6cge7H4hKRpXAqZToukjHwK
         BvIDHYzaLPxqn3yqyv5w7FTZbCI3FkhQkHXHGtdDlYffqKNKqCEbjeL6QEPfHYaAWiZ5
         1DUmkNepBkT1xVg9q4MWBde5ANLw1r5w/FuUm09/5z9MkdeGleQ0APAeNcWqoDXK454w
         QE9A9NA8qgdzVNbZirmmQuKsoTvhBWF8vkHdLqs2BIUh6rxxErtCPe1p7KM9FvB/oO4H
         0G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mitmi3lOMqSpYTCDDP4OehKdhas886p4UDP9S7yQMAs=;
        b=BKvrVpqygbDI/aSve5T1hBpjWK7bFYvP03bMz9Ydb1aaDS+LQFQ8rwM4HPhBAp48zL
         bGGsys4pHuQnrq1qT6ywea+kcMlKO4GDt876gPgd33e0K9JXi6hBm8FvpWMmlXHXuTgj
         c8/r4zjQnHnqr5BuARLhtp9MWwgyaxJaMWK7CvTGuaQtpBXLUX+qBenD+w9+S28Hcj3Q
         1vI2uvGcOPBxdU3gJ3ChbCXdcVk8Wl4jjLMNHy4cRsh6W6fDYbzgpX/D2Qnsh209oMCb
         SefgMUvPTtxOyvH/F5Mck9Syb5YV44Vlu6+tDPsFM497W6S31lpF8sBw8FHxVxW+KFvy
         cJuQ==
X-Gm-Message-State: APjAAAXvQTqNnxzRGI4FwatMGkZuzbgJ2dVze5PpPDcs2X6jthwsUx64
        q+clb69Cy7m7rFQzR5DiakgYtxRX+pT/lELjQ76nfQ==
X-Google-Smtp-Source: APXvYqyvx1ZJVx3BdlEwVPKWVbrlnWhYW68EF/q5bhSKJMO+egyDnB8hTFcsfD4uKHWflQL5bAmuc673rey06t4k4d8=
X-Received: by 2002:a2e:80d3:: with SMTP id r19mr10497466ljg.41.1570223818492;
 Fri, 04 Oct 2019 14:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190921101207.65042-1-kholk11@gmail.com> <20190921101207.65042-2-kholk11@gmail.com>
In-Reply-To: <20190921101207.65042-2-kholk11@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:16:46 +0200
Message-ID: <CACRpkdZH9VxYHh5c7r405nKHo8vq8PWZZnncP4yzTyJe_Zvnng@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: qcom: Add a pinctrl driver for MSM8976 and 8956
To:     kholk11@gmail.com
Cc:     MSM <linux-arm-msm@vger.kernel.org>, marijns95@gmail.com,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Angelo!

Thanks for your patch!

On Sat, Sep 21, 2019 at 12:12 PM <kholk11@gmail.com> wrote:

> From: "Angelo G. Del Regno" <kholk11@gmail.com>
>
> Add the pinctrl driver to support pin configuration with the
> pinctrl framework on MSM8976, MSM8956, APQ8056, APQ8076.
>
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>

This changes device tree bindings so you need to Cc devicetree@vger.kernel.org.

Usually they want the device tree changes in a separate patch.

It'd be great if I can apply the pinctrl patches separately from the rest of
the series.

Also I need Bjorn's review on it first.

Yours,
Linus Walleij
