Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D26157272D3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 01:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231674AbjFGXUL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 19:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbjFGXUI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 19:20:08 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC544213F
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 16:20:06 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f642a24568so46887e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 16:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686180005; x=1688772005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyY/6IODHDlyeeop9FZuaK8o19bhh4JMPkyiNt+oF7I=;
        b=A9Vo0XkJIpgWyLRpiuu4l+nqzYPZyLpVqVdvCiGXgVQ1bC5U/NMMhRPj2tMBh1pHlz
         4E3UGxsRvR8xbq/CTMWAZEoIbXITXi8fPElZ5zapepohNCtK/0DWv/89o6AXmp0itP2O
         TWMW2xpyJylMKi+csThqo2mUbBuD8VdyBd3oySuu7CTWcEQDRdQv4GdGXv03pHoJastY
         B3nTDZc8VnZ9emMvGY4b/6QPd2nP+3NfvlmtSsvIqXvj+O+ehhxQAoT3W9qganeqYX/+
         icJ+rMTamrIocafOYueceNpwIpEAWwRFJ2UcGgRoTmfT0X3GKxwB29afKvLfGfk0+K58
         iEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686180005; x=1688772005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyY/6IODHDlyeeop9FZuaK8o19bhh4JMPkyiNt+oF7I=;
        b=dknlBH+43oYvL9rjn11/mMrJXRRTgh7UqQRZcZMIt9f1KFkYZohW9r9+gnPsi4rAs9
         GCKyliZdqOarLgYBB+DMmakS+Hx7d9O9pQd/taOHaUZBonxAb5bU8dyEaCmE+mdhcgsM
         HTgTZE9f1DLkQHb3Vya7+tnFvfpbFv3xoPdP4fYEorZbyitJ+Iz0hdjL7CubF6bJU0Ii
         N2eMCm60hXXEKfzUtuLUyn2fhMUaNYHgUzdOa4J8YwDMtDJOI0JcM+r+S9tbLsyT0CPb
         UL+aqc+LYW88MvOVmCIsgKx/TzX94RvRNvO5/143xN8PcOge60zkj1L0Lz6fs1kh3Rfe
         A5Eg==
X-Gm-Message-State: AC+VfDw5rURp9OT3w+QM5e8Sh48QI7qUQt4ZaY86yjHXaw4ys3+6FhmU
        u2vCvmt6yycSQMsTQusLExKH1A==
X-Google-Smtp-Source: ACHHUZ7hRM7SbUTZb8qBUPmUIUaSTu0RbpCLtAbbhmsR/dpPRr3/MkmoarjoWZTP2QKK3G21z5N7rg==
X-Received: by 2002:ac2:430e:0:b0:4f6:2e4e:e41b with SMTP id l14-20020ac2430e000000b004f62e4ee41bmr2199648lfh.3.1686180004908;
        Wed, 07 Jun 2023 16:20:04 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h18-20020a197012000000b004f00189e1dcsm1908952lfc.117.2023.06.07.16.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 16:20:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v6 00/12] SM63(50|75) DPU support
Date:   Thu,  8 Jun 2023 02:20:02 +0300
Message-Id: <168617996601.1879421.15966890603577062057.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 06 Jun 2023 14:43:51 +0200, Konrad Dybcio wrote:
> v5 -> v6:
> - Drop unnecessary items: level in bindings
> - Use INTF_SC7180_MASK for 6375 to avoid enabling DPU_INTF_DATA_COMPRESS on DPU6
> - Pick up tags
> 
> v5: https://lore.kernel.org/r/20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: display/msm: dsi-controller-main: Add SM6350
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e99b2d0670a7
[02/12] dt-bindings: display/msm: dsi-controller-main: Add SM6375
        https://gitlab.freedesktop.org/lumag/msm/-/commit/27a869221bb7
[03/12] dt-bindings: display/msm: sc7180-dpu: Describe SM6350 and SM6375
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ed41005f5b7c
[04/12] dt-bindings: display/msm: Add SM6350 MDSS
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3b7502b0c205
[05/12] dt-bindings: display/msm: Add SM6375 MDSS
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2a5c1021bc77
[06/12] drm/msm/dpu: Add SM6350 support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3186acba5cdc
[07/12] drm/msm: mdss: Add SM6350 support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c2c1217e61bd
[08/12] drm/msm/dpu: Add SM6375 support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/27f0df03f3ff
[09/12] drm/msm: mdss: Add SM6375 support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5ff3d3a0a09e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
