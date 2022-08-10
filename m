Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07D2658EAC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 12:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbiHJK5Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 06:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbiHJK5Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 06:57:24 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2EB1B7AC
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 03:57:23 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id j15so17335043wrr.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 03:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=XBou7R/Q/zSsjgDby+mUOW0rZ2LGY9ENAcZBxHQBNRc=;
        b=fn3EftcGqSEnsRs7vh1e3zzqj+2UsxU5sOd0uZ/Lev3JuULoI7IQt7hlI+ImmCL/l7
         R9/TTggOxmK+PWyxNTwvhbWHGU5LLo8zLU224xs20GzPTG0uJ0PJeOu49/qrP7Rv5AB5
         E8MNwOCsRxWsyz6C9NLrPmlXqN5EnniIosMuWBVOT3tvxR1qDd3b32NvgRlfbPgnfijw
         kOnqHUftl7muw3vzX/68VzpWIhI0w/vEO4KJ7maKPznWIFm9Uevs5newoNWcu7j0UdQa
         ubpfOl/pqWh8d+KHKJ2lUTqjseIorWU/xEdZMRKmjAza8TFqMu1KMevPD09U80lwC/tl
         LTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=XBou7R/Q/zSsjgDby+mUOW0rZ2LGY9ENAcZBxHQBNRc=;
        b=g0B20fWTXsMVxDJP9Dv0AV5K+NgSCg0gr6ohMdn2ds7BSj9RYLX2pnElm2cNFK20re
         DFV70oe5ig6BCE+XUDqg0sl6lA3QZoEL9kb+oGvaPPPHTcCfET4ZRvXaHs2NRy/uKhqE
         FxxprLJYM4+Tuu3xRPnRbWOherL318ZvJOcp2p0vu9GkzQw4FVcTOd/6MYVXusIYIXRe
         KKY4NQZo1cp/IdRCSIU0aFdchtXwZVQmlAyIGTyznWysC0M+Ihfgg806maipCzSnit1c
         hu7uzQ2o2A57LSIHW4YU5vdB8grQB/YrL7lQq2RvYG8TlW9x/SpJavy8cJZWUW+JK6aO
         aVOw==
X-Gm-Message-State: ACgBeo1jG05D3Km+OrE81a28DkcGrRMDOokwJyIMpDYsBiKLVy6EOxSu
        bw7NHDT6Kyxb5UfcYnmPFN3XvQ==
X-Google-Smtp-Source: AA6agR73X6IomP32uxyWPtqky+wa+CUNiSgdixHhJQFApYUBjhLB0pfl/e1z0IeipKM9aSJkxWMDVQ==
X-Received: by 2002:a5d:47a5:0:b0:220:5985:6710 with SMTP id 5-20020a5d47a5000000b0022059856710mr17629673wrb.633.1660129042061;
        Wed, 10 Aug 2022 03:57:22 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id bd6-20020a05600c1f0600b003a53731f273sm2101446wmb.31.2022.08.10.03.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 03:57:21 -0700 (PDT)
From:   abel.vesa@linaro.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 2/4] soc: qcom: stats: Add SDM845 stats config and compatible
Date:   Wed, 10 Aug 2022 13:57:16 +0300
Message-Id: <20220810105718.2137015-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810105718.2137015-1-abel.vesa@linaro.org>
References: <20220810105718.2137015-1-abel.vesa@linaro.org>
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

From: Abel Vesa <abel.vesa@linaro.org>

SDM845 is a special case compared to the other platforms that use RPMh
stats, since it only has 2 stats (aosd and cxsd), while the others have
a 3rd one (ddr).

So lets add dedicated stats config and compatible for SDM845 to make the
driver aware of this num_records difference.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/soc/qcom/qcom_stats.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index d6bfd1bbdc2a..b1638a0e1cd6 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -246,6 +246,14 @@ static const struct stats_config rpm_data_dba0 = {
 	.subsystem_stats_in_smem = false,
 };
 
+static const struct stats_config rpmh_data_sdm845 = {
+	.stats_offset = 0x48,
+	.num_records = 2,
+	.appended_stats_avail = false,
+	.dynamic_offset = false,
+	.subsystem_stats_in_smem = true,
+};
+
 static const struct stats_config rpmh_data = {
 	.stats_offset = 0x48,
 	.num_records = 3,
@@ -261,6 +269,7 @@ static const struct of_device_id qcom_stats_table[] = {
 	{ .compatible = "qcom,msm8974-rpm-stats", .data = &rpm_data_dba0 },
 	{ .compatible = "qcom,rpm-stats", .data = &rpm_data },
 	{ .compatible = "qcom,rpmh-stats", .data = &rpmh_data },
+	{ .compatible = "qcom,rpmh-stats-sdm845", .data = &rpmh_data_sdm845 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_stats_table);
-- 
2.34.1

