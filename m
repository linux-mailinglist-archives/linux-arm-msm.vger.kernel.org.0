Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E91EB1E6903
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 20:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391420AbgE1SEQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 14:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391400AbgE1SEO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 14:04:14 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0375AC08C5C7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 11:04:14 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id r10so3890820vsa.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 11:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fQ5JUbesFirtJBWiXrChM94Gcp29UpeOFm8d91owft4=;
        b=UIfUhviWUXDEoXbz7ZQDKkdfO/J2eQ9XSxx/Qyz0FLsHjcpXdf/Elpazpv43+tXhzo
         K7JCq6APujFDLwjcLlBmcszhY/ZAabhEoiY8upljd9o2rs1Lc3o2XafHBBKB1AtJ+Cb7
         8Injbxv6+vYbHWy9Wgd/8oDsXrJ83yySnlYQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fQ5JUbesFirtJBWiXrChM94Gcp29UpeOFm8d91owft4=;
        b=oeSh9FegFVen268O5uQqdGg4NwiDluSt93uIciHrZ0JB6uD/ZLQt8wWknJT1QhQo59
         iCnONY8vYFmssPsXVDZCAAby3R+cCx9gnNJEhHCbpdVfaqrB0uZ7eKeCflpzZHP8zAho
         8sWrexYZbFGr6WDFF0ih9W7JbPhjDAeW+mK5mgZXDCqXq4HH4DSstJGTM4FMxW+QTapG
         twTGkZe0k+0k8vvkX+GOYk9Kzmr18M8kV2Qfttm3BJSmuAwR+hDmNP3IN6ErR1ISRxSZ
         cBdedU8XMSrPOimUjOzQ0B8g6w03JFTn8nMpL+mgdFm1kEpGNyLFjViGfmwgHqjyENEf
         uTLA==
X-Gm-Message-State: AOAM531pKrBS/hCIIUcs9t8RlhWeo0OmAkdyYg1ivSLVHKNWsfOQN0ZW
        xF1KK+v0zHnb0xDzDPFYFIGI2G9aRjk=
X-Google-Smtp-Source: ABdhPJzP2fHczW8sxA2VsFFWIu68tHRAEAl8vO2hXqDrQHK3msFQgKXRrjV3802hdyKzoEpi699D1g==
X-Received: by 2002:a05:6102:10a:: with SMTP id z10mr3179953vsq.131.1590689053040;
        Thu, 28 May 2020 11:04:13 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id x185sm485136vsb.15.2020.05.28.11.04.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 11:04:12 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id t23so2271477vkt.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 11:04:11 -0700 (PDT)
X-Received: by 2002:a1f:a24e:: with SMTP id l75mr3226940vke.92.1590689051355;
 Thu, 28 May 2020 11:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200521060425.24285-1-swboyd@chromium.org> <20200521060425.24285-2-swboyd@chromium.org>
In-Reply-To: <20200521060425.24285-2-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 28 May 2020 11:04:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UyT+opi5hgtmfKQ9gSs0FWK0W=+uHdPv-mJF2MTHQS5g@mail.gmail.com>
Message-ID: <CAD=FV=UyT+opi5hgtmfKQ9gSs0FWK0W=+uHdPv-mJF2MTHQS5g@mail.gmail.com>
Subject: Re: [PATCHv3/RESEND 1/3] soc: qcom: rpmh-rsc: Remove tcs_is_free() API
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 20, 2020 at 11:04 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This API does very little. Let's replace all the callsites with the
> normal operations that would be done on top of the bitmap that
> tcs_in_use is. This simplifies and reduces the code size.
>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 59 +++++++++++++------------------------
>  1 file changed, 20 insertions(+), 39 deletions(-)

Sorry for the delay in getting to this review.  Looks great.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
