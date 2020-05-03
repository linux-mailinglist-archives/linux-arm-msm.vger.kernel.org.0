Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B12501C2AA6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2020 09:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbgECHx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 May 2020 03:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727799AbgECHx7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 May 2020 03:53:59 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FEDCC061A0C
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 May 2020 00:53:59 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 18so3957494pfx.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2020 00:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=lqjnPYXn32XDo0uwwbeceHVvngW84dUENikJcKKBwN8=;
        b=MX/rAT1krwugoSlkOJy58eX7DRDLePH+rS7wFPUOwLlifDlqi8IS+F0L8nX9/Otiv3
         QBlTaKbtTMTJdYlK+uwvG2oJqGNZTl0bHJm54XLZnZN6ZbMneyBdnrWLAvoaLjK2uXrT
         8PrwH7of8SHNemxoNxWHf4PXv6ZffOFZCd0NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=lqjnPYXn32XDo0uwwbeceHVvngW84dUENikJcKKBwN8=;
        b=oeSoQBtwq7eCg6JCqkRq68rGJsGhSnAI7hKXe430gVa7IaM1WAzr3gITO74cJnNCag
         dY8SGRV2Ff/xR7VFXk44RCR/6u1xPiyX+mJb6bGnqYfBUHLMP0N3375vXAuL8pjjRY+/
         qmUwirFXorA06fmXOVwMcI/POVY9/8o0EpQ5R24P9ObzIvsnDgUOZVHw95+p+l/Jix3c
         Dl9DOEBHrJLtk86hMp9aWgLyHtNc9Q/aONfhw5ZJfEWW0OFzwiegPa9y70+eohMZF1Ht
         +O0cY4taOusq36QoYwPXkDJu9XuD1t9x5uEjvaRdR3oAkpNVYVN7OYZ+98KaatGw7gue
         wNQg==
X-Gm-Message-State: AGi0PuapuMgCZgl/3D53Q9XIo6NYDg11yiQqbUN+qMdOY/heMcpicfOj
        H66WhvWo+4eytVICqu1kPG0JXA==
X-Google-Smtp-Source: APiQypKuQsStdUvfPGRsK8okPUJ9KuVy7WCe8oITb3Qnf5Usr7WIzv1W2pNeujbXzvH3hQ8jASco9g==
X-Received: by 2002:a63:1608:: with SMTP id w8mr4704729pgl.232.1588492438795;
        Sun, 03 May 2020 00:53:58 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k6sm3677501pju.44.2020.05.03.00.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 00:53:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200424085121.1.I9d1e84d30f488cdb5a957f582abaecd2c0b24d70@changeid>
References: <20200424085121.1.I9d1e84d30f488cdb5a957f582abaecd2c0b24d70@changeid>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add "no-map" to cmd_db reserved area
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>, mka@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Sun, 03 May 2020 00:53:57 -0700
Message-ID: <158849243728.11125.2420286390909147729@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-24 08:51:29)
> The example in the bindings and all the current users (except sc7180)
> have "no-map".  I'm pretty sure we need it on sc7180 too.  Add it.
>=20
> Fixes: e0abc5eb526e ("arm64: dts: qcom: sc7180: Add cmd_db reserved area")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
