Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD8F4728090
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 14:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236610AbjFHMxn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 08:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236622AbjFHMxh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 08:53:37 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301D51FE9
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 05:53:26 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f736e0c9b1so5250275e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 05:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686228804; x=1688820804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+9VHBueoBmuSi9T9fFR9KwsQbwP9/Xd2zU3kVAvvfk=;
        b=VyEKycDhd2/9FKZuQC1fvV5QEcfNUZtcFsPPYiBMfRP/q4UPonyFzXn35Vlt3EI9B1
         8FsbqN5+E/Zo+zK/Kr/2OsJXr1TMsE+KvrrFbilAJta8Rwq8RuLi8u/nz+kiyCT+VRjO
         bxwCbGX9hr4egRfgUFLApDC+9EXzV2OxK6CAubGYFIjdYcusMPAoR/VtuNkoRrZb9y86
         yew1BmeKL4yQh7VII6NCWk1V4wnpLobw+5mc6hAuPiAs1NbWPMkSoLVMvZaUKE4Q6Gej
         G6wjNn+xU4tcFKLalUMZojEcGiCiyn1gpz8rdQO3xZtmj5oAdBGs+SS2P6heCenb3kLc
         x3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686228804; x=1688820804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+9VHBueoBmuSi9T9fFR9KwsQbwP9/Xd2zU3kVAvvfk=;
        b=CTGAfZnWI13O5PA1OXpuU1qoDS+QAt5AUSOYE/ELxyXOyzDTfVzB1mOwqZz2Yf8fv9
         ewXjFJwnWv+37WWVfXx9Zl/UdDc+LXkkJOJLDBQCFyLifOV/Z90V2csmZocFhyEyuQuM
         IF7FSHNQb2N6qWDmkYJxOc8qeCVosNLseBRnulDAN2z5MdKSmgkzIEkpVwp5B5eQtaE/
         hIj9FQm9DLGjN4uRmY6DBWpHpFk8Z7cGxucnY8BitfkYmIkxcPctDs9oAXn3N/eNLvqF
         he0aCbHvMcSafxZEN8Zdu4YrmoMVRCXrMi47S5O5B+RISF3gZd8L5naDu5FUKdvmbcqZ
         e7vA==
X-Gm-Message-State: AC+VfDyzIKp1zfBZNAVHKRKtMuVMDFyEAu+5Vm3xy4F2WRsQ2ax3xmbk
        k6UlqzlsR6qFsi+lNi6J6lF5Iw==
X-Google-Smtp-Source: ACHHUZ5Olmhqdb6auezUYSnWBKngL84xT9F8ux9ZcpKbOTvkM56MeGpSZEC3gWu2+DgaxjhNyq8sZw==
X-Received: by 2002:a1c:7210:0:b0:3f6:3bd:77dc with SMTP id n16-20020a1c7210000000b003f603bd77dcmr1341927wmc.23.1686228804603;
        Thu, 08 Jun 2023 05:53:24 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bce16000000b003f7e4d143cfsm1894032wmc.15.2023.06.08.05.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 05:53:24 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 4/6] clk: qcom: Add lpass audio clock controller driver for SC8280XP
Date:   Thu,  8 Jun 2023 13:53:13 +0100
Message-Id: <20230608125315.11454-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608125315.11454-1-srinivas.kandagatla@linaro.org>
References: <20230608125315.11454-1-srinivas.kandagatla@linaro.org>
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

Add support for the lpass audio clock controller found on SC8280XP based
devices. This would allow lpass peripheral loader drivers to control the
clocks and bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/clk/qcom/lpasscc-sc8280xp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-sc8280xp.c b/drivers/clk/qcom/lpasscc-sc8280xp.c
index 4a0470fc6153..43b37ce397cf 100644
--- a/drivers/clk/qcom/lpasscc-sc8280xp.c
+++ b/drivers/clk/qcom/lpasscc-sc8280xp.c
@@ -15,6 +15,26 @@
 #include "common.h"
 #include "reset.h"
 
+static const struct qcom_reset_map lpass_audiocc_sc8280xp_resets[] = {
+	[LPASS_AUDIO_SWR_RX_CGCR] =  { 0xa0, 1 },
+	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
+	[LPASS_AUDIO_SWR_WSA2_CGCR] =  { 0xd8, 1 },
+};
+
+static struct regmap_config lpass_audiocc_sc8280xp_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-audio-csr",
+	.max_register = 0x1000,
+};
+
+static const struct qcom_cc_desc lpass_audiocc_sc8280xp_reset_desc = {
+	.config = &lpass_audiocc_sc8280xp_regmap_config,
+	.resets = lpass_audiocc_sc8280xp_resets,
+	.num_resets = ARRAY_SIZE(lpass_audiocc_sc8280xp_resets),
+};
+
 static const struct qcom_reset_map lpasscc_sc8280xp_resets[] = {
 	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xc010, 1 },
 };
@@ -35,6 +55,9 @@ static const struct qcom_cc_desc lpasscc_sc8280xp_reset_desc = {
 
 static const struct of_device_id lpasscc_sc8280xp_match_table[] = {
 	{
+		.compatible = "qcom,sc8280xp-lpassaudiocc",
+		.data = &lpass_audiocc_sc8280xp_reset_desc,
+	}, {
 		.compatible = "qcom,sc8280xp-lpasscc",
 		.data = &lpasscc_sc8280xp_reset_desc,
 	},
-- 
2.25.1

