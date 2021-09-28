Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E2641B8D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 22:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242824AbhI1VAf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 17:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242831AbhI1VAe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 17:00:34 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC746C061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 13:58:54 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id l8-20020a4ae2c8000000b002b5ec765d9fso52625oot.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 13:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=lN+LkRX7S70D5nVV7zC+dNpbI61BdRQlf1pXpHjEvnU=;
        b=BqNa00Jv/wczuRQl2CsbEF087fnEuBEsWtWuOddVIpEr4F1WAbXg/JebtjR0mpK6V2
         gl/ifgUDTMCHgD0QM5YRmQpoTUm2aq0jE8TJ89Q5fAHnYH6CwtssGC37iz04bmnaO96t
         zRyHti+X3BIiBj/9xx7HNEgec/SyWwjCDTQnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=lN+LkRX7S70D5nVV7zC+dNpbI61BdRQlf1pXpHjEvnU=;
        b=t7oaeBA6g2WILEA9epNkRepoljFoEUehbGCltuKF50O7k/DtE1ZN7r+SBZqACfyZP3
         VtVskViA7ZnSIf6Nh6alHpDT3akJfMMNcb1Fm3SGThvtnIO3+QqGzDsFyP2RLADt7Zoj
         VVxRhjKg1dvv78gBhM8tN3vjjiP/ZoyAv3sNqP9j8Kn9YhptKnphKDgse3+e2jrQOlWm
         5RhK2qpN06gOJ2+5a9VHKQf5eXIa9nD7DV92nTjtourPyiSJ7bKpD6fKtsSPiqrjk/V1
         tKS9ySf46RQZYJsNXsbLWobxYf13mArnFtJZNVMTeVFvCeVSZaO6+sWYrTdoiESv6k8H
         71yA==
X-Gm-Message-State: AOAM530e8yxdeecciveyzG/pxI/EP4mXetVu8mj20nCXYCD+5eUpozo+
        EVnGaeuJtyiMUMrWrWdYZ7jWhxiX5TkjhJViMgOOfQ==
X-Google-Smtp-Source: ABdhPJy09zHOLdQTdxc47vBQk3oh7hLDqzFOIt1B9H5sRlagoeu6wP5B0XwML12xwBIRl5af+iLJeXbM4xt4gYBLo7A=
X-Received: by 2002:a4a:942:: with SMTP id 63mr6740900ooa.25.1632862734306;
 Tue, 28 Sep 2021 13:58:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Sep 2021 13:58:53 -0700
MIME-Version: 1.0
In-Reply-To: <20210927184858.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
References: <20210927184858.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 28 Sep 2021 13:58:53 -0700
Message-ID: <CAE-0n506Pp-VUCOoMcFaSbrnp+Op3_QRVPFG8t9f1yOX8Ps2+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: sc7180: Factor out ti-sn65dsi86 support
To:     LKML <linux-kernel@vger.kernel.org>,
        Philip Chen <philipchen@chromium.org>
Cc:     dianders@chromium.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Philip Chen (2021-09-27 18:49:39)
> Factor out ti-sn65dsi86 edp bridge as a separate dts fragment.
> This helps us introduce the second source edp bridge later.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
