Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3322B3B6B76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 01:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbhF1Xkt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 19:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbhF1Xkk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 19:40:40 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDB7C0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 16:38:13 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id y9so5340153qtx.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 16:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=miYY2dmUa8aOm4aFUUNNkSxFLOIn70qDkiO0NjVvZko=;
        b=nV8UvqlMp80EZh03fJr7ThFcbJyzi6eYcMjOZYU/YWtPbhj0fi2Bc/uhP5P/k9heDu
         V7/GzY+XyI83HS9tzCN6IN3uhhp/AqVgWd1JH+pTpQmRpEZb5+izLOpQESgRoZXGYEF4
         07PiqC06/UlBCuh87w2WO52BugnaUrs3/WxS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=miYY2dmUa8aOm4aFUUNNkSxFLOIn70qDkiO0NjVvZko=;
        b=oIZA0sMu50jVrR6CS3yAmCvZ6U452KX64g2SdqkFp/I+enevtH7yRnuXle7czBO6Jk
         JkQw9Yu+DcxQ797ukp741hjH9X8RqYbOr60qhDZldD59J801SwBtW8chW/8nnx4luGFe
         LGioZ6ZPV+C1EPjztHj8NVIOMcMtlpl2fQ4Q7R4eGm4MDXEgmtw6FXICch2skDFYqyYT
         rFOlr/eKAlh7GbY/7sxVp5KiUGlVUfvFmKAfXGb06bIvD2Y8yarjU+iygyTxNK0Kp3KM
         WDJ3wbIUIIrKy2gZz5nQil7urVuhij4yjkwm6oQ6yoywaLPjOWeW/mphXVn/I7L8dN6I
         T4Vg==
X-Gm-Message-State: AOAM533TkFzMi/2cujvADJ0utHV0s24hHaQm8pRgj+Js6zgSeLHmli0e
        0XbgRQbuElYmlkeGHeqke0p1fCLOGC1sYA==
X-Google-Smtp-Source: ABdhPJyqRz6zj0p78VX16EEEUmxummIE3MzrtkLYRvmYmMOHD1GKmcpzSuCgameezTilT0cpwTy5jA==
X-Received: by 2002:a05:622a:8f:: with SMTP id o15mr24641604qtw.377.1624923492455;
        Mon, 28 Jun 2021 16:38:12 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id i19sm2354476qkl.19.2021.06.28.16.38.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 16:38:11 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id k184so14497951ybf.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 16:38:11 -0700 (PDT)
X-Received: by 2002:a25:dc50:: with SMTP id y77mr18847228ybe.405.1624923491186;
 Mon, 28 Jun 2021 16:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210625052213.32260-1-vkoul@kernel.org> <20210625052213.32260-2-vkoul@kernel.org>
In-Reply-To: <20210625052213.32260-2-vkoul@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 28 Jun 2021 16:37:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XsUbyB4enDobda3eDoTpCqdgVogyC3YWGe9rsjgR1REw@mail.gmail.com>
Message-ID: <CAD=FV=XsUbyB4enDobda3eDoTpCqdgVogyC3YWGe9rsjgR1REw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] soc: qcom: geni: move GENI_IF_DISABLE_RO to common header
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 24, 2021 at 10:22 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> GENI_IF_DISABLE_RO is used by geni spi driver as well to check the
> status if GENI, so move this to common header qcom-geni-se.h
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/soc/qcom/qcom-geni-se.c | 1 -
>  include/linux/qcom-geni-se.h    | 4 ++++
>  2 files changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
