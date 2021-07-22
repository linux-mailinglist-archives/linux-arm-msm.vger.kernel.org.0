Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0088D3D2FA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 00:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhGVVf2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 17:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbhGVVf1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 17:35:27 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 166A2C061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 15:16:01 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id z6-20020a9d24860000b02904d14e47202cso276969ota.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 15:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=1P30anYGrbFMw8Dp6P2ZgzncSWQNEGgjr9q3x/GFEIs=;
        b=C1SUrjiuWpaElT428BGbbipfB4DWr1I5leetlyAHwKQsjc7oO8bVG8w69NH4QKnIXg
         KVftEoIKILx962hypPEJx7xVs1j6Gs4X6vcOnS9LDrRAItrGM6v71uEBu0WmvVFc7gyT
         T6U+S06UAygOVgK968qPysINuSZCtc9Vm2TuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=1P30anYGrbFMw8Dp6P2ZgzncSWQNEGgjr9q3x/GFEIs=;
        b=A30Zo50x3NUlJJ67WfC43j1wL1cOfjRZi364c1KlJFTpdgeUuIDyqr93yJqbfXISZ6
         Qdmt0hciDOhrZUWkOz9gjYbGUEsPfpm0FvNZXULuUp/nGY39imlLyF+RGRkmmUPEirBv
         xEPAf+Ik770Abj+NLeAn7SgvbOSDXe1zGR3nuNo7m8k1lrBUjww9JddztcXSUlnNePVo
         SfwDgQpQQvRH0mO2t42XJKD5cgahsKsubjc2ut5jHDb42oeHad4EJfw4GuCVo5qVy1OM
         klLneNu/bPB5TN9pST7mY262yY/sOkLZVfLKbfRM+/rEDGWahcwZcjXxF4ZPMFbv/1JV
         HyMw==
X-Gm-Message-State: AOAM5304lrEahjqqVDbRt6hGx1meYbh8sVo9bGBtxLg72wRgg6eRENSc
        Gm5MJ7yFpMnJnFR7xpr480fIMMu8vXYJ43nmfb4sNg==
X-Google-Smtp-Source: ABdhPJxt5t5ka2lveLWssMiuxjw7+jYSepg33qJk0qaGv+6PNa+XJlnwapS9S7t/4p+6FpuN8HYaHmqlewv0QmKEkWg=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr1220198otl.233.1626992160462;
 Thu, 22 Jul 2021 15:16:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 22:16:00 +0000
MIME-Version: 1.0
In-Reply-To: <1615361290-19238-2-git-send-email-pillair@codeaurora.org>
References: <1615361290-19238-1-git-send-email-pillair@codeaurora.org> <1615361290-19238-2-git-send-email-pillair@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 22:16:00 +0000
Message-ID: <CAE-0n50=diAroo1FJMG_7_RbRmbyhkZpw+aCY4QDqpzg7uoWqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc:     sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rakesh Pillai (2021-03-09 23:28:09)
> Add WPSS PIL loading support for SC7280 SoCs.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,hexagon-v56.txt       | 35 ++++++++++++----------
>  1 file changed, 20 insertions(+), 15 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> index 1337a3d..edad5e8 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> @@ -9,6 +9,7 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>         Definition: must be one of:
>                     "qcom,qcs404-cdsp-pil",
>                     "qcom,sdm845-adsp-pil"
> +                   "qcom,sc7280-wpss-pil"

alphabet sort please.

>
>  - reg:
>         Usage: required
> @@ -24,7 +25,13 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>  - interrupt-names:
>         Usage: required
>         Value type: <stringlist>
> -       Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
> +       Definition: The interrupts needed depends on the compatible string
> +       qcom,sdm845-adsp-pil:
> +       qcom,qcs404-cdsp-pil:
> +               must be "wdog", "fatal", "ready", "handover", "stop-ack"
> +       qcom,sc7280-wpss-pil:

Alphabet sort too?

> +               must be "wdog", "fatal", "ready", "handover", "stop-ack"
> +               "shutdown-ack"
>
>  - clocks:
>         Usage: required
> @@ -35,19 +42,17 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>  - clock-names:
>         Usage: required for SDM845 ADSP
>         Value type: <stringlist>
> -       Definition: List of clock input name strings sorted in the same
> -                   order as the clocks property. Definition must have
> -                   "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
> -                   "lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep"
> -                   and "qdsp6ss_core".
> -
> -- clock-names:
> -       Usage: required for QCS404 CDSP
> -       Value type: <stringlist>
> -       Definition: List of clock input name strings sorted in the same
> -                   order as the clocks property. Definition must have
> -                   "xo", "sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
> -                   "q6ss_master", "q6_axim".
> +       Definition: The clocks needed depends on the compatible string
> +       qcom,sdm845-adsp-pil:
> +               must be "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
> +               "lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep",
> +               "qdsp6ss_core"
> +       qcom,qcs404-cdsp-pil:
> +               must be "xo", "sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
> +               "q6ss_master", "q6_axim"
> +       qcom,sc7280-wpss-pil:

Alphabet sort too?

> +               must be "gcc_wpss_ahb_bdg_mst_clk", "gcc_wpss_ahb_clk",
> +               "gcc_wpss_rscp_clk"
>
>  - power-domains:
>         Usage: required
> @@ -65,7 +70,7 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>          Definition: must be "pdc_sync" and "cc_lpass"
>
>  - reset-names:
> -        Usage: required for QCS404 CDSP
> +        Usage: required for QCS404 CDSP, SC7280 WPSS
>          Value type: <stringlist>
>          Definition: must be "restart"
>
> --
> 2.7.4
>
