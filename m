Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2E13D689A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 23:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbhGZUqU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 16:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhGZUqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 16:46:19 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1C3C061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 14:26:46 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id b25-20020a4ac2990000b0290263aab95660so1397446ooq.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 14:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=dsXLrpCdTeZdTsazEhHari1/KxHVLO68J91/QVfecJs=;
        b=aAWGFqPFyI0kkrSxC4Fy7yP5VdRgQ3oXaBHb6bTRznq7iougjzTRIHv/qBQbBTseao
         4ekq90X8LiToPoOziZohy0HRfqgZ19xE5EOnzExavHL48gvfUri/n0YhD+1FSiTTYk/v
         EFwKXMDulBpzkSeJUWtA4ZTal1kWRv7CYgeZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=dsXLrpCdTeZdTsazEhHari1/KxHVLO68J91/QVfecJs=;
        b=LBYlDVb8xlWco4nM0kXHc0CfoMUxL5Cx7WeDga+33EHuAufCest/Yk+ZCY6ZJAsRBz
         qnZ5QfgYrTeZw3vug73hpojIMq9+uTTE2q7RkqQq8gCz74TWjTu34ujwegyobZi9a10n
         lpymBrHTpiprvLsCTJ4Jq0KhSzgqHklu7rnQZ31fdCibtO8Mod763XI9p7nF8IMJrjVD
         tES8pak1TT2bhiOjZhxNqUNq8qD3RrZ6m6eTVuZwZWpwOv20JNLYHbSpTK4t3/70R4My
         LhX0RlGBDYJ04CCUs805rfVmpYURWfHQQ6OkmS2UzBfTQ+TTAYv/ampUm1Sn2Hzy5h/K
         dz1w==
X-Gm-Message-State: AOAM532GSqBdKDQDdEvAbowQzpk4WY3ftnaLhWuzkO1+7I3JJdetzBIH
        Kj4ZiKPu4bm0vFnahgqtDdYiHoMNOOOLozu0G9MBkA==
X-Google-Smtp-Source: ABdhPJzO02a2bZc7k1feIJVeSEY+Tn0KBX1O7wFM+yGIo+VYF2Zdo5F+gt2SfRXZ51hs8JhzLs/n/vHjZp6jarqJBGk=
X-Received: by 2002:a4a:a6c2:: with SMTP id i2mr11718060oom.92.1627334806023;
 Mon, 26 Jul 2021 14:26:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 17:26:45 -0400
MIME-Version: 1.0
In-Reply-To: <20210726120910.20335-2-srivasam@codeaurora.org>
References: <20210726120910.20335-1-srivasam@codeaurora.org> <20210726120910.20335-2-srivasam@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 26 Jul 2021 17:26:45 -0400
Message-ID: <CAE-0n52HKAN1ATOhhTOt6TQo_gke2qaOWGywZU3qvDAj4b9rEw@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sc7180: Update lpass cpu node
 for audio over dp
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-07-26 05:09:09)
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>
> Updaate lpass dts node with HDMI reg, interrupt and iommu
> for supporting audio over dp.
>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
