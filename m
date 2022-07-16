Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32329576FB3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231983AbiGPPTU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231797AbiGPPTO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:19:14 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2094D1CB29
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:13 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-f2a4c51c45so12810560fac.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oGpMze8Cu0x5aw2jz/djjciZugDe/TnizDWYWXMdwrw=;
        b=hvh+ZXn27ZYbuIcHm+5baX0viLyxD9zAwNRcRcHRZhgmbBWaMgcnxPOR2Sc4IMCibZ
         C0ha3b32m5PMps1kCfPEoAI6+v6U+iEduO3Mc7NBcfwoUbtpfPtHETxcqKAyGxUd7Yif
         koRm+tpW/YDraYTfGXw2wyInOYdTKqQkLsXnJ5VEBDC6rTHwV/B7nCMhowFnzOHilHGM
         X0T++/P76k7eGh6OJxi4npjOiqHiF5Cjd6wNxSsaLzFRPVgFXIebxEi8zho7C0jZGV6n
         H6Av2TtX5t/FqmJXNKb/2GreIHtzbkD77k9YCusY7owoX9607IgUnBksp1Bbqr0q8IZ2
         4COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oGpMze8Cu0x5aw2jz/djjciZugDe/TnizDWYWXMdwrw=;
        b=lrWJYjS/B45gKo8eNhvnP3SSmJAr88u2l0e5ivfbiss+GZbfT7U7I5KWmuOHRasZ6k
         rttgDKY2CheMNLIW6mpMS6ajEVdRTqa0RsSPKwKS/5lBpxXrNYEDrxLU4B0DYgTuhf9G
         IUZPbniqjK/Nc1/a+yIDZcG8AUif3IQmILHQt+slBtjsWxz7m8KD/E9BvlOKaBwZIo2X
         1OXfRnNBwVfCz9Xz/BKeb36t8OKshx8RskXYN9gfYnDj0gcN/Vh8n4ESTgbBsntyWSDD
         8K70UFn+w8Pe6j4OKEZUna89XaPKNKpDs9L0JJ5r9EfEJwBwocCSvU8IxdG136pBh47t
         C7pg==
X-Gm-Message-State: AJIora9zPFm9YIX8O6B91ApR2IOzcBe6HeVuGgwATniDyoitfkJBZRLG
        nrXJaENSVnLJrh4Wdse/JV0eKA==
X-Google-Smtp-Source: AGRyM1vGN296YAzt/BeCYxhczcXUWMLFb+GMEusEzYT6LCFpTZKDhdqpfPXaxfKZZTkGU2MgUWYtzw==
X-Received: by 2002:a05:6808:10d4:b0:339:f690:1ac4 with SMTP id s20-20020a05680810d400b00339f6901ac4mr9650262ois.210.1657984752392;
        Sat, 16 Jul 2022 08:19:12 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:19:11 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>
Subject: Re: (subset) [PATCH v2 00/11] dt-bindings: display/msm: rework MDSS and DPU bindings
Date:   Sat, 16 Jul 2022 10:18:55 -0500
Message-Id: <165798474063.1679948.9453224348232992822.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 10 Jul 2022 12:00:29 +0300, Dmitry Baryshkov wrote:
> Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
> devices). Cleanup DPU schema files, so that they do not contain schema
> for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
> afterwards.
> 
> Changes since v1:
>  - Renamed DPU device nodes from mdp@ to display-controller@
>  - Described removal of mistakenly mentioned "lut" clock
>  - Switched mdss.yaml to use $ref instead of fixing compatible strings
>  - Dropped mdp-opp-table description (renamed by Krzysztof in his
>    patchset)
>  - Reworked DPU's ports definitions. Dropped description of individual
>    ports, left only /ports $ref and description in dpu-common.yaml.
> 
> [...]

Applied, thanks!

[01/11] arm64: dts: qcom: sdm845: rename DPU device node
        commit: 1d52eb6cc827d0f166c728a7577609de75b6b8b1
[02/11] arm64: dts: qcom: sc7180: rename DPU device node
        commit: 37e3558b79392ab864fe887b4593c5f737e063a5
[03/11] arm64: dts: qcom: sm8250: rename DPU device node
        commit: ce5cf986cdab1973df0042ac5b743d5df008c338

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
