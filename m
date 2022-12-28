Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432E5657710
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbiL1Nd1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:33:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232968AbiL1Ncy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:32:54 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE14FCF0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:52 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bt23so6982412lfb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnLG6ctkWmWWmxyjHcMbEzhfightxs9Tnr6vaHqsfeM=;
        b=sx4Qt0XjUvJrHqSdoE5EJ2a4qmjChPd9KodwtOFUXTS16j3EuuEkak6wAq/ltLDBSs
         Jr9jKvj99yIsnBg56DihPXJbLSqMCcjApxJYpoCzPld/qOoNe4lqh6NH+oX12eZbtWSg
         /bpqTElfT1+NS/sPeRKXuD91bQ2ZYtBvDpDA+cOjqjvlOKqF3KsHIDCsbqW6BM54cN28
         CB8bFE1dSyw7DHZo2Er2syyBLt+8PL+sqNaWzIL3iXy1r054jDwBVmH21cEVewyiu5WH
         Obsp1p2mCYve8t6kDObQjwdmAtoU+l1TpOQN8Jo2LQ7lrIqOAL//wAuuQNegYGVbVauT
         Z+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnLG6ctkWmWWmxyjHcMbEzhfightxs9Tnr6vaHqsfeM=;
        b=gASNkfFRFh8IbucG6XCJOqX4KKV4oNmsDNA6HWklG+dkETtqfN4m41h3haCW53mbQH
         S67far2YxDl1C83H67M0/HFVp5TkUyhg+4GsfHw7LnFe82KSnhpQOJIAuAOG0cZp1IwN
         PFo8Uo30M0fllEWnM6/Y/yfwpcHHF45XzHTbBk5UhSukSVx7YWhABwm+cjfe7gZaBKgM
         6SXSIHkfHtWTu552XafZnQSgAlCcnyOFkzoSN9Ow/9LHm5dwasR0b0Hcg/Jsix4sBNua
         eN7pyhjgVR5WtS+T9JBCUpFfb9Hq5FOHxDsSO5ymmv1pSpv9+OT7Fq3XFQf3ydxrHTHA
         drHw==
X-Gm-Message-State: AFqh2kqFZBpIDTFuJMUfkXU4gtuFS2KpXIn/M7MspgnMzXD8FJUIrIO5
        HjQy34UgclIpMQKk2yw4SZw1qw==
X-Google-Smtp-Source: AMrXdXu8F/nWim33VJENvAjGRMoQMzPIdjwysn4tyFOUROjLrtbV3zD6Jku7eQZtS8P+gvwjeVoBWw==
X-Received: by 2002:a19:7513:0:b0:4b0:38f1:1266 with SMTP id y19-20020a197513000000b004b038f11266mr9407241lfe.34.1672234371233;
        Wed, 28 Dec 2022 05:32:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:50 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 07/16] dt-bindings: clock: qcom: gcc-sm8450: drop test clock
Date:   Wed, 28 Dec 2022 15:32:34 +0200
Message-Id: <20221228133243.3052132-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-sm8450.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-sm8450.h b/include/dt-bindings/clock/qcom,gcc-sm8450.h
index cf1469312c4c..9679410843a0 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8450.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8450.h
@@ -8,7 +8,6 @@
 #define _DT_BINDINGS_CLK_QCOM_GCC_SM8450_H
 
 /* GCC HW clocks */
-#define CORE_BI_PLL_TEST_SE					0
 #define PCIE_0_PIPE_CLK						1
 #define PCIE_1_PHY_AUX_CLK					2
 #define PCIE_1_PIPE_CLK						3
-- 
2.35.1

