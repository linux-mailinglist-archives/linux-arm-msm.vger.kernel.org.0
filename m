Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 498A277FA21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 17:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350311AbjHQPBw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 11:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352618AbjHQPB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 11:01:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C36358E
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 08:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692284416;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=U3UGQVuqNmJTUHQlyY57PaFZsT3ZmRuMFTjsLhZtXBo=;
        b=XMYWifxvFTceiJJV2r1OziK/iPK3iDy513ty4IZO8krkgaM2/OpCMy3MKCbu9r/lj10dOE
        lvlxfKWzwBq3ND5tQ36I70bsk+IjKKhMzxfUAh+vYCXcLWHUlTp873QW48bsDwf3k8/GLO
        DMnlLuFT8ck5VUgZERw/Bld5y/K6Z7k=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-HMisrGxGOfmxYVqzOhxneA-1; Thu, 17 Aug 2023 11:00:14 -0400
X-MC-Unique: HMisrGxGOfmxYVqzOhxneA-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-58cbf62bae8so20860617b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 08:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692284413; x=1692889213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3UGQVuqNmJTUHQlyY57PaFZsT3ZmRuMFTjsLhZtXBo=;
        b=eEOWXOCemK5WfMk85F4llBEYCnw+H6Pd1KYPnFPFtD0F3s+PsyY0hoG2aOJmd0dith
         b4ZZBu5yD99drDxNmga1xQ0vwKuovSr5RzXbY7CgzIBMJel44loqHTb6U3PoH41+0sJD
         iuhxg3HZasEmTyWzUNqZBF+d81oKm3l3PENfg+koeHULNj89gQVNzYTcykP/ENeGZbdn
         aJvQv5fDgpvPh+Y7jT753ZaCfOO5acDzAuDfBk+M8AYiYu5dp0ceshxaz2N/AVYigO3e
         993nD6AVLB3Jvx2O1O2AuSqZFI4sbGeefX17ByQRKYBSpzW9hgIrvAb8LsmE9/9HHiNn
         lRdA==
X-Gm-Message-State: AOJu0Yysu//aINSD25uwkCAzi6ySToR3RTUJ8UWCn6em7bh68xUA0uNI
        2LyeOcfqeuw9s2vsUPfYROvEV5fjtJuZ1KNmbX8u7lfTHTfj1PcPDHRlLOXCfkFzrmXqKviX+7x
        u5RCV5J//LrHkuPkJHPnrVsZywA==
X-Received: by 2002:a81:77d5:0:b0:583:6839:755 with SMTP id s204-20020a8177d5000000b0058368390755mr6771902ywc.14.1692284413608;
        Thu, 17 Aug 2023 08:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFmUDpXT1QSPSf3Fo21wGonusb0vkgfDhCpLsORG+TcghEbu5NJEptHkrNpgpnMM0ltvan0g==
X-Received: by 2002:a81:77d5:0:b0:583:6839:755 with SMTP id s204-20020a8177d5000000b0058368390755mr6771880ywc.14.1692284413374;
        Thu, 17 Aug 2023 08:00:13 -0700 (PDT)
Received: from brian-x1.redhat.com (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id g193-20020a8152ca000000b00582fae92aa7sm4654788ywb.93.2023.08.17.08.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 08:00:12 -0700 (PDT)
From:   Brian Masney <bmasney@redhat.com>
To:     andersson@kernel.org, linus.walleij@linaro.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom-pmic-gpio: silence -EPROBE_DEFER message on probe
Date:   Thu, 17 Aug 2023 10:59:41 -0400
Message-ID: <20230817145941.1091418-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following message shows up one or more times when booting a Qualcomm
SA8775 Development board:

    qcom-spmi-gpio c440000.spmi:pmic@2:gpio@8800: can't add gpio chip

Convert this over to use dev_err_probe() to silence this message.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index deded9c6fd7d..d7576fa14935 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1154,10 +1154,8 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	girq->child_irq_domain_ops.translate = pmic_gpio_domain_translate;
 
 	ret = gpiochip_add_data(&state->chip, state);
-	if (ret) {
-		dev_err(state->dev, "can't add gpio chip\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(state->dev, ret, "can't add gpio chip\n");
 
 	/*
 	 * For DeviceTree-supported systems, the gpio core checks the
-- 
2.41.0

