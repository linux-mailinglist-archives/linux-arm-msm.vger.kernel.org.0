Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE0E5F6E79
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 21:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbiJFTyW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 15:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232128AbiJFTyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 15:54:17 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BC0A8780
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 12:54:16 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ot12so6985815ejb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 12:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BU08DuNcVUZJqvjO5Ag8kG7jahbmjSfQDRHmDLHV0vY=;
        b=e6qflO4uuP0oyo4HK9eiH9/EhHQ4+YTG5QVUO5+ofQB4UzmauE5TJMD/BRYelfL0va
         j62dcE0CccIrehxfUMQRqIb7n65wabZXRtZ6Q9KmMux5bnej9T0NGkcSQ6qCU2cnXdyL
         Qq9VBq79jj5WYphvgF2Kx1F8r/UxHHN8yXPaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BU08DuNcVUZJqvjO5Ag8kG7jahbmjSfQDRHmDLHV0vY=;
        b=oRDmXL4UfopxcfdMZMKEWKkqnxyRzVBUrxqhGIpg0P+6fLVKiX+AW3gNQhqsf14tgP
         Ou81teW5RliiBvLxEtRfrm/HdJViclPitM/hAEpYXqzInRelN52bj1xETCZN6h5qi6V0
         SzksJKx9M/5PFANgxlKXBBm1S4yIwhr2yvCdjtzIefwrGWHkpFV2Q1AJmOMIdQVfpIk6
         C6zRSaxCpLw5lLuiDsGNUSpb6Vr92mv+qBLBEedfwop1T8UjWidVKmHLsuIWhQIkw+4F
         gubIh8cDa5r0WQKic4LTNP/LJP5D37DMjAwgpPcc4+b9tfmf0VG+Xm5aBiCg0QmlKzeO
         SGgQ==
X-Gm-Message-State: ACrzQf0ZgFGRWVf7LbMIJVKvIKbSTdyY8a5KamQdznQ//Btc1ZoQauhh
        Mlt9uTOhv03VSIFi53AcH3nfY5IQWsLC4zpJ
X-Google-Smtp-Source: AMsMyM6Bj4yBrzeGmdnD76fHvytr9Cao+HDjmhaqE8ydniS+FaQ//qkheqzRSCe91F1bUTSMpz8Eig==
X-Received: by 2002:a17:907:2c42:b0:78d:2267:3a68 with SMTP id hf2-20020a1709072c4200b0078d22673a68mr1266654ejc.546.1665086054639;
        Thu, 06 Oct 2022 12:54:14 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906128e00b0078d3f96d293sm159511ejb.30.2022.10.06.12.54.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 12:54:13 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id j16so4267441wrh.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 12:54:13 -0700 (PDT)
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr1064637wri.138.1665086052982; Thu, 06
 Oct 2022 12:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221006105823.532336-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20221006185333.v7.4.I50d04dcbe735dda69995cf1078824d671501869e@changeid>
In-Reply-To: <20221006185333.v7.4.I50d04dcbe735dda69995cf1078824d671501869e@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 6 Oct 2022 12:54:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJhKiC9zFRPnvhSzJbw_GT+nWKBtPJXdTTWw+jGd_-0Q@mail.gmail.com>
Message-ID: <CAD=FV=XJhKiC9zFRPnvhSzJbw_GT+nWKBtPJXdTTWw+jGd_-0Q@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] arm64: dts: qcom: Add touchscreen and touchpad
 support for evoker
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Oct 6, 2022 at 3:58 AM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> Change touchpad and touchscreen node for evoker
> Touchpad: SA461D-1011
> Touchscreen: GT7986U
>
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
> ---
>
> Changes in v7:
> - add compiatable for gt7986
>
> Changes in v6:
> - add removed pinctrl and align touchscreen label with herobrine board
>
> Changes in v5:
> - new patch for Touchscreen/trackpad in v5
>
>  .../boot/dts/qcom/sc7280-herobrine-evoker.dtsi    | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
