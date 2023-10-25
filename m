Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB8FE7D65ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 10:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbjJYI5h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 04:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234336AbjJYI5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 04:57:35 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22553B9
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 01:57:33 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7b6043d0b82so1947304241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 01:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698224252; x=1698829052; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7NldaKyDc0l1BbJHjiT+K+qAycYibl9MYvEsSpwfuMU=;
        b=bu6agC9AJkWErlYgwOWs+/Wxdel+ILJWbnZDXrvmTRckSJ4QuTtcBy/ZgCePZbajJV
         lGAKkRzLQIvLLdl9W0B+r93+a0sohZb1RplCWsSImuVu7TQo+lpIFBU28uPNvVJN77SO
         e7B4mp5qsT916OXZyl/8tmITihtwahrKOemIR+Ffw2JhvMfH0tdklZsQ7yjkx3/BX+MH
         Xhwxe/3IX4CptLECUonaqxvvNyKOm6lSUuQhyllvpedohTAuk7nZMy18VKgufLp1iOrN
         Q14Xt1tiG8Sw6B7313ehppOXdPUhlzAp7ojHSUo/MzXjNgqaJ4AJh0RKBF1NhMYR4mYO
         iFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698224252; x=1698829052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NldaKyDc0l1BbJHjiT+K+qAycYibl9MYvEsSpwfuMU=;
        b=JRHpNeFBGxWZcDnqwFdnpgUo8LXllz45hVxYJn+N/3FyBfY1amJX9IZ05i+6Go9Pr/
         HvlN5Qa31e5IQAHtdPhIJfaAT//Zt2/h/mcawzgSlJo9KEOLhfnLYoNki91RIxtcWlaO
         O7N/KT/jJSekFulbPO3a4H3g6UiQySqkpTedESTRjlG+1i9YSya0o1WnRAImhTxKW5i7
         AMTPz+AGYK4J6ZoHcoealovnMylNFKZDsLsnBTVvJ5af8vgKLCXRDaiKT70Lgm15ym5h
         TbvRtYLD6xaB50fqM+0nUN9M1UbFqEQPKSZ8VkYDr6u39Q58di/Lrw+3ATvXHW0Kjdd6
         3ADA==
X-Gm-Message-State: AOJu0YxOmvX3o+hMV3YhplTfL/yRl+/n661GtswROhDi/YprMVDnXPsg
        pY+enPAQogC+WvZC4gaPvkDFNmRcmTI/yDgoiogkOA==
X-Google-Smtp-Source: AGHT+IGhheo8Q9Df6KgUGR4PorlbsZsMr3I2+FSZpwFZ03w3W5uEdV5Ej71blcICjUAikq6NvJLTs/3FHZXoJH1v/m8=
X-Received: by 2002:a67:c313:0:b0:457:66e0:2c6a with SMTP id
 r19-20020a67c313000000b0045766e02c6amr14079783vsj.14.1698224252025; Wed, 25
 Oct 2023 01:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231025-topic-sm8650-upstream-phy-v1-0-6137101520c4@linaro.org> <20231025-topic-sm8650-upstream-phy-v1-5-6137101520c4@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-phy-v1-5-6137101520c4@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 25 Oct 2023 11:57:20 +0300
Message-ID: <CAA8EJpoxdVNvwbEyVVF65FWVQZwydXvePCTmurF_6G9taQRJfg@mail.gmail.com>
Subject: Re: [PATCH 5/7] phy: qcom: qmp-ufs: add QMP UFS PHY tables for SM8650
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Oct 2023 at 10:46, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add QMP UFS PHY support for the SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h     |  1 +
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h    |  7 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 86 ++++++++++++++++++++++
>  3 files changed, 94 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
