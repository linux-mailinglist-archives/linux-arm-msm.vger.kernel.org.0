Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81AC83D19D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 00:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhGUV7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 17:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbhGUV7g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 17:59:36 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3281DC0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 15:40:12 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id o72-20020a9d224e0000b02904bb9756274cso3568548ota.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 15:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Q4wvBXyV2lJ1aTRox0e1+Ok+AEaw/CVcGBs0YMHYsP0=;
        b=XqZH1FzW4TAdt+62lo9scgkSGaBidkfe9huO0q1U3Ro1mui8RWXUgDF4qzAHCY6Ru+
         iZ8zSponbgyYt6LXGU0IodEXLM8IGxpYpjT2JbWrcYJxLuLC7ydskbWTAd4EndoQ0uzM
         zAZJ+shbHzcPMS1D4t5gFzBXtgmxI7uFF4NFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Q4wvBXyV2lJ1aTRox0e1+Ok+AEaw/CVcGBs0YMHYsP0=;
        b=IdLTqaknqD89N8ByS8Dq6HMXKkzB6Kr4Crf/+O8yI9P7LhyFYQg3D5iMmVjzqSN9UA
         fXHNkZi+2urElbpsqgwR9Repx2E2MQtyuJkzJzv3CaNtXIIHuHDMC/Tn+tBpZp2LRh5d
         bKTZLHo+Bf7YV0hPb0kf4bZoN5ZKpZpAU/jpoAkb7iyI2CI6zuLYiU3Cbq6ifDgpqkjF
         /D8wqYh3B32dkKD+zsLNQcpfPxeA3MneiVAbcdPId4tMkYaUA87w/ZuTaSv7dzd18uzG
         NuVBIY7sdY3FL/1fhMXzO4ANdsLfxGj2G+fBVwjhyEYG2VUsz5gUPA81y2Qrm6RlAGQr
         /CSQ==
X-Gm-Message-State: AOAM530RqKu1Ckvah6OVYb3xRr78r4vUYS8PL8eNVIG/yAcnmKLDngxW
        4c/gCU6W+g5xSLpfl+vRcCt9+PTTw8lpwgf4rXMlHQ==
X-Google-Smtp-Source: ABdhPJwocIiRhFwFOnsM81FkofvQbBA36K0D5dCAYY3+kDkw8/j6vCVRW/AWV4EzATwWCQE40EPyTZCpO+0f5mG/y5g=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr27826933otf.25.1626907211418;
 Wed, 21 Jul 2021 15:40:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 22:40:11 +0000
MIME-Version: 1.0
In-Reply-To: <1624365748-24224-2-git-send-email-rajeevny@codeaurora.org>
References: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org> <1624365748-24224-2-git-send-email-rajeevny@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 22:40:10 +0000
Message-ID: <CAE-0n50Km=XxJ93ZJkwcWWJdzvBba_We=bZYzkdYKoB-cwTYkg@mail.gmail.com>
Subject: Re: [v2 1/3] dt-bindings: msm/dsi: Add sc7280 7nm dsi phy
To:     Rajeev Nandan <rajeevny@codeaurora.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, sean@poorly.run, robdclark@gmail.com,
        robh+dt@kernel.org, robh@kernel.org, abhinavk@codeaurora.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org, jonathan@marek.ca,
        dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajeev Nandan (2021-06-22 05:42:26)
> The SC7280 SoC uses the 7nm (V4.1) DSI PHY driver.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
