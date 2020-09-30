Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C2F27EF1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 18:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgI3Q0K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 12:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3Q0J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 12:26:09 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75126C061755;
        Wed, 30 Sep 2020 09:26:09 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id b22so2862952lfs.13;
        Wed, 30 Sep 2020 09:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+q/kQLk04g4z0jNET503j6CVfOt/CRui3yz414slVAE=;
        b=mX4N6iZXPX8AbyenbUvaGYVAao5sDFsKIMg5E2e5Tu+/GqLb/QpQs9JqRaBaHNtfJA
         THSffxd1QtDzvEt+6giQTh2C/jyGvPqHvj3mkACtjUXJAWUzLFLBp11eO02+OhgxYXUr
         5b3GNszbWo+gPayDxQ8CDG3FKb4UDYojBh2877aCNBmUxOMM6TTi2u/yG0QBxlBxhLwm
         5bcsJiqNYMyZQ4XL62iYrgpYXg2vEkVJxyMj4YKAJ9kE6h8u5/bNERSxqEEk6aqAjWlL
         1h7EgFuaa3uY+dYUyhQ54L9QrzefsWrozQct7W2XxIsvsVd7jocvBtwCLe7sLzq/RNxK
         Kr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+q/kQLk04g4z0jNET503j6CVfOt/CRui3yz414slVAE=;
        b=GSgjpZTOOGkOJiexb3VFsNQSpxMWsmAxLNlxxPdymdb/w5y4QU88d34z1Hmmy4+J4q
         fluStXEIsHZvGN5spOaNhuWbZyw3GZmUoB7ld8vBsHy4CmuhBeptpMDTWWIgIo9zUgvj
         k7+PM/mIO4XMDKxhVwN7C5CFI45Ua1UQnTvtwXxCPazgWgg73TL/cRS0h0OQbKwSJDuy
         Hxs2h6BPtfIZPiXmmSDxBnefAANsTmmkbWpvAVUNIoa8oHsAf6QcmZDr8HGylgljUQQq
         JHxm1Xu7IL2YuQT1SP4DlKDzjonEiDHlz/erUxBTo/tV/W0fT8znTNpd22L7pKOfHvrI
         c21g==
X-Gm-Message-State: AOAM531QpJf278MjLL591Wm7ccwysDr3cnCUd8eP6a5e3ukrOMiy+lgZ
        zfVk9YvBg6E35Key3P8emCM=
X-Google-Smtp-Source: ABdhPJySYW/Hym8KxaWwR6Yi146b/CMbLii9oz8QWT6zcspXqGn0TwypZI3RcU2Z+QhG4kWxWvD/hQ==
X-Received: by 2002:a19:418e:: with SMTP id o136mr1063932lfa.145.1601483167937;
        Wed, 30 Sep 2020 09:26:07 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-229-94.NA.cust.bahnhof.se. [98.128.229.94])
        by smtp.gmail.com with ESMTPSA id i187sm245512lfd.65.2020.09.30.09.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 09:26:07 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] regulator: qcom: labibb: Constify static structs
Date:   Wed, 30 Sep 2020 18:26:02 +0200
Message-Id: <20200930162602.18583-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The only usage of qcom_labibb_ops is to assign it to the ops field in
the regulator_desc struct, which is a const pointer. The only usage of
pmi8998_lab_desc and pmi8998_ibb_desc is to assign their address to the
desc field in the labibb_regulator_data struct which can be made const,
since it is only copied into the desc field in the
labbibb_regulator_data struct. This struct is modified, but that's a
copy of the static one. Make them const to allow the compiler to put
them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/regulator/qcom-labibb-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index 8c7dd1928380..8ccf572394a2 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -44,16 +44,16 @@ struct labibb_regulator_data {
 	const char			*name;
 	u8				type;
 	u16				base;
-	struct regulator_desc		*desc;
+	const struct regulator_desc	*desc;
 };
 
-static struct regulator_ops qcom_labibb_ops = {
+static const struct regulator_ops qcom_labibb_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
 };
 
-static struct regulator_desc pmi8998_lab_desc = {
+static const struct regulator_desc pmi8998_lab_desc = {
 	.enable_mask		= LAB_ENABLE_CTL_MASK,
 	.enable_reg		= (PMI8998_LAB_REG_BASE + REG_LABIBB_ENABLE_CTL),
 	.enable_val		= LABIBB_CONTROL_ENABLE,
@@ -65,7 +65,7 @@ static struct regulator_desc pmi8998_lab_desc = {
 	.ops			= &qcom_labibb_ops,
 };
 
-static struct regulator_desc pmi8998_ibb_desc = {
+static const struct regulator_desc pmi8998_ibb_desc = {
 	.enable_mask		= IBB_ENABLE_CTL_MASK,
 	.enable_reg		= (PMI8998_IBB_REG_BASE + REG_LABIBB_ENABLE_CTL),
 	.enable_val		= LABIBB_CONTROL_ENABLE,
-- 
2.28.0

