Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F64E576FBD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbiGPPTV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiGPPTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:19:17 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F14C1CB3A
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:14 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-10bffc214ffso12879678fac.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2BfUBNX0n4f7Y1GuZE8KebgbvnSP7yeh/EvnDRpvCc4=;
        b=RXKq1U3siS6bIgkdCSzjsN7UFRZ8y9IuH/qUYCmif+bguUzUPRlkwoDtalAZ0YR/we
         ocOZdeJiTuy8IgBaKAdDAIOiOZPwZng0KKhWpT9yIf6/HsCmVElEvLC6DwWHmfIRp235
         1Rc2yZA+0tpZBSIhBstSWIvT/cJdVbmhG6CGhQ5Q6LeWW1l6AMk/Ov+Sra+C54HHX38+
         x+SXGDt3GhfjMoYbGHMwd8g6t4D3OtJY272ADjHpu4e3np3/3lWbO+J8IczCXdf7RrBq
         3HFAZzSegS6UW9vQWKxQMARJ0+HEupvW/YEZ3TMp+FhsZiVLPiFuGYb264rzncEXQ/fS
         HgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2BfUBNX0n4f7Y1GuZE8KebgbvnSP7yeh/EvnDRpvCc4=;
        b=JZTwa+srf+W/NiK5WCVJYMJKaJ5cWG/fCe9cocBGmc4fcdxfhTnZUiHzEXI93wnI9/
         na8SYIBk4ynZMZgDChQ2JB9TsB3mIwTBH7fQNGrRSlydLpLDiQZF26NGP/K+/8UZHIuJ
         GbAKH3HSeRW/Zew3aWOBMBxaukhljZweuWtsu9xlc5nXahPo7EIOBpIMPYA49znc5G3W
         9iF6mmN46mkIHqYWKx6E628jmVyqgTCwd8SrNK9vVRo3Lqml3r7fpdIBxItVRYwnll3X
         YUyOgNE7CPAnM25yGkxw+670WAWZfgPcHiLjNUnnL7mpnxMBzhBIVNj6KtP6HMeAt98b
         iGOA==
X-Gm-Message-State: AJIora9sQeXYO8HR/4GXrQxlFdk9Y3mJldpOVokxkJvYG6M5tX02inwj
        XO9+83377oZwJRiQqODfRpj5gQ==
X-Google-Smtp-Source: AGRyM1u/D2i6YeZOgWbUezAgdhP7f+kntmr2LOIxra9vYBNzRoQL4ThNgjAlIhOQFnQ5V7g7bkxwzg==
X-Received: by 2002:a05:6870:468c:b0:10c:2a38:dc53 with SMTP id a12-20020a056870468c00b0010c2a38dc53mr10485811oap.258.1657984753383;
        Sat, 16 Jul 2022 08:19:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:19:12 -0700 (PDT)
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
        freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: (subset) [PATCH v2 0/9] dt-bindings: msm/dp: cleanup Qualcomm DP and eDP bidndings
Date:   Sat, 16 Jul 2022 10:18:56 -0500
Message-Id: <165798474063.1679948.3345784411436929832.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
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

On Sun, 10 Jul 2022 11:41:24 +0300, Dmitry Baryshkov wrote:
> Fix several issues with the DP and eDP bindings on the Qualcomm
> platforms. While we are at it, fix several small issues with platform
> files declaring these controllers.
> 
> Changes since v1:
>  - Reordered patches to cleanup dts first, to remove warnings from DP
>    schema
>  - Split DP register blocks in sc7180.dtsi and sc7280.dtsi
>  - Cleaned up the p1 register block handling: marked it as required for DP
>    and absent for eDP controllers
>  - Dropped unused xo and ref clocks from sc7280-edp node, they belong to
>    eDP PHY.
> 
> [...]

Applied, thanks!

[1/9] arm64: dts: qcom: sc7180: split register block for DP controller
      commit: b7b17c6bf3d18d12f198a5ab6ae2f093545de643
[2/9] arm64: dts: qcom: sc7180: drop #clock-cells from displayport-controller
      commit: ae0f7e1d97cb047ab5aeb03c8987671a2da93030
[3/9] arm64: dts: qcom: sc7280: split register block for DP controller
      commit: 3c14a456ee3e94d58682f6c7c77f8e71cbbcd8d8
[4/9] arm64: dts: qcom: sc7280: drop #clock-cells from displayport-controller
      commit: 0f1e23651a0ab71c82ab098ecbfc9ee7a4d74ced
[5/9] arm64: dts: qcom: sc7280: drop address/size-cells from eDP node
      commit: 97e5c82d4e170b815fe31fb91d6639be0f1b11aa
[6/9] arm64: dts: qcom: sc7280: drop unused clocks from eDP node
      commit: f32894b8d8b4300693f1c3549cad544799ffeb3b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
