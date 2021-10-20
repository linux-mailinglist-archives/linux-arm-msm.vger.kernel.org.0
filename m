Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBA04342CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 03:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhJTBYy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 21:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhJTBYy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 21:24:54 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E2CC06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 18:22:40 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id g36so11502802lfv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 18:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ScUDD7aihsr5j2zsrm0f+Y3vYQ6YnNqYwyltABZwstY=;
        b=PRLGbFxmo5Z82/TEYro491VX0TUrkAQrzs/E/D5rj2piPwZFbkW1qjOsDs4plgc2W5
         p39dhxMVqIYDXykpbRklj42qnKvLMaEvrH/UUJFGXz7andilvb9hkgrHjWR8CFdTg9z1
         75Mr7rnB8516T8CQNMJLNi8DwO46naLQpXzcoOCQkipahL6mV6qKK/x9UfBLN9Hm56U8
         DVTL7bqGCQW17pL2ofVmpPj6KKM/o/OtXZUucdRb7hE/WY3TcOBtG2MXvW3w6g3yK8iq
         Koz+8lt5BensekSDI4AlLhe2+T0R//WVhxpVdXuI8zSsjiX4he48aAWubl22HcW7rMk7
         0UCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ScUDD7aihsr5j2zsrm0f+Y3vYQ6YnNqYwyltABZwstY=;
        b=6F/OUBuNoVTRyS5ujBssj3nVE+jTwkL99NvCDxVNIQrsAoHtJZgGOk5bXzvM4jXE3P
         Sn7vno59Fd3lv26dAZ1l2gH6Xj5JeW4tSNnJCcq32qXPgqxO8z/EVpADaIJMzLHBFLez
         wPSmTkn0qqGatthIcTXbQ5NXKU7WfBy8x3DP/VYHVqzTi+SOk2V+WV02zLb1BFaahI/P
         vdjhM0L/rH6lUN+BXBIkW6L5i3cUgZFXrxlUn7eyLf7zlEcRAaDP6Qb2pPb++SJELkoH
         NoR3cR4GV++ywDsh+0bAots3z7QibKuO6+fByUltGTKz/T8NyepbDVIsz5JZ9XJRl5zZ
         gPoQ==
X-Gm-Message-State: AOAM531U7ZgOSG/qttjFsT2KaZveupEihLRmY8LnkHAhsZC32NyNf2Ys
        w0cF2gmhlP3OaPd66usr1UQS0Q==
X-Google-Smtp-Source: ABdhPJy9xsS9seXSzyn4FvxKULzYCSleF+K0zAThWW2OAqM4Yg0jXWn0xf4ezVRQc21Dy/fhtuZrZQ==
X-Received: by 2002:a05:6512:3763:: with SMTP id z3mr9472005lft.601.1634692958676;
        Tue, 19 Oct 2021 18:22:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p2sm59785lfa.258.2021.10.19.18.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 18:22:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] soc: qcom: rpmhpd: fix sm8350_mxc's peer domain
Date:   Wed, 20 Oct 2021 04:22:37 +0300
Message-Id: <20211020012237.1182655-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sm8350_mxc's domain description incorrectly references
sm8150_mmcx_ao as a peer instead of sm8350_mxc_ao. Correct this typo.

Fixes: 639c85628757 ("soc: qcom: rpmhpd: Add SM8350 power domains")
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/rpmhpd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index fa209b479ab3..5fc5f04249d4 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -204,7 +204,7 @@ static const struct rpmhpd_desc sm8250_desc = {
 static struct rpmhpd sm8350_mxc_ao;
 static struct rpmhpd sm8350_mxc = {
 	.pd = { .name = "mxc", },
-	.peer = &sm8150_mmcx_ao,
+	.peer = &sm8350_mmcx_ao,
 	.res_name = "mxc.lvl",
 };
 
-- 
2.33.0

