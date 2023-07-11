Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A584D74F1F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbjGKOWg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233443AbjGKOWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:22:16 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC821728
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:21:59 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b6a6f224a1so94727271fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689085316; x=1691677316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4OHhf//BH7yn6Q/Ot3BJTEK+Wcory0adfABT5r6wUE=;
        b=tyWb6Y5kdmHtSYc89DJi1+pl8lGEj05MyNn/Zv1MCiy8+izcQ+Vp8EUkoZ3o5QHUwA
         QErrdevOrnHl7ZVkvMXUf5eAJmT2FEEibUl/eWrQFeNZ5KhBM8sF6D7pkY6P8hiLEneC
         RXgxh2TOoi7msRqZWLV9/qhG+9WxnnjEehnGHMJ6AGiD5rTirRDezXqOaBLNrTCD+PQW
         QwHIRS1IncPuoOgatcUULna+4VK6MKjmstJl+hUQ13m5n/xq/u1V84O9WBN+ddOTjFVV
         U6Q0NOeB+I1oiAcI7+NKaB6fFMJ9Qdtnp4IuEu3LCMGqkKMu0JvVAku8l8gWrRwBwPoA
         PX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689085316; x=1691677316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4OHhf//BH7yn6Q/Ot3BJTEK+Wcory0adfABT5r6wUE=;
        b=e40Q0+rplWVPsV9RWHWJXne9XO8HaEw0oTOwCgCStz5usnZyYUaJyH7PWHOqEOA3ic
         kg/Fq+v1QCquvnNJzao4brqmDdoT21pw8E5GENZXuQrJq/6/05evN7q2KeIRW8BuOlmR
         qj/L6mdmt6NPhxW+ltd0WVqsI0/MDF91FhHV1qSh3kmS+3GuVLm/Ue1uiRLYKTwm8CmH
         UC/lp3FkqyY6Qp6brSve+PgX7qs3lO/0CscJv2p3UCMXse5vsirVKskrCsJUK8PUwRpm
         eVeBS8rTDxXFHlWiF5CQVZV3QWkX46EGhKAZlUiRbAbXyhoDPZev9qWuE3uBdzM9X0+P
         2PcA==
X-Gm-Message-State: ABy/qLaVMOqdjoxFHhXIAvdU0ejY6TCg6g6HHad0UlOMeX+OKk1jdAH0
        BcUYm8IAtXVyRotSwyyKrrvf4g==
X-Google-Smtp-Source: APBJJlFAMhH5pIJfp4bCLgKjGyunfjO3nmFym3bFGd0v6tXuy2T+eDybgK8uyTe2IuT1NOb+EJ5WvA==
X-Received: by 2002:a2e:8887:0:b0:2b6:e719:324e with SMTP id k7-20020a2e8887000000b002b6e719324emr12798365lji.49.1689085315755;
        Tue, 11 Jul 2023 07:21:55 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:21:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/5] arm64: dts: qcom: qrb5165-rb5: enable DP support
Date:   Tue, 11 Jul 2023 17:21:44 +0300
Message-Id: <168908465040.1869384.6896423598850742702.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sun, 09 Jul 2023 07:19:21 +0300, Dmitry Baryshkov wrote:
> Implement DisplayPort support for the Qualcomm RB5 platform.
> 
> Note: while testing this, I had link training issues with several
> dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
> or VGA connectors) work perfectly.
> 
> Dependencies: [1]
> Soft-dependencies: [2], [3]
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: display: msm: dp-controller: document SM8250 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5ce85953cc45

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
