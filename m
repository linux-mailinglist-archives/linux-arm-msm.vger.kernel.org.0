Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDD97FE560
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 20:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfKOTDt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 14:03:49 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:43878 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbfKOTDt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 14:03:49 -0500
Received: by mail-pj1-f66.google.com with SMTP id a10so124164pju.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 11:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=CItPl+9P9+Q2TvkS0KNj7T6lUO5RrCBXTMq+P1IrozI=;
        b=fTUOjzz0c+MpugZS8j11LWtRYO++p/2pPTdRTsUUXFw6cddxeRnTwMHEJvk3uKCn43
         qjrFM8hAF5rmwUuQL1GEUmb1Tx50Gwdk417B6MwR/hC7t84z8MjQUdHSzziuOxnEVvxA
         4uPhJHQxobJ4qEyTHhMwXugB0zYcCcZab7I90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=CItPl+9P9+Q2TvkS0KNj7T6lUO5RrCBXTMq+P1IrozI=;
        b=YqVdtQYzeNNKzz5xiY59mV26di6Dv3cFXAfN8NMi7d1BZFEYnzmQFKLzoB96A7oKQb
         YwcC7EN896SvOkXT4YbCYrSf4HCoF2wgVXFNkGDepr5gkAQ4A3V+r2lL1aMfVuXMpf42
         xBcMwsN45mD/dmi0VWYkiGHKxdZajqRhq26wpj18LEwC6fvBr14VVeDPQC+8W6VQccHF
         J29Utt0EkvcK8jh1iDzrJgdNGKoEJ0SlTp7e6FItI5Yw9DMawE2ck5JOeXPMelGsQHbB
         G7ICI7epwmusNz71i2dio32KhR1xEdQi4qW0w4RDkWBHOWsfGcg1/pKZmVUIa7g9kw+b
         8ODg==
X-Gm-Message-State: APjAAAXRmai2xwM2oRRznNnH1g6nC75WP6O9qHVS9jXakq8TFRqZ//PC
        OcQ9V6Iv4Duwyrty2SIawHC1sA==
X-Google-Smtp-Source: APXvYqxLRZS01cyzrRirbFraHJFYIChiF+BHqALpfMTIDItddpzmzytlLjElRT+Q7jKHqbXMOW+/nw==
X-Received: by 2002:a17:902:d88a:: with SMTP id b10mr16505414plz.302.1573844628633;
        Fri, 15 Nov 2019 11:03:48 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z7sm10567669pgk.10.2019.11.15.11.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:03:48 -0800 (PST)
Message-ID: <5dcef694.1c69fb81.3b0c5.e9eb@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-6-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-6-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        devicetree@vger.kernel.org
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 05/12] of: irq: document properties for wakeup interrupt parent
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:03:47 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:14)
> Some interrupt controllers in a SoC, are always powered on and have a
> select interrupts routed to them, so that they can wakeup the SoC from
> suspend. Add wakeup-parent DT property to refer to these interrupt
> controllers.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

