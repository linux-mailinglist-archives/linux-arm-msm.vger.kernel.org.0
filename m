Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4AC4DD1D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Mar 2022 01:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbiCRAOP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 20:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbiCRAON (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 20:14:13 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DFB4CDC
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:12:55 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id qa43so13919054ejc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0JxEaW4VXWR40cLYJjku9wMK0TYnJdxwPBMKsUQN5x4=;
        b=WmrOuRLIO0Ac2yhoWChAS3mMdEymf9q2gT1itHWGIVZGaH+oPlHGJc4Ee3mLhpjJyz
         /KOPyenA4596wt5yxVjvtdxfN8GH4bugNcacafDRuP5vH1xVx88HWnxUWlfstXDyW9iQ
         j77Pr/D/gx7SNRYOy03j2fM7u66ODTiwxMI7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0JxEaW4VXWR40cLYJjku9wMK0TYnJdxwPBMKsUQN5x4=;
        b=FGnyIk9NrdqyiAKtvsyaV72yV5RKMDgo98A0U+J/Hq4GlZ/0Au1bv0nXv6hrwFPa/O
         yBCxAweEZvaLIAVgEkQ8hNvdxCaj8SlVqm3W/S7uKafl2L2mafTdtZ3lhNdd8cmlktVD
         tSWfWPaibyPFfGmk0FCKyuHBin+ztyQpusHKp1u1A42GV6IH7BRS6Jo6nbR5AGmcDkQg
         rAjCs6S5claSPg5O+1ah7zCeRF38I+0YN/n6ZVZGlYJp5hIwUpdGpKRR08AudqqY4DfN
         6RojrWVhrmzH1/zpPao46CqZ1OYM9N8WI8egEyFHBZVIsldII3JrpI3JBCfVcaZEACz5
         gFMg==
X-Gm-Message-State: AOAM5338LYvQNKdg5x/uW2DzVzD6hEOibWYmi/y9hyq7+kSky/ho3ifm
        Gcvk/OIUc9bNmY7vbQueSiqX7/LE3X+ymN1j60o=
X-Google-Smtp-Source: ABdhPJzZKlEItxhL8RC/O6q51HRHIvf3XaD2C9r7kakA4YaqDsxCZ8Lfv/R4vAK/vXqspRfRk6ZRaw==
X-Received: by 2002:a17:907:d94:b0:6df:7e80:a101 with SMTP id go20-20020a1709070d9400b006df7e80a101mr6618749ejc.148.1647562374131;
        Thu, 17 Mar 2022 17:12:54 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id b11-20020a170906728b00b006df8494d384sm2651326ejl.122.2022.03.17.17.12.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 17:12:53 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id q7-20020a7bce87000000b00382255f4ca9so5902795wmj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:12:53 -0700 (PDT)
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr13488223wmc.29.1647562372833; Thu, 17
 Mar 2022 17:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com> <1647269217-14064-4-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-4-git-send-email-quic_vpolimer@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 17 Mar 2022 17:12:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VXJJYUhDYau1HEG4M7aKA4vVzN7xh_LAJXf_r=Tj0XZA@mail.gmail.com>
Message-ID: <CAD=FV=VXJJYUhDYau1HEG4M7aKA4vVzN7xh_LAJXf_r=Tj0XZA@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: sm7180: remove
 assigned-clock-rate property for mdp clk
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        quic_kalyant <quic_kalyant@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 14, 2022 at 7:47 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> This patch is dependent on below patch
> https://patchwork.kernel.org/patch/12774067/
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Similar comments to patch #2 about the commit message, but otherwise:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
