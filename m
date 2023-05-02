Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6E16F43C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 14:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbjEBMZR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 08:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234243AbjEBMZO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 08:25:14 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28AD04C2B
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 05:25:11 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-55a5a830238so18839637b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 05:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683030310; x=1685622310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q4Hw5C2nBtTZEgNPrdfSn+t6iOR/tfBPufkhXcH+Kxg=;
        b=QQ4wxKtCss6/4ZKcVhJ58uIueD7f6I9RxpE+EjGkvaKQ7NCSo9GJkNcFeAMq17BqKX
         5XGp45Pg8BCDAPEAOZ0QokGy8QiQtRaMel18hgI8JcnSWOiMVRA4Z887w4td9DKo7rOE
         kWSjSfmlFWMCFK5/WWkwEvj0emiW0F1efObLgJ0w/pBQDXtTt8Uh4yxDP5kqgc+HeJhH
         ayr4pephHfHFTTiFzSe+89TldMyyXoqGmdvNEIiXVXIKldgNqLmJEkBc0ld0CTHSrQNP
         MrfoHNWJcyPmoeSeRT2Pxuit5hsfH2qtekwZ8psK8rRqveQrlFYPUDEbt16OZyeilFER
         vcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683030310; x=1685622310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4Hw5C2nBtTZEgNPrdfSn+t6iOR/tfBPufkhXcH+Kxg=;
        b=amWBBla9+j0aoLFvfs/brOZH0m3B46hexdyFt4ouct6mcxMzOn7jauEw5Mfyar0slk
         /c6EdeE+53gv5oIbtj0W/bWMY8+JTNJoodj+GgEAviChehzsCrB9VEHRneww75ti0DrU
         FpT5cyhFYTuwvveSnTECQn5ZA3dcPqhhxwBuKta5f+SR1mqh+yH927SB/wzuovDvZMhG
         IHAeshS/CUKl7TuHX9YAG3l1b6EAynn7Apk9oGOZf6gaTw8jc3XtT+Jblbdi0nNEBioU
         XMW2pNSN/NjXCLz6ekR2qTEXtI2d4set59vXHvudbfwNkw4ZLG4iEdEtU9Xb0rIW6gvP
         XUJg==
X-Gm-Message-State: AC+VfDwAT4NYZtvdj74aPV/A33ggJgsQDQr3z08wXezzjQURTEc4glrJ
        xzqqJWF2l4sIGicBPpTFa97U95Mmbxb3BY909IPG9w==
X-Google-Smtp-Source: ACHHUZ6v6SYwJgYmFk960nJNzc2XOxvg20x2ZYqapVYmLFWHnVY6odJTA9csZyCbabHxlhfojWaHkIb5SPxpM3Rt1AY=
X-Received: by 2002:a0d:c683:0:b0:556:ce0a:5a16 with SMTP id
 i125-20020a0dc683000000b00556ce0a5a16mr15407859ywd.44.1683030310357; Tue, 02
 May 2023 05:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230502103810.12061-1-johan+linaro@kernel.org> <20230502103810.12061-2-johan+linaro@kernel.org>
In-Reply-To: <20230502103810.12061-2-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 2 May 2023 15:24:59 +0300
Message-ID: <CAA8EJpppgFK4N61XT+=VXTfWYVjA16Maoo+hEo4YyaB7HfGiCQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] phy: qcom-qmp-combo: fix init-count imbalance
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2 May 2023 at 13:39, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> The init counter is not decremented on initialisation errors, which
> prevents retrying initialisation and can lead to the runtime suspend
> callback attempting to disable resources that have never been enabled.
>
> Add the missing decrement on initialisation errors so that the counter
> reflects the state of the device.
>
> Fixes: e78f3d15e115 ("phy: qcom-qmp: new qmp phy driver for qcom-chipsets")
> Cc: stable@vger.kernel.org      # 4.12
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
