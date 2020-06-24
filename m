Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0117320764C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 17:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391257AbgFXPBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 11:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390251AbgFXPBX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 11:01:23 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031FAC061573;
        Wed, 24 Jun 2020 08:01:22 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z13so2619654wrw.5;
        Wed, 24 Jun 2020 08:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5YzgOuYewZUDJEPZZEMrFZJbmkFe555mznSERqhNf/o=;
        b=aiyuM0gnM7Z8xQaZsO8mWW0wdw5aqdz4j06GqkF8fPL9KlfyQRax+qb6m+zkVTHJ6n
         fJKhcYsXTe7DC3Cjojt1wWizWl/FaiusevE3BaD4cTB3H1e2fXvZxsEaskZEAUTRgcMO
         gpmqHHGc4JFTO+DTk4okdUJYYm0+eWT4hQv96vUg6ynzfnB3NYdhz0oV1zcryP5QGjlt
         TQG604IBh4laON6X780epWbeiZ42/bEhTEs9hp+u/NJjDpnmp/6E+QGWD/PWkwgHXog9
         3j6r3CQXFoi1tBpQPRFhND63M07CLYIdBm5dFDdYZusXYOzFjZ3R5nTICDId8TKrw9jt
         cpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5YzgOuYewZUDJEPZZEMrFZJbmkFe555mznSERqhNf/o=;
        b=GVT4nGrqDMmy4QWSROjkuQuXIO7XTGnidTnLBxCZZ2I2Hrt9KRgu9COdENv4/hMZvv
         zT5obP5VbWgGlgqdvnvGAF8bHrZrWqcCYkUS61mZF6wh+VupRtZZ5yjPc3fS+OWw305I
         VH3rrnaBy9yHlZIn/mgs5j56UmRYBWrii44x539Q/ginKxZFWNOsu+lervMnGrfouftt
         BWQR8GNWbydopSrurT0FQyfxOlDR5WdZhJeKfDcRtjvTujENl/gduoMhYOIVHRLV9nAt
         1zWdLVdGZFT4sElhWFBRCoL6gJUaAK3r3+8wEfSYs7BqpJNJEQK9CdqCZx3izK2o96T2
         mFtw==
X-Gm-Message-State: AOAM532MQSazTY04MZN36nHwr90dKP9T7YkpFic/hGyZKlKc521w5EFu
        5cFhqrAUzzpJPKyrT7r4dK8=
X-Google-Smtp-Source: ABdhPJySaaRY74gPR2axOufGFbY6U1vbM1Scd3Z/NwEpNt1CCJgL0pfqrlwPvcN8o2u/SyXYRwPs/g==
X-Received: by 2002:a5d:444e:: with SMTP id x14mr30260748wrr.279.1593010880772;
        Wed, 24 Jun 2020 08:01:20 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id s8sm21339390wru.38.2020.06.24.08.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:01:20 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] firmware: qcom_scm: Add msm8994 compatible
Date:   Wed, 24 Jun 2020 17:00:59 +0200
Message-Id: <20200624150107.76234-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624150107.76234-1-konradybcio@gmail.com>
References: <20200624150107.76234-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change adds a compatible for msm8994,
which requires no additional clocks for
scm to probe correctly.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
 drivers/firmware/qcom_scm.c                             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 354b448fc0c3..898831d170bc 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -15,6 +15,7 @@ Required properties:
  * "qcom,scm-msm8916"
  * "qcom,scm-msm8960"
  * "qcom,scm-msm8974"
+ * "qcom,scm-msm8994"
  * "qcom,scm-msm8996"
  * "qcom,scm-msm8998"
  * "qcom,scm-sc7180"
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 0e7233a20f34..008b3a08fb15 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1151,6 +1151,7 @@ static const struct of_device_id qcom_scm_dt_match[] = {
 							     SCM_HAS_IFACE_CLK |
 							     SCM_HAS_BUS_CLK)
 	},
+	{ .compatible = "qcom,scm-msm8994" },
 	{ .compatible = "qcom,scm-msm8996" },
 	{ .compatible = "qcom,scm" },
 	{}
-- 
2.27.0

