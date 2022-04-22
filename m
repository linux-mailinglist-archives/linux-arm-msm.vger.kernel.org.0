Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED35150BA64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 16:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448804AbiDVOpB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 10:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448792AbiDVOo7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 10:44:59 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4435E5BE61
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 07:42:05 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id s18so16917490ejr.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 07:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SZH17+D0t2zqbZK25ia8E/vbcvVxSVisKGqZZiYiy3Y=;
        b=t7ZJ5sD+hosvP7Z0zkxC6igVDmEzoREgFv7c8a96t2R2Pw8ht6Wue8oi304pjUq+/4
         coZQoUceEbITGW75EcXyCOu+xuJ3bIOWIcrZI4V1XOhdI47VwIFK31XffomLWW2yfMCz
         v3RaXM50m6uQwuXZLbKYzQiC5SM85vN6JCAtkqfSmfkGA4OyuRLMrHsovn8ilkm+Cemi
         aCyfopvis1m1wy6xEmvQUMnDezCpgbydwjctt05f+tWMqjltseg3fvhv4qH/qhMUVh9x
         QCoG4aWZrMyf/wuqoDrox++vOCaiuibZQxe5HXh42bcSfxYmNDfW3+aI3VWqgZ5oAowH
         Ah+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SZH17+D0t2zqbZK25ia8E/vbcvVxSVisKGqZZiYiy3Y=;
        b=bZvydyBg3gqyRxeURX2mVazjhC/wLJcFvYgbWcDTE0IZw+fgWq1MbpIG9NS4ewZOQe
         4zL2KX8tRXZY9xzibynSuyazSpQKPxbMnx3NtPwt7hWKjYsYKuAmX2txZyOogokjsSs8
         4OZLvSuYvMs2u7o5Wg3s5wBxUH7WWLxB7O8mjibgtEB4ecgJ22VkzfdZaNSw5tqQacB+
         L04eTX+2iEIVUx2VTHFMPWPKvY3AQd6rv/jx0yCOR1TVKgxBJbJm9tPzZJzVNeN4CGjN
         qaOd4S4lucdwhWjKTNWYTdCcJDNJeQwL8q7KpUfmhkrkeahyu7Iu7Et2G2tiB+dtZ9Ui
         UmZQ==
X-Gm-Message-State: AOAM531xqR81ANup1WWQiGR0fGfc0bF+JyUoYVdf7hpDg89HwShUluw7
        Yo/I725irjI/ibS0HIDTAvGFMYhZrGxqLw==
X-Google-Smtp-Source: ABdhPJxC+/DGxC3bp9jNpc4hDYm6PO1alf3XKuInpO/MixmZwWc4vu1BI2vWMttAujRg/FJ4yLdtkQ==
X-Received: by 2002:a17:907:968f:b0:6db:a3c5:ae3e with SMTP id hd15-20020a170907968f00b006dba3c5ae3emr4637496ejc.770.1650638523597;
        Fri, 22 Apr 2022 07:42:03 -0700 (PDT)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id u6-20020a17090626c600b006e74ef7f092sm818202ejc.176.2022.04.22.07.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 07:42:03 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] interconnect: qcom: icc-rpmh: Support child NoC device probe
Date:   Fri, 22 Apr 2022 16:40:17 +0200
Message-Id: <20220422144021.232993-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220422144021.232993-1-luca.weiss@fairphone.com>
References: <20220422144021.232993-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As per e39bf2972c6e ("interconnect: icc-rpm: Support child NoC device
probe") also update the rpmh interconnect driver to support probing NoCs
that are modelled as child devices of a different NoC.

As the driver doesn't yet use the 'reg' property, no change is done for
that.

Downstream DT reference:
https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/tags/android-11.0.0_r0.56/qcom/lagoon-bus.dtsi

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/interconnect/qcom/icc-rpmh.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index 2c8e12549804..a2a8b3b9ba56 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -258,6 +258,10 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
 	data->num_nodes = num_nodes;
 	platform_set_drvdata(pdev, qp);
 
+	/* Populate child NoC devices if any */
+	if (of_get_child_count(dev->of_node) > 0)
+		return of_platform_populate(dev->of_node, NULL, NULL, dev);
+
 	return 0;
 err:
 	icc_nodes_remove(provider);
-- 
2.36.0

