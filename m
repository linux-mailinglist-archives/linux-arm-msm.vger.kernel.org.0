Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4AA22681C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 00:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgIMWuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Sep 2020 18:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgIMWuK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Sep 2020 18:50:10 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B62AC06174A
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 15:50:10 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b19so16959292lji.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 15:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vxlAyo97wxQgbGRZa/IhWDwvPK81lO+ghbIt/dVSdiY=;
        b=YsvNQgTecwvMyekXICSf9LTdDnDPBDwT/Zi78Ia4qVNCCsosqmkKCXayWDzPNclvmq
         QHJ+90ElCr3wmZ8W7bMJk9zZB07szFQnsVKegJR/7CnqSfuj9ypP9qNM2J0eAtN9mPgU
         isyutLdRrrKFTbrrD8NS6nF5/l27bf6t/X68zqBQuUFAEv7gJOOJ2xwf8v5PssFSVpN/
         XfczdQH+hkYO8a/YRtSBM0kzij+dUe8ykztU6FPq3+sPxJHOR6awr4MG30lOiTi5C/M9
         +qtsiHVPY1lnEXSDLRReZ7JekAP9ZujukdELPX+R7vtN15IIs5WzDyQ0JpPKOncehm34
         B/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vxlAyo97wxQgbGRZa/IhWDwvPK81lO+ghbIt/dVSdiY=;
        b=P4M8EhrAbIXLcQD78O/aOtbARftcBepU1+V8Z5VELvF39P+KvkEliyRIl1podmmqiG
         XyUkYDj4yiaJ6DaJM0adl+lJV6ULLEoBzAlq35smqk67PzE7cXLLeuqBTwvyYQbMhNXh
         3UuzbBs9SiZRY7SdAfUqgQOWLC92dhJ/yXrg/lTCzmLIcVky7z5qaMGsGKE1NWAuSN07
         7KsCv4xzC3PRulTzxnBhkUPxqr0eTKPqb7BYdjSFLm7AocdtBgLiZ6532Kgt9b/aAcM+
         xH8ef6DAIYHJ4e/ov2RHOyWv1Gol5yPsB1iM5gQIpLjKP6NjKFVoeF2jGXRVEbpu6N3O
         6Qcw==
X-Gm-Message-State: AOAM531Pd7EP35gLFOkULl/Q5kRZ2CqG7nlPVaj4U+N6xRa1987m39O9
        V4qXPao825vrF8pngUxoGA9Yaw==
X-Google-Smtp-Source: ABdhPJwWc1T6Zd5iTzCuT7zAKaTPAum8c58ds3N9rXRn6WJqWKA3AY8uuLBbSfEHNYWCjLpP9eAvLA==
X-Received: by 2002:a2e:965a:: with SMTP id z26mr4276635ljh.88.1600037408497;
        Sun, 13 Sep 2020 15:50:08 -0700 (PDT)
Received: from eriador.lan ([188.162.64.187])
        by smtp.gmail.com with ESMTPSA id z141sm2859241lfc.171.2020.09.13.15.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 15:50:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: sm8250: correct sdc2_clk and ngpios
Date:   Mon, 14 Sep 2020 01:50:05 +0300
Message-Id: <20200913225005.30218-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct sdc2_clk pin definition (register offset) and ngpios (SM8250 has
180 GPIO pins).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 4e3ec9e407ad5058003309072b37111f7b8c900a
---
 drivers/pinctrl/qcom/pinctrl-sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index a660f1274b66..4f7dae61b089 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1308,7 +1308,7 @@ static const struct msm_pingroup sm8250_groups[] = {
 	[178] = PINGROUP(178, WEST, _, _, _, _, _, _, _, _, _),
 	[179] = PINGROUP(179, WEST, _, _, _, _, _, _, _, _, _),
 	[180] = UFS_RESET(ufs_reset, 0xb8000),
-	[181] = SDC_PINGROUP(sdc2_clk, 0x7000, 14, 6),
+	[181] = SDC_PINGROUP(sdc2_clk, 0xb7000, 14, 6),
 	[182] = SDC_PINGROUP(sdc2_cmd, 0xb7000, 11, 3),
 	[183] = SDC_PINGROUP(sdc2_data, 0xb7000, 9, 0),
 };
@@ -1320,7 +1320,7 @@ static const struct msm_pinctrl_soc_data sm8250_pinctrl = {
 	.nfunctions = ARRAY_SIZE(sm8250_functions),
 	.groups = sm8250_groups,
 	.ngroups = ARRAY_SIZE(sm8250_groups),
-	.ngpios = 181,
+	.ngpios = 180,
 	.tiles = sm8250_tiles,
 	.ntiles = ARRAY_SIZE(sm8250_tiles),
 };
-- 
2.28.0

