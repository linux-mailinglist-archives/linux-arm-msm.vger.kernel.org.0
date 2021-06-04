Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A005B39C3C1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jun 2021 01:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbhFDXOR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 19:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231811AbhFDXOQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 19:14:16 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0DBC061767
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jun 2021 16:12:16 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id x6so905264qvx.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jun 2021 16:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vXmDc2pLbpX9lgKwc2VxPAgHsvXZdqTU2+0uHS8Qm20=;
        b=Q6hzRsvkNOq2IfRMhqfR5Q6fFPfTbJEeWjktfJe4ZqJlNs/8W4nzSxfmscedh4TRYY
         R2vFGv+LhNOQoUiKRLnC5K/7WFJzqWvRgJ+lZRYkL9+EN2R4ETo5oXfZJWWUlCEq9Hni
         ob8YX8UBR5vckySVcQH/IIZIikAnt7KgBgCg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vXmDc2pLbpX9lgKwc2VxPAgHsvXZdqTU2+0uHS8Qm20=;
        b=tc2qQlTw7r4ZXo123xNS9moS7TJqsEdbJWJwh6J62q/0DzS0TA0CTQX/6eVwTZSpzE
         hSTs6EkUVoGoWT4EmhaIXGqkxaWDe5HceRGeCVo7cyIrk11PW/dGuAgKhacYrpStQo6P
         HF85doNylLvI9GsQ0cSGe+uVWWkTPY6tQo7c/Y/Z0KVQ4rEpazHiP5GXDCuk2n/kZsfc
         1Mbx/kT7Y4wWYAafIcf0XbFBqMuCx0FSKOuwqjCPGBeubPfPNL+nH3GlqDEYFPcp5zSw
         R7/XyC9evmcrV8DpgaPbkE5V7B6bRe/wmOkYW2dXz7O7QLXFP+V+JzM/rtDrTpeWcpJA
         vaYA==
X-Gm-Message-State: AOAM530Rfz56FymPe6Euz6N7J4zDGohSXkcpZOwjLkYBY6wkUllVmXzM
        WDOdOLxWpqH8iZGNZs+gGX32c3RCtUwIrA==
X-Google-Smtp-Source: ABdhPJwopWnDcSIGC2ch98Y50fGyFxb04h5D5bsJn7UygmUDmsyZvvGbFvNwmrgPB2CMXHGHBk74oA==
X-Received: by 2002:a05:6214:1551:: with SMTP id t17mr7001180qvw.50.1622848330851;
        Fri, 04 Jun 2021 16:12:10 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id q13sm4981804qkn.10.2021.06.04.16.12.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 16:12:10 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id b13so15886497ybk.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jun 2021 16:12:10 -0700 (PDT)
X-Received: by 2002:a25:8082:: with SMTP id n2mr8366030ybk.79.1622848329667;
 Fri, 04 Jun 2021 16:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210603081215.v2.1.Id4510e9e4baaa3f6c9fdd5cdf4d8606e63c262e3@changeid>
In-Reply-To: <20210603081215.v2.1.Id4510e9e4baaa3f6c9fdd5cdf4d8606e63c262e3@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 4 Jun 2021 16:11:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V9tczBEnT6zZq1UA=E1x8jyBoiEAt6yJv5R7j-mpOczg@mail.gmail.com>
Message-ID: <CAD=FV=V9tczBEnT6zZq1UA=E1x8jyBoiEAt6yJv5R7j-mpOczg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: pm6150: Add thermal zone for PMIC
 on-die temperature
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 3, 2021 at 8:12 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add a thermal zone for the pm6150 on-die temperature. The system should
> try to shut down orderly when the temperature reaches the critical trip
> point at 115=C2=B0C, otherwise the PMIC will perform a HW power off at 14=
5=C2=B0C.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v2:
> - remove 'pm6150-' prefix from critical trip point
> - updated commit message
>
>  arch/arm64/boot/dts/qcom/pm6150.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
