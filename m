Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD9827996A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgIZNCc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZNCb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:02:31 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58944C0613CE;
        Sat, 26 Sep 2020 06:02:31 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k15so6823919wrn.10;
        Sat, 26 Sep 2020 06:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w1nHgSXiyRX1I7vLuG0jsc7c+HKkk/aWCdpprslY+FI=;
        b=VkaBAj6HCVaUKP50urEs6yPeDxX7uIvgYksBmrWBSf9BzZ++ZMTfyfarLfnIsyLsCb
         44CrG7EiYZBQ2/xGWON0F5lrgmnOyywgWBx7FQSt3TYRFIzfE0HYZAfd9BCpI5ohcdi4
         zcY6GmsVdGZQFbmu7kObSVTTC6Qk96iS7cND6BSWuFBpRBSLwBCsuPevadSQnNP5E+7Y
         vDct0w1C+3hU1EcRMJvZpscTPG3AET+pdtRJnVwKbi82mq1Xu1iEwpBE8vNa79vVxB2x
         tFXf5IlhjuLTR3UFZJwUiV0ghfwQN85AYLOc6iRMX1Pth3PINL0dQK/uzUZWzizBUwsi
         z90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w1nHgSXiyRX1I7vLuG0jsc7c+HKkk/aWCdpprslY+FI=;
        b=kxLRbk9nyCucuFE2hC4uDKcf2fhbPbddNgppmzup7hR86dzoGTmlmAcHqp/A32kHrH
         /vNtEx7f3akiNYEtbGhd24SUsR4SBHG+zxQZryJbAgjFg/JaRj4YFcQTaplcWhidmssn
         aXwJAYdAVnFBuoH2oqwzJrCtCpmLXr3SP0qQtnNo2pKd4cADihIV1aCL5XVH26fWwy9t
         cd0CiZvVAdBUwS2jOhG1rlRy08UFPSc/PzKX27RzFsa0phC8CvEUIZmKJrUm0cA7EUH2
         VI+Oadae6CjgELvIyYINp3HK2vLQXNwZKQr6lOwpqgiLPAaeg59dqSBN0JnjwwPCNsFy
         cOPw==
X-Gm-Message-State: AOAM531BuTvGyMiMGN7upfdLvw0RgbQMgh36CrcSTmeadEak9G1EwjEa
        SH/ZH/r1hC5nAZj9Lmeak+Q=
X-Google-Smtp-Source: ABdhPJwRRjjnq4BXKs+TCa/1HoKstgR181NpFmZ8bfn0I1tKyCsqL0sdiPihqYdoiED2L5VcZV3DZA==
X-Received: by 2002:adf:f203:: with SMTP id p3mr9568911wro.339.1601125349876;
        Sat, 26 Sep 2020 06:02:29 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id f14sm7137738wrt.53.2020.09.26.06.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:02:29 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, sboyd@kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] clk: qcom: gcc-sdm660: Mark MMSS NoC CFG AHB clock as critical
Date:   Sat, 26 Sep 2020 15:02:22 +0200
Message-Id: <20200926130225.13733-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130225.13733-1-kholk11@gmail.com>
References: <20200926130225.13733-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Similarly to MSM8998, any access to the MMSS depends on this clock.
Gating it will crash the system when RPMCC inits mmssnoc_axi_rpm_clk.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/clk/qcom/gcc-sdm660.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index f0b47b7d50ca..93ac77628bec 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -1684,6 +1684,12 @@ static struct clk_branch gcc_mmss_noc_cfg_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mmss_noc_cfg_ahb_clk",
 			.ops = &clk_branch2_ops,
+			/*
+			 * Any access to mmss depends on this clock.
+			 * Gating this clock has been shown to crash the system
+			 * when mmssnoc_axi_rpm_clk is inited in rpmcc.
+			 */
+			.flags = CLK_IS_CRITICAL,
 		},
 	},
 };
-- 
2.28.0

