Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18FBC6CB665
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 07:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbjC1Fxw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 01:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjC1Fxv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 01:53:51 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 218EF2D61
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 22:53:49 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id y14so10894702wrq.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 22:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679982827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JS0pA7dTK//9+UyGYDDGbrV1+24ixtl3SbvVnf67nhQ=;
        b=jEHWPzTrGpEMleU840krXgzFguip/yZPH9Ln2iBEqaPZ7vZO+qgv/CLesHnXxxEWma
         LkOuwUS7mTA9PITANbgFDSXet7YS4gMaWPolVZ+2q71XM5VI+JoZClJYoxTwyu4ZR27j
         E74PpOrF9u7+3b+gvOLv6bRJhK1KMSvy5XNRXsJaZIK/mnapUZZeXvPKEJ6EanhyHRo7
         uzl6VjO6r4N5AQoWPRKLYp8MvtTsK1GLtamRdmqZlcjBMcu9jEqixSPk+js96kWlMvIH
         OW0pINmtLrAKEE5OyUiJSOdYfKY2TEHxNtbRWcPRN9GwLeIm1bHE8XoIAJlMFZI3N41t
         40fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679982827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JS0pA7dTK//9+UyGYDDGbrV1+24ixtl3SbvVnf67nhQ=;
        b=aDn7ndjCF4AFBmWAmF+l6DOEVgddiL6oha+RTvU35OK+XJSPjPj3V3pOe/PMeijRVX
         74AjQly+QysVnUDVDTmNNAXSI6enr0ujdIHZRZZuvibHk1UF0iOOcMFaqCq9TJzID57J
         uQMH0R1U1pQK1GKmsUeBV46rvqvooYNH9BEzp6wBETT55FZZGwuEnVQTXWyR6j92uc08
         OwohSiAPxGm6N2DZzp9jSgArhIKnvG4g37BuVWSzTHdTVOR9cRM0KC9BvFCGBOtcRKmy
         6zIMnzfcQ467SpEyGDFYDCroBG0vSNo8IjqIwTPkKnQ9WT2sAUCUH/CERObzmJw6275U
         YdpQ==
X-Gm-Message-State: AAQBX9cvb8VrUqZLZ13wAtUFfu5/SaT2kKmEQoXfXyU7tnEI4njiSFxB
        Esn6m1XahI7W+fLHOzMIL7lfHlfmChV7etANd1rz5A==
X-Google-Smtp-Source: AKy350Y4+xkcnQAc1ICGZNMlkAi2Rc1gi2m98kbPnFAUFZoojSgwj6O24a5KHuE+6ii35Y/77jlNsth4h3MjHe2bU+E=
X-Received: by 2002:a5d:648c:0:b0:2d7:9771:fc4b with SMTP id
 o12-20020a5d648c000000b002d79771fc4bmr6317194wri.5.1679982827489; Mon, 27 Mar
 2023 22:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230320071211.3005769-1-bhupesh.sharma@linaro.org> <7b26e32d-6f3e-4e1f-33a7-0a994ae8526d@linaro.org>
In-Reply-To: <7b26e32d-6f3e-4e1f-33a7-0a994ae8526d@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 28 Mar 2023 11:23:36 +0530
Message-ID: <CAH=2NtzGbmeWUusC_vuE5EOR8AWVKEskmuBzQxSu_vCRKuh54A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: dma: Add support for SM6115 and QCS2290 SoCs
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        bhupesh.linux@gmail.com, vkoul@kernel.org,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vladimir,

On Fri, 24 Mar 2023 at 17:38, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Bhupesh,
>
> On 3/20/23 09:12, Bhupesh Sharma wrote:
> > Add new compatible for BAM DMA engine version v1.7.4 which is
> > found on Qualcomm SM6115 and QCS2290 SoCs.
> >
> > While at it, also update qcom,bam-dma bindings to add comments
> > which describe the BAM DMA versions used in SM8150 and SM8250 SoCs.
> > This provides an easy reference for identifying the actual BAM DMA
> > version available on Qualcomm SoCs.
> >
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >   Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> > index f1ddcf672261..4c8536df98fe 100644
> > --- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> > @@ -20,8 +20,10 @@ properties:
> >         - qcom,bam-v1.3.0
> >           # MSM8974, APQ8074 and APQ8084
> >         - qcom,bam-v1.4.0
> > -        # MSM8916 and SDM845
> > +        # MSM8916, SDM845, SM8150 and SM8250
> >         - qcom,bam-v1.7.0
> > +        # SM6115 and QRB2290
> > +      - qcom,bam-v1.7.4
> >
> >     clocks:
> >       maxItems: 1
>
> apparently it's a good time to implement a switch in compatible values
> similar to the one done for QCE:
>
> https://lore.kernel.org/linux-arm-msm/20230222172240.3235972-6-vladimir.zapolskiy@linaro.org/
>
> If this is done in the nearest time, then new platfrom QCE changes
> can be seamlessly added after the next merge window, also the change
> in the compatible values model shall resolve multiple technical
> concerns including the one above about 1/1 change in the series.

That is on my to-do list, but it's not of urgent priority as of now,
as fortunately the BAM DMA versions 1.7.0 and 1.7.4 are very similar
(at least in terms of how the linux driver uses them), so when we have
future use-cases that exploit the differences between the two versions
(or newer versions introduced in SoCs in the meanwhile) in the DMA
driver we can move to the soc-specific compatibles.

Thanks,
Bhupesh
