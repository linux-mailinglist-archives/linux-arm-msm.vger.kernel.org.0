Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD6326D32BA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 19:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjDARKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 13:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjDARKJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 13:10:09 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4667C1B365
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 10:10:07 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id cf7so30629143ybb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 10:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680369006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7s5+k9358doKc7HUKKj3T3h9KJGswnrDpl+yCdJVdko=;
        b=I2grDuJVBI/M/4L5X+QZNJ9xcxiVlhnFXYbRHaYTGOP2SyNk2d6ugXeQDlC3HMsGHs
         ZPF9Lkxm8prvtdjKL+CIDi61Yvb2tPk8Jy5sjwRyhg7siVk4IW2XmpyaM00OYL8XKQor
         FCJs/WNUdSg0+MQ1X5fWwTZkXIWCX1deLEe+gfRrtNa8BwsoC1NgXmMFxUWSLJPVsMcO
         35eLMWRuaAdIvJZsAir1LzQKtPlk4rh3k2n33UHhKDMenOyWs3yTxFLcC/NiF4AoLsAI
         DkIForJ4UzPMu1noNvhy5qYb8dsfgC9G1kpYwmmnBOmeosigFXcxCasCPZXXdeMbrsOo
         l1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680369006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7s5+k9358doKc7HUKKj3T3h9KJGswnrDpl+yCdJVdko=;
        b=UCekEyaDXa/kKxIMloylRpl1kK+xFMvfiGNIHdBLcCxLSej6Mp5EBGEMdc61ARWQOi
         gnu1sDePEIr24dzIh1uglxnY+WtjFN3NrPb9UysTSs0hgnSG8HoPUEJ3ZkrpqIEnqkuG
         kQ2f2FJT0eIjVVDvYm3G9YaMx1rrUBRQ2nG9gs3JTlm3qazHT9OSVEbR0gnXd/6zfB1x
         KClAhBEdPjYdVgKnSKsJYP3EsgIi7KxeepZ7qChZ/4K3LA783RRRQzor54U0YIYgj1r3
         Hh38K+jcJu7TJa0+gIZLHYDSA+r9laYaKwviDM1AXXcpQiWcZxomaEL7z+nlfJC0QBuM
         /wEw==
X-Gm-Message-State: AAQBX9fD4NUbwMSywruU2v40YVkbeAFFEPKhLNT1BhoUfgbRBZyXpSBg
        Kg04CUQoWYy1BNhTQu8qi6chndQ8jJV6Q+CII2jSHQ==
X-Google-Smtp-Source: AKy350al/lA1jHqW4ku1aoDIpBdo5zPf7rFFIHQ7Zdgn74LwoMcnjsNnGK/dlOWriUQZk7R8Xk5/PblFflqZvGqt4k8=
X-Received: by 2002:a05:6902:1501:b0:b4c:9333:2a2 with SMTP id
 q1-20020a056902150100b00b4c933302a2mr16433274ybu.9.1680369006476; Sat, 01 Apr
 2023 10:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230401154725.1059563-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20230401154725.1059563-1-bhupesh.sharma@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 1 Apr 2023 20:09:55 +0300
Message-ID: <CAA8EJpq4O-=Qd5cS=yKiBzkHcUSWSL7HarFy7WknYpF=FkDOoA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Enable USB SS qmp phy for Qualcomm SM6115 SoC
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 1 Apr 2023 at 18:49, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> Changes since v3:
> -----------------
> - v3 can be seen here: https://lore.kernel.org/linux-arm-msm/20221215094532.589291-4-bhupesh.sharma@linaro.org/
> - Fixed v4 as per the downstream driver code: https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#296
> - As per the downstream code, the qmp phy on this SoC is similar to the
>   SM8150 qmp phy and is indeed not a qmp-dp combo phy.

Nit: sm8150 has both USB UNI PHY and USB+DP combo PHYs, so this note
is incorrect.

>
> This patchset adds the support for USB SS qmp phy for Qualcomm SM6115
> SoC.
>
> Bhupesh Sharma (2):
>   dt-bindings: phy: qcom,qmp-usb: Fix phy subnode for SM6115 & QCM2290
>     USB3 PHY
>   arm64: dts: qcom: sm6115: Add USB SS qmp phy node
>
>  .../phy/qcom,msm8996-qmp-usb3-phy.yaml        |  4 +--
>  .../boot/dts/qcom/sm4250-oneplus-billie2.dts  |  3 ++
>  arch/arm64/boot/dts/qcom/sm6115.dtsi          | 36 +++++++++++++++++--
>  .../boot/dts/qcom/sm6115p-lenovo-j606f.dts    |  3 ++
>  4 files changed, 42 insertions(+), 4 deletions(-)
>
> --
> 2.38.1
>


-- 
With best wishes
Dmitry
