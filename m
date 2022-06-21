Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6A18553862
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 19:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352141AbiFURBm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 13:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235406AbiFURBl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 13:01:41 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D17D128705
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 10:01:39 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id x75so10564388qkb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 10:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ndYFg9yJFFsm+MchCSau+vce/mgo6x0ybmLOESsjBAU=;
        b=FGvOHsGGUGmDXbxdMzvu/CDu6NuiY5QvnTnk1/HR+gu1fNI5L26/9Wo9ifp221Wh3p
         wfKeopgo8ivR4mjQrM6YDmsy1kMjzCfUFIwYUgKPQjrdrOPWt9bn7KPMvrD2eyl5s8hJ
         CpVAFnNGoovLlcunn8PvM7fh49U2rQjSWLgpBzQGubxFdDFwUxuXzHM7R3eWIDrFAXte
         gliH8epLnJYwan5t2e4UUIuk68H9+WuoTE/X2nkFAS37sKR2kismFsaFDQ8rhVkXJpwe
         SHd0pNYbEBN3++NazBy5etqW1jy9y427VaLEReT1YH4C1QcTwkolxF4z00aJV2EVQfkr
         au+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ndYFg9yJFFsm+MchCSau+vce/mgo6x0ybmLOESsjBAU=;
        b=pPHPpUqZEg8U++7cw8Lk0DLif2oWiVe0HN0+W9mAmS1xYF+tXRRCNLgav6Xdaf9Gvg
         SFaAbH1AGiOEzGMRH+hmciScjfCdxtc9uGNyCuz8QL4SZ4O9QqdFiMDNalRFnC47iqTU
         n6MmfAvPyKjj7o/GpXMKk87KnurOY35OkuBucnWnszp9g2PEzYW6f9uzaNTXY62jszoh
         ayfDAaWAmXczpyWuLlvI1cmb65rWoKfjg2yX9RmXVGoSBmgh/X6g0mdXLn76MGJN+sFC
         yHxwfd7kfBJJmFCW9Bn8Wh+Cln5IYGRemaWZeXU/yudPFNiQhYoUXIoYqNF+GOIJ+2MI
         pgjw==
X-Gm-Message-State: AJIora/t/Fp3UajdVMZF7DX2vE7QoPaT5S8h/Y87tnf+C53o9BoSfJtX
        i5y7WZFnlAWpw4JPXMgh7B4mXcskNQIIlZg6SLuzdA==
X-Google-Smtp-Source: AGRyM1uXAP09+bwhOkQRsesIc4uC3aUOpDDew+bAcVuvJA0BtGFIEUAl8yeVqSD68KuR3Bs6PmzCsdahWfCGU4Cb8tM=
X-Received: by 2002:a37:a83:0:b0:6a6:7e4d:41dc with SMTP id
 125-20020a370a83000000b006a67e4d41dcmr20646327qkk.59.1655830897913; Tue, 21
 Jun 2022 10:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220621160621.24415-1-y.oudjana@protonmail.com> <20220621160621.24415-2-y.oudjana@protonmail.com>
In-Reply-To: <20220621160621.24415-2-y.oudjana@protonmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Jun 2022 20:01:27 +0300
Message-ID: <CAA8EJpqHBRHw4+0-P-KAT4JnAHkXUwTdXM9j2d-n66B3Yr+A+w@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: qcom: msm8996-cpu: Rename DIV_2_INDEX to SMUX_INDEX
To:     Yassine Oudjana <yassine.oudjana@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, 21 Jun 2022 at 19:07, Yassine Oudjana <yassine.oudjana@gmail.com> wrote:
>
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> The parent at this index is the secondary mux, which can connect
> not only to primary PLL/2 but also to XO. Rename the index to SMUX_INDEX
> to better reflect the parent.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/clk-cpu-8996.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


-- 
With best wishes
Dmitry
