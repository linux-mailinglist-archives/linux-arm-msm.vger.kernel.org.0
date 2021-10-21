Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4B743691D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 19:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhJURh7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 13:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbhJURh4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 13:37:56 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E65CC0613B9
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 10:35:39 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so1269479otq.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 10:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=fbDFAc+mDq/fVlQikhm/5WQdU+2NWEk3ZHERoK3qaZA=;
        b=VBX5aufNkoMTHFbOeGP+BrNRxy6MhOc+43NPA0e5hUPwm9iWg/SsllI1Hq9Jf1+q7p
         3HcV/SKBuJnEHelkApbMambF9Q9KZQTRN/6BEeQVzVE1TOq6F2O6GHlAlLHtU4ow2K6P
         nWnYDrKsVlcUsa1XWYewK+/SxVlnZH4fPyUWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=fbDFAc+mDq/fVlQikhm/5WQdU+2NWEk3ZHERoK3qaZA=;
        b=2PWCUfFMlsRqNkcUMRsL2s/xQwWcBUNoytY5ExtYd+/Fls0ej+Muk8yIJ1dTqw2zX5
         qth39U/kuxVYiFI6h1BPp+o+V6601YBl2IL7cOObPqX5EvbsIT1wJYSV7zA5B9HRITin
         aX9QURkjLkDaD5Dxz2PoxRnH3XdkP1VHfgbk3YDE/ZyDCVekou1sN9t3Dkpzs5P9cXDA
         ZZFMxaYgh1fhLtqS8ASXj0vOI/l2OFnwvpWD2y+/ucW7PgOTTF7BzB1AHilBNWHlV2im
         OltlFmZrIs1HPTLm/sFmEv0O4raSGNF8Kr4R7nfyOI95lenWkFHLEdxcZMcFx13ZAXOC
         JsGg==
X-Gm-Message-State: AOAM533HWR9p2aMlkSZpqmQUvXLl0JDREo4D21n3GrRplS3NHCcv6yLx
        i7YLORZ9HgpVlLyhoeZbTHqrDGwdudL5ToKguPF6T5oC0bY=
X-Google-Smtp-Source: ABdhPJzjOv9nA1sQ7Cd9uU8D7zcDzSeZPBApL3N+RjvJrY2ioR8BM3fhxRdxBOH/LurEUUwnPniIQrdfx5D/FoBW03Q=
X-Received: by 2002:a05:6830:4187:: with SMTP id r7mr5956450otu.126.1634837738629;
 Thu, 21 Oct 2021 10:35:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Oct 2021 10:35:38 -0700
MIME-Version: 1.0
In-Reply-To: <1634711785-25351-1-git-send-email-quic_c_sanm@quicinc.com>
References: <1634711785-25351-1-git-send-email-quic_c_sanm@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 21 Oct 2021 10:35:38 -0700
Message-ID: <CAE-0n51miQBAO2QBtHG75cB4TZnm9jiXFz3APBwrNbQcfjB-Eg@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-snps: Correct the FSEL_MASK
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2021-10-19 23:36:25)
> The FSEL_MASK which selects the refclock is defined incorrectly.
> It should be [4:6] not [5:7]. Due to this incorrect definition, the BIT(7)
> in USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1 is reset which keeps PHY analog
> blocks ON during suspend.
> Fix this issue by correctly defining the FSEL_MASK.
>
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>

Any Fixes tag?

> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index ae4bac0..28459a1 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021, Qualcomm Innovation Center, Inc. All rights reserved.

I never thought I'd see this again! :)

>   */
>
>  #include <linux/clk.h>
> @@ -33,7 +34,7 @@
>
>  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0   (0x54)
>  #define RETENABLEN                             BIT(3)
> -#define FSEL_MASK                              GENMASK(7, 5)
> +#define FSEL_MASK                              GENMASK(6, 4)
>  #define FSEL_DEFAULT                           (0x3 << 4)
>
>  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1   (0x58)
