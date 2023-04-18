Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A56D96E6BC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 20:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbjDRSLb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 14:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232471AbjDRSL3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 14:11:29 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5FD118C6
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 11:11:19 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id gw13so15972318wmb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681841477; x=1684433477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGEdXpbrAB9bzKbGp8NO/2PlgF61Tq+sqmR873iY16o=;
        b=D4+RUrwcyPbffPe96qXZM1OWA60iapoCnOWjcS2FRRhNKxyTVmbDZFyPOGFDlvS41B
         NaEp1CWtDkz2lg+YIFqA+hTg+m9DSJuCRsYtBmchmafvQ/JN7UhNaKBFdX+DyhkzoBNP
         +UlgkNx2WJmuP40tu7XV+TxFZEXO0QJM9M4jD3zAwGMJxqc8KGeJRPE2DNLUwUPSMknS
         CKTgzsJgnIspqlNzBqPPhcWr809jbKgsCbshYWJOuVeCy4fEGM8rsn632zoZaqf+5AiM
         5S62y01rtBGlV8cadAgJKkjkzMC+KuH3BdvWjKVkjFxQHlYWTye29h3iF+SdqY0WeSg6
         m24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681841477; x=1684433477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGEdXpbrAB9bzKbGp8NO/2PlgF61Tq+sqmR873iY16o=;
        b=g+CbUxggSaiiOKY3Vo8yzOPP8J3kvw7xBagUq+plLHPD0aRsAsG5Eimj2sr7ll766B
         hAwy2F8awqthn3TLdqS0OnOTHy0RWrLFj8SOHQ+pmtAU7b54iOlNZ5G+A2bYmlR95OqH
         CAHt5RqC0EbwHQiCKodv1Et67bx16TXuzUeZZ1GUsuYqE1+Fn3Y9oQnjwvxIg1r5JEwg
         +J5kd7Iy4FBUpYQ9TUTRwKND5ECGThIklMWPPKp7wh3KJY0B800a47zwh6upCz+G2MhH
         zT4xm7PYUwkKsHH+bUL66/cNfXpGkAZ0A2jiBZrBaLUtL33azazhfob7ak4smOi5mNPN
         QVFg==
X-Gm-Message-State: AAQBX9fhHv+rq40jsblPNR0MZR5XUe0/x/bpPDWCw39UwGzheMWHZFlV
        gdbt4BvDHMcbgYuxXi5V7F/K
X-Google-Smtp-Source: AKy350bYnn4jHS5URPe6bTfBxOdYvUUb4URy+ztI9QdK6i3OqnYsarUufClbfvVtyqskp5G8whGoPQ==
X-Received: by 2002:a05:600c:22c7:b0:3f0:5887:bea3 with SMTP id 7-20020a05600c22c700b003f05887bea3mr14377190wmg.27.1681841477500;
        Tue, 18 Apr 2023 11:11:17 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id r17-20020a5d4e51000000b002f01e181c4asm13727898wrt.5.2023.04.18.11.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 11:11:17 -0700 (PDT)
From:   Arnaud Vrac <avrac@freebox.fr>
Date:   Tue, 18 Apr 2023 20:10:43 +0200
Subject: [PATCH 1/4] drm/msm: add some cec register bitfield details
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230418-msm8998-hdmi-cec-v1-1-176479fb2fce@freebox.fr>
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
In-Reply-To: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
To:     Rob Clark <robdclark@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3874; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=SVkTAlMIdLXUuPBcPdMnLFItEApcr9xvliEg/2oQQDY=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkPt05Q2xMOypajlyQfFQFeWvrZ5qZzytnpP01G
 0Ea1IIjyGiJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD7dOQAKCRBxA//ZuzQ0
 q+irEACiYxpnV98wcf5XF7eYxq5xeg08MigztVevneCvbFlJhTBa53k32OD0Cvu+Igd9/tTFnzE
 0ELuJXyNi7TCcdwwMbWmMO7Yg1Z5ufFbXoKmMc1bHwAi8oykgRjkwZ6NE+oH3QQBbEDfTS+Jk/7
 LBa2Kfwahyu4SvV7RcPv7WOIZ7p5IxTjbQ9bwKDQ4vWtI4eqXbCh+boiF8PgbgR1kYMy2P0lW9K
 C2aMQkiH3HC2/rsqsrBPOYqpNkB/iqnG7Sh88WaQuy/1ZL1gkpWRSihfLaF9O8egBZx9LjIsVli
 in2HnbYmGN/krwEUGaCwF0AgPSMcBKnbS7PrIlc83Il6uJyIxzMGuRcbekcNyi3+gondeuFghXV
 MYDHrsNK1D2PJokeGcp++f4ZT8MbSnQFg88x2RB3RUiJVC+uNn3viu0RAesPPS/DMaHB1KjtYmO
 k6t4vb9s6GXaY3smXw1n0uZ+MhDdKpgAokm3vTZRnqFaYHMmaj78/ALi/qXawrOHCQs431UYQ4n
 +mZGUkOJjIb6BUDHYOWexiU0E1G1FUbuEzeh6aCFgGmoKSM58cf1pf9V9fd/MY95GzjmvJVmCng
 A2doa8zHKLGwtZJXoaQMZ0GTQguao9U1/1toAbMoLknuTtIjxYVP8HeH34g84rAJ3Ae/ea46uLt
 0PEO+UPzt2WVtMA==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The register names and bitfields were determined from the downstream
msm-4.4 driver.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h | 62 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
index 973b460486a5a..b4dd6e8cba6b7 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
@@ -76,6 +76,13 @@ enum hdmi_acr_cts {
 	ACR_48 = 3,
 };
 
