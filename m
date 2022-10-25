Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B78460D4CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 21:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbiJYTjf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 15:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbiJYTje (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 15:39:34 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE036D46
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 12:39:31 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id d26so15348647eje.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 12:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KO4jYktTVlE4tPrXjK/e9XeWuNWY6QxpH8jzqQKB8q4=;
        b=Tg/pZVEKhlBVoyA2jinR/rTmorWbG6k16SdM2i53Q9zn6kQnqPdi6bOfnyP3OFYfzy
         2/4Hm9OiwRN8k15sj6sljo0XoZy6QIv5B901LDWdVFrBLOJ244WD9Plh337cI7iglRw5
         abxm0O73GgHNkMntQriim9vqLl5kNYeQ6WfoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KO4jYktTVlE4tPrXjK/e9XeWuNWY6QxpH8jzqQKB8q4=;
        b=XIl/wgAF2i4sLsC+Y8CvVgghxajXRAwpNQmCWSFLtgemwRm1sgQ+NcKYTKtFLRxkjE
         bKzIfa6luU2doOga2Xb57tatf4DjvXUDf+qi7uZtNY8Swef0d+poM3HYXXuLUUOEZZQz
         cdFxDyfN2tKQ+qjkAIYEifLaJSgqqtGfWtVemnnWaGQ0BY2cFapzRXRcKbpC5ta+FlH9
         jU2UWawdzfbEIhMJ6gnQ+VcI5Lc7L4reuQZNe8mXvnPdnT6gTDWghVe+WBWEHSHDgSnw
         Lm9ErP0XnEhGqJ/9enBjocBQkwF1bNOrLQWv53bI5NBdhorx6EDlyzlMFHR8alj6tx5W
         z31g==
X-Gm-Message-State: ACrzQf0aFi1Xuh+rqJvO/xPMBMqGzRy6Wf/k4y5OJt44WYCntv8m+IoV
        JM8b6kRa0qXxxEmtWT2UpPkGHO9mEKiJPH9W
X-Google-Smtp-Source: AMsMyM7S33q0cFWftNYwMiCS/R/kgdSm77YXZCB2gvTN6T3hzDOc6rtCx1wJoKLGbp3164FqGghSMQ==
X-Received: by 2002:a17:906:4795:b0:794:8b93:2e43 with SMTP id cw21-20020a170906479500b007948b932e43mr28572325ejc.184.1666726769954;
        Tue, 25 Oct 2022 12:39:29 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id o20-20020a170906769400b007acbac07f07sm1101730ejm.51.2022.10.25.12.39.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 12:39:29 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id bh7-20020a05600c3d0700b003c6fb3b2052so9007394wmb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 12:39:29 -0700 (PDT)
X-Received: by 2002:a05:600c:5493:b0:3c9:c18:87d5 with SMTP id
 iv19-20020a05600c549300b003c90c1887d5mr12934748wmb.188.1666726768937; Tue, 25
 Oct 2022 12:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221025180703.1806234-1-swboyd@chromium.org>
In-Reply-To: <20221025180703.1806234-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Oct 2022 12:39:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VArrvWtxbrT_t=kUqX54MM1_TvTv7pA2PuAhT2QHmF0g@mail.gmail.com>
Message-ID: <CAD=FV=VArrvWtxbrT_t=kUqX54MM1_TvTv7pA2PuAhT2QHmF0g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Remove fingerprint node from herobrine-r1
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Oct 25, 2022 at 11:07 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> It turns out that only a few people have the fingerprint sensor hooked
> up on their board. Leaving this enabled is slowing down boot for
> everyone else because the driver slowly fails to probe while trying to
> communicate with a sensor that isn't there. Remove the node to speed up
> boot, developers with the board can manually enable it themselves.
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
