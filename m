Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCED66350A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237682AbjAIXQu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237700AbjAIXQP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:16:15 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 223DABC84;
        Mon,  9 Jan 2023 15:16:12 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bf43so15543179lfb.6;
        Mon, 09 Jan 2023 15:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcrRX6H8xp5Sk/eiYa/8jSn58hXIIDs/40rFnvHatxM=;
        b=Tuo/Gox1iTyeafNpXOZg0Z42lZIj8MiuNPQMOl7xakbXH1hJTRTDdDYfkhL1jo9rd1
         /tIr30oMAT+jy6zH8LvzdLHhtArGDY1k1MWGfDQXnNgzlfloUGnEdVe/AuLF5hMWoWQS
         Gq+6i/mwXjfFDZb8WRY7FUnq54Zr/S0t8aOdibGNFEXb4f0Rl7UhuvZ1tkPPkOk/wmkg
         Hu7psyHnHOFDXVHsFE00hIZDogkZoYqF0xEvxTJ26iFXmoTF5lzV7IJjgKITD4GGszRP
         HFQPhvHuWHS/dSZPAh2uEbMWMQ7JmoOGYaK2OWhpeOMt7fKzDeNQu9HpWqfvl5AdEJXl
         z85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcrRX6H8xp5Sk/eiYa/8jSn58hXIIDs/40rFnvHatxM=;
        b=6GYTY8gDSmCJ1/ZuvUNCWPzRtR4vCHg3mJv6RiGGrhFZkISNNTgOnrXF6FbmrtliKP
         GkUqi26idgvxYaPjPKZDtur46lCXbySZF+08TFVbPM0u30ZFZF98I3kYQf7YChgKNH0p
         fJVWIsDzwcZx/dniH/eQHWOnamTP+Ls4frt+WWHKO1RCK7CFoQ54L85QOziHjMnpjCnV
         s4E/9TS/O1E2U+A4miyxU1ArxCPDyEUUGxryT2zuBtuIwKit/DjEUKeOKGCveu5fN4E0
         +QUD+FCTsxAYAX3SzXjBTNMdJljWDYqsTT71LYDNvH+46GGIvAm+yXqv6tl84xRy6EkX
         2h0g==
X-Gm-Message-State: AFqh2kpdTPYHgbSmn8ztIH5Wd9z6vPz2qhTI7BjdGyY5rz3WB97vV8xd
        tC0S7rhRWYNb0lgqzCtKGQA=
X-Google-Smtp-Source: AMrXdXtQXEAnbQr/1v8NIUErWlyHAG56vSs4OyGVxT4mCFzLf8rCPDNeB+4HMUQoZzZxDe1tVJmqew==
X-Received: by 2002:ac2:53ab:0:b0:4cb:145d:c407 with SMTP id j11-20020ac253ab000000b004cb145dc407mr12469600lfh.7.1673306170521;
        Mon, 09 Jan 2023 15:16:10 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c14-20020a05651221ae00b004cb003c3b2dsm1834230lft.175.2023.01.09.15.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:16:09 -0800 (PST)
From:   Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 00/11] drm/msm: add support for SM8450
Message-Id: <167330408780.609993.1433336946810204585.b4-ty@linaro.org>
Date:   Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 07 Dec 2022 03:22:20 +0200, Dmitry Baryshkov wrote:
> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8450 platform.
> 
> Change since v5:
> - Added defines to be used for the MDP_PERIPH_TOP0 blackhole
> 
> Change since v4:
> - Fixed commit messages for the first two patches (Krzysztof)
> - Dropped clock-names requirement patch
> - Removed clock-names from qcom,sm8450-mdss.yaml schema
> - Fixed the schema changes lost between v3 and v4 (thanks Krzysztof)
> - Added kernel doc for DPU_MDP_PERIPH_0_REMOVED (Abhinav)
> - Fixed build issue in dpu_kms_mdp_snapshot() (Niel)
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: display/msm: *dpu.yaml: split required properties clauses
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0f87fc933e0c
[02/11] dt-bindings: display/msm: *mdss.yaml: split required properties clauses
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e96150a6dc14
[03/11] dt-bindings: display/msm: add sm8350 and sm8450 DSI PHYs
        https://gitlab.freedesktop.org/lumag/msm/-/commit/44a9f577a087
[04/11] dt-bindings: display/msm: add support for the display on SM8450
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f7463946c281
[05/11] drm/msm/dsi/phy: rework register setting for 7nm PHY
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1a1bd3f45000
[06/11] drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e50c901f93e0
[07/11] drm/msm/dsi: add support for DSI 2.6.0
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1b55304af89c
[08/11] drm/msm/dpu: merge all MDP TOP registers to dpu_hwio.h
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3bb86d2c6cba
[09/11] drm/msm/dpu: add support for MDP_TOP blackhole
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ae7459d07d8a
[10/11] drm/msm/dpu: add support for SM8450
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8cbbc3396065
[11/11] drm/msm: mdss add support for SM8450
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4d285825f1b7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
