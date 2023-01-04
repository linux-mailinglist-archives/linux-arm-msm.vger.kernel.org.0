Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2697E65D1E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 12:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233970AbjADLzz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 06:55:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234915AbjADLzg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 06:55:36 -0500
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABBA1B1CC;
        Wed,  4 Jan 2023 03:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672833331;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ZpcMmBJ+3LgH4o6txFxmZgreuWMbkKfTShOELqBAmQY=;
    b=ICfsjVMYqXkmfHCui2FjgH2mVVMPJr1a0Sa/lD8k+uuVKSnoxSyl+PvhwvIp8WfozU
    crn95uFFURa5STqoYidnfcqBOaKGOjdIDvQKYncnRh2pjlnNic/oaTAMxp87YboCO10U
    hXDsEk8kIwh02MYQeZAYjnambLyubgU41eYi4+IU4zVsFslbpPaNtNoI56AWtL0Fk+Uh
    jF87048MGrHMJNQEMnvHa+3Mji/XQZYICiOV6mlCb7LMLvpR1j9fi7dJcfBr+vQrrNRQ
    +FEoHzJLcw5mORqreyXzlsmfMRksUd1RJDs0pEGfgZp0OZKGD8EcMC+kWMBkg1BMtMXr
    pfTA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIRvweF+KLA=="
X-RZG-CLASS-ID: mo01
Received: from droid..
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id Yce349z04BtVkzJ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 4 Jan 2023 12:55:31 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/4] dt-bindings: arm: qcom,ids: Add QRD board ID
Date:   Wed,  4 Jan 2023 12:53:46 +0100
Message-Id: <20230104115348.25046-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104115348.25046-1-stephan@gerhold.net>
References: <20230104115348.25046-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QRD (Qualcomm Reference Design) = 0xb = 11 is used on many devices that
were originally derived from some reference design provided by Qualcomm.

Examples of existing devices in Linux would be:
  - msm8916-longcheer-l8150/l8910, msm8916-wingtech-wt88047
  - msm8953-xiaomi-daisy/tissot/vince
  - msm8998-fxtec-pro1
  - sm4250-oneplus-billie2

Add it to qcom,ids.h so the qcom,board-id properties can be rewritten
more clearly using the macros in a future patch set, i.e.

  qcom,board-id = <QCOM_BOARD_ID(QRD, 1, 0) 0> instead of
  qcom,board-id = <0x1000b 0x00>

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index f7aef3f310d7..18746bd3e595 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -165,6 +165,7 @@
 
 #define QCOM_BOARD_ID_MTP			8
 #define QCOM_BOARD_ID_DRAGONBOARD		10
+#define QCOM_BOARD_ID_QRD			11
 #define QCOM_BOARD_ID_SBC			24
 
 #endif /* _DT_BINDINGS_ARM_QCOM_IDS_H */
-- 
2.39.0

