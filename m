Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE06427368
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Oct 2021 00:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243534AbhJHWKm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 18:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243505AbhJHWKm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 18:10:42 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69507C061755
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Oct 2021 15:08:46 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so13411012otb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Oct 2021 15:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=eRM/GW7Nz2OFw2k17twQGnIo0wF+tOa2AlGFVMS86EM=;
        b=F0dXedi0IAD47x8czJsAGMXrivcfwYxv4pkmpOdt840ykD/TvJNwmnRHgY3tYnVuAV
         9rK2pF290E+2PCT6YQz0gOaYFRhycaDZZi3lAmei0A1L+wMl7EC9I9SmUT7P9iA1oLcA
         sRYqEVqquRbwepfOiBt6WkbATF8yFjWaMxQ1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=eRM/GW7Nz2OFw2k17twQGnIo0wF+tOa2AlGFVMS86EM=;
        b=YC9x6/15ZSZ4vAkFqAicl2Cg1pjJgKHsJ45Pzu5P04GwraHG5r6WxWxMbJL3fXxjpk
         EjikqWNMpdUCRiZagbmC0bKgDhxoGuRzxudP+/MC1QPs/ZwpOvOrsPaYu04M5jXu7AEr
         f8qywnQfqZJpQbPf9+ASH6pln1ZSAf9gR9BjCbnYIvwBpODBkqwFNNo2/qrSu8tZBbI4
         ajz9jXx9B4X6L9nZ38r5N8i81TtABV8B0tdtuI5S1y3/7o4tHzK2adG71BUqLTfTe4RW
         1Y3C2p6K4FQoHBA9oe/x5VcqKwE7gZaSN5ItjJKv1DFQa9egPH8GCgQFbwtqRnRtocnG
         QHqg==
X-Gm-Message-State: AOAM532thL4+nRsqMkJE94iJ8c1HK8BC9+lZLtMQNJXOG5au70VA2Pv+
        eisWAd3DUQG6xWYEYer831bbD7HtekQCCoFPXE4Qgw==
X-Google-Smtp-Source: ABdhPJz+XzsxfBUPNSFtRuDtmegWrFGX/Yeg7TOOT9hLgVYsP64+/r5mtnoQas58CTF5G3R7gSZlZ6JOVqs0ba2v9aE=
X-Received: by 2002:a9d:12f4:: with SMTP id g107mr6848914otg.77.1633730925558;
 Fri, 08 Oct 2021 15:08:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Oct 2021 18:08:44 -0400
MIME-Version: 1.0
In-Reply-To: <20211008113839.v3.2.I187502fa747bc01a1c624ccf20d985fdffe9c320@changeid>
References: <20211008113839.v3.1.Ibada67e75d2982157e64164f1d11715d46cdc42c@changeid>
 <20211008113839.v3.2.I187502fa747bc01a1c624ccf20d985fdffe9c320@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 8 Oct 2021 18:08:44 -0400
Message-ID: <CAE-0n50UhQ75iDcdVDu6V6jv9tXLsyaW5NRJ6i=caf0uMNcueA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: sc7180: Support Parade ps8640 edp bridge
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

Quoting Philip Chen (2021-10-08 11:39:35)
> Add a dts fragment file to support the sc7180 boards with the second
> source edp bridge, Parade ps8640.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
