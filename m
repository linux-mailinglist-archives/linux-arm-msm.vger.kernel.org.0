Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECC3A5A4F09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Aug 2022 16:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbiH2OUy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Aug 2022 10:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbiH2OUv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Aug 2022 10:20:51 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E42EE2F
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 07:20:50 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id bj12so15977180ejb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 07:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=F9yNwthvDThYN8PozFUnGZoAmSBhQ3+M5Ob8cdnJ9E0=;
        b=UffHqoG7mxNZ+09NcRTvmauGvuRAlQxfBG3YjS42aMP4Xh5RLRU0qBqKGJtYmWI4UY
         WTl0UN/p716/FEmlZKu+J1fjOHbxyymf4yHoDBoLNu/H1N8jSunLZyi77z2D9rJbueoA
         tOe0k9xsI7JGHRoYDFDCNONP7HSwMcmwarbdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=F9yNwthvDThYN8PozFUnGZoAmSBhQ3+M5Ob8cdnJ9E0=;
        b=mrQjablf3bPuuz7iWT+Y/mcBxid83TEVdTs2B97vtsR/V7B6hTkYlxrkGBAMG0hm0j
         G1L3AEGwgIRKvatpHQRyrBSxoKSLKfHHFBa4UT6MxZwSKJJfuDbOtd2v9Qy1+2m12fZK
         VcpFFAQW0Q0w9NhXSTUqddo2QEjMRyda6HtHp9RBcomYLAx0eCinp0vKxwcXkr6tM60/
         1sIqdihlaWHRxAGVMMjFtpYmScRq6KK9w167/xCJcXpTg0DMFQ36W9utYOrhyzaLF2xL
         Y7vZC/GBk19Jsop0oDSzTs/Q2+pAT7F4wfc1mPM8inAFxIP1I1Gosb6/W4gaJbQQN0QL
         sPeQ==
X-Gm-Message-State: ACgBeo36onljlybnrOKiBSK0af7JHF9w2vGzDJA6KSTl0SbLZN46KAmb
        SK3SIEpFIMKDd5/4ZZtA8ETG2UR4bSGnigQP
X-Google-Smtp-Source: AA6agR6+1mUqqZq1vSqmBXjd/YFRbhTk2SKMem/tAGbNiQDLHAI/mQ/CUWlTIdPHy06uCSJ0hDHx3w==
X-Received: by 2002:a17:907:2d0f:b0:731:87d0:13aa with SMTP id gs15-20020a1709072d0f00b0073187d013aamr14365882ejc.142.1661782848652;
        Mon, 29 Aug 2022 07:20:48 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id r5-20020a17090638c500b0073c0b87ba34sm4459808ejd.198.2022.08.29.07.20.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 07:20:47 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id b16so2769889wru.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 07:20:46 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr6500366wrr.583.1661782846549; Mon, 29
 Aug 2022 07:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220829030823.v2.1.If97ef7a7d84bcc2cf20e0479b3e00c4a8fb5a2fd@changeid>
 <20220829030823.v2.2.I99d43de4a80223dee58ea1bc5b4fd3aaadc5e3c1@changeid>
In-Reply-To: <20220829030823.v2.2.I99d43de4a80223dee58ea1bc5b4fd3aaadc5e3c1@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Aug 2022 07:20:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZoh-4uSWViciUgXCnTAz6HhQkOt2un_tTa1GY755TDA@mail.gmail.com>
Message-ID: <CAD=FV=VZoh-4uSWViciUgXCnTAz6HhQkOt2un_tTa1GY755TDA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add sc7180-pazquel360
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, Aug 28, 2022 at 8:09 PM Yunlong Jia
<yunlong.jia@ecs.corp-partner.google.com> wrote:
>
> Create first version device tree for pazquel360
> pazquel360 is convertible and the pazquel it is based on is clamshell.
> sku 20 for lte & wifi
> sku 21 for wifi only
> sku 22 for lte w/o esim & wifi
>
> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
> ---
>
> Changes in v2:
> - Remove the touchscreen setting, as a follow-up patch
>
>  arch/arm64/boot/dts/qcom/Makefile             |  2 +
>  .../qcom/sc7180-trogdor-pazquel360-lte.dts    | 22 ++++++++
>  .../qcom/sc7180-trogdor-pazquel360-wifi.dts   | 17 +++++++
>  .../dts/qcom/sc7180-trogdor-pazquel360.dtsi   | 50 +++++++++++++++++++
>  4 files changed, 91 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
