Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56C8A5F3D4F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 09:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiJDHe2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 03:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiJDHe1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 03:34:27 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C704D144
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Oct 2022 00:34:26 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id nb11so26982808ejc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Oct 2022 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PB8GJk//RqejjOnpATRYeyDuPsbXbNB+nSYv7IkV3dY=;
        b=uUwDwLTCDuc6k11DNLdxKvouWouNrX5htEl6budcfGy+KnBLcSwfza7E4uk7TLzJnx
         P5bxfDbnb0CMlTFfQA4LxKReVwR76SFkmPkIRgj0oJbBdCUpAPiwUSqTuGhTRZir8IWm
         mOZWLNW/+GF7YeCI4/rPmANUebw6iKIMM3S0Hy6+vhGamhcy3upGINgybT/8xPszgjZM
         4uBBc1hUwPRzVCnd4xVU77itt/X4xWYUwbkVYZ0/r5pdgWWb+K8H0oeB4Erj+uFKhIvD
         4O3wiwPkC1JxBdOjcFem6UKauuxuIAPBS7oqdd5ZiBeY/w3Wm8OtrnG7ACuyCYkBF3Ws
         FCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PB8GJk//RqejjOnpATRYeyDuPsbXbNB+nSYv7IkV3dY=;
        b=Z60y9vn0NdjllgWvC/Jc8ffJzV9M3mPR0zVt4w2xN1X9Wq/K3JGMPxDLwM6T0Ef6n8
         GilgcT6fij5Mjv6V8KssiiH0uu0xkNbZXqovbGKJ0kJAUHHyxFaFqIi4LzoYPBvxfroY
         +V/jtKSjYukzt+xYNKyZdEJrUMOZ7ABkjpN1uz/eYe58Yrc7ksehoGhyCvu3ECXpPEvl
         Mqor6GhQzULHn27rwOwworDkOHSw/dogGBSXuVoUsW2y6La6ndgqPt3vo7+fBbOaaI0S
         17h9FGUxxdDj0+JiKn1jIV8ESgFfQq0qMaKTQGZPCzcQaT5vHwP5ysDJjqwlUVlW9TWk
         Y8Iw==
X-Gm-Message-State: ACrzQf1rylin3gcu/1hDbqw//ac1qZ9P+faDqRcTBrmTE8+LngXyB/fy
        xUydv6wMJBOSo5hY5CNqG9uLsd4FS+ovBDpIkUx7bw==
X-Google-Smtp-Source: AMsMyM4u5QfJ8I4XjmQQ8y27SrW4rIzRwTXevnfaj3eYh/net7YfV7Hustl0WtRIAAw7Cl7QwSDaDDl0rofndt5II+U=
X-Received: by 2002:a17:906:8a46:b0:781:71fc:d23f with SMTP id
 gx6-20020a1709068a4600b0078171fcd23fmr18431943ejc.500.1664868865231; Tue, 04
 Oct 2022 00:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220925112103.148836-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220925112103.148836-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Oct 2022 09:34:13 +0200
Message-ID: <CACRpkdb81Vh1zZDeHArOU4chmT4_5YyEXza5Vvp_n2fHJ_YBew@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: restrict drivers per ARM/ARM64
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 25, 2022 at 1:21 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> There is no point to allow selecting pin-controller drivers for Qualcomm
> ARMv7 SoCs when building ARM64 kernel, and vice versa.  This makes
> kernel configuration more difficult as many do not remember the Qualcomm
> SoCs.  There won't be a single image for ARMv7 and ARMv8/9 SoCs, so no
> features/options are lost.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Changes since v1:
> 1. Restrict MSM8976 to ARM64.

This v2 patch applied, because nice.

Yours,
Linus Walleij
