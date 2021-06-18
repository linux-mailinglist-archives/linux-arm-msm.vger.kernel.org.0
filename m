Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5833AD0D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 18:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbhFRRCA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 13:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbhFRRCA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 13:02:00 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6C4C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 09:59:49 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id j11-20020a9d738b0000b02903ea3c02ded8so10319477otk.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 09:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=49XK1U9gaoxfY5QtITJyvfno5XduiDm+gre6lYBi/3s=;
        b=mFeyfsdeuWtcSZ/FNVQ+QgCc7JFeKeFPGXz2SjhPbhLN/i7A7XaLDqIVSczvU1PdTH
         Qme6hOPil2eBqTTPcXiz1ZSrsRPdi8QT1GV+xTKAWrxhx6VrEEkQdlAaTFkFPC4DB+9s
         r98NhmUQKgRngLA37W1BvsW1mwE1te18aLJ/EQLNJKdB6IIxE83BcZjr0akSK8oT3TC6
         WoPFPWgpWMTMxCZ9XkBhHAkX2XuXqRFeJqpAAKUsKMC4th+b3mIkEpSwcPpB3ElMqcfL
         b5d9sqa6Y6onasqQSaVMeGGXhTWlvy7pb/iwvOX8b/7II1Zu/2o6gbtvQ9zxImWY61p9
         zEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=49XK1U9gaoxfY5QtITJyvfno5XduiDm+gre6lYBi/3s=;
        b=h4W+SMmelTYgjctjLGvkNbhEEkLiweT/qyDTN3V8MfPza4nRm1TEoB7OAIuEQwPZ0d
         Utad7YTwOpzWSR+b95PSWKa1YUsVMY0gx3Zc9A4BUJxsmtvM6mAWTbbxUkstcJf/umCb
         QmgfYqbk+dd/S2yy9foJGSMXNX4stnpXt//4xQwcP02c6HbBIqQAIh3VjrFowpinhYc/
         Xa1wML6WRS7WNdBf5oKqUoPvF8f9NQMXD+ScNnJifRd3WmQKLO1sOe05sah6wV33v3p/
         lL1XGlia+/4VrbD6fSbGSyWdgc274oE9kuSOPvgov1DmuCF6TDl+Gr/A8q9wS6zMerM9
         B55w==
X-Gm-Message-State: AOAM531C3Mm7YB+tQ4yG/xE9rm+GZS5+xqfsFKB6x+BQEzhmXlTkGHWp
        6CoBX61XEqwxgXvRFw7imJeC9Q==
X-Google-Smtp-Source: ABdhPJwV59tz1OrYb8hzlY4fu/yZ8YxNdRBIRg6I/mLKYzGsZsWMTdQkXq9FZmKjrLCTslvtClcv1w==
X-Received: by 2002:a9d:2034:: with SMTP id n49mr10849585ota.231.1624035588665;
        Fri, 18 Jun 2021 09:59:48 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h8sm1893608oie.41.2021.06.18.09.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 09:59:48 -0700 (PDT)
Date:   Fri, 18 Jun 2021 11:59:45 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] soc: qcom: geni: add support for gpi dma
Message-ID: <YMzRAS81fkMU+jun@yoga>
References: <20210618141839.3777270-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618141839.3777270-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 18 Jun 09:18 CDT 2021, Vinod Koul wrote:

> This is version 2 of the GPI dma series [1]
> 
> This series add the GPI DMA in qcom geni drivers. For this we
> first need to move GENI_IF_DISABLE_RO and struct geni_wrapper to common
> headers and then add support in the gpi dma in geni driver.
> 
> The SPI and I2C driver changes shall follow shortly
> 

Given that the continuation of this series will have build time
dependencies on these patches I think it would be good to see them all
as one chunk (and practically I can create a immutable branch of the
soc/qcom pieces and share with Wolfram and Mark).

Regards,
Bjorn

> [1]: http://lore.kernel.org/r/20210111151651.1616813-1-vkoul@kernel.org
> 
> Changes in v2:
>  - add r-b from Bjorn on patch 1
>  - add more details in log for patch 2
>  - Fix the comments from Doug and Bjorn for patch3, notable use read, modify
>    update for irq registers, use geni_se_irq_clear() for irq, dont update
>    single bit registers, add a bit more description for gpi dma etc
> 
> Vinod Koul (3):
>   soc: qcom: geni: move GENI_IF_DISABLE_RO to common header
>   soc: qcom: geni: move struct geni_wrapper to header
>   soc: qcom: geni: Add support for gpi dma
> 
>  drivers/soc/qcom/qcom-geni-se.c | 47 ++++++++++++++++++++++-----------
>  include/linux/qcom-geni-se.h    | 23 ++++++++++++++--
>  2 files changed, 52 insertions(+), 18 deletions(-)
> 
> -- 
> 2.31.1
> 
