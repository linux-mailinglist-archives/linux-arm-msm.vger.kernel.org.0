Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 877F26E9A8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 19:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbjDTRUs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 13:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjDTRUq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 13:20:46 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE8A358C
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 10:20:31 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-555bc7f6746so51479367b3.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 10:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682011230; x=1684603230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npIvl3QgC8NcszelNQAZW8/zRVotzvOXnUNhHUMiAZ8=;
        b=KQs7NudBQyLCUQlIcIgPgvcU3Am9iQJaOwcrnEiNEhZlF/H2QtEilO+0ua/CC9zRwX
         a8jax2783UCBH8RpGjvzZjpDA4PNxRvMkUAWIe9ZxagI1SoF0dkU/ZTb/5PXWUaEk0/T
         zxmIK0pj8qoUrrqHLOLch4JKf2PjxHELYHegE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682011230; x=1684603230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npIvl3QgC8NcszelNQAZW8/zRVotzvOXnUNhHUMiAZ8=;
        b=fZbCenKDEzwM1w/lcYf9yOzJ+bVJoorMmreJRV77TuLRWpHS30Sl7kzI4X3LMeSg/Y
         iUVUDddXU5zroQOoUZE5yMKYItqDsatc/Zjq4NAqPqDg/ygMLnABssG+HKcVQQ04wHvd
         0RvIMcRGLr4v+31k+UtqLFMZ6Bfhj0Lna9heMBX7/I3ja0NsDnd7fDGFkMxuIKPuphYK
         NOefi8LkXucpjZmVSR9GzqeRT+Yt353Sz8WtSFSWas3fOQPz5Lka1k1AgDmGLAEwTByS
         jnXr2+SS1t4TUmUtp42nTbGK+HxiMSdL4UHKYdVmpbGPk5Sef5psbsdmIbwVg5pToC50
         u51w==
X-Gm-Message-State: AAQBX9cj1PHnMNd9/BjagBgjpidK/jhxMZO/X6cnm24Em9SBV4Dh30dH
        lRI8jX7FGQIp1y/PzL3jPcVHfGq8OoEfhflQ+WY=
X-Google-Smtp-Source: AKy350ZeMrtj96lN8emPvnniSaZS6R6N2QC4HhoeoAbADncLLE2Rz9JDbpnyFkCHr5K2DpICclsBxw==
X-Received: by 2002:a0d:df50:0:b0:54f:a5ed:1978 with SMTP id i77-20020a0ddf50000000b0054fa5ed1978mr1374748ywe.38.1682011230559;
        Thu, 20 Apr 2023 10:20:30 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id a10-20020a81660a000000b0054f8ec34bf8sm446789ywc.49.2023.04.20.10.20.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 10:20:28 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id t16so2653203ybi.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 10:20:28 -0700 (PDT)
X-Received: by 2002:a25:cacc:0:b0:b98:6352:be17 with SMTP id
 a195-20020a25cacc000000b00b986352be17mr882764ybg.0.1682011227804; Thu, 20 Apr
 2023 10:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <1681996394-13099-1-git-send-email-quic_vnivarth@quicinc.com> <1681996394-13099-3-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1681996394-13099-3-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 20 Apr 2023 10:20:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WyVRxRc7WuW1vhFXWDG81cAu7g5WiC9sggGoEuQOA4Cw@mail.gmail.com>
Message-ID: <CAD=FV=WyVRxRc7WuW1vhFXWDG81cAu7g5WiC9sggGoEuQOA4Cw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sc7180: Add stream-id of qspi to iommus
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
