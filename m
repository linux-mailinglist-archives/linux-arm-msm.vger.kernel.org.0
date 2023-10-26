Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 635C47D84A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 16:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345222AbjJZO1l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 10:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345187AbjJZO1k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 10:27:40 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD7D1AA
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 07:27:37 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6cd1918afb2so508000a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 07:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698330457; x=1698935257; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GhsfFnZU92WVFFrLtVVI1l5X1Oa/Mn3OJb2wIrC8HxY=;
        b=S8A3L/KFwrMW1qgZRTEsPZ+r1M+Gs9TSGv+0/fHkUsYmXv+SFlJVlixeTztoACBq5h
         0niVURbFcYmck7HJoM8FOnPsYMg74H1bEoif/2fyVyavTQtEwda/xQOaBInE+k+QDAwH
         nf7zj3atpindmcvfQAhnmhTgqQzXGgblTD/ZbFPcZiYkHIDQfHJdic8mgEY+QikyBT7i
         d93ZmwcDJkuh79+DjPEF0dp4Ero3xMUgeTsIGobEqQqfsKhB5X6o1qOWT/HZS0t3CZhX
         Hoj2/CmsfYjeJi9cJpqTgDTlfT4hMf2GeWV06emR+bsCqLFXisMNonUGBckeC2EUywaJ
         5sVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698330457; x=1698935257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhsfFnZU92WVFFrLtVVI1l5X1Oa/Mn3OJb2wIrC8HxY=;
        b=j1npArlYCRzBxl3VOUUZH/MFnKSZcWlUjMyULZolJPpdeXzgDsTOxMl1kWoC1RL/QU
         zF5MekFZTxWaYxRhRlcrpKOEXO/fa0BbWnYEAXaLZo36RC4oQGAXk0KcsnJlntg9uPFV
         2RE4cpo/I1bGqXnXzKXnj3/RDwgt5jHhNdUant4UYR5nVGZ+QDWC8+zbKc8ADkcMcvll
         rdGORO6zZmB2tNvr0mt1SOecmBbw96AhOYw7GLivddDO0rp1t6ZvdIU/AbDm3muxTY2x
         VYiabpfDxWUJrcOAST6ZKKMiHC+RVcsnLsSa0I7eGaV89cotmuCBbkujkOB4RkO5wgZI
         ie3A==
X-Gm-Message-State: AOJu0YwF87Ydn/39cWQWoFa5NYFXwttIQkW9VreAP3geEv368aaez74U
        DAfQQBetpuG8KWxFnL7CfXmrBzfG5M7z2rsJVYYw6zYustKhHkLi
X-Google-Smtp-Source: AGHT+IGxE2Xrpad4dfWbz2DEnioRFB5E9UqGa5TGGzFeHITk4UUxpgjyIjrhQGMQUGjqU0chVHmctgxOD1J/cdNLLec=
X-Received: by 2002:a05:6830:910:b0:6b9:c4b1:7a86 with SMTP id
 v16-20020a056830091000b006b9c4b17a86mr23867125ott.3.1698330456853; Thu, 26
 Oct 2023 07:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231025-topic-sm8650-upstream-rpmpd-v1-0-f25d313104c6@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-rpmpd-v1-0-f25d313104c6@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 26 Oct 2023 16:27:01 +0200
Message-ID: <CAPDyKFpXURm-kE-mhgyU7bO4EeApKA6PSrmcNp4a_39Eba-Lcg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pmdomain: qcom: rpmhpd: Introduce Power Domains
 support for SM8650
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Oct 2023 at 09:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add Power Domains and Bindings for SM8650 platform, it uses
> a new NSP2 power domain.
>
> Dependencies: None
>
> For convenience, a regularly refreshed linux-next based git tree containing
> all the SM8650 related work is available at:
> https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm85650/upstream/integ
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (2):
>       dt-bindings: power: qcom,rpmpd: document the SM8650 RPMh Power Domains
>       pmdomain: qcom: rpmhpd: Add SM8650 RPMh Power Domains
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                     | 30 ++++++++++++++++++++++
>  include/dt-bindings/power/qcom,rpmhpd.h            |  1 +
>  3 files changed, 32 insertions(+)

Applied for next, thanks!

Kind regards
Uffe
