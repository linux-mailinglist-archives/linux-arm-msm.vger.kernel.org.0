Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA4A138AD97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 14:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237586AbhETMIc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 08:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240145AbhETMIU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 08:08:20 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC425C06EA72
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 03:39:44 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so5198878pjp.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 03:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m/RdGTpHpIlnNqukYMSfOi40wGs3gJ2bxRFA/p/HWmc=;
        b=Vhj8ZxDnRnFsKkjgvE0jTxFiP9E6eGyLcgWFUbcEE6BPCOaYrfiee/sSxQ3bZ3EmIA
         8qUPu2mopXJqA5KvDOG7fLjhRNErG+GGUFexzHbLH4YKa69rcXjN0GBvGE1rsIY05p2e
         VROBlatX93nO4HEMcczfdE1W935uS1GxpIkkQGV0VWsWo71UQYT7Tq39t5h0jiz88DUu
         q13f+kH8jZmY1bdai6bxM2NpJ4rOaf/sGrOVZ3+cn8Z5zd9zHRc5AIobTBTe0Q7cq/zo
         GkW4aBUXx17jLCVVrC8mDrHyqSPGRU0oaLUS2156S3ymDUAjA0k6rDXw736AH2PngNEw
         ENdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m/RdGTpHpIlnNqukYMSfOi40wGs3gJ2bxRFA/p/HWmc=;
        b=WCDN972Elq1K0EgPfvT9ktuG9wStLSQHn/vGEVXejzLDVipc047373lG1ImxzQ6l+r
         WuxfHKvxF/n/aoR1WHTRdmxs/PLa3AAl8XhSfAXHzYA9EwooKfhdNoZq/StD3T3cGu38
         dpOMnL14GDCJeUwBWm+0x7owboMuB2+AE+YhIf3S0lE5vxUPoHMBcI0R8l9ZDLuyZc2S
         26hB1jsrMHoHurgJrjv4lqCBNV0Yx49LZ6Rd/HHaQclPAjVuO9CGBEhXHVcl5btRmofM
         ZTRDF5xiCz3x2aNmsNHBVAylUuYzhxhU9+QGzqdXj2xHFa7lGk5sx2+DdcZmtryHh/+c
         aKkQ==
X-Gm-Message-State: AOAM531q0CUMwLWcI1qYTwwdIIXnDPXgLty8I2vmfGR1J3Tw6XCCpgdh
        CXmdWTZRGNZiScEXKHOj7GR9e52Gja6XlDpppQIH3Q==
X-Google-Smtp-Source: ABdhPJzf2fR6d+CPHdEr95MzZvm9RJFlJaLVIyK+Nk/R1dCYvI8lZdQuPG7bvcKxY0sCx8N2rOrD6gLETNVjiPOY5J0=
X-Received: by 2002:a17:902:b70f:b029:f4:5445:cd9f with SMTP id
 d15-20020a170902b70fb02900f45445cd9fmr5262680pls.32.1621507184286; Thu, 20
 May 2021 03:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-6-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-6-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 20 May 2021 12:39:33 +0200
Message-ID: <CAG3jFytS-SBsgPTwN5Uzn=g9k_o-+ifyN7aPrzTvY1nb_csptA@mail.gmail.com>
Subject: Re: [PATCH 05/17] media: camss: csid-170: don't enable unused irqs
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>
> csid_isr() only checks for the reset irq, so enabling any other irqs
> doesn't make sense. The "RDI irq" comment is also wrong, the register
> should be CSID_CSI2_RDIN_IRQ_MASK. Without this fix there may be an
> excessive amount of irqs.
>
> Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-170.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
> index a81cc94c075f..2bc695819919 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
> @@ -443,12 +443,6 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>         val |= 1 << CSI2_RX_CFG1_MISR_EN;
>         writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
>
> -       /* error irqs start at BIT(11) */
> -       writel_relaxed(~0u, csid->base + CSID_CSI2_RX_IRQ_MASK);
> -
> -       /* RDI irq */
> -       writel_relaxed(~0u, csid->base + CSID_TOP_IRQ_MASK);
> -
>         val = 1 << RDI_CTRL_HALT_CMD;
>         writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
>  }

Reviewed-by: Robert Foss <robert.foss@linaro.org>
