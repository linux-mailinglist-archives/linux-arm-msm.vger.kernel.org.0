Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 461F159B97B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 08:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbiHVGbu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 02:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbiHVGbu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 02:31:50 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D430223BE4
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Aug 2022 23:31:48 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so5419371wmb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Aug 2022 23:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=HwNSsSM+b0+Bzmgnk1LQ0DCn3s+MY+LodqBIEQHZQHQ=;
        b=Btoe59RfZ9kdNtJ05cG2BkVNurX3LbQ3ECiQ2X8mnVUsSmNgUR0hUm9g8roPQMk1Wm
         xIxI9L4D4FAkIJR1iPkWhVACwghD7fFD1Ny9eXkQ+Nv9SbrF0FT523OQbS3xKCBS3e5R
         39//OFFYNZ+5EXA+Y9ZwJ5H0KejeluJh13xLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=HwNSsSM+b0+Bzmgnk1LQ0DCn3s+MY+LodqBIEQHZQHQ=;
        b=QMAdbms20Be+JbLcEZ2Ec9faKyD1IZ9xHeTQ/EFLNUfdODbGEpX5TDeJD+2/nyv5j/
         dBJYH8WhlxUjQvI9GhTo7Av3gc0P9dzZYc0Ep4h7/6CPSvUT8N5K3gANikoOAquuqarK
         RkX6V1M8e73gMHFVMERL1QsRVxIZzG5jXLkKAOSSIbxyAUt5SEaR/2shj9qwr8Wy+Pwd
         47X4ToQo6EBQBG6y0yiBORQligIn9Iv+/dfvWbHQdumvridqBqIfFIOn/kgDIcjFrq7N
         c8T3q02R/7v5Mx38/CirYkmYpSG6jfRKaqgthPJkZ/lDz2vo+KmAP8GKvBV1clw5/YBq
         g5Fw==
X-Gm-Message-State: ACgBeo1bFSwEKOU49o3zjxFCVv/trpC0WcLQMTqXIpa1kS8bkYfV/tXE
        qcM66RP40fYPbE6//FnSPAExs12A2uEywtIRDI1mSg==
X-Google-Smtp-Source: AA6agR7vS2KdEy4vpZoAR5969Ls5K/TxGuA6r2DrsXZ13Vh0OmiuFr9OC4AYyQZ96v0yeqhHzMx2GN6uv8ptldZlKtY=
X-Received: by 2002:a05:600c:1f05:b0:3a5:c789:1d9c with SMTP id
 bd5-20020a05600c1f0500b003a5c7891d9cmr14392668wmb.26.1661149908496; Sun, 21
 Aug 2022 23:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220816093644.764259-1-judyhsiao@chromium.org> <CAD=FV=XLsBcbrjb0DwG+Yhia_hk4kcKT2S0_vMT=k3cWxh=NRg@mail.gmail.com>
In-Reply-To: <CAD=FV=XLsBcbrjb0DwG+Yhia_hk4kcKT2S0_vMT=k3cWxh=NRg@mail.gmail.com>
From:   Judy Hsiao <judyhsiao@chromium.org>
Date:   Mon, 22 Aug 2022 14:31:37 +0800
Message-ID: <CAJXt+b8uS_s3VOrRdPwYHx0mAtBCd=qOGQp2SWq_-EAt9nYRkw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Use "PP1800_L2C" as the DMIC
 power source.
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
> In v1, Stephen pointed out that the subject and description of your
> patch talk about adjusting the supply. However, your patch _also_
> adjusts the audio routing.
Thanks for your comment.
The audio routing part change is to use the vdd-micb-supply regulator setting.
And the vdd-micb-supply set the MIC power source as PP1800_L2C.
 +                       "VA DMIC0", "vdd-micb",
 +                       "VA DMIC1", "vdd-micb",
 +                       "VA DMIC2", "vdd-micb",
 +                       "VA DMIC3", "vdd-micb",
Let me update the commit message again to make it more clear.
Thanks!

> It feels like the audio routing should be done in a separate patch and
> that patch.
>
> -Doug
