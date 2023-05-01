Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2F566F314E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 14:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbjEAM5X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 08:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbjEAM5V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 08:57:21 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A0010E9
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 05:57:18 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2a8a59daec5so22947611fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 05:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682945837; x=1685537837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28S63ma6Nc4wW+jWaKui5HjUs7at3nzDPT9xYvZc0Iw=;
        b=iVhpir8kH8Y7P8d4uXIJs00hmKzJ3IXqak4Dl/VXaTZjIvf1dTySSlkb661qv/AW3e
         kUjLNqugCcJASpaAsEEfcK1FzLT3CulsPYIxsYm/+JVZdVuR5HOr8sZrYhOAYkiC13PS
         uhVncwyjAabPbEJNqE+5razoCoZ/rXy9faRks8kqtnUkcKYg9ebMSiu2mY0b1aDkrB6+
         XObQokZdSFrOvyx7R+ZQYwk7yrHra3Rs24IpLb563MaTP3cETFjeCgQIKTO6/RFyPRna
         mW5KZ9+Mk1NCllWTYjZTfCORN13TECBhEHaI/2ujazJ3xiwT06Lk/Xh0+yiabB4z5RVL
         8rhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682945837; x=1685537837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28S63ma6Nc4wW+jWaKui5HjUs7at3nzDPT9xYvZc0Iw=;
        b=X9UtHwf2l7PFaKQLed6EN/fMLq9BF3JdBEt3kBf5JhJU1W1RKO6X8SoTNkV8lggSSu
         exbVRQCSe/2iJI0DCxKD6Fd/o116w5H55b+M+sU4KHvupYyItpb2YNfwUdrF3REZ8UWc
         OxkQISOxgDvr9Wng9zK6PSzFeJwnuyQOb+HkcJKe3dEpktRRV6G4tN7b3zvbjXkNqMnU
         Cy3Vr9DFDLHz1GfGzmgyhpjz/9rikyftf2lwyRsKxik4cCyOY1ysyvM1xtjby0Qbq0M7
         l9Qh7zLOmErQqniqs+FJ3MyinWgV71+ZErVSD0j3O2Ed38YkD9h5n6zqGPYNv16Q9m2p
         wV3w==
X-Gm-Message-State: AC+VfDxL0hPkCEseBH6swhOFRwppwJhDxir7aKYyNWg1mmOVGJAjZ274
        GZ03A/V/H/1PyGME4+BanM7IzQ==
X-Google-Smtp-Source: ACHHUZ6+umAAMqwRjvJ/oiDM9fYAgfb5U6cnoVx/DfbfyWbszkC/lj1I4lwXCcb4Pw+3xw3VLxlujw==
X-Received: by 2002:a2e:b61c:0:b0:29a:1f7d:38b1 with SMTP id r28-20020a2eb61c000000b0029a1f7d38b1mr3884374ljn.28.1682945837300;
        Mon, 01 May 2023 05:57:17 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id y6-20020a2e95c6000000b002a77ab1d73dsm58332ljh.96.2023.05.01.05.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:57:17 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 01 May 2023 14:57:12 +0200
Subject: [PATCH 2/3] clk: qcom: smd-rpm: Make DEFINE_CLK_SMD_RPM_BRANCH_A
 accept flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230501-topic-rpmcc_xo_a-v1-2-93f18e47b607@linaro.org>
References: <20230501-topic-rpmcc_xo_a-v1-0-93f18e47b607@linaro.org>
In-Reply-To: <20230501-topic-rpmcc_xo_a-v1-0-93f18e47b607@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682945834; l=1813;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9Jacz1Yu9Sh2wayMooJRt9aLJtA6AgNtuaR8+zaLHzY=;
 b=HcEVnGLvfBMKeXtYOzYtd/gAfzaeZQQdZIAv2yNiEV19Q/mVPoKngIpZ5ftjRB2h9COLbjtXNAwp
 SInBx/g/CMzw5aRLCXI6/iye66GBxozDjEGzYM35Ay9Yt/wQmgpi
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for supporting keepalive clocks which can never be shut off
(as the platform would fall apart otherwise), make the
DEFINE_CLK_SMD_RPM_BRANCH_A macro accept clock flags for the active-only
clock.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index e559755a86e0..e00889fddc7b 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -129,10 +129,10 @@
 		_name##_clk, _name##_a_clk,				      \
 		type, r_id, r, QCOM_RPM_SMD_KEY_ENABLE, 0)
 
-#define DEFINE_CLK_SMD_RPM_BRANCH_A(_name, type, r_id, r)		      \
+#define DEFINE_CLK_SMD_RPM_BRANCH_A(_name, type, r_id, r, ao_flags)	      \
 		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(branch_,		      \
 		_name, _name##_a, type,					      \
-		r_id, r, QCOM_RPM_SMD_KEY_ENABLE, 0)
+		r_id, r, QCOM_RPM_SMD_KEY_ENABLE, ao_flags)
 
 #define DEFINE_CLK_SMD_RPM_QDSS(_name, type, r_id)			      \
 		__DEFINE_CLK_SMD_RPM(_name##_clk, _name##_a_clk,	      \
@@ -439,10 +439,10 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 
-DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
+DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000, 0);
 DEFINE_CLK_SMD_RPM_BRANCH(qdss, QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
 DEFINE_CLK_SMD_RPM_QDSS(qdss, QCOM_SMD_RPM_MISC_CLK, 1);
-DEFINE_CLK_SMD_RPM_BRANCH_A(bimc_freq_log, QCOM_SMD_RPM_MISC_CLK, 4, 1);
+DEFINE_CLK_SMD_RPM_BRANCH_A(bimc_freq_log, QCOM_SMD_RPM_MISC_CLK, 4, 1, 0);
 
 DEFINE_CLK_SMD_RPM_BRANCH(mss_cfg_ahb, QCOM_SMD_RPM_MCFG_CLK, 0, 19200000);
 

-- 
2.40.1

