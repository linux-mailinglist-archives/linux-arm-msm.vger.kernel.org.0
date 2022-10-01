Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B41725F1A8A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 09:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiJAHO2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 03:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiJAHO1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 03:14:27 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5F8C80F3
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 00:14:26 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id l76so4765525ybl.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 00:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PgzZ0PoJnAJz0dQXkSQKaL7dHuT1cZSXRrd9261Dnqk=;
        b=mlQfF7N1lrHCE7kzVtI6RSbT96oqYXRvPkt9eX6xq+qfm4PQfTjJVQlxNDnrIqSiK7
         fYF0Md3sB5LhiyQOzellOrJf+UQq0Usqk7TkNrf3IEMewO5PdRPyuNMDKMOMoqpm/YdL
         U76rKfnEfbppYSWsDQENGMquaxWiWBPv8nXQnH8I5RP+s+IkOaMuiYfqg01Cfsc3aGfI
         PJLIQnsuxZAuyMfxGnywGcU0cWYVhzR1J7o61gpcW518YfAIrTs330qNfLWP6fX9oiEY
         7xSObKxr6BQM5qFim7Ez/TfVjduQ0VT4rjTXCutA4b+am1i6GQSiu5mipBtOS7rfyAc6
         FF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PgzZ0PoJnAJz0dQXkSQKaL7dHuT1cZSXRrd9261Dnqk=;
        b=miJtZ/nepcJR9aVZRq3ooDbvbZG5IxwyFuIk875xy+OkTlfsSKHqJ6Sb2tyKsLZSpK
         Ndjln+oar++EzpD7wyBc7LU6D8/q+Qen/1wsyUem5dd3qRe22bKkzaN1QP21zH+puiHD
         l7UvKBwIOv7vDV1i3TSV9JswaQm0Pj9DymhMOjw/A8ILegZcj4zGntoY6ett+xA8PoDv
         5kf3apqzKkUtA3UxrU3Ii9DhSyzI3apXqQB318pOHMH23GrsjVYZFb4NODwXKeP0PH6N
         3U+KDGXg+HQY3NrA1F4AV5HyuFVTU+cezbEOp8VZSZxRge7y3fsaQNyJkErJWBC1XCdM
         VUCw==
X-Gm-Message-State: ACrzQf2P2oLuNa3VlO3ZJLTLWq85qPDn+n8To0Ksirwgq+YmIqg6/3hn
        gjq/XXPB39a7gXtW6I6vtizGUpdwa5/fCC32InZYkXaWSWc=
X-Google-Smtp-Source: AMsMyM6u9BV0jp1phJUaaaJ8xA763ZxFTU2uofLHSHfSHU9LH6ozAYvYoscycfEMeh5n7Po4WdRQDl22O+CU0dKPQTY=
X-Received: by 2002:a05:6902:102f:b0:6b4:7cba:b77a with SMTP id
 x15-20020a056902102f00b006b47cbab77amr11680432ybt.516.1664608465947; Sat, 01
 Oct 2022 00:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221001030627.29147-1-quic_molvera@quicinc.com> <20221001030627.29147-3-quic_molvera@quicinc.com>
In-Reply-To: <20221001030627.29147-3-quic_molvera@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 1 Oct 2022 10:14:15 +0300
Message-ID: <CAA8EJppLd6dti=gbR0hbEAQyj5PHA7xWR3w+DESx1qcKcyf3YA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dmaengine: qcom: gpi: Add compatible for QDU1000 and QRU1000
To:     Melody Olvera <quic_molvera@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 1 Oct 2022 at 06:08, Melody Olvera <quic_molvera@quicinc.com> wrote:
>
> Add compatible fields for the Qualcomm QDU1000 and QRU1000 SoCs.
>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/dma/qcom/gpi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 8f0c9c4e2efd..94f92317979c 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2292,6 +2292,8 @@ static const struct of_device_id gpi_of_match[] = {
>         { .compatible = "qcom,sm8250-gpi-dma", .data = (void *)0x0 },
>         { .compatible = "qcom,sm8350-gpi-dma", .data = (void *)0x10000 },
>         { .compatible = "qcom,sm8450-gpi-dma", .data = (void *)0x10000 },
> +       { .compatible = "qcom,qdu1000-gpi-dma", .data = (void *)0x10000 },
> +       { .compatible = "qcom,qru1000-gpi-dma", .data = (void *)0x10000 },

As usual

>         { },
>  };
>  MODULE_DEVICE_TABLE(of, gpi_of_match);
> --
> 2.37.3
>


-- 
With best wishes
Dmitry
