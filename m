Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D83C7576FC4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbiGPPTR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbiGPPTM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:19:12 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F063D1CB0D
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:11 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10bd4812c29so12806968fac.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e66uTfzXjTKqFALvdx2t5PgX0+t9GHheRa2gGHbyVf4=;
        b=E1XBbkk4gIVNdd/8kQxeEwdUKzVBnnw/jiOHu6Ov54cBk2++z5COgZZzj/kkb5yrrL
         +yvpycXHaiZuu6lNkTdWMf2yIVWsNia2zrhVI+Dq3lWI2PsOOpX6BmrCfPfT3eESzp1S
         /o8cA6x0pjCDU3zHlZ80fbuXwcXdsMLpN/UBPQ7HHTfKinFHhGJ46EQj6CJaL5XYVSMa
         6joJV2XqSNBogeqt//Kn/2H4/S9Bgm6/4F07HSmntxl6bgAiExbLuCgbR3L/YTt7CW1u
         C/pgEyNIU8xZ7NdZC5WEtZpsU4PBx5yBcwxs4//WYoHUcL10X7g6hyvl/XZoCIujWLNd
         s/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e66uTfzXjTKqFALvdx2t5PgX0+t9GHheRa2gGHbyVf4=;
        b=ck85Jv16HXg7/Y9e4P+qHNd6tW7wKnHBOga+SqdIYAE8IschXfKPNWib2sY7aCXl3h
         VX3AP9M16w5quTXXsl26GjuJV2IPOQBm13SwiM1Ws39X7APgEVBgGSrAuk9BYYBr0xMF
         EEeidmux4pPY172GsO1z1dLRExbF9/Tr4j/Bb2T7xgVjgkzcyfiHNwM7LrkQ+sDkA3jC
         TLJypWIaPryWe7uVui4gFmV33e/tq0rHhc+QTZCcUMl85xByHWI3w1oPzQccAnfW548E
         n6nF24eophvhXt0brVy4OOMANzQi4WcMfhQRtwnWsTeep95+LNHQ/BoeCt/Y1U1OXxHP
         rLrA==
X-Gm-Message-State: AJIora8yrDQddSk8oLu7smS5qpXEgdpJYV1QPRtex9iJqYBEgOs367pk
        kxbizJPhYGyrwHfsjYRJkTVmLg==
X-Google-Smtp-Source: AGRyM1vE6QHQOcUxSbCzDxTbrMDmv0ObwIzHDoh4vnsPjYO2QdRZSWds+j9Gg5D+GBFqs4wrxjxSDA==
X-Received: by 2002:a05:6808:17a6:b0:337:ac34:8051 with SMTP id bg38-20020a05680817a600b00337ac348051mr12824976oib.190.1657984751349;
        Sat, 16 Jul 2022 08:19:11 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:19:10 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845: rename DPU device node
Date:   Sat, 16 Jul 2022 10:18:54 -0500
Message-Id: <165798474063.1679948.9666695158326543732.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220708091656.2769390-1-dmitry.baryshkov@linaro.org>
References: <20220708091656.2769390-1-dmitry.baryshkov@linaro.org>
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

On Fri, 8 Jul 2022 12:16:54 +0300, Dmitry Baryshkov wrote:
> Rename DPU device node to display-controller@ae01000 to follow the
> DPU schema.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sdm845: rename DPU device node
      commit: 1d52eb6cc827d0f166c728a7577609de75b6b8b1
[2/3] arm64: dts: qcom: sc7180: rename DPU device node
      commit: 37e3558b79392ab864fe887b4593c5f737e063a5
[3/3] arm64: dts: qcom: sm8250: rename DPU device node
      commit: ce5cf986cdab1973df0042ac5b743d5df008c338

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
