Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75897268218
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 02:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbgINAMf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Sep 2020 20:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgINAMe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Sep 2020 20:12:34 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5D2C06174A
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 17:12:33 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v23so17144658ljd.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 17:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m6n5CDEGJ98PFYReYu5BYco2BEPl56wh33ijWe674VQ=;
        b=uRwsUj+MUWa078lii8vy0k1rxsdECNxiPXqzouIeMABqgxPPQUfBSupShgSHvlaA1b
         MigDbTrjWwQevXWk0Pl4YPHQjxLyWBEUiiGjJ28VKnpiGARdj/LD/tMAOw3upLbQgykA
         JJIb0mgbGF50LU5/VXeFOgvLri1fSSlA4bZTE40G600y5K25p6CbtxlmBWM5LvMrh3aW
         qKMulIRa1T+rYrfWD85EvoT3KdmzRqumdnhPWcWM2UCIrIRuf7fj+pHU6f63U9l6OGb4
         I2szfj33bBE26EBLDDIhGN4VHoGvo7nNmLnGmw9oJiIhNnbx5Lk0DqBDChqnHzZpUkpP
         tcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m6n5CDEGJ98PFYReYu5BYco2BEPl56wh33ijWe674VQ=;
        b=Kt6WhT2zjbIKZqxruVUDExXwJpxVpXNE1frPEpozWXSBLASpqmIm3d8lQkA8hTRtVo
         91ue80PN9q82885ouaP7AhbsZPuEbktQpMkVhceFJCjoRlSiLJ62NNHdBYx+M+BQPVYO
         cj1L2O0DiD7hf6s+vGoivkmbIKO5gFFcdjCH7tprbN+5hnX5LccIsdbN591IkyDyfRAb
         x51ezin85sOcSdjbET3Vkk0rcIhCdEx2SbaRleuNOEaeRHZVWmNN+VXv24Rs8ULtFmLl
         U49in9dTzXx1yDv9DEaPld92J9xzUi6CfkZLNtTmVoE9rqPVhrlSJpX7xhHJl1ljCJsy
         UoRA==
X-Gm-Message-State: AOAM531f9jRQ0rruHKPcK3fT+2UNJKbmsRKuf2yUPDbBwCCpdQCeTu2v
        4hNv6cATgUKRydp/XJhblwYfKw==
X-Google-Smtp-Source: ABdhPJx7Krni8hTCy3g25lX6vRAn5YkpD44YEg1cR4Sp8WlZrNQ7C9A3RpqJQQciL7dgxB6M+uxBDg==
X-Received: by 2002:a2e:8645:: with SMTP id i5mr4021161ljj.209.1600042352188;
        Sun, 13 Sep 2020 17:12:32 -0700 (PDT)
Received: from eriador.lan ([188.162.64.187])
        by smtp.gmail.com with ESMTPSA id e65sm2906694lfd.143.2020.09.13.17.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 17:12:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2] pinctrl: qcom: sm8250: correct sdc2_clk and ngpios
Date:   Mon, 14 Sep 2020 03:12:29 +0300
Message-Id: <20200914001229.47290-1-dmitry.baryshkov@linaro.org>
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index a660f1274b66..826df0d637ea 100644
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
-- 
2.28.0

