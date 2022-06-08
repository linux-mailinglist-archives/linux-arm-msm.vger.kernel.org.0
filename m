Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21F6D542FF9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 14:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238694AbiFHMHm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 08:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238692AbiFHMHk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 08:07:40 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1491D08A1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 05:07:34 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h23so32897834lfe.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 05:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UlsyCuI1r3kbK/vtjTE2HeZ8epmog4rrC1c8iQZTka0=;
        b=zoUeZmH6+YhsKGt/+OtsIOhd03KmWslGLbyTmHplE7q6dwzKeYTnmkZMQCrMqWcDT4
         ENB6eiVIws3hdUaLZdT7rxppqZHlo+EWfHPU84W/gP33F4LjDBgMyuC81kcjBD9S5OCC
         cuwIV0/NLZXekhh0WMbb+j2JCvJSr4LsfPAjkc0ls0fpP3HudjhWmku4oPh3Ohe4LQO1
         2DKDjG2noCZA5pYUZxuwmUzwcDVEyL6gQIoxOHw34jpoR/eCTsBdVRXGbb1J+9CLRYzR
         EtkWtXBnnY2ILHsYCcckQjGFNR3Ak8RymPgXJktw5q0lMU0Usxzou5FdvZPd6wFW6FcA
         l0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UlsyCuI1r3kbK/vtjTE2HeZ8epmog4rrC1c8iQZTka0=;
        b=GDNJwzCzEm8gCwL/aCQ2g+yRb/poAsY7HQ/0XCrgVmtcp1NkfIQxuLBs0RE9eG2Ixg
         Jh5JSCTMK6pE52vzkZaQR23afvgmkxZt+/iRcTTJrEtqBrcyOqwIA9qqNN8ZJmq2jr+A
         XEVASMVd81gAAWkpGs+VsLR06fGMaJVF4KLdfZoymSk7DZVnec4qkGQ7z2miaqGdv6hT
         4JmXaEYlNDg7gBTWq+tiGPgxKB0Qd//RWgmTr7ciF4MwJ5JDYwtcCtA9ptr75i7VxyQR
         t/M8V4cR8nVEFkbmKguU5zBBaPJz7c7KA08hW7FcOwhYW+1sOnkRTUsLBrO7JLeNopfG
         E8vQ==
X-Gm-Message-State: AOAM532UYttUsSK1oN53NGLi+Jxe8NXUry8C/hGjcMB5sufiZsQbFOXv
        MOBvzI21GoLH9JoqC434kgFIIw==
X-Google-Smtp-Source: ABdhPJz2NiZWUioo69UFimWOsc7iqwnrDHZDOQ0ftc1GX9KufMOGeb3fHe9xiD6jbW0mKqaIQz5IgA==
X-Received: by 2002:a19:f24e:0:b0:479:1376:793c with SMTP id d14-20020a19f24e000000b004791376793cmr19393937lfk.526.1654690052543;
        Wed, 08 Jun 2022 05:07:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:07:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 07/12] drm/msm/hdmi: enable core-vcc/core-vdda-supply for 8996 platform
Date:   Wed,  8 Jun 2022 15:07:18 +0300
Message-Id: <20220608120723.2987843-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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

DB820c makes use of core-vcc-supply and core-vdda-supply, however the
driver code doesn't support these regulators. Enable them for HDMI on
8996 platform.

Fixes: 0afbe59edd3f ("drm/msm/hdmi: Add basic HDMI support for msm8996")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 7cb687458a56..67397fff645c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -399,7 +399,7 @@ static struct hdmi_platform_config hdmi_tx_8994_config = {
 };
 
 static struct hdmi_platform_config hdmi_tx_8996_config = {
-		HDMI_CFG(pwr_reg, none),
+		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(hpd_reg, none),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
-- 
2.35.1

