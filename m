Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA41979038A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Sep 2023 00:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjIAWOa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Sep 2023 18:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350792AbjIAWOT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Sep 2023 18:14:19 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE512682
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Sep 2023 14:50:57 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d72cf9156easo1901162276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Sep 2023 14:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693605057; x=1694209857; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7T5FXxzSpNMSTBIFW6gCFjur69dUAN6sqrMcK/o/Gpk=;
        b=Ymda5+8ljp+0KZOhHvhgDp8+oLS9+RFYewQGFNBVcJ00n3hF4IQA10EWBkJ385SooA
         svNvF1xIp0ZW51VWTFh3kXFtj9EEQpUCg+GM9ysXBZLvQ47+2kBd9AcCgJnU6Qa1PQr5
         V7AkzxVS/IOZhDqvTdQE+dxK51BHBOfgooFFCQUbG5SpJe26iPKKRvmCYGn4wJ5Ni76r
         CR6XG8OmSOYo3WpV4LLLT2bFAKKYKW6OXY2MCh+l+YOiEmaTxhL1BImxxNhcOp4CxiBO
         QGLHEBMLuRTCr5GFDAJOQm0zrG42n5LGU9NacZqO0gSB3k6R/gXWt7Q+q2Uf5VsPhoIn
         vPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693605057; x=1694209857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T5FXxzSpNMSTBIFW6gCFjur69dUAN6sqrMcK/o/Gpk=;
        b=ArTowAAOeprpS6bMCeH0VfpAUxQANL4b5yUVQ/kJg2Hvu9PrCWAkx2xhUb7ISznl5c
         pD9q4O9hinO1qmenuQ6Ztx7SP76Q5mmuj2pKkqnFKEAiBTTD2BnwmjD6kQ2lFBNFreLk
         yv5vWWy/qbsDKl0yQRhdaLAAfFs4vJtPLVnvgBp5s+MkfqhYhZfJ3bROSwxowleUYH1G
         l+KVrW/1m1rQRzZQJ6gOjd4plAJHpwC4J2c1EsuwWqYpxpo3Ob4PHfk+V5/9RTXm6FCO
         JwFXVNxMu3m8h0xyTuD+l3xVVrQALEbxBmDe73SmyY0M37vWWqqIP+39IMGDXRKftJy3
         Jj2A==
X-Gm-Message-State: AOJu0Yzvu3D9u6ENWN2GtWG0+XU9k/CPyhQUdrv0cJyOSvXtl0CXbWPI
        iJkCrqZEq/CmeRRUJqMjt94uiYA2F3jrU3Un52Tryg==
X-Google-Smtp-Source: AGHT+IHZQWWQfsVRShlkEDLQEG+XgcCkRipps2a4WR5lRLbz5QhPjZI81c9oDeBkoqagzkt8tqC2L2HBVFJuCDOZa1I=
X-Received: by 2002:a25:b201:0:b0:cfd:1bb9:e356 with SMTP id
 i1-20020a25b201000000b00cfd1bb9e356mr4588793ybj.32.1693605057193; Fri, 01 Sep
 2023 14:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230901092645.20522-1-quic_nsekar@quicinc.com> <20230901092645.20522-5-quic_nsekar@quicinc.com>
In-Reply-To: <20230901092645.20522-5-quic_nsekar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 2 Sep 2023 00:50:46 +0300
Message-ID: <CAA8EJpqsox3HPh45UhtqcWXyKeQ74LxLcyxHuDMz+G8Go9Todg@mail.gmail.com>
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: ipq5018: Enable USB
To:     Nitheesh Sekar <quic_nsekar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Amandeep Singh <quic_amansing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 1 Sept 2023 at 12:27, Nitheesh Sekar <quic_nsekar@quicinc.com> wrote:
>
> Enable USB2 in host mode.
>
> Co-developed-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> ---
> V3:
>         Renamed usb2_0_dwc  to usb_dwc and sorted
>         the USB related nodes.
> V2:
>         Sort and reorder USB related nodes.
> ---
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
