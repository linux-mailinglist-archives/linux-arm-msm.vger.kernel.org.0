Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F143F51C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 22:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbhHWUMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 16:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbhHWUMr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 16:12:47 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77BCC061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 13:12:04 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso7907449otv.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 13:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=POiwHJcH23QK5EMwQWZLBbZ3EMO9rr1bfufNeMb6Dtg=;
        b=Zwa/jYiq9ajQMhNpRT/4QSrtThvXd2nt92BHoxA5m6czWSb3MotJ8TSzKMo7lWmHjP
         iz8x0+Ty+Mf4E2VooQpEgfOkpzzMMIF0eQaC4RZ42FsjK3KkpXiGG1xFloZiayXa2/e2
         YHegKFwlOEBOBi5eARqw1xAHWPN8FURvGpZno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=POiwHJcH23QK5EMwQWZLBbZ3EMO9rr1bfufNeMb6Dtg=;
        b=FbSeGCNHaD+C+8+IgQG4KVdrREaLIaAaeEAIskxmmLfNBvlYe4zKpw4EQVHo8DnQzZ
         kf05hidai2d7wP4s2UjHTlLWTG0cK9i9rhHQHIW5v0qSCaloPDBHUvXEl8Wwk5NySkMI
         rSPAeIJFdC5RO2hOdVK9G9tJ45X4GWQdmZYHrbbukQBskUf9fFuYSNClGQiOVqFYpV8a
         1muemnrV4+UPa6FPUSrGZqJI6TENpXDLBmq2v9p2819qJrGMBucMWawDg7gijX8uvozA
         CzXQ4YBZE5l1IrNPTd8o8XLcXPkEiBM0U+/woTMtGr76J3EJYmFXfcg9gw5qHxFcSg4y
         8Zag==
X-Gm-Message-State: AOAM532/S7LyleNbox8CUjqNeVa/bxuwtwqfye527VSTqXLMVorPmgVE
        Ff9tt2xRvSJaxKsklsu3SukJ8Z0oneSW1cgLAvlXWg==
X-Google-Smtp-Source: ABdhPJwex7Sxwx8tVMxehFbfF/8WWkSlhNesrH+dQz9oiKkGffOPqfeYUCY9Hqs1Ac+eg4X+WB0Dtfd+ojZu+YfTLcM=
X-Received: by 2002:a05:6808:181a:: with SMTP id bh26mr258227oib.166.1629749523660;
 Mon, 23 Aug 2021 13:12:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Aug 2021 15:12:02 -0500
MIME-Version: 1.0
In-Reply-To: <1629344185-27368-11-git-send-email-sibis@codeaurora.org>
References: <1629344185-27368-1-git-send-email-sibis@codeaurora.org> <1629344185-27368-11-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 23 Aug 2021 15:12:02 -0500
Message-ID: <CAE-0n50_nRZc+YCYwFdBe+4oMpxovQgiF9e_ciDwAJussUAwmw@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: sc7280: Update Q6V5 MSS node
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-08-18 20:36:25)
> Update MSS node to support MSA based modem boot on SC7280 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>
> v3:
>  * Place remoteproc_mpss node in alphabetical order above pinctrl
>    section. [Stephen]
>
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi |  7 +++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi     | 19 ++++++++++++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 103d89c1e1c7..f1c8641b0c26 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -263,6 +263,13 @@
>         status = "okay";
>  };
>
> +&remoteproc_mpss {
> +       status = "okay";
> +       compatible = "qcom,sc7280-mss-pil";
> +       iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
> +       memory-region = <&mba_mem &mpss_mem>;

Nitpick:

	memory-region = <&mba_mem>, <&mpss_mem>;

would be better as it indicates that &mpss_mem isn't being parsed when
&mba_mem is being parsed, i.e. they're independent phandles.

> +};
> +
>  &sdhc_1 {
>         status = "okay";
>
