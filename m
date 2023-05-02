Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC5096F3F1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 10:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233812AbjEBIbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 04:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233723AbjEBIbA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 04:31:00 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A43469D
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 01:30:59 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-b9d8e8898eeso5237427276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 01:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683016258; x=1685608258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M5H+/Rm5qbtJ4dIdqMTXfShqYluqFFrGEQJ+3vG1k/0=;
        b=k0ybPB1xZnsRzjE9uxsaLa3Y8YJel2TI9KYrfYu3ljKNEolwUFYqm+THgsx/O+pWyC
         AQIEW9g78m/azzRz2AmN6kzRHwRDsf0N7mkcNscjJ29WanD1LxM3ss0wl51bB2TWgF+8
         6XDkS4c9Z5WAonza3c1cCsTREmRa+S1rWHZHoxNNVHAbGUAymA5Jnqf7eE0Meq1haR5s
         2JNPpcw0LjhserbAuCiZS7in0dlqg3KT/hZYEeeEVNsro3TOTdXhxz1rvgB18XfRMlmy
         bSB8894esk49EnDBGXVxodqZDndgop+LzB9Vtecdg9tSfuXL3tcnQG1S6qz3Bs4a+4hh
         OZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683016258; x=1685608258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5H+/Rm5qbtJ4dIdqMTXfShqYluqFFrGEQJ+3vG1k/0=;
        b=YfCnhE3If0atGf7WLESMR6mRnjHoxznqe7Ru/WOTCGyMNYnxvQtuKl+hzlPznSmVKM
         YvJpUEPYZiqtI9LFsRFsNbU7pXP+t6zXw8dY+SJkkcj8DsQgxvGk3vadM66GJWJfFIdQ
         XUAXlz2DyMScKL51x9RmzNz5Yv4QA5yzQKR2DFytTv197Q0z0CThNlLyU7Kfd+HGSRAx
         nSvw4S6xThXYe0Ln0vbJsJKPHqMg3WYGZt6p+PdD/ET567Pix005KJcITsI90GfYIZaZ
         LAwj1/B3lbqdcKXPzVyqcZ3/V7P9848iw+B60r9am+MnjN863ikHZvSOpz6e3aXDwIR7
         YVoQ==
X-Gm-Message-State: AC+VfDySetzjeuPtyZFuul55Sz3p6DjIpr0H8kObioYe9Jz0NfoAH9R7
        uFyR65SLg+JHhu7ygbWlc0AUPTXV4yc6y4nAvDFmvg==
X-Google-Smtp-Source: ACHHUZ7Ytf30ch8se73LYe26Pqq1R7v3NpXReeiPnVBOxwOSUZAWV2rS0dN+5NiOu4gcx3/Kv7BabsWJ19Ut2dMnBSM=
X-Received: by 2002:a81:d354:0:b0:541:694a:4c69 with SMTP id
 d20-20020a81d354000000b00541694a4c69mr17244580ywl.52.1683016258565; Tue, 02
 May 2023 01:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230502053534.1240553-1-bhupesh.sharma@linaro.org> <20230502053534.1240553-3-bhupesh.sharma@linaro.org>
In-Reply-To: <20230502053534.1240553-3-bhupesh.sharma@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 2 May 2023 11:30:47 +0300
Message-ID: <CAA8EJpqgmgNTHrXMyejk3-LV7wKo1tHSdixE+xJMhq3chy+B_Q@mail.gmail.com>
Subject: Re: [PATCH v10 2/4] phy: qcom-qmp-usb: add support for updated
 qcm2290 / sm6115 binding
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        bhupesh.linux@gmail.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, konrad.dybcio@linaro.org, kishon@kernel.org,
        vkoul@kernel.org, krzysztof.kozlowski+dt@linaro.org
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

On Tue, 2 May 2023 at 08:35, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> Add support for the new qcm2290 / sm6115 binding.
>
> The USB QMP phy on these devices supports 2 lanes. Note that the
> binding now does not describe every register subregion and instead
> the driver holds the corresponding offsets.
>
> While at it also include support for PCS_MISC region which was left
> out earlier.
>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
-- 
With best wishes
Dmitry
