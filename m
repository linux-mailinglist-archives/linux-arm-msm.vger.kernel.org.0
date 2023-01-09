Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98CAA663592
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235189AbjAIXoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:44:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237965AbjAIXoL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:44:11 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E82A3F468
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 15:44:04 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bt23so15577813lfb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 15:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcrRX6H8xp5Sk/eiYa/8jSn58hXIIDs/40rFnvHatxM=;
        b=aE29FKyw5VCyplJZ49sN/3CBFWPpzJj1UQcRh3OdBbnwYcRX1MVJzAezhrX9uPburb
         NrT8IItYs5o+i8FXVRtBKRZ3iaX+cMMmSnz7IEG2eLdnuT58a6ZgXUnCrH/u5Hb1xwIE
         uZpNLvWO6BvirybeAc9jHxQEd+koXpbfsnn+b5cn2MyZausk34LTCgj+FKuBP/MW0ozR
         PJewvdRuhXZrQsmbKu/SlKlTaIoKTuXnQpuif8GVrojSZ0G9pdcEtPG9/FENp944sgVP
         Aqy2jWC9svZ8R4yW+CWyDqbmTt9IOSWFRuSTmdHV3YRN/hdpoRZ0WOUf6wXcKtRb7k62
         U/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcrRX6H8xp5Sk/eiYa/8jSn58hXIIDs/40rFnvHatxM=;
        b=59MbEAxAM+gm2stuO/1o/s1turXH/HX6RLiZeuUtW1spcxtqfSL7DcbCmoTgXL0I93
         eEMkcpikUvJFf2VT0d+QrxrSOQPEMHAkT/bKuLRvGGkWjHKVJ/zxUU1k11i7wMYq4iwl
         AbwSI4+hPwz4ySgzZtpJHgoxXl+cX51+lHakNKW/+Qol0wZC7DgZSLUJKBTfZ3Ooh8nj
         MsFCKo/S1fPqb71mwBSotjTPblZrO5cEOdGmh9WHmGYBJbWkooaqWv/ZCL6qUcgT54ny
         ghVHRqFXTdqUopbGeT3u3QrlAVIW+DBjlby6OvKYziZ045xesr8aKnOCCmXy31rf6iDd
         oAQw==
X-Gm-Message-State: AFqh2kpF50YnMesfxy/iwTE00ZetEqB7lcux9dh3z327khRf3iYHTs3X
        sRegMT583ueOiA77vGHAkDE7gA==
X-Google-Smtp-Source: AMrXdXvRa4ih3Ean3iUpIuLKGXimMy+4FurohIrwM63ewZc0Y5M+Xq9gtZvCqUBtV9qLWZ4cKirbYA==
X-Received: by 2002:a05:6512:2624:b0:4b4:a224:96e with SMTP id bt36-20020a056512262400b004b4a224096emr19681654lfb.50.1673307842662;
        Mon, 09 Jan 2023 15:44:02 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:44:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Subject: Re: [PATCH v6 00/11] drm/msm: add support for SM8450
Date:   Tue, 10 Jan 2023 01:43:46 +0200
Message-Id: <167330408780.609993.1433336946810204585.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
