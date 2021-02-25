Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C5E3259BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 23:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhBYWk0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 17:40:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbhBYWkZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 17:40:25 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D27C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:39:45 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id ba1so4040593plb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=MFcjE/WeEn+IVJZnnDEHAQYjU7Vfx+Vn0PTYrMBIKFU=;
        b=KqNSfj9xZCGyrV6LQ6aapAMGI4R5TQKWo617kctqQSCQtQjGB7YF1L26d0NXIEoGlS
         6CM3RbUej77nIuoorMYvIIsuYiXg5r6OX1Mwi6Q64yDJRJ1SsnAIsn4kovpKa5EDYGZV
         nILAg9UOCgPwf8+38FfgPvdO6q9SVYilECZ5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=MFcjE/WeEn+IVJZnnDEHAQYjU7Vfx+Vn0PTYrMBIKFU=;
        b=e1AA9qxBqIeeSSAFmS13ycC57WuYWXNt+6KcVg7sTTeqpS/0ZXtmufknMYg0nFdz3o
         XsddExsxkYYRqhxv6bBmHTFrqzlAhHBb5OuPW5uR9pvVQLxM32zGab0SnHopCBhfYXKh
         e+vI45qWV/7MdZg44kyLe4zHj07Q1c2nTk0uF5nwxl/6uFr322/btxgb+XdgRzxTlunI
         wt6DfejfxLRNjAOhygaAq02nYwvm3TZC8JC6cvoX3FUCt29u+3jrHLo2HBjLcfAuoeGm
         qdIATc+KhxcPGcGXAqnOcjoykUmshT77fQwhyoKMVnCH+bEiF3G8lrcGe3VO35NP9CIm
         gDlQ==
X-Gm-Message-State: AOAM533m8FkITCX0VKdLWdpep8C1ZwS7ON76zM1Ee4LwGNhCJzSfzCy4
        3bSWFpv3oNr59F+A5JNmoPfsCQ==
X-Google-Smtp-Source: ABdhPJwfIEceIF0MkV8wu2chf+y8M9QK7pX8fvuYLa9p1J/EOAR66cE8x9qiLnLJ2TxHL/Jfkotevw==
X-Received: by 2002:a17:902:bf01:b029:e4:3287:f8da with SMTP id bi1-20020a170902bf01b02900e43287f8damr26558plb.45.1614292785077;
        Thu, 25 Feb 2021 14:39:45 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:b942:93a8:e68d:5a90])
        by smtp.gmail.com with ESMTPSA id z22sm7435586pfa.41.2021.02.25.14.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 14:39:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210225103330.v2.3.Ife7768b6b4765026c9d233ad4982da0e365ddbca@changeid>
References: <20210225103330.v2.1.I6a426324db3d98d6cfae8adf2598831bb30bba74@changeid> <20210225103330.v2.3.Ife7768b6b4765026c9d233ad4982da0e365ddbca@changeid>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sc7180: trogdor: Fix trip point config of charger thermal zone
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Antony Wang <antony_wang@compal.corp-partner.google.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Date:   Thu, 25 Feb 2021 14:39:43 -0800
Message-ID: <161429278310.1254594.15181773052326295788@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2021-02-25 10:33:36)
> The trip point configuration of the charger thermal zone for trogdor
> is missing a node for the critical trip point. Add the missing node.
>=20
> Fixes: bb06eb3607e9 ("arm64: qcom: sc7180: trogdor: Add ADC nodes and the=
rmal zone for charger thermistor")
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
