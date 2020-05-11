Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505F51CE76D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 23:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgEKV2S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 17:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725810AbgEKV2S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 17:28:18 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84AC6C061A0C;
        Mon, 11 May 2020 14:28:16 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id y16so5656282wrs.3;
        Mon, 11 May 2020 14:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZMZjW73mpC0xf7aOeUO3KofewvEynGV+TSklGgHPDCE=;
        b=QoIDfMJFKM0pxVu3Gthdx/Bs7sDwRhRKjPcBbRALOEOmvxibo/V0esB/uWaYBO45nk
         n+CeIYr+Df9R7Z8AfNyvXvGwK0qBnMlrCujn08owf9m8TknKtD4cFIBqEyNcPElKmr+X
         AiG+xDkvlqE1BMysPjuU4QOlBBqwBjsmNeP1J6XHMr9L8n/kCNuR8FVN61XacIbqbx1M
         b1SZplrHlbQjCUSqwIPmAuilPgRDBWWIbREHQ1d3rx+GG05S3H56gO5PFjCIE1JvIKaR
         SFo+WKV4zLM6Xm13hDsACNF4ArZ7A/ZXIyH3kP0iSFSW9HE/HbDZBBOO7mSQN8kf4ViK
         Qrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZMZjW73mpC0xf7aOeUO3KofewvEynGV+TSklGgHPDCE=;
        b=biGZrF6RzMMdwGq4xPotnUPGq3563UR9B5qtJ1XrgqpyaFBdZfxEXvjaBpwcQ6aCa5
         CMDHfNo388+IOUszHHZh9iSk8MItidbievvNGdqsdohtW41s2h7qVECFrd2xkVDwO28R
         qGF8za8sj6RLtym4MxARy2M77hKz9Q9fFBMTVoPwLVVPrmFs1+C3HoVucM/qWvFlYhSu
         UuMjGkAaPTQo74H06rXlwmz3ePCUQIo5KuvshJOQ7dOIBC9UeTGvsgBGlgoZ2Iog5q68
         9gojJ1q4M16NdCO7YM4oCWcLvixohG060pQMXwDQDvanUEwQ9GJFpsC7SULCPutjt2Dl
         qSNw==
X-Gm-Message-State: AGi0PuYWXZ5Qswda5xcpxBosZdWN2Usk2p6IUvS9rDiFjU3Y6ZrA7w1w
        hPVsmNN1+5aocEUBpzZk9Sk=
X-Google-Smtp-Source: APiQypJqaxQpoMB59mBICnMYc9SoOYskJ65Yd8XiW3gpMOb9FzTEweVpT3HF5gv8JS95oQHhV5Fg7g==
X-Received: by 2002:adf:e4c2:: with SMTP id v2mr20651517wrm.72.1589232495323;
        Mon, 11 May 2020 14:28:15 -0700 (PDT)
Received: from localhost.localdomain (abae78.neoplus.adsl.tpnet.pl. [83.6.168.78])
        by smtp.googlemail.com with ESMTPSA id w10sm20196258wrg.52.2020.05.11.14.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 14:28:14 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Vincent Knecht <vincent.knecht@mailoo.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] soc: qcom: socinfo: add msm8936/39 and apq8036/39 soc ids
Date:   Mon, 11 May 2020 23:27:33 +0200
Message-Id: <20200511212733.214464-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vincent Knecht <vincent.knecht@mailoo.org>

This patch adds missing SoC IDs for MSM8936/39 and
their APQ variants.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
Changes since v1:
	- Add a proper commit log
	- Add a missing sign-off
 drivers/soc/qcom/socinfo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index ebb49aee179bb..14831ed392e28 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -188,6 +188,10 @@ static const struct soc_id soc_id[] = {
 	{ 216, "MSM8674PRO" },
 	{ 217, "MSM8974-AA" },
 	{ 218, "MSM8974-AB" },
+	{ 233, "MSM8936" },
+	{ 239, "MSM8939" },
+	{ 240, "APQ8036" },
+	{ 241, "APQ8039" },
 	{ 246, "MSM8996" },
 	{ 247, "APQ8016" },
 	{ 248, "MSM8216" },
-- 
2.26.2

