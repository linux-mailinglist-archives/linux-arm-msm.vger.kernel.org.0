Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7DE4EFA72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Apr 2022 21:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351669AbiDATe3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Apr 2022 15:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351693AbiDATeY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Apr 2022 15:34:24 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34DE17666A
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Apr 2022 12:32:33 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id k21so6739294lfe.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Apr 2022 12:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E1TjYAHnmNnuCk6kNl285apSiqiWgRnunfxQOVaEdmg=;
        b=NBRzNI289r7FziatUonAZyOkULMicJ6pvkb154K4QMvblca/JH1j+1XhYB9njlg/hG
         wtDN8NVkiXJZKgr/absynK7CUFlrKiYasHigsIM1JY+ZzQnNp16jwfOuQrQ6p/ICjNpw
         14LXqBoUsZh30IhXSpMrwvYfj/2nyYgNbWnSajTUdGBScfM4ESN2P+gavkkB1OWMlUAu
         tQMmA1Cd3Kdw80czcW90Li6LPeTRv03mfMJ3QCaL8jDRV4Yr1B2ZHDS2qn3s2xbvKry3
         aeuobqQpgl697cKUlgkhNLQcFH2D7DGHjrtVivp1zD3yZKo0yUA0bnRpWf4ls1cDBmcq
         UfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E1TjYAHnmNnuCk6kNl285apSiqiWgRnunfxQOVaEdmg=;
        b=4rcLss9RAAI4qQ7HTIGKHF9cIjkdgpIRxchK47Gu5Ua7E/KIgVSgLM1qTx/hRF45gg
         Kj+8bjy//r1MZ2IOIPYmMXYxoRcbPP/2IApYLT0p5EUWvkOz4e+fmaNjKYcoPIForI/t
         zi4bTH5uLPnHTNVqQlJaIjzpj3LsBPIKy7rXFjHlCblFx2JN0zevAg6Jr4Ac57Wh3WjU
         BXgf/9OocVZ5a9SR3MXcZ8b+p6EIjgV7blHJT9mJwqk97enMumkXWp4skbfomyJerfR0
         UOuOAZ5fnesKF84jl58AcfqkPCwiyAJf6PEZ7/G0bN26gFCw11afnPXbBjNpLAyasMav
         nfVw==
X-Gm-Message-State: AOAM533g/KtUuec9UhjNTp9BE6hwkrRfzpjPzjMQsQ89sY1rcbgFaSIr
        uv1Xc8mtXmpnIB+X4Sy9YDorVw==
X-Google-Smtp-Source: ABdhPJwZyDpLXut9GjyjaatVROgqdaSI2jGrYQlG6jA/nh/K8H0WbFlSazCy6oqm72KTibJriN+hpQ==
X-Received: by 2002:a19:ac42:0:b0:448:1f15:4b18 with SMTP id r2-20020a19ac42000000b004481f154b18mr15030279lfc.32.1648841551974;
        Fri, 01 Apr 2022 12:32:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n20-20020a19ef14000000b0044a212f7845sm326608lfh.118.2022.04.01.12.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 12:32:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: defconfig: enable Qualcomm RX and TX macro for SM8250 audio
Date:   Fri,  1 Apr 2022 22:32:30 +0300
Message-Id: <20220401193230.846207-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Add two config options required to enable audio on Qualcomm SM8250
hardware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 24063920d24e..a6564664676d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -831,6 +831,8 @@ CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m
+CONFIG_SND_SOC_LPASS_RX_MACRO=m
+CONFIG_SND_SOC_LPASS_TX_MACRO=m
 CONFIG_SND_SIMPLE_CARD=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_HID_MULTITOUCH=m
-- 
2.35.1