+enum hdmi_cec_tx_status {
+	CEC_TX_OK = 0,
+	CEC_TX_NACK = 1,
+	CEC_TX_ARB_LOSS = 2,
+	CEC_TX_MAX_RETRIES = 3,
+};
+
 #define REG_HDMI_CTRL						0x00000000
 #define HDMI_CTRL_ENABLE					0x00000001
 #define HDMI_CTRL_HDMI						0x00000002
@@ -476,20 +483,73 @@ static inline uint32_t HDMI_DDC_REF_REFTIMER(uint32_t val)
 #define REG_HDMI_HDCP_SW_LOWER_AKSV				0x00000288
 
 #define REG_HDMI_CEC_CTRL					0x0000028c
+#define HDMI_CEC_CTRL_ENABLE					0x00000001
+#define HDMI_CEC_CTRL_SEND_TRIGGER				0x00000002
+#define HDMI_CEC_CTRL_FRAME_SIZE__MASK				0x000001f0
+#define HDMI_CEC_CTRL_FRAME_SIZE__SHIFT				4
+static inline uint32_t HDMI_CEC_CTRL_FRAME_SIZE(uint32_t val)
+{
+	return ((val) << HDMI_CEC_CTRL_FRAME_SIZE__SHIFT) & HDMI_CEC_CTRL_FRAME_SIZE__MASK;
+}
+#define HDMI_CEC_CTRL_LINE_OE					0x00000200
 
 #define REG_HDMI_CEC_WR_DATA					0x00000290
+#define HDMI_CEC_WR_DATA_BROADCAST				0x00000001
+#define HDMI_CEC_WR_DATA_DATA__MASK				0x0000ff00
+#define HDMI_CEC_WR_DATA_DATA__SHIFT				8
+static inline uint32_t HDMI_CEC_WR_DATA_DATA(uint32_t val)
+{
+	return ((val) << HDMI_CEC_WR_DATA_DATA__SHIFT) & HDMI_CEC_WR_DATA_DATA__MASK;
+}
 
-#define REG_HDMI_CEC_CEC_RETRANSMIT				0x00000294
+#define REG_HDMI_CEC_RETRANSMIT					0x00000294
+#define HDMI_CEC_RETRANSMIT_ENABLE				0x00000001
+#define HDMI_CEC_RETRANSMIT_COUNT__MASK				0x000000fe
+#define HDMI_CEC_RETRANSMIT_COUNT__SHIFT			1
+static inline uint32_t HDMI_CEC_RETRANSMIT_COUNT(uint32_t val)
+{
+	return ((val) << HDMI_CEC_RETRANSMIT_COUNT__SHIFT) & HDMI_CEC_RETRANSMIT_COUNT__MASK;
+}
 
 #define REG_HDMI_CEC_STATUS					0x00000298
+#define HDMI_CEC_STATUS_BUSY					0x00000001
+#define HDMI_CEC_STATUS_TX_FRAME_DONE				0x00000008
+#define HDMI_CEC_STATUS_TX_STATUS__MASK				0x000000f0
+#define HDMI_CEC_STATUS_TX_STATUS__SHIFT			4
+static inline uint32_t HDMI_CEC_STATUS_TX_STATUS(enum hdmi_cec_tx_status val)
+{
+	return ((val) << HDMI_CEC_STATUS_TX_STATUS__SHIFT) & HDMI_CEC_STATUS_TX_STATUS__MASK;
+}
 
 #define REG_HDMI_CEC_INT					0x0000029c
+#define HDMI_CEC_INT_TX_DONE					0x00000001
+#define HDMI_CEC_INT_TX_DONE_MASK				0x00000002
+#define HDMI_CEC_INT_TX_ERROR					0x00000004
+#define HDMI_CEC_INT_TX_ERROR_MASK				0x00000008
+#define HDMI_CEC_INT_MONITOR					0x00000010
+#define HDMI_CEC_INT_MONITOR_MASK				0x00000020
+#define HDMI_CEC_INT_RX_DONE					0x00000040
+#define HDMI_CEC_INT_RX_DONE_MASK				0x00000080
 
 #define REG_HDMI_CEC_ADDR					0x000002a0
 
 #define REG_HDMI_CEC_TIME					0x000002a4
+#define HDMI_CEC_TIME_ENABLE					0x00000001
+#define HDMI_CEC_TIME_SIGNAL_FREE_TIME__MASK			0x0000ff80
+#define HDMI_CEC_TIME_SIGNAL_FREE_TIME__SHIFT			7
+static inline uint32_t HDMI_CEC_TIME_SIGNAL_FREE_TIME(uint32_t val)
+{
+	return ((val) << HDMI_CEC_TIME_SIGNAL_FREE_TIME__SHIFT) & HDMI_CEC_TIME_SIGNAL_FREE_TIME__MASK;
+}
 
 #define REG_HDMI_CEC_REFTIMER					0x000002a8
+#define HDMI_CEC_REFTIMER_ENABLE				0x00010000
+#define HDMI_CEC_REFTIMER_REFTIMER__MASK			0x0000ffff
+#define HDMI_CEC_REFTIMER_REFTIMER__SHIFT			0
+static inline uint32_t HDMI_CEC_REFTIMER_REFTIMER(uint32_t val)
+{
+	return ((val) << HDMI_CEC_REFTIMER_REFTIMER__SHIFT) & HDMI_CEC_REFTIMER_REFTIMER__MASK;
+}
 
 #define REG_HDMI_CEC_RD_DATA					0x000002ac
 

-- 
2.40.0

