Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2640327996E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729412AbgIZNCi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbgIZNCc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:02:32 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B332C0613CE;
        Sat, 26 Sep 2020 06:02:32 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id m6so6915199wrn.0;
        Sat, 26 Sep 2020 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ft0uYzHW7Tr0B16PJ7xQZjpo6Bsi3BureXQ93z+5ds8=;
        b=NZ7i7U1vSjQI/KznD6Hv3GAYXRVnBbL1MlN+dlsA/Hp+bK6HVj1xPzyK2C+1up3G+C
         75VQwjC1ztzx1En+0KAA+JSbFclKSpJ2RYfSBi8QFpigd4m8WL94GNfoT5Jb4qtukmQw
         0NKVophjg9n+rAJj7m6sxMSB57Ro8hs13leB2m2nygZG83RjKgnXsbOo4qviAhrPNAO9
         39I5mQu5ysCX1kdbB5UTAXbqZ+k+ltN7y5WJ0Bwz40QzdzRWAANfhKEBZWxvN6az/0JB
         a1pbA5ClzqQX0/GLwzOGH3tyrH2M8Bt692ySrQoYl9a2zSpf478UzsUtgLNDbQnvU+OL
         R5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ft0uYzHW7Tr0B16PJ7xQZjpo6Bsi3BureXQ93z+5ds8=;
        b=UnZjYhrYcykhkl8ADNgjqFax+McLbUG2n9d4jYdKGAi9Q3X3S7Hu3hNPJEAxr4SMXs
         uP4zrnX376HP2O7L7+HOwfIN6US7Lbeogkt9IKO4NxZ2wdEHrKLyEsBwtu1XfL2Gwj+W
         821+1YrC+ryVaUE/Zl4TI0kkQYuUaSTuEWPSahkNDJeQeaHjVnrPL1EdHXBqxjT/SpCb
         vP7hHAlPn3t+IVxo4bS61nzyg+eV2CrLIdm35vnmUB6Sr4XB0JTOtt7eeKIDPYe8uTl6
         EDnLt0mzqBVamtChrKMqBeGXv/to6GCv9Jx+0pUCW/PUpikva9NS4KEqW0d2PIJO2SIK
         hOgw==
X-Gm-Message-State: AOAM5319odxVwDQqkmcVpkCQQdiroVe8TULKUX4IRpfdZ0A/KKLx3ujV
        t8yDeHe/l2Ev6+R+11edSx8=
X-Google-Smtp-Source: ABdhPJwpGPpLEx/NeTJN73FH937VI8b0th4QFDGp0B7AN7h3Ou7hIWXVzHyUeX1j2vDPOHigbR+m/g==
X-Received: by 2002:adf:b74b:: with SMTP id n11mr9336497wre.274.1601125350946;
        Sat, 26 Sep 2020 06:02:30 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id f14sm7137738wrt.53.2020.09.26.06.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:02:30 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, sboyd@kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] clk: qcom: gcc-sdm660: Mark GPU CFG AHB clock as critical
Date:   Sat, 26 Sep 2020 15:02:23 +0200
Message-Id: <20200926130225.13733-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130225.13733-1-kholk11@gmail.com>
References: <20200926130225.13733-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This clock is critical for any access to the GPU: gating it will
crash the system when the GPU has been initialized (so, you cannot
gate it unless you deinit the Adreno completely).

So, to achieve a working state with GPU on, set the CLK_IS_CRITICAL
flag to this clock.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/clk/qcom/gcc-sdm660.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 93ac77628bec..7b1c8d1f6388 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -1571,6 +1571,7 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_cfg_ahb_clk",
 			.ops = &clk_branch2_ops,
+			.flags = CLK_IS_CRITICAL,
 		},
 	},
 };
-- 
2.28.0

