Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41FBF43A4AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 22:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238640AbhJYU3B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 16:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236677AbhJYU2x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 16:28:53 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB66C0432C1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 13:22:49 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id q129so17318882oib.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 13:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=MIgjsnj2t5G4/nas/d5Scx9CJRo0MWjSv4YqCCkr6zQ=;
        b=dMlhV3hi8OeiZcg3u0Od1E9kdTBADg502uY9rRfMB/wWqyLxgWb0NYx6fm8W/3TSmJ
         j1Gon8iuUGR9+woMRKq6atAqAsTCF6m842fySCF01wJK9WyzW1am7v0+GIS0QtjOwbde
         /D/jfKCyBO9A4EfaExNL259Yt9BnHAgOnDSFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=MIgjsnj2t5G4/nas/d5Scx9CJRo0MWjSv4YqCCkr6zQ=;
        b=jLH5q7HMJfaGRN72XeqzgljcH6HxnAzjQgr8IfRxjDnjUMtMx5zA+wtCayXRJ+MHdx
         ZJVkbB1J9i4VltF+ADDtXQ+Jl4vEfrA2oAp1ChKVjVHFykfy4by0GUYJRP1mSe78NI9j
         J46ezz8eA/JAHxujGfaIbK4TmMybUb5VIb7Zj9/owGauEyw4J/wb7TIkpW5T5+AFFYKG
         9l66GtXTRw7WpE5G9nbN8EiwpqcScLxKtjTYBpUkpJiNPW6L/bhFz4fQsnVnGv/tyhcM
         NTQVOzQQdzR5r+bGs4EUlxx3JvhIXqUcgRB+R32amugMmPdkOgVPqxJUiov8N62pSwMw
         sZcg==
X-Gm-Message-State: AOAM531LSIWkVvaL2JBKYtWsuC3EJgXDOWqtezZo8e8X3mqHeSRtvFV7
        zl+rmyyAOVmvuEoHXwRkxhwCTGv+0xyy1t7qVgAhXQ==
X-Google-Smtp-Source: ABdhPJztxG/yxrPY5e4sNf62Kn1bNHGpMkkmYXAFUoysctVppmYp6RlKF3Y/ERcj27cwPr8knlXHCorAw/g5RhQ7LpA=
X-Received: by 2002:a05:6808:23c2:: with SMTP id bq2mr25087505oib.32.1635193368630;
 Mon, 25 Oct 2021 13:22:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Oct 2021 13:22:48 -0700
MIME-Version: 1.0
In-Reply-To: <1635070162-21669-1-git-send-email-tdas@codeaurora.org>
References: <1635070162-21669-1-git-send-email-tdas@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 25 Oct 2021 13:22:48 -0700
Message-ID: <CAE-0n52rCpAHndio63yYeN7wnNO=u4c8iL9tpm-rA0reHLLOtA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add camcc clock node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-10-24 03:09:22)
> Add the camera clock controller node for SC7280 SoC. Also add the header
> file for lpass clock controller.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index d74a4c8..8e6b011 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4,10 +4,11 @@
>   *
>   * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>   */
> -

BTW, I see this line is deleted but that's probably not intended.

> +#include <dt-bindings/clock/qcom,camcc-sc7280.h>
