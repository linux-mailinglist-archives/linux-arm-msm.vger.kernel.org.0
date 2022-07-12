Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC35571977
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbiGLMK3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbiGLMK2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:10:28 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E585924D
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:10:28 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id y22so4910030qki.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JMWRBOjVKVezj+8mw7MhRdfXmDr3dd9mjNPn2XYAsgc=;
        b=pg1HVMZaSGiG9VYHd3JpSEdBxzZ3N90ZOv60RNUuO+zTWCdv/DnrLVfFeRpzjP1jTt
         NGXJZuLb4Fl+lY1TzRf0JofqQsnkNYTf83+DSI+no2Mk3RJeGCJy8KxZEurN/meBWxKF
         HUVlJVu/VeLPXWU8rwRd1deZ0AWWeBFX8In/YTfP/HdClZXLXf0KV+xeP31rezXUPRIh
         /YDQpZeHw6DOOeVNjr3fI4Eig7WCM7LnuLpGZUjQhydBYrzL9j7f95gD8+B/osMswgEY
         KHraZjqpbuR5vFLqv9g2mg3IOJUhY4D4tBconfewsB85eUOl26UOYWopgbqHdfs6CWJP
         K+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JMWRBOjVKVezj+8mw7MhRdfXmDr3dd9mjNPn2XYAsgc=;
        b=xySTQRrKB9/SctdH/S4LRtY3xHM+osgt8l4HVOp/q9MyqWpkrPBrHndJ4I0BIdB5q4
         v91OhcDerjFg15NpYY8jVlsO/hU8BehSxXIZEDoV+ZIS+54kjleRBoqZq0jwoGoDOvjq
         Ko8iUHyu+MoIFynENzpUHpdvY17W0/svCpC30JKGVsvAdD8L1UlnDysiarvg51wUJUsA
         Nx3ictgC68isQY+ylF3V1LGBwJPgXzqxfZbJITIgD/HlFqJGoWsdAdyID3IdK1xgtV4b
         jIHdIAWkOqZdQztD+jebuoMn2eA0bUaqzq2qeIH1xj4RGVc3eTDX339Os8JrqWX3SxYr
         yy7Q==
X-Gm-Message-State: AJIora9KWlVR5GraGHIlFGRP6qyB487j4led2vtt0VadmtD7HRrSuEyt
        SqCpFmweFsVUJhnYmT9Xv291FwXa7xEIIr2640SXezYNhmY=
X-Google-Smtp-Source: AGRyM1sGl0mppDfWoVw3jPPNu2fZ8liu7Nxf2nVlUYFAGFK0HS4izJ3f4iZXtbLwp0Eo5giny6IIRPZhZ/PEYAy4H6M=
X-Received: by 2002:a05:620a:288c:b0:6b3:9d1:dbf1 with SMTP id
 j12-20020a05620a288c00b006b309d1dbf1mr14609111qkp.593.1657627827146; Tue, 12
 Jul 2022 05:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220712080156.1364-1-quic_ppareek@quicinc.com>
In-Reply-To: <20220712080156.1364-1-quic_ppareek@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 12 Jul 2022 15:10:16 +0300
Message-ID: <CAA8EJppaTC8tJ_MTgDhogHBRXTVSOWXLZJOQwpONgF+RNNn2gA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: add missing apps_smmu irq
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Jul 2022 at 11:02, Parikshit Pareek <quic_ppareek@quicinc.com> wrote:
>
> Add missing irq number 696, and correct the interrupt-mapping of context banks.

If these two patches touch the same device (and the same interrupts
property), it might be better to merge them into the single patch.

>
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 7945cbb57bb4..1197d60c2827 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -1591,6 +1591,7 @@
>                                      <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
