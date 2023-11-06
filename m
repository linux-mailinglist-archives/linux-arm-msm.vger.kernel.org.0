Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E35F7E2F38
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 22:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbjKFVwK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 16:52:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233161AbjKFVwJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 16:52:09 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D968D75
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 13:52:05 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c6b30acacdso66711041fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 13:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699307524; x=1699912324; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVo57WCE+yBWdXW5ghNzBlHgiWxC34iujY28VT0smV8=;
        b=iqc3+7oKU4kHraZOapHcnQqqgntWU7YOVd0E331q++lT62cw8oOlw4d2qsOse/2zbB
         tTo3mxLu/1KLZ+PBkwRRDmSzWAu96zHJv+pEMxcxj1btGTU21n463zRbArBsKmQ/QrGX
         bNyRUTtXwzjyPJdFWG8TY49MIo8SKItVsNyXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699307524; x=1699912324;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVo57WCE+yBWdXW5ghNzBlHgiWxC34iujY28VT0smV8=;
        b=IfKZU63+Qm9LFrgJbXvFEX975lOKY4tExwkH3rznhAQcLNtmtC5g8rGyLdtym3Yrsx
         JEkJWB2SIJe/DV3CRUmVnzsVF2BNhqk6/FJ7AiMxtOSW+kfrDg++xO6CGIgxfVs4Yycf
         L+jnAWon1NYzs5RsDa5RnuxJTDPKQKzfL3An1Y2uT2ZtUXaiogFTYNaGBN92hkD+8V2T
         ehq0RpVQFs77k6INOkxIMB8jrn1J0VlNcSW+/SDdej1urkuV5FUxAX30e3n1lmjCLkOq
         17+6/gVR925OLn1Om8htVjJNoxSMYDFouc+eUTTdMS7o4gZlIJEX+FGDQ9e2JmzeC3mB
         XTHw==
X-Gm-Message-State: AOJu0YxO9WFBA7d/vaGLd3/lwBfPGmwGLEozKRkrTukrQE1CgDOi59mC
        4mhLyZveT7N6O0EJA6CVaXrBkzOV1TGtGcleqXRcnQ==
X-Google-Smtp-Source: AGHT+IGoMZmXlof3qRXKV3ga7L59JCpBeZOTOn5oG9PGcBaLBsDEVxZfnY5MhzKLTYDK+MK80v8JRpm8XVUK+TZhSLM=
X-Received: by 2002:a2e:a7d0:0:b0:2c5:18ed:1802 with SMTP id
 x16-20020a2ea7d0000000b002c518ed1802mr30702923ljp.34.1699307523959; Mon, 06
 Nov 2023 13:52:03 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Nov 2023 13:52:03 -0800
MIME-Version: 1.0
In-Reply-To: <20231103163434.7.I1c8ab71570f6906fd020decb80675f05fbe1fe74@changeid>
References: <20231103163434.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
 <20231103163434.7.I1c8ab71570f6906fd020decb80675f05fbe1fe74@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 6 Nov 2023 13:52:03 -0800
Message-ID: <CAE-0n51TUvm0J6TSydNoXVwo0gihKNGOXPT8=XHJCe9ALwgyxA@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: qcom: sc8280xp: Make watchdog bark
 interrupt edge triggered
To:     Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andy Gross <agross@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2023-11-03 16:34:33)
> As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
> bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
> interrupt should be configured as edge triggered. Make the change.
>
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
