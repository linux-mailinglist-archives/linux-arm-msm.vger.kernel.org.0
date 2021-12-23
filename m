Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8518F47E16A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Dec 2021 11:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347696AbhLWK1d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Dec 2021 05:27:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347694AbhLWK1a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Dec 2021 05:27:30 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC92C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Dec 2021 02:27:30 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bt1so11335073lfb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Dec 2021 02:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FDXsgKOoTC0q+ZnPlG+PCc/AJYG+mE28/srh5yr4CLI=;
        b=dTryiANAh9vOixNH+1f3004ro9282yDTP5uZ10tkYeMRZwtM/dqSZ2DGm/1kQSDuD0
         29z80HHSax+eYX8OC/lHJKF5hKd3JiGRJvEdWomgv1iXxC6/GBsHR74lMvOlN/5HqfG5
         7P7XJ8mo34ZzlL0dcdGCkIimKUv1maTmfjX7k/uqCGTPImoUarRNKZMXwYcSs3o9l0ur
         xgyi5Kk0pdhirvS1mIRDhWxB0/xSYZPk/e/hAIvHIL5zCziYLSbfCpBOqQYHrFYJPneX
         5OuShoQRapqo+sFzcQ0kP2FSFBN7AoumxhAyOFP13u5qqlv+B7++U5cQcZ6c/k2ZpxLg
         zugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FDXsgKOoTC0q+ZnPlG+PCc/AJYG+mE28/srh5yr4CLI=;
        b=sAp4CnGGd+zzHLHnCQa4ZqMpc3A6jdqvyULm+8scgYEnYkGbxctGjdqrPkHF+fbMgd
         J1mBxbrpLMzOoOlQnYBcPH/Qr86BEtyTYY3b+ETrwFoI+B7Y632kun4GOOP4q+LBCy78
         V93uF00kjxHIaHGNL+DGrV46nZX4wCoj3Jmg6hq2WFgDjnvV1OPjZnpg0DV9HClFfvTh
         +o80EjvKNgyCOl3sbqd1aTx9wSVR3kZQ/wcxTPkay4lGwdqBtfhoAwitfeSnfJyr+XMt
         QY58/X0O9ou1vufIA37GHeMqWwYBxJ9repv9whN+KM08DWyL3w9agF0zPepH5vXTzM7/
         AfxQ==
X-Gm-Message-State: AOAM530TO2shw1s6FsbSK/nXwJJD2p6MlwDk8ScDK7qiPdrZHHdVsHcB
        xYVSSt9RlMUiq8/4OLGQaKO/r8efJE/4oUVOpYMXdQ==
X-Google-Smtp-Source: ABdhPJzUYT7CsC28VFkRuW6TRZ6UkvPyH1OX3mLRGZuvaYdPDEKuRfKGlne+AnKhUN7tpyR5q5gxKXIugFuGsM2A9Lo=
X-Received: by 2002:ac2:4c46:: with SMTP id o6mr1403306lfk.373.1640255248398;
 Thu, 23 Dec 2021 02:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20211223083153.22435-1-petr.vorel@gmail.com>
In-Reply-To: <20211223083153.22435-1-petr.vorel@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 23 Dec 2021 11:26:52 +0100
Message-ID: <CAPDyKFosa+V8E3pRBcwzOp48KfXZvLVmwCAro66gsWKZdAMmag@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mmc: sdhci-msm: Add compatible string
 for msm8994
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Dec 2021 at 09:32, Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Add msm8994 SoC specific compatible strings for qcom-sdhci controller.
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Hi Petr,

Can you please re-submit this to linux-mmc too, so I can pick it from
the patchtracker.

Kind regards
Uffe

> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> index 50841e2843fc..6a8cc261bf61 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> @@ -17,6 +17,7 @@ Required properties:
>                 "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4"
>                 "qcom,msm8916-sdhci", "qcom,sdhci-msm-v4"
>                 "qcom,msm8992-sdhci", "qcom,sdhci-msm-v4"
> +               "qcom,msm8994-sdhci", "qcom,sdhci-msm-v4"
>                 "qcom,msm8996-sdhci", "qcom,sdhci-msm-v4"
>                 "qcom,qcs404-sdhci", "qcom,sdhci-msm-v5"
>                 "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
> --
> 2.34.1
>
