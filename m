Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A76FE55EF6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 22:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbiF1UVw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 16:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiF1UV3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 16:21:29 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93A53CFD3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:18 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1013ecaf7e0so18513189fac.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3D1wQsZGuuVUKBF21nPtkvETeOjCe5u26zqPXV7A8eE=;
        b=VHXhtJBiqe5PnhctWM0i5Y0sHqqxEvI8NUiFjWywMGz9dxuQwgSkxpNmopP1sepYD4
         IKDU4LcuQW5idi7EIMX7yMaM3f1qmRUq2ACvipF6BVl2nL/d4lfTP/v1E8t3z4/LKtvx
         RZkFVoepMJcRJkSr1sXBimSgtyrBhqHQ8FlF9Pz0S8i2t1jhfBniRVcT8jSD0lRIynyS
         raES209La06FdomMeOIrZeyFRhrsvbe0WuVmLKxYY5+dHfMkRgeLfL3TEKeU3XZCOXor
         Nf0jZT2AcgrI2391cKyFEt4rTMC0tqs4zL+DsRCDYcvz9tIh92FdS0+NWOX6u+0iN7mo
         Krkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3D1wQsZGuuVUKBF21nPtkvETeOjCe5u26zqPXV7A8eE=;
        b=VR/OfTuOI/pvABa/0q1TZFgqM9bWlMxmaPRimbAYbrkEtAP05GICodVmcnXKvP/Qnb
         FqFGHBh2kMU407ChNdbQD/B6vS6bQ5jsNoqli3hhAXr8MZZixIyEHYc0O3ZKr1oUi37K
         lASR1psL9pYa5CVfgkCTfATPudM4RlPWufinYNxswV1J8Pqyq9B53VArLlrGPPt/fyLL
         r0r0GBdYw/+gTnF+pU6I+yV85mKvtzfPcE/wOzvbtAdgoaD10JtuxnM60vy1wyWB7H/8
         Cj8zfusaQY8/qUNMIINLA1NL0F1Pm7YndkcwiLAsCZ6RolbK4NHQXUidm5y04xYLIAQR
         KmGQ==
X-Gm-Message-State: AJIora+A+7ekvn2WLeSFTzmtStv9WUckRxys2rLfbs7Ft/ePBc2A/XaC
        O0kW1nBAEDDNnUJ9wVwt1x2OIQ==
X-Google-Smtp-Source: AGRyM1uCj4K8HZgzAn/2gQQ1mnvlPYWErYpc6p4Zxp4v7kO4RV2R4fUSfgvJQn/OMGIcyTV4idQY6A==
X-Received: by 2002:a05:6870:2418:b0:101:9461:787c with SMTP id n24-20020a056870241800b001019461787cmr916524oap.196.1656447558122;
        Tue, 28 Jun 2022 13:19:18 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm9536923oaq.55.2022.06.28.13.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:19:17 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~okias/devicetree@lists.sr.ht
Subject: Re: (subset) [PATCH v3] arm64: dts: qcom: timer should use only 32-bit size
Date:   Tue, 28 Jun 2022 15:18:53 -0500
Message-Id: <165644753306.10525.18328848191799926399.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220626105800.35586-1-david@ixit.cz>
References: <20220626105800.35586-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 26 Jun 2022 12:57:59 +0200, David Heidelberg wrote:
> There's no reason the timer needs > 32-bits of address or size.
> Since we using 32-bit size, we need to define ranges properly.
> 
> Fixes warnings as:
> ```
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: timer@17c90000: #size-cells:0:0: 1 was expected
>         From schema: Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
> ```
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: timer should use only 32-bit size
      commit: 458ebdbb8e5d596a462d8125cec74142ff5dfa97

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
