Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7DB4A9825
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 12:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352987AbiBDLDm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 06:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237001AbiBDLDl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 06:03:41 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD9BC06173D
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 03:03:41 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id c9so4808345plg.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 03:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=byBwJqtuZSV5NfFenYhnEHDTFDwMBMjfLRkqWPZPKHI=;
        b=y8lFJW/bcGsF68WeYyOAPUiNQnzMhihNT0vv09pQI0mONSkJn8x+KtCdxSXpgoUYTV
         WhNog/BVB7+ut/FbMxcqyO5xmorlU0TUsFLf8RPgm3Y7uGzUk3mfklwslViUR2ONdRmU
         h0CqaVHfLLO9cJexNaVK9rtHf4AmGqLVBR03DJD56KUyGMn4KWwpd8fK/nZsgdjfSAjV
         5G4AQFx2iNagpKlyeuoQFuSJldkzniiRRs9DoFnT7i9NVHqIPio3BQt3GbxqDV3uToTD
         nbnEoaoQsHsdhogxtjDhmEbqqPpsDPZaCECZDAsQJfkGcHX6ibodCKDeOFMcpY1sB772
         NT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=byBwJqtuZSV5NfFenYhnEHDTFDwMBMjfLRkqWPZPKHI=;
        b=OiLNf5EzFb0zlM+BXa5fvkz9pmvUaXHI4f6/2pQXDJQwIgzhdkiTr3xl6Yu308+eYI
         L96lPK9P9VJkJIhG5SEVJQGu9YCubPOiDz8xMPkP8Gt3rkYX1jsrIC9SJAMpEhfS4Wz6
         o3EdCfWHztaN4+Iw5IulcPpVjO+bf8c95VJkm0oK0CQYIcVl2JSJoSDT84oANp4mrs9S
         yFxNvRcMm7tQuF6H1fwYTTnPm+qNluwGBhCaAOqxJ55FSIuXbUYTRIgif9uojylrhq73
         TTrcnToMxJb+7XQd0h/+2BxNGrvryRXBAh5ehrDMP1Y1dHR1GPTs0e5KHnTAttm8bA4s
         jMVg==
X-Gm-Message-State: AOAM532J4H62qp0nGdl+zo3F5cdgDsprlpHpKIhYjOrFJHhGc3l+h8g5
        oDDf5Ph/bU/awUE7WSiCgyxWqhRkNPBc0jFFbPEbsA==
X-Google-Smtp-Source: ABdhPJxPGEGBB01+fXT2JTlPmtIyaf5RUpOoChSUrewfITUH6eo8TXKwMjep6120SBR/auNp9qz9EyFbwf7l1UU0G34=
X-Received: by 2002:a17:90b:4a86:: with SMTP id lp6mr2536068pjb.152.1643972621409;
 Fri, 04 Feb 2022 03:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org> <20220203164713.1712111-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220203164713.1712111-1-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 4 Feb 2022 12:03:30 +0100
Message-ID: <CAG3jFyt3jm3QJ01QQcDkR17VG8T4CZeGTpN3WzgQN8TjJRKZQA@mail.gmail.com>
Subject: Re: [PATCH 9/9] i2c: qcom-cci: add sm8450 compatible
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 3 Feb 2022 at 17:47, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Add QCOM SM8450 specific compatible for CCI controller, which is
> equal to CCI controllers found on QCOM SDM845 and QCOM SM8250 SoCs.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 2fc7f1f2616f..e625857fde41 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
> -// Copyright (c) 2017-20 Linaro Limited.
> +// Copyright (c) 2017-2022 Linaro Limited.
>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
> @@ -822,6 +822,7 @@ static const struct of_device_id cci_dt_match[] = {
>         { .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
>         { .compatible = "qcom,sdm845-cci", .data = &cci_v2_data},
>         { .compatible = "qcom,sm8250-cci", .data = &cci_v2_data},
> +       { .compatible = "qcom,sm8450-cci", .data = &cci_v2_data},
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, cci_dt_match);
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
