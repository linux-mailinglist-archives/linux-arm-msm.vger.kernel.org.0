Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686EA38CF55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 22:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhEUUtL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 16:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhEUUtK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 16:49:10 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9BBC0613ED
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:47:47 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id e27-20020a056820061bb029020da48eed5cso4861961oow.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=FZv+TdRvjRXdoAiuFDzSVh1xS2bkm0D0W6/+ClB4tlw=;
        b=aUJsB2gG5m+r2/oE3sh1SIEYobu4HVFKIAd1xUIwJkNi26hhPLJPwwj2Qq3wjSIAsA
         xTX8TEoaYN2XL7kLIyx9CYj9LltNGXBW8HbzgD42bLQzWGPBwvTq0xaahoQsoy1F6UAE
         oTbSMRLTR/hToYwszdZInC1oO6KLxOf8ojy+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=FZv+TdRvjRXdoAiuFDzSVh1xS2bkm0D0W6/+ClB4tlw=;
        b=qVB7aA0YiwNEw82i6L3e4g4Wux8D3ugfvAllGgvUVhEU1T+BkjtoGhBvBVw0BM10Tp
         giNkJKENOb6Uv535Lzf17jEbbKA3XgMXvLT3F+QJzcX6a6i9UWs7AzwPiv0xoAiKFITJ
         KcUi3QwMCTyLakGQmvY1Jxkuz0kaqVCFrs4hrqXcK6HBoVjYWnmjaFwsnlQKVI+hYa+Q
         +JfVn+4xyp6ujCvqafEjQYKlRPIX8w5SI1Q5iNpczpLtldUPUD7sGs4D2pTtqy9o97xo
         3ANcOBCp0OiSW3yncFY2ocQYfl+nJUZB7k9L2do4JwOpgS3BxvBsKrmUOxiu0hYAarJD
         KG+Q==
X-Gm-Message-State: AOAM531cIFbMfJNJ/6TrwyppLVta5o+HyQMPJI/BFd8SrdFrf+97I1Su
        AcU8PqmEdmdG/LhGDFRoIFsp0v3iwMsEIDf9SzW5lQ==
X-Google-Smtp-Source: ABdhPJyUmsRhbIFY6CiBuzJMtveYnQvcH/rQqHjH9C2afTGvPXZxmvEgG0Aqoi3ktvGUfo062P/DR8+bldZq9BSb9n0=
X-Received: by 2002:a4a:85ca:: with SMTP id u10mr9705115ooh.80.1621630066738;
 Fri, 21 May 2021 13:47:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 13:47:46 -0700
MIME-Version: 1.0
In-Reply-To: <1621592844-6414-3-git-send-email-mkrishn@codeaurora.org>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org> <1621592844-6414-3-git-send-email-mkrishn@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 21 May 2021 13:47:46 -0700
Message-ID: <CAE-0n52w3YW=-KOas6T9Fn31wOMafoCima9Od3wZ=D24+=n-8g@mail.gmail.com>
Subject: Re: [PATCH v17 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 PHY bindings
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        dianders@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
        sean@poorly.run, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-05-21 03:27:23)
> Add YAML schema for the device tree bindings for DSI PHY.
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>
> Changes in v1:
>    - Merge dsi-phy.yaml and dsi-phy-10nm.yaml (Stephen Boyd)
>    - Remove qcom,dsi-phy-regulator-ldo-mode (Stephen Boyd)
>    - Add clock cells properly (Stephen Boyd)
>    - Remove unnecessary decription from clock names (Stephen Boyd)
>    - Add pin names for the supply entries for 10nm phy which is
>      used in sc7180 and sdm845 (Stephen Boyd)
>    - Remove unused header files from examples (Stephen Boyd)
>    - Drop labels for display nodes and correct node name (Stephen Boyd)
>
> Changes in v2:
>    - Drop maxItems for clock (Stephen Boyd)
>    - Add vdds supply pin information for sdm845 (Stephen Boyd)
>    - Add examples for 14nm, 20nm and 28nm phy yaml files (Stephen Boyd)
>    - Keep child nodes directly under soc node (Stephen Boyd)
>
> Changes in v3:
>    - Use a separate yaml file to describe the common properties
>      for all the dsi phy versions (Stephen Boyd)
>    - Remove soc from examples (Stephen Boyd)
>    - Add description for register property
>
> Changes in v4:
>    - Modify the title for all the phy versions (Stephen Boyd)
>    - Drop description for all the phy versions (Stephen Boyd)
>    - Modify the description for register property (Stephen Boyd)
>
> Changes in v5:
>    - Remove unused properties from common dsi phy file
>    - Add clock-cells and phy-cells to required property
>      list (Stephen Boyd)
>
> Changes in v6:
>    - Add proper compatible string in example
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
