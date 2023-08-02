Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93BFD76D5C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 19:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbjHBRoE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 13:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233745AbjHBRnz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 13:43:55 -0400
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FB32D7E;
        Wed,  2 Aug 2023 10:43:42 -0700 (PDT)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id 788AD1C0183;
        Wed,  2 Aug 2023 19:06:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
Received: from fluffy-mammal.fritz.box (dslb-092-072-013-079.092.072.pools.vodafone-ip.de [92.72.13.79])
        by srv01.abscue.de (Postfix) with ESMTPSA id 07D801C0181;
        Wed,  2 Aug 2023 19:06:01 +0200 (CEST)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     linux-clk@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH 1/2] dt-bindings: clock: gcc-msm8917: Add definition for GPLL0_SLEEP_CLK_SRC
Date:   Wed,  2 Aug 2023 19:03:16 +0200
Message-Id: <20230802170317.205112-2-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230802170317.205112-1-otto.pflueger@abscue.de>
References: <20230802170317.205112-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing #define for GPLL0_SLEEP_CLK_SRC, the parent clock of
GPLL0_EARLY.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 include/dt-bindings/clock/qcom,gcc-msm8917.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-msm8917.h b/include/dt-bindings/clock/qcom,gcc-msm8917.h
index a371b1adc896..4b421e7414b5 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8917.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8917.h
@@ -169,6 +169,7 @@
 #define VFE0_CLK_SRC				162
 #define VFE1_CLK_SRC				163
 #define VSYNC_CLK_SRC				164
+#define GPLL0_SLEEP_CLK_SRC			165
 
 /* GCC block resets */
 #define GCC_CAMSS_MICRO_BCR			0
-- 
2.39.1
