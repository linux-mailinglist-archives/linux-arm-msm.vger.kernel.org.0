Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6921FAF4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 13:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbgFPLdm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 07:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728332AbgFPLc5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 07:32:57 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBF8C08C5C3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 04:32:53 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id u17so11226149vsu.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 04:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1C4xlbOuF8hLryefQXY445HSGUPqVPlV2H+ODb1eYxA=;
        b=ceofJhQisogT8djGC+30R6rH9kr18j8pEGv0o3E7GDSHGgQsSPhVHRc6HbNfK958xu
         Itwe4tAW3ORMqnAngeF8gkzFFaOMZ+PuMRuNbeq1hm9SVEJcJNck70qMbwnLCKDIMlNK
         /jgfIu08OHf/QouS/AlteiIEFOgmx33pDwImiI0lLCz+ZVTubelWtLR6UiwyA/uYTrPL
         56pr8YjveJBuLa0t/dg3sUzoeT7Pms0qMYcEYTQvVfjf7+kznUMrxFnXAwL3Mvy4ajRD
         ZW/bUsx8bXFvw78umR4r3LHiGZaV/Rg2LKkR8p3RWfvImjI/zmJOBvmLpVJxu6zHMuJ0
         f0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1C4xlbOuF8hLryefQXY445HSGUPqVPlV2H+ODb1eYxA=;
        b=qI+r6Lw7rG4f8ZIpavWLlkg5iuH/SlIsd1e/LcmE3iuhq5ZqAQfEMptzhPIpK3UGRA
         /BmTpk2BMMQYTryMwKd1SXT1awIXmixZDfxEFsvokGvIAiorKmA+3z0p+cBHyPcDrHsW
         G2KD1t5PgGFTNMi07DUnUCbeMVz6PEj44W8iLAHeTbSYBlu8Jd2/wj06NART7BJZ88Ye
         VBfuZNGNXyBnEqsFTGPv3dJqCYd8jjh1bi0hQTkh7g/t9sa5oewu6qZ6utGwoCmZ3vgM
         Q9SAICkbmgK759O+sBJxAleWotPs2NLcrnCV1/ADniN6bfQHcuIhMPgd5DHFDjQ243TV
         lkkA==
X-Gm-Message-State: AOAM531e5LQfy8gcuOeTW1Ja7IgzF2TuERpvbLX/rDLAC0KfASQNq3II
        SF5WUF5EGC8v3IvQQ/8iDc05/1//GNE3QZ0UrXzw6EDLMWU=
X-Google-Smtp-Source: ABdhPJw63noGBljzHWsWI4sYYIst23+5lAqRC5OLkTcOQ4G7Dp0cAbxMHpwylGBv2AxyVk8ZHK1Du/uSYKkWqtndx84=
X-Received: by 2002:a67:db88:: with SMTP id f8mr1115288vsk.165.1592307171958;
 Tue, 16 Jun 2020 04:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <1591691846-7578-1-git-send-email-ppvk@codeaurora.org> <1591691846-7578-3-git-send-email-ppvk@codeaurora.org>
In-Reply-To: <1591691846-7578-3-git-send-email-ppvk@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 16 Jun 2020 13:32:15 +0200
Message-ID: <CAPDyKFr8Ge617QchXG1cMgZUvPZ+fRUpJamv173h1faz7-0baw@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] dt-bindings: mmc: sdhci-msm: Add interconnect BW
 scaling strings
To:     Pradeep P V K <ppvk@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-mmc-owner@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>, sibis@codeaurora.org,
        matthias@chromium.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 9 Jun 2020 at 10:38, Pradeep P V K <ppvk@codeaurora.org> wrote:
>
> Add interconnect bandwidth scaling supported strings for qcom-sdhci
> controller.
>
> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> index b8e1d2b..3b602fd 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> @@ -54,6 +54,21 @@ Required properties:
>  - qcom,dll-config: Chipset and Platform specific value. Use this field to
>         specify the DLL_CONFIG register value as per Hardware Programming Guide.
>
> +Optional Properties:
> +* Following bus parameters are required for interconnect bandwidth scaling:
> +- interconnects: Pairs of phandles and interconnect provider specifier
> +                to denote the edge source and destination ports of
> +                the interconnect path.
> +
> +- interconnect-names: For sdhc, we have two main paths.
> +               1. Data path : sdhc to ddr
> +               2. Config path : cpu to sdhc
> +               For Data interconnect path the name supposed to be
> +               is "sdhc-ddr" and for config interconnect path it is
> +               "cpu-sdhc".
> +               Please refer to Documentation/devicetree/bindings/
> +               interconnect/ for more details.
> +
>  Example:
>
>         sdhc_1: sdhci@f9824900 {
> @@ -71,6 +86,9 @@ Example:
>
>                 clocks = <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>                 clock-names = "core", "iface";
> +               interconnects = <&qnoc MASTER_SDCC_ID &qnoc SLAVE_DDR_ID>,
> +                               <&qnoc MASTER_CPU_ID &qnoc SLAVE_SDCC_ID>;
> +               interconnect-names = "sdhc-ddr","cpu-sdhc";
>
>                 qcom,dll-config = <0x000f642c>;
>                 qcom,ddr-config = <0x80040868>;
> --
> 1.9.1
>
