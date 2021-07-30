Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881243DC101
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jul 2021 00:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233072AbhG3WUz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 18:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbhG3WUz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 18:20:55 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E37AC0613C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 15:20:49 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id cg4so960635qvb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 15:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X/ut0W8QWQzgc3+TFp0Zpab3f8ktnZebi671B/GRa1s=;
        b=MyagQMiCCsM3Rrn6I1WUv92/Bb4Hoxpt54pGqOpfWtDctdM1tQkL6ciLcbY6UdDKg+
         CHPIMI68YD94tESmrEfcGANjj5Cl0XwRrXRcwNL9k1ZbXaHmbVZH7THGiL7zV/RxUQ1c
         g511pq+mPaWbOHjDMSUZoOWqY8Uja0Hq1ANig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X/ut0W8QWQzgc3+TFp0Zpab3f8ktnZebi671B/GRa1s=;
        b=tYbYKkH6yaiiyawAZyEctqZ4D22PMTAXjKWlGvG1SbelUif0K8/5B2QSWZv8e/4d/B
         2IrY70P7acmjpnqDJ4I+KS7/AON3jeo5dGVfZ7rP5VftGX6ttH2c6XrN82nOtA2LYhRN
         6IQKNPWL/ulsD6wDLc4ic+P/To5uacUv+e6nk+kVs36jXOkU+PwM7MI1VIa5tY6qX3qS
         Ec8l4+XrGgTZzm8zFrDgtUOQabqqjN0WGPwGhl5cN9I0dlUHAmPjoTCYfcXWTgrvmT9V
         CooYY5eyDK1+4d86k7lxFfKnZA/DacZ8XcpE9tDXbwRr6kua17MSspgUmyj/eHjHJPen
         Q0zQ==
X-Gm-Message-State: AOAM530Kc/CSmE49z5Int+SQsNzmTZ0HLVT8j+5yia4XWav0u7VKYhUM
        5VE+ZeUGcEU8t0TjvI4asJltqjMmI6KlIw==
X-Google-Smtp-Source: ABdhPJz4HGsNYEcqjn0YPYkWG6X2QP1qUPuiTTuIDQJ/+BtikVkyevV//3Nk7/AfB7B47Smu4KrOqA==
X-Received: by 2002:a0c:9a03:: with SMTP id p3mr5244612qvd.40.1627683648139;
        Fri, 30 Jul 2021 15:20:48 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id n188sm1649439qke.54.2021.07.30.15.20.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 15:20:46 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id a201so1953913ybg.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 15:20:46 -0700 (PDT)
X-Received: by 2002:a25:2904:: with SMTP id p4mr6090679ybp.276.1627683645881;
 Fri, 30 Jul 2021 15:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <1620807083-5451-1-git-send-email-sibis@codeaurora.org> <1620807083-5451-3-git-send-email-sibis@codeaurora.org>
In-Reply-To: <1620807083-5451-3-git-send-email-sibis@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 30 Jul 2021 15:20:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VfvW1PqJiR7Lh5RNyR6EQ1E8JK0N+KqJiB8DK49oUZ4A@mail.gmail.com>
Message-ID: <CAD=FV=VfvW1PqJiR7Lh5RNyR6EQ1E8JK0N+KqJiB8DK49oUZ4A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sc7280: Add cpu OPP tables
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 12, 2021 at 1:11 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add OPP tables required to scale DDR/L3 per freq-domain on SC7280 SoCs.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>
> V3:
>  * Rename cpu opp table nodes [Matthias]
>  * Rename opp phandles [Doug]
>
> Depends on the following patch series:
> L3 Provider Support: https://lore.kernel.org/lkml/1618556290-28303-1-git-send-email-okukatla@codeaurora.org/
> CPUfreq Support: https://lore.kernel.org/lkml/1618020280-5470-2-git-send-email-tdas@codeaurora.org/
> RPMH Provider Support: https://lore.kernel.org/lkml/1619517059-12109-1-git-send-email-okukatla@codeaurora.org/
>
> It also depends on L3 and cpufreq dt nodes from the ^^ series to not have
> overlapping memory regions.
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 215 +++++++++++++++++++++++++++++++++++
>  1 file changed, 215 insertions(+)

I see patch #1 in mainline now. Does that mean it's time to land patch
#2 in the Qualcomm tree now? ...or maybe it needs to be re-posted?

-Doug
