Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD603D0879
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 07:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbhGUFFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 01:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233372AbhGUFFS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 01:05:18 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD48C0613DE
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:45:54 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so1075514otl.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=dNfcxQisjjJv5eOHz1IDkcy0UHigEE+DFspSgTRkRS0=;
        b=TmXoRy3h4S4nFy3pzooJOmvDq4Nlw9Mwyudp8nErttrXML7dj1of1i8ptfUEpePAQT
         n0d3VZwXzyngirIwAIGbg5mZjQtO+FgvZQUN0xjrx954BhzuklPhnurxjZmfa1Lv6MD1
         Kk57AEJ0JCSnu5rG3QYABH7B3tYUJj2rHBISw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=dNfcxQisjjJv5eOHz1IDkcy0UHigEE+DFspSgTRkRS0=;
        b=sWM9SUaDhUXsVIikgpnBP8AnL9y6+L+OptABWema0X5kHj5hYTWuBZIS1Tk+sEt5uO
         SzONAaH3OQrPe+uuvBMM3kmU7gFvJlMYVYkB3zHM8KCn/hlkURNhFT8iXJya4EoKoCVm
         i96G6GwQJSHr3KrB96TcaaFoWe8Zi4c8+agxdHYF5AluTIXyriD/vyVDSPlSIrVE5CkW
         b4WJK3BgR8ToR9AXY43j0UzWBPvH04jia7in/S6o2Vr350NUo/DSQpAY5OcCUlxfPMQd
         Jm7c8T/S2JKY151Rmryis26sandm641/kyrBRUtSiGCCZSTYNxgzf/RwCewt3WJJkGIP
         kXyg==
X-Gm-Message-State: AOAM5316Lk1jIZ/MCH/ODNswusmMz3WoZPWKoOO8tQWP1ObzPfL7LfbU
        Gth6wyGBOpHKqQVZQJccx8/Zj45mtoVPuONk1IHccA==
X-Google-Smtp-Source: ABdhPJwZnht3Kr2prR9o7Uwl1hUh3Rla9OGuKEOgfIbY2MFf609ZjI1kLJEbk8naHTyMzMVjSRkQgRiOyGVRCVR2GXo=
X-Received: by 2002:a9d:1b6e:: with SMTP id l101mr10056846otl.34.1626846354073;
 Tue, 20 Jul 2021 22:45:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:45:53 +0000
MIME-Version: 1.0
In-Reply-To: <1626775980-28637-10-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org> <1626775980-28637-10-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:45:53 +0000
Message-ID: <CAE-0n528hftzM-JTv57k9P+Ac3M9Ug0PosFiCquzMQ=jNZ0H5Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] arm64: dts: qcom: sc7280: Add Q6V5 MSS node
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-07-20 03:12:59)
> This patch adds Q6V5 MSS PAS remoteproc node for SC7280 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
