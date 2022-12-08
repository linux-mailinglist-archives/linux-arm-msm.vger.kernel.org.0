Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB25C6465A6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 01:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbiLHAI4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 19:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbiLHAIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 19:08:55 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB85E8BD3C
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 16:08:54 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id s8so31244201lfc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 16:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4t60xpEhgA6O4JyuJHsvdFgbVG01Y1Cn5LTbT2XI1g=;
        b=UOuYnTNVufjoB7OsnWB9nnl2knxgjQvhl9e/z9Hcpgdwo42Ugi7YUfiuzLvzgpB5TS
         spdxyEkNrM0BDoXSWP/7WH4juQ8UA/uEIwKJtNqgNpKXy136oRnpjuWPgB/sV1cgiHsb
         klTk7tvNpzxRVGk58oKsPCl6YUoRTb9mX5PsSHtj5aHw6aLQ9S0hpK6swzdaOm3lfuxg
         vwjSgYFCCi0kLZCVHJSTQCj6k3hYEoaNLhAMp3p9ku4uvdRxRQZbaFzfAMgcr7SUNZ7x
         Hr8VMgZ/WwfQr1/d3lgX8g4hZDu+uDMpi0dKs0xbT+xLS+n6meJVV/SvhRdYEdyifM+x
         fykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4t60xpEhgA6O4JyuJHsvdFgbVG01Y1Cn5LTbT2XI1g=;
        b=MyksiDy/z+stsKOuhfWWv/D9miRfBLDk+lkVl8kqCTaUHOvr+RiTSA2WshGL/BS6Ku
         qctfL+Sqs3cvoDDk6H+lqzFPaGsVn3CqflUTG6jTp3fas+Khm5te3ORa3lLtj/hUOhP3
         0YHiotP2na80r7Ze/+WGCJPmQw6qD70xCwna616V28KD2uV0w9rUnhljIHt2gXQSxoF3
         FjOJPjnbdNtRSDKkzMeYz+kGm3eoNtuq/FKX9ju9QvL5TUPlWvLuKFcD+ue0tYEB2Qjw
         jYD5z3DzBFQzt3Ac3/TkhDOJ/yCOdMom1983FS2wpxjPKHSpyzgHm0tncNAMSuhORE5A
         gP/g==
X-Gm-Message-State: ANoB5pm+Qml2RFQHM6vxo29aLJVotCmnP99W4C2GuObI6pILv+f3fwrb
        UfIFm4Q7Hz2BgCRBi+Ex2uM3aA==
X-Google-Smtp-Source: AA0mqf5Mrul8ZS23E7EVaMlRbfenhj3XEYpGW1TDXcg29rLWmQ1MES0Uu1q1bQEQKEhktAz3N916tA==
X-Received: by 2002:a05:6512:2149:b0:4a2:3b95:d889 with SMTP id s9-20020a056512214900b004a23b95d889mr32407167lfr.676.1670458133143;
        Wed, 07 Dec 2022 16:08:53 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z6-20020ac25de6000000b004a2c447598fsm2062992lfq.159.2022.12.07.16.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 16:08:52 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 2/4] drm/msm/mdss: correct the ubwc version for sm6115 platform
Date:   Thu,  8 Dec 2022 02:08:48 +0200
Message-Id: <20221208000850.312548-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
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

According to the vendor DT, sm6115 has UBWC 1.0, not 2.0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2219c1bd59a9..4401f945b966 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -532,7 +532,7 @@ static const struct msm_mdss_data sm8150_data = {
 };
 
 static const struct msm_mdss_data sm6115_data = {
-	.ubwc_version = UBWC_2_0,
+	.ubwc_version = UBWC_1_0,
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
 };
-- 
2.35.1

