Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C32D2668914
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 02:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbjAMBZG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 20:25:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240216AbjAMBZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 20:25:05 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1965D882
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 17:25:04 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id j16so29257713edw.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 17:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FkSGzKLP31foCEIfqBMrPQ+sr4Ss2mq0m00vv8lVFP8=;
        b=Uj84m7aLrzQ2vmYs3MiN9Hy6+b8j8fwkMA4nmGCaAzzO2tVviAEJpU47YOkZUearEY
         U3NUboGAIGBmKOsW9VbuFMVhaPNfdmRS2bhwRiloRxAD+MXxwyjEDgvSOgYzyOTcD+A5
         e7bWCkCPvx+r81e9Spi4f4DhscTecLVR6+8XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkSGzKLP31foCEIfqBMrPQ+sr4Ss2mq0m00vv8lVFP8=;
        b=0Oel7jkBYYiWZYh1Yy1jP2diJogz9PXDq5iDTCexK+e1jazWX6B43Y5ptp4mf3PGip
         IePQlEl5rwQ9MwvFu1YoVCCYTD4TLxjb5fcQEjtz3ap6JFOHig6pmfp6UDU4zmutQQnM
         HQcERuDVi5a3oQ4xo+LRNG4ZuO6cKKudxpqpwWANTLXZMj1A3o+CD0IECPJZRQYwVi6D
         drFzF8f0ozMWOp5xViBq4WMph72nXMp5yPAkn/ncmW7noR3C40TObtTwrWMRcCuCClIJ
         vM78IIcl7dUokHV4B7UGkTj9aJlxBsHICHy8gEpZW+6mtnDAB7uQBSMDRQ9UxY0bD9TA
         IMZw==
X-Gm-Message-State: AFqh2koqNYXbgyraTArml3NJziVneyXd5YScU0HgrvheNHCyvSNWwi2o
        782RA4MgYhSrccoAgTSr/dx/luBI0s1iS1le8XVW1XjeQ6KerRvx
X-Google-Smtp-Source: AMrXdXt9YPqmODUWTW0ZOAI7HpYX/Eqsg4YByz9C+W6v+fCAoybeZvOmsBLH3dYxnAshGkwgdlDFznEh4n6rckabBPc=
X-Received: by 2002:a05:6402:1c99:b0:49b:53a8:4b9d with SMTP id
 cy25-20020a0564021c9900b0049b53a84b9dmr628021edb.323.1673573102966; Thu, 12
 Jan 2023 17:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20221221071734.2887901-1-judyhsiao@chromium.org> <afd7851b-0846-c21f-a769-10fb920c7c80@linaro.org>
In-Reply-To: <afd7851b-0846-c21f-a769-10fb920c7c80@linaro.org>
From:   Judy Hsiao <judyhsiao@chromium.org>
Date:   Fri, 13 Jan 2023 09:24:51 +0800
Message-ID: <CAJXt+b8eez8KTocoAi0WP8qC3YdA9bfOTPbY8ZGfXNb-MNaT-Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: add display port audio
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

> Why do you change link@1 from DP to ALC?
Because I want make the order to be consistent with the 3 mic version. Thanks!
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi
>
> Best regards,
> Krzysztof
>
