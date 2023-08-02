Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 632FA76C9E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 11:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233285AbjHBJzy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 05:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232271AbjHBJzv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 05:55:51 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405AF1BF
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 02:55:49 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe457ec6e7so2775390e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 02:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690970147; x=1691574947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iphRN0MY2MtgUPU4uH8Er2X1AyiNge9v/N2Rem14Rkk=;
        b=kDG43E3P3uN1JBiNHnopTh43p3mXSgOkLZK6mwJSdib/57no5KTRao5OzZBLuhptDC
         ghR39QWLnru3WOP7sAD4T/t3C46Xemqit2GoPULrPAEEyNWwmqaabkZJfNNLd0LUKt+4
         BmnvkorSd67mZd3TRZnJbjIwPjfrpvlGfXna9rVCogjrG8wZyyHVoq0xuuh/M5zLGmrK
         ZIMb9hmToJTPPCN/mdFfncrcewaLF3lUmaUc9YWUbAhRzEzKl+7B7QBqfcfuISWgF1P4
         3Fofq9ZDMmYSPgFhxsd0nvBUBqBwoNZVYyfRmIcn04lfGWCP8hkCioiBiijqXG1P+leE
         SbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690970147; x=1691574947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iphRN0MY2MtgUPU4uH8Er2X1AyiNge9v/N2Rem14Rkk=;
        b=DRTOZ2iH/ETuVB8PmtVA+y8imiFgeJ1zAXNY4g8sPtSMPfcSKzck00L6w2EqxvdMZz
         6o41anHd/Km5CuGiym3zL42isb3+va8TOh3N9DJi838nxjRBoQ226eEWouc/33uzamfx
         TUbp5UFx84Zb87TWDmibX2URC4gl73BoYDLjFh0rTNbZvdk5ioU1JldEEPpWkUNON7OC
         nYhVsfUQW3P2Z8N9vq/ZPalsm+/q1d3B4yGCdgrOkw9zq6L0hlUshl6ewHYRcn3Nur9d
         K1Efk0a1Xcq/VQgfpU5SIZe4jMVQm+WQAljnRQ16K/4bKlnDyBWNJHXSYL+9EBkJL9zs
         GjHw==
X-Gm-Message-State: ABy/qLZywJdNpYYJZqkiw/uzEg0vD3tkEnGeOz0aoYhGaa4K/asZcxdt
        nPD/RR2uZsim7upJxiKXtrYltw==
X-Google-Smtp-Source: APBJJlFze9oTSl4rl4neTa9DH2tYbdCR8ijsBfdrqqCX/nt9jY3FI/jy/9N/lk9Os3h4JTx/WBMWHg==
X-Received: by 2002:a05:6512:78c:b0:4fd:fc3d:cce7 with SMTP id x12-20020a056512078c00b004fdfc3dcce7mr3645729lfr.44.1690970147400;
        Wed, 02 Aug 2023 02:55:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x17-20020ac24891000000b004fe1960dd7csm2779762lfc.132.2023.08.02.02.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 02:55:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Bryan Donoghue <bryan.odonoghue@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Amit Pundir <amit.pundir@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: display/msm: mdss-common: add memory-region property
Date:   Wed,  2 Aug 2023 12:55:42 +0300
Message-Id: <169096995982.4183272.12912811169015846101.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230726132719.2117369-1-amit.pundir@linaro.org>
References: <20230726132719.2117369-1-amit.pundir@linaro.org>
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


On Wed, 26 Jul 2023 18:57:18 +0530, Amit Pundir wrote:
> Add and document the reserved memory region property in the
> mdss-common schema.
> 
> For now (sdm845-db845c), it points to a framebuffer memory
> region reserved by the bootloader for splash screen.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: display/msm: mdss-common: add memory-region property
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b4b405040689

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
