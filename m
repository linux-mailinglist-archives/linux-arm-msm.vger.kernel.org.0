Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B430D5418FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 23:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376463AbiFGVSf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 17:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381017AbiFGVRO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 17:17:14 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11676115A6E
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 11:58:13 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id h23so29728422lfe.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 11:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gv5EYCl70d4UF6tOM09XneWfVdh1zgj+7SojFdpo+zc=;
        b=yKYk7Q8nnTwrMBpssl31f24fbF3pY7T9HGazI+DZHx4+585LFDXw9KhEeNNkPD+4xB
         tkcxZR7H3H8k1VkN8nYcQbhSGRVYLr/bZVWR/NrzW6ZXGI5lclkDSYyT42AuJWhOIbHm
         TGv9L1GkLDIcDMW/ZO1e8o57aIM0kiQQsB71d6jKwWeAlYEu3oTbcDw3XvbchQGhD8Xr
         ioOxKKPM9dEsslR6d+uX4pPA1Mh4YIfFHSu87zrYrC3Qj1sv6Kw06qb+CQ9hyH8bDyBz
         vtf3cSc51zm7YVHQPipVkKeCZh2k9sPJMKB5D56ksbMmuUdNo1PH3clNIFhBlsKDC8Yk
         Vt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gv5EYCl70d4UF6tOM09XneWfVdh1zgj+7SojFdpo+zc=;
        b=iJuDnadUEVeGr0jvscJQ1jvcyfvcZ/iA1IrYaTGtyZejjZEQReXw9ArV+D9CAhty+k
         LCEYZeL/nmbaFLwxTeXFeDc+l9y8txTfYk8iL8akl1QhM+NSKS6UwjVAkrpDnMXR7Y0P
         4PaX3OWO3iIl9Ud0HHjV/s15OU1o+WOf/xibJBexfZ0E0PCGJ+fcHZUqcY3T+iwj9K71
         TMf15v7qjIj5GIhqdPOIoJBLroNgDfoKgTZiBXkPo/T5ur6UdThTm3QoUS2Y7y1+w3IL
         Hw5/t4jhY9519qNIQYSeBgo8L0dLkAlBlkns885xgfRKZQS6eXVSJtzMeFKBTzT5uPkE
         VO1g==
X-Gm-Message-State: AOAM530KH/WWtUPLapjBITwrfbJnKSHzD3qymEQcFPHvuvtGJD4tvSDn
        CSwd1wljzMdAYGF+FBn/2aXu0w==
X-Google-Smtp-Source: ABdhPJzAFNmVm1dYKasPIIqCWjqt4kOQVLQ3EaOAUgzny8Plt2Ngih2S2CB+D7ih2p2lMcN59i5vrA==
X-Received: by 2002:a19:4302:0:b0:479:52ea:af4a with SMTP id q2-20020a194302000000b0047952eaaf4amr6247458lfa.454.1654628292088;
        Tue, 07 Jun 2022 11:58:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d19-20020a2eb053000000b0025587b872cesm1611668ljl.70.2022.06.07.11.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 11:58:11 -0700 (PDT)
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
        freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v1 4/7] drm/msm/hdmi: enable core-vcc/core-vdda-supply for 8996 platform
Date:   Tue,  7 Jun 2022 21:58:03 +0300
Message-Id: <20220607185806.2771739-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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
index 6a22d6977ead..125712c3fca2 100644
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

