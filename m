Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041E63CBC9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 21:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232947AbhGPTei (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 15:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbhGPTei (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 15:34:38 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F382CC061764
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 12:31:42 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so11024513oti.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 12:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=/XzjQ3hrT1h6mwJfiVdsgdMHQh30ZOTfHqhe4pDPAFc=;
        b=Z6K1RaVI1ceFMzC3AvNoZAO+R2p/p6Ol+5P6/qyYUGWKuVBe20+XeDO5Qnhae3Ll3E
         jvep7E0deaHxTY37gGGEPNQTZwlJBY3AL3rzot/zzhpGXe90sOKfybg4z34EO8fTzxKx
         2GPnei4KDxACl8dt1yCV8ev2UNDGvZ2pZ73Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=/XzjQ3hrT1h6mwJfiVdsgdMHQh30ZOTfHqhe4pDPAFc=;
        b=VeJEcIU7lLPr9yxfpaX+PC3jZCdYzCWXhY4oZprCw+o7iBcQ79OS9dgLjFQNWM4xmD
         QsKnIYxWI8PG1VrQ3+pbQmrYSYnV1/GOkpCVPEOhjgSMDhrtAHJR6v3HFLoT6CIm3800
         HS8teSLMGwRd1R4gmgPPu/JBVv773p4B8VW66edgfQ8WRit54e2t61IuBti8pp/OiO+G
         Dt+sWPmwesgaRZFqSP9wcErI0QycYrCJJsOLiqHM50nPH3OmrAkJLnD4q/fNVJbI8+Zs
         BPTklu+ivNEGhYTYrh+1nvXCXBPImzSBFClXPrzP1XI2DJGaLv7rzz+pVa9rHH4Seoz/
         gVtQ==
X-Gm-Message-State: AOAM530gKf/6+X2dbJXmq4HoLMw1WT1T659O1qRLcZ6bQAqd/aj+bWzj
        mZ0xGCqIcKzDf3E3jKGm9PL7fl1+kDf70hdYvufSYg==
X-Google-Smtp-Source: ABdhPJzQwM5RPFiII+LtE0CwZjRVpF8zxHa5i+kGr1DzmTt77SNBsgiIRAwe0LeNJBUpuSEMP64BgD4Ps/ZjjhoJ2M0=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr9386454otl.233.1626463902381;
 Fri, 16 Jul 2021 12:31:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Jul 2021 21:31:42 +0200
MIME-Version: 1.0
In-Reply-To: <1626443927-32028-3-git-send-email-pmaliset@codeaurora.org>
References: <1626443927-32028-1-git-send-email-pmaliset@codeaurora.org> <1626443927-32028-3-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 16 Jul 2021 21:31:41 +0200
Message-ID: <CAE-0n506Phfr=HBYgg+KDHaDAN7+GqmJSeviv7mpY=x973yd5A@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org, svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Prasad Malisetty (2021-07-16 06:58:45)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index a8c274a..06baf88 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -15,6 +15,7 @@
>  #include <dt-bindings/reset/qcom,sdm845-pdc.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/gpio/gpio.h>
>
>  / {
>         interrupt-parent = <&intc>;
> @@ -546,6 +547,118 @@
>                         #power-domain-cells = <1>;

Is this the gpucc node? At address 3d90000? Please sort the nodes based
on their address, so this would be 1c08000 which comes before gpucc and
some others in this file.

>                 };
>
> +               pcie1: pci@1c08000 {
> +                       compatible = "qcom,pcie-sc7280", "qcom,pcie-sm8250", "snps,dw-pcie";
> +                       reg = <0 0x01c08000 0 0x3000>,
> +                             <0 0x40000000 0 0xf1d>,
> +                             <0 0x40000f20 0 0xa8>,
> +                             <0 0x40001000 0 0x1000>,
> +                             <0 0x40100000 0 0x100000>;
> +
