Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7DC5EF34F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 12:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235052AbiI2KTi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 06:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235223AbiI2KTD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 06:19:03 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB3414A7B3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 03:18:41 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-354c7abf786so9984337b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 03:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=xIBSn4ztR5ROz6GRB0axkNF5Yod6vvG1hBCcQxzJkTU=;
        b=vXZ4OhLwR3SENX+ujRusbFRUJC74NHXWWc/G0gw3IeNRB1EkqtQeFK5NHY6GWb56hQ
         Bt4ca1I3PDbVMJrwAqgEtCdKphsSI1X1JDiis5T4gtY4mZNJyQOskwk9RXIwdPQNij25
         9ulJ+ol0TRNBkwj4wbBez1iZFr+mdEagN/RrE/Gl2m14/zUZO+BA5rFu1CXf6jDgU4CW
         OWKqXNdzHoaOpplyU1OKsJLPMCMl97EbUE9iaNtBU/9sh1KVV3Yhq5bT74cMish+z0hU
         cg8xFUteACql9ntv68Yk+3DGstRuZYmSygwDvj9paAPSM3+mBlzxGEWqMj5Q4Uv+1G1D
         kCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=xIBSn4ztR5ROz6GRB0axkNF5Yod6vvG1hBCcQxzJkTU=;
        b=uUJLHdKkWmN25PFYDRzy7e87vOqpTy9d7ZXI6KyTfPQ/rGYUjU9tGL1IP73wlUol1t
         GWc7ge3ZvjZq1fvWDyhbcfM+dxYq/7kP7rXoLFmgJw44l0eeX3YS7dpwG81flUb91S/A
         EZtk5pXsaKSrBBOhPdrx6SQ+J+2Z3KuYJ2N8dL30dCCFciioW1PV3THO+4MJi3nHzMj/
         16VQYKbN0oQkoDVU2TFzwrU4OnOlN+2KJV+mn4v+NOzgHTQh7AsvrSprvV40GIx9tfDG
         /pFDgaIbnqDOzjNUPtkoLMiXAc3W49hcXkIp7eqyY+o6Kl0IDQojWNFBeGLGH05jLg6Q
         Z3+w==
X-Gm-Message-State: ACrzQf3glWmUAl27wEiUmtnGFNR3MoFaa3XKDLQ17sljqM8G7hxy4iku
        /TC/IyJ/HEepAoK/PUU9OglSqLdhQ4w1so+vpGCNkw==
X-Google-Smtp-Source: AMsMyM7nAd9fHTaBaOo32n0H5li8V6GN8ddJbCs/NfzNeuXPCQzg5zRe4XG4V3AvJYADKgSf9Y5X3hxf+ELXjuj8PGY=
X-Received: by 2002:a0d:d68a:0:b0:350:a7f0:7b69 with SMTP id
 y132-20020a0dd68a000000b00350a7f07b69mr2458883ywd.132.1664446720102; Thu, 29
 Sep 2022 03:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220929092916.23068-1-johan+linaro@kernel.org> <20220929092916.23068-9-johan+linaro@kernel.org>
In-Reply-To: <20220929092916.23068-9-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 29 Sep 2022 13:18:28 +0300
Message-ID: <CAA8EJprGB8+6=zJAsWhmqsoBEczmJ5A5FWbsB3RtNxeXtUQmYA@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] phy: qcom-qmp-ufs: clean up power-down handling
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 29 Sept 2022 at 12:29, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Always define the POWER_DOWN_CONTROL register instead of falling back to
> the v2 (and v4) offset during power on and power off.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
