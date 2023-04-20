Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 846726E9ABF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 19:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbjDTR2l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 13:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjDTR2e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 13:28:34 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5C44EC4
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 10:28:30 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-63b5c4c76aaso1020472b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682011709; x=1684603709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78/qGEvYe/lkrFdeVXssBK2xk+jn/Iin4nBiAlABPII=;
        b=PrEEBV5gmKmv1clBMDpycLZW+3KoJWpb8zeNcb3noJYcQ1GiSviSfcHbJoKihHa3uO
         P06X9ABRX8R2bhDzYL32qtHaKsDSgjpaxzt9IScY3UT9uKOiF1MvmBW6w6OwVXJB5Ywj
         OgwMx48+yBI5d8TUXjzoYGclFKhvmCu3h07gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682011709; x=1684603709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78/qGEvYe/lkrFdeVXssBK2xk+jn/Iin4nBiAlABPII=;
        b=FDWNlovctQ2TPqmS5P1K2HCQ+NBmR7sKMy1HrfPogIp0Zj8K9j37pvHMcjE9er+663
         7C+hWiszrEZbrJwrX124vhbFMVPkRj53Gtana7ZgwVnpvt8bt0nPerY94o61EYsr51qo
         EfFum1+T9vg1rsvawI0Vnc0ymlm+6h94/RF/VanH+lMQvLuSeJ4xm8NvNWd9P4Yj33sj
         BuYanGXaJx1HS4353HGOEYXwxuijX2Xqb5q/LmbtfPqZU+TEjxBd9c3bzgClElDjJoKP
         uj0b7cl7a7FU9mQXxR4/E8UCHOxj7MOmP3kQRwfS0BLOmTR1mr2hvBhtIe6YLWk3HJxp
         2BHw==
X-Gm-Message-State: AAQBX9e4w8Z/JCyz69/vhSvcIz876FuCaK05Nf8FvuKJZj6MUHMIqQyz
        qW+m6ghIMV2aw4JmacoWrR/Ahft/NM1svVFSeNY=
X-Google-Smtp-Source: AKy350aKIxyb6mIAHZMIm/e+llr4grhMBVPWlwVSayJxErFGG9AqpMxAzj1cgxg6EMGAK3PZFgnosg==
X-Received: by 2002:a05:6a20:440f:b0:de:13c4:5529 with SMTP id ce15-20020a056a20440f00b000de13c45529mr3291842pzb.62.1682011709338;
        Thu, 20 Apr 2023 10:28:29 -0700 (PDT)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id y1-20020a056a001c8100b005a8173829d5sm1505007pfw.66.2023.04.20.10.28.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 10:28:28 -0700 (PDT)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-63b620188aeso1661325b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 10:28:28 -0700 (PDT)
X-Received: by 2002:a25:d895:0:b0:b98:6352:be20 with SMTP id
 p143-20020a25d895000000b00b986352be20mr684421ybg.0.1682011268498; Thu, 20 Apr
 2023 10:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <1681996394-13099-1-git-send-email-quic_vnivarth@quicinc.com> <1681996394-13099-5-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1681996394-13099-5-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 20 Apr 2023 10:20:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ULfbQh7JgGTNh67JjQCwcBZD3nZqWGw7-fP1W2WX0pfg@mail.gmail.com>
Message-ID: <CAD=FV=ULfbQh7JgGTNh67JjQCwcBZD3nZqWGw7-fP1W2WX0pfg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sdm845: Add stream-id of qspi to iommus
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_msavaliy@quicinc.com,
        mka@chromium.org, swboyd@chromium.org, quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 20, 2023 at 6:13=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> As part of DMA mode support to qspi driver.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
