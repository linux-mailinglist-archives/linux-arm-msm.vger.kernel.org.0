Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F30667F053
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 22:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjA0VWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 16:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbjA0VWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 16:22:54 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B26BE06B
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 13:22:51 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-50660e2d2ffso84402397b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 13:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4vdOAOoqQyamu824Bg2jVnX0JB8+cggVMUUOa+AlpfM=;
        b=RIrwC5Z1pwvW6IXth4E7ECGZv6907LRLEhB9RED4jcLIwd3gzD49gsKzWm2b6OLsU4
         s1GU4eUxxSslsNtgxFClhqTiqgqjjvx9D8xoWht7JDPu6fjJUSA+xxEcO082iDUoJEWT
         JB87HTDSpM0uTAZfoNzx9FtRXJg45QGLC+lvqHyMIb5ymDA5YVWJK+kE4uSqr9tw7Zua
         An3tDk6d8hD0v1I5ZBReh2dgyUCNOulYRGtxM+0uj9u8F6L2QbQVTcNN2ORWJOqCZH6r
         2QG1SlDbCTxqWhi76j7jFHhAYVKhtEL3Af3qVbeApEVNgWJcTAMI6u1GUy35S4DAwB2U
         N6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vdOAOoqQyamu824Bg2jVnX0JB8+cggVMUUOa+AlpfM=;
        b=3IFOwSYz3QWUiLpuJhKfOrDLEC6EXe/RbOpA+auW0JzeSD9+97HqHM4yOuWy7zZNhL
         dhZMxzzOz0DZhjt8ICTboXHmZkuH+PptL/B4ZcKm8lMV2COjJoMfsYBrxLFtKX5fBlHU
         YJMQqoTZJJ323CA+q/Hr6h9HVjgyce7l5PDte1148iSLODn63zP8jiUNxSqUsJwOUfEt
         M7RGW3oT8s8IZM1HXQKq7FdDFMU8Jjm0BDs07CgRm2JkE77kHu0TlseexMjrf6PXMZPd
         gEXr08YAG/M3tdg5XepNxL3wFy23gh00VzdYOAzkkx4N/ZJxMEtAJ2XMdDKslNZOptTF
         oZtA==
X-Gm-Message-State: AO0yUKWN9AzfkpKkMFbqbu8FHE9UNhTfQgsadcEUqmoq7hTNfOwGfVkf
        4geWMUuM8EvSYi58Im8WmcMNRXKjghaXOvksq7M+jw==
X-Google-Smtp-Source: AK7set/Llav9UuJGUJ9624v7B8atuwarYYb+oB+F7FA5Lg+flMxFV4At7bePUiuLQUxF10HlFhWaE0Yc2vleylJ3laA=
X-Received: by 2002:a0d:d890:0:b0:4de:3f6d:76d0 with SMTP id
 a138-20020a0dd890000000b004de3f6d76d0mr1314848ywe.280.1674854570555; Fri, 27
 Jan 2023 13:22:50 -0800 (PST)
MIME-Version: 1.0
References: <20230127192139.299228-1-brgl@bgdev.pl> <52508584-47c5-2497-68c8-2c0044911aca@linaro.org>
In-Reply-To: <52508584-47c5-2497-68c8-2c0044911aca@linaro.org>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Fri, 27 Jan 2023 22:22:39 +0100
Message-ID: <CACMJSevqcaqjLQJ6_5Xn=hMbrsjdxGVM=9RYwYQ8hW_Uy-tRzA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: add qcom,scm-sa8775p compatible
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 27 Jan 2023 at 20:56, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/01/2023 20:21, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add a compatible for the sa8775p platform's Secure Channel Manager
> > firmware interface.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
> >  1 file changed, 1 insertion(+)
>
> If you send bindings separately from DTS (which is fine), please provide
> the link to the user - either DTS or driver for this compatible. Driver
> does not use it, thus to the DTS.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>

Can you specify what kind of link you're expecting? I'm looking at
previous commits for this file and not seeing anything. There's no
upstream user of this compatible in any DTS yet.

Bart
