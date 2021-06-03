Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743BC39ABC0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 22:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhFCU1J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 16:27:09 -0400
Received: from mail-qt1-f176.google.com ([209.85.160.176]:36443 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbhFCU1G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 16:27:06 -0400
Received: by mail-qt1-f176.google.com with SMTP id s12so5385181qta.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 13:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K0U2vfO0s/gXz3YV0/zSFcReO1Jx7LkT5Q9OOSBMSss=;
        b=j1A98YTafAPvHjzQY+ZV3QAOa/LBVzmJgVhIbhQLSvdy7bXiODny1yOlaQlb7LWls1
         opVdTQxQBf3Q8hayY4a9lm9mPaZjJGGYSQ2H30V1xIUhm1pwHvYQ50/PtHnXUA6ijneI
         dnlEKejOa4+paYKemXhcp2qBAN9dE/b3ctD14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K0U2vfO0s/gXz3YV0/zSFcReO1Jx7LkT5Q9OOSBMSss=;
        b=oP5Dye58AMzb9uKWvC4B6v8e356mKJHUNRYwPZXzqBkk5iCyGskWuiBZUG3n2dHfyd
         qJjg1fRz52EgOKFPdWeBE8cvDMvw2i4JYd+BQeXfUK+LMJBnHFTfhQXYPXKNduIFzYAb
         64EwZI3dvN+izjcEROVT0YT+PpBnqIuuse7/kH0qOL8ozL8VwGxU9ztrbN12liWqsVHQ
         xrTu+5yPClWQ/HpymVkf4mpcAHn8m5zPoTYguSH64VSXO83We6LlxaeugZuu3Vq3JIjg
         osprygEc0cn8kWg1oMb3L6bxkSteJ8TmcvVW85b0dcRT+BLZjWb1Ahw7r1RKMNtrQh++
         9sGA==
X-Gm-Message-State: AOAM531D3WwaAMFQrXSUjUUzTjM4ii89ds+bMzfDr89cVu2qyTaokaKj
        3xUnVRs8VwexxoM44n5j2UXoOScysiyDtg==
X-Google-Smtp-Source: ABdhPJwT527RMI9p3X6mJCgsQsPjQW/CmPo1GF/y2qOvUDC6ZJTHGdqtWk6fXyDHSNGqZ6tBAmCgOA==
X-Received: by 2002:a05:622a:315:: with SMTP id q21mr1269574qtw.203.1622751845456;
        Thu, 03 Jun 2021 13:24:05 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id p17sm2574291qkg.67.2021.06.03.13.24.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 13:24:04 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id x6so10561504ybl.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 13:24:03 -0700 (PDT)
X-Received: by 2002:a25:8191:: with SMTP id p17mr361035ybk.405.1622751843264;
 Thu, 03 Jun 2021 13:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210602191338.1995827-1-sujitka@chromium.org> <20210602121313.v3.1.Ia83c80aec3b9535f01441247b6c3fb6f80b0ec7f@changeid>
In-Reply-To: <20210602121313.v3.1.Ia83c80aec3b9535f01441247b6c3fb6f80b0ec7f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Jun 2021 13:23:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vfi6SZsgJN3Jm+DrmW8KrySbn14BMOWQjW9ib-fqZd8Q@mail.gmail.com>
Message-ID: <CAD=FV=Vfi6SZsgJN3Jm+DrmW8KrySbn14BMOWQjW9ib-fqZd8Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sc7180: Move sdc pinconf to
 board specific DT files
To:     Sujit Kautkar <sujitka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 2, 2021 at 12:14 PM Sujit Kautkar <sujitka@chromium.org> wrote:
>
> Move sdc1/sdc2 pinconf from SoC specific DT file to board specific DT
> files
>
> Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
> ---
>
> (no changes since v1)
>
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts      | 102 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 102 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 102 -------------------
>  3 files changed, 204 insertions(+), 102 deletions(-)

FYI: Since there were no changes from v2 so you should have kept my
reviewed-by tag from v2. Here it is again, though:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
