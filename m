Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 260537AC4AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Sep 2023 21:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjIWTMj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Sep 2023 15:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjIWTMi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Sep 2023 15:12:38 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72546FB
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 12:12:32 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-59b5484fbe6so48467387b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 12:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695496351; x=1696101151; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tparx3l0ikz66NK3tLBEl70hjPdpPsu27P74LAY5v9Q=;
        b=AEc10IFPK4GcoL17hM5QOSS+c1s4ExOX8JoSteGPobW1CAz+mNEHA9cfbgP0cilTuK
         GXMUvpVxBxHWMP0Bm7ZbHcl3FDApi13lpZVuHYjQNoFXHO33CWYEFtKMv1q6trQv+UMe
         0L4tVQylD0MJ3tmrbUau0jWtObUmcyLlmgEpF/OEmEbdVTHF/dTl9swPhcy80wT6Gj9b
         Yr43A1q7By46u1D5e7ryKBBVZbBSUaZnkvApvGXBJ8nZUjdYtSKJaqi9PfCnu97O0Y+g
         t56AcQK54rtX0IyH93J1ALiJNKxetgUSPTT1LiExtvrCnv9nMQTeL/LfSjvFZJiKJBWG
         yxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695496351; x=1696101151;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tparx3l0ikz66NK3tLBEl70hjPdpPsu27P74LAY5v9Q=;
        b=RkahzmDoAE39nOfOuOqQIH5HWQ63Ppk1nXzblAo8YyBkRgErGV49hlaCnoVKSWnnLg
         V7UOW+088Dvi7pHwhKjk5UlAk8buGZsLrUdfwgvk47v9kiUsCGxkg01B6ALDqq7RoxRQ
         G7zMA/HMjU0KV0r5+kXBbzzuFiNpObpTwn/uUALduQ8bYlwYlHwsSWPMRV2T58AkM9s4
         7/0TWFFT17+XdbbJgS0IapjAWxQ6tvNY7VpB2tKHJy7Y8NdeKbmNL6vHVjDpTzZ4KJ84
         ZPLiPIeKHhZtF3Iej/E3LZhb160FMb/5VPXURhijHETa+1kja/uttqVU0jP5gZkUoRb6
         hMMA==
X-Gm-Message-State: AOJu0Ywxchtz2fnTzd4x4D6T0bng+TiKkwUb+IDipANn8jt3ioAL8vGf
        XkpHkt2wA09XUrZ/fakKtA/tN9TdOJ/3d4fM1x4P3g==
X-Google-Smtp-Source: AGHT+IHMs08AvAYu12BauPYVcMNwepKA0e0fxEUVJUaQmQXlGMsK6TgJkoAuEjnNJ2FmgCL9NOrejGX9+oJhlWeihSU=
X-Received: by 2002:a0d:c546:0:b0:594:e439:d429 with SMTP id
 h67-20020a0dc546000000b00594e439d429mr3163907ywd.37.1695496351669; Sat, 23
 Sep 2023 12:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230922081026.2799-1-quic_tengfan@quicinc.com> <20230922081026.2799-6-quic_tengfan@quicinc.com>
In-Reply-To: <20230922081026.2799-6-quic_tengfan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 23 Sep 2023 22:12:19 +0300
Message-ID: <CAA8EJpq1NAOZTOmBUUnkeLDThvxosj=MzNHo=5VAXnRPQci68g@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: sm4450-qrd: add QRD4450 uart support
To:     Tengfei Fan <quic_tengfan@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        tglx@linutronix.de, maz@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, geert+renesas@glider.be,
        arnd@arndb.de, neil.armstrong@linaro.org, nfraprado@collabora.com,
        rafal@milecki.pl, peng.fan@nxp.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_tsoni@quicinc.com,
        quic_shashim@quicinc.com, quic_kaushalk@quicinc.com,
        quic_tdas@quicinc.com, quic_tingweiz@quicinc.com,
        quic_aiquny@quicinc.com, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 22 Sept 2023 at 11:13, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
>
> Add uart support for QRD4450 for enable uart console.
>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm4450-qrd.dts | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm4450-qrd.dts b/arch/arm64/boot/dts/qcom/sm4450-qrd.dts
> index 00a1c81ca397..e354bad57a9e 100644
> --- a/arch/arm64/boot/dts/qcom/sm4450-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm4450-qrd.dts
> @@ -10,9 +10,24 @@
>         model = "Qualcomm Technologies, Inc. SM4450 QRD";
>         compatible = "qcom,sm4450-qrd", "qcom,sm4450";
>
> -       aliases { };
> +       aliases {
> +               serial0 = &uart7;
> +       };
>
>         chosen {
> -               bootargs = "console=hvc0";
> +               stdout-path = "serial0:115200n8";
>         };
>  };
> +
> +&qupv3_id_0 {
> +       status = "okay";
> +};
> +
> +&tlmm {
> +       /* Reserved for other subsystems */
> +       gpio-reserved-ranges = <0 4>, <136 1>;
> +};

Is this also related to the UART support? it looks like it is a
separate patch, which should likely have the Fixes tag

> +
> +&uart7 {
> +       status = "okay";
> +};
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
