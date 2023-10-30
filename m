Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68827DBD19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Oct 2023 16:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbjJ3P6n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Oct 2023 11:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbjJ3P6m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Oct 2023 11:58:42 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 235AFED
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 08:58:40 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-da0359751dbso4026943276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698681519; x=1699286319; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i9wQF6czaHL5990fx9mFAIq4LF/PsQmXaPG+go3vW9k=;
        b=T04fjFiV0aRmIJ7IxlmotBXXLIfeiAACa87jMcCHr1866IS7WyWs8ffoA1WqMJAVZw
         l/e+9B/+PwBSdotC1F7iV60NsIReBmmbOW0oqryQy8YGZT6h+bIxHhFoAISvxvnkbeK9
         ECmw3GfzVttCs0B8yQi9N7qkhFX2Y1/PAjO5CfSt2yIhvQVOF3iO6HkV6oCV+LGgGhHW
         UgD3y3tpUJWyHnVblIhbyaHYo+Fk75HUOVHGEciithYd1jykXwASILpIazpbpL9AQ+NK
         71YqKLbmTWiNJIgn6QEJPWK50Zg+jmgQoCONWCtIfHDQ6RBvkAlEdXnKAOOn61CM9+xG
         x2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698681519; x=1699286319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9wQF6czaHL5990fx9mFAIq4LF/PsQmXaPG+go3vW9k=;
        b=PQWVvKRSmtxFIh+cFRM2dqC8RPeuis8bxR6hscel/aDGuGYwGDnDvH4G4xtcUJGJTZ
         IhKSMdHUxzMK3Jr3EVohmGbNj1VM3Vx2ykWXCJYVoEacDQWHPe7g+E+0qHwBpUpH0bwu
         gqNZsnRVbXXxFRJ61BjQG4x5xQ9FtPUyCCyVp9bBYI58K76pFxAbccMtXMBjpmxVsBX9
         W8p7sqAYt3ql3r7mmGiKR10VcBUAVXXiXNUUZfQF7PaOpUOCR1YrR3WaOZFERoFbq3yv
         m9IMZnu1QutuA2Jr6sLuiFBzy/HiHH5848MIm5BnzWUMDPOhev+i46KfPXTRMhLeOA96
         nRJQ==
X-Gm-Message-State: AOJu0YzgFOHylNgpVpliAnis49R4u4IGgiEDhFNda+FeJfoqg6OmyWra
        F3Vy41ua69KE8YtIcSiW18iCeOECUdXHF1bxEIx6PA==
X-Google-Smtp-Source: AGHT+IElJAfTeqDMc/0zerFNtxAKyhKnfXm62rOTFu0ZaS/53X96RXXiYik5nuEP8mHooIpebl+3qu7X6PWZlNbl6IA=
X-Received: by 2002:a25:e0c9:0:b0:da0:6876:c20f with SMTP id
 x192-20020a25e0c9000000b00da06876c20fmr21153ybg.20.1698681519216; Mon, 30 Oct
 2023 08:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231025-b4-rb1-usb-host-v1-1-522616c575ef@linaro.org>
In-Reply-To: <20231025-b4-rb1-usb-host-v1-1-522616c575ef@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 30 Oct 2023 17:58:27 +0200
Message-ID: <CAA8EJpqnKrzZh-mWFkO6cxGfE6TTGVSRjZN9Bov4LZeTCtQ2ag@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qrb2210-rb1: use USB host mode
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
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

On Wed, 25 Oct 2023 at 14:58, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
> The default for the QCM2290 platform that this board is based on is OTG
> mode, however the role detection logic is not hooked up for this board
> and the dwc3 driver is configured to not allow role switching from
> userspace.
>
> Force this board to host mode as this is the preferred usecase until we
> get role switching hooked up.
>
> Fixes: e18771961336 ("arm64: dts: qcom: Add initial QTI RB1 device tree")
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

As a side note, I think we should drop maximum-speed and dr_mode from
qcm2290's usb_dwc3 device node.

> ---
> base-commit: 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1
>
> // Caleb (they/them)
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
>  1 file changed, 4 insertions(+)

-- 
With best wishes
Dmitry
