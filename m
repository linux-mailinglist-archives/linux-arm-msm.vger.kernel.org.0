Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9F29661B92
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 01:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjAIAia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 19:38:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbjAIAi0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 19:38:26 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C385FD19
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 16:38:25 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bu8so10647808lfb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 16:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yO6+pl3S8OkJkK2cFQimnv5gJx6WicWkwN1eiLMeT7Q=;
        b=Wu0B7Qz4d+HF4VN3O0b07OAZGHFRT8W5ltF2V1F1zh3f0M7aWH0ZOLoq0a8RENM+Dr
         idqiFIfzIq7/Rcin3TxcdWdC/Xm0iSjXMVvvcfRqKYmktqq/yjlwNGc7KSNkkgYpJ/Zz
         PEIjiGeiljuGKWKAQ6xjAEQV5TTzGpYUurrWzzQlzWlGN5GgIW2SpGBujG9BoSQcarVk
         r1lC3Er54Nafns/61KVY0W3zEj/j2sLBWJd01m+pyfiKWUMdCLt7mkWYmMzg//VYX4tH
         mNpB1LShtL2xV6Ma7nTTvWgUIa8c3XSTbdse6k91mDVJM4pGbRODmvUW/fbtsM0ZEMmV
         8lBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yO6+pl3S8OkJkK2cFQimnv5gJx6WicWkwN1eiLMeT7Q=;
        b=F2HiJTd0jDLrIk7BSAs59pA949OVDu9jOS1UrOfZgfCgzfrOLSgC2QelfYh/P+aHnD
         Q3y2UVG1EaeVTuNzexf/iSPJ57m6cerRKdqtlZDyLD8xRoU8JWe5suWnRnfh0SPml1Hg
         z1R8NNHGoOiQfYxOYaJzdg38DPENPMF7+8FkfB7RmqC/CbYgxqDi+9SB0xCOVHrVGN9z
         jzON2Fg2m5rcuc4F9iY/qU2iwUJ7IlwBUmkCpc8Wm3faYdQXoHF44FcpsLkCS6pJbVTY
         Bof9M39gQfTGvqCsJOyy/lNyKCU02IHDKYb19ZRtSUUDTkfmXj+jzIWJhlNv1UwiiHlV
         dFrg==
X-Gm-Message-State: AFqh2krMD+MiaFE5m7p3MtcWrqoseUkmlA3HDPpNEFk/Ar7vZCfEWS4/
        J6uBtcdBpUmmk1VUYUCubPNLUg==
X-Google-Smtp-Source: AMrXdXsZwTNuUt7RSJ0rayIZmo5j1dAbR/B41RqdSdqnrpLXL5OcFNp3b8E2E5fK5HFQXD0+2Rk8wQ==
X-Received: by 2002:a05:6512:15a3:b0:4b1:3970:43da with SMTP id bp35-20020a05651215a300b004b1397043damr29043220lfb.51.1673224703641;
        Sun, 08 Jan 2023 16:38:23 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v4-20020a056512348400b004b58fadba35sm1297469lfr.296.2023.01.08.16.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:38:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 3/4] ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
Date:   Mon,  9 Jan 2023 02:38:18 +0200
Message-Id: <20230109003819.245803-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
References: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SoC-specific compat string to the MDP5 device node to ease
distinguishing between various platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8d216a3c0851..0cd59088f9c7 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1549,7 +1549,7 @@ mdss: mdss@fd900000 {
 			ranges;
 
 			mdp: mdp@fd900000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
 
-- 
2.39.0

