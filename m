Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A323048E40A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 07:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239254AbiANGIR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 01:08:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236517AbiANGIR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 01:08:17 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636D7C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 22:08:17 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id c3-20020a9d6c83000000b00590b9c8819aso9004079otr.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 22:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=K4p5fqUDkXH1ATZQd2cSahMZ7ElmoT3wb+zGFFFvjXY=;
        b=fQQ7OHtYEd12KQp6LdWt6b2dKIV2H1dB4IRu648jqxy2ZRSoHPjrc24kOoPpp3TpbP
         3vLuF2ngNJKgnwCNjlY2qLBob2s43Ots2e/KyD9RtlQuanD/hJqZzrMwtWRkZ8QQJzq1
         +5s58jiMlPBZND4ELMykYJ4ZfoUPURYw729yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=K4p5fqUDkXH1ATZQd2cSahMZ7ElmoT3wb+zGFFFvjXY=;
        b=QtobTAZMQ5bIja539y3pSWLhw8t3F92p5pI95GABvTZ/gHKYDxY8PRRD1RE5F2cBL9
         e7Tf7UJiJ4t6bjFVRyB129ChqFp5UypW8f9qt8qu2DqSxg+ct9mN4DdHQjz77gKMUQ2c
         Q9+wOuYlyb+QRfIl/z3LjgM3tSVAj7S04WosHgyHwq5OoDJyiNE/FmOkAiP6sJ/arH4a
         O5pq6jFbThOvSEEhWDFI6EeT+FA4/h7DaGJO0WeyHBEjE0SciFO5aKWJDnsBoG3bNThf
         QHrF8QIXQasVTBHqWUl1airxxnjx9wWrXgpnm0HG3ziKnReckrF2qbp+kw5bP+H27IY1
         7zwQ==
X-Gm-Message-State: AOAM531FtVCANnm38BmroTyoMdNmuvErzY5w6y5yriQ8+pW1GzZWWegF
        UseMFa0yd9JfItJRh1oCxJfMEn9B7Wv2u8l/6yIXxw==
X-Google-Smtp-Source: ABdhPJzDfPw43c+GugW1jZY1RjzaNveoHNFQ/lVRUmmopat5KQaPTt8XtQ5a2FikuYK0q6YMDK7GEUS+iNWmsvy56y0=
X-Received: by 2002:a9d:7451:: with SMTP id p17mr5551097otk.159.1642140496433;
 Thu, 13 Jan 2022 22:08:16 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Jan 2022 22:08:16 -0800
MIME-Version: 1.0
In-Reply-To: <20220113164233.1.I19f60014e9be4b9dda4d66b5d56ef3d9600b6e10@changeid>
References: <20220114004303.905808-1-dianders@chromium.org> <20220113164233.1.I19f60014e9be4b9dda4d66b5d56ef3d9600b6e10@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 13 Jan 2022 22:08:16 -0800
Message-ID: <CAE-0n50N=vFC3wpPh7O6eqWMNyT8n-Q0ssU+CkgJH2DY7T6SoQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc7280: Fix gmu unit address
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     quic_rjendra@quicinc.com, sibis@codeaurora.org,
        kgodara1@codeaurora.org, mka@chromium.org, pmaliset@codeaurora.org,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2022-01-13 16:43:00)
> When processing sc7280 device trees, I can see:
>
>   Warning (simple_bus_reg): /soc@0/gmu@3d69000:
>     simple-bus unit address format error, expected "3d6a000"
>
> There's a clear typo in the node name. Fix it.
>
> Fixes: 96c471970b7b ("arm64: dts: qcom: sc7280: Add gpu support")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

BTW, gmu isn't a "standard" node name so might be worth replacing that
with something else but I have no idea what. Maybe "firmware" or
"power-controller"?
