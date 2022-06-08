Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A57B542FF1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 14:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238709AbiFHMHp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 08:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238687AbiFHMHm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 08:07:42 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C6B1B1853
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 05:07:32 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a15so32879912lfb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 05:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ywZDJVrp0n0IRRgem+yzlly0FGJg2gJ3lpMx4tNxzuM=;
        b=LhfKofCuo1hI/kyqKa7GESz/tFf5nTTEsRGD1drqYnsDSKTKl7mh7bjqOMVtcPzePR
         +d8NnY0Em/bybYJK+GfY61r9DoLU1p1HNrb26LJhZb1l4qzE/vnKh11DliTs98bndMU1
         pTsHLKiI5PEMWM67FRQLRzblAmmyzZ7aoHhFt1Lfd8j5V1ZF/t+2Bemio1dtTaYNeIoX
         p6bOhZqVZzeDQ823vnmjyZ4TjXq/nbxO5SulggVBKOmjpPW74XFxZj0H6smDQWLomNRx
         7y+etJlIb0WDVgJ8Zs0BMSERlp3ak1aDh258XRSZOhb3fsshb3khdppIYx3qEEv6fEQF
         +q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ywZDJVrp0n0IRRgem+yzlly0FGJg2gJ3lpMx4tNxzuM=;
        b=NGFnK3TaH2VbLingfARW6eZIqcpcAuEY6S9M4Umi7c4Zz4tGjlG3cb4u4xB2uIKiJz
         oYjMimcYKhNTubYR3OA6rC7tpAwF7PsVixJYhIiefC4uSOCR3vVpX7WNh4uT4eNSxXIz
         Inq5xOvzAHkbPia8lCfCJwxpDIxiypDLEBVT6wmkMtvgr1jFpCRuHWjiWcrC50VFpEy2
         AnrlRTkIyslGEEos1IO9X38lexCWnY2WEd75a2NdPY/3/qLnhzP+LGTKimAk6kiajAWm
         FVzFXLmUK9cxwKbYQsQM2wPtzGSXsN8teNyaAHFlnmImom92USukyMOnNqBIzyr5aUnx
         8UKw==
X-Gm-Message-State: AOAM531ZTVDHB8HaFcK/SuwhqB4S4J0N7IZTVGVjLvZnujiowPbMIG8F
        Kd7SPOOVjLF1UQJypYUc6BwYJA==
X-Google-Smtp-Source: ABdhPJz7tK93EXNnMP55322ciEx1xGXgkiQ6vvmmZXDmFnGwjAV/yE1fK6My8eJe0sLtueQUeBFgxg==
X-Received: by 2002:a19:a411:0:b0:478:f29b:e30e with SMTP id q17-20020a19a411000000b00478f29be30emr21631651lfc.334.1654690050658;
        Wed, 08 Jun 2022 05:07:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:07:30 -0700 (PDT)
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
Subject: [PATCH v2 05/12] drm/msm/hdmi: drop the hdmi-mux support
Date:   Wed,  8 Jun 2022 15:07:16 +0300
Message-Id: <20220608120723.2987843-6-dmitry.baryshkov@linaro.org>
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

With the last (and only) in-kernel user of hdmi-mux regulator, drop it
from the HDMI driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index cf24e68864ba..06b44b40ec09 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -358,7 +358,7 @@ static const char *hpd_reg_names_none[] = {};
 
 static struct hdmi_platform_config hdmi_tx_8660_config;
 
-static const char *hpd_reg_names_8960[] = {"core-vdda", "hdmi-mux"};
+static const char *hpd_reg_names_8960[] = {"core-vdda"};
 static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static struct hdmi_platform_config hdmi_tx_8960_config = {
-- 
2.35.1

